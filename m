Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014693D512C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jul 2021 03:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhGZBTI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Jul 2021 21:19:08 -0400
Received: from mail-db8eur05on2084.outbound.protection.outlook.com ([40.107.20.84]:27745
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231371AbhGZBSu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 25 Jul 2021 21:18:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLTcztdjucHlOnlwF/E2Q7WlZbb6aaZlQI57p3I/hPdyf6x1hInfAawVnOaieNJK9jqvj6rTSIWxbV8PGBrCxQmmvHFW0Do6KNU3kQO/hjwC6NQ7cjlRqzRxeboSMFPB5PTPPw1NsXAM5IE8IrnkdMybLxEsVtYzqlCCgywqsc1hwph0vF4NdhSoVOIxtvGMiHmGOwmhPojRHbizVoiEwIJsNxzsTW2pr3k4YrEmvM0Rs9Zc2WaJw2O+Cl8/pyresxkOUHwOHnbV7sS07NUCN+YUCjdwZRDNqkEAxrk5gaTrUtxcx+RGbGr2jbQGWAw2r520j1FweyRHBTyFV9jXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C/ls2gLZboL5G2Mjd3NyTpFgRv3QV/pbYef1km1+9A=;
 b=ecsIb1RSmnLXsoKyUs7JeMZMYz+zf8+DMBE3wvdZ8WssE/0+vhjaEE8Kn4pJ22paggC18D6vDqgr6kp3StCUOY6p1ol6nEueM4e0oiTQbesJMArwJauxyvmZ6lEc9CR0NJ5/4FF1XDbDkG7x6nhI+xV/s5IjQDEqqcLX6x2G18nhSfYBh2iw3I3xxDkgTll4RmNNmGFkXqRTcaLHTHJYTQqcy9A9YRdWm3pgG2NcvsrJLYrJQmcQgP+6bSm5h+2/jYo/9S8TbTBFQrPOSFJflLBts8vOhmfY2lLwkkgoLs50gl7wBPZ/ffcd+NWo81ipOWTOcTlQJtoeD8gyIEoH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9C/ls2gLZboL5G2Mjd3NyTpFgRv3QV/pbYef1km1+9A=;
 b=e8+upIzCvXQCQJZmu92V108LxSfmfYwLCj0PiblQa3HU5+aN7+/XO8g7TKLAzgYvSEQv7PfR4PuSlL3upOnhHVrKVk/65zfx5/TEfjr+TAwDjTTC+V0f5dQan9ztjj4eUI/tZXtYE6B1Q5mySYryzgjAsVwjwcxo2ZHusjAhc2M=
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 26 Jul
 2021 01:59:17 +0000
Received: from DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d]) by DBBPR04MB7930.eurprd04.prod.outlook.com
 ([fe80::b570:add1:2832:dd3d%9]) with mapi id 15.20.4331.031; Mon, 26 Jul 2021
 01:59:17 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Fabio Estevam <festevam@gmail.com>
CC:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        kernel test robot <lkp@intel.com>
Subject: RE: [PATCH] pinctrl: imx8ulp: Initialize pin_reg
Thread-Topic: [PATCH] pinctrl: imx8ulp: Initialize pin_reg
Thread-Index: AQHXgAHvuAZBZgDV4EK6UuLmtNMpqKtRCZMAgAN5hyA=
Date:   Mon, 26 Jul 2021 01:59:17 +0000
Message-ID: <DBBPR04MB7930BBA607BF36294CD8837087E89@DBBPR04MB7930.eurprd04.prod.outlook.com>
References: <20210723203242.88845-1-festevam@gmail.com>
 <CACRpkda_gfTR6Z3bw_afFXPx=5XVLewkhyJKgwJodHRSysjLtw@mail.gmail.com>
In-Reply-To: <CACRpkda_gfTR6Z3bw_afFXPx=5XVLewkhyJKgwJodHRSysjLtw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 288e26ae-e106-4b2d-3ba9-08d94fd8f9c9
x-ms-traffictypediagnostic: DBBPR04MB7930:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB7930C0205B5569EFB63DE6D987E89@DBBPR04MB7930.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cRfFxoc56YCqd0wM5zi2a8fpc7ya3S6wCsOQOdRtmcQ1u8fRZ4LREr53ordTRvpMj+4kDYPnqgAJByFP5x/FHlfei+kh50fM6BknUIcWmLHN7AYmA672YHiCE4oBwnO9z20tyiHGJtCAlHgGjKzcJjcv+Z37+eEOdLb9AtfDSKGQ4RkzpuLWKFZ9CWgAd0pEjp9bs3h2pznuUikI/aWVityVmQG3g/BnFrvHIkA8cJPg81PAb36UXiPXMlBnIiJLTUAbSqspA4MlEBA9wphey0JEfTzTxm/luQ9epFakgweDS442areNi+TLAewRgGa+ePz9h+nfYEmXUSiE6tdqmDx4VOVrHhudukVfJYJ+EHBHpZZw06x0Ql8yVhNflXRck8YMuH0cMRhMcukOl4eN4JgyySgjKDa+CLFGuJqIRRN533iHqDjoETETr4K+jakCdQHDViJjH0Dp0JGQmc+s4Z7y2KDK/Sj/cnEvMCeLQ52Oi1Rw3CALYxp1BERjnKzke7VUi2q1fVwgR8p96qHrMs0O3RwzWi3YXSaHvFINSVUJxeu0YVldBOIj1neHGVmdABljjtzr2zk+52jk525+HCKK5/TXXg4AtV0NIY7igzdMx67y2mi8S1xlWBfIbKxbtD61nXLuw1dmkpK2LNau0glH7FIKkZUI5ieyPCGoCz4rwtDlEgqJFRFTVb5DnNRGqhSi5EI3cGdEDB81CqH4HfthUfjNlMHQM4Sms13dk4s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7930.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(53546011)(83380400001)(66476007)(316002)(110136005)(64756008)(8676002)(9686003)(8936002)(7696005)(26005)(2906002)(4326008)(86362001)(478600001)(122000001)(38100700002)(5660300002)(6506007)(33656002)(4744005)(66946007)(54906003)(186003)(66556008)(55016002)(71200400001)(76116006)(52536014)(66446008)(32563001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dExOOFFMdjIxQXJ6STR5UkhETVIrYjcrUVl5ZFdhbE5PYmF0bm00TytkU1dw?=
 =?utf-8?B?aDI3TkJLQVdMcHduNVk2UG92bjRrWXIrOXN6NmdheHpVZTVVR1lGd2srL2cz?=
 =?utf-8?B?Q2pxUmhIYkU5N2xUa0paVkNUS01XNTdnR2pOSE03VlhIOGJhdHNFRk9mUmt3?=
 =?utf-8?B?R1RwQnZXRTZvOTlyU0lCQmh4OXVPLzNTMHJDSWxhNGhra0c1NmtKR1ppVm1W?=
 =?utf-8?B?TFBqMEVDSXNLZFRJRXRRMmpyUkV6bmdjTk1Oc1Q0eGZjWmRrVk94SHJkZy9k?=
 =?utf-8?B?NE8xUmdZaUF4THlBOWtLY01aTzVrTno4d1pvR29NaW1ZeUg0RG4rbkdGeU9E?=
 =?utf-8?B?K0QwT2YyTjRha0Z1SVdvVGlYc0FvdlFEOUtPelpNWUZSNm11QzZLWGFxV0w2?=
 =?utf-8?B?UXZ0dnlzRWszUlpKK2dZSm5CSklITFNnL3lNaWFyUnBiZU5xaUw5bVAya0dw?=
 =?utf-8?B?QTRkTnQ3NjUxRkY5enFjZ1g1MDZZelIxV0NsaXcyck0rZkpZMVlXai9LWEpl?=
 =?utf-8?B?WXZRQXRUN0RKMGorNnVrSE1od0Rqd1Y4MThEZGJFc3dKeTcxamxra1U1UXNi?=
 =?utf-8?B?Z0g5SUQ3MkNCQkpJT0dldXMrTUlycEp0eVVYSE1ZVC9FY3RPN0VRQlBTWDlp?=
 =?utf-8?B?TFgvVGNNSUs1bWNsN283cFkrdkVmMmNCcFhVYjZ4MkhMNEd5VFhDaVRFL3k1?=
 =?utf-8?B?a1hpbDdNYnNqN3F5WXZIUFlRUERLSzY4VkoycDM5djZXMFFERFJJcmN4WUla?=
 =?utf-8?B?enZBNHhYZnB3MnBkSW5qOWNHUU9NakFtUlRQVGVMVTRKK1p2Z3VmSXdNYVZm?=
 =?utf-8?B?cURWS2ZqZE5pWThEemhrZXk0Zy9IMGdPdk1BZE9IMm1XQzgwY3BGVUd5dDBu?=
 =?utf-8?B?N2NCeEtpV2ZkNGs5WFhYbWlWU21peXpRNFZTb29pY1BQSmhHblBzSzdJaXJl?=
 =?utf-8?B?KzYxLzJ0ay9WM3ZOMVR2UmxMVjVURjRqRWw1ck9Qdnd1OGxjSUoxNkxsME8w?=
 =?utf-8?B?Vkx4azFLeGROMzhITENkeXc5cEF2anVSSDQ4Umk3RDZrOThJUGJLQnZVK2w4?=
 =?utf-8?B?a2lmNmovWDRBZ3lxV1NvNy9MWkFqZlFzZm5naVF0RmVibWdRRWpDOEp4U25x?=
 =?utf-8?B?cm9vY3p4aUxoVVNCWE9pSXNEbEpyQ2kzck5sZ1M5YjJsZWs5TGZNL1lGbXJC?=
 =?utf-8?B?Tkp5cUNjMU94NHZ2Z1RGaE1BVFBtL3c5bVFUVDZSRGpxaDcxMnZ1dmo0akY2?=
 =?utf-8?B?QjZNc3BIaUlNL2VLUWZveStKSjVUSnV5UXE0OFBobUozckF5M3lVd3U4NVU0?=
 =?utf-8?B?SDFMMmZZbGZmTjZSeURrcWxpVzNHMTJ0STM0R2U4NnZNd2g4ZDJ3TG1FeXAz?=
 =?utf-8?B?Tk9ic24vR21lSUZnZWlOYmo1K002Ymd5ZWJpc2RzMmhrb2tLZXZHSzMrT0pz?=
 =?utf-8?B?eHNkZFE5YlBOcHNVWktaQlJFTk1wKzlOTTRKNk4zQlNFUzBBSlh6aENWeXdm?=
 =?utf-8?B?RktUZS9nUE8wbU5OZ3RVcHo5WWdSUzVmWjlnWC9rdEdib2JvT2RvbWZVWFhO?=
 =?utf-8?B?STV3RWViblpNRVVQV2ZaeG9Cb2NmVjhPSlYxejkxNlY2YytHU2JoZzhKTmVz?=
 =?utf-8?B?QmdIYzR4STVzVW82WjlsSGlJWlNpekhKRkVETXhTZ1dpSmZUMnRjTXZWTXBj?=
 =?utf-8?B?SFU2SG9yUFBvZ1RTMkdNNTd0dUovR0lLcUN3cXhXWTFRQzRNWkxEMUVRMEkw?=
 =?utf-8?Q?Ww6pZROFIvcGzH9Lc4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7930.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 288e26ae-e106-4b2d-3ba9-08d94fd8f9c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 01:59:17.1094
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rhalgUob+VhSViroJeAEq8DjlG94NhOLHJASHWrxdu5uivfPxrfF3ra4xftBtlDvOdEffKDEMO+urDAtDfM2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBwaW5jdHJsOiBpbXg4dWxwOiBJbml0aWFsaXplIHBpbl9y
ZWcNCj4gDQo+IE9uIEZyaSwgSnVsIDIzLCAyMDIxIGF0IDEwOjMzIFBNIEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IFRoZSBpbml0aWFsaXphdGlv
biBvZiBwaW5fcmVnIGlzIG1pc3NpbmcsIGNhdXNpbmcgdGhlIGZvbGxvd2luZyBidWlsZA0KPiA+
IHdhcm5pbmc6DQo+ID4NCj4gPiBkcml2ZXJzL3BpbmN0cmwvZnJlZXNjYWxlL3BpbmN0cmwtaW14
OHVscC5jOjIyODozNTogd2FybmluZzogJ3Bpbl9yZWcnDQo+ID4gaXMgdXNlZCB1bmluaXRpYWxp
emVkIGluIHRoaXMgZnVuY3Rpb24gWy1XdW5pbml0aWFsaXplZF0NCj4gPg0KPiA+IEluaXRpYWxp
emUgcGluX3JlZyB0aGUgc2FtZSB3YXkgYXMgaXQgaXMgZG9uZSBvbiB2ZjYxMCBhbmQgaW14N3Vs
cCB0bw0KPiA+IGZpeCB0aGUgcHJvYmxlbS4NCj4gPg0KPiA+IEZpeGVzOiAxNmIzNDNlOGUwZWYg
KCJwaW5jdHJsOiBpbXg4dWxwOiBBZGQgcGluY3RybCBkcml2ZXIgc3VwcG9ydCIpDQo+ID4gUmVw
b3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4NCj4gDQo+IFdvdyBob3cg
ZmFzdCENCj4gUGF0Y2ggYXBwbGllZC4NCj4gVGhhbmtzIGZvciBmaXhpbmcgRmFiaW8sIGV4Y2Vs
bGVudCB3b3JrIGFzIGFsd2F5cy4NCj4gDQoNCkl0J3MgbXkgZmF1bHQuIHdoZW4gSSBkaWQgYSBj
aGFuZ2UgaW4gVjIsIG9uZSBhZGRpdGlvbmFsIGxpbmUgd2FzIHJlbW92ZWQgd3JvbmdseSwgc29y
cnkgZm9yIGluY29udmVuaWVuY2UuDQoNCkJSDQpKYWNreSBCYWkNCg0KPiBZb3VycywNCj4gTGlu
dXMgV2FsbGVpag0K
