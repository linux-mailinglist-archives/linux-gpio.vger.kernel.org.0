Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8BF662977
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Jan 2023 16:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235937AbjAIPLY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Jan 2023 10:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237122AbjAIPKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Jan 2023 10:10:33 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC09327188;
        Mon,  9 Jan 2023 07:10:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9UaHtEhJfohd+VU28CwZX6bY4n9iQrIlXAmZoeWoxALV2VTD3x8TxGFB93i4wgPX+8izm4vu1lQzd8N+uUGq6yMnM2yFx7yabTyXtMCnDTKkYkyPy0hGiqDfnc2/9vpY2YiNbMiHcpA7x1vmxdFvOHHDpNK/D1F+zv6PyBOSGmA56kvcK9t8hBAdAliBKI22e+EEYYhXS2M7QZYJRzD6JH3S/F7n6rj5hZxOKFWDF4TIVSUas4dKhrq5TRohnbEaLURI4ittpUcxzD3Y1IXMD8yl0y1zslpXwjVy+AbG0u5AwlqPjlCm0xRiUZqifDOGeGq52gG4zbDbgjb9du6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hnuOOMZ8ilGlEuOVRyzm9F4ejCVVP1JIATZIPRXK4eE=;
 b=mGGxUyNdpA0k8qBaP7TrbniCyF8GnbRDs6o4dQb91PUPTWJVcwJyTvSiqSUiNnzuxk4mlWu57/EfSljx9OKQO8st1rTyRkiwNbrlgHtC70DuqzSxw8nw7Bdwb2vffZMWw839gtHKDQMckCNxpkWs7Z48OrntskCPL+pKzkvqsJCWOljkyPbeBo2e9AdZSvujxVDeNeUsCUfEdAVAkL29XbJjXfQgVK12y6EDIN0CH3WWX/ZI8V6iKtU2hpRBjqmaSA1LQ8AZikpro/MJaRaedvYQLAnggWRNYSw4LlWaBXt5UZEtQXkNah1OOkIOGICqrQAn9Nk0YT1wPIg0X3givw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnuOOMZ8ilGlEuOVRyzm9F4ejCVVP1JIATZIPRXK4eE=;
 b=KzyAvo8LAI8POYd7dxSYHMHSMXuljv0aYQGAG3r56fRyfS03Kn4RVDZl9cISMJSs4ZbnXAzMNgIbXZmXc79LWwXNVuy0bBKVubnLViTfZA72HO86zBD4mtvlBc5260RBXMaVcwdwQo+zFZDJir2EfyblgthHcMyjEtOj+M8Czd8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB11195.jpnprd01.prod.outlook.com (2603:1096:400:3f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 15:10:20 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%3]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 15:10:19 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <dfustini@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     Rob Herring <robh+dt@kernel.org>,
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
Thread-Index: AQHZEMyy7xmstDLz3Ue3pcUPPz/gvK6EJaKAgBItt9A=
Date:   Mon, 9 Jan 2023 15:10:19 +0000
Message-ID: <OS0PR01MB5922FBA488F80DFB08FE16E686FE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com>
 <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
In-Reply-To: <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB11195:EE_
x-ms-office365-filtering-correlation-id: 65a2f412-a2d6-414a-cdd2-08daf2539f8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6SSHMHzIonY4MmK5fm+FYboqUF1PQsvf7ueIjzyf5OTNucBkZHXMWqcfIgP7rtWYZVNPIoazFgy/klO45k6ZDgO/Crmqh7pjRRh/7sly+3DqdXVypbyBEErTrUQe1AXEcuFXEtgT4cvyvMHdhCEIo3WU+qAgHKu3tdWwCi3eD/6/9jSOQaaXVwMY9tfyEZzjxX1Nkq5nQK2EhoNK4SiBy+I8ly01akCapWK/XDS1KVZUeZVj35S3DTcwXbRLWYWrCKAcJhyPGGO1hrNW1kQqkvrG239Hjjv6jP36AwTN8UYr9sTTpoT+bdTxuNcfigeS9dOwD6/Gpsz2oyJ3Is4h59fg8Gkp7f1Cibb5naTc9FzSh6USk4IDqXW3VRO+kKJ0+1W2Fg13QT75iXGYmYoLI+rb8g1WtCTU2mQZxs20wqOPpAJJ4Ywd4qIUjYS7eCL3ZAs4YAm3RYCLLuOd4ftAS+2CN25vfK7Pn56PLyU4Bn706uveMLHx1+toeltIj+eOeXRfxWWRZmsUP4JGgsuO5G7FcjLqtFRCJ4fhI0p/MXqTjrq1hlsEBN2yDmBbnUKs7/46HanKsxlslcjlccmoUG+zzC38qdOzepFbQbWp/8VlJVuzcxKYU4erS1VNLdGPrxItqYdVgfLDqWO4LMdpmomKKFr7bZPiu8cqZFZWwg7zEr2iIi4K2pX8PwThTIfvxC4LianG8VRXwWZaW5WZlQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(451199015)(41300700001)(26005)(52536014)(33656002)(8936002)(5660300002)(7416002)(53546011)(9686003)(186003)(478600001)(6506007)(107886003)(83380400001)(38070700005)(54906003)(110136005)(316002)(86362001)(8676002)(64756008)(4326008)(66476007)(66556008)(66946007)(66446008)(76116006)(55016003)(71200400001)(122000001)(7696005)(38100700002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWE3bHZRU085M0ExeU05NHF5RFFWeGtDbVpHckNtS3N0bTBLOUdZN3JkZ2l2?=
 =?utf-8?B?Nlg3UG1VajJBa2ljekhHR2pMemM5RUptRVRsLzZrRlRmMXl2VDE3RERoNGNZ?=
 =?utf-8?B?SEx3MmRxcTVnWkZEM293VUEveG1WRVZ5NEJEcVVxS0hqTEpTb200MFBmU09R?=
 =?utf-8?B?d2tMZ3pKSlFQdjNoNW1JR1pIbzlVemdWLzkydnUrWnlwS3dHRW9kV0x0b0FB?=
 =?utf-8?B?YlN1aHhuYzhKVkV3NWtlWUhVVmNVTXo0djBDZEx4akt0ZzJXZkVxSk9qN2FW?=
 =?utf-8?B?TERyT3lIVlY1MEhBTGpHRzFPU1dCdXBXL0NvRUZPR1prNDZIV01wTjkxVXNt?=
 =?utf-8?B?MU5jNVZmYlFaMkV4anFObHFXeE5WenBmVWEvVldvZFNXUjM1U1I2VXJqMWt3?=
 =?utf-8?B?MTIxOU4xT2pXSGk4VmJSY1FTaUY1UDJPVHQ4RzF6eXBpckdtcm1ONkRhMFJO?=
 =?utf-8?B?UElZTXVVaXVOZTZPVW9nUHFIOTFWKzkyQThyM2VWaHUxS3FHVDQzazBwRTVK?=
 =?utf-8?B?L2NkRXJZa3pQaFpmdko5d29nQldIMmlEUGJqQ1F6Si9NV01NN2ppc0RNWHVJ?=
 =?utf-8?B?VnpoOFAwaXBTK0lQQ01yVHl4SVRWakJMMysyK1YwR1J0TW14SXFrcjBGVG43?=
 =?utf-8?B?MmlXaFNFR1lBRVZBRElLeEtmN0xQR2NWS3dmTzlTdjlhVktKUVMvdTdZU1Ry?=
 =?utf-8?B?aDZXUmRUWDV5RlFZY0NjU0grVnlmcyt5Mk92L2NUdm9mQkcvcnJwcGtkZlVO?=
 =?utf-8?B?NUVscVNGUGZnYjdVczZhcW52anlHWXJ5Y2RmY0dHaUIyOWV6dG1IVlR2OVk0?=
 =?utf-8?B?dGZmVkJMTytZY1ZKU2creFhGTkZYM09CbE5qS3JFNkdIZlRyVCtWZGpXSWtX?=
 =?utf-8?B?RnlSQ2wxYjBUQ3BDcDBCTkRaL0h6VHVOK2dHak5iZ1pVaWI4cEphd1o3dzFU?=
 =?utf-8?B?MVkxSVBxbzJXV3g4S3dFaW9QODMyV09ZZDMrZElJQXhDWTlGRjI0ZU9qRW5s?=
 =?utf-8?B?S00rVURqaExDZEFrUVJLMWhwMjBSemVVL2ZsclN5dnBuUXVoanhzNlcrQnVt?=
 =?utf-8?B?aTlOMVNtcC9uS1RxZllTWVdXOEs0S2tHS1lIdVl0REM1RVpFNFA1dW1PNXVh?=
 =?utf-8?B?enpWRmQ5ZkpUb1ZhTmo1M2pCMHhlZUtHUFZZWDl4WHBIS0x1S3ZQY2RKMVU4?=
 =?utf-8?B?TW9mZGd0aDJ1QmpBRm9SbWVUdld6Qm5xNnF2YWhnRnVKaW9INnBESEJZbC9J?=
 =?utf-8?B?aXhsdE9LdkNKZGV3YzlWb284dTIwd3dFMnRQdEgxVVBNTkpRU2JFbTFnNDM3?=
 =?utf-8?B?WHVoSHEzZ2x0eGJMMmVodk5FZFFOU1QzcWtpeUdhbHV4RjZZdTJiaTZxdTFz?=
 =?utf-8?B?Yjhqc2xZakhwOHhEYWd6ZVd4clpsQVAyckpJdnk5T2NRZkRXUE1BdkowaEZK?=
 =?utf-8?B?d2hQMU85T1pxeVpLSUlYMzRSK29CZVZzOVRjMmJEeXFCNE81K1RmWmJpeVBh?=
 =?utf-8?B?YXZ5NEVxVkVsd1dKQTJQTGE3cDJnTTZtQU5tbDR1SVNCUWc3WEpxdURycndX?=
 =?utf-8?B?UWJxR2tVL1BjNXFTbWJPMklYRGlVV2ExV1BDeWUxdFhJallPTWNBRWxKOVE2?=
 =?utf-8?B?ejEvS0dab213N0dxZXk4WVZwTkUwSkZLTmZXTHpYaVUyazRiUlQ4M21XVnp5?=
 =?utf-8?B?UlZvQkNQRGZTZ3plem1DVWYvcDIyb1ZOVzhkbTZUbWNnbkRmQU9scmFqcURT?=
 =?utf-8?B?aFdzdWNvNUtDMVcxbU5talQ2dmFsZEJVL3c3TmFHeEk2RDRSU1NraExCSW9W?=
 =?utf-8?B?T0lQR0J3ZWIzZnNFSDBHVitlQTh2citQYzluUk93dzJCS0J1cFkyQ0ZjWVNn?=
 =?utf-8?B?U3V4dXNOQW5lQmJWZzQvcVdGTzF6a01rT2FRMWJ3bCtURHlIUnBZYTQzV3FH?=
 =?utf-8?B?TjR4STVLMDhrbTRBeGlmSUlQT1R0NDhZSTBLR29Ob3JqOEt0OFFWRlhjTkZk?=
 =?utf-8?B?M1dnQks1akpPVDlkdjd6ai95VmZaSWt0bTA4TFhxRlJrTnR4TVMvbXNydWxn?=
 =?utf-8?B?UmxUVEorYTRFZzlzaGYyVGUwaldxMktDczRMZm1JUy9HbVJYUlZrNzVaQ0JW?=
 =?utf-8?B?ZHB1bmwrRU9OUjJqZU9kSUNCMEViQnNoNnVBQTc2blV0anduazZZblpGK2tK?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a2f412-a2d6-414a-cdd2-08daf2539f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2023 15:10:19.9086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8QTC8xz7PoyF8K3nZGIucJcVrpFkK6N2JktpoUNrwKyqBwIOjX0eY7xSpUf3ICl4ZR4MFJUhsv88b46LZtKyz0iuf9ZcS4pXiOfM3sqs3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11195
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgV2FsbGVpaiwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NSAwLzldIEFkZCBSWi9HMkwgUE9FRyBzdXBwb3J0DQo+IA0KPiBPbiBU
aHUsIERlYyAxNSwgMjAyMiBhdCAxMDozMiBQTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiANCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGQgc3VwcG9y
dCBmb3IgY29udHJvbGxpbmcgb3V0cHV0IGRpc2FibGUgZnVuY3Rpb24NCj4gdXNpbmcgc3lzZnMu
DQo+IA0KPiBXaGF0J3Mgd3Jvbmcgd2l0aCB1c2luZyB0aGUgZGVidWdmcyBhcHByb2FjaCBEcmV3
IGltcGxlbWVudGVkIGluIGNvbW1pdA0KPiA2MTk5ZjZiZWNjODY5ZDMwY2E5Mzk0Y2EwZjdhNDg0
YmY5ZDU5OGViDQo+ICJwaW5jdHJsOiBwaW5tdXg6IEFkZCBwaW5tdXgtc2VsZWN0IGRlYnVnZnMg
ZmlsZSINCj4gPw0KDQpJIGFtIG5vdCBzdXJlLCB3ZSBzdXBwb3NlZCB0byB1c2UgZGVidWdmcyBm
b3IgcHJvZHVjdGlvbiBlbnZpcm9ubWVudD8/DQogDQpDdXJyZW50bHkgb3V0cHV0IHBpbnMgb2Yg
dGhlIGdlbmVyYWwgUFdNIHRpbWVyIChHUFQpIGNhbiBiZSBkaXNhYmxlZCBieSB1c2luZyB0aGUg
YmVsb3cgbWV0aG9kcy4NCg0KICAxKSBSZWdpc3RlciBzZXR0aW5nKGllLCBieSBzZXR0aW5nIFBP
RUdHbi5TU0YgdG8gMSkgLS0+IGJ5IFNvZnR3YXJlIGNvbnRyb2wNCiAgMikgSW5wdXQgbGV2ZWwg
ZGV0ZWN0aW9uIG9mIHRoZSBHVEVUUkdBIHRvIEdURVRSR0QgcGlucy0+ICBzZW5kaW5nIGFuIGFj
dGl2ZSBsZXZlbCBzaWduYWwgdG8gZGlzYWJsZSB0aGUgb3V0cHV0IHBpbnMgb2YgUFdNLg0KICAz
KSBPdXRwdXQtZGlzYWJsZSByZXF1ZXN0IGZyb20gdGhlIEdQVC0tPiBIZXJlIEdQVCBkZXRlY3Rz
IHNob3J0IGNpcmN1aXRzIGFuZCByZXF1ZXN0IFBPRUcgdG8gZGlzYWJsZSB0aGUgb3V0cHV0IHBp
bnMuDQoNCkluIGNhc2UsIGlmIGFueSBvbmUgZG9lc24ndCB3YW50IHRvIHVzZSAyKSBhbmQgMyks
IHdlIHNob3VsZCBiZSBhYmxlIHRvIGRpc2FibGUgb3V0cHV0IHBpbnMgb2YgdGhlIGdlbmVyYWwg
UFdNIHRpbWVyIChHUFQpIGJ5IHJlZ2lzdGVyIGNvbnRyb2wuDQoNCj4gDQo+IFNvbWV0aGluZyBk
cml2ZXIgc3BlY2lmaWMgc2VlbXMgbGlrZSBhIGJpdCBvZiBhIGhhY2ssIGRvZXMgaXQgbm90Pw0K
PiANCj4gSWYgdGhpcyBzaG91bGQgZ28gaW50byBzeXNmcyB3ZSBzaG91bGQgcHJvYmFibHkgY3Jl
YXRlIHNvbWV0aGluZyBnZW5lcmljLA0KDQpZZXMsIGdlbmVyaWMgc3lzZnMgZW50cnkgd2lsbCBi
ZSBnb29kDQoNCj4gc3VjaCBhcyBhIGxpc3Qgb2Ygc3R1ZmYgdG8gYmUgZXhwb3J0ZWQgYXMgc3lz
ZnMgc3dpdGNoZXMuDQoNCkNhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8gT3IgUG9pbnQgbWUgdG8g
YW4gZXhhbXBsZSBmb3IgdGhpcz8NCg0KQ2hlZXJzLA0KQmlqdQ0K
