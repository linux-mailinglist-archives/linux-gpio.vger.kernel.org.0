Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2A8663C57
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 10:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237922AbjAJJKl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 04:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237838AbjAJJKS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 04:10:18 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2128.outbound.protection.outlook.com [40.107.114.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2338D192B7;
        Tue, 10 Jan 2023 01:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWeeQhHOPCeEpnmMFxw69nESjetEZDQxmCmq8EmNCB7nbDnrHwwPZnuxS4bkJwHc/Z94dJtu2NcV7nfZwvLelZEje4xgp6GQgANFTJwdCtgRVTWS5iG1SUTA8z3uYe6Pu2jW4QiKbKj+K5wcj6PzRXwRcBP9uY1wbqEJumMuHciXn1kp5sPGLgUIemrsrMPzBKXhgO38QGVg+owS6Fp6i2nnDpR+cZxLXNqH4yQUe/g+UGaocfV1GwziTDypdU4TQ7xN3qd6jug/frL3l2pwGBZpbBAStpy7jzEAYtU+592sIz4KGnLeQkuCTfq3iI3dR2/C1BP5GI65O30tvlCjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XsqaZZul7Cy2a4iJQfMgHKBw4Fmnk/L8K4CDIuVCSo=;
 b=eDRD0u/q5bW2aqDH1hY6kES0eHpuWUhvAbBDtLqlOWgFRJNcO0c7YRuzjGM4XjKUUmaEa3mXh96tB/bbczzraiTb5pmyUXvZlTZUm/BVbz3rJlcJFDG+ezL83OUt3qfqKzO51B5edzIWMXjTHZgO5tDVH13YVh7OrnbcHdTOxEu/e/NSatxNkqQbxW83l0bXrpcnMj/fFMAMXi6ONYhMq89tb5qId6Ki5pwx6XE4vpxmxI2hh9KZ8kstII2q8Qo5bvWqHC9lcXFb7B/fhImhMek4CvPQQcgkULMe+zQYlBGQpQ566exs+kBbAvpvMiaZb60oSiFcHW9Xgg1H/2tDeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XsqaZZul7Cy2a4iJQfMgHKBw4Fmnk/L8K4CDIuVCSo=;
 b=S0YALasqCZlazk0chCOKK5lWJl0lIBPHTNOiMnbc1i8De3yLLbNYsTOiP6uXqTMCRV5BdpVZn0dcLaG1MQDZeDMypl8Cm1uWxfyL0RuU1RSk53Dpe+Mh44mnLVXYAXN8LGMG+zOr1FU36h8+L3u4eZ58xPrTi+2fziJ0dDxMO2k=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8529.jpnprd01.prod.outlook.com (2603:1096:604:18a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 09:09:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%3]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 09:09:47 +0000
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
Thread-Index: AQHZEMyy7xmstDLz3Ue3pcUPPz/gvK6EJaKAgBItt9CAASJegIAABK5g
Date:   Tue, 10 Jan 2023 09:09:47 +0000
Message-ID: <OS0PR01MB59226545B0A463D0FD30C9C886FF9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8529:EE_
x-ms-office365-filtering-correlation-id: 9e4ba684-3692-48c2-22d3-08daf2ea6c41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AXKQf/71HknKV0blimD4CFAfxE9qy345kLv8JU4kEsdi4SFcLcGECytG7NpCacVPqqC2SFT5ydRSzMYR3r7K+SP2HyoVxcx7y6NGzk6J/VO2ytyFQHY0y75ziwx/oBFRBZmvxKu6s3d4ym5jYfODwhCGtvyMkJo40Ac69QLeYy3gppP0qlNMpss/2dgX7IBhCoYYIbSujOIQRFQhKZoup4J7uhuCk1AKm5nDIx/7o/9ImJcGdB1Jk3IeNHkGmEC43eA8Hfrl7fR8PT5LEUsrF+LIiwRfbHBFy8f/5eDGfg3/FhwBi0p8YfbZ6eYus45L1MVtSte6SeD4lukLQNztgGrT5vT2bTye4SHaUwdbm3iRhPpoii+V/BkK8JtpvYl/pLu1AWsrmtrYCFvhPUrq1D32mtWYsHMV9M8VaZRg4G2wIjmJ9qhF9jiGe7VrrAQgY9CE0LgJQusOa03u5rIPAaHaB11GXI2/Mu+RPvkOg6PZHtqq+4/QCXdFJQHr9QcN+xLJrOIV3waUe3A3Mh5Ngg2KvfpeAYXlIuMg7Fi1g6vs7MpkkegCCZkd44gc8zvvuy8T3nOO/RecywMaoO+Zw2picpKPY4cVQ6uNHZbC3sQijgEMuNXWYn+wqwbcjNbk4ERFENCXkHguNr6JEBtE64RexXwAwtlph9gsLsPEMgUf0NU1VfS9g/jenTUfLi1tE2OJ28j9rc/ufVmdmeVQTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199015)(478600001)(4326008)(86362001)(54906003)(76116006)(8676002)(5660300002)(122000001)(66556008)(7416002)(38100700002)(66476007)(38070700005)(66446008)(66946007)(64756008)(41300700001)(8936002)(52536014)(33656002)(316002)(71200400001)(83380400001)(7696005)(2906002)(6916009)(53546011)(26005)(6506007)(186003)(9686003)(55016003)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aTdXNkNycGdyamRnOU1XdzdOM2FDM1NXRnlKbmxEMHNFZWZ5N3kwaEN5NjRl?=
 =?utf-8?B?dVFPQXJtM1F0bUF6VVFlczJKVTNDNGgveTRQRmJXYXQ4cXFPRXV1Kzg1OFE1?=
 =?utf-8?B?WGZrNGs5RFYwVnV2a2Y4T0plMWJlTXJFcXc1QmFtRWFwRStsVThJdENmb2E0?=
 =?utf-8?B?M09wY1o2bjhwOXF1Y3NpK0plN0ZHZDVvSWlSRnRkMitjTU1RYUhzeGJtL2x2?=
 =?utf-8?B?M0sxY3pMdWVXQkQraXQySFdaWEorOUViYktlQmlRMDB6YlFHd0FVZE5EanIz?=
 =?utf-8?B?ckYrTFBKZEN2bGMvL2dtWVErcWliRC8rc3gxSVR2UmltTGorSy9NS2I3QnBy?=
 =?utf-8?B?aXg5dWFMTzVjUmtocTdicllCd3p3OE5DMmkzeXVTOTRuNnlSM09DSStJRW94?=
 =?utf-8?B?Z0g0V2ZSQWovQlk0Vi9ZL1RLdnlQSkRKa0F6NWNQWGJEdVR0TjdUQi9KVTA3?=
 =?utf-8?B?TFM1OEtkZlFvUUtzQjdmL1VlcDVvS0pmMWFEa0dKWi9PcFpGaExSZjZpRGZ0?=
 =?utf-8?B?TlRDSngrTk5BM2hnZGZaMkc1N2JTM1FnckhzT2Ezd05ISUEzSFZTYkhVeFJN?=
 =?utf-8?B?eSt3QThTLzdHUjVBdFBhN2w3UnhGcTE3NWNjaUx6dVVrTkNqeUd4VUYvTGRO?=
 =?utf-8?B?UzJNY3pSRFNSZHhJdDlLOGR4aTVteU0xbEtRVmRlZVo0Q01sTnZHdDFVcUY0?=
 =?utf-8?B?WCtPcUhlRjM3MlBDS2ZQUUxmT2srVDdUcnNESDl6dmYwMFNpdzNxVjlZZyth?=
 =?utf-8?B?RFFwa1R5TUI0MVgvaVNjR210c3JOaFdlKzZLeVprL2R2VEtsTVpLLzJKWDF2?=
 =?utf-8?B?eUZOazAyQUtUYVpNWTcvUjlkbEUxTFNSY0NBajNoZHU4L2Ivd0NzeG9kNkxC?=
 =?utf-8?B?UzhiUFZncjk0VXFyZFhweUhKQzVERStwM1gwTVNRZXpoU3luYjZGelkrbU9M?=
 =?utf-8?B?VVV4UWpyUjBUZEZ1OVg0OXNGTFZwTjJHMDhINVZoU0p0ZUd5b3FhVHR3Tkhl?=
 =?utf-8?B?Q3ZZcXZsc3JMSlFXa2RWNmpubklFTlRyK1hGeEwxek5LNWZOV2MyS0FUbXhD?=
 =?utf-8?B?eGVxelQwS3dZdkJtRWNhK1RoZjMrUWl0UjBLZG1MWmdkOWpOS3AvblNjK1l0?=
 =?utf-8?B?NWVhTWZnMlZUU1lLaWZOK3VTWDB1dEF6ZjJYU0J2aDg0MDJEM2tweFZxMitD?=
 =?utf-8?B?NC9URXhqdEUyQUZKZzY4TmtMMTMzY0hEOWw0Ymp5eVE0ZFhTMEJGcHB4TjBl?=
 =?utf-8?B?Z0pYS1FKZkNaOUJEYVNCR2JkV3pXd2lhV2lITE1oYmFpRU81dVo4QnVvVjRh?=
 =?utf-8?B?c1lzWDBVNk5rTzZYeHNESjZLaEZpQzFtOHBKaTVnbmJjMlJxZnU0dTdPWXhu?=
 =?utf-8?B?VTU0UWJ2Nm8xSWtlQks5bTRZVGtkemVoTW5VcmVIR0pnUVpaTGc5QWVxV25R?=
 =?utf-8?B?eWE0bUk2NGhJMnJOSDJTT3REZVIra3RLdlVRLzRHNndxd1FBUVpta3lNbE5T?=
 =?utf-8?B?TlJtUjBpRjUrb2ZXbE4xR1FKZzdTWUI5VW5oVmFEWkxwdW1GckhiczJWelFM?=
 =?utf-8?B?cVFkMVA3dFBvY3I1UlRnUDNaWHgvckpmZ0RZcWNtY3RPektycVFzdXlhbTlJ?=
 =?utf-8?B?ZXlGT0xXT2gzUFBEcFIzbTl4MHFKdytvKzE2QnFPdDJ5ZHlobUhHUVBld0Rk?=
 =?utf-8?B?Y2E2OUdDMEgzanU1VGozeE5Nb29hdXkxYi90b3N2ZnNwZWFFcnhFeDN6MHBp?=
 =?utf-8?B?dE1LV05VRUlCdnlNZE9weis0MWlXek5FbjFQUzFqdnFVRmhZQU1SM2VIYjNB?=
 =?utf-8?B?Q084eXRrc3dkdzNVVEV0NTJSWkxTT2RySnNGQmZSblZHanlySE9NY2JEMkdz?=
 =?utf-8?B?TjVUd29MRTZDWFdlMEl5L0s3c2hDTTZvaCtQdlVucGg3ZVVXb0tSbmxsU3ZS?=
 =?utf-8?B?bUlxdGt3RlJ2UmZoQWlmYnFoV1RScXlMQXltM1ZTQlFlU1FIejZtalcvbVZx?=
 =?utf-8?B?c0lYNUJqOCtES2pjdThtbzRWWXo1SGExYWs4aDdpKzRDdlprK2l3TTVCSits?=
 =?utf-8?B?b0tubVpEVHVzTzZHbFhMUlI4ZUJXM0kzbUlJY2M0bU1Nd2VlSzNwWXdIWGNx?=
 =?utf-8?B?V3F4SWthNnJWWWRsK1czeXlRb3Z0VWg5TG5BMzhRSExuQzRMV3YySGZvU3Y1?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4ba684-3692-48c2-22d3-08daf2ea6c41
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 09:09:47.8511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ijen3PCpamasolMIZc7MFh5XlHQ4OCRoSi2URkFTG7u8ipkSj4vF1UK4eGeLKUXWPe/QuvZhCemdWwi/xaDt/LDxipPQEcP3dr+4nSBCmDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8529
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMgV2FsbGVpaiwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2NSAwLzldIEFkZCBSWi9HMkwgUE9FRyBzdXBwb3J0DQo+IA0KPiBPbiBN
b24sIEphbiA5LCAyMDIzIGF0IDQ6MTAgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPiB3cm90ZToNCj4gDQo+ID4gPiBXaGF0J3Mgd3Jvbmcgd2l0aCB1c2luZyB0aGUgZGVi
dWdmcyBhcHByb2FjaCBEcmV3IGltcGxlbWVudGVkIGluDQo+ID4gPiBjb21taXQgNjE5OWY2YmVj
Yzg2OWQzMGNhOTM5NGNhMGY3YTQ4NGJmOWQ1OThlYg0KPiA+ID4gInBpbmN0cmw6IHBpbm11eDog
QWRkIHBpbm11eC1zZWxlY3QgZGVidWdmcyBmaWxlIg0KPiA+ID4gPw0KPiA+DQo+ID4gSSBhbSBu
b3Qgc3VyZSwgd2Ugc3VwcG9zZWQgdG8gdXNlIGRlYnVnZnMgZm9yIHByb2R1Y3Rpb24gZW52aXJv
bm1lbnQ/Pw0KPiANCj4gSXQgZGVwZW5kcyB3aGF0IGlzIG1lYW50IGJ5ICJwcm9kdWN0aW9uIGVu
dmlyb25tZW50Ii4NCg0KU29ycnkgZm9yIHRoZSBjb25mdXNpb24uIEkgbWVhbnQgdGhlIGZpbmFs
IHByb2R1Y3QgdXNlZCBieSB0aGUgY3VzdG9tZXJzLg0KDQpJIHdhcyB1bmRlciB0aGUgaW1wcmVz
c2lvbiB0aGF0IGRlYnVnZnMgaXMgZm9yIGhhY2tzIGFuZCBkZWJ1Z2dpbmcuDQooRm9yIGVnOiBp
ZiB0aGUgSFcgZG9lc24ndCBoYXZlIGEgVVNCMyBmdW5jdGlvbiBwb3J0LCBidXQgdXNpbmcgZGVi
dWdmcywNCndlIGNhbiBlbXVsYXRlIHRoZSBjb25kaXRpb24gYW5kIHRlc3QpDQoNCj4gDQo+IElm
IHlvdSBtZWFuIGEgY29udHJvbGxlZCBlbnZpcm9ubWVudCAib25lLW9mZiIgc3VjaCBhcyBhIGZh
Y3RvcnkgbGluZSwgYQ0KPiBzcGVjaWZpYyBpbnN0YWxsYXRpb24gZm9yIGEgc3BlY2lmaWMgcHVy
cG9zZSBzdWNoIGFzIGEgd2F0ZXIgcHVyaWZpZXIsIHRoYXQNCj4gaXMgdmVyeSBjdXN0b20gYW5k
IGhhY2tlZCB0b2dldGhlciBmb3IgdGhhdCBvbmUgdXNlY2FzZS4gSXQgd2lsbCBoYXZlIG90aGVy
DQo+IGhhY2tzIHRvbywgc28gdGhlbiBCZWFnbGUgaXMgdXNpbmcgZGVidWdmcyBpbiAicHJvZHVj
dGlvbiINCj4gaWYgdGhhdCBpcyB3aGF0IHlvdSBtZWFuIGJ5ICJwcm9kdWN0aW9uIiwgaS5lLiB1
c2VkIHRvIHByb2R1Y2Ugc29tZXRoaW5nLg0KPiANCj4gVGhpcyBpcyB0aGUgc2FtZSAicHJvZHVj
dGlvbiIgdXNlIGNhc2VzIGFzIHVzZWQgYnkgaS5lLiB0aGUgR1BJTyBjaGFyYWN0ZXINCj4gZGV2
aWNlLg0KPiANCj4gSWYgeW91IG1lYW4gdGhhdCB5b3UgYXJlIHByb2R1Y2luZyA2IG1pbGxpb24g
bGFwdG9wcyB3aGVyZSB1c2Vyc3BhY2UgaXMNCj4gZ29pbmcgdG8gaGFtbWVyIHRoaXMgY29uc3Rh
bnRseSwgdGhlbiBuby4gSW4gdGhhdCBjYXNlIGEgcmVhbCBzeXNmcyBrbm9iIGFuZA0KPiBBQkkg
Y29udHJhY3QgaXMgbmVlZGVkLg0KPiANCj4gVXN1YWxseSB2ZW5kb3JzIGtub3cgd2hpY2ggdXNl
Y2FzZSB0aGVpciBoYXJkd2FyZSBpcyBpbnRlbmRlZCBmb3IsIHRoZXJlIGlzDQo+IGluIG15IGV4
cGVyaWVuY2Ugbm8gdW5rbm93biB0YXJnZXQgYXVkaWVuY2UsIHNvIHdoaWNoIG9uZSBpcyBpdCBp
biB5b3VyDQo+IGNhc2U/DQoNClBPRUcgdXNlIGNhc2UgaXMgcmVsYXRlZCB0byBwcm90ZWN0aW9u
IGZyb20gc3lzdGVtIGZhaWx1cmUoZGlzYWJsZSBvdXRwdXQgcGlucyBpbiBjYXNlIG9mIHNob3J0
IGNpcmN1aXRzKQ0KDQpFaXRoZXINCg0KMSkgd2UgZGV0ZWN0IGV4dGVybmFsbHkgYW5kIHVzZSBz
b2Z0d2FyZSBjb250cm9sIHRvIGRpc2FibGUgb3V0cHV0IHBpbnMgLS0+IEhlcmUgSSBhbSB1c2lu
ZyBzeXNmcyB2YXJpYWJsZQ0KKC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvMTAwNDk0MDAucG9l
Zy9vdXRwdXRfZGlzYWJsZSkgdG8gY29udHJvbCBpdC4NCg0KT3INCg0KMikgd2UgZGV0ZWN0IGV4
dGVybmFsbHkgYW5kIHNlbmQgYW4gYWN0aXZlIGxldmVsIHNpZ25hbCB0byBkaXNhYmxlIG91dHB1
dCBwaW5zDQoNCk9yDQoNCjMpIHdlIGRldGVjdCBpbnRlcm5hbGx5IHVzaW5nIEdQVChQV00pIGFu
ZCBkaXNhYmxlIG91dHB1dCBwaW5zIC0tPiBIZXJlIDMgb3B0aW9ucyBvciBjb21iaW5hdGlvbiBp
cyBwb3NzaWJsZQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9yIGNvbmZpZ3VyaW5n
IHRoZSBzaG9ydCBjaXJjdWl0IGRldGVjdGlvbiBsaWtlDQoJCTEpIERlYWQgVGltZSBFcnJvciBP
dXRwdXQgRGlzYWJsZSBSZXF1ZXN0IEVuYWJsZQ0KCQkyKSBTYW1lIFRpbWUgT3V0cHV0IExldmVs
IEhpZ2ggRGlzYWJsZSBSZXF1ZXN0IEVuYWJsZQ0KCQkzKSBTYW1lIFRpbWUgT3V0cHV0IExldmVs
IExvdyBEaXNhYmxlIFJlcXVlc3QgRW5hYmxlDQoNCkkgaGF2ZSBleHBvcnRlZCAzIHN5c2ZzIHZh
cmlhYmxlcyBmb3IgY29uZmlndXJpbmcgdGhlc2UgMyBvcHRpb25zLg0KICAxKSAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vc29jLzEwMDQ5NDAwLnBvZWcvZ3B0X3JlcV9ib3RoX2hpZ2gNCiAgMikgL3N5
cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMDA0OTQwMC5wb2VnL2dwdF9yZXFfYm90aF9sb3cNCiAg
MykgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy8xMDA0OTQwMC5wb2VnL2dwdF9yZXFfZGVhZHRp
bWVfZXJyDQoNCj4gDQo+ID4gPiBzdWNoIGFzIGEgbGlzdCBvZiBzdHVmZiB0byBiZSBleHBvcnRl
ZCBhcyBzeXNmcyBzd2l0Y2hlcy4NCj4gPg0KPiA+IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8g
T3IgUG9pbnQgbWUgdG8gYW4gZXhhbXBsZSBmb3IgdGhpcz8NCj4gDQo+IE5vdCBzdXJlIHdoYXQg
dG8gc2F5IGFib3V0IHRoYXQsIHlvdSB3aWxsIGhhdmUgdG8gaW52ZW50IHNvbWV0aGluZyBJJ20N
Cj4gYWZyYWlkLCBnb29kIGV4YW1wbGVzIGFyZSBpbiBEb2N1bWVudGF0aW9uL0FCSS4NCg0KSWYg
aXQgaXMgcHJlZmVyYWJsZSB0byB1c2UgZGVidWdmcyBjb21wYXJlZCB0byBzeXNmcyBmb3IgdGhl
IHVzZSBjYXNlcyBJIG1lbnRpb25lZCBhYm92ZSwNCkkgY291bGQgY2hhbmdlIGl0IHRvIGRlYnVn
ZnMgbGlrZSBEcmV3J3MgcGF0Y2guIFBsZWFzZSBsZXQgbWUga25vdy4NCg0KQ2hlZXJzLA0KQmlq
dQ0K
