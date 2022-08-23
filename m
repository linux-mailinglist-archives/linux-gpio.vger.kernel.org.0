Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0F059CD0C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Aug 2022 02:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239092AbiHWAPO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 20:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238679AbiHWAOw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 20:14:52 -0400
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-he1eur02on0628.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe05::628])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320FA1900A
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 17:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbNrcY+u0+moquWfcWG3Lg0pCOlWA87ABnTsH75pFtwyJyjCw04FHridgOjuybXm0o+0AEICtv0sVmcNayEBC03bGiYfMOOLfJSIfA6ZKmAdB0n6ALPSXvZ0YpNOozyxjInDJv1cjzl5xq0PySVvFQ1/bgNEsx23XtAXC9L2Fu6jyFIwEzxOl0sKzdzLrNefQ0NYzVArq0Dzr0plwBXglCTAf5a9cHEAsln7TwxTXsm2U1lgR2z3uezmpACMXtqOfQ9CGahFxIsvMtKlj82TOAfWVaX3CRFpz40CxqhJZnX80e4JW7CsBxCo8oMGTZYioug5WhP8rbJvDvEAkvfOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6gr3Rd9k1+GH2ch72l8rTbiLJ9bjnaqhP+/dhZ0bLI=;
 b=ED7Ewy+p75WwqvA1/ZB2Q3rE+wvsZqvYdpCsGSXyzRXotrelAc5KniQH1Ve81ny5Ammt0NkOQYrQgji5hbXoOVXfJgNhtBfDtrbe5yMNauP/+E9bH+Mgcz2VmH9+t6sgzsx4mfRoKhymzEHDSXn5djdr80ZjYUYwKnmXPxIqnsRcyQI+rkO9d0ZEVXcuAf98JbTSX4hPUqfp7JnFZoZP78zNKO8EAsqXV8AdxzbInGQfWB9D4ym0g0BIBed2I1eY658eHBb09fJ5ttxzYgQrR5JIMkwIcaeFl1T1BVV40R8lcCHpqfm3Uu+57PFTLOuquZYjLpbOyh8JsQkXdHhlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6gr3Rd9k1+GH2ch72l8rTbiLJ9bjnaqhP+/dhZ0bLI=;
 b=Mg/0m0+V47Vy1BAMJH3Rm3lZxT1QnV6yh5VUVxQT9JSXSfs9pQ/48D2xh5E2Sr9kWGi/gG0GmCdTMRs/mqmN65Zl7+QZxeDF7OCoh/FWGWoDpE4K4OU9rPms5wEEd2jNHso/QrzfxudwOKREeeVY1RavQ0fgLzX/fotvQR2yi/w=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM8PR04MB7810.eurprd04.prod.outlook.com (2603:10a6:20b:237::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.24; Tue, 23 Aug
 2022 00:13:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::3c6c:b7e6:a93d:d442%4]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 00:13:04 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Francesco Dolcini <francesco.dolcini@toradex.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: RE: [RFC PATCH v1] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
Thread-Topic: [RFC PATCH v1] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
Thread-Index: AQHYpl9jfJhnhcZ8bEyMfuj8eEwECa26uPyAgAED6QA=
Date:   Tue, 23 Aug 2022 00:13:04 +0000
Message-ID: <DU0PR04MB94172AA0182CB09B871AB65088709@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20220802110232.130758-1-francesco.dolcini@toradex.com>
 <CACRpkdYLSB1JV57_FbJ096DpnRhWBU9qafb4oEsTZ_6xspUO6w@mail.gmail.com>
In-Reply-To: <CACRpkdYLSB1JV57_FbJ096DpnRhWBU9qafb4oEsTZ_6xspUO6w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c314f4c-4534-4ce0-7237-08da849c3fc1
x-ms-traffictypediagnostic: AM8PR04MB7810:EE_
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JA31gXESqolX0BWbaQWK8UjLef2XGp3kWkXMr8Zx9eYpMbA4gUr2B79TiPvbnpcsf8FOGDCStcqi6C3GMTvM3iBlue4Dos9+0t3nDoOHqMoXqKWC+1ri4H10KZrQsJsDdFbF+bj3VxRhs7KtxEvOVMIbagl9AIh8XXBYEeL9z5JQfhHLk/LogDBV3BI/o4WcnzhpS2aLihiarccb/qvmWDTN1qVOHUlVEOBM+9GFfKh9cEQDtLamYEjJHKVZ18GYMk73fAxJKZWXPBLCoSJY2X+R/+slB85n/iOCYTN803asFQr3fAAUqKvLF+KOB4dDaAbyQYZpHhFB3F5JiIMSLz+eVOgp6rOYxOKiZcTFurKC5DQVhDBJmvjwStsQjbYXXFGX9F/y4mwLiAUQPmsxC5rKmqwwyddHMOClX75Vfy+1pPd8n9Jv9ahlad7gMdox7mHzSn48uouflLwaRE06jn6LmjDT+y6qrpr1awF8oJ/gGbBIn6VLap5n5mXE4XqdK9HNSzLiBtAJi0yKNHU0JUd+ZFTluHiwqy2x2wDPVZcKRflTgLwB/C/YiM9wQ+5eclTO0/u7qkXDpHC6hevsJCwg62Oc3oiDEhtGzH/rAN29y9KY7RRuZYb68xhwc6YlLy65FGR3hTHW6sG+HHHSlcGZa2CvEFfkKnlrwogifoKGv4I6Rb1ZqMR0AT8eoCu18l9Isns3z3gK2SvlCGqX10fuxc06XZXXzbPyxWJWzQeVsLqUVzTbMuhTbmRg7hDV+DWRiIpVop5gM0GfVou08r9y67TzWNNnuCcyvy0snCo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(186003)(316002)(5660300002)(110136005)(478600001)(86362001)(54906003)(71200400001)(38070700005)(55016003)(41300700001)(6506007)(7696005)(52536014)(26005)(8936002)(38100700002)(53546011)(9686003)(44832011)(8676002)(4326008)(122000001)(33656002)(2906002)(66946007)(66556008)(76116006)(66476007)(66446008)(64756008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUh3T1hIaVJPNklTMWloM1FKc3k4NlU3Rm9DdWtvL2dqclQ3ZE8wLzZQRzlU?=
 =?utf-8?B?YVpGVDl4OWJ0R1R6d3ptaHRKc0Q3bG0raFUzblVCNFh5eEsvdFZIa0I3TE5Q?=
 =?utf-8?B?R3d1RlBjYTQ4bjA3bnFpeERMYlc3OGEyMDNJUTh0NXpkRDI0MFJibHlRSVhZ?=
 =?utf-8?B?MmgrUVdRZ2FzRGE4emtIMm9hSzdvQUU4NXZtRHlCWmZTWW9qSEFiSXNJYjlI?=
 =?utf-8?B?VFpKYm5ESkhOZnBHdkc5V2dvMjdILzVJdHBoRkh2Z1pXMGR4am1DN3lBYjFt?=
 =?utf-8?B?MTVZdzIwQzhWcEZlSjdsd254TjdpTkxjOUp6RFprNTNDQlhITnBUeGQ3aUJr?=
 =?utf-8?B?RGNDK1FKV3UvT3VtRVRackpDSG13SHFqRnhxYnlSZXRIRklCSGhCTVc4UkQ2?=
 =?utf-8?B?NTQrY2wrbXhaRitTRlNTR20yV0JZQ3U2Q3NWYkEzeGphOHBOT2VYNzUySUVI?=
 =?utf-8?B?bVJyVTZkajgvU3lJaDlkbjVhbWpRZ25NaXU4azhWM3U4bldFVklYSzl6cGlH?=
 =?utf-8?B?MVFETVRUMi9Bejh3bWJEVC8rWWM3RjdpcThGeDlNNXZJYUFvS1VGRVFMR2pH?=
 =?utf-8?B?V0xwUnQwWXBiV2I2OEhJNFhRSVQ5TEVLYWRRbFA2WlJRa2ZqeVFSZmx1Wmp0?=
 =?utf-8?B?UUpiMGxFbW9PaE9XVVBVOFhGbTV6OUFnaThCZG5EZ3RteFhiWGQwRkxXWnVh?=
 =?utf-8?B?aElaT3Z1aFFIeXlReERKRnNhT24wWWN3QUw5OTE4Mk8rdStPeXBEbXJNdVBP?=
 =?utf-8?B?T1REQkxnMTZrT0xMNzVWNkVDTDF0ZHdXRUhadmNqZ2lhK0tYcmJ5UG1zYjdU?=
 =?utf-8?B?dS9BcDlKRXZRUmI0T1NEYzE1bW94U01IUFdkOHlNNUxMbnkxOGx2dGtvSzBv?=
 =?utf-8?B?eTd4YithU2ZMRnFySzNEbWNBV3JVM0NoWkl5aTVXTzREZzFjc3FMeTB3akYw?=
 =?utf-8?B?Sk40Q1hpcTNSSEYyWkxGanJ5S3hOS1dTMkx6YnpTSndkZTBTMktXdjBFVEFr?=
 =?utf-8?B?Rk1HTXhidmlXWWFoempzRE1hNGdOUWZ5ZjVrYVkvR0E0N0lzUnVzMnFxWndp?=
 =?utf-8?B?UGFOWnUzYnNSVDdBa0lnK1o3TW4vNkh6SjZBOENMNmw4UGNzNFVLSjJHTG54?=
 =?utf-8?B?aU9RUyszMzRtc3IzaVZFaXdvd0V3QU5jZndWa085aFhibE5pVFplZy9EY01R?=
 =?utf-8?B?dVdIQk9RUDR0U2t3TG1hUXNBMU95eHRlZ2hiMk1YOUt5RjZuQTJCaVp1UXRV?=
 =?utf-8?B?NWhFQTMrc3A4Qy8wZXFqYncrcW9mN3hDSXVMWTh1YzZ3cXZJMExnOVdqMjJS?=
 =?utf-8?B?cUNGVzZvdmcvazl2TUhvMU5wNDdIT0EyR3ZsNC9WZkxYcXMzckkwYkU2Q3ds?=
 =?utf-8?B?R3pqMk1nOTMxbjJaTUhwL1ZLMVRud2Q4MnN2K0pzSldaQVZvdk1MSDJaS3dN?=
 =?utf-8?B?elNqUTlDVmxjdGxsazVqYWdiMVNYN01zRHNPaktDam1PeXVSMFhwbWhjcXBE?=
 =?utf-8?B?NzVkSThsU25mOTQ2THdWRHhLRWJ2SmpNY1FRUGFXSDJJS251WFlGUUw5VXVP?=
 =?utf-8?B?K1IrVnVHQVFlYnhyS1pTeCt1d1gwQ2dzYXZaZUlEQXZlWm1TVVA5OFB4ZlR3?=
 =?utf-8?B?YWcxbm9GU3NwOW5XcXJFZUJ6UlpqY2NwRFdWNW5MTGJXcjZOdkl6OFNIVVRo?=
 =?utf-8?B?MlNYUHNzM3lnbmt1Rk9yeWF0MUUyRW5UKzRRcFJrQm5MUzhzNHV5WE5JaDRR?=
 =?utf-8?B?SEFGNW00Qm84VFNrZ3pRbmdZZEhwUFFuVUpxNE9DSkRXeGxUUU1RZ2pBUnpn?=
 =?utf-8?B?OHJvbGNmWXN2WWtKZ0ZGMUdZQ2IzWXR2Skxab0NZN3BSN05aMUcvSndaSXhG?=
 =?utf-8?B?dGJmMlM3eUozV0NycFRmYktMMTVRYWhiSVN3NEo1RHpreEVjS0JYd0hYeGhT?=
 =?utf-8?B?K2Z4VlJCRUNJdWl0K0cvZzI2clFRUkpESVorUEh6QjV1cnptSEl1VlRzK3N5?=
 =?utf-8?B?S08xYTZLeW1XVlNhMHpJcDM0bWtHUG5jQU1LRUU2RHcrU2cvMlZ5c0g4Q2Q4?=
 =?utf-8?B?QWdqS0U4dVJZNHNPVFh5MVBHV25yUlhSenRmQ0dJb003eDFnTWlpWHFzd2tx?=
 =?utf-8?Q?WeAEBnGJIbx46Wi7QCCIBODj1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c314f4c-4534-4ce0-7237-08da849c3fc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 00:13:04.5597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYdMbrYcW2R73bcCqrD+zC9BF9O99ZkaWrl5nj0tDN5WgriqUa7QnHxc4TBnYRtjmlUrjQl/VmQmYsn1EyyHuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7810
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCB2MV0gcGluY3RybDogaW14OG06IGtjb25maWc6IERl
cGVuZHMgb24NCj4gU09DX0lNWDhNDQo+IA0KPiBPbiBUdWUsIEF1ZyAyLCAyMDIyIGF0IDE6MDIg
UE0gRnJhbmNlc2NvIERvbGNpbmkNCj4gPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPiB3
cm90ZToNCj4gDQo+ID4gQ2hhbmdlIFBJTkNUUkxfSU1YOE0qIGRlcGVuZGVuY3kgZnJvbSBqdXN0
IEFSQ0hfTVhDIHRvDQo+IFNPQ19JTVg4TSwNCj4gPiBsaWtld2lzZSBpcyBkb25lIGZvciBvdGhl
ciBQSU5DVFJMX0lNWCoga2NvbmZpZy4gVGhpcyBhdm9pZCBwb2xsdXRpbmcNCj4gPiB0aGUgY29u
ZmlnIHdoZW4gU09DX0lNWDhNIGlzIG5vdCBlbmFibGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPg0KPiA+
IC0tLQ0KPiA+IEEgc2ltaWxhciBjaGFuZ2Ugd291bGQgYmUgbmVlZGVkIGZvciBkcml2ZXJzL2Ns
ay9pbXgvS2NvbmZpZywgaW4NCj4gPiBhZGRpdGlvbiB0byB0aGF0IHRoZSBvdGhlciBwaW5jdHJs
IGFyZSBzZWxlY3RlZCBieSB0aGUgU09DIChjb25maWcNCj4gPiBTT0NfSU1YN0QgLT4gc2VsZWN0
IFBJTkNUUkxfSU1YN0QpLCB3aGlsZSB0aGlzIGlzIG5vdCB0cnVlIGZvciBJTVg4TQ0KPiA+IGFu
ZCB0aGVzZSBvcHRpb25zLg0KPiA+DQo+ID4gTm90IHN1cmUgd2hhdCBzaG91bGQgd2UgZG8gZXhh
Y3RseSwgdGhlcmVmb3JlIHRoZSBSRkMgdGFnLCBJIHN0dW1ibGVkDQo+ID4gb24gdGhpcyB3aGls
ZSBzbGltbWluZyBkb3duIHRoZSBpbXhfdjZfdjdfZGVmY29uZmlnIGZvciBteSBvd24gbmVlZHMs
DQo+ID4gYW5kIGFmdGVyIGRpc2FibGluZyBTT0NfSU1YOE0gYWxsIHRoZXNlIG9wdGlvbnMgd2Vy
ZSBzdGlsbCBlbmFibGVkLg0KPiANCj4gTm8gY29tbWVudHMgZm9yIDIwIGRheXMgZnJvbSB0aGUg
bWFpbnRhaW5lcnMgc28gcmVzZW5kIGl0IGFzIG5vbi1SRkMsIGlmDQo+IHRoZSBtYWludGFpbmVy
cyBoYXZlIG5vIGNvbW1lbnRzIEkgZ3Vlc3Mgd2UgYXBwbHkgaXQgYW5kIHNlZSB3aGF0DQo+IGhh
cHBlbnM/DQoNCkluaXRpYWxseSBTT0NfSU1YOE0qIHdhcyBpbnRyb2R1Y2VkIGZvciBzb21lIGRy
aXZlciB1bmRlciBkcml2ZXJzL3NvYy9pbXgvDQpmb3IgaS5NWDhNLiBCdXQgaXQgc2hvdWxkIGJl
IGZpbmUgdG8gbGV0IFBJTkNUUkxfSU1YOE0qIGRlcGVuZHMgb24NClNPQ19JTVg4TS4NCg0KUmVn
YXJkcywNClBlbmcuDQoNCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQo=
