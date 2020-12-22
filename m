Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2A72E08F6
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 11:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgLVKvJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 05:51:09 -0500
Received: from mail-eopbgr1310137.outbound.protection.outlook.com ([40.107.131.137]:38930
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725847AbgLVKvI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 05:51:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fd/a3LXlTlnaqIidp3gHKqm5WdzLyGLd+7wbAPIa2mkW60gHBhsbFHZaZySNKqCHNYdHeJxHtZtf1aVtyMIGcOtAyGmM7dmpZ+qN0b/sah9RzwVBPndwsSSuAxmI1HlTDNLSM5wNgV37RLzj7old2ExSHP0Wr2nM+TIRfObyfLFY85KwpfZFfTAw2EIfHPIBo0k1hkv0zXb6QHgx1819xVPmw6+Ya/3gfmgNFnBLxggiDob24eKl2dFaU4PcQzAjWGzY43kmezATyvRQwENzF+irftzJb0GZvY1XDco8vPQdrE8jJ6grdqFAScQOuI/LLX+zSLwPc6DVizs9lr/j2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gVvUfzLgZEFgBnYwOWFjr7uLs+6r8DcCY+7/+GlRBk=;
 b=ndRIjSqGRdwqFCiKLZPLGfIUzRDR4DqeBBdu1jXKJGc/zTlv5lp3fSWygMpcL3VhgqpvEny7kGhnsXpLKq2b4oAlIXUtNzDAop3NvOtW+2njzrmI28XyeZ9aDpFyzYNnC1q7WGi5hoAySTd4TuRo9qNpzcfYoaY0Zq1Aw+1vGbypKyZubedt7q0CDtNRVZhg8jYIIj+QlPJsW0QAhC0Nr8ZpnUhAcEvrOW9eNQpmU95lHNSHoo+zjyiGxI2BNoZ72tNq1n1JQK1ldrAlwkDtrwjwvKKthsuUDJr6ZnsGAphshjKcWqwsObhrJ6+0QJbnhg8XiKY9IqSXgFFlGhDxYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gVvUfzLgZEFgBnYwOWFjr7uLs+6r8DcCY+7/+GlRBk=;
 b=LuH9QpoeKJKWH1sXZ7t6f8eldilAM0S6R3xrkmH7HN7X8/vue14IPNhBItBiIQPr5KH+lpVT7kgdQwFVeWR1aCoFdN3k+DNYGd2TdZlTrnipiOjzPcmR8Vw7kPioTpJn96S4fUuVks+bLUu7xF7tmzVmhHnLOYKxsVnMrcrtZPU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4025.jpnprd01.prod.outlook.com (2603:1096:404:d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.30; Tue, 22 Dec
 2020 10:49:31 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 10:49:31 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH v4 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHW10Sk0N1z3uPelU2TClNF0Jib9KoC0R+AgAAHfyCAAAOBgIAAFQPQ
Date:   Tue, 22 Dec 2020 10:49:31 +0000
Message-ID: <TY2PR01MB3692BC2020ABED197CF63074D8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608519279-13341-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXkRUbjQk=1mqn0b7PeGX0ir=s4UwbCHfw_2mWaVEVPTg@mail.gmail.com>
 <TY2PR01MB36920B85DFCE969BF8AF229CD8DF0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <CAMuHMdU_6hWx21hTr2qguC5dKBJBKGxAiq24MN2vKOpUvghp=A@mail.gmail.com>
In-Reply-To: <CAMuHMdU_6hWx21hTr2qguC5dKBJBKGxAiq24MN2vKOpUvghp=A@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:21dc:f9ce:ff84:4ded]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4558cf2e-1ec2-42a1-0eb5-08d8a667433a
x-ms-traffictypediagnostic: TY2PR01MB4025:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4025B52B650F30E91BE8C6C0D8DF0@TY2PR01MB4025.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VoQLyJK2/sTLDO5fw6E0d2LnapEpuzeqEEMz1YWqeu69CVVE5EzKsFNt1dE7sfoKz2+3DH1T2KWj/CSCcXbi5omWXsT5LxehG/wRpu1s4kS2AuWxzSlxVOK/ueQAEODwPyMNK+mvbMUaYbTcWnunBObutEE696YGbLqKr9JcsXLpevSsizGsnnKGbA+HHLVXasOLegl6uzX1CxDBFjv/heGuQTvsaGzyjTKaqEFNPtCi7jNagI6NhmAjHu398s4XOzMPChJHhW156xWTtxaCnTZ0M6eh3Vn0mQGkJOa6AByd35qmsqUFy1IYfUInlpzm/jghh44pQk2j+yCaWK1C71LiMkwEGl2t5ZbauH4wZ9TU1GmQYYL/PkS74Fo7M7U3vNCft6zSpL6xQRAGqHMUbw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(7416002)(2906002)(71200400001)(33656002)(9686003)(186003)(8936002)(316002)(478600001)(6916009)(66446008)(7696005)(4326008)(54906003)(52536014)(66476007)(76116006)(66946007)(8676002)(6506007)(5660300002)(86362001)(4744005)(55016002)(66556008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?V2p4YmdYOGl5UWNqMjEwTFRRSUszNDh3UjJabS9Sb3E1TmVOb29SUDExYkJJ?=
 =?utf-8?B?OWVtSVJLczVNNlpVYTFtRU5UdHkrTGJib1E2bkt0dk5kVUFEanFmVjlCYldX?=
 =?utf-8?B?aVkwaTlJQTVSRHgwRjlkSDFkcC9HVVlKU2JBQnFaTUFka3BDZ0Q0WU5GQms2?=
 =?utf-8?B?K21VUng2WkhleUZOYXkwdTJhZjJwL0JOSjVWUG1YaTc4czhDbm1wMWM2Vjlv?=
 =?utf-8?B?VVg5cmpRRXZXYlVmSHYxeWpFSW1LeW5IS1dyTzlrQjBGanpETHc3LzZKcWkr?=
 =?utf-8?B?TGYvbXhOOHFHelNmUnVneGVDMSszZ1lvaDFxamg1L2FyNndzZ3VVbHdXMUtn?=
 =?utf-8?B?ZHRvSHhnVmJnQ0xJMm9DOFA4WW81eUNnRHh0dExIU1BiSER4TVJHeDRFQUJX?=
 =?utf-8?B?TjNQWlYzUkVzQnBSN3hWTmZSb09ZZFBLWFZoRytqUDJGUlJEMUM0TktKYlBo?=
 =?utf-8?B?K1JXZVRiVVM2cTUzMXV3VmhrTVVwVEcrVkdJcEpvUng5d2loN3U1N2JFeWZr?=
 =?utf-8?B?SFBwMjdWS0tQbTlDWkRCVUIxeU1vWHhRYitWYnpDMUtxeHVxa1BxNkpiNUFI?=
 =?utf-8?B?MWl6dmdsNmR0MkhlTkJJYWRoNTVrVTNFU01rWWI5R01aVUVuM0ZiTnBVYXdB?=
 =?utf-8?B?QktuQUxGK0NkRksvQXRuMVUxUm5GMW1yL1prOHlDRnNGZVRYMUc2K20wckN3?=
 =?utf-8?B?Ym1rbFlrWWN1TlQ1STZscXQwMGVSblZqWlFzNStsU2xrakJXWWI5bm1JVGcz?=
 =?utf-8?B?L0xnZm1zb2xNWVpTR2JyQkJST0xyMUt0bm43cmNzOTlKTFdqMHFPMzRYMlow?=
 =?utf-8?B?cUU1cEpiM1laYWhLcUdRSEFZUitwcHZUU2JVcHV2U1doMTRrc2JWRUVQaUN3?=
 =?utf-8?B?K2pQMFdwMEYvMVkyQklOdkxvUWFubjZtdktjalUzejN6TWdEYjJxKzBQNExw?=
 =?utf-8?B?eTdzSzVrTlJmdTZMdWhUcm9tbkJ4QzUrZ1dBd0JMbEc4ZHRqVUhDNnNVT28w?=
 =?utf-8?B?YTdaOGU3Z3NkMW5JN3B1T3NsNVVNRTVVbm1ma3l6c3NsMEVvQ0dhK0dqN29u?=
 =?utf-8?B?UEYrK0JTZzNEdWVhUHlZUXc4OWwzcXJlazdab3NrczRQT2Y3U1BMWHBsSWxE?=
 =?utf-8?B?Z3IrdUxlOXhkNzBhajUzSTFIWXV0aFZIbzZhSUw0R2Ivd0xIMGtoRjdBMldW?=
 =?utf-8?B?ajJGejBwaXJINnJBSDIzaGpIUnI2cld5bkZHOTZTRUhXbjNiOWdlYjhMMHV4?=
 =?utf-8?B?Y0JqMmx0SFArS1huVGJpdmFwd09VcHZNdnVUS0tveWdOQ0J4MmdNTllLZDRR?=
 =?utf-8?B?REZaVWV4YlJTcXF0VFdacEZuaEsvVnRQODE3THZjdFE4YXNjemR0MDdxWG9C?=
 =?utf-8?Q?mUWtWO5/QIf36rjq9vMbjOC6hrcakaZU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4558cf2e-1ec2-42a1-0eb5-08d8a667433a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 10:49:31.1606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P36fGYw+6c1xniOouqAMm5ulz1Wl6zL0itFODDABRb3OukJeDJ3kZ0pShUKWxeJmsx2G3cbuywiBF4FDdBrvtbPc6dIloQTp95xABdQt2Wwj/34p4HMD4pSe39aAOWyc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4025
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQtc2FuLA0KDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiwgU2VudDogVHVlc2Rh
eSwgRGVjZW1iZXIgMjIsIDIwMjAgNjozMiBQTQ0KPHNuaXA+DQo+ID4gQWxzbywgSSB0aGluayBJ
IHNob3VsZCByZW1vdmUgdGhlIGZvbGxvd2luZyBwYXRjaC4NCj4gPg0KPiA+IFtQQVRDSCB2NCAw
OC8xMl0gZ3BpbzogYmQ5NTcxbXd2OiBBZGQgQkQ5NTc0TVdGIHN1cHBvcnQNCj4gDQo+IFlvdSBt
ZWFuIHJlbW92aW5nIHRoZSBjaGlwIHR5cGVzIGZyb20gYmQ5NTcxbXd2X2dwaW9faWRfdGFibGVb
XT8NCj4gWW91IHN0aWxsIG5lZWQgdGhlICJiZDk1NzRtd2YtZ3BpbyIgZW50cnksIGRvbid0IHlv
dT8NCg0KWW91J3JlIGNvcnJlY3QuIFRoZSBNRkQgZHJpdmVyIHVzZXMgImJkOTU3NG13Zi1ncGlv
Ii4gQW5kLA0KImJkOTU3NG13Zi1ncGlvIiB3aXRoIDAgaXMgbm90IGdvb2QuIFNvLCBJJ2xsIGtl
ZXAgdGhpcyBwYXRjaC4NClRoYW5rIHlvdSBmb3IgdGhlIHBvaW50IGl0IG91dC4NCg0KQmVzdCBy
ZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0K
