Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E033C6B2538
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Mar 2023 14:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbjCIN0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Mar 2023 08:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjCIN0L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 08:26:11 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACC6E8CEE;
        Thu,  9 Mar 2023 05:26:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IP5QSo2EzXFSBhck3GEni4FQDgnYQEZWJyiBJ8H6gpPMiLjeszygzhSuZ4FzgPdJw7n/SijF6a1v2/4FnglJEmpm/eVZ0fgFsZkPcKaDUEmCFYWvPQRwqxWqLGsGcjq1NDQErMc2tBHn18pGNgPXyPDbktjujCa5N6wPsdP75IhBggHq/o1s/Tj2VMULGbbw/mAVsJvbH5BKnC2+Pd7uC+7GpfOpDIvDIpF5VHDavRAtna2yDN8w2KKFQFILshp4mI/VhkqcsDt6OiNU4cixtRd+TufZqXQVf6U6WroppRKSGCzw+/27yivu4rmWnVuySmtzN+xbnk1/+MtWTy/GOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LpxtUl6LNhesi5l14ysg+izhnk4hgAIx/PLWC/Aft8=;
 b=GsS/IxdRL4Ldt5RU0Z33yXjR54KLuh1OPkLHxiHPSTmROuEX9pb9Y7WV0HwytiXwEdlBx2PtLCHoZWqHxHAO+DxbJsYEjH9U0byAtiqcLF/LnGvqYKJIpqG5TdjjJuqvLSUGz1lYho+kPjPw5d0Rn8QlDvJx6H7uZZ0bLgu//Z1RJGvdc5o5CpTb7hV7slN5mhwDHgs0JpNr6xPKuvU6g8GKzRv3qwksHiR2QVp4fXTXsh6sSJQKC4WPDejKaZZokkUDLNKnOt83xqjpL3GMMM4UHhfUOJVRGEuaKYSYUs82TodPVbU9dHxgFqSca4rUylqoFzT3eXF6V8pCrEvfwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LpxtUl6LNhesi5l14ysg+izhnk4hgAIx/PLWC/Aft8=;
 b=YF4Nuse3AeR1sls1KFg295G0l8hAMUPiaCBQH32wPHKzdeBEO7WS8hMRja18jSc50p63q7jCntdvYLUwNV8znfjJB5dRa7fviukF87pTrreHr3X/QLKQeDY2De2VxW+5eiG1e0DSKrdlwvNrZQnldp00TQHFUqKdpFJQ/2+rWdM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB10310.jpnprd01.prod.outlook.com (2603:1096:400:1e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 13:26:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 13:26:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Topic: [PATCH v6 01/13] pinctrl: core: Add pinctrl_get_device()
Thread-Index: AQHZUAoZhjJXzQRnckWhgNWWpo0zwa7uZ+eAgACJSoCAA3tbgIAABvEQ
Date:   Thu, 9 Mar 2023 13:26:03 +0000
Message-ID: <OS0PR01MB59224CECBB888ADC9214145286B59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230306090014.128732-1-biju.das.jz@bp.renesas.com>
 <20230306090014.128732-2-biju.das.jz@bp.renesas.com>
 <ZAZ4LY+xG2LGiHwh@surfacebook>
 <OS0PR01MB5922EA0703F259A99C157D3286B79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
In-Reply-To: <CAHp75Vd6qTG67_1DGiemy8n-mQn=9kiGrC0rEYw2XO0rm4Tbag@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB10310:EE_
x-ms-office365-filtering-correlation-id: 7640249c-beeb-47b1-7195-08db20a1d51e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zZt/LLchK1kiDw63CVayr5w6dD6Jk3xAo9To7Ip0iLW+2x/aVU3F7z0iMwTeGGCN3aZP99nbYmKU1iqpalwhAu36FL/Ga92fFR4w4ipEU+PBGYBVhXskEbuFzAkF8/tol/UbUV7RALBXjaceI9cVoO99NfBH2j0XTcUWcG5EdCbnEQU20BDAEPhKa8z5g7XGYekWAex5h7TTekAuK3ZWimu751q+/v+7iaGzGFK97Dp4CPpGWAzgyM3mFDH739cQx+rXz0q0OGXI32c5PPQqymL2QfNfRMGnu04L5eV5+JFwm+2Uz/+TKAOP+XLqsyd9vG6pshgpZeGMrTPEttPZSDh9TL8ijQH7xpFWo3mpaTekweV/MRcXTEKk2jbx7pAuAUaB56QmNd9Kvmj5QTotnUWyoNH1I+bjZX9V4ciWXsmjFJzozLBRTzTax0/O2Z1j1PG2mj7igEyWCFa6eQ3TCyO99otCqvoL6eekiqDV9Wnp+RRzTkTlv3QLY+DDSnhdjRVdXApgWlTfUjjeJnBs4ZAFJlv0hSOQyO3TMGWLS1UqXQtaGivCsjslCJgs9QlsVqz4edlbr6BRUorGq6lz6A/VwhyEy4YrmLe6eIXMvG/iR6gPiyOQ9Lv0qTOOdKX6lIytOLtf/jrevg2fQ1O9EQ4ElwiiOfYg2tirlzz65qp2sCHhtqpnJwFVzqPZrdsrDujgI0OT/nugz1790FDTEg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(33656002)(54906003)(316002)(9686003)(186003)(478600001)(7696005)(71200400001)(52536014)(8936002)(5660300002)(2906002)(66446008)(76116006)(64756008)(8676002)(6916009)(4326008)(66476007)(66946007)(66556008)(41300700001)(122000001)(38070700005)(55016003)(86362001)(38100700002)(53546011)(6506007)(26005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDhQVmxFZk43Z2ZsckxrUjNWNzdYamkxNFdTVFFwVzJubE1xUEpzYjR6a1gw?=
 =?utf-8?B?dG1yWnF1ZFQ3ZEc4eXlMTnh3YTlDM3ZmVkZUUnRWeWErenZDODNPNk9OTndH?=
 =?utf-8?B?Qm0vV1RaSGJmZWY1eFBnT0t0bGlUMDFPNDRGdXA3S1lPN0Q4ZjVtRC9BLzBq?=
 =?utf-8?B?UThvU21wNEU3T1N1akt5ckFoNFdMdHRldDdlekJSa1ZsOXBrUGJ1VUY3NVZO?=
 =?utf-8?B?ZTM5TW9Jd2EzK0twMXNiNnRSQUk1MDFmTXBGemxDQm1GMEFXWFdTVkZhem96?=
 =?utf-8?B?RmN3QWNRWml5ZlB5cmxueWhPbVBnbWRuSVRKMXppUGIwdjZMZzlnNis4V05u?=
 =?utf-8?B?R3ZOOCtSaGxuVDBTQW8rNWI4YVlpZ1BqUE5GUUlTeUNXSWhmam5oKzI1UDhX?=
 =?utf-8?B?WUpwV3ZJcmE2RVlrTHhKYWkrM3gzcUF6cDgzK0s2UnZzYlB6cHljYjFBc0NR?=
 =?utf-8?B?ZE9IMlMydkVzZHpldk00TWUzaGhPSThqQ1lwbitESnFPVXpqdVg0TUlVWHE3?=
 =?utf-8?B?RzZ3dndxMlhrQjRPOXltc0JpV0tQWkh1QUdpSDhUMS93N3h4NHc4Z3ZVRGdy?=
 =?utf-8?B?TE5GWmJ5bmFBakg1SnZ4bEZkdnJHUExqYkozNkYwZjkrd2ZhOWx5czIyOE9L?=
 =?utf-8?B?UkVzNVdVc1dOK2NvUzlSMFJOc21EM3lPTmpzTXROKzVoQ3RwRTNCYm1xWm1V?=
 =?utf-8?B?aTFjMlU1RWY2U3RWYS9JQWt5aVBoRnZrZmJCbG9neHRCNnEra0hScFRsYTEz?=
 =?utf-8?B?bkRpd0kzN1FjNVRZbU1JNHNBSy90bjEvSGxiQTl6TjFwNEo1UlZkeDdDbm1C?=
 =?utf-8?B?cUVaTjNGdkFmY3lKMktWbzBRcU1PV1lxZjNwc09zNW40N0JMZ0ljZWpzL1Zq?=
 =?utf-8?B?bElIb1JjUnBBTEI5TUxJaGIxR2NXRVBSd0hrYXJ0UW1MSXZObjJxaTZkVWpl?=
 =?utf-8?B?V3ZHdmEyc3BMMC9MenFOSGMxS0lURWQxbGVkOGdBUVoyYk9iMGVRL1ZoNjdX?=
 =?utf-8?B?M3J3OTFjQmdsWlk2TDJHcExsL1dqVmVBV3Vsb0NQWlp2SXdha2lua1Zad3Yx?=
 =?utf-8?B?OU96d3BLZmVXVWVndkVaN2g4ekxSM3VCM2FtWTVlOXNJZWwrWURtQUFjVklW?=
 =?utf-8?B?Zno5QmNGVjF0T0FTTzg4eUdFQmsxb2dSMndsSGxvbG93dDhmR0tId2YwYUhy?=
 =?utf-8?B?dVhvQWJqRGNwaUpzQkt4MmdjOGZrUTNLNjV4anNiSlVOSHRURk1zNmt3a1NU?=
 =?utf-8?B?eUt0RCtpKytLNTV1RFFlTDVSbTQ3K05rYXJYUi96NXlzckYzL1M2L1YwUks0?=
 =?utf-8?B?VWExQllzUUJmTGovZXlLdXU2dFkyK012YngrTi9uN1hqVmhZY2FkZjNxb1VW?=
 =?utf-8?B?NGFaUGhRT1cxVVpLZEYyRTk2QlJ4ZFBnRDdPeFZWZWVKU1ZJejF2Umt3RWpN?=
 =?utf-8?B?dDF3RlBEMkR6Y2oveE9tNlJEaDgyQXVIRjhVWDQrWVY3MFEvcm82OEY5WVhH?=
 =?utf-8?B?TWtzUjllcG1sdDN6QkozdUovQ1dUWFpVaGhGMFRmR1FmWWNuT1JCQ2tBdlJR?=
 =?utf-8?B?SFoxYTBNbVpnSnFFeHRaOUVjdm5pMDVNQ005UnZQTm93VUJmSGV4TkhrM3gz?=
 =?utf-8?B?cW4zbFhKeWhWbEFqd3pCekphNi84TVZZbWJVKzhOdEVkSXRTSithYThzdVRa?=
 =?utf-8?B?ZitsbmFCQXZkcjJ4OUJrbWs0S1A2UzM2eXhCZDg3NWpiMTh5SUFLQjRKQ0Y1?=
 =?utf-8?B?SHM0NjczelgvcjE5eXZJTUtwUDNVK2JHbDVVaXBGTUVYakJtbjRiRWU0RjdJ?=
 =?utf-8?B?ZXFWaHplY0xvRWtGWFkrYTZkRS9MNEVSajBkZjZZcW1xMHBTa1liZnd5Q3Qw?=
 =?utf-8?B?a1JqSkZ1WGNGZEdOczd3ZUxQQjcyekhaYnJYeXBGaFVhaHBqd3drQ0N6Mnlz?=
 =?utf-8?B?djNvZ1FpMVJFWU1mTXUrbXArd1o4RkdtZnYwZExRZDluUXVyWGQvUUtldE1m?=
 =?utf-8?B?S3FiSk1abzhBalRhaGQ1SVQ2d2ZaL0ZCWlFZM2dCRTFwWmUwd0x0Kzlsampp?=
 =?utf-8?B?WW1tNnVkSmFjNnZTdWtEOUdjY21VaHEvYWp4WVc3WTVJNFY5NmpGSFZuRitZ?=
 =?utf-8?Q?vVnshL7jNsh3LVYzabn7G/qap?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7640249c-beeb-47b1-7195-08db20a1d51e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2023 13:26:03.9953
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZOVuc+RQ9bwQdj6aTRwgsLynhoyvZKM7WtkhxT3noKlAOvmE2mOHCgLRWTgFUWj673xyc6xpqwo9y4yEEJijwBnwinpx00aRwDuJ7iNSHJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10310
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSwgDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjYgMDEvMTNdIHBpbmN0cmw6IGNvcmU6IEFkZCBwaW5jdHJsX2dldF9kZXZpY2UoKQ0K
PiANCj4gT24gVHVlLCBNYXIgNywgMjAyMyBhdCAxMDoxM+KAr0FNIEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2
IDAxLzEzXSBwaW5jdHJsOiBjb3JlOiBBZGQNCj4gPiA+IHBpbmN0cmxfZ2V0X2RldmljZSgpIE1v
biwgTWFyIDA2LCAyMDIzIGF0IDA5OjAwOjAyQU0gKzAwMDAsIEJpanUgRGFzDQo+IGtpcmpvaXR0
aToNCj4gDQo+IC4uLg0KPiANCj4gPiA+ID4gQWRkIHBpbmN0cmxfZ2V0X2RldmljZSgpIHRvIGZp
bmQgYSBkZXZpY2UgaGFuZGxlIGFzc29jaWF0ZWQgd2l0aCBhDQo+ID4gPiA+IHBpbmNvbnRyb2wg
Z3JvdXAoaS5lLiBieSBtYXRjaGluZyBmdW5jdGlvbiBuYW1lIGFuZCBncm91cCBuYW1lIGZvcg0K
PiA+ID4gPiBhIGRldmljZSkuIFRoaXMgZGV2aWNlIGhhbmRsZSBjYW4gdGhlbiBiZSB1c2VkIGZv
ciBmaW5kaW5nIG1hdGNoDQo+ID4gPiA+IGZvciB0aGUgcGluIG91dHB1dCBkaXNhYmxlIGRldmlj
ZSB0aGF0IHByb3RlY3RzIGRldmljZSBhZ2FpbnN0DQo+ID4gPiA+IHNob3J0IGNpcmN1aXRzIG9u
IHRoZSBwaW5zLg0KPiA+ID4NCj4gPiA+IE5vdCBzdXJlIEkgdW5kZXJzdGFuZCB0aGUgdXNlIGNh
c2UuIFBsZWFzZSwgY3JlYXRlIGEgYmV0dGVyIGNvbW1pdA0KPiBtZXNzYWdlLg0KPiA+DQo+ID4g
T0ssIEJhc2ljYWxseSBwaW5tdXhfZW5hYmxlX3NldHRpbmcgYWxsb3dzIGV4Y2x1c2l2ZSBhY2Nl
c3Mgb2YgcGluIHRvIGENCj4gZGV2aWNlLg0KPiA+IEl0IHdvbid0IGFsbG93IG11bHRpcGxlIGRl
dmljZXMgdG8gY2xhaW0gYSBwaW4uDQo+IA0KPiBXaGljaCBpcyBjb3JyZWN0LiBObz8gU2hvdyBt
ZSB0aGUgc2NoZW1hdGljcyBvZiB0aGUgcmVhbCB1c2UgY2FzZSBmb3IgdGhhdC4NCj4gDQo+IFRo
ZSBvd25lciBvZiB0aGUgcGluIGlzIHRoZSBob3N0IHNpZGUuIEkgY2FuJ3QgaW1hZ2luZSBob3cg
dGhlIHNhbWUgcGluIGlzDQo+IHNoYXJlZCBpbnNpZGUgdGhlIFNvQy4gSXMgaXQgYnJva2VuIGhh
cmR3YXJlIGRlc2lnbj8NCg0KV2UgYXJlIGRpc2N1c3NpbmcgdXNhZ2Ugb2YgDQoNCmVjaG8gImZu
YW1lIGduYW1lIiBhbmQgeW91IGFza2VkIGEgcXVlc3Rpb24gd2hldGhlciBtdWx0aXBsZSBkZXZp
Y2VzIGNhbg0KY2xhaW0gYSBwaW4gYXQgdGhlIHNhbWUgdGltZQ0KDQphbmQgbXkgYW5zd2VyIGlz
IG5vLg0KDQphcyBzZXR0aW5nLT5kYXRhLm11eCB3aWxsIGJlIHVuaXF1ZSBmb3IgYSBwaW4gYW5k
IHdpbGwgYmUgY2xhaW1lZCBieQ0KZGV2aWNlIGR1cmluZyBjb21taXQgc3RhdGUuDQoNCkFtIEkg
bWlzc2luZyBhbnl0aGluZyBoZXJlPz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiAuLi4NCj4g
DQo+ID4gPiBBbHNvIGl0IGlzIG1pc3NpbmcgdGhlIGV4cGxhbmF0aW9uIHdoeSB0aGVyZSB3aWxs
IGJlIG5vIGNvbGxpc2lvbnMNCj4gPiA+IHdoZW4gbG9va2luZyBieSB0aGUgc2FtZSBwYWlyIG9m
IGZ1bmN0aW9uIGFuZCBncm91cCBuYW1lIGZyb20gZGlmZmVyZW50DQo+IGRldmljZS4NCj4gPg0K
PiA+IHNldHRpbmctPmRhdGEubXV4IHdpbGwgYmUgdW5pcXVlIGZvciBhIHBpbi4gU28gdGhlcmUg
d29uJ3QgYmUgYQ0KPiA+IHNldHRpbmctPmNvbGxpc2lvbiB3aGVuDQo+ID4gbG9va2luZyBieSB0
aGUgc2FtZSBwYWlyIG9mIGZ1bmN0aW9uIGFuZCBncm91cCBuYW1lIGZyb20gZGlmZmVyZW50IGRl
dmljZS4NCj4gPg0KPiA+ID4gKEFsd2F5cyBpbWFnaW5lIHRoYXQgeW91IGhhdmUgMisgc2FtZSBJ
UCBibG9ja3Mgb24gdGhlIHBsYXRmb3JtDQo+ID4gPiBiZWZvcmUgZG9pbmcgYW55IHBpbiBjb250
cm9sIGNvcmUgd29yay4gVGhpcyB3aWxsIGhlbHAgeW91IHRvIGRlc2lnbg0KPiA+ID4gaXQgcHJv
cGVybHkuICkNCj4gDQo+IE5vdCBzdXJlIGhvdyB0aGUgcGFpciBmdW5jdGlvbl9uYW1lIGdyb3Vw
X25hbWUgbWFrZXMgdGhlIGRldmljZSB1bmlxdWUuDQoNCkRvIHlvdSBhZ3JlZSBEZXZpY2UgaGFu
ZGxlICsgZnVuY3Rpb25fbmFtZSArICBncm91cF9uYW1lIG1ha2UgaXQgdW5pcXVlLg0KDQpGb3Ig
cGluIG91dGRpc2FibGUgd2UgYXJlIG1ha2luZyB1c2Ugb2YgdGhpcyAzIGNvbWJpbmF0aW9uLg0K
U2VlIHRoZSBkZXRhaWxzLg0KDQoNClRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3Ig
Y29udHJvbGxpbmcgb3V0cHV0IGRpc2FibGUgZnVuY3Rpb24gdXNpbmcNCnN5c2ZzIGluIGEgZ2Vu
ZXJpYyB3YXkgYXMgZGVzY3JpYmVkIGJlbG93Lg0KDQp8ICAgIEEgICAgIHwgICAgfCAgICAgQiAg
ICAgIHwgICAgfCAgICAgQyAgICAgfCAgICB8ICAgICBEICAgICAgICB8ICB8IEUgfA0KfHVzZXIg
c3BhY2V8LS0tPnxwaW5jdHJsIGNvcmV8PC0tPnxTb0MgcGluY3RybHw8LS0+fE91dHB1dCBkaXNh
YmxlfC0tfFBXTXwNCnwgICAgICAgICAgfCAgICB8ICAgICAgICAgICAgfCAgICB8ICAgICAgICAg
ICB8ICAgIHwgICAgICAgICAgICAgIHwgIHwgICB8DQoNCkEgZXhlY3V0ZXMgY29tbWFuZCB0byBj
b25maWd1cmUgYSBwaW4gZ3JvdXAgZm9yIHBpbiBvdXRwdXQgZGlzYWJsZSBvcGVyYXRpb24NCiAg
ZWNobyAiZm5hbWUgZ25hbWUgY29uZiBjb25mX3ZhbCIgPiBjb25maWd1cmUNCg0KQiBwYXJzZXMg
dGhlIGNvbW1hbmQgYW5kIGlkZW50aWZpZXMgdGhlIGJpbmRpbmcgZGV2aWNlIGFzc29jaWF0ZWQg
d2l0aCB0aGF0DQogIHBpbiBncm91cA0KDQpDIG1hdGNoZXMgdGhlIGJpbmRpbmcgZGV2aWNlIGFn
YWluc3QgdGhlIGRldmljZSByZWdpc3RlcmVkIGJ5IEQgZm9yDQogIGNvbmZpZ3VyYXRpb24gb3Bl
cmF0aW9uDQoNCkQgbWF0Y2hlcyB0aGUgcGluIGdyb3VwIGFuZCBjb25maWd1cmUgdGhlIHBpbnMg
Zm9yIE91dHB1dCBkaXNhYmxlIG9wZXJhdGlvbg0KDQpCb3RoIEQgYW5kIEUgYXJlIGxpbmtlZCB0
b2dldGhlciBieSBkdChpLmUuIFBXTSBjaGFubmVsIGxpbmtlZCB3aXRoIE91dHB1dA0KIGRpc2Fi
bGUgUG9ydCkNCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg0KDQo=
