Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC00333B0D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 12:08:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhCJLIJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 06:08:09 -0500
Received: from mail-eopbgr30046.outbound.protection.outlook.com ([40.107.3.46]:43655
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231228AbhCJLIA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 06:08:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEdKYxueTQGnnBtZJgu6IQYGWeqrEEsO3ZxF+sI8/EENpaHF6u6UiU6T5a55e3a8E/s2juzFmbo6DFK5kz8DUFUeQI3NflVwGFuUzZ8atXd1cE4yCE5RR7iruhh9mKJUgF++Dv8bvyHFXckBOUcRCHcuINiJtyG+kiU4OVHEj6tnTYrMjCnsuN4zhuRy6SkZyuqulMLPSkBJKdJN4f0AOgcsCDQH6aJ5W/Ps6CEAsfrbObq1li31T2tsPXcdqR3MXhveAOQvzi2qetCEDrgVPaSIE6SO/P+rWQdyFPg07z3nlqmUFZWo7xHU731809I8H+RKVmOAepViFDR5Dqev+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIWfNStbSTdlu++VRndaLmggbMhbqNXxC9igmTJk8TI=;
 b=VAGjQVOxr8DbPuTSrD1ykU6Xoyfi7ldJPxfMKitmX8WoCR0MdGAik9W/UgxuNlKsx2N0H9GbFZ1BZ1TFrMu5EWQvRMj0ce1CeHNzzFyr478Z0ivYXwJAWjjda8yR/b5IA7ZAycNkfYxsEaSqvXE0NcFqGYKRzTlGzHEQHzHeECDOEheMj/k54SI2uDoB4jezIYzatei7cq/s7iiUmIsJ3TCyT/246mpYX2Fc/J8Sbz6UJn4AXADsHPrn8CKFH3t1+z+aXo+xeE4sZ4xOKYAy7kX6HXXs1PqucJH6KzrRoC211R9e1yxAAAJFhI/yYvxL1Mtvq1iRYMHkTJYK/DRtfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIWfNStbSTdlu++VRndaLmggbMhbqNXxC9igmTJk8TI=;
 b=bzPfY0dwJ1QHE2H1PDpsEb9neO6pHvlxLnZH3dCL5k92N3fWGPIRESdSeyIxkqHeIgCwvdy30aV8NnKhTqBH6+y6iD1ttpllypHlK/2AkxMbmrQUAs7W9EEqfgoS9ajy3nGPk+pCxyoFcLTD2i9wiSBV5VP0TRKEBGWMmuTIE1s=
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com (2603:10a6:6:37::21) by
 DB8PR03MB5916.eurprd03.prod.outlook.com (2603:10a6:10:ee::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Wed, 10 Mar 2021 11:07:57 +0000
Received: from DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::b9e7:8bf5:5cc0:3443]) by DB6PR03MB3160.eurprd03.prod.outlook.com
 ([fe80::b9e7:8bf5:5cc0:3443%4]) with mapi id 15.20.3890.039; Wed, 10 Mar 2021
 11:07:57 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lee.jones@linaro.org" <lee.jones@linaro.org>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Thread-Topic: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Thread-Index: AQHXFAeThOfRkEE5mkaeeVQj/9kDWqp9CnKAgAAIvIA=
Date:   Wed, 10 Mar 2021 11:07:56 +0000
Message-ID: <a631bbc3dd3bd0f02693d1c35f9a14dbaec67cc3.camel@fi.rohmeurope.com>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
         <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
         <20210310103639.GG701493@dell>
In-Reply-To: <20210310103639.GG701493@dell>
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
x-ms-office365-filtering-correlation-id: 7c2f7e6d-72be-4565-3de4-08d8e3b4c287
x-ms-traffictypediagnostic: DB8PR03MB5916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR03MB5916D4DFF2A4B50873E519D0AD919@DB8PR03MB5916.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iZKaTXAX3CXLPLPyRShcfxwMgjm7TPBmT1nv6z1hoFTj4UAiBV9iCVeJE3KF5pOo/BqL/2sPGnHysV5GCJxysWlBx7b3UvWXduY6tNrxMLPgq0scPXF2Ja779FEM7OP2U+GcuuDlwD5IyhEkVvQffT1U81PQ8yXhR687LbP+hZw1HD87ZFtjJlvyorAvZZCAleClLjT9BeQj1gkolV+sH6XPAbYg9dzx3D4V+zyjK0uhWMAvFcea60eYIxYqLlCZYEU5dmXyMn+wU/2C7oJxHdyMuDXSx9OiOguWaPVacV9q9iHDU48ojkFC2fZ8lgc3UjDNExjg025oGXk5t5ULgQm2iIU76t4CZXNgGNMb2/sxTcxoqNwPtdXCRbAFQL5UCourIYlCW8ZMJiqKU5uwemX/vF0JXF8GjiDtopoTZUPebF8mJu1qKkCJk+B0m0DJ6vzI/w6j5wNvAEzYwd1HVgVoAhr46sxKuKoJi1WcSw8j/lAHktmx4Y/bJmf9DvHNmSx/J5xB61PzfscEc5F6pg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR03MB3160.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(2616005)(4326008)(186003)(71200400001)(5660300002)(478600001)(3450700001)(316002)(6916009)(54906003)(86362001)(6506007)(8676002)(8936002)(64756008)(66476007)(66946007)(6512007)(66446008)(76116006)(91956017)(6486002)(83380400001)(2906002)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?cGJ5eUs0T1RnZkxMVXNNTjhzN1dVL0FYRGlyOXUrMWFPZG1UaDAwYW1xTWti?=
 =?utf-8?B?KzMvVEdWTCs4bG9aam5DV3ROM1FWSXNKN0tXdW0wTmJnM1U3NVZDT0JFL0Qx?=
 =?utf-8?B?THJVTXI0eTVyK0FuSWZ6c1pYYzYwSUFWcWE2eEQxbTZOYUtPUU1Ca2gwUU9P?=
 =?utf-8?B?WDVoWUp0eHB5WlY4Vk9vd293SUJBa2Y4ZmQ2ZUkvcHJ4QXNTYTJGK2lxbTJX?=
 =?utf-8?B?Uy8yaHdJYmY3MU0vbHNmbHdnYVkvcldUdmpWZmZGcGtSUXFzeGdEOUVxVWh2?=
 =?utf-8?B?SFpQMG9yV24rUE91SlNORmw5Z1ovaWFFdk9CZjRrR2ovenFoa1ozRWxSWm1G?=
 =?utf-8?B?OXpzek10bTRMbHQweDd4endUdTg1Z3BzT21MOGxJMG9ibkVLNm4xZXNaR2R3?=
 =?utf-8?B?RE0yTWd0OWFyTHVWbW1xWDY4ZTN0TjBtSzlNR0NuVEZvNUJyT3hDMTFSeWZp?=
 =?utf-8?B?a2ZQQndETW9VbmU1cW9lU1l3WHBzcmE4MWh5VGQwbFh0dlZqRkI4ZWE1MlUz?=
 =?utf-8?B?Uk1CZ0FaYWR5WVZEZ2pGcGJob09nVHkyR245MmtSVSt0SFBVdUpJWnJQMG0x?=
 =?utf-8?B?WHVCL00wbmNUQkR0ME9JUXlaWGRuVHNROWZMUlc1eTJidHJCOWZYa2lDSmRB?=
 =?utf-8?B?RFpUaVFtZXoyenYvbTA0bHA0RWVuckVqbzFjNkNwMzRMMWJKakNwKzRrV3dV?=
 =?utf-8?B?d1hRNGxTd1FFQ2xWUm9hZDQyaFZSRVJ5TG94cnpoeWJtaGZOamE1YzBzVUpz?=
 =?utf-8?B?M2NEWGZVRnJVek9vN05DVUhkTzk4ajJ5T2JHTWVYa2owYm10RE1yU1VVcTg0?=
 =?utf-8?B?YmRvNm5UUzNSOXdFT0VGQ3RjUmZ2RHc4akNxR3BsMmNrTU9zdkU5WktjN1R4?=
 =?utf-8?B?cmM0U1FYNVFEUWFXNUxKOEpmOTUyblRtai9qSlljTUVHTG92RGIvUnRaaCtk?=
 =?utf-8?B?ZE1yRmZsRWtRRlYyVkxDb3BCTGxmazlaZEJ5NlFVYTFwOEkzMU0zSUZwRGNJ?=
 =?utf-8?B?OXpyTm1raHd6WVFhTFgzSDdzTGo0MDNFa2NYK0R3d1UxRm0zZlFhcENKZFVo?=
 =?utf-8?B?TkgwZWlJRE5QK2tpYnBROUdpNHhBV3ZqRzNnelJkcWVlbzdSVWNnNDJ0NHpo?=
 =?utf-8?B?VXhoMkI4UE5wbTA4KzZJMUJpZW5DMlB5UTJyOEpYMnVOR0NsNHhzV2NERFMx?=
 =?utf-8?B?cm95d05rcjJhZkt1Y08yVXVMSDVqVU5pYWNkMEl2Umw5b1k3WE1QbTMzSjBJ?=
 =?utf-8?B?OEFxV3luWDZhNVoydTVheVdGSnI3eGNqdTNwMHZCc3A2ZDUxTm0rRjViU0pJ?=
 =?utf-8?B?MDg0MTg1a2grWFlkellxNk41d3BHckhYRWJUR1NnZHFIdGpkV25GSERmdUF6?=
 =?utf-8?B?cG9lZmRnREs1SDZLMGlsU1VZaUN5WjUwM04ycFBmdGc2SjNXNFhTcUdrUWVz?=
 =?utf-8?B?MTFSYjFsOTQrdkFsc3dCU1JVT2VYTHJaODAva0JnaGYxSGVjQlMwWnA1cy9x?=
 =?utf-8?B?MW9md2RzY1BBQTM5ZGs5ZEVQV2o2aDJyTWxHVW52emZ1eVdGbm5YeEczTUZm?=
 =?utf-8?B?MlhHSi80dUhKRDBXTHBWNW56MEdvWGFWWXB1VjVxTzdYVEtJbHZmcjBNNEpL?=
 =?utf-8?B?TEpDV1V6cG1EaERUdFNJajlxaEZCdlYxUkpTVHgvSkptSlluU004NTBvMWNY?=
 =?utf-8?B?NnB3RVk1NkZ4dDlKZGJQYjN5UmFOTGljVmltVUljQUZRWllONjZRRTAreHZl?=
 =?utf-8?B?OUVwc2VTb0Y0REcrVTZhWER6Q3FwVjVmU3JkQ0Y1ckJ2UEQ2RjhGbVJzOEFX?=
 =?utf-8?Q?4RYSWGwzhIDkKIIGYDIdKwSk620z2fF4EdhZs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97D9E0CAE7FB9845899563F97E85677B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR03MB3160.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c2f7e6d-72be-4565-3de4-08d8e3b4c287
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2021 11:07:56.9517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RpqRQxfHc5a6Zbm36wBG2PHN09Pxe1x+euarGvpg1feMihGwiXXjvwC70f2fpED5mMa3GgJPNxziB5RF7hu8aNVrGlNCaFyhEo1QjrpODlsGxfoZZavwied9pWQA8OwQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5916
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGVsbG8gTGVlLA0KDQpPbiBXZWQsIDIwMjEtMDMtMTAgYXQgMTA6MzYgKzAwMDAsIExlZSBKb25l
cyB3cm90ZToNCj4gT24gTW9uLCAwOCBNYXIgMjAyMSwgTWF0dGkgVmFpdHRpbmVuIHdyb3RlOg0K
PiANCj4gPiBBZGQgY2hpcCBJRCBmb3IgUk9ITSBCRDcxODE1IGFuZCBQTUlDIHNvIHRoYXQgZHJp
dmVycyBjYW4gaWRlbnRpZnkNCj4gPiB0aGlzIElDLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IE1hdHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPg0KPiA+
IEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+DQo+ID4g
LS0tDQo+ID4gIGluY2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oIHwgMSArDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaA0KPiA+IGIvaW5jbHVkZS9saW51eC9tZmQvcm9o
bS1nZW5lcmljLmgNCj4gPiBpbmRleCA2NmY2NzNjMzUzMDMuLmU1MzkyYmNiYzA5OCAxMDA2NDQN
Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9yb2htLWdlbmVyaWMuaA0KPiA+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvbWZkL3JvaG0tZ2VuZXJpYy5oDQo+ID4gQEAgLTE0LDYgKzE0LDcgQEAgZW51
bSByb2htX2NoaXBfdHlwZSB7DQo+ID4gIAlST0hNX0NISVBfVFlQRV9CRDcxODI4LA0KPiA+ICAJ
Uk9ITV9DSElQX1RZUEVfQkQ5NTcxLA0KPiA+ICAJUk9ITV9DSElQX1RZUEVfQkQ5NTc0LA0KPiA+
ICsJUk9ITV9DSElQX1RZUEVfQkQ3MTgxNSwNCj4gDQo+IElzIHRoZXJlIGEgdGVjaG5pY2FsIHJl
YXNvbiB3aHkgdGhlc2UgY2FuJ3QgYmUgcmUtb3JkZXJlZD8NCg0KTm8sIEkgZG9uJ3QgdGhpbmsg
c28uDQoNCkJUVy4gdGhlcmUgd2lsbCBwcm9iYWJseSBiZSBhICh0cml2aWFsKSBjb25mbGljdCBo
ZXJlIGFzIGJvdGggdGhpcw0Kc2VyaWVzIGFuZCB0aGUgQkQ5NTc2L0JEOTU3MyBzZXJpZXMgYWRk
IGFuIElEIGhlcmUuIExldCBtZSBndWVzcywgeW91J2QNCmxpa2UgdG8gc2VlIHRoZW0gc29ydGVk
Pw0KDQo+IA0KPiA+ICAJUk9ITV9DSElQX1RZUEVfQU1PVU5UDQo+ID4gIH07DQo+ID4gIA0KDQpC
ciwNCglNYXR0aSBWYWl0dGluZW4NCg0K
