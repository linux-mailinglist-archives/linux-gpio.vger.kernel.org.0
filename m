Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 190CF2DD0B1
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Dec 2020 12:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgLQLpt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Dec 2020 06:45:49 -0500
Received: from mail-eopbgr1410095.outbound.protection.outlook.com ([40.107.141.95]:59558
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727331AbgLQLps (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Dec 2020 06:45:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lO3LKfB3SXo836KjX6Fy98/wp4Drap8YVSZOf0h4jdcVm2l/Qxp3fLBghj0007Y4KtkBZrphwpe3tJIs51VVgUA8aLWRQXTaGREmT/NZs1o7e3ooKRxPGiWyqA0H/NGI+fvFSGVi8anXIaZFEVxkoW+GlaV9OArQRdlj3FwO6Y/qdBJO3TINi97V//9V9rhBSh46ebDNRKoMUpYGAC1t6bS9g1cHwAHLtLbvzJa0hNle5D8ycnCQeT+1yRvALJLGFqBwT/3bsEkGtYOKehk7tsNE9P+LtAA3dfV6qLYORp9gUU1oXt7w5nhwSW14gczRFfpWFQa9H+0zn6WZw0Rf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlOSNCbLDxDNX8z7d+5QOA4HT1Y3nbWPKJIPFEimhSA=;
 b=PMTsiDYq5w54XBwX4dUcgxd/W8ux3AVflzAdYPEjZTdNexbzDvFa9T9l3fS7CqwaL2tgyuWljqM14MVtTyJqd305NeCFYagMQRIvNdQtaodPdAIa2Gl1CxPdD7+yGs43zEnl41IgZ0gRSfnvXuwNVxQIBDbUwHt6fFdYasUqDuCo19ikTZ2X3nG3f/LjvpzT7IKU+f2MPlXxA7wsa6LqsxXCtTdGCwdsg3rZ3QA66xzm5sQ5RIOnjCKE4HyKxPnxN50qbSJuNTk46Ad5G4s3utwQUMMdlcSpg7yQFVxafJDCZx+TR3E1O2df7ZJuhCOvk0qapa2A1E35sWPE/E07Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlOSNCbLDxDNX8z7d+5QOA4HT1Y3nbWPKJIPFEimhSA=;
 b=AsBavk0BHzhxX4Mz5+J237Q6tK68RzxaZ9dZSRE9wF/mAoANZy78J1dyLZsvzOBhptC1MvG75ZH3sgycvbAgyI+wtu5J4uAaD7gp6tQtvPz8bH3aENEE1EKcsUoS5AVIDlidLh7IQURSHN5ITWjcmRQTOY9s/2DVjYKGjXs2DoQ=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5769.jpnprd01.prod.outlook.com (2603:1096:404:8058::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 17 Dec
 2020 11:44:25 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 11:44:25 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Lee Jones <lee.jones@linaro.org>
CC:     "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "matti.vaittinen@fi.rohmeurope.com" 
        <matti.vaittinen@fi.rohmeurope.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Topic: [PATCH v3 12/12] mfd: bd9571mwv: Add support for BD9574MWF
Thread-Index: AQHW035u3m33V2nmCUKDwzElbKQtR6n528cAgAFQi+A=
Date:   Thu, 17 Dec 2020 11:44:25 +0000
Message-ID: <TY2PR01MB36925C86A13F71636411785ED8C40@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-13-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20201216153738.GN207743@dell>
In-Reply-To: <20201216153738.GN207743@dell>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:9c6f:5558:c8d7:d013]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 29a4bbef-3d8a-4e6a-7155-08d8a2811a8b
x-ms-traffictypediagnostic: TYAPR01MB5769:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYAPR01MB57696342AD51ED38D9A1DBA6D8C40@TYAPR01MB5769.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y2ama1FwsLEevhydpeNkMZLonNg24Ku2hdcbSwAGW5jhfD9PSwewYHF0I+hpmnsb4317I07Ku4IS8Sd6pAkhNZnCzk+9qdhqKjSuOVqHfTLu3wj0GAgZKXGMt5UbbVpHtGhiwHR8fidHbZmGL9a4sj9ZKX4G/I7lTWpAoADjyEBjc/s+bkg2VFEhBOFV9MYNZeMj85nvikLu7f43n04oLr8aErr+Oe0JBvIwhpCnKMAj5UBAhK5Xztsh+HdFw7SjF5/gXFHLn95dF81XRyXPctkjiehulAYK5Kw+39TKKuIFayHNtnPWOdFRjDRsmtgigbpTIS2b2248tGu+uUWK9Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(4326008)(6506007)(52536014)(478600001)(316002)(66946007)(86362001)(66446008)(66476007)(71200400001)(64756008)(33656002)(7696005)(54906003)(2906002)(76116006)(83380400001)(7416002)(66556008)(5660300002)(8676002)(8936002)(186003)(9686003)(55016002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NEtrT280c3FyenNDTG50N25YendTY0FuZ3hWcFYxYkVIUWo0RU1IWEFpSWdQ?=
 =?utf-8?B?WERMTnJiMDBqZ1d2emljU2ZLMHVPcXNRUHk4NkRJVU9Nc2NFSEk5TmRtM1Vu?=
 =?utf-8?B?QlhNUDRlUG1qNzJyMU5UNVFYUnhjNDQ0UDdpT1dFQ1ZVdUxpYmJ0UVV5Q09F?=
 =?utf-8?B?Z2VBWjlwSzBCOTdhc2QzM2t6MHFGV3d2R1RaT2VvYUNRTUtuYTZTalR2dDYv?=
 =?utf-8?B?d0VSMFVVUnBPTVBzdVN4ZGZhckJsYy92UXRWeHRBNzd1U0NZelRtTk5wSkMr?=
 =?utf-8?B?aGVhL2g0MjlnaVM5VUI2bXZZdEh4VUpBdnZtSDhyRFZBc0xmTjZqWUVCdFBH?=
 =?utf-8?B?ZndGaHptb090Y3pYcWZEU2U2N0FuSi8zYTVWVnhjeVgrY1UzeEJiajE4TGxD?=
 =?utf-8?B?YmZlTndudnBHTU03RWk1QlRDU0I3b0MxU2QxZFQxT0VGOWMveE5TM1lENFl6?=
 =?utf-8?B?T2xSZEtrUWk5NFh3ODd0SEUvaDJFeUhmUW5ROEtGS2R5UGoybmtVWmUrNEhw?=
 =?utf-8?B?SENnaUlaUGV1N1FQZlk1aks5K3NORUt6OFJRazFaNk81WDBCbnFuK0pqbDFi?=
 =?utf-8?B?M0MzeFhLazR6THBzbU9VUm9KQkx0Q3B4enhVOEVxNThzMHRQWHUyWTNOQS9m?=
 =?utf-8?B?K2JRWXE5MmZPMjZWY3l1czU1a0trdFNZVXh0WDhFYXc3SU82TzFPYWEzdEp6?=
 =?utf-8?B?MHI0U0w5S09KTzZzdTVrV0NyTWJheUs1RnQ0N1duV2UyZ3B0N2k2Q1NIWWRQ?=
 =?utf-8?B?cTVCS1psbXdkZ01oTkdxbmtNRkhPOEU3YnAwYmdpUlBwckN6d0xLVFpFdkkv?=
 =?utf-8?B?dThhaHV3dHVQMjZoVFNremprWWdTL0NwSDI1Z2RVbENYd3ozenpBYjVvVzhn?=
 =?utf-8?B?WXJYbWpwRWR1cDZodzJobXhPZGw0cmJhQWJaeDNXL3lUelpUUnpDVDh3UElG?=
 =?utf-8?B?RVY2enU0clVZQXNjVDI4d0NCZldBM2R5R3FLbEhTeWF2VS85SjVjYkIwNzFD?=
 =?utf-8?B?amFGbTgwaEc0VGlYRk8yVzdwRzlHTXNNQi9mTWlQczhHaDZuYWZiYS9WM29j?=
 =?utf-8?B?VU5ZU1NqeS8rYm41K1lQMjZMMzJpdXZkN2tTMkpObCt2VXdLU2pSK3c3Q3Jq?=
 =?utf-8?B?SnYrNVljQklBcDQ2TGFRU0t3MUdLaE5aM1hUUERjRUdCQ3l0UUltSlV0OCs5?=
 =?utf-8?B?WXRMVFNiN1JKWWkzMjRvU3NVM2t0emR1RlJNVHR0ODZoM0JQNVZaRkVuVm03?=
 =?utf-8?B?eWtZQnVCY0FQdUxUVUMrU3Jqa1BQcitudmxoZHJwTlIxc0VnMUdBR1M5YkJG?=
 =?utf-8?B?Nnk3YlhRMTYwZGJjTlVIcks4T3BOQjdTcW43YUtWVGlpK25lNnpOUjdjSERQ?=
 =?utf-8?Q?fYQ/VgSet1OdQnJ1Ne3mfE0rI91kN/xo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a4bbef-3d8a-4e6a-7155-08d8a2811a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2020 11:44:25.1882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RAXzgjuACEbvBodA5NjjhbHK805I3my0SO0MGQjuzrpQeMqijUZcXfpwXXi8y/uiFvnhk6Xivq0hPVJnT7Tjlao0Y4qvSZElUPxWrXJIp7Qidr3NK2srleE9c7bvGfn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5769
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGVlLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3IQ0KDQo+IEZyb206IExlZSBKb25l
cywgU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDE3LCAyMDIwIDEyOjM4IEFNDQo+IA0KPiBPbiBX
ZWQsIDE2IERlYyAyMDIwLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gRnJvbTog
S2hpZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRAcmVuZXNhcy5jb20+DQo+ID4NCj4gPiBUaGUg
bmV3IFBNSUMgQkQ5NTc0TVdGIGluaGVyaXRzIGZlYXR1cmVzIGZyb20gQkQ5NTcxTVdWLg0KPiA+
IEFkZCB0aGUgc3VwcG9ydCBvZiBuZXcgUE1JQyB0byBleGlzdGluZyBiZDk1NzFtd3YgZHJpdmVy
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2hpZW0gTmd1eWVuIDxraGllbS5uZ3V5ZW4ueHRA
cmVuZXNhcy5jb20+DQo+ID4gW3NoaW1vZGE6IHJlYmFzZSBhbmQgcmVmYWN0b3JdDQo+ID4gU2ln
bmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVz
YXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21mZC9iZDk1NzFtd3YuYyAgICAgICB8IDg2
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiAgaW5jbHVk
ZS9saW51eC9tZmQvYmQ5NTcxbXd2LmggfCAxOCArKysrKysrLS0NCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCA5OSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jIGIvZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMNCj4g
PiBpbmRleCBjY2YxYTYwLi5mNjYwZGU2IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWZkL2Jk
OTU3MW13di5jDQo+ID4gKysrIGIvZHJpdmVycy9tZmQvYmQ5NTcxbXd2LmMNCj4gPiBAQCAtMSw2
ICsxLDYgQEANCj4gPiAgLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0K
PiA+ICAvKg0KPiA+IC0gKiBST0hNIEJEOTU3MU1XVi1NIE1GRCBkcml2ZXINCj4gPiArICogUk9I
TSBCRDk1NzFNV1YtTSBhbmQgQkQ5NTc0TVZGLU0gTUZEIGRyaXZlcg0KPiANCj4gV2hpbGUgeW91
J3JlIGF0IGl0LCBwbGVhc2UgcmVtb3ZlICJNRkQiLg0KPiANCj4gTWF5YmUgcmVwbGFjZSB3aXRo
ICdjb3JlJyBvciBzb21ldGhpbmc/DQoNCkkgZ290IGl0LiBJJ2xsIHJlcGxhY2Ugd2l0aCAnY29y
ZScuDQoNCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDE3IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1
dCtyZW5lc2FzQGdtYWlsLmNvbT4NCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDIwIFJlbmVzYXMg
RWxlY3Ryb25pY3MgQ29ycG9yYXRpb24NCj4gPiBAQCAtMTEsNiArMTEsNyBAQA0KPiA+ICAjaW5j
bHVkZSA8bGludXgvaTJjLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4NCj4g
PiAgI2luY2x1ZGUgPGxpbnV4L21mZC9jb3JlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9tZmQv
cm9obS1nZW5lcmljLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gPg0KPiA+
ICAjaW5jbHVkZSA8bGludXgvbWZkL2JkOTU3MW13di5oPg0KPiA+IEBAIC0yOCw2ICsyOSw3IEBA
IHN0cnVjdCBiZDk1N3hfZGF0YSB7DQo+ID4gIAlpbnQgbnVtX2NlbGxzOw0KPiA+ICB9Ow0KPiA+
DQo+ID4gKy8qIEZvciBCRDk1NzFNV1YgKi8NCj4gDQo+IERvbid0IHRoaW5rIHRoaXMgaXMgcmVx
dWlyZWQ/DQoNCkknbGwgcmVtb3ZlIGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8gU2hp
bW9kYQ0KDQo=
