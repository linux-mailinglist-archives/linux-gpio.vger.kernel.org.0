Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B198454B1D3
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 15:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242345AbiFNNA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 09:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbiFNNAz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 09:00:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104D333A35;
        Tue, 14 Jun 2022 06:00:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6oIFFMTmlBfHPYcuMzsLGfsCfgtAmxVJB3Lm/4qO4nG7G9X/o2Oq9r2LYOLEGo/dH9Ee26lzsCa2tdPY637pN0rg6lataVMp1kmBTW9F+ykhp38hWH7VYY9tmMCG1QsPPCg4KofF6wXgiHMf2OLX4R1bdHT3VTslFWU+6IPLBBJIbUZIuVsqxXW9J3toX0k0/P5a4kzLn45j+06Hwn4XAGLF9OOciMy5PLcocx2vRniRerx2444hWaImLewvFca8hGLFU5G+4+I4BPyBWLYINtYWVtwU8egXFvmitCeZIK/Hk+36uOEf1+nXzKJO7DMNecnmxsYcQ/ldmPpaU2ijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y31rKPdfSi44ZzHQ2vtHXNwOus4ukFe9i0N94xsSXVE=;
 b=DZyXWULObozB2m5vGA39uHl8Wjw3vv+tUEZyhMSrThQmXpnTxvuG5GeSfHoSW3zkba9JGRMBFyiPFjxFpvF2uwlk3YDm/Ko9HCcoT7q/5f0YN2aQPy17HYXY1ds5WahxHeeGFeAvvqxxRH8GeITFhXVLdRKMPu4E+lKaB+EdUfWwZm7SrdHFeNd9BG+wdYhTnxAktIP0TsWIvWWkbHgsjOaoGLyDt6obA4fl2S87nR5kevXfLYW57er97snScoRqMMKzy/OVHOzBXb22X0gAlCL/166kBzYmPn31PbVijr5sZ2sWxH+G7ZX/xWWm5Yup/pY9Dm227FpqYNEls6+WJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y31rKPdfSi44ZzHQ2vtHXNwOus4ukFe9i0N94xsSXVE=;
 b=bL+ZH43HvpP/AhVXhNgMxDoahJA9WiIxAlPFGzwK9oPmz63a0N0DDQ+OGAvLqkgvaQOHmQMg5bqFtHXq2N9oQwiocycZCTc3bH+GgEoOCYRB+oMXjPsRjebCrq1Qzc8Enj4znuqScpWrfewf4JC4wYcTSARA2CMpt9POJfo+/zI=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TY2PR01MB4620.jpnprd01.prod.outlook.com (2603:1096:404:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 13:00:50 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 13:00:50 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
Thread-Topic: [PATCH 1/2] dt-bindings: pinctrl: renesas: Add DT bindings for
 RZ/V2M pinctrl
Thread-Index: AQHYbGAJuUt0o0UhwkGKZGmmj+mQHK1O9rEAgAAESvA=
Date:   Tue, 14 Jun 2022 13:00:50 +0000
Message-ID: <TYYPR01MB70865B5F1C4F918F3125CFB8F5AA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220520154051.29088-1-phil.edworthy@renesas.com>
 <20220520154051.29088-2-phil.edworthy@renesas.com>
 <CAMuHMdVyoCG7PNtk9b32JAnzq4R+EeLCxM-8owuphhD=KFS=Ow@mail.gmail.com>
In-Reply-To: <CAMuHMdVyoCG7PNtk9b32JAnzq4R+EeLCxM-8owuphhD=KFS=Ow@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19e8495f-63f4-4a90-3a9e-08da4e05e811
x-ms-traffictypediagnostic: TY2PR01MB4620:EE_
x-microsoft-antispam-prvs: <TY2PR01MB4620373511477612976A306FF5AA9@TY2PR01MB4620.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z6lEviFBVHlJiQQnJiD+mtY+fUxQsTkHscCMPv8+GaeiZcMX8P4KkldRn+pKypP0u82ZIUrZHDHVSX1+q8pJ74fZJBIPlCFJo5XnuQPZUVGoeMiXFyjtqeoTHsB/7yOqCjh57soROFnHO4Sg8PC7wkRiBjp5uz2yc6eUYr3vEtXOwXolhmtz46cBdsmeC4kYeNJIDxk35Fd80yA0LLY3+7IQpz8Mmvag14deDvz3KDI9MJ0h/Rdr4QMZ9gBmn5NaUbY7ot3bpyjM2yE4yDZqqmHvQ1JxzqN7BpwpEKSLZI8tPv5j1jzN56a2RVM1yDoSqyqXaM38mQB8UtaI1TkdghHv2BuawVn9cz995kK4SPadRtUoa81C5INNa7Tov41+HvfcipkhEdFq050KEbvAf4IBLE3lW2VQ/sMl5z84L8DtIhZGwnTmRQ5bMHs8rbSD+vaAWDEi/eiG/mHluLce5Yt7AkgR8bD71hTpnTp6vZIwf9AwpyRPVqaS3epx4O12R6byYwNYn2qd4dMwjwkivWrR/zXqpLaWoKgHa8TwUmdU1wgRTXxWnJ07Xxii2DEaQPx+kuOu2Z0uAhDRjp93hdN62jpxL4sRagPGLk2mSliw3yVEXGSa6XH5RWJ1wkeDGbHXJ+VdKOONpIIywP8WmnHgPlcBO+FR3wJwyyXhy9P2YJD9Tsi+UffXzND5r58X50E5zqpnnGI0zB9jl6ZWcQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(508600001)(38070700005)(8936002)(33656002)(54906003)(71200400001)(52536014)(186003)(6916009)(86362001)(6506007)(7696005)(122000001)(2906002)(316002)(9686003)(66946007)(26005)(53546011)(55236004)(55016003)(4326008)(5660300002)(66476007)(8676002)(38100700002)(66446008)(66556008)(64756008)(76116006)(44832011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVNqRFlPZmlrVmdDVGRreHVRS0w0ckdlb2R0N0twM1RFN3VSY3ViSUdsWGVU?=
 =?utf-8?B?ZnVjanVuL25MSStHcTFudTR2OElvUFJVbjV6ZWl1RjVEZWNYMTA4S3lFbW9M?=
 =?utf-8?B?WGZFbW94TjBWUFhXMnhJK243M2ZnblJhUWdzZ2ZpWjhJOFYxSHlWWGdPNFhm?=
 =?utf-8?B?QUtaMDk5emJ1aTUvSHF4TDgvTEh6ekNDZTNXUitqTjFUN0VuRmZvbytaNk1x?=
 =?utf-8?B?K0JZSnVjaHdIUEVXb1piUUVsdG9vQndjS1c5Z095anBta2lKSnV6Ti9YdG05?=
 =?utf-8?B?aVJVOWpPNnJlbDJUTmRJcE05bFQrb2FMTU5wS1dLT2FRMklydzBMZ3VPRjkr?=
 =?utf-8?B?OFVFN0Nsb0JMaDlKd3M2aGEwWGRCTVFjWlpCV1VuKzViRGcxS20wQVZrRkQv?=
 =?utf-8?B?cnQ4YjByL3Q1VDlJOWRrY0xjRktoZ0lYL2NFRlNMWnVxN3o0V24vOXlSV3F3?=
 =?utf-8?B?OXhIQlBGWU5Oa1lNVVIydEEwRXZnK0phSzF2empXV2RHbkRZWXRmYS9oeERv?=
 =?utf-8?B?eVZBNHRiQy9iQzV4NmlkMnhWRitNUGJhcStNZVorNm1hakZUMXNTM0pWV3JW?=
 =?utf-8?B?S3d2VitYR0dhSk1qcUxvVXp0OGMwcDVwMWVpVzkrbVY1R29UdmUwam5iQjBH?=
 =?utf-8?B?VHNqTDl1a1F4Z1lVZ0F6c0QyazA0WC9WV2NFYjB5Wk5pQXg1bTVyVE0zUE5C?=
 =?utf-8?B?by9aanp6YWtHQ1RONVd4VEl3ZU5PRUhqTVlLeXlUZENtUnd1Y2pKVEM1K2gx?=
 =?utf-8?B?b2tJbFpudTUxNlE4V1ZWYUtZRnFpT1NxSmllNWN3cHdsSG1aYzZFK2o3Tk91?=
 =?utf-8?B?YzdZUWtkL0lubjA1TXoxN3ExbUZwT2NHTEpUZkd5Y0VMM2thb0xrVDlySVUx?=
 =?utf-8?B?SlFjaVNGNmN5djFoR0pLREJ2d2hWM24vRUF3SkVNd1cyTFdKamowTmU0MkJJ?=
 =?utf-8?B?Z3loNVRwVGY1TndZRHE1T09PdmRDeFJEaW1HMFllZWRNZi9rcEFuR1BsVDdR?=
 =?utf-8?B?U1ROM2pjOWdtNlJ2bmtFNXN4Vzh3VlBIVXBnWWFJc3pVdC9aT0pPczd4NC9y?=
 =?utf-8?B?dElYK1pxMDhCVlp1UjBxZHhtTU95Z3o2V2w3NTdjZFZqZTh5UWE2N2FOVHJj?=
 =?utf-8?B?RFl2QXR0akRUZ1ZpdUpUMVdyVjFUemh3Sk1KWHYrbUFlZUZQZnVDaVliRi9p?=
 =?utf-8?B?cTYrVlQrc2VJUmRuSURpR3U4bmhGTXZSZ2NCLzhTMjg4OXJZcERDczgvZUV6?=
 =?utf-8?B?MEZkSS9MZ1EwWnExUGUvWnp1OFZzSWpUbWJNWnFqZVBmN2dVWFVHY2owUlNr?=
 =?utf-8?B?NjQzOGNJTEViRk9nTWJZRW92eDZvT1ZhMEtBWDdOa2FMSG9tZlAyL2hkTFJs?=
 =?utf-8?B?MUFOc3EwVzRYa3ExcUV3S011RndHWFpOMGszNERvNmIrK0U5TkR1MVQveG4y?=
 =?utf-8?B?UWRwNGl4N1NEOEdRR3VZOVE3NGdkOGM1NWtsVm5YY2pGajB3NzJWdGwxc3h2?=
 =?utf-8?B?bzNwUWd3bDg1UEpabldsVHRxdFYxMjc1TW9PQURmSGZGU3c3YlhRRHNMZDJi?=
 =?utf-8?B?VjNhTzJVeWNDSDNXQ0VjdW9waTlZajVjSVFzaVR1MUtoT3U0SHZyOG1RbjhY?=
 =?utf-8?B?R3JEZnhQdEFXNVYwMysyOHhPQzNUZkJXL3B5Zk5wbFRaS3lKSjlDeVArTjVE?=
 =?utf-8?B?S3RSeGRZSkhzVzUweTRmMFRXY2FlckRpbXZrOC91Rjc2UFVqajB0VnJkSWNr?=
 =?utf-8?B?bC9TZFV4QllKSk04YVdMK3RZZFVjam5XK2srL0V0My85cXdjZ1V2VjU0UVNV?=
 =?utf-8?B?SkIzMUR0SXNuOUpCS1R4ZmJzUmd3Yk8yaFhDUjYvajc4eitjeitEWHliQVMy?=
 =?utf-8?B?cDFPSVlKd2g1ZDQ5VDEwZk0reWExVkowQjV5TW9HRlRPSW1LWUxVZWRLVGha?=
 =?utf-8?B?dDBEcllEQXN4Yi9CZzJKdzIyTnRwY283enVXbURzZS9JcUFLYzh3b1RKdHNt?=
 =?utf-8?B?MzROZ21kRmFzRmpTSGdmcSthVndiWU9JemQ0eGJSZk5FeHdySHpMNExtYlNa?=
 =?utf-8?B?d0hyb2RJN0U5bDh5Qi9zZVhFblMycCtXUUltN1h3NE1SMkt3UHpESFVVeTFs?=
 =?utf-8?B?bkovYUtNRStvMXFGRndhUlBpZ1h5T0pNbmlUYXdadllHSFhKNTI2TjkwNFJN?=
 =?utf-8?B?MUNDM1JRdFZFNlVwcFlHVlBuWTFEcXBCdXhiSDY1dzAzZTJMS0VUbFVlSFYz?=
 =?utf-8?B?SStBNU5ITzZQYmJnYUtYSTdTRkdobGljekZrdEhzT1ozcnpWTEk3ZzVtZUxB?=
 =?utf-8?B?Uk1DWjFSNkVXc1JhR2JGNml3OXJmSURQU1daekFrUU5NTFlwUE96QThwUE5U?=
 =?utf-8?Q?3eGGv0jVBwzRHfP8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e8495f-63f4-4a90-3a9e-08da4e05e811
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 13:00:50.0968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r0vJTfC6gxBfa037/nQDaB/4pIgRcxg7AmthFDnkGs1qX2QkTCXANNiSY2pq60fIgcpfj4yHekRMUN5XIhpKyEsgSbvo92mEmxob2IedG1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4620
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXchDQoNCk9uIDE0IEp1bmUgMjAyMiAx
MzoxMCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+IE9uIEZyaSwgTWF5IDIwLCAyMDIyIGF0
IDU6NDEgUE0gUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4gPiBBZGQgZGV2aWNlIHRyZWUgYmluZGlu
ZyBkb2N1bWVudGF0aW9uIGFuZCBoZWFkZXIgZmlsZSBmb3IgUmVuZXNhcw0KPiA+IFJaL1YyTSBw
aW5jdHJsLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdv
cnRoeUByZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQ0KPiANCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmVuZXNhcyxyenYybS0NCj4gcGluY3RybC55YW1s
DQo+ID4gQEAgLTAsMCArMSwxNzQgQEANCj4gDQo+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOg0K
PiA+ICsgIGFueU9mOg0KPiA+ICsgICAgLSB0eXBlOiBvYmplY3QNCj4gPiArICAgICAgYWxsT2Y6
DQo+ID4gKyAgICAgICAgLSAkcmVmOiBwaW5jZmctbm9kZS55YW1sIw0KPiA+ICsgICAgICAgIC0g
JHJlZjogcGlubXV4LW5vZGUueWFtbCMNCj4gPiArDQo+ID4gKyAgICAgIGRlc2NyaXB0aW9uOg0K
PiA+ICsgICAgICAgIFBpbiBjb250cm9sbGVyIGNsaWVudCBkZXZpY2VzIHVzZSBwaW4gY29uZmln
dXJhdGlvbiBzdWJub2Rlcw0KPiAoY2hpbGRyZW4NCj4gPiArICAgICAgICBhbmQgZ3JhbmRjaGls
ZHJlbikgZm9yIGRlc2lyZWQgcGluIGNvbmZpZ3VyYXRpb24uDQo+ID4gKyAgICAgICAgQ2xpZW50
IGRldmljZSBzdWJub2RlcyB1c2UgYmVsb3cgc3RhbmRhcmQgcHJvcGVydGllcy4NCj4gPiArDQo+
ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgcGhhbmRsZTogdHJ1ZQ0KPiA+ICsg
ICAgICAgIHBpbm11eDoNCj4gPiArICAgICAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICsgICAgICAg
ICAgICBWYWx1ZXMgYXJlIGNvbnN0cnVjdGVkIGZyb20gR1BJTyBwb3J0IG51bWJlciwgcGluIG51
bWJlciwNCj4gYW5kDQo+ID4gKyAgICAgICAgICAgIGFsdGVybmF0ZSBmdW5jdGlvbiBjb25maWd1
cmF0aW9uIG51bWJlciB1c2luZyB0aGUNCj4gUlpWMk1fUE9SVF9QSU5NVVgoKQ0KPiA+ICsgICAg
ICAgICAgICBoZWxwZXIgbWFjcm8gaW4gPGR0LWJpbmRpbmdzL3BpbmN0cmwvcnp2Mm0tcGluY3Ry
bC5oPi4NCj4gPiArICAgICAgICBwaW5zOiB0cnVlDQo+ID4gKyAgICAgICAgYmlhcy1kaXNhYmxl
OiB0cnVlDQo+ID4gKyAgICAgICAgYmlhcy1wdWxsLWRvd246IHRydWUNCj4gPiArICAgICAgICBi
aWFzLXB1bGwtdXA6IHRydWUNCj4gPiArICAgICAgICBkcml2ZS1zdHJlbmd0aC1taWNyb2FtcDoN
Cj4gPiArICAgICAgICAgICMgU3VwZXJzZXQgb2Ygc3VwcG9ydGVkIHZhbHVlcw0KPiA+ICsgICAg
ICAgICAgZW51bTogWyAxNjAwLCAxODAwLCAyMDAwLCAzMjAwLCAzODAwLCA0MDAwLCA2NDAwLCA3
ODAwLCA4MDAwLA0KPiA+ICsgICAgICAgICAgICAgICAgICA5MDAwLCA5NjAwLCAxMTAwMCwgMTIw
MDAsIDEzMDAwLCAxODAwMCBdDQo+ID4gKw0KPiA+ICsgICAgICAgIHBvd2VyLXNvdXJjZToNCj4g
PiArICAgICAgICAgIGRlc2NyaXB0aW9uOiBJL08gdm9sdGFnZSBpbiBtaWxsaXZvbHQuDQo+ID4g
KyAgICAgICAgICBlbnVtOiBbIDE4MDAsIDMzMDAgXQ0KPiANCj4gSXMgcG93ZXItc291cmNlIGFj
dHVhbGx5IHN1cHBvcnRlZD8NCj4gV2hpbGUgdGhlIGRvY3VtZW50YXRpb24gc2hvd3MgdGhlcmUg
YXJlIHNvbWUgMS44LzMuM1YgcGluIGdyb3VwcywNCj4gSSBkaWRuJ3QgZmluZCBob3cgdG8gc3dp
dGNoIHZvbHRhZ2U/DQpZb3UgYXJlIHJpZ2h0LCB0aGVyZSBpcyBubyB3YXkgdG8gY2hhbmdlIHRo
ZSB2b2x0YWdlLCB0aGUgSS9PIHZvbHRhZ2UNCmlzIGJhc2VkIG9uIFZkZCBwaW4gaW5wdXQgdm9s
dGFnZXMuIFNlZSBQQU1PRFZERCwgUEJNT0RWREQsIFBDTU9EVkRELA0KU0QwTU9EVkRELCBTRDFN
T0RWREQsIGV0YyBwaW5zLg0KDQo+ID4gKyAgICAgICAgc2xldy1yYXRlOiB0cnVlDQo+IA0KPiBX
aGF0IGFyZSB2YWxpZCB2YWx1ZXM/DQo+IExvb2tpbmcgYXQgdGhlIGNvZGUsIDAgPSBzbG93LCAx
ID0gZmFzdD8NCkdvb2QgcG9pbnQsIEknbGwgYWRkIGVudW06IFswLCAxXSBhbmQgYSBkZXNjcmlw
dGlvbi4NCg0KPiA+ICsgICAgICAgIGdwaW8taG9nOiB0cnVlDQo+ID4gKyAgICAgICAgZ3Bpb3M6
IHRydWUNCj4gPiArICAgICAgICBpbnB1dC1lbmFibGU6IHRydWUNCj4gDQo+IE1pc3Npbmcgb3V0
cHV0LWVuYWJsZT8NCklmIGl0J3MgYW4gb3V0cHV0LCB3b3VsZG4ndCB5b3Ugb25seSB3YW50IHRv
IHNldCBpdCBoaWdoIG9yIGxvdz8NCg0KPiA+ICsgICAgICAgIG91dHB1dC1oaWdoOiB0cnVlDQo+
ID4gKyAgICAgICAgb3V0cHV0LWxvdzogdHJ1ZQ0KPiA+ICsgICAgICAgIGxpbmUtbmFtZTogdHJ1
ZQ0KDQpUaGFua3MNClBoaWwNCg==
