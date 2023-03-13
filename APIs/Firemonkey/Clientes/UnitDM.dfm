object dm: Tdm
  Height = 311
  Width = 366
  object RESTCliente: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    BaseURL = 'http://?'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 72
    Top = 32
  end
  object ReqClienteGet: TRESTRequest
    Client = RESTCliente
    Params = <>
    Resource = 'cliente'
    SynchronizedEvents = False
    Left = 176
    Top = 32
  end
  object ReqClientePostPut: TRESTRequest
    Client = RESTCliente
    Method = rmPOST
    Params = <>
    Resource = 'cliente'
    SynchronizedEvents = False
    Left = 176
    Top = 96
  end
  object ReqClienteDelete: TRESTRequest
    Client = RESTCliente
    Method = rmDELETE
    Params = <>
    Resource = 'cliente'
    SynchronizedEvents = False
    Left = 176
    Top = 160
  end
end
