Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812A94828C9
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jan 2022 00:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbiAAX7l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jan 2022 18:59:41 -0500
Received: from mail-zr0che01on2104.outbound.protection.outlook.com ([40.107.24.104]:39008
        "EHLO CHE01-ZR0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232731AbiAAX7l (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 1 Jan 2022 18:59:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JiPyw+uko+4gvjZdFSx1wVJ5XHiz4/GPXpuU9KLHJQMVH2Iu8h35xjywYVsFp4gzm774iVpTWycBQJeTunXlFEErCM4cMdoIsZ1RI7yLXo4Hz6nxY+vikuJYYpHPs65stBhLU4U4CPbhiq2eWrVmpPWIe+f9eO2yRL+yfaO2/Njzy/q0Cg4CrvLwsOmynYmljwsQjEG8kzAjFZJLU+E1feaE2RmkQHtuOXJArI7GQjjCXW4YPI7kkxrqdYFBBE0J3bSbklGxpYmC/8kwcJeKH92BG7NdxrsHukgyCbf6LxyhsxOFrppIIg2v+AX9eCBxuCxWamKxx+qW3tGka88QCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWsfiTgVVI2HzJ1OY50GNSMQAl/c9RiObsqxy4yz8ZQ=;
 b=Iwtws0Et0OWzU8oSDaxOWlRs2sWyXgroaiTXizd76oI6vHlzDK8AQ1gOsD/WICNFbC5R3HuANPrfRKTlXv443Z/+NiFTwhdvXGThYey5SELIidtWCL8oqti91UzPHzQqYNYI2ynGDFw5bScngyjgnt7tKE4gePOgWtRInBq8SksJV80MjR+2qybDXQDhR7/DLTq6XAW21AXvyelXQ/Z/Pwyzz5RBt96O7fNiq2NhtACuTwbSmaAqWSgcC7Me/q/Q+Xi5cdmgKc+aQCTGKdQulodNwUTgGUjlMBKWmSv65zb8jrWJU2nk748BjGugOqoFC5v6ALKNRdUYo4/qryejuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWsfiTgVVI2HzJ1OY50GNSMQAl/c9RiObsqxy4yz8ZQ=;
 b=Q4u+/E1Y3GGozMcK71YhAfp/2p5KTfZL/OKaLmDJzbYo2R+Gnd3tn8Os6z6y3Bs2ipACmcYjmTWRwEDJWoLynPlb8C1vxNJJUuhZSQ9u3/nlrZz/4j4SdnNVnLjGkx25An2fqO2Qb8UJNROuu2sde8QsUxElrVbN2O1jFaWoZEQ=
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZRAP278MB0304.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:29::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4844.15; Sat, 1 Jan 2022 23:59:39 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2de2:ea03:cafb:56c1]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::2de2:ea03:cafb:56c1%5]) with mapi id 15.20.4844.015; Sat, 1 Jan 2022
 23:59:39 +0000
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
Thread-Index: AQHX/2sM4iOk/PxYDUqia857vro0UqxO2AAAgAAAbgA=
Date:   Sat, 1 Jan 2022 23:59:38 +0000
Message-ID: <b7e316f64b55175bca2f9c986378f93ec3ae9e74.camel@toradex.com>
References: <20211216162206.8027-1-zajec5@gmail.com>     <YcOJieHGeA7p+NIF@ryzen>
         <b9fe3fdd615fc0a91c9374a58f09d2f3ed38e0c3.camel@toradex.com>
         <0ce1b7cb-ae08-65fc-0e2e-1f58ebac7937@gmail.com>
In-Reply-To: <0ce1b7cb-ae08-65fc-0e2e-1f58ebac7937@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49b5da86-a332-4f5e-9210-08d9cd82c562
x-ms-traffictypediagnostic: ZRAP278MB0304:EE_
x-microsoft-antispam-prvs: <ZRAP278MB030443901072E5ACBCF18011FB479@ZRAP278MB0304.CHEP278.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ytGefnsuvDD4+kWn/pWzFwTXf9qBKqabNwT9biqKSKXQYnFEe0+txigsRsT8IAULqydKB9TxSRYRP1hfTZERGjA6e0/FCZSRkQRrKqtv5N7sQpTTh+Zn9uek26yDFWMMwD3zs+laGKECvQIpK1aLL04fl5M+WgfW2H4YF/+4pStq5y2j1AGRKSN6sbwC+z9qsEesmrmm2QsZcyMaXCSxdaKz7fa3KCzWgdlUxTH2YadPBbp1wfCQfNTYqx2Ln6Jra53phkYYk71WwrEA22qx0tdUoSunIWvSAD2m5RgB9oC4unqP1u7lEVZV/HB50l1uwx4U+VpGAAJ5cuqupAbfyHKHDr8sTEsk66DdyR3ylPcKt1x8dXgnwWEDsAVArtU3E+j1/cgMxantngLpnxp1d7nNoqWLSwzVVkPejlYxL9io0q0W0WhmPHw8tP15Xzq7wJmMRJkPxIygAllBBkdEAs+fHnnMJCjhHPfj5GF1tzV7tBCt+GNsWH+UH5e9Qysz09568uIGe1p0LfhQp+t/+eCwKWYJnvF8sSNBNdZZos4kP52Q73yeNKxRWWE1xBzYPmQ+RoK+XuSXVsjeguZ+W7svpSsrlmwY23EW6slIrMG4us46Bj5q2zoYfxCGssHaUUeaKzGR+j12kNdFxIfVfp44NuaN+uOemVbewUyMcqk0rL08t/iE/gKGL4/1GvkgsKifiHG06gFMOgALcQefzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(66574015)(316002)(83380400001)(122000001)(6506007)(38070700005)(2906002)(7416002)(38100700002)(186003)(54906003)(4001150100001)(110136005)(71200400001)(76116006)(4326008)(66946007)(66476007)(53546011)(26005)(64756008)(66556008)(44832011)(5660300002)(8676002)(508600001)(66446008)(6486002)(8936002)(36756003)(2616005)(86362001)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2JPMEROT0ZEenIwbG9KNzArMVJsanU0YUlkOVQxc1R3MExMUFp1ejU2cXpo?=
 =?utf-8?B?M0dVNDNVLzgxMHpkKzkzVzB2TTJUVk44d3gyMzFucm9MSGRaT1B4dTF3MWxx?=
 =?utf-8?B?ZDJCMW9RQmM1d0RzUk83YzV3TzZhZHdPbEtjdURSSnBheGl2aDBNaExuY2pB?=
 =?utf-8?B?eWhZaWpkZGRSUHdNSWp1Tlk2ODYxMXZqdk5PSjZxZTVjNEVwSDJIMUs5NE9u?=
 =?utf-8?B?Vkc0L0RpRDBRTFVjUkdjdGlrbEdDUjdqSmZiczFXRFBlWkJ4VXJlU094SVFv?=
 =?utf-8?B?NFp0aWQ5TjdTWHpsZWJvM0VuaUY0c0NmWVpNSnlzenhZNmFJQmxXUlJaOEE4?=
 =?utf-8?B?eFcwYXV0amR0K2sxRlI1S0xlTURiMHVNenh5MkVLSEdFWS9xTnBQbTJMaGls?=
 =?utf-8?B?dVB4RkhwQzIxcEdrL05FVVVta3hBOVZDb0xGMkdOaFpFQXhtYVF4S28xYXZz?=
 =?utf-8?B?VUdiMHpvNHZzWDdweXk3eGFkbkFDUjVyOE9EYUZDOUVoUDVJWkxtZkwwbnAx?=
 =?utf-8?B?YkdOZ21yTW5jaFpSRW1TeVZOSW53b1ZaekdxRE51MTJXRFhHUGtOb0RXaWxT?=
 =?utf-8?B?Z05HVUh4WE1TUUJyQTM4d2JWNGJUbjFXNGpnWC9DdHFMMEkvdWlCWjBNMkc3?=
 =?utf-8?B?ek9YVFZHdVRCN0I3QTFCV3U5bmF5d3Bla3Q1a0FWMTBZanJ3UFZkVVZySXZl?=
 =?utf-8?B?ekFacWg2VFJOTzlwTzNVR0xxL0Z5aVJlaXRTRWF6Mi81VmEzdXV3S2N4YzlJ?=
 =?utf-8?B?WU1DMitib3RidFFaR2RXbEd0QnE5Tjk4YUpXWXFFSU4zallzL1NUejJVV3Bq?=
 =?utf-8?B?VGE1d0lRQ3A4NmtsOHltSVNBNkVEZmN3cGY2SWZueXl1Sy9DTjR4RlpIUzAy?=
 =?utf-8?B?TWk3ZFFxZkRVNTJKY3lDTmg0Y3NTdmV1NVd4OFdlelRsNnRPdXFsdWh2bURQ?=
 =?utf-8?B?T0g0NGJNOGZvQ2FpYXhIZGxSbjdqTnhGVlV2YTNldjlaQ08wYTg4TkJnNjlx?=
 =?utf-8?B?ZlNtMjVQNjhDZExZQ04yaml5NEF3TmVkZFlyMEQva0RKOTlidERWZmJNOHJy?=
 =?utf-8?B?YTZsQUtPblRjaTUrWGc5Q3BvUkE1YkEyQWFkSjlTUEFlcCtuVzZNNGM4eDRi?=
 =?utf-8?B?TExtY3U4U0g4ZUEreWVwcElsN0ZqVXd4OCtpUGhrSlMrRlNFM1o4eDZZY0x2?=
 =?utf-8?B?eXRRdnBJbjZvS0piWHJKbVNMalMrRjZyU3NQOG5RMGRDQXBBRHhrem9raEZE?=
 =?utf-8?B?V3ozSHlwcnBoY3Rwd1JFSU1VS1M3TDJGZVRiUE5DR2pJMFIrazA0NXFNZFpJ?=
 =?utf-8?B?Rlg5VHgrWGRCcEFoRmxnRGV5Q3hiTkprelYvMWtJdzdhV1FjejZickg5S0NE?=
 =?utf-8?B?VXlDT2h1VWk3RjdrT2x6WFVBd0Z3ZS9GK1d3U2xldmFDaFB5NVJHY3MyMmZi?=
 =?utf-8?B?L09iZUtKdVdUbzV6QmpxemhqMzdGckpoaGpRQXVDM2l0SFBuM0lOeUxscDhp?=
 =?utf-8?B?THA1VW8rVjhvV082RVp5SU1CblRxOFdaa0ZvRDlOc2RtbHNzMWhjMkR6UGlC?=
 =?utf-8?B?d3Q1ekpHNytlRDBwb1Ayb2hlUkZTUEVmUTBXaXl5R3JHcllZOEZnVFczQ3BD?=
 =?utf-8?B?alBDM2EzdHpzU3N0WitXNDZYVFRTQ1Z2ekV1anJ5NFdlbnQ3a1pKd3Boazd1?=
 =?utf-8?B?RDRKaElxdG55MnZJUTROS0VwRUI0alFoUzdpR0VWQU5uWERDMCtNZW54RzNU?=
 =?utf-8?B?djdOTnlvQm1jR1E0a3JacjNvZkJhYnF2ZisvWDIrU3BjTnVtangzb0kwbWpv?=
 =?utf-8?B?aVdIV3Zzd3NuUS9HYnZZZk14TEhWaDRvYkMzYmZFQUpzRmpxUUtwVTFFbW9F?=
 =?utf-8?B?QTlSc2xFNWl3Nml3cG9VWXpUd1Y3VjJMN3l3SW5zak5LaEduSEpPS2IyeGZX?=
 =?utf-8?B?R2ZoYk1UQkNOZm1teHVmY1JJaXU5SUdtaDBqUFJ4bHFKTHMzUzBLaXJJZ3J6?=
 =?utf-8?B?Z21WY3Y2RWZNVnI5bXl4SXMyOEtGOTJCeHNZc1hPQlBjd29yWjNUaTFZSFZY?=
 =?utf-8?B?U0R5aU1JY3pyajlUTmhtZW9sdjFVTnlkMEV4ZzdkWG1WYmh2R3FrUVNoeU51?=
 =?utf-8?B?MW0wMHdTRVo0WWJJWFBrTmFKby9hcUdMd3JsVlNjaDI5VldsZ1I5Sk9qQ0tR?=
 =?utf-8?B?ZTkveWlmMFJRNnZpbVlsZUNLMzNMUDh6VmJjNnlob1RjeG13YUwyNjh1Sk05?=
 =?utf-8?Q?aTyV5NRDWHjsUvK+1l5Yo8xetJ/toQK5SIQ9CUesCo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E09F963BF7CB174C84E84ACE493D155F@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b5da86-a332-4f5e-9210-08d9cd82c562
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jan 2022 23:59:38.9395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mW9vPXZ8ekdTboNNAZKBPSiLdm7t0ygFM6tgM4Ro1iKTDj7CQKaLwlWPTgCwkxZmW+uRoc8we4/vzYpTNTab2gr9PrnBx1AOCHRRG063NfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0304
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gU3VuLCAyMDIyLTAxLTAyIGF0IDAwOjU4ICswMTAwLCBSYWZhxYIgTWnFgmVja2kgd3JvdGU6
Cj4gT24gMi4wMS4yMDIyIDAwOjU1LCBNYXJjZWwgWmlzd2lsZXIgd3JvdGU6Cj4gPiBPbiBXZWQs
IDIwMjEtMTItMjIgYXQgMjI6MjQgKzAyMDAsIEFiZWwgVmVzYSB3cm90ZToKPiA+ID4gPiBAQCAt
NjYzLDE0ICs2NjQsMTYgQEAgc3RhdGljIGludCBpbXhfcGluY3RybF9wYXJzZV9mdW5jdGlvbnMo
c3RydWN0IGRldmljZV9ub2RlICpucCwKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZGV2X2VycihpcGN0bC0+ZGV2LCAibm8gZ3JvdXBzIGRlZmluZWQgaW4gJXBPRlxu
IiwgbnApOwo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
LUVJTlZBTDsKPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiA+ID4gLcKgwqDCoMKgwqDC
oMKgZnVuYy0+Z3JvdXBfbmFtZXMgPSBkZXZtX2tjYWxsb2MoaXBjdGwtPmRldiwgZnVuYy0+bnVt
X2dyb3VwX25hbWVzLAo+ID4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZW9mKGNoYXIg
KiksIEdGUF9LRVJORUwpOwo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBncm91cF9u
YW1lcyA9IGRldm1fa2NhbGxvYyhpcGN0bC0+ZGV2LCBmdW5jLT5udW1fZ3JvdXBfbmFtZXMsCj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzaXplb2YoY2hhciAqKSwgR0ZQX0tFUk5FTCk7Cj4gPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKCFmdW5jLT5ncm91cF9uYW1lcykKPiA+ID4gVGhpcyBsaW5lIG5l
ZWRzIHRvIGJlOgo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWdyb3VwX25hbWVzKQo+ID4g
PiAKPiA+ID4gT3RoZXJ3aXNlLCB0aGUgZHJpdmVyIG5ldmVyIHByb2JlcyBzdWNjZXNzdWZ1bGx5
Lgo+ID4gCj4gPiBBZnRlciBteSBpLk1YIDhNIE1pbmkgdGFyZ2V0IHJ1bm5pbmcgbGF0ZXN0IC1u
ZXh0IGp1c3QgaGFuZyBlYXJseSBib290IEkgYmlzZWN0ZWQgaXQgdG8gdGhpcyBjb21taXQuCj4g
PiAKPiA+IEkgY2FuIGNvbmZpcm0gdGhhdCB0aGlzIGZpeGVzIGl0LiBUaGFua3MhCj4gCj4gUGxl
YXNlIG5vdGUgdGhlcmUgaXMgb25lIG1vcmUgcGVuZGluZyBmaXguIFBsZWFzZSBhcHBseSBib3Ro
Ogo+IFtQQVRDSF0gcGluY3RybDogaW14OiBmaXggYWxsb2NhdGlvbiByZXN1bHQgY2hlY2sKPiBb
UEFUQ0hdIHBpbmN0cmw6IGlteDogZml4IGFzc2lnbmluZyBncm91cHMgbmFtZXMKClllcCwgYWxz
byBqdXN0IG5vdGljZWQgdGhhdC4gVGhhbmtzIQo=
