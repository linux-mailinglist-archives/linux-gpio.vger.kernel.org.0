Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36993397E47
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jun 2021 03:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbhFBB56 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 21:57:58 -0400
Received: from mail-am6eur05on2061.outbound.protection.outlook.com ([40.107.22.61]:13136
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229590AbhFBB55 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 1 Jun 2021 21:57:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XTb0TfNtclekCKoFhSO6qId5KnAumSFQW7tETTF3T/cwXMrOWPSK5jwFu3Qq6JqUeA77hYlrD3FW9Ge+g9G0x8qpujv/Yoo+y8w2LvY60nPHelxzJMMQqvm0axoVHg/xK3p2wjfagR20aYu9Tj6GCxT0pjDFmk4e9Wplck1lcTHtGoPODwXxKMgKpLV3iferLU71br8qphOYCajfcB1iu2oYngjhCXASE1gQh57eE2MvaSPMr3GSE7e0faVSMLULsgJOjLn94LTG9IFFLyiDzp0MSlRsCi3NlSmZuNrWgQDWziCAoiC7VH6vmubMv2co91nYAsxbuGkC9AsidBWQow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNcalGZJ2JG06+FIwl4/VPsykpqTKxm27yOvVdbduIY=;
 b=UUCsyAhHF93ghB7xg6jIRo0aWnrmpMNfkBTckv7nJ9PaBXi+HW+A2EwjKzOaGh+QJMu9S0nlnIPw0yodysBQ68AjfZP3l90SGVMl978ztogDOqKl3w75xbfVjf2ATfIqRpjYY+ogfIRTGquADZljEbH9xtGdwhreiuyFYBrHEgYuEEBI9j7OG2XmB2Avu58Thad+ugCwPI9Reqjf9TLP7bhCtDbc5qr07yIfB8JFxK7POeriyfuYaXM02rycOB1hQElmJhd0AYcKtkcdIAgWIHUI2ag6Fs/Xr7oBopT35mIc5F6GSJswtksC0IxEMImumrmlcoOIdEmEby3bVNMsdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNcalGZJ2JG06+FIwl4/VPsykpqTKxm27yOvVdbduIY=;
 b=SQ1TAVsyPILY6g8x4g3ACSAkVpnKKqtb13/DdgnmI5nu5g6MhImK7RbNI8S5j/UcxC88q8d4Mkso95o7M5QqDLpjR6pVJYmzk9r/hegnTilivDq7YMxfo4K67hc2WBYspYUWtlK+9vJRIM3/CtnIZK+p0CY3Hj4jFOFxKAf3KDo=
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 2 Jun
 2021 01:56:13 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::3921:acd6:3201:b209%4]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 01:56:12 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
Thread-Index: AQHXVq0/fsSzFtTwaUeh5eBKs1lQcqr/L76AgADHoFA=
Date:   Wed, 2 Jun 2021 01:56:12 +0000
Message-ID: <DBBPR04MB79306783421D1D57A1D5F511873D9@DBBPR04MB7930.eurprd04.prod.outlook.com>
References: <20210601062338.1969040-1-ping.bai@nxp.com>
 <CAOMZO5CqznayWX6i+241=wvKzTJQvjzeTQD_NS=5OM_+iUvmwQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CqznayWX6i+241=wvKzTJQvjzeTQD_NS=5OM_+iUvmwQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd64adf0-bbf7-48a3-5bc2-08d9256999ab
x-ms-traffictypediagnostic: DB7PR04MB4763:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB476382598041D5695858FD21873D9@DB7PR04MB4763.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1nG87c4RZqeyn13Xrk62JlAR6xswK8OqlkvkV9Md4OZtMTFbaEkpNMJ5oW7OOYR1cFoANw7NEX3Pi2zzNgfft6IRpDUVRKqR8pIv58fu4imHP1lkA3b7lsPd2lcjug07lWj9v5NeijSrCbF5OSaE7bna6qrGd9ylSO4NBkPOFJGGyeJ4tXcNmqkP1aVm8u1Lawc+aKyASs5CJPN8Mgd4vyTcznDSRgRR1MgJW//1Y50C4iTYYkF5SNaGhYWgDmgS1+UbNibHJBdW8vNm2+qGljUf6Tkts3XHLQv4ohig2L69DZPURc3y77tLs8epTqKgsBPCxcFUd3MAjBt7SKnOtlfTFV1zDC1NYjlwjP4W8huZpGhe4b+Gd5Iva3nWx+z7zKC12g//+d1BAhNkfvGUb9EMqBxCU5xGMXleOBIokRqalHpRND/StsA+udLqOmdzGm2FG8uKMwuDgiCyvBs7+IyyxeWcYjB94bi/SbszAHaY87COMjTvoEf90ETc/NFIaQ9Rs+9FT+lAB3fYrHJHI0KRXDBwnkn27xfVzbvfDPz/O2ar4yW6LHTN9QzYRVUJt8qb8QbqpbPqzmNazhRSKsbR+zVA2hqxz4vtStiKo00ilKi/f9omwl2IOz6Q2wzH5KN2UkvbS1FxnbVlHvPzew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(4326008)(122000001)(83380400001)(38100700002)(478600001)(8936002)(9686003)(2906002)(86362001)(7696005)(6506007)(71200400001)(26005)(53546011)(186003)(76116006)(5660300002)(4744005)(52536014)(316002)(54906003)(64756008)(66446008)(66476007)(33656002)(55016002)(8676002)(66946007)(66556008)(6916009)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?MXc1WGduWWFHWmJMZGwxTml6Mjl1Q0xMRFY5QlI0WGF0YUtraUdrKzU4OTR2?=
 =?utf-8?B?NlZlMmQ3WDBuZkFnbHo3WW1uaUs5MVBlcWxUL1YwdE5sNW85N0NueWdkQjFY?=
 =?utf-8?B?Y08zYmJGeHdsUWw4b3FJcXBYZVh3UDJkR0pZajZzVjVIQjBhU3ViK0p1M2w3?=
 =?utf-8?B?b2QvWVhJRVUrQkJxeitIaUJmT0xtL3pWL0hDWW5Ja0QrNUx6V21iMlloYkll?=
 =?utf-8?B?azF1U0hlY05RUzZVY0pGVWxCVGFhdVI1WkZjc1lkODBVVDczWTgzR3FyMUhk?=
 =?utf-8?B?MURDNU44UGpmUlZxeS80bE04S3NNcHZFTWZuSkNFQlNwc29kM1VjdG1ORUpy?=
 =?utf-8?B?aVZnZitnOVlRUndlM0lTY2pSK3FaYU9tY3pnV3RlazN3ODY0Z1BjaHZzRzBZ?=
 =?utf-8?B?cDQ1T2FYMkJsVnhYR3F0NTJGZnBqZUd1UjN6aGVtbjczenlldG1wVzZpZ1FD?=
 =?utf-8?B?bW1LRDRMUFF1QU9Wb2lPVGptUEowZEZXb0x3OEhzblZxVEZEYTU5N0FoVVNu?=
 =?utf-8?B?T1lIT2J1OEh2T1VKeFV5djI4RGJTcEFsL3MzLzdkSmx0VUtFKzZVS1ppb1NL?=
 =?utf-8?B?bFprdThzMzZvN3JaVVp3ZUFTSGs5Z0p5aTdFSmt6UWJROWtiZUlCbkJVMGx2?=
 =?utf-8?B?QTYxVGNUSXB2M2s5Rk11RmNCb3BLdFcrMTYvSjVxTWtQOGFoWEVkOVlwOHlK?=
 =?utf-8?B?RUpUTUIvVjF4Qm9vZmVmc1B3Y3VYaXJUalpzUlJNMytKc01aNDQyd2krT2Ex?=
 =?utf-8?B?VUY3ZTB1eWRhMHh0Z0pLMVVqRTdSZ1IrM2pQYk5DZndZallhQTVhcmxzelZD?=
 =?utf-8?B?NkVYZGMwb2luL20rSFBQYVA1eFpyb203VEpnaENqSjNDYXV1bjNDYk1CUWFs?=
 =?utf-8?B?N0xPd3FDVTd4Z1RraUEveVd3eDhkM3BJUlpPTUJONjRzOGx5bTNKb2pMUnVB?=
 =?utf-8?B?VWFNVkV1Mk5PS0FXNHI4V1ZWbnk1MXpRWXcwVFhVZ1A3eVh6RStCTnM1YUgr?=
 =?utf-8?B?ZG5McFY1VDhzZjljT3hMNG5FcTk1RmFGNzVtbStqUS9sQ3UwUEw2b1UxcVJE?=
 =?utf-8?B?Tm5Gd215eWpVUHluWXcxdFZnSDVnRHh0WmRteStudWZjSkNnTjM5R2tBUzMw?=
 =?utf-8?B?NXEvY2taNzg2Zkx1ZkFtMkFzRUlyUWdIaDd6eXhuWU9xcU9MMTVzZUVZWWFM?=
 =?utf-8?B?Mis1S2k4SkRCUWhsSUZJQVFjZTJZNjlPc1dVeGo5dTJHYWZEaTNITDhVL09k?=
 =?utf-8?B?VGFjY1JDbXQxa3MzZ2l3ZFh3anB4SFBnZzhhSTByZGFnbUlxSUg2dVRnTHFx?=
 =?utf-8?B?dWZRd1QvTVplQnJyZ2VTZno4TVNJVjZ0SUJOU2dleUFZUXRUTERaZzlRMTN3?=
 =?utf-8?B?Nm53NFNHZ0ZMeUVLQTdoY1hNQWdsaWlJaU9HWEhVS2g4eldyV3Npakh5NVVP?=
 =?utf-8?B?NjNmV1dFZ2IvSUppSUg5aFNMRm1zUlF5bjBCYVdERWtkTGhzWDNSSEpnNFN4?=
 =?utf-8?B?ZXNrWENXTk1rc0wrT2lHY0tSYmFEYmtaUXBPamc0VTgyZ0xvWlBkdm1zMklm?=
 =?utf-8?B?QkUxYkJkd3VXNUJRSVBEa2JRZzg4L2MweE1HaWdSMFI2d3VUK0RMaEFGcTJD?=
 =?utf-8?B?U1QyU3VzRU11OTdJWFpjVWxxUHlyOUd1d3lybzdSbEdZeUtHVzFiVGw3SEt5?=
 =?utf-8?B?dFZiZTFtYXlPOEFZL005UzFWWWp3RVVmNkFxMkNOODkrN1FaOWpOT3hmSG9k?=
 =?utf-8?Q?j1H2oXwc/PpgzqJfHrkbjDXtFWCp3iZMNs1Ghf+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd64adf0-bbf7-48a3-5bc2-08d9256999ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 01:56:12.8080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+oGZZyWML4QnjNmKHdrf7QOVgFNjtQiFKkj797R+/5hRO8piyLsrlr0AiIq2ooyxf3roVHv+AHwkm3t/5sQfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZHQtYmluZGluZ3M6IHBpbmN0cmw6IGlteDh1bHA6
IEFkZCBwaW5jdHJsIGJpbmRpbmcNCj4gDQo+IEhpIEphY2t5LA0KPiANCj4gT24gVHVlLCBKdW4g
MSwgMjAyMSBhdCAzOjEzIEFNIEphY2t5IEJhaSA8cGluZy5iYWlAbnhwLmNvbT4gd3JvdGU6DQo+
IA0KPiA+ICsgICAgICAgIHBpbmN0cmxfbHB1YXJ0NTogbHB1YXJ0NWdycCB7DQo+ID4gKyAgICAg
ICAgICAgIGZzbCxwaW5zID0NCj4gPiArICAgICAgICAgICAgICAgIDwweDAxMzggMHgwOEYwIDB4
NCAweDMgMHgzPiwNCj4gPiArICAgICAgICAgICAgICAgIDwweDAxM0MgMHgwOEVDIDB4NCAweDMg
MHgzPjsNCj4gDQo+IFRoaXMgaXMgaGFyZCB0byByZWFkLiBDYW4ndCB3ZSB1c2UgdGhlIHBpbmN0
cmwgZGVmaW5lcyBoZXJlIGluc3RlYWQ/DQoNClN1cmUsIEkgd2lsbCB1cGRhdGUgaW4gdjIuDQoN
CkJSDQpKYWNreSBCYWkNCg==
