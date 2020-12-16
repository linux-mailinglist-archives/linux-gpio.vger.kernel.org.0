Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3563C2DBCE8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 09:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgLPIqo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 03:46:44 -0500
Received: from mail-eopbgr50048.outbound.protection.outlook.com ([40.107.5.48]:59777
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725972AbgLPIqn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Dec 2020 03:46:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5j1u4RN2Ahgs9xQOOrLHdl5Lwdapx5+CdW4L6FNLu4hGFbLW7XQFZgh8VkHUXwr2NznZLdik4SyPCcPDYK4++EPSeyepYAeNH9n97sdqanCYKC7e464n2CkYYj+nVaU/1sjUQldZw+SJpu+O7shAu75+SPjrMR8CL4IszFg4iLXlTbBxuI8lm+OIkkMdYWfp2mr04NO++VUb/wTPsls2lV4oX9HEM7QecbritQ6b77bZMuwELlhqs5SXrbwZszj5AC2MW1lmJK3uDpLSwT/7Kv3msN7wFiFECZ1cBOCVqg9MdfFPcga02Hc4o0DBAQrRsZZgoHD0LxA0Yq38Cyd2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EodDKuhy3Zx1YwKgP1J3q7qCCUPepRkQB7YrIHnMqwQ=;
 b=eUzoNcQJlyyNMkYPWuJez9ZL/Gxw3pOZ70fshBXBH3FS6+pf0ZFirZfQljUJjSrXKuL98AEUm9wsTQbZav9dluNXHoF7CN/gqh2U0fUHrOlFNBsERODzU4sdFJw8bq2mL5mcZCEyf2NOG3v0eAWOcY51+56WO7tG9vSh21ziq/b5kX0k2/GIYiqHOw8Pdyt/5N5aNUkpcfkYPjMhkfZXMMJol9CPQz1AK4biJYT9f3PzYemuaa0YDJOsilaZccI4brhw02uai/2M8XeKPDeaLGgycGzNyMyhpthZG9FRYK46gQIW8GtISuWzJy7lCPnxkdmU+u01s8v4ZFddmmbvog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EodDKuhy3Zx1YwKgP1J3q7qCCUPepRkQB7YrIHnMqwQ=;
 b=D5xSneZW+72IQfnjqTP6ZTEWjdeKS9u3ux666fmX3zR/4gRwX/VDiJ/y8n/+F9GWZwmCpFumuN6ZgIEDep2lpzUhPzw7Z9nCwhCSrTmKvBVoKQQLYJu3m4kyabkmg10H39eQTxkWE3PHTZpFyzgakUFZVcwQWncKMjiuGi8BbFA=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2316.eurprd03.prod.outlook.com (2603:10a6:3:2a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.25; Wed, 16 Dec 2020 08:45:19 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f1f1:eb1d:2bf5:eb87%7]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 08:45:19 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "khiem.nguyen.xt@renesas.com" <khiem.nguyen.xt@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 11/12] mfd: bd9571mwv: Make the driver more generic
Thread-Topic: [PATCH v3 11/12] mfd: bd9571mwv: Make the driver more generic
Thread-Index: AQHW035y6BNLGpWx2EuQSEwrpEd9qan5YvcAgAAFjwA=
Date:   Wed, 16 Dec 2020 08:45:19 +0000
Message-ID: <34151f1bf2dd316e7c72605788559a9388b23d3d.camel@fi.rohmeurope.com>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <1608104275-13174-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
         <4021c3f04bf8c4dcbcb015056455c4acf9e71b6b.camel@fi.rohmeurope.com>
In-Reply-To: <4021c3f04bf8c4dcbcb015056455c4acf9e71b6b.camel@fi.rohmeurope.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b054970-c0c2-474f-f42b-08d8a19eeb60
x-ms-traffictypediagnostic: HE1PR0301MB2316:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2316FABA69398A77182D32DCADC50@HE1PR0301MB2316.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gH/czFR8S0zT4MrnJ6QRxGbLDP/IJxOgaxKv2uT8VfdgECOi/jOKf4DRKJ0J7MzqRS2g4NFLaFb0yK22/jxcav9jRNlUa4gzB6XMZPuO5UN4TZtRoSQFpHF7HnQFlsQ/SidioPMWAHTLy0E/pJi/oJRuGIOWYN/JjZ53q7AhEA9q+FNiAbM8mf+b8X8T5tfXTLopFrbnJwwBnO24xZVQzWQoRttkgWFqI3p4kWQ147/VDDo9dh2IFY+iCn4HdQBu76W2LRHrV0gUHjK8LGXHTBhW8L11n2RkDCYEKyr3IiPrMDCdw9/V4uBOSM37/gmEzl7Ctr0PkWHP2SBBChJV6O1z2ClDjDkN/4H3h7JB4WfE4EkF9wtW+6BvVzWtHEHS
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(366004)(136003)(376002)(2616005)(66446008)(4001150100001)(64756008)(66556008)(8676002)(66946007)(3450700001)(7416002)(5660300002)(83380400001)(8936002)(6506007)(66476007)(478600001)(6486002)(6512007)(110136005)(86362001)(76116006)(54906003)(316002)(2906002)(4326008)(186003)(71200400001)(26005)(41533002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dlorMW5MOW1zS2RWcUJheWZwNXBTZW9udEJoam51L1VFWXhnZzJaYUI0WE1m?=
 =?utf-8?B?STgyTndlcVMyNytTMExZSmlxYkVpSmN3OCswZUd5d0Fkc3hKUXRBTjZVQWxU?=
 =?utf-8?B?cTNvZ0NpTWZITTV0ZVNmTVZMV1RjcXdiZWJNYlM5WjFXUkIwYndUVXM5QkxT?=
 =?utf-8?B?QnJpak9yUGNFNzFJbUdSdmZhNlBvUENnTHFZRjUvUVlTWTBDZ0g5NC9QWkNG?=
 =?utf-8?B?WFFTa2FLeC9weGhUV3d5Tk5WOVBwV2g1R2h3ZjV5MVd1TTQ5WjVBamhldDJP?=
 =?utf-8?B?TnpoVEd2L0xyTjFOeFdlSWVZbm9OQjhsWUFOVVFUOG5NZVFXUTQwanBDdTIr?=
 =?utf-8?B?MUNCeFpoRVVDZTRiakdIR2kxc0xBRVh1MTE1KzJrTHVraXlyRVpkN2FvRFBJ?=
 =?utf-8?B?bTBndFYvRkJUditBd2V3UDdwQ2JDbTczMmkrZEYrSnMzWjhiRytZMkxCRUYx?=
 =?utf-8?B?WFRsVFpvazJLMTlPdnN5angyMkpKcHpwaEwvdVEvSjRETW5pbkpNSGxScjF3?=
 =?utf-8?B?aDUxRnVxSzNjMnN1ZWU5Y2VRVUE5OHFQeWZ4ZlFUZS96OUJFV01WTncrZUtC?=
 =?utf-8?B?L3NBZCtpb21iclArYUk0UmhISEhaVkVONEQ5a0VwM3ViTW4ybTFOMzVvQmlX?=
 =?utf-8?B?VnpJRFI5OW5ROHVZY0lxNjRLZWY3eGRWMDd4Zm9SYS9mdkZMRUlqRDR5MW5S?=
 =?utf-8?B?VGFlbkMrNTZ6Y3VkV1ViUDZ2eEZQdTEwMHlJZGh2YS8xWHV4eFpuUnV2VEtJ?=
 =?utf-8?B?cDN0OGczTnBCeGg5b05zL29Vb0VHaE5LRmI1Vm1ZU0hnUU9CcGNRa3VMU3Ur?=
 =?utf-8?B?cGJNc25uUUVwRzFaYkdaQkNvbVlHc0ZvNEpsRVh6NWlJaHlKenFrRXVCZFRQ?=
 =?utf-8?B?SkJTM0swNlRpQTE5UklhZlNQQmVZdnpPa2NwMXdGMlF1QlNiSVlIbDR1SkIy?=
 =?utf-8?B?R1BUVlZlb2wwQURRMVpaYXFFZ0dxRDRqU3dFamM5aENreXVlSlhXR2RZM1ZL?=
 =?utf-8?B?UGJpaHdaQlllS1kzR3d3K3p3L3YvQ1dYc1VYV0lGd2JHNGk3RWhPU2hudWZD?=
 =?utf-8?B?TjFlN1Rya010QzNhbmVhMGNTUVRqbHQ1Z3hnemNoZVo3blBMOXZUeFZ4RUVE?=
 =?utf-8?B?aE1MMDVraU1ldFB3bGJodHFWYWpZRzJXUEducVcwYTBRVnFuYTg0TVA3aVAy?=
 =?utf-8?B?U0hzYWtTUThDUTNKYjBpZXJsRzZQd2cvN1lTUzFQNVd5dVFSakRxRGhyOThr?=
 =?utf-8?B?bTlxbkdPWjdIY2haZ2VKT0hHZGJ6dGFhR1FlWG9EendTb01BWHJvckRIYTBL?=
 =?utf-8?Q?ICKkyHzikCdStU38OmpXBl9kHCj3A4qEIo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <04DFBB65B78AAB4894857E15B5CADA86@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b054970-c0c2-474f-f42b-08d8a19eeb60
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2020 08:45:19.7100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYvMqfzq+V+y2QGMPXfPJTV+yoFNqcDSubg5IYGBW26uv2AsATFFmWoXjmWt8rAq9YffvTNf8qiFmKMIEb4YpU1ySW1QE/4VmIuWGvlK5DI4KqRfbky1oZpZ61x1s3dX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2316
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBXZWQsIDIwMjAtMTItMTYgYXQgMTA6MjUgKzAyMDAsIE1hdHRpIFZhaXR0aW5lbiB3cm90
ZToNCj4gT24gV2VkLCAyMDIwLTEyLTE2IGF0IDE2OjM3ICswOTAwLCBZb3NoaWhpcm8gU2hpbW9k
YSB3cm90ZToNCj4gPiBGcm9tOiBLaGllbSBOZ3V5ZW4gPGtoaWVtLm5ndXllbi54dEByZW5lc2Fz
LmNvbT4NCj4gPiANCj4gPiBTaW5jZSB0aGUgZHJpdmVyIHN1cHBvcnRzIEJEOTU3MU1XViBQTUlD
IG9ubHksDQo+ID4gdGhpcyBwYXRjaCBtYWtlcyB0aGUgZnVuY3Rpb25zIGFuZCBkYXRhIHN0cnVj
dHVyZSBiZWNvbWUgbW9yZQ0KPiA+IGdlbmVyaWMNCj4gPiBzbyB0aGF0IGl0IGNhbiBzdXBwb3J0
IG90aGVyIFBNSUMgdmFyaWFudHMgYXMgd2VsbC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBL
aGllbSBOZ3V5ZW4gPGtoaWVtLm5ndXllbi54dEByZW5lc2FzLmNvbT4NCj4gPiBbc2hpbW9kYTog
cmViYXNlIGFuZCByZWZhY3Rvcl0NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9k
YSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTog
TWF0dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+DQo+IA0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21mZC9iZDk1NzFtd3YuYyAgICAgICB8IDk1ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLS0NCj4gPiAtLS0tLS0tLS0tLS0NCj4gPiAgaW5jbHVkZS9s
aW51eC9tZmQvYmQ5NTcxbXd2LmggfCAxOCArKy0tLS0tLQ0KPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDYzIGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21mZC9iZDk1NzFtd3YuYyBiL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jDQo+ID4g
aW5kZXggNDllOTY4ZS4uY2NmMWE2MCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21mZC9iZDk1
NzFtd3YuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWZkL2JkOTU3MW13di5jDQo+ID4gQEAgLTMsNiAr
Myw3IEBADQo+ID4gICAqIFJPSE0gQkQ5NTcxTVdWLU0gTUZEIGRyaXZlcg0KPiA+ICAgKg0KPiA+
ICAgKiBDb3B5cmlnaHQgKEMpIDIwMTcgTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0K3JlbmVzYXNA
Z21haWwuY29tPg0KPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjAgUmVuZXNhcyBFbGVjdHJvbmlj
cyBDb3Jwb3JhdGlvbg0KPiA+ICAgKg0KPiA+ICAgKiBCYXNlZCBvbiB0aGUgVFBTNjUwODYgZHJp
dmVyDQo+ID4gICAqLw0KPiA+IEBAIC0xNCw2ICsxNSwxOSBAQA0KPiA+ICANCj4gPiAgI2luY2x1
ZGUgPGxpbnV4L21mZC9iZDk1NzFtd3YuaD4NCj4gPiAgDQo+ID4gKy8qKg0KPiA+ICsgKiBzdHJ1
Y3QgYmQ5NTd4X2RhdGEgLSBpbnRlcm5hbCBkYXRhIGZvciB0aGUgYmQ5NTd4IGRyaXZlcg0KPiA+
ICsgKg0KPiA+ICsgKiBJbnRlcm5hbCBkYXRhIHRvIGRpc3Rpbmd1aXNoIGJkOTU3eCB2YXJpYW50
cw0KPiA+ICsgKi8NCj4gPiArc3RydWN0IGJkOTU3eF9kYXRhIHsNCj4gPiArCWNoYXIgKnBhcnRf
bmFtZTsNCj4gPiArCWNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBfY29uZmlnOw0K
PiA+ICsJY29uc3Qgc3RydWN0IHJlZ21hcF9pcnFfY2hpcCAqaXJxX2NoaXA7DQo+ID4gKwljb25z
dCBzdHJ1Y3QgbWZkX2NlbGwgKmNlbGxzOw0KPiA+ICsJaW50IG51bV9jZWxsczsNCj4gPiArfTsN
Cj4gPiArDQo+IA0KPiBJIGRvIGxpa2UgdGhlIHdheSB5b3UgcGxhY2VkIHRoZSB2YXJpYW50IGRh
dGEgaW4gb3ducyBzdHJ1Y3RzLiBXZWxsDQo+IHRob3VnaHQuDQo+IA0KPiA+ICBzdGF0aWMgY29u
c3Qgc3RydWN0IG1mZF9jZWxsIGJkOTU3MW13dl9jZWxsc1tdID0gew0KPiA+ICAJeyAubmFtZSA9
ICJiZDk1NzFtd3YtcmVndWxhdG9yIiwgfSwNCj4gPiAgCXsgLm5hbWUgPSAiYmQ5NTcxbXd2LWdw
aW8iLCB9LA0KPiA+IEBAIC0xMDIsMTMgKzExNiwyMSBAQCBzdGF0aWMgc3RydWN0IHJlZ21hcF9p
cnFfY2hpcA0KPiA+IGJkOTU3MW13dl9pcnFfY2hpcCA9IHsNCj4gPiAgCS5udW1faXJxcwk9IEFS
UkFZX1NJWkUoYmQ5NTcxbXd2X2lycXMpLA0KPiA+ICB9Ow0KPiA+ICANCj4gPiAtc3RhdGljIGlu
dCBiZDk1NzFtd3ZfaWRlbnRpZnkoc3RydWN0IGJkOTU3MW13diAqYmQpDQo+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgYmQ5NTd4X2RhdGEgYmQ5NTcxbXd2X2RhdGEgPSB7DQo+ID4gKwkucGFydF9u
YW1lID0gQkQ5NTcxTVdWX1BBUlRfTkFNRSwNCj4gPiArCS5yZWdtYXBfY29uZmlnID0gJmJkOTU3
MW13dl9yZWdtYXBfY29uZmlnLA0KPiA+ICsJLmlycV9jaGlwID0gJmJkOTU3MW13dl9pcnFfY2hp
cCwNCj4gPiArCS5jZWxscyA9IGJkOTU3MW13dl9jZWxscywNCj4gPiArCS5udW1fY2VsbHMgPSBB
UlJBWV9TSVpFKGJkOTU3MW13dl9jZWxscyksDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMg
aW50IGJkOTU3MW13dl9pZGVudGlmeShzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCByZWdtYXAN
Cj4gPiAqcmVnbWFwLA0KPiA+ICsJCQkgICAgICBjb25zdCBjaGFyICpwYXJ0X25hbWUpDQo+ID4g
IHsNCj4gPiAtCXN0cnVjdCBkZXZpY2UgKmRldiA9IGJkLT5kZXY7DQo+ID4gIAl1bnNpZ25lZCBp
bnQgdmFsdWU7DQo+ID4gIAlpbnQgcmV0Ow0KPiA+ICANCj4gPiAtCXJldCA9IHJlZ21hcF9yZWFk
KGJkLT5yZWdtYXAsIEJEOTU3MU1XVl9WRU5ET1JfQ09ERSwgJnZhbHVlKTsNCj4gPiArCXJldCA9
IHJlZ21hcF9yZWFkKHJlZ21hcCwgQkQ5NTcxTVdWX1ZFTkRPUl9DT0RFLCAmdmFsdWUpOw0KPiA+
ICAJaWYgKHJldCkgew0KPiA+ICAJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHJlYWQgdmVuZG9y
IGNvZGUgcmVnaXN0ZXINCj4gPiAocmV0PSVpKVxuIiwNCj4gPiAgCQkJcmV0KTsNCj4gPiBAQCAt
MTIxLDI3ICsxNDMsMjAgQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfaWRlbnRpZnkoc3RydWN0DQo+
ID4gYmQ5NTcxbXd2DQo+ID4gKmJkKQ0KPiA+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+ICAJfQ0K
PiA+ICANCj4gPiAtCXJldCA9IHJlZ21hcF9yZWFkKGJkLT5yZWdtYXAsIEJEOTU3MU1XVl9QUk9E
VUNUX0NPREUsICZ2YWx1ZSk7DQo+ID4gKwlyZXQgPSByZWdtYXBfcmVhZChyZWdtYXAsIEJEOTU3
MU1XVl9QUk9EVUNUX0NPREUsICZ2YWx1ZSk7DQo+ID4gIAlpZiAocmV0KSB7DQo+ID4gIAkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gcmVhZCBwcm9kdWN0IGNvZGUgcmVnaXN0ZXINCj4gPiAocmV0
PSVpKVxuIiwNCj4gPiAgCQkJcmV0KTsNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+ICAJfQ0KPiA+
IC0NCj4gPiAtCWlmICh2YWx1ZSAhPSBCRDk1NzFNV1ZfUFJPRFVDVF9DT0RFX1ZBTCkgew0KPiA+
IC0JCWRldl9lcnIoZGV2LCAiSW52YWxpZCBwcm9kdWN0IGNvZGUgSUQgJTAyeCAoZXhwZWN0ZWQN
Cj4gPiAlMDJ4KVxuIiwNCj4gPiAtCQkJdmFsdWUsIEJEOTU3MU1XVl9QUk9EVUNUX0NPREVfVkFM
KTsNCj4gPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gLQlyZXQgPSBy
ZWdtYXBfcmVhZChiZC0+cmVnbWFwLCBCRDk1NzFNV1ZfUFJPRFVDVF9SRVZJU0lPTiwNCj4gPiAm
dmFsdWUpOw0KPiA+ICsJcmV0ID0gcmVnbWFwX3JlYWQocmVnbWFwLCBCRDk1NzFNV1ZfUFJPRFVD
VF9SRVZJU0lPTiwgJnZhbHVlKTsNCj4gPiAgCWlmIChyZXQpIHsNCj4gPiAgCQlkZXZfZXJyKGRl
diwgIkZhaWxlZCB0byByZWFkIHJldmlzaW9uIHJlZ2lzdGVyDQo+ID4gKHJldD0laSlcbiIsDQo+
ID4gIAkJCXJldCk7DQo+ID4gIAkJcmV0dXJuIHJldDsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gLQlk
ZXZfaW5mbyhkZXYsICJEZXZpY2U6IEJEOTU3MU1XViByZXYuICVkXG4iLCB2YWx1ZSAmIDB4ZmYp
Ow0KPiA+ICsJZGV2X2luZm8oZGV2LCAiRGV2aWNlOiAlcyByZXYuICVkXG4iLCBwYXJ0X25hbWUs
IHZhbHVlICYgMHhmZik7DQo+ID4gIA0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiBAQCAt
MTQ5LDM4ICsxNjQsNDggQEAgc3RhdGljIGludCBiZDk1NzFtd3ZfaWRlbnRpZnkoc3RydWN0DQo+
ID4gYmQ5NTcxbXd2DQo+ID4gKmJkKQ0KPiA+ICBzdGF0aWMgaW50IGJkOTU3MW13dl9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LA0KPiA+ICAJCQkgIGNvbnN0IHN0cnVjdCBpMmNfZGV2
aWNlX2lkICppZHMpDQo+ID4gIHsNCj4gPiAtCXN0cnVjdCBiZDk1NzFtd3YgKmJkOw0KPiA+IC0J
aW50IHJldDsNCj4gPiAtDQo+ID4gLQliZCA9IGRldm1fa3phbGxvYygmY2xpZW50LT5kZXYsIHNp
emVvZigqYmQpLCBHRlBfS0VSTkVMKTsNCj4gPiAtCWlmICghYmQpDQo+ID4gLQkJcmV0dXJuIC1F
Tk9NRU07DQo+ID4gLQ0KPiA+IC0JaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgYmQpOw0KPiA+
IC0JYmQtPmRldiA9ICZjbGllbnQtPmRldjsNCj4gPiAtCWJkLT5pcnEgPSBjbGllbnQtPmlycTsN
Cj4gPiArCWNvbnN0IHN0cnVjdCBiZDk1N3hfZGF0YSAqZGF0YTsNCj4gPiArCXN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZjbGllbnQtPmRldjsNCj4gPiArCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4g
PiArCXN0cnVjdCByZWdtYXBfaXJxX2NoaXBfZGF0YSAqaXJxX2RhdGE7DQo+ID4gKwlpbnQgcmV0
LCBpcnEgPSBjbGllbnQtPmlycTsNCj4gPiArDQo+ID4gKwkvKiBSZWFkIHRoZSBQTUlDIHByb2R1
Y3QgY29kZSAqLw0KPiA+ICsJcmV0ID0gaTJjX3NtYnVzX3JlYWRfYnl0ZV9kYXRhKGNsaWVudCwg
QkQ5NTcxTVdWX1BST0RVQ1RfQ09ERSk7DQo+IA0KPiBIYXZpbmcgdG8gdXNlIHRoZSBpMmNfc21i
dXNfcmVhZF9ieXRlX2RhdGEgZm9yIGEgZGV2aWNlIHdoaWNoIGlzDQo+IGdvaW5nDQo+IHRvIGJl
IHVzZWQgd2l0aCByZWdtYXAgc2xpZ2h0bHkgYnVncyBtZS4gQnV0IGFzIHlvdSB3YW50IHRvIGRv
IHRoZQ0KPiBydW50aW1lIHByb2JpbmcsIHRoZW4gdGhpcyBhY2Nlc3MgbXVzdCBiZSBkb25lIHBy
aW9yIHJlZ21hcA0KPiByZWdpc3RyYXRpb24gLSBzbyBJIGNhbid0IHRoaW5rIG9mIGEgYmV0dGVy
IHdheS4gOigNCg0KSSBqdXN0IG5vdGljZWQgdGhhdCByZWFkaW5nIHRoZSBwcm9kdWN0IGNvZGUg
aXMgc29tZXRoaW5nIG9uZSB3b3VsZA0KZXhwZWN0IHRoZSBiZDk1NzFtd3ZfaWRlbnRpZnkoKSBi
ZSBkb2luZy4gTm93IHdoZW4geW91IGRvIHJlYWQgcHJvZHVjdA0KY29kZSBhbHJlYWR5IGhlcmUs
IHRoZSBhZGRpdGlvbmFsIHZhbHVlIGJyb3VnaHQgYnkgYmQ5NTcxbXd2X2lkZW50aWZ5KCkNCmlz
IHF1aXRlIHNtYWxsLiBJZiB5b3UgZXZlciByZS1zcGluIHRoaXMsIHBsZWFzZSBjb25zaWRlciBp
Zg0KYmQ5NTcxbXd2X2lkZW50aWZ5KCkgaXMgYWN0dWFsbHkgdXNlZnVsbCBvciBpZiBwcm9kdWN0
IGNvZGUgcmVhZGluZw0Kc2hvdWxkIGJlIGRvbmUgaW4gdGhhdCBmdW5jdGlvbiAtIG9yIGlmIHRo
ZSB1c2VmdWxsIGNoZWNrcyAoaWYgYW55KQ0KZnJvbSB0aGUgaWRlbnRpZnkoKSBjb3VsZCBiZSBp
bmxpbmVkIGhlcmUgOikNCg0KQmVzdCBSZWdhcmRzDQogICAgTWF0dGkgVmFpdHRpbmVuDQo=
