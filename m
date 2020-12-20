Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30DDC2DF48D
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Dec 2020 09:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgLTI7f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Dec 2020 03:59:35 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:7457 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbgLTI7e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Dec 2020 03:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608454773; x=1639990773;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XtBjsfRXjuEuGKKlufREJ/U9xFr1c//Y4LDb1m2YAys=;
  b=jY3yULIKZu55UoMPScg+P3o4K9JMJAun88gIoRFy0EoP0chPhWooKnRe
   FzVasdoAhjFJzGEjMv0YUstFuoA405ByIuWiJfo6i7caszfMzGT4xLKzY
   +jczgBZ3SdHzyIusnw9equl3CP5CvU0meZdu4Qof9CJQxeZ5ptRqgJfny
   OzrmQcftBrAk28Sl8uSWr4Lksj1IaPpHe/vIVz5l+b5uoOr2Z1UJAUd7J
   xKWshmUMUPaWt2DmOab5nnjmycdH4++nUYnbPQPa/nNSg5epmlEagN6rL
   4KL2F+BvoN9UCdF+TPGpt2qN+JCU5Eg09BN9RrLhKGcbYZjAz+VJUBoy5
   w==;
IronPort-SDR: wIi06JcBrL4CYMPt0NmMyKgNm9TwCN4vLCIUGuO7oZToz27N9Nmz+tMpkovt4sz37MQZUs8nvF
 YL6hKhdu60xa2Sw+e5qe01XlGnDrvtRifsVIMkwHNuQu5tyV4/8syjMjs0AePRllL2/X9uqatv
 VTrjanbr9zGxYnAG72/susVuWAtQ+cKvWgW+eXs2NVTbaC44J80EFyV3Mob8SgHQsYrCW51D+u
 pTGxu9/r4n3dnHvgHjAvnP75Mdw/e+FyYwZVZ1q0ijLPea8INqLbjmGtzIXSnLmG5fH894Hr9b
 rEM=
X-IronPort-AV: E=Sophos;i="5.78,434,1599494400"; 
   d="scan'208";a="265810487"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
  by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2020 16:58:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Spm2rECXbFKLOPxV3aPwWpQaeHcn7OwDGEUeAHIWW1ai89yOR3yfAxwxcj+g6qGbOpBxV9KM6KzCveZW+yjOonX/88ftwZtdDcd10PR9n0LO1rjZq2hIJgTLhwpfhWMDtbyaEq6lPjS1dLHyPmwFDd+3SgaJ5gkP2SsBIJv3DhJC8YxFYvXYusoWVEbCaIrr/hRzT/vA4W6MSaFNQs2fHm2mbgc4d/fZi1nF6kIpiGwNqXBmkXIf0zcv9ToVfNjMqfBf8qJh6HEeHK+QZthteZ2bkT/bng07hAM8Ld22WeOoSjqzWfET10VRoIxlKiR6FluYIhqrR8TX4jZjThgftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtBjsfRXjuEuGKKlufREJ/U9xFr1c//Y4LDb1m2YAys=;
 b=NCbOVb8ZQDmfnr7dvH4eSxXX5Ye3cb9z5hs+Ba382OAHxs3uwX2YRsv6hYetN1mx9mCRJjYRjZbyMFzzApNDggTFXLvgyCoTMJrssFbinAfnfOfAJwlHyl3p77SWsp2zWYD9AFEsCFqRqh7+6pQ30B7FVGKyHlyKdVvJzx4YEXErSIdqZEdd1Nf64AoWgzMQ+MN9Ax4d3H9LYtx+lLXOJcnmhvCY/gVK66eWTTwH5MqJwe5Ykb8Au/+CCq58tw65R8xwjC1TNFVBfkfUdwON87qIhTc93mO8280+CrOSF90zmOik5KBUKNDnrAuKKny0o6oJ2nlo0FL9gqeRyAHf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtBjsfRXjuEuGKKlufREJ/U9xFr1c//Y4LDb1m2YAys=;
 b=rNGZ7W4VKHyScKL31GRPQ1ahmenPqf2FjAQ1WOiCZkiQc5HZmP/vc7nrEEeL9sFoj9aPMhB2lVXoYd93eEIREnArBD42nuylLixg169lCWv1QlKFQMCRVxjD2WwlnG9SHxTz9hXAiuikpFkYtD5XhQXoqg/Lzu0S3Hpn2k/W9L4=
Received: from DM6PR04MB6527.namprd04.prod.outlook.com (2603:10b6:5:20e::9) by
 DM6PR04MB5067.namprd04.prod.outlook.com (2603:10b6:5:fe::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.25; Sun, 20 Dec 2020 08:58:24 +0000
Received: from DM6PR04MB6527.namprd04.prod.outlook.com
 ([fe80::80a1:12c6:f282:f22a]) by DM6PR04MB6527.namprd04.prod.outlook.com
 ([fe80::80a1:12c6:f282:f22a%4]) with mapi id 15.20.3676.025; Sun, 20 Dec 2020
 08:58:24 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "palmer@dabbelt.com" <palmer@dabbelt.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "seanga2@gmail.com" <seanga2@gmail.com>
Subject: Re: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Topic: [PATCH v10 09/23] dt-binding: clock: Document canaan,k210-clk
 bindings
Thread-Index: AQHW0VcKSUc5JWucbkupBqEzxYwjiqn/gQsAgAA40YA=
Date:   Sun, 20 Dec 2020 08:58:24 +0000
Message-ID: <66782ff9a9086468af7aeabd8292786c1d97eaaf.camel@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
         <20201213135056.24446-10-damien.lemoal@wdc.com>
         <160819259979.1580929.9332027241734052085@swboyd.mtv.corp.google.com>
         <CH2PR04MB65227B0B94F919406CB84C28E7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
         <160820021596.1580929.1686334340234415270@swboyd.mtv.corp.google.com>
         <CH2PR04MB6522E9EC44FF8FFA5981107CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
         <160820216451.1580929.9401304620489565784@swboyd.mtv.corp.google.com>
         <CH2PR04MB652284F1607FD2A29275693CE7C40@CH2PR04MB6522.namprd04.prod.outlook.com>
         <160844250293.1580929.6654681087428087193@swboyd.mtv.corp.google.com>
In-Reply-To: <160844250293.1580929.6654681087428087193@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.2 (3.38.2-1.fc33) 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7d879904-98c0-4e8a-ac75-08d8a4c568d5
x-ms-traffictypediagnostic: DM6PR04MB5067:
x-microsoft-antispam-prvs: <DM6PR04MB5067C11364AA1252D4F3B874E7C10@DM6PR04MB5067.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EyOnO4DI5+OHvv3H8ilN6mhf2mL13yUPvhgrfVXrN7Wvn2aJPB5E7JERJZpPkSIZLfg0S8dWu/Oa6vmsbQc8RDHmm9fpTJ8KSdhW956gEX5LSUpljRiecMSqSWyG8vyCpVkL7hwuIu4rElnJ5Su7tlXaps2WNntsSoO+cgmzLKocc+paLWVe+fG8XRmj09X5FvIKLNPklZ3sbD+h4/Lkz7HM0THP+8JDoOK5fSsu8jzEPtZFdohgjKWLjktrAOl1Y7m4YsfYL3y1qAt9sFgcRwGSVtgX+8gqzMxgM+YDuiTjm+2/iTNTYCUs50y++G8lB0QN3R0bX6plUiK9l2VAHsynTqDJJRCWg1s5y4OaN0MCKGunqadG5xBG10VmL1C/LtNfJ0OmblsrBaGBnp1bkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB6527.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(376002)(396003)(136003)(66446008)(8676002)(4744005)(8936002)(53546011)(6506007)(7416002)(110136005)(186003)(4326008)(2616005)(6512007)(316002)(478600001)(5660300002)(36756003)(2906002)(4001150100001)(6486002)(86362001)(91956017)(64756008)(66556008)(66476007)(76116006)(66946007)(83380400001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UlBjSU1xbjRZOVdGdkt3UlhkZHM0eDdneEh0NkNSQjBycy9yaUduRFNJSnVE?=
 =?utf-8?B?SUVIcmtnVkUvMnc5UDM4S3A0M0IvckxoQThGbkNEVURlelNRL2JKRmIzRi9M?=
 =?utf-8?B?ZGc0Z0cxS1dGczNDOVpDdko2WW95d3E3WUtMeEVnOVUrcWMzRDI0d2ZLQTN3?=
 =?utf-8?B?OE9IWU1pMkN2NWtkSHpEOE9WVDlFU2dsNGRNZVNyRG8wZElQMjNmdldHbitS?=
 =?utf-8?B?UEkvMWdERjIrSW1mMjA2MllFWElSbzhUUGpxNGMvdWhHOU5TSzRsM1gvY0dS?=
 =?utf-8?B?aG93azZaRHl1YWVEazR2d0xiQlhPdHM2ZUxENzg0WFpIdlF1Z2k0S21YOHhR?=
 =?utf-8?B?eHp1QlNqdXhUQXBoU0trb3lMTjFnKzJxZTVlNHFqSWM5emtNODNrZElHT21S?=
 =?utf-8?B?SUVOOEQ1N2xHMkxLOTE3NS9MZ2NIVHRCRkg1WkZXV0pXMEQvZ044WENGTm44?=
 =?utf-8?B?RTZueW9SSnVDcm52c254V2dqcTlHeXRYbjZVM2M1cklXTXp6M2RCcEZNcFRy?=
 =?utf-8?B?ekt6c2FTVjk0MysvL2NjazhvWklqc2NCUzd5R2ZKdDdYMy80L0YvbVVjNjBy?=
 =?utf-8?B?ejNGalVUYUdjV1hDUW1Ka3lZSzhBUHhUYXlnOFFyai9DNXYrQ2xuWm5HNzlk?=
 =?utf-8?B?QmxndVVzMUpHZ01NZU9XMVExZXF1S1o1TUg0SW5ld1pBSzFPdHJxTWgvNmpk?=
 =?utf-8?B?VVZGOEhNR0dLUHk1Vy9ycXhHbEpKcTBXcEQ0Y2NFR3pVNFhjbFY5VFVDVktv?=
 =?utf-8?B?ZFN5KzZiRi9uUFJFbVZqQy9oNXRoR2xCSE5nL2V5NEI1ZmNYSVkzdS9RVUZ3?=
 =?utf-8?B?UjRmVEJhSE9oSEtuQklvYmRiU2FPNXE1bFI0Um5TVzdZSGJSZHE4MHY3bCsy?=
 =?utf-8?B?WGdWOXRVN2pBUkVrekhlR3AxQXpsQVRaMXR1OTczZWwzNFVvS25lZ0hEemx1?=
 =?utf-8?B?UEZzSTdIMHJKazFNbWVZQ2lvTU5uUU1QelpGOHd2c2ZzMWdtandYQU5meCtM?=
 =?utf-8?B?bzllck1YZU1aY3kvQytOd1dKMVFmNzkrYW45VFVacDBmQ0NUaDBwUEZsRG93?=
 =?utf-8?B?cFhMYjk2SldjVHc0ekZzc2d4bVd2c09ZWXZPd2Y1UjAzUzROYVBWVWYvYkJM?=
 =?utf-8?B?U1ZzbG5ibWZyYlpGWVZ3OCtvTFB0bHdSUzE1dkFaMi9NOThkK1NLWFBxWElL?=
 =?utf-8?B?WkV4RE16MWxSUkQyc0dEdElvWWticUoyZElvd29jbkVNaExzTFJ6Um5lQi9S?=
 =?utf-8?B?b2tTeS8vNEhXNHA1R01sdUNTdVJlejBXbW9rSGF3NDZyS3ZVTVAxYXA0clpC?=
 =?utf-8?B?L1BOWkR5amtyKzhGdFN0UEIwYWhoc1MvTElaOHZtK0NIUWJsQ3d4MDJ6c2hC?=
 =?utf-8?B?Qi96RURGd1lxWkNVMXJxSUdzN2VOQ2dLMGxMWkYxTTZGNFYxN0NHTlJQa0FP?=
 =?utf-8?Q?ZS8TjaTr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0673CEBBD92DA24185A54098E1AD15B8@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6527.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d879904-98c0-4e8a-ac75-08d8a4c568d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2020 08:58:24.5917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6R17piFvJAclMnC/M2V+OTSNIREdk219nYVs6DCCjWn1LFBWhrWHaQys1d4v5hr6u5gYSIrsj1ZoocUPA14DXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5067
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

T24gU2F0LCAyMDIwLTEyLTE5IGF0IDIxOjM1IC0wODAwLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+
IFF1b3RpbmcgRGFtaWVuIExlIE1vYWwgKDIwMjAtMTItMTcgMDI6NTE6MjApDQo+ID4gT24gMjAy
MC8xMi8xNyAxOTo0OSwgU3RlcGhlbiBCb3lkIHdyb3RlOg0KPiA+ID4gSSB3YXMgdGhpbmtpbmcg
b2YganVzdCBhcHBseWluZyB0aGlzIERUIGJpbmRpbmcgcGF0Y2ggbm93IHNvIGl0IGdldHMNCj4g
PiA+IG1lcmdlZCBpbnRvIHRoZSBuZXh0IC1yYzEuIFRoZW4gYW55b25lIGNhbiB1c2UgdGhlIGRl
ZmluZXMgYmVjYXVzZQ0KPiA+ID4gdGhleSdyZSBpbiBMaW51cycgdHJlZSBhbmQgd2hlcmV2ZXIg
dGhlIGR0cyBmaWxlIGVuZHMgdXAgY2FuIGp1c3QgYmFzZQ0KPiA+ID4gb24gLXJjMS4gSSBwcm9i
YWJseSB3b24ndCBtZXJnZSB0aGUgY2xrIGRyaXZlciB1bnRpbCB2NS4xMiBnaXZlbiB0aGF0DQo+
ID4gPiB0aGUgbWVyZ2Ugd2luZG93IGlzIG9wZW4uDQo+ID4gDQo+ID4gT0suIE1ha2VzIHNlbnNl
LiBTZW5kaW5nIGp1c3QgdGhlIGNsayBiaW5kaW5nIHBhdGNoIHRoZW4sIHdpdGggdGhlIEsyMTBf
Q0xLX0FDTEsNCj4gPiBjbG9jayBkZWZpbml0aW9uIGxlZnQgaW4uDQo+ID4gDQo+IA0KPiBEaWQg
eW91IHNlbmQgaXQ/DQoNCkp1c3QgZGlkLiBNeSBhcG9sb2dpZXMgZm9yIHRoZSBkZWxheS4gQWxy
ZWFkeSBpbiB2YWNhdGlvbiBtb2RlIDopDQoNCkhhcHB5IGhvbGlkYXlzICENCg0KLS0gDQpEYW1p
ZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFsDQo=
