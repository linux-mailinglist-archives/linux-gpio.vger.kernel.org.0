Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C22639100E
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 07:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhEZFmA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 01:42:00 -0400
Received: from mail-eopbgr140085.outbound.protection.outlook.com ([40.107.14.85]:33816
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231210AbhEZFl7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 May 2021 01:41:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoVcezIW0lSzC5Ax7JfgD13gVsCwYB/JwP9Ba4GDJKuSMnBKmfpxlvKyFuJyK4euejfZcpj0bgF6msz6GB2GJb3IYD1qzVE7L25wj8T8poSJIRUNIl2VMf4rR4eBmdjeAv4Nj1cYhY01PRYd0V10xBiif+5C+NNT6ty7taWC+uIediuqgUKFK529gVY8mInU///y7lAq6WWWSRYmntUSRzDTemudHJilwFR8jOI65AnI+EOF93F/BhpuWhOUUvF6y94t7coA1J1AfFq5+QRekmh33q6TZPq16a1RpJvaePE3s7U0wXt+UkyrhEMrus140QSSlSLGRsChJsgvdL91gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30hEntM9VkshRMVPHQTSoHYNPKJ31DxnOax/DEV5Qz0=;
 b=GfhbB/NaOepujrgMnHUl/lF+G7iy5H5urrABVZGiilbcw7j9uupOvSMI1vGz+F8BEpb1iEzy9JwCImqdnnJ9OTJne4rB4D5Q8J6PLLprehRwTyTvcHoIWQcIW6fm5HcyqBI9ABvBMtwQjqspDeKAz5dZDU/4LQnhsPPggsNYRAvXc6+xIi0qF+LvItvUFbfjNZhuv2ZD/ooTcch5D63dbbGGcHqUVDl/rCXAUVHR+nvwC2NLY6z2bbiIITIZDO1uYaCfKKIc1aJgThahmUwlTSiyw0wfRs3zqrPG77ZDiopbUb9H4FG/MRStKqQNXyRcbzeeU87dWHoXwnblbADsCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30hEntM9VkshRMVPHQTSoHYNPKJ31DxnOax/DEV5Qz0=;
 b=gEO6SzWyH/PC4g0sh/hSUy++uDfWFa3UJuFWsdO4t2YtzWvVYKqVablSx1QHpOksIVpMwcDX42REjIAf2sWQJRntULLwW1Sg9ImAjfanHcKQ2zbD+uCglv5fUhybgO+iu9gbGsCjE4i0KTNpbn0GVkB2sx6tSv87ZMJoLlb7q5E=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR03MB2988.eurprd03.prod.outlook.com (2603:10a6:7:5f::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Wed, 26 May 2021 05:40:24 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 05:40:24 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "michael@walle.cc" <michael@walle.cc>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] gpio: bd71815: Use gpio-regmap
Thread-Topic: [PATCH 2/2] gpio: bd71815: Use gpio-regmap
Thread-Index: AQHXTWt9NDPZvSrNjU+a1DtzrCwPg6r0YM4AgADnmgA=
Date:   Wed, 26 May 2021 05:40:24 +0000
Message-ID: <86d1bc11694726064ff5e567c98de0288f944af9.camel@fi.rohmeurope.com>
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
         <7f19bf2bb61ad64a9df94ab16bc1cca08e8efe43.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdYjFoLD83Kn1WMR3fdn6=eD5MpM16wOmA41Oqp__AcM1A@mail.gmail.com>
In-Reply-To: <CACRpkdYjFoLD83Kn1WMR3fdn6=eD5MpM16wOmA41Oqp__AcM1A@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 8e51f309-208c-4969-e011-08d92008c289
x-ms-traffictypediagnostic: HE1PR03MB2988:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR03MB2988848D623384E6F1CAF294AD249@HE1PR03MB2988.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IbXcFVZlpyq9DOvVrZFjNBarxWpC3eOjSj5+kfvbcgg8ebvNfZo1aH4GDn6/bcyCkJTu2Nx4VIoheUkmpowVHAYTh3MCMzQOFxyF3CnBwSCth7qLmZVPgOrrcOipqtcbZxgdJ6OCKV+Itnf1ZsqRnyPH3R0jyka2oxeeCbXQESZyOlrt+gL4bAZbSJeI68dT0Nq84MvB5EvoAPrBe4uqm2t79g0xd14n7B4xBy4z38b/RAs2Q6lDN6EtGZonbMZ88IihlqQ4rnonKQNqe/zj6HVErDoeEkTZdwkmVOqC8npSg6iAYLhojcUadyNBR5KHm0ANaQN5hAd37wTAp803kMqzME1eq5uPjWUP9F8mGpZXOD6JnLMk+jjBZObEPQRbQClgLE+hbLpBoy1it7KNgdcnWoUy4xANLGW/s6hsgnNxL+OYB1Y7xw8L841w5mztj+aXm8UYEWeq5J67KH26CaB+/R3RxYMW2LpfvRz/Jqc9E7wvsTj1gmSyV8bOg8MewQGfChml4bX3ZAb/6d61Dz0T9TIuSAXIEPsFWl3H3uxTHEdwRADbo2s1X+d7QKj4YUV7I+/A2x2W3pw5DuDqc9dCjb5Z8bS4XWD1xxLWQ0k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(346002)(366004)(136003)(396003)(4326008)(66556008)(6486002)(64756008)(8936002)(478600001)(66446008)(2616005)(122000001)(6506007)(6916009)(83380400001)(5660300002)(66946007)(6512007)(66476007)(2906002)(186003)(71200400001)(38100700002)(54906003)(316002)(4744005)(53546011)(8676002)(76116006)(3450700001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?My9KTVR4ZWhvUTZ4TUQwbE1YaDYxaWtVYW1WVENabDRsWCtScEtEMDNnN1dC?=
 =?utf-8?B?TzNNSzhEMXUvSEdWekhnZ01OMVVZSFpiQnF1M2h0WnFqSjNzeDZ6T1dDL3M4?=
 =?utf-8?B?ZjkvMFZxNHc5NFpIZm11T2JnemxXTkkwaFBlaVFmeko5MDI4bGtRWW96dE8z?=
 =?utf-8?B?MUNSdTM3Vzk3TXlxbHFlZ0VZeW5yNEZqQVRoVHVDSUxQdk1HblVtMWliVHZj?=
 =?utf-8?B?QkNJUzZCK1VJOXludEwzdUFPazByUk1sVUJaTGl0TFd4WGZoTjIvVVVDR1Ru?=
 =?utf-8?B?YUlUMHcxaXcvclJYeTRuU1lSTUc5U3ZkQjYwTDZHMmJ6Ly9YbWloZXNiWmlV?=
 =?utf-8?B?QzNGKzZLcmw4ZU02NHdHVzMxWGZLMFByUVpQT1QwQnRoUHJ4eWlYVVZhRk1j?=
 =?utf-8?B?c0sycXpXSlVYa1pDNTV2QStxQWJvQjhhQzBCaDRoUE1yMnhsWU4rNWtwN0V1?=
 =?utf-8?B?QjV1SXpKNUgvSVlvdmNOM2J4YStRVUYxTnpXMzRJN3MxbXhRekVCQ1hBU0Zq?=
 =?utf-8?B?Q0hPSFBRc0lSbnFpSWkyb3llaDY3SnBGTWE5OERJNytacWQzWlZucHgvSmYx?=
 =?utf-8?B?YzhTT0QyWm16QlRqZ2gwQ0JXVStGZkpZUE9qL0hyTlF3dXZtSGJUR0ZHWXps?=
 =?utf-8?B?OGJOSlBpQ3puM2hnUVRDMTFyMTlxUGM2STJoQ1oyMWpoMjNxcDVaSlo2Q3R6?=
 =?utf-8?B?ZVp6cDZERHcrU2QyR0lrSlMvdERMNjdod2VNa1VyYnZ1c21WM1lDQVdNNWM4?=
 =?utf-8?B?M2FHY1Z6S3o3RkpTYkZicmt6L3VqRUo2TUl6eWVIbE5ZVHVmRlMyeGhZaDcr?=
 =?utf-8?B?STc4RWszTXhicU16ZXBxNEExMmF3V3ZhOWVJUC8vZXpDVXpVbEViNmxlU1V3?=
 =?utf-8?B?RVVzcXVqNXJSK05jQ3IzREwrdy9CQkZXVnJEOG9kWWNNWDFOWks2bDJEVUVh?=
 =?utf-8?B?YWdXSkZwRGN2YnVSaVgyYko4WG1LT25RMkNsTnpBNzA5dWIxNDB2dHlKc2p4?=
 =?utf-8?B?ZmRHTFp6QXBkM3ZBaE9aUHp3YkpIbEgwQ3VHVm90bDZVZmd4VWQyN1hQVFVu?=
 =?utf-8?B?QzZrZndqKzk4b0ZJM1NUcEhqSzBLaXpQcHhXRisrWWYrdDJPc0MyeHhOMno3?=
 =?utf-8?B?SEZ4ZXUwZ1dQNUd4aVVyRk9PZnZYVnpvTUlqVFQxNStab3RYMFVXbHYxNWNL?=
 =?utf-8?B?TE5tcGlRTTEwQnJ2eHlOUzlSWll2NzBpYXdSRWpSMXJQcUJheXMwbWhlV0Jj?=
 =?utf-8?B?NVJGZENMYUNoZHNPSFVHSUl0WVhFV2hKWFlsVktLOWJVVDlxSVpKalphZUhX?=
 =?utf-8?B?QTkzNHRGREJjQ2JoKzBRRGFrS29tck5LNU5PeG9BbHpPWHBTSFlUV1hlaEdi?=
 =?utf-8?B?R1pHbHppNjltRE90amJmeHlkOHNzT0piOXFsYnFlUTI5MnF4cjBXaGtaN0NH?=
 =?utf-8?B?UUx4SlBRMHBCVHJ5L2QzV2pGWWEvVldXL3p3YWxhNWRjc1JsTEtwMTF0bnVz?=
 =?utf-8?B?Z29aLzFab09yY0JCV1haY0VvZU54azhEUmFnVG9yNnJycGl6UnNDZkJsVUZy?=
 =?utf-8?B?YklnWnhhNXFoWGJ0NmdwMjBXSEdVMkErcXpkenVmcm1BU2ErZCtaOUhUcHhn?=
 =?utf-8?B?aEhrSllCWmJzTGFRY2ZTU2wxWlR2d2tudFUvTDJxZm4yS2lvR3VlZkNQRUhy?=
 =?utf-8?B?R1FPNUtyZys0NlJGd1JEWndEUGQ2ejBuZDhOVjdHa3JiZ1RaclF2SzZDNk0v?=
 =?utf-8?B?NStNc0lLbXc2L3J2UlBmUm8yek4yaTl4ZmJpWW52K3hORzVCemlybERsSEV1?=
 =?utf-8?Q?cDZpqDFycQHct9nUA+PciLcJqPhcAqcWnOMVs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <54AD45E6768BEC449CFF68A3F037A69C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e51f309-208c-4969-e011-08d92008c289
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 05:40:24.4839
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C0K8gdISIPJE1fs0uaWtobc9si11mjG4aqoGmo5b5Irdq8cXMpk+mtcPOzfqY77RRHzHx6duALd5w/OzPyInKTCijqDxBZSganvLTHedZd3vBwvF0apQMBIc80X/6NWy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR03MB2988
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjEtMDUtMjUgYXQgMTc6NTEgKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6
DQo+IE9uIFRodSwgTWF5IDIwLCAyMDIxIGF0IDE6MzAgUE0gTWF0dGkgVmFpdHRpbmVuDQo+IDxt
YXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IHdyb3RlOg0KPiANCj4gPiBVdGlsaXpl
IHRoZSBncGlvLXJlZ21hcCBoZWxwZXIgYW5kIGRyb3AgdGhlIGN1c3RvbSBmdW5jdGlvbnMNCj4g
PiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0aW5lbkBm
aS5yb2htZXVyb3BlLmNvbT4NCj4gDQo+IFZlcnkgbmljZSENCj4gDQo+IFJldmlld2VkLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQoNClRoYW5rcyBmb3IgdGhl
IHJldmlldyBMaW51cyENClVuZm9ydHVuYXRlbHkgSSBtZXNzZWQgdXAgdGhpcyBhcyBJIGZvcmdv
dCB0aGUgY292ZXItbGV0dGVyLiBJIGFtIHNvcnJ5DQppZiB0aGlzIGltcGFjdGVkIHRvIHlvdXIg
Y2hlY2tzIGZvciB1cGRhdGVkIHBhdGNoIHZlcnNpb25zLiBJJ3ZlIHNlbnQNCmNvdXBsZSBvZiBu
ZXcgdmVyc2lvbnMgYWZ0ZXIgdGhpcyBvbmUuDQoNCkkgZHJhZnRlZCBhbmQgc2VudCB2MiBidXQg
d2FzIG5vdCBjb21wbGV0ZWx5IGhhcHB5IHdpdGggaXQuIFllc3RlcmRheSBJDQpzZW50IHYzIHdo
aWNoIEkgdGhpbmsgZGlkIHRoZSAicmlnaHQgdGhpbmciIC0gYnV0IGl0IGFwcGVhcnMgSSBoYWQg
YQ0KYnJhaW4tZmFydCBhcyBJIGZvcmdvdCB0byBjb252ZXJ0IGJvdGggb2YgdGhlIG90aGVyIGdw
aW9fcmVnbWFwIHVzZXJzLi4NCg0KU28sIEkgYW0gaG9wZWZ1bGx5IHNlbmRpbmcgb3V0IHRoZSB2
NCBzb29uKGlzaCkuDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5lbg0KDQo=
