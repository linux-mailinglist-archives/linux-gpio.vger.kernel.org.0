Return-Path: <linux-gpio+bounces-460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF227F6F32
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 10:12:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA467B210B4
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Nov 2023 09:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1B65676;
	Fri, 24 Nov 2023 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aaeon365.onmicrosoft.com header.i=@aaeon365.onmicrosoft.com header.b="Cwlkbv+6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2137.outbound.protection.outlook.com [40.107.215.137])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBF5B0;
	Fri, 24 Nov 2023 01:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwvhhpA0+wGAFlC7vCJTM6DcZRI/56UW4gTi/2NJwZghz1Xi8HA0MaMzWXnnR+m9qmVV6KkqIVxoKNau8/kGDxS/2MUn4uHwxJKAYmNOuhVB2G+D2bK1omt/E1pnlnWEO3rMMKG6qkBFBZ5WkBxrvcuZCEyysd+upcIODmoQb9H7B3C+9Y6NU8m/JeLdwDGjOB88WJUo171DeBZ65TrOwnf98/LLdHcnHmxtQlvmbn+pw6o63RXOmlCQrVsyuTGFLoMrW8Cbb7Z0dKch615e8ozX9JOrlhsDhnTt9g7HeJ05cTPwjtpPi4e0bqyBihfPZAHyDFBfAOFlhNx5zyhEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjxnCEDKMER8MAruTnI+ySVRBkhDMotIJSDLgvKU+cc=;
 b=C0sJpnnADu5RuZdm1jQuPXOycm2gYsbSFPP6mRsBw6rGj0jOmi69CSATSVboOtqvFpZIqotp5rH9z+1Jh5353rmt5oINGjkLqoCwXTUGBOOi/OYgZWL+kCGGUXHQptw2NL8FcjrhiOrfv1sXjohG+hpuLwRQlVFU+ziy13YdZ4oduF9STyHaZprRH/zlsGh6lalIZ7ebDHFIg+fCWOb2AjV6gFiRJ3Jc3Ql7Yu+ngxHda/bMlgEY0Hczy0n8bsjz/WinVXwg7yyo6Kj5Ty0pS/8r6sL5CyD8iMg4PUffCpgShsChqpzqwYAHtgzfdAIBB2UTKG7wLwFBQieaX6p/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aaeon.com.tw; dmarc=pass action=none header.from=aaeon.com.tw;
 dkim=pass header.d=aaeon.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aaeon365.onmicrosoft.com; s=selector2-aaeon365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjxnCEDKMER8MAruTnI+ySVRBkhDMotIJSDLgvKU+cc=;
 b=Cwlkbv+6qI0+sz+LpwpAlVACF64nVRDNk1mHTS06pEy7xxqUv5ugw2YIpLG+Gf4u3/71gtK8lKu2fDRvC+jgjhOZRlT5ylpD4Un4+qmm/DTICB3liRP/zYtBRFQyvIqCxo96GxVzsCiLezFwK0BA8b9CcMHHEG7zNu8VbKPaqWs=
Received: from SI2PR02MB5682.apcprd02.prod.outlook.com (2603:1096:4:1ad::10)
 by SI2PR02MB5633.apcprd02.prod.outlook.com (2603:1096:4:1a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 09:11:51 +0000
Received: from SI2PR02MB5682.apcprd02.prod.outlook.com
 ([fe80::e6ed:864f:d0ae:dce6]) by SI2PR02MB5682.apcprd02.prod.outlook.com
 ([fe80::e6ed:864f:d0ae:dce6%4]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 09:11:50 +0000
From: =?utf-8?B?R2FyeVdhbmcg5rGq5LmL6YC4?= <GaryWang@aaeon.com.tw>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, larry.lai
	<larry.lai@yunjingtech.com>
CC: "lee@kernel.org" <lee@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"musa.lin@yunjingtech.com" <musa.lin@yunjingtech.com>,
	"jack.chang@yunjingtech.com" <jack.chang@yunjingtech.com>,
	"noah.hung@yunjingtech.com" <noah.hung@yunjingtech.com>
Subject: RE: [PATCH V7 2/3] pinctrl: Add support pin control for UP board
 CPLD/FPGA
Thread-Topic: [PATCH V7 2/3] pinctrl: Add support pin control for UP board
 CPLD/FPGA
Thread-Index: AQHaC5zQTtnnqyfTi0OETajcNkPqpLB588aAgA9ThhA=
Date: Fri, 24 Nov 2023 09:11:50 +0000
Message-ID:
 <SI2PR02MB5682521C6A13E1D962BA223CEEB8A@SI2PR02MB5682.apcprd02.prod.outlook.com>
References: <20231031015119.29756-1-larry.lai@yunjingtech.com>
 <20231031015119.29756-3-larry.lai@yunjingtech.com>
 <ZVOBz8-tahhrVmO-@smile.fi.intel.com>
In-Reply-To: <ZVOBz8-tahhrVmO-@smile.fi.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aaeon.com.tw;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR02MB5682:EE_|SI2PR02MB5633:EE_
x-ms-office365-filtering-correlation-id: ba01c569-3f3e-4543-cd4b-08dbeccd64f3
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YcEnkC9oFQH4pgNwMrWxXzf2eNB3fnAup38qUCznWVo6/CJUfYN9eIpUn9uHRkug9z8o7Vo6k0BKftbZ+k9L62dCk4AAc/0qgRCI8bHuei455ywhePtzJhVt82TEZy4f7X4EvziZdDzdR91JxWtCmGC2JdirVLhpHvap2aZlSaZmBqJeidkkYfXfBzcyhv+rltxJnT99y3TDGTU74ygkcKQ55GJs10o6rJUtTbBYZte4pjc3IrSow7J87889IqVvtOjB7a8bNLv0Sdb2dt3j50jJZt9k4cZhkDynDJJ0jM/sXDCBCqyjKAeEy907vINNMvdouxzBzLylCwqHRhsyyMo85QLFv/bsPJI64qU9QvQAhVnIJQ6xCphj4UPA1icBx7+RT50An0Fi3AiahiMNhDEOZU+eSEk2zfWjL1DPasHtXROUmZlh8JXNbG9ye5OS2IqzjbzyFWPqrWyRDbsl0U7VRmseCm2CDH9Tr9bkhtwZQIGKpu4ZIMSwYFw3KBVjK0IESs6j9dQLqbRTBnHPgtoaRpxSfDfvkt+PoZ13nG1EZo55rPoJhuLjCIf00VEhMC3n7CU3eWP2gjoKD01nUXXdb2qgWytCsaeLdqYlQdY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR02MB5682.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39850400004)(376002)(396003)(346002)(64100799003)(1800799012)(186009)(451199024)(55016003)(9686003)(53546011)(41300700001)(7696005)(6506007)(86362001)(71200400001)(26005)(33656002)(83380400001)(478600001)(38100700002)(2906002)(85182001)(7416002)(66946007)(110136005)(5660300002)(76116006)(66556008)(38070700009)(66446008)(54906003)(64756008)(316002)(66476007)(52536014)(122000001)(8676002)(4326008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M091dm9ZTXNMNTBnenRYd3MyMmkrUjdld2RQd1p6U1ZDdFdSaXlManhYUjJY?=
 =?utf-8?B?RFVmaVorZzRVcGswWXM5S3cxd1hFc1pqcUJwalJ6SlRtcE1jZHhtbnFMMXNo?=
 =?utf-8?B?amVlZ25BZ3ZHOEdQWW9hQ2xHZFRRSWl3Z0JMREllWUJGN2ZyRUVkSmRZOGxp?=
 =?utf-8?B?ZndBN0ZOdU1RTDJnd3FiVnB1VkVWdG1QaGpCL21FSmpWUXd0Y290YlpqeUZ1?=
 =?utf-8?B?VEZqTTZsZDBISm5DYUR2Q1EyQWplYnFlQ3Zhd2pMRlJ5c21jeDRTL3ByZi96?=
 =?utf-8?B?TmE0dm5xMFNLOXA1ZnNraDg4ZnRTT1haRVpmczluaHRhRWdZeEZERjVlVzl0?=
 =?utf-8?B?QXM4dTZXdm1aTDNSNGE2eUN0RnMyVFhneGRWRVkrUkZBWERSRTVMR1FuMmEw?=
 =?utf-8?B?ZzVoM3RYdENyMGk3Zmo2clkxNXY3K1NUakwrWWc0cEUzd0g5YTMwa2xKMjlm?=
 =?utf-8?B?M01zY29HYmhZdVF6bkpXYzdTbC81RjJWc3VnZUVpRm5CY1RGdERBTWloR29l?=
 =?utf-8?B?NDVCTHNBbngybzBoV211ZHA0eXVEMVpqZS9uT3VHSWNQd1ZHaUhrRjJSQUI0?=
 =?utf-8?B?dS9iMGtlZjAzaWk1MVhtVmVFeS9QODY2NGROa0xLSSs4WXZ6djRNM3p3NnNS?=
 =?utf-8?B?UUxTTkdLa3JwSEhYaEZGQ3dqbWMyblpEYW5EWlYwVGw1WUI2UklDWHFCTld0?=
 =?utf-8?B?dG50eUZlRGZrbkhtdHA5ZHlVMDN4cXRlSUNGS2E2ai9oWHF0eTVudEV3cm5q?=
 =?utf-8?B?ek50RDN2SVVHUDdoakk5RS9wcG9GekU0TENyRzZPRkRTS2dRQ0ozZHJaZWhJ?=
 =?utf-8?B?NkxGM245ZnRmOGxyNEx1UDkweHZFaEVvV29VWjE0dDI5ancrcTVhVWlVblB3?=
 =?utf-8?B?U2NPUmtZSjd3eTBTUG4vekdiR0RNeDdsOXdudSszNk5hbzNSVGJwamlPN240?=
 =?utf-8?B?VzdNekdXQmhyYTV1ZnZhSlUxQXpJYWV3b001aWU1ZVdGMktPRjAyUEhRK3ls?=
 =?utf-8?B?T0tlRjJYUXVLbFg1Y05uZXJlUVhVNVc5VDRNclBnUWU4RHVDM3Q4ZkpMeXRu?=
 =?utf-8?B?TVNFbnc4aDdyWXh1QUVicXZXWEE4ZmFPaTJKUTdJcEZaamcxYlJQd3Q1Yndx?=
 =?utf-8?B?dXRKVEFwUFlGTzRNZmFWMUlVNjBpem9RM2tER2tnRGphcDZmalNvbVloRVFG?=
 =?utf-8?B?dEZBZmdEZjcyQ2tVRWpCUHVmem5YSDA5NjJRK3JsUUtQcktvSlpJV2hkMUV4?=
 =?utf-8?B?T29RZzZXY0NFaHBSTWFQejh3Q2lLRmlZQzJBVkZTdGpKMXhBTDdIaFoyT3ZY?=
 =?utf-8?B?c1FNUHVRSEV1MFN3WmxhN2lYNjhWZHNBbHZoamVlZ2U4RHlOaVFmcUdXZ3BI?=
 =?utf-8?B?aGgxbWtKZXFLTmg2ZEZIdzhSc0tqKy9MNEpoaU9YeWFKZ3BlejNrT3RxbE9h?=
 =?utf-8?B?NUFCZGlnUU94cW5hWlFFcnJpZ0xINm0yUjBYN2hCWlplb1dVeTE2U2tJM3Jm?=
 =?utf-8?B?T2o3SmJJY0tXQ3E1c3M3UjdVUnR5Umxxazd5d010cHgzeTlxejU4TnV0UkV5?=
 =?utf-8?B?U1AreUlNd0ZKMXZWakczc0lROERzR3Zlb3huVVVpL3lObFVNcHBQV2FERDRt?=
 =?utf-8?B?R0xBRmJCbmxNWnBGeERCOFZhUUo3b0cvYml5RG9pdUFOZnc0WDF5MG9qeVVj?=
 =?utf-8?B?S1U0NXNwb0tITE5QSDR5QTl3cFd3bi9yeWJoTTVVQjhpc0hnOXlsMy9SVmUv?=
 =?utf-8?B?N2c1WmY4aC92allOYkpuMTZKRlJBRk5tZjV2N0h5UEZBSUxFNmlBQ1pFa1dz?=
 =?utf-8?B?RHpHQkNLVGVEMHBheFRiVFI3UkxHbXZ4NS8yaXkzdDVpL0tiS2t4VkdDMUti?=
 =?utf-8?B?a1UxUVpXOVJETjJrVks1Zkwya3hnY0dqa3RIZXhBMDNKMWtJUUd2eko4Q24r?=
 =?utf-8?B?QlBBMTdna3ZBbzlsYVUzMnFoYThqSENSZDBXZlpOSEp2Um10aDQyNVAxM3J3?=
 =?utf-8?B?THFVc2JwNngrR0h5dE9lSE1hNkpjeWd6aFRKZFdHTTQ4R3M1NlZXcTcwVzQy?=
 =?utf-8?B?dlZYbmZJTU1LL0dteU5qS0tUQnUybkZPc0lLYjVGa013cS85NlpqY2xmR1Zk?=
 =?utf-8?Q?WWPHpi+0UOpHU5DK3j7uGxUlP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: AAEON.COM.TW
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5682.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba01c569-3f3e-4543-cd4b-08dbeccd64f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 09:11:50.9276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56a2d4be-9fe3-430e-b539-7e13a4744857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z58yGcoZKeRigbQJUpyg3zXwIcI3KlyBz8O4c9PfBzprmS1dNuvmbp/vdVbk2izcE5ZDnJgSOWGSL9Labd73mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5633

DQpIaSBBbmR5LA0KIFRoYW5rcyBmb3IgeW91ciByZXZpZXdlciwgZm9yIHlvdXIgcXVlc3Rpb24s
IHBsZWFzZSBraW5kbHkgdG8gY2hlY2sgb3VyIGNvbW1lbnRzIHdpdGggIj4+IiBiZWdpbm5pbmcu
DQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHkgU2hldmNoZW5rbyA8
YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KU2VudDogVHVlc2RheSwgTm92ZW1i
ZXIgMTQsIDIwMjMgMTA6MTkgUE0NClRvOiBsYXJyeS5sYWkgPGxhcnJ5LmxhaUB5dW5qaW5ndGVj
aC5jb20+DQpDYzogbGVlQGtlcm5lbC5vcmc7IGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZzsgcGF2
ZWxAdWN3LmN6OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1ncGlvQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5vcmc7IEdhcnlXYW5nIOaxquS5i+mA
uCA8R2FyeVdhbmdAYWFlb24uY29tLnR3PjsgbXVzYS5saW5AeXVuamluZ3RlY2guY29tOyBqYWNr
LmNoYW5nQHl1bmppbmd0ZWNoLmNvbTsgbm9haC5odW5nQHl1bmppbmd0ZWNoLmNvbQ0KU3ViamVj
dDogUmU6IFtQQVRDSCBWNyAyLzNdIHBpbmN0cmw6IEFkZCBzdXBwb3J0IHBpbiBjb250cm9sIGZv
ciBVUCBib2FyZCBDUExEL0ZQR0ENCg0KT24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMDk6NTE6MThB
TSArMDgwMCwgbGFycnkubGFpIHdyb3RlOg0KPiBUaGUgVVAgU3F1YXJlZCBib2FyZA0KPiA8aHR0
cDovL3d3dy51cGJvYXJkLmNvbS8+IGltcGxlbWVudHMgY2VydGFpbiBmZWF0dXJlcyAocGluIGNv
bnRyb2wpIHRocm91Z2ggYW4gb24tYm9hcmQgRlBHQS4NCj4NCj4gUmVwb3J0ZWQtYnk6IGtlcm5l
bCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBHYXJ5IFdhbmcg
PGdhcnl3YW5nQGFhZW9uLmNvbS50dz4NCj4gU2lnbmVkLW9mZi1ieTogbGFycnkubGFpIDxsYXJy
eS5sYWlAeXVuamluZ3RlY2guY29tPg0KDQpTYW1lIGNvbW1lbnRzIGFzIHBlciBwcmV2aW91cyBw
YXRjaC4NCg0KLi4uDQoNCj4gKyAgICAgaGVscA0KPiArICAgICAgIFBpbiBjb250cm9sbGVyIGZv
ciB0aGUgRlBHQSBHUElPIGxpbmVzIG9uIFVQIGJvYXJkcy4gRHVlIHRvIHRoZQ0KPiArICAgICAg
IGhhcmR3YXJlIGxheW91dCwgdGhlc2UgYXJlIG1lYW50IHRvIGJlIGNvbnRyb2xsZWQgaW4gdGFu
ZGVtIHdpdGggdGhlaXINCj4gKyAgICAgICBjb3JyZXNwb25kaW5nIEludGVsIFNvQyBHUElPcy4N
Cg0KKyBibGFuayBsaW5lIGhlcmUuDQoNCj4gKyAgICAgICBUbyBjb21waWxlIHRoaXMgZHJpdmVy
IGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJlOiB0aGUgbW9kdWxlDQo+ICsgICAgICAgd2lsbCBi
ZSBjYWxsZWQgcGluY3RybC11cGJvYXJkLg0KDQouLi4NCg0KPiArICogVVAgQm9hcmQgSEFUIHBp
biBjb250cm9sbGVyIGRyaXZlcg0KPiArICogcmVtYXBwaW5nIG5hdGl2ZSBwaW4gdG8gUlBJIHBp
biBhbmQgc2V0IENQTEQgcGluIGRpcg0KDQpTYW1lIGNvbW1lbnQgdG8gYWxsIHRoZSBjb21tZW50
cyBhcyBwZXIgcHJldmlvdXMgcGF0Y2guDQoNCi4uLg0KDQorIE1pc3NpbmcgYml0cy5oLCB0eXBl
cy5oIGFuZCBtYXliZSBvdGhlcnMuDQoNCj4gKyNpbmNsdWRlIDxsaW51eC9kbWkuaD4NCj4gKyNp
bmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVyLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvZ3Bpby9k
cml2ZXIuaD4NCg0KPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPg0KDQphcnJheV9zaXplLmgg
Pw0KPj4gd2lsbCByZW1vdmUuDQoNCj4gKyNpbmNsdWRlIDxsaW51eC9tZmQvdXBib2FyZC1mcGdh
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+DQoNCj4gKyNpbmNsdWRlIDxsaW51eC9w
aW5jdHJsL3BpbmN0cmwuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9waW5jdHJsL3Bpbm11eC5oPg0K
DQpNb3ZlIHRoaXMuLi4NCg0KPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L3JlZ21hcC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVw
dC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3NlcV9maWxlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgv
c3RyaW5nLmg+DQoNCi4uLmhlcmUgdG8gYmUgYSBncm91cCBvZiBwaW5jdHJsIGhlYWRlcnMuDQo+
PiB3aWxsIGRvLg0KDQo+ICsjaW5jbHVkZSAiY29yZS5oIg0KDQouLi4NCg0KDQo+ICsjaW5jbHVk
ZSAiaW50ZWwvcGluY3RybC1pbnRlbC5oIg0KDQpJIGRvIG5vdCB0aGluayBpdCdzIGNvcnJlY3Qg
dXNlIG9mIHRoZSBoZWFkZXIuDQo+PiBzZWUgYmVsb3cgd2l0aCBwYWQgcmVncyBkZWZpbmUNCg0K
Li4uDQoNCj4gKy8qIGZvciBvbGRlciBrZXJuZWwgbG9zdCBESVJFQ1RJT05fSU4vT1VUIGRlZmlu
aXRpb24gKi8gI2lmbmRlZg0KPiArR1BJT19MSU5FX0RJUkVDVElPTl9JTg0KPiArI2RlZmluZSBH
UElPX0xJTkVfRElSRUNUSU9OX0lOICAgICAgICAgICAgICAgMQ0KPiArI2RlZmluZSBHUElPX0xJ
TkVfRElSRUNUSU9OX09VVCAgICAgICAgICAgICAgMA0KPiArI2VuZGlmDQoNCkFyZSB5b3Ugc3Vi
bWl0dGluZyB0aGlzIHRvIG9sZGVyIGtlcm5lbCBoZXJlPyBOby4gVGhlbiB3aHkgdGhpcz8NCj4+
IHVzZWQgaW4gb3VyIGRrbXMgZHJpdmVyLCB3aWxsIHJlbW92ZSBmb3IgdXBzdHJlYW0uDQouLi4N
Cg0KPiArLyogT2Zmc2V0IGZyb20gcmVncyAqLw0KPiArI2RlZmluZSBSRVZJRCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwDQo+ICsjZGVmaW5lIFJF
VklEX1NISUZUICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE2DQo+ICsjZGVmaW5l
IFJFVklEX01BU0sgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdFTk1BU0soMzEs
IDE2KQ0KPiArI2RlZmluZSBQQURCQVIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDB4MDBjDQo+ICsNCj4gKy8qIE9mZnNldCBmcm9tIHBhZF9yZWdzICovDQo+
ICsjZGVmaW5lIFBBRENGRzAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgMHgwMDANCj4gKyNkZWZpbmUgUEFEQ0ZHMF9SWEVWQ0ZHX1NISUZUICAgICAgICAgICAg
ICAgIDI1DQo+ICsjZGVmaW5lIFBBRENGRzBfUlhFVkNGR19NQVNLICAgICAgICAgR0VOTUFTSygy
NiwgMjUpDQo+ICsjZGVmaW5lIFBBRENGRzBfUlhFVkNGR19MRVZFTCAgICAgICAgICAgICAgICAw
DQo+ICsjZGVmaW5lIFBBRENGRzBfUlhFVkNGR19FREdFICAgICAgICAgMQ0KPiArI2RlZmluZSBQ
QURDRkcwX1JYRVZDRkdfRElTQUJMRUQgICAgIDINCj4gKyNkZWZpbmUgUEFEQ0ZHMF9SWEVWQ0ZH
X0VER0VfQk9USCAgICAzDQo+ICsjZGVmaW5lIFBBRENGRzBfUFJFR0ZSWFNFTCAgICAgICAgICAg
ICAgICAgICBCSVQoMjQpDQo+ICsjZGVmaW5lIFBBRENGRzBfUlhJTlYgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIEJJVCgyMykNCj4gKyNkZWZpbmUgUEFEQ0ZHMF9HUElST1VUSU9YQVBJ
QyAgICAgICAgICAgICAgIEJJVCgyMCkNCj4gKyNkZWZpbmUgUEFEQ0ZHMF9HUElST1VUU0NJICAg
ICAgICAgICAgICAgICAgIEJJVCgxOSkNCj4gKyNkZWZpbmUgUEFEQ0ZHMF9HUElST1VUU01JICAg
ICAgICAgICAgICAgICAgIEJJVCgxOCkNCj4gKyNkZWZpbmUgUEFEQ0ZHMF9HUElST1VUTk1JICAg
ICAgICAgICAgICAgICAgIEJJVCgxNykNCj4gKyNkZWZpbmUgUEFEQ0ZHMF9QTU9ERV9TSElGVCAg
ICAgICAgICAgICAgICAgIDEwDQo+ICsjZGVmaW5lIFBBRENGRzBfUE1PREVfTUFTSyAgICAgICAg
ICAgICAgICAgICBHRU5NQVNLKDEzLCAxMCkNCj4gKyNkZWZpbmUgUEFEQ0ZHMF9QTU9ERV9HUElP
ICAgICAgICAgICAgICAgICAgIDANCj4gKyNkZWZpbmUgUEFEQ0ZHMF9HUElPUlhESVMgICAgICAg
ICAgICAgICAgICAgIEJJVCg5KQ0KPiArI2RlZmluZSBQQURDRkcwX0dQSU9UWERJUyAgICAgICAg
ICAgICAgICAgICAgQklUKDgpDQo+ICsjZGVmaW5lIFBBRENGRzBfR1BJT1JYU1RBVEUgICAgICAg
ICAgICAgICAgICBCSVQoMSkNCj4gKyNkZWZpbmUgUEFEQ0ZHMF9HUElPVFhTVEFURSAgICAgICAg
ICAgICAgICAgIEJJVCgwKQ0KPiArDQo+ICsjZGVmaW5lIFBBRENGRzEgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDQNCj4gKyNkZWZpbmUgUEFEQ0ZHMV9U
RVJNX1VQICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDEzKQ0KPiArI2RlZmluZSBQ
QURDRkcxX1RFUk1fU0hJRlQgICAgICAgICAgICAgICAgICAgMTANCj4gKyNkZWZpbmUgUEFEQ0ZH
MV9URVJNX01BU0sgICAgICAgICAgICAgICAgICAgIEdFTk1BU0soMTIsIDEwKQ0KPiArI2RlZmlu
ZSBQQURDRkcxX1RFUk1fMjBLICAgICAgICAgICAgICAgICAgICAgQklUKDIpDQo+ICsjZGVmaW5l
IFBBRENGRzFfVEVSTV81SyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCgxKQ0KPiAr
I2RlZmluZSBQQURDRkcxX1RFUk1fMUsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQo
MCkNCj4gKyNkZWZpbmUgUEFEQ0ZHMV9URVJNXzgzMyAgICAgICAgICAgICAgICAgICAgIChCSVQo
MSkgfCBCSVQoMCkpDQo+ICsNCj4gKyNkZWZpbmUgUEFEQ0ZHMiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwOA0KPiArI2RlZmluZSBQQURDRkcyX0RFQkVO
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkNCj4gKyNkZWZpbmUgUEFEQ0ZH
Ml9ERUJPVU5DRV9TSElGVCAgICAgICAgICAgICAgIDENCj4gKyNkZWZpbmUgUEFEQ0ZHMl9ERUJP
VU5DRV9NQVNLICAgICAgICAgICAgICAgIEdFTk1BU0soNCwgMSkNCj4gKw0KPiArI2RlZmluZSBE
RUJPVU5DRV9QRVJJT0RfTlNFQyAgICAgICAgIDMxMjUwDQo+ICsNCj4gKy8qIEFkZGl0aW9uYWwg
ZmVhdHVyZXMgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZSAqLw0KPiArI2RlZmluZSBQSU5DVFJM
X0ZFQVRVUkVfREVCT1VOQ0UgICAgIEJJVCgwKQ0KPiArI2RlZmluZSBQSU5DVFJMX0ZFQVRVUkVf
MUtfUEQgICAgICAgICAgICAgICAgQklUKDEpDQoNCkh1aD8hIE5vIHdheSBpdCBzaG91bGQgYmUg
aGVyZSBpbiBfYW55XyBmb3JtIQ0KPj4gd2lsbCByZW1vdmUsIGJ1dCB3ZSBuZWVkIHNldCBwYWQg
bW9kZSBhdCBydW50aW1lIGZvciBIQVAgcGlucyBHUElPLA0KICBpdCdzIG5vdCBhIGdvb2Qgd2F5
IGJ1dCBnZXQgcmVnaXN0ZXIgb2Zmc2V0IGZyb20gaW50ZWxfcGluY3RybCBzdHJ1Y3R1cmUgY2Fu
IHJlZHVjZSBkYXRhIGZvciBlYWNoIGJvYXJkcy4NCiAuLi4NCg0KSSdtIGRvbmUgd2l0aCByZXZp
ZXcgYXMgZGVzaWduIHdpc2UgdGhpcyBvbmUgaXMgYnJva2VuLiBQbGVhc2UsIHJlZGVzaWduIGFu
ZCByZWltcGxlbWVudC4gQWxzbyBzcGxpdCB0aGlzIHBlciBwbGF0Zm9ybSBhZGRpdGlvbiAoYXMg
c3VnZ2VzdGVkIGZvciBNRkQpLCBpdCB3aWxsIGJlIGVhc2llciB0byByZXZpZXcuDQoNCj4+IHdp
bGwgdHJ5IHRvIG1vZGlmeSBhcyB5b3VyIHN1Z2dlc3Rpb24uDQoNCg0KLS0NCldpdGggQmVzdCBS
ZWdhcmRzLA0KQW5keSBTaGV2Y2hlbmtvDQoNCg0K

