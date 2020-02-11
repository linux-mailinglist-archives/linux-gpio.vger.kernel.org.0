Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059BB1593C1
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2020 16:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgBKPu7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Feb 2020 10:50:59 -0500
Received: from mail-eopbgr70057.outbound.protection.outlook.com ([40.107.7.57]:20459
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727838AbgBKPu6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 11 Feb 2020 10:50:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGDdcPtxf16g30YplOm05rWqa3P+RcKH5irlf9EnjJnPZHw/PFhe/GC6ipjGKYLd04swV9VmFCPRv6Zd5yz7/AdQBQjDA2VwxidMdrJxa8RMT+Gwugru5v9jp5AbzTpbXdW7CqItWv5MmIuUV6rVu3W+CKhsErRj2FFEuGlH/7e9hb5TpIInvKrmIcAO+dScAom1/nop/Ug+y9q5u5oW4cygmGannv02R9Ril9uzaG9CRaUvbMQN15hpR6N0mLhn02N8J5WgivHCJqTl8Z7p/7aMlNdKEBpf6hlbGbIF+7iRgYHecFY+gIAIPLlGAh86XGyLLCeBhnrawDIO7oTWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=526Tr9fCTrWKI5KCzToC0sONXWzISJI9Lci+Js+fXUU=;
 b=TFRwM/L4eem/mWMMUt3pdlRFX+Km8gW+6UU0WJtUZEsmTUgFh7Ehngmp3fecNdrvoTJ7FJZ74AQRwfS6oH8xWZxNJwNvR8E51g7WwG1HYOx2ITc+8llU4+38gVQlfyW7laBNKvixsKJi1b/MagtKnVisI8ZIV1OpYId48GTrZ7FlnYv6CK2b97wva7/5KaphhmjeZ0ta44Cp/db4+uLIs0FL1rz/zbCcV1Izdo0fxCiVwJjPWJJUejNGHsUR7nTOmJvXn2if3g7tYbqqiyk5tg/3cXijROQMJ3twHz4cN8gbLQS6zjpLrvjDT2P8+WTr/XK4KGtzlHxxsB+iXNFhkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=526Tr9fCTrWKI5KCzToC0sONXWzISJI9Lci+Js+fXUU=;
 b=RRQyzsMNtDtd+MIfmcMKKVMU+i9vKsMUylvdU1rn+6FexpmCK5GaUne2VC6pPeiMIa5znbX+4zqoCBdRsFDiUODFOeKa/Rq8PVWkdEEMsEgKo1u976ur8RztqxzxZyzcnMFyu3b71PqNoF7Cn+oiwwMLDbAHL6E2xzKntIvcpxQ=
Received: from DB6PR0501MB2712.eurprd05.prod.outlook.com (10.172.225.17) by
 DB6PR0501MB2502.eurprd05.prod.outlook.com (10.168.74.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 11 Feb 2020 15:50:54 +0000
Received: from DB6PR0501MB2712.eurprd05.prod.outlook.com
 ([fe80::455f:a056:2abe:6217]) by DB6PR0501MB2712.eurprd05.prod.outlook.com
 ([fe80::455f:a056:2abe:6217%11]) with mapi id 15.20.2707.030; Tue, 11 Feb
 2020 15:50:54 +0000
From:   Asmaa Mnebhi <Asmaa@mellanox.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: GPIO Interrupt question
Thread-Topic: GPIO Interrupt question
Thread-Index: AdXg8vtgt636deM1TV2ZlRcCpIdB8A==
Date:   Tue, 11 Feb 2020 15:50:54 +0000
Message-ID: <DB6PR0501MB2712A3D898BD22E55F65532FDA180@DB6PR0501MB2712.eurprd05.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Asmaa@mellanox.com; 
x-originating-ip: [216.156.69.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d346da18-167e-4fa4-f963-08d7af0a2dca
x-ms-traffictypediagnostic: DB6PR0501MB2502:
x-microsoft-antispam-prvs: <DB6PR0501MB25029794A98B8D6F8273AD39DA180@DB6PR0501MB2502.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(199004)(189003)(26005)(186003)(55016002)(9686003)(7696005)(3480700007)(478600001)(76116006)(81166006)(2906002)(8936002)(6916009)(5660300002)(81156014)(8676002)(66476007)(66556008)(64756008)(66446008)(66946007)(86362001)(52536014)(71200400001)(33656002)(316002)(6506007)(7116003)(554374003);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0501MB2502;H:DB6PR0501MB2712.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /yBr/aobkK0B1hZkbomeNqg0XnfCtZ6zZou4OCzB0TQIsr0eo7rOE0L71NSMcQLnUEciMrjPYg+214/PTX3/h2oO2x1OJiF5rY9TD7U16216bKpC+BhZgohdaV2O+qaZI5Jkcjysu+tUG6jjkyyQiwt5CNmP7AodIXxBa2G0D/gec6OGaVgQNG0zA2sLydJJcy0pgZiiqvi28LurRyVf/9X07tjcpq4IUiL/v/elQ2f4Tebk4JTTuNtwm5HmgIuED8k4CUQbiXTUYMMk0ArB5H7n0Ac86mHrbI1qqjDS9k0z71Y8vMRc39i5jgkm9z3SNV4yLkaYbSLhuNOFWTRxSGkBntlgbx2N6RuRqiTT/zbJj4nr/WgMUgyWyfLPnjNk0yLcmHMlL9HZe6L+13m2QdxVSrhdEkDX3dwb1sWlym4dYALFeocsrw/aUJ/+N8foZGRj1JfO3bBNRSFRDi+50yGVZ6etNUEaksAckP8fk1mVY68OtM+Q8NAQL+oJKB8E
x-ms-exchange-antispam-messagedata: tPHE5FJ6Uq0OZ+mFyEJFzZUAZTAOsBppib4hdN7+6WDOx+6sJBrpqPUstO4LvmylnXeSIWyreuXyCwchmOylG+caVs3vj4WRrVKDnZEiXbI9BV6HhfI3iGKH5ojiuENF+JD4lKabKefmKmsvAFNAEw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d346da18-167e-4fa4-f963-08d7af0a2dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 15:50:54.7545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/BzFGB59oWFbJp+7O/FgNYmMxODaV+2znAuxc6j1wZgGg3Ht+JPh4nrvBX0x9SsP4rIOBALAsHB8fIOvv2tLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0501MB2502
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello,

I am new to the mailing list and I have a question related to gpio interrup=
t support in linux.

In my system, I have a shared IRQ which could be indicative of a GPIO inter=
rupt among other things (I2C events for example).
The GPIO interrupt is a power down event triggered by a push button. Once l=
inux gets notice of that interrupt (via ACPI) it will interact with acpid p=
rogram to handle it accordingly.
So I would like to support that ACPI event handling in my gpio driver. I co=
uld call acpi_gpiochip_request_interrupts(gpiochip) from my probe but the i=
ssue is that I need a "first"=20
handler before actually executing the handler. That first handler would hel=
p determine if that's a GPIO interrupt.

acpi_gpiochip_request_interrupts eventually calls:
ret =3D request_threaded_irq(event->irq, NULL, event->handler, event->irqfl=
ags, "ACPI:Event", event);

So a trivial solution would be to pass my "first" handler instead of NULL h=
ere. But that would be very messy and would change too many lines of codes.

I looked at other drivers like gpio-stmpe.c which does the following from t=
he probe:

ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
                               stmpe_gpio_irq, IRQF_ONESHOT,
                               "stmpe-gpio", stmpe_gpio);
       =20
ret =3D  gpiochip_irqchip_add_nested(&stmpe_gpio->chip,
                                                 &stmpe_gpio_irq_chip,
                                                 0,
                                                 handle_simple_irq,
                                                 IRQ_TYPE_NONE);
       =20

gpiochip_set_nested_irqchip(&stmpe_gpio->chip,&stmpe_gpio_irq_chip,irq);

But I am not sure if it does what I want it to do since it does not create =
that dependency of second handler on first handler.

Your input would greatly be appreciated.

Thank you.
Asmaa Mnebhi
