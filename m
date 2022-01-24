Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8762497928
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Jan 2022 08:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241663AbiAXHMf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Jan 2022 02:12:35 -0500
Received: from mail-db8eur05on2058.outbound.protection.outlook.com ([40.107.20.58]:4833
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241623AbiAXHMe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 Jan 2022 02:12:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAzaTVqZalYMLlIIyDcRW9RhOxEpSvfZTvEQ0euofXWbjrkQZsy0K1oOPO3l6I1j3NDKiQa4beXJSP9tHiVEuz5jq5yZdXoDymB1B/Z7VqBiBoB0+ak1bZexzOeutjtyczJv09ZnPOEYFotc3yW/wJgCrBF90RqXDno+m/DyDndw4Z68SijBe7ckhe2XPkDLGA/APXXpaENw5ei7Q3/QwYseOBxDYhcThXX+kgcWQ4htX0g4hlMgAv1gEt6JGEA7JfQ9YBXksT/E7eMAWwMFb8uoQ1tBp61yP1uqQcoCy84wGJkGwFzhdUrkYzwX938w02IWufIPEHqHr9yupwSTLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCVwTYS4FYSmO34xR4hy/7IR7BP0SPhRd8IZht5+8hs=;
 b=cdaGnwpbo2uQg0uAF/v5q11Nh/4cvP8x6sQZlGQv24iYmLb7fJPAy7kgaRiJrIRYUd26EyQYZg6qKJ7TCx77rh+yQ4hagW6azA01dy7nQzcyNORQYRQCAppsCBJ/YBNv1DEfVahdJ1j4v3mfhX63WhB7gyErQaZv/QdtialXgwdNlheuAETMOwfILL2eAtBYCyeHlvqNb1kIZstzmRQ287vWqN8x2avT+xJznMcTcsjYkLk3+avFAZUUcTytns464UsXfAgnmV3diNY3BbARwKi/rBYGGdCkRIq9NO6kDW3+CZRW+gqV3nYaumSVCtg57DG04PLCdm4GxGjBu0PSHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dpnorge.onmicrosoft.com; s=selector2-dpnorge-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCVwTYS4FYSmO34xR4hy/7IR7BP0SPhRd8IZht5+8hs=;
 b=GjZMbdRw2a2UIZHPSFd79G2erje7lmBf2b6rNkY3x1/tHGtCEFsPu6N3zqw/Nt/57uf4T4bf6iUPo79DY8nDWR/jMEeWXdIyWbWZWxJDQBjQ7GvcGTL0tXHGxrjGW2Zp/VPNgyYy92ah8yz5Fvd1yzb6dmcFWfvaIWPku9SC6Nw=
Received: from HE1PR04MB3100.eurprd04.prod.outlook.com (2603:10a6:7:21::21) by
 DB8PR04MB7129.eurprd04.prod.outlook.com (2603:10a6:10:127::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.17; Mon, 24 Jan 2022 07:12:31 +0000
Received: from HE1PR04MB3100.eurprd04.prod.outlook.com
 ([fe80::4949:5038:5888:d0ff]) by HE1PR04MB3100.eurprd04.prod.outlook.com
 ([fe80::4949:5038:5888:d0ff%5]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 07:12:31 +0000
From:   Markus Mirevik <markus.mirevik@dpsolutions.se>
To:     Kent Gibson <warthog618@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Sv: GPIO level IRQ fires twice each time.
Thread-Topic: GPIO level IRQ fires twice each time.
Thread-Index: AdgOpXxQdH2ZPD1iRWSLqE0uLueYFgBRq0qAAEEMpqA=
Date:   Mon, 24 Jan 2022 07:12:31 +0000
Message-ID: <HE1PR04MB310027275C077FFA647E93CAE65E9@HE1PR04MB3100.eurprd04.prod.outlook.com>
References: <HE1PR04MB3100579720F6EBBD634C99EEE65B9@HE1PR04MB3100.eurprd04.prod.outlook.com>
 <20220122235959.GA10737@sol>
In-Reply-To: <20220122235959.GA10737@sol>
Accept-Language: en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dpsolutions.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 318adbc2-d194-42f2-5b76-08d9df08e350
x-ms-traffictypediagnostic: DB8PR04MB7129:EE_
x-microsoft-antispam-prvs: <DB8PR04MB71291CD87BBEA9AF10E91539E65E9@DB8PR04MB7129.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bwsQoc7Q97JgxPu3vNrpjSBCx0FiMKH13HsZ38IXG2LJiNLgq6F353Wes8WYM5YKbK7ASDy5ju5cHWV9Q/wVMGCpGixi0+gn4SoGnvjl3gc5cflfLELdGZ/8m308FXfq1pPT+8Ob1U+6hvyeoWkVP/jfqCEOp4sSENXGKoF+OXtYzeHfgICf1/v4G5PxZAyKSODQuFrA0eJSTJFvf6ZZ95oGRFpaFCRybhkY/q/TdePVJktDqvSIfOAZmgf4vjaHOlF7RmaL2/Oj16SinZ5GhnEF47pU9o4FvR6+iYK0IKH/NzNfnSxphWfrWxfVzZADXCr4jEY8R+fkv6lDvO6HcWxwuXgr7nJDHg5Jk8yCXbFfCQhM1M5rwgfxE0O0+DjLRr4/tToOaEuMWXPN46vjd3Jgyyx/PA33uC++n/7SWK+OBZ3eVkL/XMwnTQRioPrU8x9wfEq4GWnNYvemUBwc3ZZ/fN1e93Ds5ybeW9mok9xfc9bUQgvNksLrXAVE4nyvzF/GyWRG0dEeUGK+3to8DYFQIHh0wuvW4DhZ03Yn7YFLD2krUBRUVmzdkJCE+plw3EwypQqaySLcqD1uOZOUdkZXoulApNCkqgGyuojW268rMXrQT/GyZQLyaPPoioHGFL16TzWg25JW8lnTCI/Z4D1NbQlgyAnne/NQ21RkivX/n/P7UeEcAY5g1YKAuRTDXmFkCSREjQJVdj8aHzcbqQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR04MB3100.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(376002)(396003)(366004)(346002)(136003)(66446008)(8676002)(64756008)(44832011)(6916009)(71200400001)(33656002)(5660300002)(508600001)(38070700005)(122000001)(186003)(4326008)(26005)(52536014)(55016003)(38100700002)(9686003)(86362001)(7696005)(2906002)(66476007)(66556008)(83380400001)(66946007)(76116006)(6506007)(316002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b3WHPbE7gJVH311jwGgbTeEgx48cjffjQP3vXZrlE7UvgFu8frrZjwRIRKia?=
 =?us-ascii?Q?jcjU8+t/Z1giIRQEHg+Efjx9UM7flKpEPj5NoW83f8lQcv091WoXky9YTR4J?=
 =?us-ascii?Q?ieVz1/mPfUrPR7+AWufo3dBReEPntS9WKn5GDo4m0FCr5GRlnvMZ/PiyKNZF?=
 =?us-ascii?Q?Hko2ShI+jtEIMK+JVJAIFYsjonToXVxx+bTXbv/9nCuCG2cWVcTHlR+yMKub?=
 =?us-ascii?Q?WRciGMV2hkpZSG116r+cz8d4Z3L2t3ccZnmmi73rtkzxUdqsYC4G+wTi3pWK?=
 =?us-ascii?Q?v+ZyCm4RVX55hZNk2EwKlrOsKNcs7k70XOyXDjqnmbU+KPuarcdqhr/EMeth?=
 =?us-ascii?Q?f5hI0FJ3SrKExeHOhOWKFYJgpZfnxo9kpGo+LlE0vDDQFbkqLqsZRDbfoIVk?=
 =?us-ascii?Q?DC1p0wrFN7NZKb17Yr0c1MPeDykyuzobWckMVol8Fhz6bmrS4SGphXASP6vv?=
 =?us-ascii?Q?dXwT2jBUj9BsHAYT41G668z5BiX9xuSwDSGuR8gxg6zTUjdTZnVkZ8R90K/7?=
 =?us-ascii?Q?NzAOFJKo9ImOJf///aeMfNlJCeRjZq9ir6dhksxEU4KZu74672tYC0S+QcJX?=
 =?us-ascii?Q?TXJFQC6UNAJCu42B1YzYHkdyl3XQstegA9arQYTkjzdrRSM+BnMQbaxFtBkw?=
 =?us-ascii?Q?CSWPKgr8OPIZUbsgx9DULTPCRS68Ox9m2FzlifIfZruFrLBuDFt5C6+2Ri92?=
 =?us-ascii?Q?0r3AQx5Q0v4oubswvQZq47rqhxeEIHtj4/Eb55SzmzdZJFHXx9e+zgOA73so?=
 =?us-ascii?Q?Pu//h6ndTHDncS184MzQKmINdqzJlm4YxIkiI8INtYFqkljgEBZixlwBtYc4?=
 =?us-ascii?Q?0lYpHtzBQ6LFiT9ZhGAK/Sc9lTDYJQ/MBr7YhyslDt5EqjKBg8EkKefjiMmB?=
 =?us-ascii?Q?9pxNi86EftrzwDh3dfiS5no02LZGqcZBoPWrwcwT7yOisPCzw+giL4SEetju?=
 =?us-ascii?Q?0K4TrNN1bC3RVKe+BaOPPwrsAaDdT2twe6rvlJLVycGVrGbn3T2wbNPN8X8C?=
 =?us-ascii?Q?iR+pG+hwNIyLEeqouweEkxIa9NrYUBpZSoR3Wi+viBNDGb+v6dT2EXZlvsn9?=
 =?us-ascii?Q?WtFIkH7EdECmYYSqIZg+kuTog6bo2Cs7+gtJPwRbQaHx+k/vQU7NUXkE7oWz?=
 =?us-ascii?Q?6WuaGN2at/r/FpM6/xfYemEu3j5o1YLiddhyvphaVvk/6tLGvqo2H9zCteZy?=
 =?us-ascii?Q?3utOqsazJwE/+uWKWrEqo0Ixba74hwepevovF0fWZcHN8axoXiF3XebD1PF2?=
 =?us-ascii?Q?XgBHZdjdK6HzcHVBpX/wKVbr85yiq3v1yT3gZGjddSpU91aq3+DZU/crOt0c?=
 =?us-ascii?Q?DpJdwacZnehtYKlhR7tslJA5TwCFq9NoujoUoRMXR4M/00nQi4R7MFqmzWv2?=
 =?us-ascii?Q?Qp+YvbsLlEi5h8BP2RN6JD9lLRzL5zahnHgNJQ428CWV/gKH+czPjn9KFQ6r?=
 =?us-ascii?Q?idb5569t2J9JEFF/vuVJhyNrzIy5dt4uRK7GlBPRjLVNVd5/4tKp+ZdoExtL?=
 =?us-ascii?Q?hR3XX8c9hiEGD5f+ffntR9tmJV8yVr8zUfB+NDDtgfQZ/9x6IKtFwaA2o/2/?=
 =?us-ascii?Q?uA6p/L/7nTSazUowXPzNxvl+GdxNZ6BpxZFllK5UFFgTcY4hIS351QigDJB2?=
 =?us-ascii?Q?ho0+ESdAurrLqWyiL+4Gv6pzS+T8ei1Rg0ezYnayzJNfW/lTjizH55rx8duw?=
 =?us-ascii?Q?Y4CzSw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dpsolutions.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR04MB3100.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318adbc2-d194-42f2-5b76-08d9df08e350
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 07:12:31.3875
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3a2c5ea5-12ca-4b9d-9883-156f72a0a4ae
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bnQ2cNqSx0FfjsiToLAj8ulkCDDUlsmnVP9sLvuMNpHDvFLP5FraWJS6NEYxx0Na8oYKQaTb8Gcw16N+7hOHGDAGMYBlJUha9u1uupTiIDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7129
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> On Fri, Jan 21, 2022 at 09:03:43AM +0000, Markus Mirevik wrote:
> > I have a problem with a custom bord based on SoC am335x and a driver
> utilizing a GPIO line for interrupts.
> >
> > I have two mcp2518fd chip connected on one SPI line and everything
> works, but it's hogs a lot of CPU.
> > In the current setup only one chip is connected and it only receives pa=
ckets.
> >
> > The mcp2518fd is connected with 2 interrupt lines one "main" and one fo=
r
> rx frames.
> >
> > The problem is that for every frame received the interrupt handler is r=
un
> twice, which is kind of expensive since it's a SPI call to the chip to ch=
eck
> interrupt registers.
> >
> > To me it looks like the interrupt is fired again as soon as it's unmask=
ed.
> Either because it's queued? or maybe not cleared internally?
> > I have scoped the interrupt signal and its real good without any glitch=
es.
> >
> > I'm currently running a yocto build:
> > Linux botekcc 5.10.79-yocto-tiny #1 SMP Tue Nov 16 03:57:43 UTC 2021
> > armv7l armv7l armv7l GNU/Linux
> >
> > But the mcp251xfd driver is from net-next/master
> >
> > mcp251xfd_irq is the irqhandler for the mcp2518fd and is added like thi=
s:
> > err =3D request_threaded_irq(spi->irq, NULL, mcp251xfd_irq,
> >                                    IRQF_SHARED | IRQF_ONESHOT,
> >                                    dev_name(&spi->dev), priv);
> >
>=20
> You haven't set a IRQF_TRIGGER flag, so you are getting the "as-already-
> configured" behaviour, which on your setup is both edges?
> Try adding IRQF_TRIGGER_RISING, IRQF_TRIGGER_FALLING,
> IRQF_TRIGGER_HIGH or IRQF_TRIGGER_LOW, as appropriate to your use
> case, to your flags.
>=20
> Cheers,
> Kent.

I have tried with the IRQF_TRIGGGER_LOW flag as well. With same result. i.e=
 the interrupt is fired again as soon as the handler is ready. Even if the =
interrupt line is deactivated.=20
However if I change the trigger to edge falling the interrupt will only fir=
e once. But his will inevitably lead to a missed edge eventually.

Regards
Markus=20







