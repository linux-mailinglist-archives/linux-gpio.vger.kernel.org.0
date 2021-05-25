Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C5C3905AA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 17:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhEYPlS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 11:41:18 -0400
Received: from mail-eopbgr60060.outbound.protection.outlook.com ([40.107.6.60]:41348
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229890AbhEYPlR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 11:41:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RB12XfO4ESUDjo1dyk81Eme8t+z+3fLvUIXsadT/G7zf9zQaYhak8lTooLmmXekXjikBN/sivi+SuFfNy+uvqvCO4waQaMGOU8WrK/YVlscfa5uH64oz5P3zrKccWYkqmrODaA3we0wHdE4aYMeHpzbVRTWMKQGIClZlv0eKEF+pUjRyzOfm2v543TXcdysy5zT0sknZhILObf+1rmJ+KW+0TovojUpQmHoef+G1BKnvgc2nRyBorNWB7wTKQCcl6/RDvPShC6j15Jza6mVnonppf4OTg3qAuEJgt/sHRH08kIXFVYmva6WSzOMj3et5lRPCX74ajJ9JQ8/2Dch8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xC5zk9HGu0W/TaVG2LyZSi4C7Bm6n5HY7GvWBpwYfSM=;
 b=WpyWZ1pXE06M6qylOti4ccxvYo4sJAjVBiQvPrkABTEWmh7E32JQ2y/nYzxiQUPbGbOy++Nl5LbwK8QGDGncwopXE7HD7ISnM79l30LDEN0BOh2DeLq28YkMpASlgcA3BwpqzgqdZ8nH3g7sikZy6BMi1VgPsyDo4oak5FQX7/S7voc9IPLmbQyyjZBsCaUh3d1DSPoUMZqEd+GivKF0J8m6e3C5GrRKTRa5YeW1O9q5mxLw5bDfaJEw/unCqnU6ZoFkmEKNH9hLZpCBRpqMfPzzmVSEr9sTiZBEAyxO4mpVrWy/qgUmn3OEdecYqjiuTID95+bS/GB9U8HaGa1y+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xC5zk9HGu0W/TaVG2LyZSi4C7Bm6n5HY7GvWBpwYfSM=;
 b=H8LUZH8etnNuB3t5pr2gOlvIZBhYHkrB249cgKq16WyWiGANVpEUAlOy/r383DMiu/1EP2BUoGaJWWBtdoXKGKR08abnZqiEy5PYKilHND/U/eykhVGkLIQy1oS4UrR5eEHd9MT6dKUqqBP58gugiaPlEMB1t4npF14YlbHVuyU=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2395.eurprd03.prod.outlook.com (2603:10a6:3:6d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.27; Tue, 25 May 2021 15:39:43 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::89f0:ff95:a73a:cf4b%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 15:39:43 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "lkp@intel.com" <lkp@intel.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "michael@walle.cc" <michael@walle.cc>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/3] gpio: regmap: Support few IC specific operations
Thread-Topic: [PATCH v3 1/3] gpio: regmap: Support few IC specific operations
Thread-Index: AQHXUWOo/8qhIAhgt0iIGatOWTJ/Rqr0U2WAgAACLwA=
Date:   Tue, 25 May 2021 15:39:43 +0000
Message-ID: <dc2b708866afdde0dff68014377f6b26402ccd03.camel@fi.rohmeurope.com>
References: <116225e2cee20a8ad793f775c5d98aa4d24318d4.1621863253.git.matti.vaittinen@fi.rohmeurope.com>
         <202105252359.iVpUBT02-lkp@intel.com>
In-Reply-To: <202105252359.iVpUBT02-lkp@intel.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a390726-b82d-4f75-ca38-08d91f93517d
x-ms-traffictypediagnostic: HE1PR0301MB2395:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2395C3C2CF13428B9C5CA242AD259@HE1PR0301MB2395.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:475;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DAjw54uzBAMoa+gzuJYGoiuxu1KIZiXEQ7fR1vLxhZrw+CA54gJQ+jLsLHZJTovvoa2icJf+ikMAttLcQsRJNUcFi7q+d0nLkIjlpJY2GhzO/Zv0edlTI4TwF337iEOpGerTsrDEjo8gPrlC0YL5hGLTeltk1xKZnabq21oSy4pc6kChLMuvshCztuSUcbzHo+POpgd2i0u3IJsHE7Us050+bL2wdCmRPMn9uzNka0KOlv3c2zECGGy5LE4w5CbCxu1zin2DaguMUoiEYBCYITDxq45LbsXJvRrPnWXbD7iVb1+xBQm9/oDYH5RAZayKZ8RF9lucn3WPhmGyQMptFIuTT1kXT33LQjAiO7cTuJU5sfEEeHT6jN9NCs01kdxP13fTBBbspECxdnVJubO+MmxW6GZrocu5+RQL8WFZz3fLK7dd2985PQ7toFNSJDzfsPhHGLH7zKMT9AwTsUHvKpGLXquzw65GYz1UNiA75JzzetoI7WIKwol8mUCWVcf82tUOEF/OPxlc/Ow8yrmK02vUIRojTvLVaadsOyi4Rw5fv2Vlo8ciU4f7wEAt1E5vUOjDg+SJaF7a7Zsd0D6LuwTyHMNERrwMMmLwDdYnN0Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(3450700001)(38100700002)(64756008)(66556008)(86362001)(2616005)(66476007)(2906002)(66946007)(66446008)(54906003)(5660300002)(186003)(6506007)(478600001)(4744005)(76116006)(8936002)(8676002)(122000001)(316002)(6486002)(6512007)(6916009)(4326008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RVZlZ1BiYWRIVEZpOWRkZkNUb1V1dk50N2dVSXVRMTZidHJ6RndEcjBxUmZR?=
 =?utf-8?B?b0NjbmVMRGlzeXIrbVhWVmc2RytSM0xzUm5SNDlYb3RVRFFER0haS3g3bEV1?=
 =?utf-8?B?VjJ4NjNsWC9YaitXYnV6SmludmQ1ZzdYOEdld1I2UFN2T1BnUm93VmRwQjlw?=
 =?utf-8?B?YTRLOHV2aVorUStpZDc0Y3ZTalI2WW5HZHN2bDAwNlJ1ZDdkQW5LbVgyTUpw?=
 =?utf-8?B?TDJXMzF1alBsbFRxVGswVTd3QiszUFZ6QlNMVmgxK2toODhDZW9sbm5NQlVu?=
 =?utf-8?B?RnNiSGM3RzU4UUNnai8xRFU4Z3UyUGp1SHZZaGpSU0F4ZU9SajF4NzNEb0Ny?=
 =?utf-8?B?UTBqMWY1NzNjK2Y4cnp2QVl6cys5SUxFVVhTUnROd0s2aGFoUUw3Y0MxWFF5?=
 =?utf-8?B?T3F6VWJEWU1kM0YwMmU3Yk9YZysxempBMmZOVEtHcGVOcjZXSC9EdVdWM1Vi?=
 =?utf-8?B?ZHpCSCs2cVNSUmhVWDFnQjAxMnd5dmF0cURDcTJNdlVZOFFwVlVsVEJ4cFhT?=
 =?utf-8?B?Z2pxbVA4cEIxSEdpV3VnUmFiSmh6RjNyZFVOalhIQXlLYjF5bFArdFJUWjRE?=
 =?utf-8?B?YWJFRlAxWlVGNzFXbmNxU2RLdlpkRURkQlJHS005RGNXTWhrREF1TElJSXU4?=
 =?utf-8?B?RTdYYkRqYmFiZzRmQy8zSU4xcm9XSlZ0OWVVR3grT3VPeFZYeVlCSzNCMDda?=
 =?utf-8?B?R2F3Q2J3eFk4VHFmRWk2NWlsU0N1dExlTkxGb3hjYVNiQ0EwSVJlclVJVjI1?=
 =?utf-8?B?QnNLcFprT05qK2JLOWgrR0s2bjd2SUxGK0hXZkcwVEgxcEVVc1JFVDBkNStV?=
 =?utf-8?B?TkNPc0lFbzh1RUJ4TGw1TGNjV0laNVhMMTlXWnFzQnFGWnMvdUlMeEdLd21u?=
 =?utf-8?B?anpFV2V5UTNuWGZqZWlLUHFXUC85S1ZyT0dqanpJS3JjdTBUS0dPZXVNaTd3?=
 =?utf-8?B?NXhsMmVOWHpXZEFTMW9QVVBXTnordmhDTk1CV3FkM3JyWXAzbFlneHBZMDc3?=
 =?utf-8?B?bXZFN25QTGQ4VEhWY2FFVVZEclloRFFuZDJjelRUanViOVNhRGRIeUxiOGVp?=
 =?utf-8?B?dzNWNHFIUS9tK0RrUnN1QTR0cXZ0dVBrd0pTcGNXT0VvbHUwazZuVWE1Nm1S?=
 =?utf-8?B?clgwaTNzaW5FbVFZT3ZOSnRERUkzZzBieTJFekdGWDUraVF2Sys3eHhneDk0?=
 =?utf-8?B?Wit6Y2k2UjNYWncwaUptQUxPTGltY0s1MVNmOVZGS05hc0tIeit2bC9iQTJL?=
 =?utf-8?B?MWNuQktVZ3g0aUw4eUpDa28xSFY5SmRBNTRSMVlJMVJPb0FGUE5pSGlLbTBV?=
 =?utf-8?B?cU1sc0lwQjlxRVNIcFBOMVRsbFRQN0xvTTEzSVBCdEVUYXlienRhaHNhcnNI?=
 =?utf-8?B?Q1JRdHNGVDNKTGlWb1ArSXpjVkJTNGpyS0NyREtHNVVVU2hjSkhyOElVeHgr?=
 =?utf-8?B?Rm9qYzdRaEp4eHN4M2lQRzg5bFpiRUtJWW4wbnRhUWhLQTl4MG1Mb2ZCLzZZ?=
 =?utf-8?B?Y1hmT0F2QjNudS9JMHQ0cXlTREJBSzVZVzZOUldxVHQ2S1FMcGZHVkplMWFy?=
 =?utf-8?B?OWFVREZLVGZKOHVSUGVOODF6KzRLZ1FyM3RhTTBObnhFRnR5d2NZOUw5TFpF?=
 =?utf-8?B?TkhaYk92K0R4bHI5RHFlZ0FZTk9JcVBmZmR0cGduOHkyVHFTWFFsclA3cTVj?=
 =?utf-8?B?WjZwODlnc2EyT3gxTTZqVlliYmFBdjlXMEJGNVMzbW4ydzFYZ0x3OU0zR2R2?=
 =?utf-8?B?VXJlSGYyS1Ava0xwKy9QUk15cWREL083aGliTmZxT2h6N3N5L2k4ckRVTU1u?=
 =?utf-8?Q?kpHOkMtI1Z/HVucytzDC4QL189bbffSHgCTF8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE7860E38E20654F97873868D87F839B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a390726-b82d-4f75-ca38-08d91f93517d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2021 15:39:43.5581
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G2LidQ5lYKH7k/euX7mh87EIFAyD65jQ4fnwZ75irRMCz1nYXgCNo7RC1ifdN0QB6SlEiFwXxBcgqruzYhP69VAjA0NAkvP42ZKDczxnexs54NBHtDlXfAbrJUMbDPjE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2395
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjEtMDUtMjUgYXQgMjM6MzEgKzA4MDAsIGtlcm5lbCB0ZXN0IHJvYm90IHdy
b3RlOg0KPiBIaSBNYXR0aSwNCj4gDQo+IEkgbG92ZSB5b3VyIHBhdGNoISBZZXQgc29tZXRoaW5n
IHRvIGltcHJvdmU6DQo+IA0KDQpSaWdodC4gSSBkaWRuJ3QgY29udmVydCB0aGUgZXhpc3Rpbmcg
dXNlcnMhIEkgZmVlbCBsaWtlIGFuIGlkaW90Lg0KDQpQbGVhc2UsIGlmIHBvc3NpYmxlIHN0aWxs
IGNoZWNrIHRoZSBwYXRjaGVzIHdoZXRoZXIgdGhlIGFwcHJvYWNoIGlzDQphY2NlcHRhYmxlLiBJ
ZiB5ZXMsIEknbGwgY29udmVydCB0aGUgZXhpc3RpbmcgdXNlcnMgYXQgbmV4dCB2ZXJzaW9uLg0K
DQpCZXN0IFJlZ2FyZHMNCglNYXR0aSBWYWl0dGluZW4NCg==
