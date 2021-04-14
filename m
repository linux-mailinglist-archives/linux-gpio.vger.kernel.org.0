Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF86335F670
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 16:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351888AbhDNOqW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 10:46:22 -0400
Received: from mail-bn8nam11on2046.outbound.protection.outlook.com ([40.107.236.46]:22785
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1349956AbhDNOqV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Apr 2021 10:46:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhQy0+jSuNYK0X/XiqKjNKbwCZxBpY4ZzvcTTclTSg6No3tdd54u244wHDlSx+xr/ev2DLrtu42qf4x3uQ8r+PhNt1PluELagCVY+6twi7VsaLuFsMB8Jge4A+zEMn3A6uj1EBTJJAysFwBUESa7/jTIqRTJtzffSHoNMFPg/sEIw5tvfme+euZegV+fkzXfwDLzBqqipnYNMLF51LrUjtzojIWIvY6pYjtS/Tj2tDwifir7oSPXbPvlls1UbA0Y5lzVEzgC1Z8l6AVvoLmo6FCVMoBZNzXDavA1MKki/03+RHMtr54DUd8vBd4Ebz7ccEU4GMIfJzKaaSru0ruluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSTYy3wMGU23sEAR+Q1DjtbTfft56R5xP4bMB4ppWUE=;
 b=Ight/PYvNN0Qkq7Vc/TcJSnHhdVSFzVqE5nBZDEb7jUA+k3s96Iwvqx/xDG/Gl7C98iaKAzt6TsqFWoZRwEO0JbBFm0OvbkpuR1gwDxUOr7b7XYw5PmJz4K+S5dmKxGcKzjefeiaUgIQ/HumBHlDnLD5JvsO7Esz3HtU3Ez7yOFLK28RbgN6AO9BRtj626lKdgMGC134yQ6vh39UfmLvNmXsAZ4ov6btitzzmSZGpvYWajyWxAUXbCGGtbahXfETKv7xN7jMaWmkPF8HrPKiWfnTiX2Fiq8m1lNZP9QrMmutbS18iYUq5FyXk5NcNC6v5fVbMDfoXC/0O87PHDG/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSTYy3wMGU23sEAR+Q1DjtbTfft56R5xP4bMB4ppWUE=;
 b=sMhwSmh+1Bl5BJp3mge8H7B7H7nMEOKJEbHs4exLVxyIPMuxCJCtDFKjCpaSCm1FleIo16gQfAZn8J0zlwVcFJURJgN64V2Dj+YR8c4RGGsrcT+4ReIvHuY2uxkm7vve/W87v5Dxc36w/UTREiVyeXYGMuLJI5axxKBTcGWHReE=
Received: from DM6PR02MB5386.namprd02.prod.outlook.com (2603:10b6:5:75::25) by
 DM6PR02MB4044.namprd02.prod.outlook.com (2603:10b6:5:9e::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22; Wed, 14 Apr 2021 14:45:55 +0000
Received: from DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::bdf8:e364:ff76:5a5a]) by DM6PR02MB5386.namprd02.prod.outlook.com
 ([fe80::bdf8:e364:ff76:5a5a%7]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 14:45:55 +0000
From:   Srinivas Neeli <sneeli@xilinx.com>
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        Michal Simek <michals@xilinx.com>,
        Shubhrajyoti Datta <shubhraj@xilinx.com>,
        Srinivas Goud <sgoud@xilinx.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git <git@xilinx.com>
Subject: RE: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
Thread-Topic: [PATCH 1/3] gpio: zynq: use module_platform_driver to simplify
 the code
Thread-Index: AQHXLUnQ5yxYlAncvUSZ3jc0NDWaD6qsvx6AgAWKEwCAAdR/wA==
Date:   Wed, 14 Apr 2021 14:45:55 +0000
Message-ID: <DM6PR02MB5386CADF5A10EF28A640AD76AF4E9@DM6PR02MB5386.namprd02.prod.outlook.com>
References: <20210409140806.31824-1-srinivas.neeli@xilinx.com>
 <20210409140806.31824-2-srinivas.neeli@xilinx.com>
 <CAHp75Vddd6ygr4mJ9Z+SuGZmfLcgDLWLZaxby2XE2mX8War-qQ@mail.gmail.com>
 <CAMpxmJW=HWf_NxGpfBkX=utgOTs4+6RtypxnKGtpuYnX=t8rGQ@mail.gmail.com>
In-Reply-To: <CAMpxmJW=HWf_NxGpfBkX=utgOTs4+6RtypxnKGtpuYnX=t8rGQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96451518-943f-4422-8f78-08d8ff54025e
x-ms-traffictypediagnostic: DM6PR02MB4044:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR02MB4044719432BAA44870BBF69FAF4E9@DM6PR02MB4044.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FxRzoSNk+NNpDHObgi1Q1DMX9tH0Ih1fpTj+CgJkFAXJ8R5bRnY7YDZO2Q4zBSyXmTrWjsHFdrZU/j4y9kZ0y3DIOsuRUReAaQAlHPJt8/6KP7oDyquZUCSlXLXUhDBbL2QwwS5BusSXutA9h/BuVJb5H3jTrI5jcSy/nfL3QNytkSPxrA7O/NPnrqrPOWP6ZcHMwrbeu8wiPcqiw9fsxrxXQA2v5KB1zeCutBYioNpOYKZTM2mkc/SbQHM6/V8XC/cB5cniUuYX1TwYK4ifB06YDwKx0Xjz35JUk7YzIWSr2CWyUHt5xm23aVXzRaYGDgU0QochbmG5l+S5gNWPI7kmlXQ+WnegwIlIJfoIFl1FCMDvy4m/KF+eKHlVhTuwa4lwQCZccBWesfFgxJ6x5c/2ozcZz3EXxvM46p/9myAQxJ9GmoarFMtb7X5h4k9c7xB3qyfxaEwtXIIztKKJMIham4tDIench8m3Fuf27PG1Vrn2uzGz2sfWnG7ERYZmtd3np82NE8B8NYpO7YRdl1kPpDBu6np0hcVlPKc22Ixc17c1wgYpbKuVH1nOfWmj9egBNJdz+KkeYKSzLwtm+vsWU0gEqFAx2pA7xnlfJGzRR6LRoQuryzbhfzh4ltTK9Lk9w3VNjuZAfdIpeYkZfVVPF1j4MwBYm9pBQ7Rxim9R2TO6vMdrOfbg9v+QVV/w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB5386.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(39850400004)(346002)(71200400001)(316002)(6506007)(33656002)(53546011)(186003)(110136005)(52536014)(7696005)(83380400001)(122000001)(86362001)(38100700002)(9686003)(55016002)(54906003)(5660300002)(66476007)(66946007)(76116006)(66556008)(66446008)(4326008)(2906002)(64756008)(8676002)(8936002)(966005)(107886003)(478600001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?U2xRSlFKSUVXTUJrMUZCOWJhdzArVmNsWDVDeG1wMXV4UVkxaGY4c0NOdEo5?=
 =?utf-8?B?QmZCc0ZvbTFuSXdzTmhpeWVnSklFcUN1TlhIOGt4dGFaNE44ZjNKSmJSMjYr?=
 =?utf-8?B?Zkd3RXl0anBZdmI3TU1sUXJKMDJpVkVXajdRbW9EY2VvT0JqTFR2V012R3Qw?=
 =?utf-8?B?NzltR21kaDdDWlZSekZQa0s2V05MWlQwSWhxZ1hLM1dkaUxieDRVSENjNG5X?=
 =?utf-8?B?RVo4Uk9jbmlVdnhlaTdJQnFnZnBKV3hrRitTZXJzc2hVcnVhSm9MMlV0WnNC?=
 =?utf-8?B?RDhTVXpQbDEvVDNtWldPM2RDa0U3S2RkNFlzbzZnME1CejBFckFiQkRvcnIy?=
 =?utf-8?B?THA0cXpCSGUyYWdZSU9IMFpRdm1CY1ZTUTkxdjlwd0g3WDNBSit0L1laa25H?=
 =?utf-8?B?SmQ3eHFXODFyU3p6L0QzQlFpeG9iQ05sVWxvMkxVV29pakJ5RGlndk54L2FG?=
 =?utf-8?B?bUJvR0Q0UG9YT1llNzl2bzNrM2M3T0tDclVRc2RLTmdTV0IrU2hvNFp2ekVN?=
 =?utf-8?B?UVBjRzgvNzg5Mk5LZmVqWVZaRXZHYWYyL0E4bGxMcWtoU0E4c2NvR0VpbnMx?=
 =?utf-8?B?WCtHcnBFdnB2SEdkT0liZTZhb0s1UjBrWHhyVWg4QnR1UW5KT29qNWFBSHBP?=
 =?utf-8?B?dG1TUml2Rm9xb2l3VHlIVGgyWTB0OC9xRkxOS1FlRjRiYkpZbUpsRUpoSmRr?=
 =?utf-8?B?OTJWQUpoUlBtTW5wVWdYOTBZYjNHVlZ3RVcvNG14bW1MYTRDeDF3N1pYaDhP?=
 =?utf-8?B?MUVRb2JtZXFmZ2NnSWplTnVxTXJPQVhIc1ZmN1JOaFdJZXV5UGZUd1N2T24r?=
 =?utf-8?B?Q0FCRG56WnRaa3dhMEJpbHQwaFJlNlR1Nm9vOEdLOHBkQ1o3WlEvZFkxZUxR?=
 =?utf-8?B?Sm84Zk5ReFZ1WTF6SFpmQi91eGlnK25PREF0RkxkaDBvUGZBQzNBQ0IwNkhP?=
 =?utf-8?B?MStkNStqVWNUUWpxd0hETkJZSzRxL1BCemlPQzdnVTVncFhRZFRCcHRSa0Na?=
 =?utf-8?B?OW5qUlJDYk1rdUdhdEZ0VXUzUTNvSlExYVdnd2ZQUmFZUzhZc0NadUZYMTV3?=
 =?utf-8?B?bVh6dGJWWm9XNUtNUGN1NU4veTd2bmU5MlA1LzVQK2hTVmxJT1NmcnpYU0FG?=
 =?utf-8?B?bEJCNU9vYzB6R08yTExHdmFDUUVjWC9NQ3JDa2E3eVF0K3hsK3I1eVo3dUtZ?=
 =?utf-8?B?WVRSV1I3Q2tIUC9oS1greXFUWllnUFF1bDIxaHk5YklQclF3UTl5RkpEOEVq?=
 =?utf-8?B?eXBNLzhNUWV0dm9rRzhxQkRqZFdoVnVrVjduZ3hKOVRGd2FXa2szOVNnbWlq?=
 =?utf-8?B?ajlDMEJBN1RiTjNvZGRyTzBWRFJNa2dWRHVHYmc1RHVKQ3VXSVVmWWtTREdL?=
 =?utf-8?B?dW5pcDE4RTArTGtEajlIMEMwdkN6bjdLQmtOL3lFZkxPOE5JSnFpRU1tZ0Nj?=
 =?utf-8?B?djdkQWtjYTFlN3dqbmJIc3RHQTRjT3E1NlZ2b1dubHE0eFgwMnNUNWZIUzB0?=
 =?utf-8?B?Z1hvdXRoYnpDTytlSm1JSnBBbXZ2Um5ycTVUYmJFS3dGaUQ2M1Q4c3JMQzhM?=
 =?utf-8?B?eGdnTm93VjJGN2d1RWdnQ0x0bi8rckJhWjVpdnBjWUVOYS9kUlBkQnZGWlZU?=
 =?utf-8?B?R0FGbVJxdzhpd1ZnNDBFRnJiTXZ3Rnl0a3E4eTlCVW4zYVM5QWlGTWJRSmln?=
 =?utf-8?B?aGdUQ25BUk43NVdxaWx0RjVOUmNxa2FzTWN6TUdUS2M2Nlo5ZUdnREtQOTZC?=
 =?utf-8?Q?AcbwqcHeRJ9qmRbTYP3wiiGYqhgF9T2Zk7vxygJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5386.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96451518-943f-4422-8f78-08d8ff54025e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 14:45:55.3493
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LkSlZfN7HoiVlm4AVXWt76xVNKWkvZfrMYh6FMhW1t4CMNpvq7jFG3DPsmRmm4Qj56c6wIFwCHo3HXk13Qb4kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4044
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SEkgYmFyYXRvc3ogYW5kIEFuZHksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4NCj4g
U2VudDogVHVlc2RheSwgQXByaWwgMTMsIDIwMjEgNDoxNCBQTQ0KPiBUbzogQW5keSBTaGV2Y2hl
bmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBDYzogU3Jpbml2YXMgTmVlbGkgPHNu
ZWVsaUB4aWxpbnguY29tPjsgbGludXMud2FsbGVpakBsaW5hcm8ub3JnOyBNaWNoYWwgU2ltZWsN
Cj4gPG1pY2hhbHNAeGlsaW54LmNvbT47IFNodWJocmFqeW90aSBEYXR0YSA8c2h1YmhyYWpAeGls
aW54LmNvbT47IFNyaW5pdmFzDQo+IEdvdWQgPHNnb3VkQHhpbGlueC5jb20+OyBsaW51eC1ncGlv
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgZ2l0DQo+IDxnaXRAeGlsaW54LmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzNdIGdwaW86IHp5bnE6IHVzZSBtb2R1bGVfcGxhdGZv
cm1fZHJpdmVyIHRvIHNpbXBsaWZ5DQo+IHRoZSBjb2RlDQo+IA0KPiBPbiBTYXQsIEFwciAxMCwg
MjAyMSBhdCAxMjowOCBBTSBBbmR5IFNoZXZjaGVua28NCj4gPGFuZHkuc2hldmNoZW5rb0BnbWFp
bC5jb20+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+IE9uIEZyaWRheSwgQXByaWwgOSwgMjAy
MSwgU3Jpbml2YXMgTmVlbGkgPHNyaW5pdmFzLm5lZWxpQHhpbGlueC5jb20+IHdyb3RlOg0KPiA+
Pg0KPiA+PiBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKCkgbWFrZXMgdGhlIGNvZGUgc2ltcGxlciBi
eSBlbGltaW5hdGluZw0KPiA+PiBib2lsZXJwbGF0ZSBjb2RlLg0KPiA+Pg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBTcmluaXZhcyBOZWVsaSA8c3Jpbml2YXMubmVlbGlAeGlsaW54LmNvbT4NCj4gPj4g
LS0tDQo+ID4+ICBkcml2ZXJzL2dwaW8vZ3Bpby16eW5xLmMgfCAxNyArLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNiBkZWxldGlvbnMoLSkN
Cj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLXp5bnEuYyBiL2RyaXZl
cnMvZ3Bpby9ncGlvLXp5bnEuYw0KPiA+PiBpbmRleCAzNTIxYzFkYzNhYzAuLmJiMWFjMGM1Y2Yy
NiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tenlucS5jDQo+ID4+ICsrKyBi
L2RyaXZlcnMvZ3Bpby9ncGlvLXp5bnEuYw0KPiA+PiBAQCAtMTAyMCwyMiArMTAyMCw3IEBAIHN0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHp5bnFfZ3Bpb19kcml2ZXINCj4gPSB7DQo+ID4+
ICAgICAgICAgLnJlbW92ZSA9IHp5bnFfZ3Bpb19yZW1vdmUsDQo+ID4+ICB9Ow0KPiA+Pg0KPiA+
PiAtLyoqDQo+ID4+IC0gKiB6eW5xX2dwaW9faW5pdCAtIEluaXRpYWwgZHJpdmVyIHJlZ2lzdHJh
dGlvbiBjYWxsDQo+ID4+IC0gKg0KPiA+PiAtICogUmV0dXJuOiB2YWx1ZSBmcm9tIHBsYXRmb3Jt
X2RyaXZlcl9yZWdpc3Rlcg0KPiA+PiAtICovDQo+ID4+IC1zdGF0aWMgaW50IF9faW5pdCB6eW5x
X2dwaW9faW5pdCh2b2lkKSAtew0KPiA+PiAtICAgICAgIHJldHVybiBwbGF0Zm9ybV9kcml2ZXJf
cmVnaXN0ZXIoJnp5bnFfZ3Bpb19kcml2ZXIpOw0KPiA+PiAtfQ0KPiA+PiAtcG9zdGNvcmVfaW5p
dGNhbGwoenlucV9ncGlvX2luaXQpOw0KPiA+DQo+ID4NCj4gPg0KPiA+IEl04oCZcyBub3QgYW4g
ZXF1aXZhbGVudC4gSGF2ZSB5b3UgdGVzdGVkIG9uIGFjdHVhbCBoYXJkd2FyZT8gSWYgbm8sIHRo
ZXJlIGlzDQo+IG5vIGdvIGZvciB0aGlzIGNoYW5nZS4NCj4gPg0KPiANCj4gWWVwLCB0aGlzIGhh
cyBiZWVuIGxpa2UgdGhpcyBzaW5jZSB0aGUgaW5pdGlhbCBpbnRyb2R1Y3Rpb24gb2YgdGhpcyBk
cml2ZXIuDQo+IFVuZm9ydHVuYXRlbHkgdGhlcmUncyBubyBkb2N1bWVudGVkIHJlYXNvbiBzbyB1
bmxlc3Mgd2UgY2FuIHRlc3QgaXQsIGl0IGhhcw0KPiB0byBzdGF5IHRoaXMgd2F5Lg0KPiANCkkg
dGVzdGVkIGRyaXZlciwgZnVuY3Rpb25hbGl0eSB3aXNlIGV2ZXJ5dGhpbmcgd29ya2luZyBmaW5l
Lg0KQmFzZWQgb24gYmVsb3cgY29udmVyc2F0aW9uLCBJIG1vdmVkIGRyaXZlciB0byBtb2R1bGUg
ZHJpdmVyLg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzgxODIwMi8N
Cg0KVGhhbmtzDQpTcmluaXZhcyBOZWVsaQ0KDQo+IEJhcnRvc3oNCg==
