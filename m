Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A5A393D21
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 08:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbhE1Gey (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 02:34:54 -0400
Received: from mail-eopbgr10064.outbound.protection.outlook.com ([40.107.1.64]:28902
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229940AbhE1Gex (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 28 May 2021 02:34:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gfk2sLOLgBj4gv9zjw+PgciNnhEc/13yZWxBw/v4YTbmUQhoxj6Uu7kZjW07ht+62TOfPWXbsx3wSY5JCdpSClJ5KIZGkxll3wm5t6yHXQN2Ed0ntNnQASbaOaxL3JYVqb4MWk6hTkabNLL3cmEz9iyr8cp6egRrJl5yrvmzNtqIZbtCLL1yXKz+3kT0JuF1Qy2v2OLL49CU99cSDNoRTkpVKaJwes0VyGkXY+MbVp2ap5lRZw+Abin4O04Ej1R8SwbwtV070WKfS1bY5q0ufkwEXGBcXoYMv0DW5m+zpsOd/Z6WQAdQv5E0KrDQVyodDFGG9+xwHgnNCnQrPvM5fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7LQK7m+PDhVV9v2QaNVGxKQuVVnfRdcki/r2rt2XrE=;
 b=KWtM2p56YlhUQUudMx3/poURDN0n9ryjE0M+auqj3P0+3hIuCYd7cHJU3qRuom9bTGb9QSd4rsIJWCmv5YYcjaDzrMVY2ZIii71E4ppPikvYA16PR6afeABmLNukF18nugwVZLQj/tKihrA/HyVtXPHpmaCsS+7No97LNUZX8zJ/sAIAteBikVBD2B8mFY42Obv6wLC1A9S/E75kTYRwsjK8FWfnfRt/jfCbz1drBqMNG/4fApzQLWnuZ+CWV8sT+zVUUNRZmnRDh1d67+U9QYWrDWFGCpkzYbV6QxL0ORAqS3/pt9/Ct/jHrPZGL+1sg6Q7dQVBSjope+4XXtkklg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7LQK7m+PDhVV9v2QaNVGxKQuVVnfRdcki/r2rt2XrE=;
 b=VueOV9lolJ999KuI3l9HZmtkXKVrY/j54o9FP7nYubyLrG3TE6i3rTm344IOJNP7fsTfIy7fa6Ej9IbvGHXxObjVtWUEZ738/+FHn7z+a9BgM1BG2AwZExpcNGFxSJ6BHEMi5GLXcdv0+48Fo5NXGsdacbIDDGFlWTiyJyRMy84=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2169.eurprd03.prod.outlook.com (2603:10a6:3:21::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Fri, 28 May 2021 06:33:15 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::a88a:6fa9:ab7f:4a44%4]) with mapi id 15.20.4173.026; Fri, 28 May 2021
 06:33:15 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "michael@walle.cc" <michael@walle.cc>,
        "noltari@gmail.com" <noltari@gmail.com>,
        "jonas.gorski@gmail.com" <jonas.gorski@gmail.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
Thread-Topic: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
Thread-Index: AQHXUfTMWdGKRh/nT0q8zsRZfWZU3Kr2XhQAgAG1tuWAAF74AA==
Date:   Fri, 28 May 2021 06:33:15 +0000
Message-ID: <15d9e565021c115eec268c7fca810799eb503a90.camel@fi.rohmeurope.com>
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com>
         <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
         <CACRpkdZ2GdrGr8-XnVvf59O4AVBueBjX0PHYGtOeOdGXi=iE4A@mail.gmail.com>
In-Reply-To: <CACRpkdZ2GdrGr8-XnVvf59O4AVBueBjX0PHYGtOeOdGXi=iE4A@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 99787801-a05b-4d09-5d2b-08d921a2794f
x-ms-traffictypediagnostic: HE1PR0301MB2169:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2169B2820F3254A6ADC81E2EAD229@HE1PR0301MB2169.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XDlLy4wFfALi2FXevIOZltBPSCbZk2Rk0gGmth8NrvJArLyxK2OV7owRm/XRAKXpY2J9qukJSy5iYoW91zZlVVpMe26j94EMusTP/A3bkhFxtpqM3wICgHETjVcrhBOZrXK+aBwn+V8TVPngjHhM0D+7pl3JYM+t7SZUJ/jZGbCKCv2GjpJyWYL0Y0nZ2K4h/IxjbGOdO8FtduVEuzpyz3y+g59sxqop78RLhrV2SvZKugrNkBGQNwOLrzAGGoPlUygb0vBRfJI8/fObsp9MIbUsjaVrc0Kl5BDYrLYNOWldLs2tB25kYpUCKJ8GfE/0C0MMJGU8KAvAz/gwItPduxNkwA0KHOiqs2RM+Zk9XE+jWgBRpK7yup2lYJMScV+3o1BiQgHyNm1rCY0sKdfPLWXlHQPc+zk3dLO5DOTesU35zZzxYUJFWckr6gSebDz+0JusOAW2puHLtE6llZi5DNGWOEYwMwFGWI2Kc6DdoEkOKeQQaKrkmltRC4Rrr/ZI/wzj1Uy5N3lkukiO/f9vmcVfWJVjfqR/gN+QlE+P7WItui5e/vUpYbmsni6HqvgeYLE49tVoEGketKHFMu4jL6Aw/zRbx1XsNrGTeJTa10=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39840400004)(7416002)(2616005)(316002)(6916009)(54906003)(66946007)(76116006)(4326008)(66556008)(66476007)(478600001)(64756008)(66446008)(53546011)(6512007)(2906002)(6506007)(5660300002)(86362001)(8936002)(38100700002)(3450700001)(186003)(122000001)(8676002)(71200400001)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SVlEU3JCWU1sMUFqNlBoYXZIYXQ1Y1BYWk85Mm1FRHc1YUNuaGhRV1VLNWpW?=
 =?utf-8?B?QzFpY1pHNHBlNzM1MGl5UUQ3RUhBaEpLdGhZSkNyZDRIeXF5TnJEcyttMTBR?=
 =?utf-8?B?RFRER0UwYVZCRFgwb2ZJQk1MdjVrVlNTN2owM0EvdTNFV0JVK1ZyZmgrdis3?=
 =?utf-8?B?NlVqU0dWZ0hNc1pJR0ZsOVZmd0QwUCtIQTJQZGVQclNIN1NNUGcyRG9pdDRP?=
 =?utf-8?B?ZmYzaUhvdTE4TnMydXRocmErelZKRVdqOCtjWlZDOTd0QzJ4c1RaYVJZL1Qy?=
 =?utf-8?B?amU2RUJ1RmRGK3F4dG1EKzZPQ1NQdkhaUytsN2ZOWW1XcUplSERFb25DZzJa?=
 =?utf-8?B?OUFZbThZVHR4RjNXOWpScDJDY1VQM3lDdFI0bUszeVB1SWZYdzlIOGs2MjJX?=
 =?utf-8?B?MDVzVWhnTjBKa0pXR3Z5TWRLQnNhdUg3U1J6N0h4Zmw4WjhpeTByYnZ0ck5j?=
 =?utf-8?B?TXQ3dEVGZldKZWRSSGNYbGxJQ25rMk13SjZWUGhJZWRzc1pnWkZGbW8xTnpU?=
 =?utf-8?B?M1NTRzA5eDVFOTdwRC8vM0NzVTJqUkpyRWMycVhTaWN2ZW15V08yWGxCUzdT?=
 =?utf-8?B?Ky9YSFliUDh1L2FPQTJqeXNHbUpiU3VTekNPdE9peFlZMFQxTmtaQ3NKMS9j?=
 =?utf-8?B?QW1mYnhBOWpPNnQrclFlT1hHTUFiYm14eVNVcXB1RkRRUkV3UHVsRm0vS3NG?=
 =?utf-8?B?Lyswb3hLZzdQMHJrLy9GNU5sSUhtcm9HVlZUeUZrYXNpenZNbTQ3dktobTA1?=
 =?utf-8?B?MWlEWHlHUU5Hb0Q2enNUMmQzTkpjTU94czB6QnRxVEZYeWNnRDZVTGhISEdB?=
 =?utf-8?B?RXorRVNrRzcwQXYyMTJ5VDM3K2lqejJwMmZRQWVPMDFvZ2RoNURLaGJvTU1q?=
 =?utf-8?B?OWUrRkw1QUNvZEpCWG9BREErZCtoYUVyQ2I3Z3hKY28ycExHZUJxR3BFbzBV?=
 =?utf-8?B?SHIzRVc5eEJTK3orWGIvMEF1cDk3VzVLb2tSOC9OU2VjZmZQRjhybjVIVEVD?=
 =?utf-8?B?Q2RNN01Ea0QzSjYwVE92RzRXSnVVbmw0eG9DS0xZOHVEZVVIcWcrYUI5NkZC?=
 =?utf-8?B?WHlJTlkzWlFjTEtuRVlyUWFBZGlnVS9kUjFqRThQdCt1bjNBblZBYld3am5p?=
 =?utf-8?B?VktKRndoeC90dzh6Qi9VVEV2OE9hTG5mc3JUbjl0SG55UXgrNURDOW5RUmlm?=
 =?utf-8?B?dDR2SEgzRy9KSCtKNzNFK05WamNCc1BOanNMc0VYYlB2NlFPU0FZcGMycjNp?=
 =?utf-8?B?S1kydFYvd0tLMWsyQUdPZDYwSW1lUmVLdkZTMnJRNEFrNlBHbUJBSkNFYlpH?=
 =?utf-8?B?eEVzMmhIcEExMnYrUzNxWWd6Q05tMk1ERGN3TzEzTTZaaFVXMWRYMGFvU1FX?=
 =?utf-8?B?SVVOS3Bqb0pEa2Y5WTI2Wm1ya0tjaWhEUFI1K002ZllydUYrQ21VYW9ubklK?=
 =?utf-8?B?Q0NmSWEzMWJZNkNtakdrcHdNUmUwalRjT1RuZ2RMUGN1TGtYNzZsOXZEemlM?=
 =?utf-8?B?NWRYSXZIalBhVHhnL2RkNTJURElnVDJ0bWg0Rm1uT2RsZisxclpyamZkSlpQ?=
 =?utf-8?B?ckJzcW1BSkVyRjBtZmcvV1d4TC9UYkN4L1EzTlgrZXkwNVpwS042d0ZTcWRz?=
 =?utf-8?B?czVHTlc4TFI5c2MvM292eXpyTDlsbU96Q2srcWNiU0JXWXlPdU52RE1mUEdt?=
 =?utf-8?B?TVE0YUJUbmFZMTJYZWlRWi8rbGFjQzJ5b1hwUS9WaXJKZGMxbmNKbk5nSHU1?=
 =?utf-8?B?RUJkU0lYRzZHWDVVeGM2NjhFU3ZFZDMza1FDQWh4OGp4K1o3cWJYYkF5Umhi?=
 =?utf-8?Q?eKGfwwmFkb2NSPXuaDstev/UiWMOJVIJT9e5A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <303C914B8F72314CB6523F3C7DBBE529@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99787801-a05b-4d09-5d2b-08d921a2794f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2021 06:33:15.2629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ie2gRIOQOM5R13WkbSWG1DPTrfJHQlgtu4xiic5ygRGMBBl5dSqeZMB8OUzlImzXN0mgTO8xQsQ4Bt4kYMsmhUp9ehBxj/jyOjrhSvHNvsCuYSuCr45XxhyVRzr7fe+h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2169
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDUtMjggYXQgMDI6NTMgKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDI3LCAyMDIxIGF0IDg6MzIgQU0gTWF0dGkgVmFpdHRpbmVuDQo+IDxt
YXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiANCj4gPiBJIHRoaW5r
IHRoYXQgdGhlIGRpc2FncmVlbWVudCBib2lscyBkb3duIHRvIGZldyBzdHlsaW5nIGlzc3VlcyAt
DQo+ID4gYW5kDQo+ID4gb25lIG1vcmUgcHJhZ21hdGljIG9uZS4gQW5kIG9ubHkgd2hhdCBjb21l
cyB0byBob3cgd2UgYWxsb3cNCj4gPiBpbXBsZW1lbnRpbmcgdGhlIElDIHNwZWNpZmljIGNhbGwt
YmFja3MgZm9yIHRoZXNlIG1vcmUgY29tcGxleCBIVw0KPiA+IHNwZWNpZmljIGNhc2VzLiAiU3R5
bGluZyIgYm9pbHMgZG93biB0byBwcm92aWRpbmcgZ2V0dGVyLWZ1bmN0aW9ucw0KPiA+IGZvcg0K
PiA+IHdlbGwtZGVmaW5lZCBncGlvX3JlZ21hcCBwcm9wZXJ0aWVzIGxpa2UgcmVnbWFwLCBkZXZp
Y2UgYW5kIGZ3bm9kZQ0KPiA+IHBvaW50ZXJzIFZzLiBleHBvc2luZyB0aGVzZSBpbiBhIHdlbGwt
ZGVmaW5lZCBzdHJ1Y3R1cmUgYXMgZnVuY3Rpb24NCj4gPiBwYXJhbWV0ZXJzLg0KPiANCj4gSnVz
dCBkbyBpdCB0aGUgd2F5IHRoZSBtYWludGFpbmVyIGxpa2VzIGl0IEkgZ3Vlc3M/IE1pY2hhZWwg
d3JvdGUNCj4gdGhlIGRyaXZlciBzbyBkbyBpdCBpbiBoaXMgZmFzaGlvbi4NCg0KVGhpcyBpcyBm
YWlyIGdhbWUgSSdkIHNheS4gSWYgdGhlcmUgaXMgbm8gY29tcHJvbWlzZSAtIHRoZW4gaXQgc2hv
dWxkDQpyZWFsbHkgYmUgaW4gYSBtYWludGFpbmVyJ3MgZmFzaGlvbiBvciBub3QgYXQgYWxsLg0K
DQo+IA0KPiA+IFNvDQo+ID4gYXQgdGhlIGVuZCBvZiB0aGUgZGF5IGl0J3MgZmFpciB0byBnbyBv
biBpbiBhIHdheSBNaWNoYWVsIGFuZCBZb3UNCj4gPiBmaW5kDQo+ID4gZWFzaWVzdCB0byBtYWlu
dGFpbi4NCj4gDQo+IFdoYXQgbWFrZXMgdGhpbmdzIGVhc3kgZm9yIG1lIHRvIG1haW50YWluIGlz
IGFjdGl2ZSBhbmQgaGFwcHkNCj4gZHJpdmVyIG1haW50YWluZXJzLCBzbyBpdCBpcyBwYXJhbW91
bnQgdGhhdCB0aGUgZmlsZSBsb29rcyB0byBNaWNoYWVsDQo+IGxpa2Ugc29tZXRoaW5nIGhlIHdh
bnRzIHRvIGtlZXAgbWFpbnRhaW5pbmcuIFRoaXMgcmVtb3ZlcyB3b3JrDQo+IGZyb20gbWUgYW5k
IEJhcnRvc3ouDQoNCkkgYWdyZWUuIFdoZW4gc29tZW9uZSB0YWtlcyBjYXJlIG9mIGEgZHJpdmVy
LCBoZSBzaG91bGQgYmUgaGFwcHkgd2l0aA0KaXQuIFBlcmlvZC4gQW5kIHRoYW5rcyB0byBNaWNo
YWVsIGZvciB3cml0aW5nIHRoaXMgZHJpdmVyIGFuZCByZXZpZXdpbmcNCnRoZSBwYXRjaGVzLiBS
ZXZpZXdpbmcgaXMgaGFyZCB3b3JrLg0KDQpPbiB0aGUgb3RoZXIgaGFuZCwgSSBkb24ndCBlbmpv
eSB3cml0aW5nIGNvZGUgSSBhbSB1bmhhcHB5IHdpdGggZWl0aGVyLg0KQW5kIGFzIHRoaXMgcGFy
dGljdWxhciBwaWVjZSBvZiBjb2RlIGlzIG5vdCBhIHBhaWQgdGFzayBmb3IgbWUsIEkgZG8NCnRo
aXMgZm9yIGZ1bi4gZ3Bpby1yZWdtYXAgaXMgbm90IG1hbmRhdG9yeSBmb3IgbXkgZHJpdmVycyBu
b3cuIFNvLCBJJ2xsDQpqdXN0IG9wdC1vdXQgZnJvbSB0aGlzIGNoYW5nZS4gSSdsbCBoYXBwaWx5
IHVzZSB0aGUgZ3Bpby1yZWdtYXAgd2hlcmUNCml0IGZpdHMsIHdoZW4gaXQgZml0cy4NCg0KU28s
IGR1cmluZyB0aGUgbGFzdCBjeWNsZSBJIHByb21pc2VkIHRvIGxvb2sgdGhlIGdwaW8tcmVnbWFw
IHVzYWdlIG9uDQpST0hNIElDIGRyaXZlcnM6IEN1cnJlbnRseSBpdCBkb2VzIG5vdCBmaXQgZm9y
IHRoZSBCRDcxODE1IGFzIGl0IGxhY2sNCnN1cHBvcnQgZm9yIGluaXRfdmFsaWRfbWFzayBhbmQg
c2V0X2NvbmZpZy4gSXQgZG9lcyBub3Qgd29yayBmb3IgdGhlDQpCRDcxODI4IGVpdGhlciBkdWUg
dG8gbGFjayBvZiBzZXRfY29uZmlnIGFuZCBzcGVjaWFsIGhhbmRsaW5nIG9mDQpIQUxMX0dQSU8u
IFJlZ2FyZGluZyB0aGUgQkQ3MDUyOCAtIHdpdGggbXkgaGVhcnQgYmxlZWRpbmcgSSBqdXN0IHNl
bnQgYQ0Kc2V0IG9mIHBhdGNoZXMgdG8gcmVtb3ZlIHRoaXMgSUMncyBkcml2ZXJzIGNvbXBsZXRl
bHkuIEl0IHNlZW1zIHRoZSBJQw0KbmV2ZXIgcmVhbGx5IHRvb2sgb2ZmLiBUaGUgQkQ5NTcxIHdh
cyBub3QgYXV0aG9yZWQgYnkgbWUgYW5kIEkgZG9uJ3QNCmhhdmUgdGhhdCBJQyAtIGJ1dCBhdCBx
dWljayBnbGFuY2UgaXQgc2VlbXMgdGhhdCBkcml2ZXIgbWlnaHQgd29yayB3aXRoDQpncGlvLXJl
Z21hcC4gQ29udmVyc2lvbiB3b3VsZCByZXF1aXJlIHNvbWUgdGVzdGluZy4NCg0KPiBNYWludGFp
bmVyIHN0eWxlIHF1aXJrcyBhcmUgY29tbW9uLCBJIGhhdmUgc29tZSBteXNlbGYgKGxpa2UNCj4g
bmV2ZXIgYWxsb3dpbmcgX191bmRlcnNjb3JlX2Z1bmN0aW9ucykNCg0KSSBsaWtlIHRoaXMuIFRo
ZSBMaW51eCBrZXJuZWwgY29tbXVuaXR5IGlzIHdlbGwga25vd24gZm9yIHN0cmljdCBhbmQNCmVu
Zm9yY2VkIHN0eWxpbmcgZ3VpZGUuIEkndmUgYWxzbyB3b3JrZWQgaW4gYW4gYW5vdGhlciBwcmV0
dHkgaHVnZQ0KcHJvamVjdCwgd2hlcmUgZXZlcnkgZGV2ZWxvcGVyIHdhcyBwcmV0dHkgbXVjaCBh
bGxvd2VkIHRvIHVzZSB0aGVpciBvd24NCnN0eWxlLiBJIHRoaW5rIGl0IHJlc3VsdGVkIGhhcHBp
ZXIgZGV2ZWxvcGVycyBhbmQgZGVmaW5pdGVseSBtYWRlIGNvZGUtDQpyZWFkZXJzIG11Y2ggbW9y
ZSBjYXJlZnVsIDspIEknZCBjbGFpbSB0aGF0IG1hZGUgcGVvcGxlIHRvIHBheSBtb3JlDQphdHRl
bnRpb24gd2hlbiByZWFkaW5nIGNvZGUgLSB5b3UgY291bGQgX25ldmVyXyBzYWZlbHkgYXNzdW1l
LiBJdCB3YXMNCmFsc28gc29tZWhvdyBmdW5ueSB0aGF0IGF0IHRpbWVzIG9uZSB3YXMgYWJsZSB0
byByZWNvZ25pemUgYSBmaWxlDQphdXRob3IganVzdCBieSBsb29raW5nIHRoZSBjb2RlIDopDQoN
CldlbGwsIEkgd291bGQgbm90IHN1Z2dlc3QgdGhhdCB0byB0aGUgTGludXgga2VybmVsIC0gYnV0
IEkgZGVmaW5pdGVseQ0KbGlrZSBhbGxvd2luZyBmZXcgbWFpbnRhaW5lciBxdWlya3MgaGVyZSBh
bmQgdGhlcmUuIEFuZCBJIGFtIGRlZmluaXRlbHkNCmhvcGluZyB0byBzZWUgaGFwcHkgbWFpbnRh
aW5lcnMuIEV2ZW4gdGhvdWdoIHRoZSBfX2ZvbygpIGZvciBpbnRlcm5hbA0KZnVuY3Rpb25zIGlz
IHRoZSByaWdodCB0aGluZyB0byBkbyAodG0pIDspDQoNCj4gIHdlIGp1c3QgYWRhcHQgdG8gdGhl
aXINCj4gcXVpcmtzIGFuZCBiZSBnb29kIGRpcGxvbWF0cy4NCg0KT3Iga2VlcCB3aGluZ2Vpbmcg
YW5kIGFjdGluZyB1cCAtIGRlcGVuZGluZyBvbiB0aGUgcGVyc29uIFhEDQoNCktlZXAgdXAgdGhl
IGdvb2Qgd29yayB5b3UgYWxsIDopDQoNCkJlc3QgUmVnYXJkcw0KCS0tTWF0dGkNCg0K
