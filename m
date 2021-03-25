Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DDB348DC3
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 11:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbhCYKQJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 06:16:09 -0400
Received: from mail-mw2nam10on2043.outbound.protection.outlook.com ([40.107.94.43]:9024
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229581AbhCYKPi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 25 Mar 2021 06:15:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHq2GJUdsJMkxmmrVpDq3g8iZxTxUU//u+G/9DRtbk73rikHJMUAbeCUDmo2j/UaJoiOZLl9Dmb/Iz9MGYGQ5/Eoj2ANhlCyMrXJ/kvaBTkGtI+JGRtzfzck3TE0fgJvnizvIjMq2ZJKpemzVISLti5Kwjw3GTPvxe5RM8fuD7QK06giFiiL9sJu4/iP3fZDTZiUvVBp9HxjURt1qvAElQn0Zu+E09++NyzjYtINjCIZNiJVb0Hq6toLCKMDkfnDeoNntWVM722K34cNddwOv5djMdeHA+XWErhh+ZcsKX/WMxkIYFXGqadFrV2x2ix9adm62rns0CzTg+HHTN8BrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjAEYzq5jCi0cXEmP1TfCoQKtoYZT6LWwwM3vgZ4KNA=;
 b=hAXcaNfH4AkzBicDgFV6NGQ/jGQF8+e2VJuObnB5kuaOv/3bCorV0o+U1Pj1JAat90EwHNawGejOqFI+2wgvuZcotrUewS/k10gAbIjYImVSLlZ9QAc3QAR4rHWKmTVmyr6FvXRLEB+3SZSWzh540PMl2thoEqAPsw3BzIUPsOv5OjUNRJDvH6eXuw78HGQdSY67NlLdGGvL/1P+49KeXScU95oTQwx92t/hTmN6nx1dkEXVegKmGRy0x8fOiJYcMQorWH1o4INjAgd9UT3JO3NKKAlAcpNard+j2NAxFEMOsMpT9NiZ02pblz52ufZnSYgJup76exBlOOR2SJiFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjAEYzq5jCi0cXEmP1TfCoQKtoYZT6LWwwM3vgZ4KNA=;
 b=QqD79UeNTMea0G9fCBRm8x/2mDXfU4/VCylnqKCeH54xWGewxZ7TbiTe3wcoB43VuKnq685/YyxPXTO7FFYChzRp/ov0Ssdddg00MXqXRSFZ9dS9yxtEMHZOIuyFCDtOfXY6psi0i3+PKz77EQlc3Ef1WMEoAjgQfjK3NSx3udo=
Received: from SN6PR02MB3917.namprd02.prod.outlook.com (2603:10b6:805:2e::26)
 by SN6PR02MB3917.namprd02.prod.outlook.com (2603:10b6:805:2e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Thu, 25 Mar
 2021 10:15:31 +0000
Received: from SN6PR02MB3917.namprd02.prod.outlook.com
 ([fe80::68cc:492b:dd78:daba]) by SN6PR02MB3917.namprd02.prod.outlook.com
 ([fe80::68cc:492b:dd78:daba%4]) with mapi id 15.20.3955.025; Thu, 25 Mar 2021
 10:15:31 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Topic: [PATCH v4 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Index: AQHXGwdloppct9WdF06D8lw8GDUKq6qII6IAgAEUy/CAAeU9gIAE1ayQgASAWICAABCcUA==
Date:   Thu, 25 Mar 2021 10:15:30 +0000
Message-ID: <SN6PR02MB39173864459C1AFC0590E5DEBD629@SN6PR02MB3917.namprd02.prod.outlook.com>
References: <1615969516-87663-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1615969516-87663-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VehkqzDPQp87JL=hnCi_b4y0d3htpxRKBJ2q73AAAbBXA@mail.gmail.com>
 <SN6PR02MB3917DC23268D35870E85F37DBD699@SN6PR02MB3917.namprd02.prod.outlook.com>
 <CAHp75VcbxvVsQRP_0J0mXb5vPhBor7=cq-4nqMNb-+D_+O1cdA@mail.gmail.com>
 <SN6PR02MB39177CD8CA9BAACDA2E6453ABD659@SN6PR02MB3917.namprd02.prod.outlook.com>
 <CACRpkdaJRm4x+RaAYhy5gv7Ss897=0U=mCTbXcVAO4wKrRKZEw@mail.gmail.com>
In-Reply-To: <CACRpkdaJRm4x+RaAYhy5gv7Ss897=0U=mCTbXcVAO4wKrRKZEw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f681edb8-8e17-45f4-5b3d-08d8ef76ebb8
x-ms-traffictypediagnostic: SN6PR02MB3917:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB391704EAC95354420136819DBD629@SN6PR02MB3917.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YdtVUREm57OmmWYzu6giqtLeWvSjqOP5say4nDUNRYYqfzKtqxb424cX9jYQmM+BCKTCDmU4aoVoFkKU/VAwJLLAvR6J+f1VwqC/Zr1iI+shRocqNfiqb4xG1ubnMI5rFvTX2Hc4qI5mzJttWtq9YqiElqozJElUWQSYPCPHt0wEfiKQGYnKRMSqD7VLHrppm7PajdV+KDV4rnlON0X0KiTtYTmUmqG+d2cZCL63H5zjwOsfMgWi+1LaH2rTzOWpmqYyGxXvwfNw6ovj6lSQXYxhz1/gFbVYm5LcuNHvPO0Vp1mWKBsXSyThwZVP9VDijwacVneaB60pGPoanc7acg7TPB2Gna+16+BtAU1EUIGsU5x5GzQj4u/2CSeDwUfLfkFYRZBiZN5lpEErCkLFIkr6grRNs3ZNuebbS5EylCtc+g9zUIdn+moH95iWz05avKRA0ZWpGdrFnGaXaWTSxj8SKoAvrqxM78BZWR41tkjXLtLQsEUQcmJl+WC5gR81Zn/ANbvtlrB9VzeP0WkGTLELqQ3oGgbZiCUkY5LALjldrsyRpBvjtYPmFmfPawcX100JQ829RcvoF7KbXDoSgMPpYsgnt/I4uJLcxOa9CHRsUIgm9p36S4zydQTLNIgwzU3hnLgNbWYpA7pEYSc4xnsVfsg797vnVUHPhN1P5XU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR02MB3917.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(7696005)(83380400001)(71200400001)(86362001)(2906002)(52536014)(478600001)(33656002)(38100700001)(186003)(26005)(6916009)(4326008)(316002)(54906003)(5660300002)(9686003)(66556008)(6506007)(66446008)(66476007)(7416002)(8676002)(66946007)(76116006)(8936002)(53546011)(55016002)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?NE1yWDQ5Mmw4UEYyeFk2Zk10YlRIQUMrWXhackIxRjRaSHJBRFFtNkRtQVJM?=
 =?utf-8?B?azM4M1BuMzNIRzUwZmJoM0REQUMxWEIrdFNhMmJ0SWdBNlJncC9vT0wrcXlV?=
 =?utf-8?B?RGlDcXF6Ylo1VTBzenVUdWJzbkxEenV1Wmo2Z01vVUZ6VTV4eHZla0JNNHZP?=
 =?utf-8?B?bkJqa3A2UC9KQmk4NzAzVTZxaVh6a056TUx0SzM3YVUxcGhXeHcxdU13REdp?=
 =?utf-8?B?RUR0OE1WYVZINHlack5LelI0RGNRelpncHgwUHcxNHRKOGhFbFpGUnJMOHFs?=
 =?utf-8?B?OHArK3M3SVcvQ2taRVhhdklCSm14RlFjZ0hubjVKbTRFaC82ekw2NlEwdzRs?=
 =?utf-8?B?SzFyS3dKbS9PRUpYVjNGSXUxd1FhVnBEOUZJREE5UVZud2lndWR6SGJFcVli?=
 =?utf-8?B?SUcyUk1qTkhSS3duRFpsM1ZnZHdZZXdGaDFSd1crNWc0QUk1U08wQzhidVhV?=
 =?utf-8?B?UUxrS1JMeU1seS9JTnVlS1grcEJ4Y3lSS2JuZlN0VGk1cCthRUV3VXk1am1B?=
 =?utf-8?B?akdpemMvSGVMTlBZb0FwS3JZeGltcmM3OVFsYkk0UlljUkIyWkVGbEkyWEdR?=
 =?utf-8?B?UjN4TW5qb1h1UkdmdXh0bUhLVVJrRUp5aDM0bGlRYUpHbVpCL1ZOZUdBOWRW?=
 =?utf-8?B?aUdiTWpKRDlxc2RXdWh0TGRDZUpPaTZsbEx1d2R1aDRUVXJwaHUzSkRvNWRM?=
 =?utf-8?B?VDcwL01xSEkwK3N0UFZ2N1RVVzQrK3ZaeUxvVER5d0xOLzRDM0gyWFlNTXhM?=
 =?utf-8?B?bExRY1cyb1E1Y25zV0tBblJ3empXcnpvcWg4QWdNL2EzNGNKVUkvQ1NOSm1U?=
 =?utf-8?B?YWxoTFBJMllUYjN0MzB3VzU0eUIxSCt5alhma0k3dmJqVXdsVnpQUW9UTTVa?=
 =?utf-8?B?a0h6SFFXYkNkTng4U1R1QUhMNlRVVWNCVkRhN1RkWnBOcWtqS281WDBuNUZN?=
 =?utf-8?B?ZUdZdWRDWGwzL01MaG5MeHFEZ2NPcU14V1hadEUzMWs1UlNLTHFUSXBjMjBm?=
 =?utf-8?B?cGxsbXlmS1lJTis1a1pXM2Zna1UwRW94eXlTUGFENlp0ZDh0NEt5ckoycGVH?=
 =?utf-8?B?dVRZb0s5c2t0V1VPRzZHS01rc045QWw3VkJ5amJTSGl0UDhNWnBnOU5rRU1N?=
 =?utf-8?B?ak1idld2QlBhaDlEMklReGh3UjBXK01iQUpSUWIwSnNHSGFPd0FvOCtRTFhV?=
 =?utf-8?B?T0gvYmFXL1hTWnRHMTZVK1BESlU1QXgxUVJJSWcyNkx6YjFzSzVLZTQxbXpx?=
 =?utf-8?B?THZwTVFERnR6ZGt5SGJiL1hRdTJzTkNRVllhRkkwcm8xVDd0L0p3OWYwMU5a?=
 =?utf-8?B?UzlBeXNteW5pZk1wN1RMaE1iRStRaVNaKzFVZW10QWZNdlk2cUx1UGFJV3pt?=
 =?utf-8?B?NXVzamM1WC93ZXlWNGEwaURjbGNQd0N3UEpNdjRIVWYyOHplRXFRU041YjRO?=
 =?utf-8?B?WlBiRm5Fc1AxU0NMUnc4ZzdNdk4vNDhuckxmYjV0QTdmKzByZTBqbzNLRFFU?=
 =?utf-8?B?YUprTDVEMEJOSTYrZmJHbW9uS3BKZm9YdHF3RXpGOEV6UjJ1Zlp4Ung4eXVW?=
 =?utf-8?B?anF0TmpBT1JQaW5aU3E3bnRaSFRNcW9WMkNtMjFnZDd5YnlWbTQ4dDcyT0ZO?=
 =?utf-8?B?d1FDUlFnYUoyMnI0ZUxBdGpkMzNMQkVtQTUxdHcwRitRT2w4MEhUQW9zdHNk?=
 =?utf-8?B?NjU4bkg3eE5lblRIVjk4WHZSM3J5c3dNamZTRno2N2xRYTArS3V0ei9XRDhh?=
 =?utf-8?Q?UvahcEbRFzhFwFkdVT5pXC42TvjLfDA6lCOUUY4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB3917.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f681edb8-8e17-45f4-5b3d-08d8ef76ebb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 10:15:30.9184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S2p3GsuCuHXEgWPSc0sDHrr206puZ0lzS/E0vGRKh8y7/b6g4qrJIhgIfh+GZZ/5CPZZ+FeP/3fA7fpEVvAdwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3917
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgTWFy
Y2ggMjUsIDIwMjEgMjoyNyBQTQ0KPiBUbzogU2FpIEtyaXNobmEgUG90dGh1cmkgPGxha3NobWlz
QHhpbGlueC5jb20+DQo+IENjOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFp
bC5jb20+OyBSb2IgSGVycmluZw0KPiA8cm9iaCtkdEBrZXJuZWwub3JnPjsgTWljaGFsIFNpbWVr
IDxtaWNoYWxzQHhpbGlueC5jb20+OyBHcmVnIEtyb2FoLQ0KPiBIYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz47IGxpbnV4LWFybSBNYWlsaW5nIExpc3QgPGxpbnV4LWFybS0NCj4g
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+OyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0IDxs
aW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IGRldmljZXRyZWUgPGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnPjsgb3Blbg0KPiBsaXN0OkdQSU8gU1VCU1lTVEVNIDxsaW51eC1ncGlv
QHZnZXIua2VybmVsLm9yZz47IGdpdCA8Z2l0QHhpbGlueC5jb20+Ow0KPiBzYWlrcmlzaG5hMTI0
NjhAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMy8zXSBwaW5jdHJsOiBBZGQg
WGlsaW54IFp5bnFNUCBwaW5jdHJsIGRyaXZlciBzdXBwb3J0DQo+IA0KPiBPbiBNb24sIE1hciAy
MiwgMjAyMSBhdCA0OjI1IFBNIFNhaSBLcmlzaG5hIFBvdHRodXJpDQo+IDxsYWtzaG1pc0B4aWxp
bnguY29tPiB3cm90ZToNCj4gPiBbQW5keV0NCj4gDQo+ID4gPiA+ID4gPiArICAgICAgIFBJTl9D
T05GSUdfSU9TVEFOREFSRCA9IFBJTl9DT05GSUdfRU5EICsgMSwgfTsNCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IEknbSBsb3N0IGhlcmUuIFdoYXQgaXMgSU8gc3RhbmRhcmQgZXhhY3RseT8gV2h5IGl0
IGNhbid0IGJlIGluDQo+ID4gPiA+ID4gZ2VuZXJpYyBoZWFkZXJzPw0KPiA+ID4gPiBJdCByZXBy
ZXNlbnRzIExWQ01PUyAzLjMgdm9sdHMvIExWQ01PUyAxLjggdm9sdHMuDQo+ID4gPiA+IFNpbmNl
IHRoaXMgaXMgc3BlY2lmaWMgdG8gWGlsaW54IFp5bnFNUCBwbGF0Zm9ybSwgY29uc2lkZXJlZCB0
byBiZQ0KPiA+ID4gPiBhZGRlZCBpbiB0aGUgZHJpdmVyIGZpbGUuDQo+ID4gPg0KPiA+ID4gU28s
IHdoeSBjYW4ndCB3ZSBjcmVhdGUgYSBjb3VwbGUgb2YgYml0cyB0byByZXByZXNlbnQgdGhpcyB2
b2x0YWdlcw0KPiA+ID4gaW4gdGhlIGdlbmVyaWMgaGVhZGVyIGFuZCBnYWluIHVzYWJpbGl0eSBm
b3Igb3RoZXJzIGFzIHdlbGw/DQo+ID4NCj4gPiBJIHNlZSBzb21lIGRyaXZlcnMgYXJlIG1haW50
YWluaW5nIHRoZSBjb25maWd1cmF0aW9uIGxpc3QgaW4gdGhlDQo+ID4gZHJpdmVyIGZpbGUsIGlm
IHRoZSBjb25maWd1cmF0aW9uIGlzIHNwZWNpZmljIHRvIHRoZSBkcml2ZXIuDQo+ID4NCj4gPiBX
ZSBjYW4gbW92ZSB0aGlzIHRvIGdlbmVyaWMgaGVhZGVyIGlmIGl0IGlzIHVzZWQgYnkgb3RoZXJz
IGFzIHdlbGwuDQo+ID4gT2ssIHdpbGwgd2FpdCBmb3IgTGludXMgdG8gY29tbWVudC4NCj4gPiA+
DQo+ID4gPiBMaW51cz8NCj4gDQo+IFdoaWxlIGl0IGlzIGZpbmUgdG8gYWRkIGN1c3RvbSBwaW4g
Y29uZmlnIG9wdGlvbnMgdG8gcGluIGNvbnRyb2xsZXJzIGZvcg0KPiBob3BlbGVzc2x5IGlkaW9t
YXRpYyBzdHVmZiwgdGhpcyBkb2VzIGxvb2sgbGlrZSBpdCBzaG91bGQgYmUgdXNpbmcNCj4gUElO
X0NPTkZJR19QT1dFUl9TT1VSQ0Ugd2l0aCB0aGUgdm9sdGFnZSByYWlsIGFzIHBhcmFtZXRlciwg
c2VlDQo+IGluY2x1ZGUvbGludXgvcGluY3RybC9waW5jb25mLWdlbmVyaWMuaA0KVGhhbmtzLg0K
SSB3aWxsIHVwZGF0ZSB0aGUgZHJpdmVyIHRvIHVzZSAncG93ZXItc291cmNlJyBvcHRpb24uDQoN
ClJlZ2FyZHMNClNhaSBLcmlzaG5hDQo+IA0KPiBJZiB5b3UncmUgbm90IHVzaW5nIHRoYXQgdGhl
biB0ZWxsIHVzIHdoeS4NCj4gDQo+IFlvdXJzLA0KPiBMaW51cyBXYWxsZWlqDQo=
