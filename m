Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2E026FCB40
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 18:24:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbjEIQY5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 12:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjEIQYq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 12:24:46 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2714210
        for <linux-gpio@vger.kernel.org>; Tue,  9 May 2023 09:24:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koWJe9daadSVx4JrXbBM9Ny5iEHXGzKaFqFdjmbR8xx7M0hwmi+XxnspxR4b+WXbMpy9JXO7rajRbM0NhmoVylNZ32EPF4FOdRT0pkG0f28H3MgEO92e7BDS91b9FpwGPTUrO/D28ya2CtcXFry8HMxkGjYN/tUITOaRsOh5Pasedw+vIGMRSHEBGdoyAw4n19U1rLOAzhZEL673+ySxHOZbfmZ4Vktw+5RTDGTuykwAChkBD3gUAkGYJFOBFSbe4HSFReiHb5gERQnCX40rtCyEm9SA2SnIm1uLzbaeNDMPGRXuOFnlev08CQVC2WgaAJTkDPunLzJwjoud5AdV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcVq09bgqmTBhTkTbVOMPBlETrnLMuqWmQPsg5K9lPc=;
 b=ZPqpogfNTBwKJkhGXn4+Cz4i86u3od71QksJJasADOW4zeQKcjqs6+lIE8fi9KxQz5DtvfVQYjZKaRqMfk0CUEzGGlsP8xUB6kJx/E1q2vy9iBypOsTQxuBgbFFbdY3/aIVGVIgzj7Ol4H8j0LzAxB4n4VVHQ+w7fFiU2wvkwRMLXes7bqUfSiHg3xJ06oWOHtYyQ0vPQNIu6ZkosLyCo/PXkysf17qgQr7K8NRCgFxLptLqfZ76mttFlf9x9QaHMkZj7VpTiQTDOj3vGF+ZVGOP3fLTa/+ObZf5QQ+OL5+HQhBEzzpmVGhnsxbcjmnw4PnU1n6O1brvl6TPEcXH3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcVq09bgqmTBhTkTbVOMPBlETrnLMuqWmQPsg5K9lPc=;
 b=jzOR58xeRKTN4pEOkA5Sg33W6jrvaffds8E/keI7K4/KroJv23OEm7uDA3PLpcJv8g++8+9P+MppmY1UQElfWmClwxZCx9kTW1HHGJG+oT+xrbqysXdZr6Wy7/bsQ7qODg2X4wcCS/9sr4G4h+UHINwQeBmMuUSOAdO9+EZx1Sw=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8137.eurprd04.prod.outlook.com (2603:10a6:10:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 16:24:42 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%5]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 16:24:42 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>,
        Fugang Duan <fugang.duan@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 1/1] gpio: mxc: use
 platform_get_irq_optional() to avoid an error message
Thread-Topic: [EXT] Re: [PATCH v2 1/1] gpio: mxc: use
 platform_get_irq_optional() to avoid an error message
Thread-Index: AQHZgo9tID5tPqP19EqnRrnR0N2AoK9SHAUAgAABzoA=
Date:   Tue, 9 May 2023 16:24:42 +0000
Message-ID: <PAXPR04MB91854797933D5658CB64FBEA89769@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230509160016.1074446-1-shenwei.wang@nxp.com>
 <CAHp75VdodcyQH+O3Pqa57KrJCsFytQDbz-nqoWbZ0727L+wXjA@mail.gmail.com>
In-Reply-To: <CAHp75VdodcyQH+O3Pqa57KrJCsFytQDbz-nqoWbZ0727L+wXjA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|DB9PR04MB8137:EE_
x-ms-office365-filtering-correlation-id: 9be2826f-286c-4ed4-5f9e-08db50a9e4f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0EWunqu2InXiChj3FFHytk2kB9PLpr7QFp1tIumLYCpzdHI/XgJ+oADWrg+5qC/M/f8nCFW8S0xZJeCFj1T6x0mWe+XcZhZbVZo14OIabsZPDuDXyD+4IsPmx6Rg0q42GOu0YZ/A7N3/RnoD97QpnmBjyP88WoOmcLmBYAHwkJgpO9U4zJ4gCiS5rdn40N/MFqIeo4TcgjQCuT45wLkZajErAend7G6fJqqqjkWeicYEP6nlO6GThsqYobNiz9pt6iWVozvboKwjaVoZqHdeJl5tsnDXGd0Xug6n7ZfeDVvaCMWvjNqiMg+zcdQV/FYNHeHBuI7lse1tnHsKsr0sc41Nj9rUl6PCsanprCwT2b29YJ6hyPjlm3GK4pvwN9cF4OUfde7CzTqZ4eJaj+0LuOl/K0hQwjzoQV7BqptdCdbBe/AO2BjHzPHroPFHPLgqo2Ouh5Yg9obK5GlYTjO6XFbI3S1dVeeViBtP9oWFoMzIojKY8xatW8unjdMHM7i3z1zxizeR8kcYQSyYoGMPoIPRQMZeTzLFwkVlBCJtG+c5ShSjOqG65yCaPqnCMKBEK5OJa/rSuOzaoph+DWKIEeLeKxvJtqVDkMXIsWfWlp4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199021)(38070700005)(86362001)(54906003)(316002)(66446008)(66476007)(7696005)(66556008)(71200400001)(76116006)(64756008)(41300700001)(66946007)(4326008)(6916009)(8936002)(8676002)(52536014)(5660300002)(478600001)(44832011)(53546011)(55236004)(15650500001)(33656002)(9686003)(26005)(6506007)(2906002)(186003)(122000001)(38100700002)(55016003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3NXTW1xZnJzYU1ERXNVMVM1TXdHRXQzaCsvUDNxM2tnWWNZTERybEYydDVI?=
 =?utf-8?B?WXl2eEd5N3JhcmV4c3h4b3NTemFhdFZReXpyaE9pbzk5eUNIaFkwdGVqaXp1?=
 =?utf-8?B?L2pTRlRQcnRPUVQrQ0xzVUdpQlJTMGptZjNRWHdTTFJPdVFlODFjWUxXYUd2?=
 =?utf-8?B?MC9UaDRTZHpQb2R5aFc1Z0R2K01KRTY4SWtBOFI0ZldyUnA4Nnp1V1hmOVUr?=
 =?utf-8?B?TlNlL0VZcGUvT3huL3dFbU4yOTlIem5JLzdxazVWRjFnVm9YT1k5Z2NaY2Rk?=
 =?utf-8?B?Z0VCSkhrbm54YlFRSTNsUkpjM1ZuMjFHbTNIOVhmOURpd2VrcmJSSnZMMWN2?=
 =?utf-8?B?VGhKOVR2UG10V2Fxdlluc0NTNW1OZERjYkhONFU0a28ramdrS3Q2UjFjRDRG?=
 =?utf-8?B?UnV1bGl2M3MyOEFZS3VWdkhsV0c2OWxEL2lHQmJBR3cySU42MWRHK1UxYWR1?=
 =?utf-8?B?b0JSVXpnQnVNTjhDbUk1ckFPb0N2MlZGTmtVWjE3MXF4V0JEUEpOK1d0OFNj?=
 =?utf-8?B?ZlNDeEVUTWI0ZHFWVUNaQWozeVl2OExXaXdLSDJ4bDhDZE5MMDAyQnNPT0ZY?=
 =?utf-8?B?ZjVSTjloR3ZuRElJUUlSaFJsdFFSaXpTQTVVaXNUODZuek5nS2szQ21xeVhM?=
 =?utf-8?B?THNkM1l2dVh5M2gwcWJtMHlscC92Uzd5Sk9YVWRoWFFGUWpFbUFNQnlRUCth?=
 =?utf-8?B?WUdhOGZGdE5HTTZwTE0yRDBaN1pCQ2NLR1NYZ1JaOWxXcU9EQ2N3SXU5Vkdw?=
 =?utf-8?B?cGNuTldXODNZaitoVVhQMlMvYzNLa1lCOXJBTzN6d0xWR1hKNGlXRFloS2J1?=
 =?utf-8?B?VFpDaUpNWEFrT3F1QWI0ODUxcWtidXhOaVFrTU9tTWE2RGlCTkYyQXIrRGQ0?=
 =?utf-8?B?eDRJV0V4VzRsN2lzdVJJWkNsdVVaTUNueGJ3SmtwVU5nU0h1OE9PdEQ3a3FU?=
 =?utf-8?B?L2RwdlVjYnFpbDJ0Q05MdTlOMVg2d0pQTURHczRHa29iR2srVy91ZFAwSm9C?=
 =?utf-8?B?azhXejdzdnQyVitmYXV4K2hkdnJIUitPV0tNVzFuOGtMT2pOenhwS0xqUmZF?=
 =?utf-8?B?K3hWdGxVMDhjc245VHRZRW5jUGhrWkRCL2pIVDEyUGxOeEs3eWxOUUdyNDRp?=
 =?utf-8?B?SFNlVGhCWHZ5RmhiQkVHWko0Q1p4U2h4TEV2eUptV3B2MzVyMUhJMUNaMU03?=
 =?utf-8?B?alUxS295S1hwZkkvWWpUQi80MUs4bE1LQmJ6UXVxYzNJUFBsdEdLalFXQ1or?=
 =?utf-8?B?TWxWV211M2xRejJQOFlDYk1MU2pFd1VaUDIyNnVVMDg0c1lOVklPVTBUZFZ1?=
 =?utf-8?B?VTlTbHhBckQySUxWWEJlbW94NDFva1N4cHE2LzkxcmpuTDA0VDNyMDg5UGZ5?=
 =?utf-8?B?ektaQTRkTTRRMkdwb0JQOHA0QlZOUVN2VVNsMWczYitlZDZneGZkcFR3dGJx?=
 =?utf-8?B?bEpjVXFHSTNDSlZlZWhwdG5uNHludGViVGFzRDdLSUJpT0VIQkFGSzQxOTNz?=
 =?utf-8?B?K2svd3pYL3VBaTk1Sk5BeGl6ZDhzWHkwcUpaSUdNSnpyUGMxUXNjdjVpbWdS?=
 =?utf-8?B?UnFjbDkyeWFOZGRNN1RzM0REbGRDbDVyeTZ2Yzk4MGFsekh6NDRtSXZRRWxG?=
 =?utf-8?B?M2FmNHJsck04SW0zTUxDenhhWjZxOUQvbmluTDNoeDFybWpibXF4NjFTVEUw?=
 =?utf-8?B?bjlVOEcvZ3Vmdnd0K3hkZDNGUTVQaFNTTHNOYUtEdUpMVDVjMkl3Q1Y0dVNl?=
 =?utf-8?B?SzU3Njhqak1QTFo2ZVMrUHZjVU5MNzlrUzNnN0p6QUxBS3BvMkM2c1gyeXhT?=
 =?utf-8?B?S0x1RzErNk9rUEM2QVVSU0djS09uTmJ2L0EvRUZoNDBxbG80Q0ZSQW1Ed1Bm?=
 =?utf-8?B?WGx2QVFQTVZjUmx2NllMQkNGOWNVWi85cFp6WnowZlJ3aGYzbWZLZjhEUHJQ?=
 =?utf-8?B?RGY2RmIzZDdxdDFHaHA1WnRsOUo5VHNNaG9qWlRzME1CS3V0Mit2Y2E3aUty?=
 =?utf-8?B?V2JiL042Q3NkUEhWdmJDdEFNWVFnZVBhK1REWVZkUlBOa3prWHUvdUFEdkpQ?=
 =?utf-8?B?VEVHNmlYd3h5R1JWRVlDejBoQnFRRTUySEdJZGxRUDQxR01DMDd1U016N2ZU?=
 =?utf-8?Q?JpJiU37h32BwSMaO1d18sXCVU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be2826f-286c-4ed4-5f9e-08db50a9e4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 16:24:42.3922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEQdWNJpyXxnhCSzsSWrnyfRIUzGN7gQsXGJJBViKAJLkZwJrplGyrO/jibNEXIOwowTkkgzVwrptqOPC9UtPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8137
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBNYXkgOSwgMjAy
MyAxMTowOSBBTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4g
Q2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IEJhcnRvc3ogR29s
YXN6ZXdza2kNCj4gPGJyZ2xAYmdkZXYucGw+OyBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1
bS5vcmc+OyBHcmVnIEtyb2FoLQ0KPiBIYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz47IFJhZmFlbCBKLiBXeXNvY2tpDQo+IDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNvbT47IGxp
bnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBkbC1saW51
eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsgRnVnYW5nIER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5j
b20+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjIgMS8xXSBncGlvOiBteGM6IHVzZSBw
bGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKCkgdG8NCj4gYXZvaWQgYW4gZXJyb3IgbWVzc2FnZQ0K
PiANCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2Fy
ZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yDQo+IG9wZW5pbmcgYXR0YWNobWVudHMuIFdoZW4gaW4g
ZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzDQo+IGVtYWls
JyBidXR0b24NCj4gDQo+IA0KPiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDc6MDDigK9QTSBTaGVu
d2VpIFdhbmcgPHNoZW53ZWkud2FuZ0BueHAuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IEZyb206
IEZ1Z2FuZyBEdWFuIDxmdWdhbmcuZHVhbkBueHAuY29tPg0KPiA+DQo+ID4gVXNlIHBsYXRmb3Jt
X2dldF9pcnFfb3B0aW9uYWwoKSB0byBhdm9pZCBhbiBlcnJvciBtZXNzYWdlIGZvciB0aGUNCj4g
PiBvcHRpb25hbCBpcnEuDQo+IA0KPiBMb29raW5nIGludG8gdGhlIGNvZGUgbW9yZSwgdGhpcyB3
b24ndCBoYXBwZW4gYXMgdGhlIGZpcnN0IG9wZXJhdGlvbiBpcyB0byBjaGVjaw0KPiBob3cgbWFu
eSBJUlFzIHRoZSBkZXZpY2UgYWxyZWFkeSBoYXMuIFNvLCB5b3UgbWF5IGdvIGZ1cnRoZXIgYW5k
IGtpbGwgdGhhdA0KPiBpcnFfY291bnQgdmFyaWFibGUgY29tcGxldGVseSB3aXRoIHlvdXIgc3Vn
Z2VzdGlvbi4NCj4gDQo+ID4gUmVzdHJ1Y3R1cmluZyB0aGUgY29kZXMgdG8gYXNrIGZvciB0aGUg
Zmlyc3QgbWFuZGF0b3J5IElSUSBiZWZvcmUgdGhlDQo+ID4gb3B0aW9uYWwgb25lLg0KPiA+DQo+
ID4gRml4ZXM6IDc3MjNmNGM1ZWNkYiAoImRyaXZlciBjb3JlOiBwbGF0Zm9ybTogQWRkIGFuIGVy
cm9yIG1lc3NhZ2UgdG8NCj4gPiBwbGF0Zm9ybV9nZXRfaXJxKigpIikNCj4gDQo+IEhtbS4uLg0K
PiBXaXRoIHRoZSBhYm92ZSwgdGhlIHByb3Bvc2VkIGNoYW5nZSBkb2VzIG5vdCBmaXggYW55dGhp
bmcsIEkgYmVsaWV2ZS4NCj4gQW5kIEknbSBub3Qgc3VyZSB0aGF0IHRoaXMgY29tbWl0IGlzIHdo
YXQgd2Ugd2FudCB0byBhY3R1YWxseSBmaXguDQo+IA0KDQpBZnRlciByZS10aGlua2luZyB0aGUg
bG9naWMgaGVyZSwgSSB0aGluayB5b3UgYXJlIHJpZ2h0LiBBcyBpdCBoYXMgYWxyZWFkeQ0KY2hl
Y2tlZCB0aGUgaXJxY291bnQgYmVmb3JlIGFza2luZyBmb3IgdGhlIGlycSwgdGhpcyBwYXRjaCBk
b2Vzbid0IGZpeCBhbnl0aGluZy4NCg0KVGhhbmtzLA0KU2hlbndlaQ0KDQo+IC0tDQo+IFdpdGgg
QmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCg==
