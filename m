Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 841416B2519
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 14:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjCINSw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 08:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjCINSm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 08:18:42 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D94F2E34AD;
        Thu,  9 Mar 2023 05:18:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiFPub8m4ZQUt50F9bcLwx3uQSYT6SfWMhZU2OPuA1YT3HjQf6ukw1dW4zFFgDbbqBZMnZz3bIZmYC8S44f6dA05WWXCrQ25yaKx49rSLh+2Feoba6QNn2XjGe+PqQvRT4XgcqfCbuABcFaFvAA4q8fmnW/aqum1D0+6fGUBECoxhdDGDcxLTsOMreLWal16vpg/YSRM+sn7RnCzxJsuamVngbZFvILiuSMqWgbUGahvusFy6bRw3av/vg8WKiyQqlyH99AA00/Xog9pPvFLUwXqN0URd6RPRl4TXbRnOsZKHHjofhxuwusy60sEvzmLj3FtuuwPbbJbqA13NPgP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THTO2efZ9XB5z6+EUZhUBVWTr+68wLMRT3t1tdyoIMc=;
 b=RwRJrUb6U+626iPHFFkBigfpaXReKunbTFcidFkpp+r3FI9pQdYfLPtYbziPiEsPUfTeRpRrdnBpPMeF29vf8NUADTk94JiRscxSHHJg03eWBKZOmqbLtjNRonLA8AVvlYK1Soahob1QH1GJy30yuliYxCdrPROkNpJ9Ul3aRrIUSnhTOxAIEax4Lvy38Rai8F88LOMaqGbBbXX6vddf0Dat985hNbulCSL9i00kROpmHlhWwgCX/VsPPFWImI0+BJ5bJQptkPgZDwrTKKx2wlpdcqQqbtG8/9i3lJT0GKK2i/wDSHITSezLbR8ZfgoXHn/8LO3daH+orD8keEo+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THTO2efZ9XB5z6+EUZhUBVWTr+68wLMRT3t1tdyoIMc=;
 b=HyLRB/aKNJ4+/nmcLWYqFzpIqrUuEE1nGKWpDB3n0nNpUEPCE9Vh2qDB4jprfWLI55Mzl1QPlWOW85XAqMGLD/SCJ/5+hWgBZ0E/As8RejNaSHMYxc8E7ZzjFp1lqvzzLUvze2BMKuu3Oo7QWDXuBGMBV9Ww0yiUEtIugL07D9w=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9314.jpnprd01.prod.outlook.com (2603:1096:604:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 13:18:37 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 13:18:36 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Topic: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoCAA35MgIAAAaFQ
Date:   Thu, 9 Mar 2023 13:18:36 +0000
Message-ID: <OS0PR01MB59220DDDEA40ADA04B0E3AF186B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
 <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkdY7zx+_QxDWMRa9BzXofvzeq-hJOfiH2WCRC7_pCUjCDQ@mail.gmail.com>
In-Reply-To: <CACRpkdY7zx+_QxDWMRa9BzXofvzeq-hJOfiH2WCRC7_pCUjCDQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB9314:EE_
x-ms-office365-filtering-correlation-id: f085e2fb-8c46-4e37-2c3e-08db20a0ca98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGOoPKSvBZfr6+trODjCLI1OMzGthowaQ8ZZcAHviUDXE8ToJoVMzUHIqXc+ptwiaJwd/6SrO1ZHuHk/asysfZhJNJrOOY4wpt7KbnvP1dD3GZ4mh3rLLQG38CIp3jqmV9e2Xr4nW8/Lhbj5lUPNY8zMn7ccvr/8g5aD1MPDgX67cojQqgRV6Fl1ZHzbPUAQaPAP5iacOTRED/GealHyA0K5PI29UVd6gsMWbgrBLvgxTdLA1SYa9Wma5I02GdBq06A4cuTanhg2PHV/qJCFNLRa6QnkVJe3dMufqRMypZdhfSLZ4Pq5F/WqhQW2KzA2eOrGciSisrNeNTjORnLVfpo8OG4MX9dVgn/WlrRkH2v9T69s+estt0EuqdgKEMnqoKc4Gyx67H90uhKd0AYdemugvmJjooTY1G1dZNB0u52Lx94x87+xZzQrz6+xabSLUZEVvhGJFdJSGTRyeSo+wUqhNNsxsP37xd6x4NckV9gRwxWttds3UoqRkmhbI3uMrFZIMEnmeFAGKltUwRloasf9NOnYKF3qPCoMwLoSCiggeRiFI8KkMFyMFe+OqHgnt50W9j7HM7zzfEalTUmhUDkLY80AFVxFhscriVDBiPvaQOcfz86OIWAg2QZDd9pEVT9SAmku9cXSIdIBEUh1tvIqkwOWEI8v6VJyrI1UK4+Nr7ipeox3mv0T3F5qKPsyrJ4AfpKoQ9yWfhWL03x+fQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199018)(2906002)(38070700005)(6916009)(5660300002)(6506007)(8936002)(52536014)(66476007)(66556008)(66946007)(76116006)(4326008)(66446008)(64756008)(41300700001)(8676002)(55016003)(54906003)(316002)(86362001)(7696005)(71200400001)(33656002)(478600001)(38100700002)(122000001)(53546011)(26005)(186003)(9686003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHpTVVVlSElWZjMrb1UwR0tBRmlZR3o2NW4yakRheEd6TndJS0lqRGpnU0Jt?=
 =?utf-8?B?eHhqak5lUGJuZytTR1l2Vm9Qb0x6QU5nbjRGOEJRK2lvekJzUDNXc1dDV0tM?=
 =?utf-8?B?dDF4T3h3aStwSkVjcmY0dDZUQzJlc05LeHZyQnNGTm82SEgvSXNGR1BUTkR6?=
 =?utf-8?B?R3V3STVOeVBYRE9tS0lzc1JhMjIxTlFoN21ublZ2a2phTDlkVVM2bzVNa0xq?=
 =?utf-8?B?Y1BXZWVmRUxUWUhESkJXOTh4NDhWdmFCVU1GTkpHcVIzSXE2MzU1cXQreGE2?=
 =?utf-8?B?M1dtSHloME9mbDZXOEhBd08wdGRpRXZmZVBmRDdnUFV0V2VyUFozTEpnNmVp?=
 =?utf-8?B?bDhMUWZmb2Q4NWJtR2Q0bXdPOFRObXFheXVGWW5aOHlSdW1NRE9ja1ExTWFV?=
 =?utf-8?B?c0p0d2dNWnJUQytubWk5bHdqTjk3N2tWSEtXVWloN09kaU8wbnJIZzR0OS9y?=
 =?utf-8?B?NzhLQ1k3Tlk3YVR5TXY1NnIxYzZzN1MzMCtnSWFjZEpxQmVVUlFDM3hoNTBY?=
 =?utf-8?B?enRqYjMzaXd4dlpCQTBRMG1zc1J1WTZGM0tsTm16aWRmdnkvN0JZZzdNcGpt?=
 =?utf-8?B?b1ZXeFNVMldsMExuNy9wRk4wVURISmVqSjh4c1phMTVCQkxwVlFoWXJjMGJ0?=
 =?utf-8?B?eFAzd1N5RkljWHVuZHhNb1dMRm9NNE52a1ZYTTVab2RwYXNpQWVvWSs1V2lw?=
 =?utf-8?B?dW1qWldMVithZ2NaVE9USThwMG1WTHpaZG9jRGNiNENGMjZpR1VrQVdoUGRP?=
 =?utf-8?B?TTRuN0hJamtvanBreEtvdVVTVUZ1NWg5RW1tYVBOaDBpQXJxd0JrYXc4ZEN0?=
 =?utf-8?B?Y01XTzdoYTRVZFU2V0JaRmdpTE5YYkZ5VmFObWtRWXhHVE02enhEbVFOd1g3?=
 =?utf-8?B?Q2pROWdNSTc2YUQ0TUVraHErMCt4RkE2SUloOFlxZGROamlvekJCWXRlU0ZM?=
 =?utf-8?B?ZnJSNE1yaXJSVjlERENreVdzZmFZWVgxZHBnQzF1TCtRV3hKOXJJbkVkVkNh?=
 =?utf-8?B?U3AxNlU4ZFBTbHdCdDVyMTVkcHNqdmRYV01EZ2Q0RFlQdDNSMlpEcE91MXlE?=
 =?utf-8?B?eGNJRnVSQkpuSmNYd3BZZHJ6S3JUUThGUFQ0U1luaTBxcVAzcHdtM0tTOVlY?=
 =?utf-8?B?elZFNHlDSEIvSmNKOUFJRVBGYWRWSGtjQkF5bVc1ek5iRnpmM1NQWHVxOENu?=
 =?utf-8?B?ajdKbFZaMnROaFFSYW0xcEVGWEdRUXBtb3JZcjlFSGljbVRjbHNZdGYvdHNO?=
 =?utf-8?B?d1VzZXk4SFlGTmhERi9qRlVrV1RMQ2cxcnpRVzYybStVeGFxdk51ei8rckZI?=
 =?utf-8?B?dU1Fc1NjczVxY0YzTlhQNjZhL0NxMnd6eE8vdXZZeEx1eVVEaXR1Z1V1MkVm?=
 =?utf-8?B?VnZJOHVia2E4VWRYQlIvZnlTcmxKbXFpTG5DWHR5ajJTbXRDR2dZOFdFdk9n?=
 =?utf-8?B?NVZKT3FZSUdvMVlvVytCcmxhU3JadVUvMDRuNmgxMzNrODRBTTc4RlRLUE56?=
 =?utf-8?B?QVpnR3B1SVNQQnhXSjVja0J4ZmJHQis1VXF2MFdmVENqcmkwQ3owSDl1a09w?=
 =?utf-8?B?c0hVK3gxdkI5eHVuNk00MytEcWNJTmpzcFQ4VytIZWloVmdqR1EwbCtZS2Zp?=
 =?utf-8?B?WTNDRFczRHNUbTZWcHdyQXFaRHg3UEZyc3ZBM2xocEFIUU9UalZ5TW1mMXg4?=
 =?utf-8?B?NktpOERGdFRXMkg4NWVmN2JaTjVEY1VQVzBKbUxKZ29ZNUppU2ltZTljR0NK?=
 =?utf-8?B?bnJuODREZUJJVzRUTHRKTGVyQUJLRGlwVFdDM2dray85SUFpOVQzS1B1eWN1?=
 =?utf-8?B?ZE5FaE45eEJJejQvZnlQY3JQcHlZdlAxVGs2R0xXRGJOZFFGcFpXTTE4a2pp?=
 =?utf-8?B?WW9lVjY3a25vMHpLb3U0Yy9ZV3l4MGd4Q3Nlb2tMckMzejEwMXdmMjRLblNP?=
 =?utf-8?B?RHAxUzVVTzZzdGhwWkF3dnNvOEdIY01FR2tmb2s1RjNqZk5BL3FYdlhrbldO?=
 =?utf-8?B?SFVHYkdEM0tXNzc0T3FNeXA5SDVRVi91YlllYjV0NWNjcWFmTnZDN1V0T2pN?=
 =?utf-8?B?OU9EaU91S2JaZCtYUzdzZTYxbEtnTzZObzh6UGVhZGdhbjJwaU8wcVVNMktX?=
 =?utf-8?Q?dPZXFmYkzn1V0D+c+afLYJS+k?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f085e2fb-8c46-4e37-2c3e-08db20a0ca98
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 13:18:36.8415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gN8rs67LC+a4NCqxxnH3P7gFdCX6BmoHZ4dph9cSPWiHgkVemQ6UMAQ5zQ5h4aSOTUctyiQoNFMzWl/+hp/wSWqeNtdbihvDjfu2TRje1Wc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9314
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgYW5kIEFuZHksDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAwMS8xM10gcGlu
Y3RybDogY29yZTogQWRkIHBpbmN0cmxfZ2V0X2RldmljZSgpDQo+IA0KPiBPbiBUdWUsIE1hciA3
LCAyMDIzIGF0IDk6MTMgQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3
cm90ZToNCj4gPiA+IE1vbiwgTWFyIDA2LCAyMDIzIGF0IDA5OjAwOjAyQU0gKzAwMDAsIEJpanUg
RGFzIGtpcmpvaXR0aToNCj4gDQo+ID4gPiA+IEFkZCBwaW5jdHJsX2dldF9kZXZpY2UoKSB0byBm
aW5kIGEgZGV2aWNlIGhhbmRsZSBhc3NvY2lhdGVkIHdpdGggYQ0KPiA+ID4gPiBwaW5jb250cm9s
IGdyb3VwKGkuZS4gYnkgbWF0Y2hpbmcgZnVuY3Rpb24gbmFtZSBhbmQgZ3JvdXAgbmFtZSBmb3IN
Cj4gPiA+ID4gYSBkZXZpY2UpLiBUaGlzIGRldmljZSBoYW5kbGUgY2FuIHRoZW4gYmUgdXNlZCBm
b3IgZmluZGluZyBtYXRjaA0KPiA+ID4gPiBmb3IgdGhlIHBpbiBvdXRwdXQgZGlzYWJsZSBkZXZp
Y2UgdGhhdCBwcm90ZWN0cyBkZXZpY2UgYWdhaW5zdA0KPiA+ID4gPiBzaG9ydCBjaXJjdWl0cyBv
biB0aGUgcGlucy4NCj4gPiA+DQo+ID4gPiBOb3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhlIHVzZSBj
YXNlLiBQbGVhc2UsIGNyZWF0ZSBhIGJldHRlciBjb21taXQNCj4gbWVzc2FnZS4NCj4gPg0KPiA+
IE9LLCBCYXNpY2FsbHkgcGlubXV4X2VuYWJsZV9zZXR0aW5nIGFsbG93cyBleGNsdXNpdmUgYWNj
ZXNzIG9mIHBpbiB0byBhDQo+IGRldmljZS4NCj4gPiBJdCB3b24ndCBhbGxvdyBtdWx0aXBsZSBk
ZXZpY2VzIHRvIGNsYWltIGEgcGluLg0KPiANCj4gU28gd2hhdCBpcyB0aGUgdXNlIGNhc2U/IFdo
aWNoIHR3byBkZXZpY2VzIG5lZWQgdG8gdXNlIHRoZSBzYW1lIHBpbiBhdCB0aGUNCj4gc2FtZSB0
aW1lPw0KDQpBbmR5IGFza2VkIGEgcXVlc3Rpb24gQ2FuIGEgcGluIGJlIHVzZWQgYnkgbXVsdGlw
bGUgZGV2aWNlcyBhdCBzYW1lIHRpbWUNCk15IGFuc3dlciBpcyBuby4gDQoNClRoZSByZWFzb24g
aXMsDQoNClRoZXJlIHdpbGwgYmUgYSBzaW5nbGUgb3duZXIgY2xhaW1pbmcgYSBwaW4gYXQgZ2l2
ZW4gdGltZS4NCnNldHRpbmctPmRhdGEubXV4IHdpbGwgYmUgdW5pcXVlIGZvciBhIHBpbi4gU28g
dGhlcmUgd29uJ3QgYmUgYSBjb2xsaXNpb24gd2hlbg0KbG9va2luZyBieSB0aGUgc2FtZSBwYWly
IG9mIGZ1bmN0aW9uIGFuZCBncm91cCBuYW1lIGZyb20gZGlmZmVyZW50IGRldmljZS4NCg0KPiAN
Cj4gWW91IGNhbiBhbHJlYWR5Og0KPiANCj4gMSkgVXNlIHRoZSBzYW1lIHBpbiB3aXRoIGRpZmZl
cmVudCBkZXZpY2VzIGF0IGRpZmZlcmVudCB0aW1lcywgYmVjYXVzZQ0KPiAgICBwaW4gY29uZmln
cyBjYW4gYmUgY2hhbmdlZCBhcmJpdHJhcmlseSBhdCBydW50aW1lLCBzZWUgZm9yIGV4YW1wbGU6
DQo+ICAgZHJpdmVycy9pMmMvbXV4ZXMvaTJjLWRlbXV4LXBpbmN0cmwuYw0KDQpBZ3JlZWQuDQoN
Cj4gDQo+IDIpIE11eCBhIHBpbiB0byBhIGNlcnRhaW4gZGV2aWNlICphbmQqIHVzZSBpdCBmb3Ig
R1BJTyBhdCB0aGUgc2FtZSB0aW1lLA0KPiAgIGFsbCB0aGF0IGlzIG5lZWRlZCBpcyB0byBzZXQg
LnN0cmljdCB0byBmYWxzZSBpbiBzdHJ1Y3QgcGlubXV4X29wcy4NCj4gICBUaGlzIHNob3VsZCBi
ZSBmYWxzZSBpZiBlLmcuIHRoZSBHUElPIGNhbiBiZSB1c2VkIHRvICJzYW1wbGUiIHRoZQ0KPiAg
IG91dHB1dCBvZiBhIEkyQyBibG9jayBjb25uZWN0ZWQgdG8gdGhlIHNhbWUgcGlucywgc28gdGhl
IHR3bw0KPiAgIGZ1bmN0aW9ucyAoSTJDIGFuZCBHUElPKSBhcmUgbm90IGVsZWN0cmljYWxseSBk
ZWNvdXBsZWQuDQo+IA0KPiBTbyBkbyB5b3UgcmVhbGx5IGhhdmUgYSB1c2UgY2FzZSB3aGVyZSB0
d28gZGV2aWNlcyBuZWVkIHRvIHVzZSB0aGUgc2FtZSBwaW4NCj4gYXQgdGhlIHNhbWUgdGltZT8g
SSd2ZSBzZWVuIG11Y2ggYnV0IEkgaGF2ZW4ndCBzZWVuIHRoaXMgYmVmb3JlIQ0KPiBXaGljaCB0
d28gZGV2aWNlcyBhcmUgdGhhdD8NCg0KSSBkb24ndCBoYXZlIGEgdXNlIGNhc2UgbGlrZSB0aGF0
Lg0KDQpDaGVlcnMsDQpCaWp1DQo=
