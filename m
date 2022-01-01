Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A664828C6
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 00:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbiAAXza (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jan 2022 18:55:30 -0500
Received: from mail-zr0che01on2139.outbound.protection.outlook.com ([40.107.24.139]:7390
        "EHLO CHE01-ZR0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232731AbiAAXza (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 1 Jan 2022 18:55:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwyRqnIgWDWwQWnG/h1h8vSGPzh3NuXIPmVmBcqIvQ14DAlI1dF3N1OX1HNLdL6r8bUxBzkm7kljkNZnhpn285tyinjQ0FQr2teSYAIS2Krx0Pxf3smzb5sxVGnjzMtRMiheUr3p5ris1IB4ZB4LdLwpirqaYZcXKYyJkajvDQp0nuS+IgSUgEaDAri9cZTJV9zsgB75I4CMddmZzCj7JnI68X0i04mItUVAusdOfiwreS7t35SofIpCd2HKuJplscmE6Ir1az/vzKiYVtebBuSNbXLFOAMUDT77dyW3wpjmuMzUW6Kzh3D+e7ZBgTa1L31rCs7MOwitI4/l4PFPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PXMv9/UTTz6AO1svJpUqn1VQ3MIwsauQ/zgqczxABE=;
 b=X5RUabyBnl28z76cQu6FSkQ84zA+P56U2kfd0XUqXrILKnuc/2sGdsYsh0xyPcMTOrb4l2J1mJVPoZ4i1vdajLG0YwuLD+oA73CKmqUnCBwLJn0DQcXxQ1yTxf1s6mlciIid63M5zbs4bI1iaFaBKyesf81Ki00NNl/HJThy48vIlXEWUmu9PXufWCbhW/YdnyaJT1vEYQMfRClGYj9S9uXglWhcQsYwCB2cL5yoB8jPI9lMdRPqQghsa6fRGzvVWKSB3UQnnNWqH035QIVQeZYuqtruv0hbeJ+xCtVRICGg3CYIRh4euOTl3sz4NLjpeh6V/Z6B28k2NEUVj4sj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PXMv9/UTTz6AO1svJpUqn1VQ3MIwsauQ/zgqczxABE=;
 b=dm30btjCYORiUBueb98czKT0VIwVvQwMBPBiMkqVtfmeSsHljQeKqaXXZBGWwM9GeYSncpg8PdxOqlbreO7GROfJzbUlMMNqPs3cMeJ6RF5hOcA0Ug9WqNzBYwx1x2Cw9JLPYct0NWEyhGolU32dZB5013yu/yjTE/R4zgpVguo=
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZRAP278MB0304.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:29::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.15; Sat, 1 Jan 2022 23:55:27 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2de2:ea03:cafb:56c1]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2de2:ea03:cafb:56c1%5]) with mapi id 15.20.4844.015; Sat, 1 Jan 2022
 23:55:27 +0000
From:   Marcel Ziswiler <marcel.ziswiler@toradex.com>
To:     "abel.vesa@nxp.com" <abel.vesa@nxp.com>,
        "zajec5@gmail.com" <zajec5@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
CC:     "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "lakshmi.sowjanya.d@intel.com" <lakshmi.sowjanya.d@intel.com>,
        "aisheng.dong@nxp.com" <aisheng.dong@nxp.com>,
        "rafal@milecki.pl" <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/4] pinctrl: imx: prepare for making "group_names" in
 "function_desc" const
Thread-Topic: [PATCH V2 1/4] pinctrl: imx: prepare for making "group_names" in
 "function_desc" const
Thread-Index: AQHX/2sM4iOk/PxYDUqia857vro0Ug==
Date:   Sat, 1 Jan 2022 23:55:27 +0000
Message-ID: <b9fe3fdd615fc0a91c9374a58f09d2f3ed38e0c3.camel@toradex.com>
References: <20211216162206.8027-1-zajec5@gmail.com>     <YcOJieHGeA7p+NIF@ryzen>
In-Reply-To: <YcOJieHGeA7p+NIF@ryzen>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d306f3e9-f39d-40b4-86f1-08d9cd822fa5
x-ms-traffictypediagnostic: ZRAP278MB0304:EE_
x-microsoft-antispam-prvs: <ZRAP278MB030440B102C74B75CD9AF2B1FB479@ZRAP278MB0304.CHEP278.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xhx+0OuCYhgFAtmPONiHIt7POoiuCFAISJ5WQQaOjrzEyhsLYNw3fSbpjPZ/8GzrZSRR6kztkTTx+NP+tDNqi1zzggcLld/Hqs8sKHw7sX2pNygRceMSfcaQ8iNqu+ZXrNQoW1qXW+KO9p/9wgQA60C4/PJBoiMKOf1qj/vnDT0R4PQz8EVTpwF421A2MtT2rCnPTlBrqKCxDMJhNiizDVR8eQWyokluCrrPqSEIwKdwJfGo732h7lcd0CX7K10zkzpSyUw7vHhlGZdvMShh44FQlWWzY48I47E2z5bMADvKfrRejvlsJ7GMRc/RBn+enZyNW9nCuHHxUHDc7fksXL2GLIgqUYqU7r6+9o1M/Hf7+mAiHIWMpKsfEb4yW6MzCvT8SNHZeejEAVQQZEQF3+FL7Ecg6Nr/GiyCHNDXbobvYIQgnxaoP6iFonaNGjQ4uU0swyIe0kxb5S4hmdhZNvhJT1PkR7u8Ml9OQqSDcHa4QXn3IRUw4IySYmXpNRTfQfbxF18JRLoJpCCZBJG+iwVF+EYlkV7Hvs60AuTn3WpGsJoqB+kz0eJoQxGqv+X7piBGWdl6408gQ0+x74/h//Bu1PYbsTqcqJlpWiRN8DUGFusC8MIqTrE4G3eaxTekhOWcbuhQY1g5IkKi4mLEoje83yfz+WojgWeP2esto4rnqOFFU8n/GlNGyLTkG/0oR4fpBnq3dUepyETHZC61jA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(136003)(376002)(346002)(366004)(66574015)(316002)(83380400001)(122000001)(6506007)(38070700005)(2906002)(7416002)(38100700002)(186003)(54906003)(4001150100001)(110136005)(71200400001)(76116006)(4326008)(66946007)(66476007)(53546011)(26005)(64756008)(66556008)(44832011)(5660300002)(8676002)(508600001)(66446008)(6486002)(8936002)(36756003)(2616005)(86362001)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDNaTkpYeVZvbDI5Y2RmU29ISUtxVE9BUFVyc0J2cE9XYVZwQldrMVkzcXpt?=
 =?utf-8?B?QTJjWmxmbDcvK2p3ZXBRR3djUTBGd3ovL1NXeVU4R1k5a2dpODRiLzZBRWxp?=
 =?utf-8?B?ZW1CdVJwOVY0MWlqWU9OL1ZFTTJGc2NKOVMrWmJZOFIyT2gzZktibGNkMEVY?=
 =?utf-8?B?azVIYlFjdUdnNlhFL0trdW4yN3g5UEZjR0M0Nm1jMDIrbU9uVTI3bmJ5UE5t?=
 =?utf-8?B?bit1S0FDS0hnRUx2NC85MjZIRnUwZ29CczYwVWFFZm1xaXdlVUlqN0NiK3ov?=
 =?utf-8?B?bTN2ZW1HWGZ5bzAxelNYWmJ4TVY3eE9peE5IbUNPVTRXbVZyMWRjY3lLWTNK?=
 =?utf-8?B?QU5jeEVFVUdRUWhKZjFTTmViSWx0d2lDbTgrTFA1QXlRR2Z4dWtPT3BkQmQz?=
 =?utf-8?B?Z0xPQTlremhqeEljTXJ1ZnRyNEd2OG5WY2huTWg0QWgrV2h2bUUwelpvaUh4?=
 =?utf-8?B?T2hQbzEvRTdOSnduOUxlV3ptYWk2Y3hrVVBZcW1OK3ZmSFBKOFdJUmdxd0p4?=
 =?utf-8?B?SldmZlljcXdjRWxKZDVDdGVpNVp1SXc0REp1QlRuYys2ZHVsT2RZTlJQZno4?=
 =?utf-8?B?REdjc0UrdHZaeG9uMGlMRkFRbElaNndQd0htTFkyc0prc2FBYkV2STdMZXBn?=
 =?utf-8?B?T25EaERsbnJDaDBjV3dQbHZFcTdlMG1icXB6eTkwdWg0SUFsMTFOS3cvQ1NU?=
 =?utf-8?B?TXM2djJIRGR0dngwQW53RE1qS1c2bzRCTjVWcVRvcUROQnhaMUpCR3plc1VI?=
 =?utf-8?B?MnQvUjFTN3ptbnRYTmJMQWpOdWV0SHM2QnpKYjZuakRJZXRGZ28ydHlFdjZE?=
 =?utf-8?B?YXh6S0ZnWDFCZHM1Nk9vZTBzRFV6SGJCdlJWVlUvVDI1UDA5WjB2Z3Q2QWMz?=
 =?utf-8?B?K3NHMnhDOFY1dFNaeXBwSVI5TDdUTnliblNZajhxUmJxdnllNnBxUVI4TXcv?=
 =?utf-8?B?OGpOSG1Eby9BVGxNWnBKeHMyTklVOEMyY2kyU25rbnVTWGZ5N1JUVlc2WEJH?=
 =?utf-8?B?a3luZUxFUHBMSUYyMU9NNitpeE94UjEvWE1JSldRRHQyVXRmaHllMXZpM1dC?=
 =?utf-8?B?a0tMVXpnSmhRZUtTaGwzRFptN1RZOEt6ZlpXNFdWUkV6MXBXb0t1ZWYvbWtZ?=
 =?utf-8?B?ZXZZQjlJK2tIZGZ3UkpCM3NzVFRUVmE5dXd2YkZKZnBIUTRJVGNiTisyWlJ5?=
 =?utf-8?B?LzBRWTd1TVlFbTRLQmovYkNNb3ozQ3IzUHdKUzA0WGRYWEFIdVZGZ2o1REd1?=
 =?utf-8?B?enNMK1N0NHY4WnllUkJUTGE2WDFaUlJ1WkpvYVFNbnZWdjBEOVJnOG5QMlEx?=
 =?utf-8?B?ZFhRR2NLelBPMmJLZGY1ZDlYRlNnVkp6TXU4L0tpakEzVTFBR0dEdithUGJC?=
 =?utf-8?B?QWVEQWtrRjNwVXIveHVQOXgvdHBkQWdKSU8rdUE5RlVxc2JCeVpRdEFEa0lO?=
 =?utf-8?B?eUZjU0szMERVdW53enRGS0xVdEYzR1FnN2dONHc1RGF0MVVUMG5QbXBCMFFL?=
 =?utf-8?B?QWZlSWtrRE9EUjhYeit6bjdIM21qZHd4emhmTnRIb3FzQ2tTelFNazM4cEZ4?=
 =?utf-8?B?YWdBNjh4OTMwSHFhM0QyR1k3RkJtRTMwK0J2cHNmZllXR0N5TFJVVXZhOU5L?=
 =?utf-8?B?OTZaa3RoRnlLeENhL2pwOFV4Nis5MXNoYTFmalY4N3hVNXdoTjA5Qk0rUUNU?=
 =?utf-8?B?SzJHdVFCNEtTZ3pKQlY1M1pva2pObGZLOFpxTktWNjJ2cnhhcG02R1dRUXVX?=
 =?utf-8?B?ZFlOSVFxWmliYnR5ODNha2ZoS1FqbnEyUTFFVFptMkNSRy96V0R3UWlDZFRQ?=
 =?utf-8?B?ay85MlQ2SUtLUEMzaSs4WTR2N0hIMzR3Y0R5Zi9qVDU3Y3hTTnRuYURUQlJh?=
 =?utf-8?B?TUw5Vkp2TVgvZW9JandBWXRiSjdmNVdWSUp5SmZhQXN4czJiU29CaHpkUnR4?=
 =?utf-8?B?cGsvM0ZkOFZrbFNzM096bVVOVjVPOGtVVGR6ejcxVXI3MHprMzR3K2ZnaVdX?=
 =?utf-8?B?cWxBeVR5VjV6YmM0VmhvMnRUNFRSa2NEMUFQRjZJNFRuWHE1YXArUlJCQVpl?=
 =?utf-8?B?b3FkZ2xmeXhuclhGQlFVZnRydElNZWxPdFRBSGk2WmJmTGIwZGhIRENTR0JX?=
 =?utf-8?B?S2pCVFJPdkN4em1HTzlwQm41VXh5U2lXV2xrSWlieG15bGduUXYyU3AvQ3FZ?=
 =?utf-8?B?WUhzWnMwRStqd3lsbUdCQVlXaXVwQ2w1RHowMXJYWG5ESjF1WWZRQmtPTlRE?=
 =?utf-8?Q?6FZ44+KNspF6MOFzQbdiv0JWGWD0Lr5y3e34STqq0A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC74758722E2B442AF5A3F431E5727E7@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d306f3e9-f39d-40b4-86f1-08d9cd822fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2022 23:55:27.6663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JPJOnw1zWiIa5Fnp9R8qD8b5NiKeAWaM1FM/4ooOV4PiBR0GDKZq7wTHYpikluh5Q0xq6g67ztBGAaP8JC0tJkJtStfa+7tb2n5r608FcUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0304
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gV2VkLCAyMDIxLTEyLTIyIGF0IDIyOjI0ICswMjAwLCBBYmVsIFZlc2Egd3JvdGU6Cj4gT24g
MjEtMTItMTYgMTc6MjI6MDMsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPiA+IEZyb206IFJhZmHF
giBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiA+IAo+ID4gVGhlIHBsYW4gZm9yICJzdHJ1
Y3QgZnVuY3Rpb25fZGVzYyIgaXMgdG8gbWFrZSBpdHMgImdyb3VwX25hbWVzIgo+ID4gL2RvdWJs
ZS8gY29uc3QuIFRoYXQgd2lsbCBhbGxvdyBkcml2ZXJzIHRvIHVzZSBpdCB3aXRoIHN0YXRpYyBj
b25zdAo+ID4gZGF0YS4KPiA+IAo+ID4gVGhpcyBpbXggY2hhbmdlIGlzIHJlcXVpcmVkIHRvIGF2
b2lkOgo+ID4gZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jOiBJbiBmdW5j
dGlvbiAnaW14X3BpbmN0cmxfcGFyc2VfZnVuY3Rpb25zJzoKPiA+IGRyaXZlcnMvcGluY3RybC9m
cmVlc2NhbGUvcGluY3RybC1pbXguYzo2NzI6MjQ6IGVycm9yOiBhc3NpZ25tZW50IG9mIHJlYWQt
b25seSBsb2NhdGlvbiAnKihmdW5jLQo+ID4gPmdyb3VwX25hbWVzICsgKHNpemV0eXBlKShpICog
NCkpJwo+ID4gwqAgNjcyIHzCoMKgIGZ1bmMtPmdyb3VwX25hbWVzW2ldID0gY2hpbGQtPm5hbWU7
Cj4gPiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBt
aWxlY2tpLnBsPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3Ry
bC1pbXguYyB8IDExICsrKysrKystLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0
cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMgYi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3Bp
bmN0cmwtaW14LmMKPiA+IGluZGV4IGRhZjI4YmM1NjYxZC4uNDdiMmFiMWExNGQwIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2ZyZWVzY2FsZS9waW5jdHJsLWlteC5jCj4gPiArKysg
Yi9kcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14LmMKPiA+IEBAIC02NDgsNiAr
NjQ4LDcgQEAgc3RhdGljIGludCBpbXhfcGluY3RybF9wYXJzZV9mdW5jdGlvbnMoc3RydWN0IGRl
dmljZV9ub2RlICpucCwKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGV2aWNlX25vZGUgKmNo
aWxkOwo+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBmdW5jdGlvbl9kZXNjICpmdW5jOwo+ID4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBncm91cF9kZXNjICpncnA7Cj4gPiArwqDCoMKgwqDCoMKg
wqBjb25zdCBjaGFyICoqZ3JvdXBfbmFtZXM7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgdTMyIGkgPSAw
Owo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBkZXZfZGJnKHBjdGwtPmRldiwgInBhcnNlIGZ1
bmN0aW9uKCVkKTogJXBPRm5cbiIsIGluZGV4LCBucCk7Cj4gPiBAQCAtNjYzLDE0ICs2NjQsMTYg
QEAgc3RhdGljIGludCBpbXhfcGluY3RybF9wYXJzZV9mdW5jdGlvbnMoc3RydWN0IGRldmljZV9u
b2RlICpucCwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2X2VycihpcGN0
bC0+ZGV2LCAibm8gZ3JvdXBzIGRlZmluZWQgaW4gJXBPRlxuIiwgbnApOwo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlZBTDsKPiA+IMKgwqDCoMKgwqDCoMKg
wqB9Cj4gPiAtwqDCoMKgwqDCoMKgwqBmdW5jLT5ncm91cF9uYW1lcyA9IGRldm1fa2NhbGxvYyhp
cGN0bC0+ZGV2LCBmdW5jLT5udW1fZ3JvdXBfbmFtZXMsCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNpemVvZihjaGFyICopLCBHRlBfS0VSTkVMKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oGdyb3VwX25hbWVzID0gZGV2bV9rY2FsbG9jKGlwY3RsLT5kZXYsIGZ1bmMtPm51bV9ncm91cF9u
YW1lcywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKGNoYXIgKiksIEdGUF9LRVJORUwpOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoGlmICghZnVuYy0+Z3JvdXBfbmFtZXMpCj4gVGhpcyBsaW5lIG5lZWRzIHRv
IGJlOgo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWdyb3VwX25hbWVzKQo+IAo+IE90aGVyd2lzZSwg
dGhlIGRyaXZlciBuZXZlciBwcm9iZXMgc3VjY2Vzc3VmdWxseS4KCkFmdGVyIG15IGkuTVggOE0g
TWluaSB0YXJnZXQgcnVubmluZyBsYXRlc3QgLW5leHQganVzdCBoYW5nIGVhcmx5IGJvb3QgSSBi
aXNlY3RlZCBpdCB0byB0aGlzIGNvbW1pdC4KCkkgY2FuIGNvbmZpcm0gdGhhdCB0aGlzIGZpeGVz
IGl0LiBUaGFua3MhCgo+IExpbnVzLCBtYXliZSB5b3UgY2FuIHNxdWFzaGVkIHRoaXMgZml4IGlu
IHlvdXIgdHJlZSB3aXRob3V0IGEgcmVzZW5kLgo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gLUVOT01FTTsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvcl9lYWNoX2No
aWxkX29mX25vZGUobnAsIGNoaWxkKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGdyb3VwX25hbWVzW2ldID0gY2hpbGQtPm5hbWU7Cj4gPiArwqDCoMKgwqDCoMKgwqBmdW5jLT5n
cm91cF9uYW1lcyA9IGdyb3VwX25hbWVzOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqBmb3Jf
ZWFjaF9jaGlsZF9vZl9ub2RlKG5wLCBjaGlsZCkgewo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGZ1bmMtPmdyb3VwX25hbWVzW2ldID0gY2hpbGQtPm5hbWU7Cj4gPiAtCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdycCA9IGRldm1fa3phbGxvYyhpcGN0bC0+
ZGV2LCBzaXplb2Yoc3RydWN0IGdyb3VwX2Rlc2MpLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5F
TCk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghZ3JwKSB7Cj4gPiAt
LSAKPiA+IDIuMzEuMQotLSAKQmVzdCByZWdhcmRzIC0gTWl0IGZyZXVuZGxpY2hlbiBHcsO8c3Nl
biAtIE1laWxsZXVyZXMgc2FsdXRhdGlvbnMKCk1hcmNlbCBaaXN3aWxlcgpTb2Z0d2FyZSBUZWFt
IExlYWQgLSBFbWJlZGRlZCBMaW51eCBCU1AKClRvcmFkZXggQUcKRWJlbmF1c3RyYXNzZSAxMCB8
IDYwNDggSG9ydy9MdXplcm4gfCBTd2l0emVybGFuZCB8IFQ6ICs0MSA0MSA1MDAgNDgwMAo=
