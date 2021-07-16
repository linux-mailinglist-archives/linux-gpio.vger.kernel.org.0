Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B8C3CB139
	for <lists+linux-gpio@lfdr.de>; Fri, 16 Jul 2021 05:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhGPDte (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 15 Jul 2021 23:49:34 -0400
Received: from mail-am6eur05on2060.outbound.protection.outlook.com ([40.107.22.60]:54849
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233891AbhGPDte (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 15 Jul 2021 23:49:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcvrliL5b3mx9+wOB6vLbJlzI7Q8dKNCvZQQs0L54pnWOgsPkxJYIvbQKTnfIJ+4Sl54CxTlEG0VlGLYFSwkp4TM1ch/LsDQU9/bcz08AMtcHzUifys6cgnFknKpvwzxsIyTKRvGmhimp0S7ns4i8By6X8U3OdpdbVp1bbOwHSCMc8+PilEu8dpo+ZBzn1pq6ViID2Zcjw7R/bktBd8xNH6odeCSo6vs44GR5F1wH063vQNfAKsv7gpXgr6nnGoim9rCvCFo6fZiWDhxzGPGCVAFb5q9SWtfjChUYHOpYDXa3OqWrzEu72qYl/L/zUtRf1x+kdx1dLYGzILz4NjR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucw6RgOBF7omwzrjaSbTOvMmx2fJbFkiRkGEVslNk0o=;
 b=UWGozpikd7sIWBhLducxzwDp98UlsQMwV2ihFwM7GqqEycdAbiG0KwUB0VNZEgBP42MyiRbyRKa85QGKbjnlIYyEWPMySruCIK/qhkZJHv+UBx+o5rWxslgb2C09dCFZc58lmrWtuyQNrmtqCrzjPUM6eUP3jM5004yrtNVoEdulbu0BeZNDJayxswGQaGOvtKZMwnpqaF9bGDwOTO87Yqj58vmESTwrMwN+QzAAcfNFtrTfrUPctVYLG/DGFDLKFgormcE53BbL8/+v5OGiFjua+Pbtd/Tlvv1dWzsOK9wJATtqRRt6i4cv0GZqgbimAoiFh3OnF605YxDp6GunVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ucw6RgOBF7omwzrjaSbTOvMmx2fJbFkiRkGEVslNk0o=;
 b=bZ+LmFTmGy0z3Ei3Fn0rBnwJAPSctuY4u0ApFtX6PuSsJQz7bpOtR5zOcHtrN8Dv6SqkqiPwX36KUORP4WWzXixD9JFcoyJUXvb/fkyjW/eI7k+HPW6sVMXdg9GV1lyzCofeWUkxIxgPjlUhdR6U2CuJScKSNY8orl719lC3fpc=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8744.eurprd04.prod.outlook.com (2603:10a6:10:2e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 03:46:38 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.027; Fri, 16 Jul 2021
 03:46:38 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Fabio Estevam <festevam@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 1/2] pinctrl: imx8mn: Constify imx_pinctrl_soc_info
Thread-Topic: [PATCH 1/2] pinctrl: imx8mn: Constify imx_pinctrl_soc_info
Thread-Index: AQHXd+IruL+qm2wRck24WFxXhcm8QatE+nLA
Date:   Fri, 16 Jul 2021 03:46:38 +0000
Message-ID: <DB9PR04MB847787ED953653A99B998AAC80119@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210713122513.3112941-1-festevam@gmail.com>
In-Reply-To: <20210713122513.3112941-1-festevam@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5cdbd394-fa9b-4f52-3416-08d9480c5113
x-ms-traffictypediagnostic: DU2PR04MB8744:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB8744FF2A78369E717059A4E380119@DU2PR04MB8744.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xIZDKZy431IF0rkCCk1Ic1p2bjkOQiV+x0f4LWLenIYz+roWAY/Z8/7O3r1OupWDlIlef1OLxawlIByArlA9X9y6KTlpsJWhfWPzGgVwyvx8LzaYS7LMvMEaGmSbaWBf0iZ8alePgqC0YJysqLKpOd3kTNEsjzbgTJnxTES2MdeMt/EQuwCQKBxI/9k7YHGxuKnqJGQFCiOgVUIvddEnVGitwAP5/4UH0fEzutY2wzgbozx1Gj3Ar2CZfLLbsVOi4NLiBKNLmcpAk8BIot8WLGShOF6oozplEreluhqmwtCpJx7o0QGbwVAIYVXOy2ETswCKDt9olQ/+PFHI1Y44/Fsc0z8gixVmA7L0LNmsiP7DJFjfUfu5DdhDfx4VF1d/1SADN2Zb9PW4HbNduiv7g1qgGN4COkqtzuC0UgAqWFiXLZOjRM4foxpUJ6knZnr7sHy/sXpno4QdHb64JI+unuFnxRd0VDaE5gSOzYM5F06p5/WAwxmQ7tAH6WlYQuTvTOt2r5j6CHIYtJlhCY8U1QGApfWd8ncxzAA3dRcgcF2s2RMxjF7KWCFPHpGof0oOyEg5OB7vFhzjtovTbCKTBXObDTIETItLiS585DVfqfAVyjq+SqSz1lm18CZAzYl3hMp8W1unmWK8Xg3g1ZR/2veRb2pukM1VXue9iiymHuFP/lTSGNuVKc67o2I/y4CV92K4PN90e9474WMV5+NNqRFaflZRdqvm7/SBzjPyZXA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(8936002)(5660300002)(7696005)(54906003)(44832011)(4326008)(33656002)(71200400001)(8676002)(26005)(55016002)(53546011)(2906002)(6506007)(186003)(122000001)(38100700002)(478600001)(86362001)(316002)(9686003)(110136005)(76116006)(83380400001)(66556008)(66476007)(66446008)(64756008)(52536014)(66946007)(32563001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVY0UmpsS1ZLMnVrSlpFUHFRd1V5MFVtODlXV0FsRHlLL2w2bUxsWjFHeUxh?=
 =?utf-8?B?K1VoaU1xcXVrUmlYTGVUdXVSNENEa1JhMnQxYnBod1VPbzEzOS9pOUgxdFBO?=
 =?utf-8?B?cnhOZG1iNDRGdDRZV2lsZ05ad1lseEtPZExKNmtDODdiaG9YRjRucmZwSi9m?=
 =?utf-8?B?cDMzbXJJMkh0VncycllLV203MEZQT3ZDamRsVnltWXk3aEhPc2RKS3o0azFz?=
 =?utf-8?B?TGpTd1ZBbVlqTHRHVk1sSDlCbFFOZ3Q3NE45bGZpamhyOHJiY2I2dVh3REp2?=
 =?utf-8?B?RlNTWG53TXhteVg2UC9rWFVtdUtCaHhpcUtVTVJiT2EvMVpQOUY1YzJKOFhz?=
 =?utf-8?B?THRROFU2d1RhaURNSzcrdVIrR0Y4WVE5bEY0dDlYemhweENpT1NQLzlFRHI3?=
 =?utf-8?B?YjVtWThkZWwzS1FVU3pnYVY0dVFGZFNYMExWTmo1ZDQvaUd3NjdWVGpPK0xr?=
 =?utf-8?B?bFJBaW41UzhKdnhLLzFyUDhJOGJlekVlVi9STkJWbmJ4N0dNamQwa0plQU5U?=
 =?utf-8?B?ZWg4Mk53K2tZcGV4dVJnVk9zeW1ycEZLNHp4ZEplbVlxbFVVVlZ3dGR5cmFZ?=
 =?utf-8?B?UlZWTnorcHZSRHJJQ0RWaXhSakt4WWNlalNmL01RQmlvTDZxaDRMOXVGTmNS?=
 =?utf-8?B?MEhQS3YxcmNERUEwSE9RTjBwREpRTUpVRGwxeTVUNldoSFJlR1lZUmhwYjJJ?=
 =?utf-8?B?b0NFT0xVZDJiQVdhNUQ3NnRLcnJGRHdvaHdsUGFYcTZ1d25mbVFBRHhpZGQx?=
 =?utf-8?B?RmU3QVJxSDVXYlRwczZzSTRQcHpTa1hrZnZxUzVtSGVsYXlWV2FBRmVNdmZI?=
 =?utf-8?B?eGoxUGl5SmNIYlpVQU1UNC85bTFOVFQwYy8zd1dkdUlhTHU3ZFJEY1lyZE82?=
 =?utf-8?B?alc4TjlTN1NBeVdod0t5bVJQcFBaUzg4M1NnUVptNk5zejVaQjRQbDRsaVdJ?=
 =?utf-8?B?b2E4cWsrZGFuTkRuUG1RVGJ1WkdMS2JJeXdUVzB4UWdOQlZBT2JkbzhQckdX?=
 =?utf-8?B?QmQ3SWc3Z1BsdWZxa3NCNU8yUGdFcFdDUCt3UFdOMit1QnpTdEhHME04cThl?=
 =?utf-8?B?R0tUV0Jmc01JRmN2aEN6SG9ieEx1N3JvR0dLZW5LMWNkbVYxMEQzVmNXYnM5?=
 =?utf-8?B?UUJXM1VWSnpmTjZIOTJpM0FVMkxuN1NxWEZhOCt2Y1FHS1ZIK0ZoN1ZFQ0Vn?=
 =?utf-8?B?K294ZnB5eG5vcVJKYksvdCt3OUcxaDFxR0VCaTYzREZEV28zUHE3c0J1amxB?=
 =?utf-8?B?MU1kTkUwQjE2RFlZOGlRR2ZyWGdaWStFVWlBU2xQVHNYdUR1eDZRSWEyTzdj?=
 =?utf-8?B?ZFVQQ3RoU3Zpa2R3WDhMbFFXRml3YWlSditTanJQeWQvTm1ERk04T0tzK2Jy?=
 =?utf-8?B?TzZWallqMXRVTEpYbEx2aWNCQUZqbFJocXYrWmF2VWxjeHFrdWZtQUZyK0U2?=
 =?utf-8?B?SVgra3JkcmphT280QUVnZW5oU2dKVDZuV25ua3BBT0hUUjRmSE1qWVJhOTFt?=
 =?utf-8?B?VGhLaUZZTTh6YzZ0YVk5N0xxdEJOc3orWWdCYi9aOXJjWk1VV09WVGEweHZD?=
 =?utf-8?B?eUtJdnpZZmw0b2ltNkpiV2d6RWk1bHpGUndvRU1zM082dXhmbjA2eU9RRCtN?=
 =?utf-8?B?RFJlWUZkcTUwZDNwdUVHS01xTXNOZTZHZjNmUFZ1c2RPOTlBUUkyTmlCM3Qz?=
 =?utf-8?B?azE1bFNVNUs2ZnAwUit6U3N1VXlCaVZyNjNKODNoUjUrU21HTjRDNkYzVVJ4?=
 =?utf-8?Q?d0+w6dHJEV2Uzdkwj6Tp4hdl0hejk4CKOpVCXYK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdbd394-fa9b-4f52-3416-08d9480c5113
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2021 03:46:38.5680
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVA0+qf+6VXxhZpxp45AEauOHklUcQleOq6RFtkhCm1sDoohMFcfd498g6z9ECgp09efhL5Engi9HP54MR5HXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8744
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIEp1bHkgMTMsIDIwMjEgODoyNSBQTQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBwaW5jdHJs
OiBpbXg4bW46IENvbnN0aWZ5IGlteF9waW5jdHJsX3NvY19pbmZvDQo+IA0KPiBUaGUgaW14X3Bp
bmN0cmxfc29jX2luZm8gc3RydWN0dXJlIGNvbnRlbnQgaXMgbmV2ZXIgY2hhbmdlZCwgc28gaXQg
Y2FuIGJlDQo+IGRlY2xhcmVkIGFzICdjb25zdCcsIGxpa2UgaXQgaXMgZG9uZSBvbiBhbGwgb3Ro
ZXIgaS5NWCBwaW5jdHJsIGRyaXZlcnMuDQo+IA0KPiBNYWtlIGl0ICdjb25zdCcgaW4gdGhpcyBk
cml2ZXIgdG9vLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1A
Z21haWwuY29tPg0KDQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhw
LmNvbT4NCg0KUmVnYXJkcw0KQWlzaGVuZw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9waW5jdHJsL2Zy
ZWVzY2FsZS9waW5jdHJsLWlteDhtbi5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5j
dHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteDhtbi5jDQo+IGIvZHJpdmVycy9waW5jdHJsL2ZyZWVz
Y2FsZS9waW5jdHJsLWlteDhtbi5jDQo+IGluZGV4IDQ0OGE3OWViNDU2OC4uZGJmODljZmJhNDc3
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14OG1u
LmMNCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteDhtbi5jDQo+
IEBAIC0zMTcsNyArMzE3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5jdHJsX3Bpbl9kZXNj
DQo+IGlteDhtbl9waW5jdHJsX3BhZHNbXSA9IHsNCj4gIAlJTVhfUElOQ1RSTF9QSU4oTVg4TU5f
SU9NVVhDX1VBUlQ0X1RYRCksDQo+ICB9Ow0KPiANCj4gLXN0YXRpYyBzdHJ1Y3QgaW14X3BpbmN0
cmxfc29jX2luZm8gaW14OG1uX3BpbmN0cmxfaW5mbyA9IHsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgaW14X3BpbmN0cmxfc29jX2luZm8gaW14OG1uX3BpbmN0cmxfaW5mbyA9IHsNCj4gIAkucGlu
cyA9IGlteDhtbl9waW5jdHJsX3BhZHMsDQo+ICAJLm5waW5zID0gQVJSQVlfU0laRShpbXg4bW5f
cGluY3RybF9wYWRzKSwNCj4gIAkuZ3ByX2NvbXBhdGlibGUgPSAiZnNsLGlteDhtbi1pb211eGMt
Z3ByIiwNCj4gLS0NCj4gMi4yNS4xDQoNCg==
