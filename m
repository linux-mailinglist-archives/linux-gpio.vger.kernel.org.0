Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6899A6A91F5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Mar 2023 08:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbjCCHwI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Mar 2023 02:52:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCCHwH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Mar 2023 02:52:07 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2102.outbound.protection.outlook.com [40.107.113.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 063785550A;
        Thu,  2 Mar 2023 23:52:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnUyDTUrNWPdlsMvIOY3wSs2jJ7pvJws5NKEBYbf8ZYnZMIMguixJ0nVCy4GmiFIf30pLqRgfe7qYjT5w4aR9URus6aM6VZINbheJbWPnY356YRSzKrGij0ab/VvIXguFQFRgLHwAc6CBhx0NdoaS04UjntQTalEtjaR/Gc0allHgh+IhVR7cs3OaNQi0qfiR2ELXl4Gsg5Pi+1jD+RSWawLyj/1vNDiEi5Jns12K/93cy6SPsxFQw/8F0wbSkm7YM+VIs+bcSrOLFORlXs+T21xNFRNsLkKNY31Z1VoaUP46YIGfSMVzj5LNKd1VW5LxT07kL6uIubKLlJ/qERV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddpOm3KjUmTkDe33iF+G7eeJ1hzNZWJiRqJ6CkrBnbI=;
 b=D9xN0JmnwOPBdT46ewuxK3gsoULt0fqWZV1w9d/UFsuEst1UaWdVkFJqNUgkv3m7dRHu3Xld/l7lUIJ8Rz6Ljl+cX7/Pov+f0dzsgFjJThCa2iOuBBXutg4bNJ4rFw+S2rIVJryiTpDR0fkwnVz6IMgS7oA2jBi/vhqqqrEttAQugFclUp/vZcWzpHTW8uKBhOW3Zx+ryTIF7rxfDZhPwVEqmdsuOkI8eGu/QgMh7rPaDo/RqUzY9eSuHMXK9neNYQ+K2dsgrDEJs6FCz+uDyG0gKxrL6hvbl8X0Yb9ZgkX9VWTB8pJJl80mKLJu+EOQUTvSeBZUaWNbFD/77r/i8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddpOm3KjUmTkDe33iF+G7eeJ1hzNZWJiRqJ6CkrBnbI=;
 b=t5WZUecZBKSmuEDwLuZi1tDEOvyx9DexO2W+l69OIIaWD/7iH2JIfsRcc81ewyO21xrstPrX59LcGVuiTph7x9AOOVfz+6lOROqK6Q/mZdfugAAtn4km819969wjA41K7KW3DyjxkEZ+H+Xf2Am1gUQCWIr+NC0D3BbHVeFPK1s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB6283.jpnprd01.prod.outlook.com (2603:1096:400:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 07:52:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 07:52:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Drew Fustini <dfustini@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 0/9] Add RZ/G2L POEG support
Thread-Topic: [PATCH v5 0/9] Add RZ/G2L POEG support
Thread-Index: AQHZEMyy7xmstDLz3Ue3pcUPPz/gvK6EJaKAgBItt9CAASJegIBRrxFQ
Date:   Fri, 3 Mar 2023 07:52:01 +0000
Message-ID: <OS0PR01MB5922F5494D3C0862E15F3F8486B39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
 <OS0PR01MB5922FBA488F80DFB08FE16E686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CACRpkda1JDaaMnCx81oZ2Wmm1_rfYgsaRdBGT0jCyczNSHc4og@mail.gmail.com>
In-Reply-To: <CACRpkda1JDaaMnCx81oZ2Wmm1_rfYgsaRdBGT0jCyczNSHc4og@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYAPR01MB6283:EE_
x-ms-office365-filtering-correlation-id: 566cf62e-cc87-4eb4-b846-08db1bbc2ca8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9nwoG0+Mz+8BauyiaOGrLGeVv7IZc/BgAv5/I0aRCgu3gtPPOyeZvdnZzUIcFjiKLrcttZMfl9tgPL8EsPQTzYsJoSj0+y/0IF6HTueoUCEt0FNw0xusd9p1Cj2hqvMEsNUalaqUaS4xgx29ULRCeoaoNi+C6DdtxZlArw3qruHMhlwt1eDab4fHK4vR8D4fkoViRa+n5A0/O98K7aRpAgG5TWrNdpdW1qsJxg4v6+ORCLA3spYitBlywo3jPIth50EVNcOYQSzUKsYMJaWNSfQMA7SsnjB0hOB9JFQo0PI3Dzjdrqmrn7X+F/LBNO8apEcOoQUNhSDh4XPVkU56OXpNvqzQbzszJOlIbGsv/pD8GTDz1T/3czITptCNZX3VrvzKAba6fTbfO/LGXXtVXW4VvijvZ1GbzgwRxVRUunuJwmc96pcdhIA0tx5mzDDtTcNZwU4bLta8kspB/gC4XrUg0I9eRDVSypmdAyh8cQJV5EMG2jmHDctubEpt5pOS2HX4Ooj00abwhMHVJozbdGo8zbffHtDASnDxK4BWNXR08zBUf8OK0eSenzarpndLxrU4LFrw06DeQxl8LCqIRxs8WJ3bHpmUZn+21FA2npBEnT6mQa0OgXKzFJ3cxO8qJTrcmfME/AVGRfXUaVyto0J9bA0kun3KEmuHs9SOs0TSuYT6IGs8VYoztXz1+CQsHr/jy5/gYML4QRmx4nyWpw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(451199018)(7416002)(5660300002)(66476007)(4326008)(66446008)(41300700001)(8936002)(64756008)(83380400001)(2906002)(66946007)(76116006)(55016003)(66556008)(8676002)(52536014)(316002)(33656002)(122000001)(38100700002)(6916009)(54906003)(6506007)(26005)(7696005)(71200400001)(186003)(107886003)(9686003)(478600001)(53546011)(86362001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M01MT253bHhNTE5NUlY0Z1F3WjdnZElheUh2Q1pWWFB2ZlYrOHQ3YXlPdGZs?=
 =?utf-8?B?WVNDczVyQVNKRmt6VHpySXlvb0dQY2xtTXVjQW04d202RnY1MHdZWit5Y3BS?=
 =?utf-8?B?cEEvRTNjRms4ZEY4Vlo1TDRnNlU3Rjh2Mlc3Z3dSSTNTQTd6cUU0bFVlZEJs?=
 =?utf-8?B?S29QdGNEcHEycko2ZC9NaVRkRURrVWlXTXFOdW0rZmFnRGxzMkdvbDJDWW9P?=
 =?utf-8?B?U3E4NHNsK01TWUZqK0NYRW1uU2dPczI0MVAwK1VSVkFERU9mdHAxejY1c2h1?=
 =?utf-8?B?VXlRRUNzTFhya1dHK3FJbE05SFR2QllNekU3WDhCWEh6ZENQY0Z5UDl0cmw2?=
 =?utf-8?B?T0I5a1JCVlQ4RXppa1NyamZtSTE5aTVHZGE2UzRlOEhTejluTnNWV3QrMkVK?=
 =?utf-8?B?azN3L3NxWHNSUUhGQkFSS0pROEo2YzkwMHRVQVpWUGRIQWRXNUZ3N0hYQkZi?=
 =?utf-8?B?SjA3Wks4bTZnbDFQSTVrTEdXdkRsZitoNkFrQzRLamp0OFNGYnI2TXVxT2FB?=
 =?utf-8?B?ZnV5c29zcmV2SGlnQmVETGJRcHlMbllXNE01aHZMbStoNU9NcDZQamthOExS?=
 =?utf-8?B?N0FTbUVXTzNvQVpOUnhIbFlkb21sTkVOcEJhdHloMmh3TGJOblc2dXNqQUpN?=
 =?utf-8?B?cmRVWnhmRHQ5MzE0czl0Y0ZQU0pnSjVad0JMWlc4NmVJclF6QjZweHN0Nmhr?=
 =?utf-8?B?cHU1M2UzQTBLa1pVTVRnTHBxYWZZQWcyQkloUDhjczR0TGMzYWl6NWNyNlV5?=
 =?utf-8?B?UGdrZEpuZzRnMnZwR1ZvK0ZKRm9nZUdnTHhCSE1wNHlOOHRwbmNaSk5wVmZm?=
 =?utf-8?B?RFRlZXdPYkVKTmpQaWVQM0RDRGk2RlI4ZEdtcXhWN3dZQUdZTmhCb0JyYURP?=
 =?utf-8?B?bmQzSWlUSUI5TllVa0x3eVNyS3N1Q0pKT244SDlTbTZOZjdHWkQ1bWZKenA2?=
 =?utf-8?B?ZlRYTHFWVWQ2R1lzd2ludzRkRWdzOUM5dk0wNi8rNTdNT1ZwK2J5MlNqZmNV?=
 =?utf-8?B?U1pCM1NPbGlML3hrc0VWMlhYT3RNNHhXdjRuRUlTMUFYc09mTmlqVkFJemNr?=
 =?utf-8?B?Mjk3SDlTenduN29jSzhOZTlLaGkvby95ZW94TEdIY0hSbnR1NXBBa09aWmVN?=
 =?utf-8?B?bHdPdHJNekdDUS80VzlBY1lqWlVCQ3N4cktrbC95bG1pSmVSaGxKd2s2anMx?=
 =?utf-8?B?NWlwdmw4OEJJQ21DdDB6ZHFnN1FmOEZlM1p3Rnl1b0NMUzlSam5LRmJFSXpG?=
 =?utf-8?B?VnNOeUpFc2locVVjbFcrZXduTERKQmxRWWJEeEtHNWJ6bkgvbTl2R1Q3T1Vp?=
 =?utf-8?B?cUxHR3pialpNVDFkN1h0eEpLdDNnOVczUVRpcytOZXFKWEl6anN3K05qSmFN?=
 =?utf-8?B?NTcvUHkxY3hyVmZmNHpXZkVpckFwSmpKWERZbW5UNWNJQ0Y5c09KWG5NZ3Nh?=
 =?utf-8?B?TVZJTXNrZUZIWVBzeCtjSGNtRFl0OWd6cGg2Y1NUa0plTWl3VlJOc1RyRXRG?=
 =?utf-8?B?OFNRMzVESU5YSXVaNDdqSlZHcjdVMjhGcWIvMWFLN2VPR3Fqb0RrOGs4VEZs?=
 =?utf-8?B?SFE4d0VuQXYyN1RKOTB1ODd1MFM4cWZiZXZyTEhWK3RvZnBvMHZGTVB1cGQv?=
 =?utf-8?B?MTdDaEtoM2hqQWs3NWQvcDVNYy84VVBQTmprcUNnakwxbUZBWGoyRXNBVzU3?=
 =?utf-8?B?dmdsZktyc203NXQxZlBZbUM0OFo0T2QvenZrYXVHNy9HYUR4ekZCcUVUWG5S?=
 =?utf-8?B?ZGR3M0N6T2dISno0bWszNHRDOHhURVU4aHRML1JJTDZBY2ZUMmVWUDRvL2I3?=
 =?utf-8?B?ZUVCdi9wRHZoTFA2bm9La2xnYlpFVE9NMXl0dlQ5aWV4cUxJN0JKN1ZMaTFm?=
 =?utf-8?B?NkRDWExXOGFLY2pqQkxOQWp0ZG9NbnQ3MUJCY1ZONUIxRFlyUzJQTC96MzRM?=
 =?utf-8?B?MEwvSTlXQUFkK2JEUXJVNy9oSjMreTlsRXBqcXk5UDNEQ3pWbUVSS0ttVGI5?=
 =?utf-8?B?L05IWTBaNkZNOEQ5WW1hTFd4M0ROb1MrcUtxek1ueFFmaVZ6VzlOUmtXYkx1?=
 =?utf-8?B?b2FKNEI1eVRDa1k4MFNOcFRIWllnK3FDZmtHaEx2Vk4xblhhUHc5bnR6c3hO?=
 =?utf-8?Q?C2RR5KLQrzkJHerGJZd+jY0c1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566cf62e-cc87-4eb4-b846-08db1bbc2ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2023 07:52:01.9645
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Alo1wDFrG63NCyouZI7eYrGCpS73UAqOQzQOgn2PWpF0k22SIvShSGPIlfZStVGovPqVq34Hcz44Okfa+d8p5fvPDDjjdl25Pq4FgkT50Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6283
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAwLzldIEFkZCBSWi9HMkwgUE9FRyBzdXBwb3J0DQo+IA0KPiBPbiBNb24sIEphbiA5LCAy
MDIzIGF0IDQ6MTAgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90
ZToNCj4gDQo+ID4gPiBXaGF0J3Mgd3Jvbmcgd2l0aCB1c2luZyB0aGUgZGVidWdmcyBhcHByb2Fj
aCBEcmV3IGltcGxlbWVudGVkIGluDQo+ID4gPiBjb21taXQgNjE5OWY2YmVjYzg2OWQzMGNhOTM5
NGNhMGY3YTQ4NGJmOWQ1OThlYg0KPiA+ID4gInBpbmN0cmw6IHBpbm11eDogQWRkIHBpbm11eC1z
ZWxlY3QgZGVidWdmcyBmaWxlIg0KPiA+ID4gPw0KPiA+DQo+ID4gSSBhbSBub3Qgc3VyZSwgd2Ug
c3VwcG9zZWQgdG8gdXNlIGRlYnVnZnMgZm9yIHByb2R1Y3Rpb24gZW52aXJvbm1lbnQ/Pw0KPiAN
Cj4gSXQgZGVwZW5kcyB3aGF0IGlzIG1lYW50IGJ5ICJwcm9kdWN0aW9uIGVudmlyb25tZW50Ii4N
Cj4gDQo+IElmIHlvdSBtZWFuIGEgY29udHJvbGxlZCBlbnZpcm9ubWVudCAib25lLW9mZiIgc3Vj
aCBhcyBhIGZhY3RvcnkgbGluZSwgYQ0KPiBzcGVjaWZpYyBpbnN0YWxsYXRpb24gZm9yIGEgc3Bl
Y2lmaWMgcHVycG9zZSBzdWNoIGFzIGEgd2F0ZXIgcHVyaWZpZXIsIHRoYXQNCj4gaXMgdmVyeSBj
dXN0b20gYW5kIGhhY2tlZCB0b2dldGhlciBmb3IgdGhhdCBvbmUgdXNlY2FzZS4gSXQgd2lsbCBo
YXZlIG90aGVyDQo+IGhhY2tzIHRvbywgc28gdGhlbiBCZWFnbGUgaXMgdXNpbmcgZGVidWdmcyBp
biAicHJvZHVjdGlvbiINCj4gaWYgdGhhdCBpcyB3aGF0IHlvdSBtZWFuIGJ5ICJwcm9kdWN0aW9u
IiwgaS5lLiB1c2VkIHRvIHByb2R1Y2Ugc29tZXRoaW5nLg0KPiANCj4gVGhpcyBpcyB0aGUgc2Ft
ZSAicHJvZHVjdGlvbiIgdXNlIGNhc2VzIGFzIHVzZWQgYnkgaS5lLiB0aGUgR1BJTyBjaGFyYWN0
ZXINCj4gZGV2aWNlLg0KPiANCj4gSWYgeW91IG1lYW4gdGhhdCB5b3UgYXJlIHByb2R1Y2luZyA2
IG1pbGxpb24gbGFwdG9wcyB3aGVyZSB1c2Vyc3BhY2UgaXMNCj4gZ29pbmcgdG8gaGFtbWVyIHRo
aXMgY29uc3RhbnRseSwgdGhlbiBuby4gSW4gdGhhdCBjYXNlIGEgcmVhbCBzeXNmcyBrbm9iIGFu
ZA0KPiBBQkkgY29udHJhY3QgaXMgbmVlZGVkLg0KPiANCj4gVXN1YWxseSB2ZW5kb3JzIGtub3cg
d2hpY2ggdXNlY2FzZSB0aGVpciBoYXJkd2FyZSBpcyBpbnRlbmRlZCBmb3IsIHRoZXJlIGlzDQo+
IGluIG15IGV4cGVyaWVuY2Ugbm8gdW5rbm93biB0YXJnZXQgYXVkaWVuY2UsIHNvIHdoaWNoIG9u
ZSBpcyBpdCBpbiB5b3VyDQo+IGNhc2U/DQo+IA0KPiA+ID4gc3VjaCBhcyBhIGxpc3Qgb2Ygc3R1
ZmYgdG8gYmUgZXhwb3J0ZWQgYXMgc3lzZnMgc3dpdGNoZXMuDQo+ID4NCj4gPiBDYW4geW91IHBs
ZWFzZSBlbGFib3JhdGU/IE9yIFBvaW50IG1lIHRvIGFuIGV4YW1wbGUgZm9yIHRoaXM/DQo+IA0K
PiBOb3Qgc3VyZSB3aGF0IHRvIHNheSBhYm91dCB0aGF0LCB5b3Ugd2lsbCBoYXZlIHRvIGludmVu
dCBzb21ldGhpbmcgSSdtDQo+IGFmcmFpZCwgZ29vZCBleGFtcGxlcyBhcmUgaW4gRG9jdW1lbnRh
dGlvbi9BQkkuDQoNCg0KRm9yIGdlbmVyaWMgYXBwcm9hY2gsIGhlcmUgaXMgbXkgcGxhbg0KDQpG
cm9tIHVzZXJzcGFjZQ0KDQplY2hvICJmbmFtZSBnbmFtZSBjb25maWcgY29uZmlndmFsdWUiID4g
b3V0cHV0X2Rpc2FibGUNCg0KQXQgY29yZSBsZXZlbCwgd2UgaWRlbnRpZnkgdGhlIGRldmljZSBh
c3NvY2lhdGVkIHdpdGggdGhlIGFib3ZlICJmbmFtZSBnbmFtZSIgLS0+IHRoaXMgd2lsbCBiZSBh
IG5ldyBhcGkuDQoNCkNvcmUgY2FsbHMgcmVzcGVjdGl2ZSBwaW5jb250cm9sIGRyaXZlciB3aXRo
IG91dHB1dF9kaXNhYmxlX2NiKGRldiwgZm5hbWUsIGduYW1lLCBjb25maWcgY29uZmlndmFsdWUp
LS0+IHRoZXJlIHdpbGwgYmUgYSBuZXcgY2IgaW4gcGluY3RybC4NCg0KVGhlIHBpbmNvbnRyb2wg
ZHJpdmVyIGhhcyBhIGxpc3Qgb2YgZGV2aWNlcyB3aXRoIGRldmljZV9vdXRwdXRfZGlzYWJsZSBj
YWxsYmFja3MNCndoaWNoIHdpbGwgYmUgcmVnaXN0ZXJlZCBieSBkaWZmZXJlbnQgZHJpdmVycyAo
ZWc6cG9lZ19kcml2ZXIsIHBvZTMtZHJpdmVyKQ0KDQpUaGUgcG9lZ19kcml2ZXIgZ2V0cyBjYWxs
YmFjayBhbmQgaXQgd2lsbCBtYXRjaCBhZ2FpbnN0ICJmbmFtZSBnbmFtZSIgYW5kIGNvbmZpZ3Vy
ZXMgdGhlIHZhbHVlLg0KDQpJZiBhbnl0aGluZyBmYWlscywgaXQgd2lsbCByZXBvcnQgZXJyb3Ig
YW5kIHByb3BhZ2F0ZXMgdG8gdXNlciBzcGFjZS4NCg0KSSB3aWxsIHByb3RvdHlwZSBiYXNlZCBv
biB0aGUgYWJvdmUuIFBsZWFzZSBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBkaWZmZXJlbnQgb3Bp
bmlvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCiANCg==
