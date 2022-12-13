Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3FF64AD5E
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Dec 2022 02:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234119AbiLMBzy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Dec 2022 20:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231964AbiLMBzx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Dec 2022 20:55:53 -0500
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2062.outbound.protection.outlook.com [40.107.241.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54671B1F0
        for <linux-gpio@vger.kernel.org>; Mon, 12 Dec 2022 17:55:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mTNwycfYZ0R8B+OJPa62cpiibAGZE72MeUIiuvcOaSh0HuJlV+RijSVDm4S7u9ZcvCYhvm3upkX+h2tmSkPoz2SebViCXkfBTJbLRh3h2NMQ3Jej8NaYY+xkfkGBtV2hMAGD5i15mWCCikev88rHdWi7x0vvKU1q9v/c0zMfEngk7UrpNizpbM8NwI0VwZ6KYatAUNyh0y8VVap6lF/NXbp9JPT6fTC7qn8cTxUcQ2RBnC8qwVijnOiez+f5aKmuBVxR7+MxMdOMQOBzcnHc3okCvNEqDIrVpcnAeu/Rk6TSSB78pGCFIhMug2I5FlmJRiOaDpL81aZiHsTN/ODAqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wvmi8q3Fa0PlwlPvfPxTy08w67Dq/KHQR6fp3YQO/dU=;
 b=VhEz8xmdhPAHiKdzAZa+KYjfdrSlsJsYMekdRiCbYYduRF1qer1RuAuCB56eBcpvNs8uaYktqIfTjQIi4Uv+eCKkJAwGeEt/NvRxwAOdqG3hdrD8uNDxfmQ+VuEl34ObUz4fIm5/lcw0Duavc9z6pm8fDpVWhB37nrVn6uw8V1pM6RiGGn271vy9O0rBSOJoylPa6nHOXWgZSZJujOlRqofEs3clOyTmE4CyryhNaAg3oUXgc0DwQxj0PKTsIZ68Z55APO78S/ZXwQG9I/tMoneMPe75QZWfyIUw/ovRTm9r7T5TvwkO3gtelAQ7u3vm/yyhAL9g+Nt51x1I4V79+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wvmi8q3Fa0PlwlPvfPxTy08w67Dq/KHQR6fp3YQO/dU=;
 b=A6FVA8o94ROpA/jjhIlvTMpFkqwIJb8foh1SefAEaNefuh2FuB0fyqXX81zjbwiclPIIU8FRAQiyTHQMenZjwFZY2MjI5vqNuLD6N5iHbBDv/2WHMX3yS5smnj7MR+3UJVoMSr2Xg5mNML59zHtgafJlCipt0Z5si4aiU0OZ3Yk=
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AS8PR04MB8772.eurprd04.prod.outlook.com (2603:10a6:20b:42f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.11; Tue, 13 Dec 2022 01:55:50 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::7479:76ef:8e5:da0b]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::7479:76ef:8e5:da0b%7]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 01:55:49 +0000
From:   Bough Chen <haibo.chen@nxp.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "brgl@bgdev.pl" <brgl@bgdev.pl>, dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "martyn.welch@collabora.com" <martyn.welch@collabora.com>
Subject: RE: [PATCH 1/2] gpio: pca953x: avoid to use uninitialized value
 pinctrl
Thread-Topic: [PATCH 1/2] gpio: pca953x: avoid to use uninitialized value
 pinctrl
Thread-Index: AQHZC6Lvl6F7Oy7DnkeI25iaczJWra5qbCkAgACoVlA=
Date:   Tue, 13 Dec 2022 01:55:49 +0000
Message-ID: <DB7PR04MB4010D93B7EF17AFB8CC1817790E39@DB7PR04MB4010.eurprd04.prod.outlook.com>
References: <20221209075040.2141042-1-haibo.chen@nxp.com>
 <Y5dONGNiC8jlJOlq@smile.fi.intel.com>
In-Reply-To: <Y5dONGNiC8jlJOlq@smile.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4010:EE_|AS8PR04MB8772:EE_
x-ms-office365-filtering-correlation-id: 1fef1921-a7eb-4880-2be1-08dadcad28c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TMGojJSoPt/Gf3zBmSlqbHqVNfFvMWmIjVhV23LQtdJSe2vhrAtOjsEBoaHwJxEAHM9T2O981AbMMY7qgLD7ULIO90E8i/XTp2RTRsu/XTiEjLTCdV+h60+aNDPcY3UwRcweY3pxq98pwV5HDlFyZU7f5HjmxwUGctW8VYh33ZPVhWl7ziLwjOsRPNOJvhvtc74n2lY9wZ7VnqM4FhFAHouLzEQMz9sbc3RpTIYXAyCQaG4AvbwdWjhM6+0noE6jJIVgYT1J+/18iVOJDIrucLFmpn3FzFJXrG5y1gH/WhE18nmvgiM/wHSQPm7cSVobAHjkloF85A05ZWHKUVqtACr/t0ZoFcRWUMy0dfsKqyn8dP2ZgemkRtmwEVUxmibB+l7YUnmZdu8l+K/5Gy+AHqIzTNVtp7GgDkbJqArU/HKhJr/fFeL3wOekRzDtzhqQSMo4qa/SDIzpZ/vOkSnPFdYHVkbGwjgnAAtC+8qNxJ/1sgFpFab7jXCJ7X9951q8UBgb6MX9pCCptIEQtASeORK1vuD0e5G9AixSjLM9dnJ1W0wqZuCnf/RNCUABUyztdl7wTgo5nrpEucrUUv+wO6i54dLilVbUyEgxWLvapZgsd9JpyQrHEGZPBZLOOdSUp7mIfMHMLKhMZgX/1IGmInc+DGl2ub07qpbmncDU4WmIbnjS7TxI9njk222VWnKtnJcV6pP2cDoOkO0ZNww95Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199015)(64756008)(66476007)(2906002)(4326008)(5660300002)(66446008)(66946007)(54906003)(76116006)(8676002)(6916009)(66556008)(316002)(52536014)(8936002)(4744005)(41300700001)(71200400001)(478600001)(55016003)(9686003)(7696005)(186003)(6506007)(26005)(53546011)(33656002)(122000001)(38070700005)(83380400001)(38100700002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?QTV6K0l0VEV3ckFaWDhpdDc2T2x6Tmt4QWRRczRjQWpxblpyVllORmpOZjZu?=
 =?gb2312?B?Q1VzNHVJempCOEpxbTlXS1NUZ09CUkRDWWZ1S0lOUFVTU0ZteklDNk9qY3F4?=
 =?gb2312?B?eGNnL1plWnhjZTNadTVjOFJsY1ppNFZDNU9ESTlPYVhtczJxSGRsRlI3TktJ?=
 =?gb2312?B?MWVUVFdkcTdRSlZqN1J0V3RJTXpVVnJieFVwZVZLMFIzcXVuelJHMytpdnJD?=
 =?gb2312?B?Q25wMEJxalNuM3hJMmRaNnF0czVPWlB5U21MeVhsRFVjSEFqS3ZXUHpkMktT?=
 =?gb2312?B?VTlLSWRreC8wd3NvZTlBTEdDSGpWNElrOFFtaTFVYy9yMXMzdmZSUzlNQjlr?=
 =?gb2312?B?RnlFNkNkL3lWK1h5bnNJMzlRb2Y2UngwaHU2bEFzeFdrMEVwUFd2dDE3MDdN?=
 =?gb2312?B?N2Z0MXlQT0dveEZjczBvdWFCSmpYdVA5d1hWUXF3RjM1K0tjWFJYNzBWSG02?=
 =?gb2312?B?eFlRMnJjSFpFQUE3S3BQSzM4clVnR3NyWkhXZm9OQi8zVDBFRW82NS9WbjZC?=
 =?gb2312?B?U2d5MmRRQk5aZUVDb1Q4TkovdmZ1TFM5dFBWR1p6K2dZSDdCbExhM3dvVzg0?=
 =?gb2312?B?WFFLVEROUzdzcWJvSW14emVZd3lzMlVkbHBhRjlTMFNMV2xid2xkYWE3UHgw?=
 =?gb2312?B?QnFnQTJNTTBDT0lZcWE1M0UxcjBLa0NvVzV4djBTZ0t3NktCNGxyeVFDUnI4?=
 =?gb2312?B?ek82TEhZM3BKQzZJd0ExRkhXOWJaa2o2TTlDWDE3YWtxS3VQd3J6YlJ5R1c2?=
 =?gb2312?B?Vlh5Y3NBVUdMVEZwNEtpYzl5ckNQNFlxUkEwUi82Wnc4VHFzYk9TSnNQQVo2?=
 =?gb2312?B?WlkvTW00djBoUVlvdjJEQWFhc2ZlWVZSOTRnZDRuVFVnY3I2WXQwdnQwcnVY?=
 =?gb2312?B?UjJieTZWNHE0Q3YxRnRKblo4bVRIRGFIUlV6UXJtRWQyYVNlRFhyZWh3cHFF?=
 =?gb2312?B?Kzh1RjFjZ1ZSaFhSVzhHM0N1ZUF5Q1NSMHJqZmtkaWdBdlJESXQ4ZzRZTFEw?=
 =?gb2312?B?S0p1VVhraXA2eU5EVjBtVlZJQ1l4TmRlRGdwdUtHRmVNSkxiQXhZbmxwcUxK?=
 =?gb2312?B?bWRjVXcxOUxEZlIybEhPa3ZEYWlhb25lZ09IQW1qTitFRlloY2pnOENJVlhK?=
 =?gb2312?B?S2FGanFQaGRZK3JZRzVJK2Y4QTlHeWlFZWZwYnJXWkVpc3dkSDgxSGJxR2R2?=
 =?gb2312?B?OUFWTy80TUZIdEVtK1FwRXo5NG5qV256U2ZFNDQvYlVuVDY1cExrcXpPbjh5?=
 =?gb2312?B?VDRKYk8vdVVqcGZuaTA1WllTTWdOaHFXLzVyTGRnVXpIVVBtVzFtOEVpcnIr?=
 =?gb2312?B?d2Y1ZGZiTTRKc3JHdUtrcXJRZXlOWFlIT0JVdDlmczdCWFhMYlA5STgvU2ZN?=
 =?gb2312?B?d0RRUU9oS0pqaG5UOFg3OStMQTd6dDYwTkpwUVduRjlucWtkWDRKNHI4Zmhm?=
 =?gb2312?B?RTFlREVNU1pWV25ZUklibjBpOHlwQzJEOXhXRUZoWGZRU0cwVXp2aUpUamUw?=
 =?gb2312?B?cVdZOFJKam9qWnFtbFROWEhwSkhEdy9IWElUdXJ0ZVMyZDBaRzY4UmRHM2hP?=
 =?gb2312?B?R0d3THZPUUNPaCt5TGxIbGx1dk5Cd2RHcUhGdDdWRnZvYS9rR1UzU3dkVE5O?=
 =?gb2312?B?R1BQUlRwUDF1SDd5UWJtQ3JIQXNkR002ZzNraEo5UGdYU1V3Q0ZseEVyQVl1?=
 =?gb2312?B?KzM0VC9WZXAxeHUvNVBBdml4Zm1hUm45aENUQ2hOMXA4K1lzRXBYZHhqbjVT?=
 =?gb2312?B?c2ZrZmpNUXptL1lmMHNGWHRPNTFzR2wyc1h3eGRTSGdsYmdzUCtNNjhxZTYz?=
 =?gb2312?B?dUlBQlFEelJzNVEzU2JJMDJRajZGbHN0b1pJenJqaXNuSEQvSSt1WkVWSmpY?=
 =?gb2312?B?OUdleGRkVXdUZm1OdGRCYWVpRDdqN2o3RjgycHlaQVBFV1NpNll0RmZRQXNR?=
 =?gb2312?B?TFJDakpKNUZtOEx5dUNCa0E0TmVHdXJMUnZiTG9uRDk1OXZuL0xWS3g5NC9v?=
 =?gb2312?B?NkpGZEdYc2VxWVFnMjRIbWVVQXVLYjlFbmp0MHJLUFlsd01INmlqR1VIQnJ3?=
 =?gb2312?B?K1lhSjg5NTE2anc2UWhrOTNFdWl0aWVFL0hMaG83YjNFYTI3dWN1M1JJWWtZ?=
 =?gb2312?Q?Cbg79fRKlfsaAuQAUCQqAbESD?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fef1921-a7eb-4880-2be1-08dadcad28c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 01:55:49.7431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QxnsKUYHY4SIZ/U6xUanSY9wS+sIwv9x6gOT9/eRkjpwdrZ03cdYFOMFWATygy3c04h9s48xlKVGew1mV7FnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8772
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4NCj4gU2VudDogMjAyMsTqMTLUwjEyyNUgMjM6NTIN
Cj4gVG86IEJvdWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gQ2M6IGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZzsgYnJnbEBiZ2Rldi5wbDsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhw
LmNvbT47DQo+IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBtYXJ0eW4ud2VsY2hAY29sbGFi
b3JhLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gZ3BpbzogcGNhOTUzeDogYXZvaWQg
dG8gdXNlIHVuaW5pdGlhbGl6ZWQgdmFsdWUgcGluY3RybA0KPiANCj4gT24gRnJpLCBEZWMgMDks
IDIwMjIgYXQgMDM6NTA6MzlQTSArMDgwMCwgaGFpYm8uY2hlbkBueHAuY29tIHdyb3RlOg0KPiA+
IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gPg0KPiA+IFRoZXJlIGlz
IGEgdmFyaWFibGUgcGluY3RybCBkZWNsYXJlZCB3aXRob3V0IGluaXRpYWxpemVyLiBBbmQgdGhl
biBoYXMNCj4gPiB0aGUgY2FzZSAoc3dpdGNoIG9wZXJhdGlvbiBjaG9zZSB0aGUgZGVmYXVsdCBj
YXNlKSB0byBkaXJlY3RseSB1c2UNCj4gPiB0aGlzIHVuaW5pdGlhbGl6ZWQgdmFsdWUsIHRoaXMg
aXMgbm90IGEgc2FmZSBiZWhhdmlvci4gU28gaGVyZQ0KPiA+IGluaXRpYWxpemUgdGhlIHBpbmN0
cmwgYXMgMCB0byBhdm9pZCB0aGlzIGlzc3VlLg0KPiA+IFRoaXMgaXMgcmVwb3J0ZWQgYnkgQ292
ZXJpdHkuDQo+IA0KPiBJIGhhdmUgc2VudCBhIHYyIG9mIHRoaXMgc2VyaWVzIHdpdGggYWRkaXRp
b25hbCBjbGVhbnVwcy4NCg0KWWVzLCBJIHNhdyB0aGVzZSBwYXRjaGVzLCByZWFsbHkgdGhhbmtz
IQ0KDQpCZXN0IFJlZ2FyZHMNCkhhaWJvIENoZW4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdh
cmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4gDQoNCg==
