Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8300A36D1A5
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Apr 2021 07:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229464AbhD1Feg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Apr 2021 01:34:36 -0400
Received: from mail-dm6nam11on2046.outbound.protection.outlook.com ([40.107.223.46]:4321
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229437AbhD1Fef (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 28 Apr 2021 01:34:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mivegehPyTWyczVs6rwceSn14x6YBYSRgY3aiWk2E7cMncDIbSPIPKEqbb7GcQfdwf4wc1DWQvP9whVCvY0zfbotpRpTZoLfE0gGA3UOomottF1zZZ4luFwPnZ6l4UfzBJCbcAwXyKvzNFjLkOC7n/DJB4A1AKqL+lcNiH5PXamCvUPg2Ye3PzG5AQ3kledONkhRh3Sdx66Ut7b8pq3MbW5d9DLdBzvuiFsj0uC4vJO4A6yWgMe9ELoAXYQ0mu/eK2QJlCcPdlbeJZ7naGwnNjDXTvHE2NnE3NJHkhPkL1SM5Vc7KZb1mmREP9npk/vto1hF13ODVbNIhRG3HISrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP0LJTUx+HAt1n/KPCCbJWe3c1J/gkPDtgAZzaIQWAo=;
 b=NpbxQ+gHhWQOMo1D5H+kvXnP6KY81w34zboPgS8rQSYYL4izUJ2U5AGDORPIfr/JstVsNIVXJlSkx9T3j4ZYoNvtBsYAQtRiLhE7dSp+bbERZ5lLzJ7EPqtgKN1kpgM5P9MDc7un/W1PfmapUGSdqbnjGnGDtNvmUJrOjasT4gPVV1thsVEWQ+a24ItddTFKCnvEN910gAHivu7+eGieJ3ifG0doPD5DRzMT8VNT06m8qQYdUaOoP2ZnrA+Gn+VpyakhviMhQMCoMSeJBrdzaR5LTw1eqmYdh68JtEk8+QtQpEHszk7LcAHGnMSSbqOmYOV1BQJyBDgorbwd3OTgLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP0LJTUx+HAt1n/KPCCbJWe3c1J/gkPDtgAZzaIQWAo=;
 b=fFINx/k8Q+VpRCMEu3RI31T0L4Ilz/heDWiGd30rO2OjCW0598VbnaldiFgvqOcu9FAN2pfmAan58R7R0BgJopymjZvrcKtgchicS6tP5ZPKojgcmOirI/pSsvxv/aUGfnRjXl2eCstJO23DFy8BxYxhUB11cYCqOW1FGxfS2uo=
Received: from DM5PR02MB3877.namprd02.prod.outlook.com (2603:10b6:4:b9::34) by
 DM5PR02MB2185.namprd02.prod.outlook.com (2603:10b6:3:53::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Wed, 28 Apr 2021 05:33:47 +0000
Received: from DM5PR02MB3877.namprd02.prod.outlook.com
 ([fe80::943b:e0c1:3e2b:4327]) by DM5PR02MB3877.namprd02.prod.outlook.com
 ([fe80::943b:e0c1:3e2b:4327%3]) with mapi id 15.20.4042.024; Wed, 28 Apr 2021
 05:33:47 +0000
From:   Sai Krishna Potthuri <lakshmis@xilinx.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michals@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>,
        "saikrishna12468@gmail.com" <saikrishna12468@gmail.com>
Subject: RE: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Topic: [PATCH v6 3/3] pinctrl: Add Xilinx ZynqMP pinctrl driver support
Thread-Index: AQHXN1HnJ1dD/z2380CasZDNOXc+DarCQxoAgAQix4CAAHWwAIAAH53g
Date:   Wed, 28 Apr 2021 05:33:46 +0000
Message-ID: <DM5PR02MB387726AB4144F0DB28105007BD409@DM5PR02MB3877.namprd02.prod.outlook.com>
References: <1619080202-31924-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1619080202-31924-4-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <CAHp75VfCbbnN-TBJiYFb=6Rhf30jA-Hz1p1UORsubF7UG6-ATw@mail.gmail.com>
 <DM5PR02MB3877B234F85F3B4887DF3A95BD429@DM5PR02MB3877.namprd02.prod.outlook.com>
 <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
In-Reply-To: <CAHp75VfugGqLNU8LKJ_K3dPr=-eh6LHx75eV=33jH9OnryBoGA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b646e9f9-4690-4aaf-1a2d-08d90a07320a
x-ms-traffictypediagnostic: DM5PR02MB2185:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR02MB2185E55D573B5DF008AAB53CBD409@DM5PR02MB2185.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPG66ZrRLpVo8CssdnLLNpsRcho3EFJjMROjN0l7CP288dWiUj4akw7GomCZ0f+HFpc6rWcLkvkawm9HuxbEPOyE6nOFNZHZs75ZjJ0Jk3HtHTLbjkazqkz9g49SzfLYCaVtGUnWCSaZgHQNr3nGQZlGOKTEEYAnYmJlDUXG0aCAdFUDTvyGzxHG3wjvdIy8bMA43KAtlHk5IUti5iGOo73JX50e5PNJ3NnH0/hIroimwenJeFrtIHtIoXguKeAWIoL2gMi2hUc6vyvZGogSXPNTtqe6ENI5bEwNTjL328N+TtoP1/UlKkiNXaMEkTTOd4DPTYp19iemqF7yXDCk3ctvFyPnn4Koh+20KotbKJMLXjMtPGjobXRksCAqI8LImL4zB05q+xFsOqy2nGEy+j6x3nrRXQDTFHrLkW++HHWct1tN2yuKio0K0mbOV04Y8eVKRGM+OGx4XiczbnTmGy4ZQauua3zjuSFcK+f6mTdf8cx6Cl3KYj36aP1FhLJTf2h6kn/s0eSW7OeJPjniA7K5uzf/QbMW/sEc4wu+5ts0o2FDx840KRLQE4bMWWwcrzxqJUHEm5VkB787gcNVKC4WiL0m/8mOsA+r4UzTskk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR02MB3877.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(71200400001)(6916009)(2906002)(8936002)(66476007)(66946007)(9686003)(33656002)(38100700002)(316002)(66446008)(4326008)(53546011)(54906003)(66556008)(64756008)(7416002)(7696005)(5660300002)(478600001)(76116006)(186003)(83380400001)(26005)(122000001)(8676002)(6506007)(52536014)(55016002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?eXRpR3FyelphU0xxbGRJNi8xUTFaaFVBNkpUSkRsZmwxajMxZWdxNmZHeDFS?=
 =?utf-8?B?ZURoajUzTDR3Q09wNzBrUnRHQ0g1UVdpUG9jOVRGeCsxNXJVU2Z1V3hDTVBC?=
 =?utf-8?B?MnRkWEM3L2JxemhId3ZyMXlqL3lLRFpZcVcxaDR1bjVZWWlXbjFOU1A3YmI1?=
 =?utf-8?B?alJKMDUvRmZCS1hnTXZobEJ0RCtTTzRtUnVvRW9SWXdscW5qMVpIcXM5WXgw?=
 =?utf-8?B?cmdhSDJXQ1VJaXhPcUpQK2VTNHhDUlAvUHVVcmNFcjViWlNabFNjcExzQkFa?=
 =?utf-8?B?azFLOUdsci9KOUFEYnJrUTNpQ1ZkMUhrTzJTbDc4NC9wdGpKSlUra0ZkQjVS?=
 =?utf-8?B?cDdvWG1DTjVDM2ZlUms4R1p5bkdKUkFjejlHZ1J2YUdLK2ZyeEtiK0dXakxx?=
 =?utf-8?B?RThSeXlJVXhtQnJ4NUwwczBhNnpaNFBjVk9QcDJqSjBOTExJNDFZQnMyVEpP?=
 =?utf-8?B?eHF4Y0N6RUQ3YnZtRFhuemRlWUNYbTdRNDV5M1RDWnBZamdITG50cmZrN0lQ?=
 =?utf-8?B?WlBmSzRaR2pkcWc4RWtRZytKa3J1WEZWMkJzYmdmVFRJWjNJUHNTRXlnK2hB?=
 =?utf-8?B?eUh5cWYrOEVYV04xWDErZXViMHhobWJSRFRQODJ6QWJzVjJNSzUzTHEvUDhw?=
 =?utf-8?B?cldxaEVkajVORTJFdTdmSXhPUVpXQnhUZklkTUtxT1JRcVVRQ3h3N1UwcWp5?=
 =?utf-8?B?R0tDVk9yaTcxK1JZNkpQWjVXYTZPUGFDU1Vrc2JMRHBKNWtCcWlPK1pmK0sy?=
 =?utf-8?B?WmNWV0l0dVRsa0Y2S3NicFNUN3JYYVZVVGNGNHZrSFZjSXFGNzY2TThZT2lz?=
 =?utf-8?B?Mk5rNDVZZDVxU1BiY3QxRk03Z2pscWlNQmM2QnRCUjBNV1BNUEV4eWxUSzVC?=
 =?utf-8?B?L0FrUnVJTzZVaW12S2drZkxFYnJlcXJSakwzYk51TjZLcEpLeE9ubURFeXND?=
 =?utf-8?B?dW56WnRkL0V3bWJXaWlUTU9hZi9KUk1DbEc3VHFhOVgzYU9sbTFrNDByc0gr?=
 =?utf-8?B?THFaWUtQUnA3bEg5RzUzWDJHOFYxNXRwL0JJdWRSSWtJMVp1RjM4d1hNUHBQ?=
 =?utf-8?B?V1JoTklNQ3J1Q2pNU2hUV1ZoSmFma3lSYitXS3FoOGpmclhEeFRmMWM5K2Fi?=
 =?utf-8?B?Z3pBaDR4T0k4RHQwcVN1aVV4amtENXBoSnFrNFdpTENBc3F3L3ZVcC90ZHVR?=
 =?utf-8?B?aExBOHVOZkJNK1gzM0ZOWFczNXBGRERTRDY5TDN2VUdoUEsrWlYyR1dqNFln?=
 =?utf-8?B?NmZUNDN0NEFGRU9KYS83cEkvUEtHOXNxWEdNMXpEMWJIQVM3SENHQms0T0Rp?=
 =?utf-8?B?U0l2Vi9vVjB2ZVJFTmZkUmJ3NW5yblkrbmhBNlhSaW1HZVk5SnJEMU51L3ov?=
 =?utf-8?B?Z2RBQkcwbzZ5ZEgwcDVmL1hLeGJlOVNSSVhMM3BWT216TCtpalQxK2lmMVNF?=
 =?utf-8?B?QzBWa3NRTkthWlpkSkZUeTZGNnkvbkVFN1E1eFZiL1NUNUIrS3ZkbXNlR1Fw?=
 =?utf-8?B?dXZqSWFiaHhYa1RNUjkvV2U0UTFNZDZ6Zzl3ajRCRytxOHpacTIvL2RSdWJu?=
 =?utf-8?B?bnpLckptRHI0UjVxVkZPYXhpendvNWRzREFBRkgxMTJaR21OcmpaUzBBeGhx?=
 =?utf-8?B?c3FKZDFZL1creE1aVGtLNzNqL0VyamlYdHJzMTR0WEh6SVRwYXd6dDhvYWpl?=
 =?utf-8?B?bnE4a1VkK1ZQdlU3NzBldlJ3MFZ4Q1gzaDJiZm9iN2ZqbWdCQ1N5SWg0S25V?=
 =?utf-8?Q?XF9MxET8434Pt5vPWN2y9p1zYkuSUDezM1s7iud?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR02MB3877.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b646e9f9-4690-4aaf-1a2d-08d90a07320a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 05:33:46.8278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdWx4tIT8aR9JcUsX89eOO/WRpNwW3GDV6SMdZ0e7XmUlVhDGJgFz2d2Q5LpKHv4jfbFuKtKyF0eR6Lr4BuYFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2185
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgQW5keSBTaGV2Y2hlbmtvLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEFuZHkgU2hldmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj4gU2VudDog
TW9uZGF5LCBBcHJpbCAyNiwgMjAyMSA3OjM1IFBNDQo+IFRvOiBTYWkgS3Jpc2huYSBQb3R0aHVy
aSA8bGFrc2htaXNAeGlsaW54LmNvbT4NCj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz47IFJvYiBIZXJyaW5nDQo+IDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBNaWNo
YWwgU2ltZWsgPG1pY2hhbHNAeGlsaW54LmNvbT47IEdyZWcgS3JvYWgtDQo+IEhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgbGludXgtYXJtIE1haWxpbmcgTGlzdCA8bGludXgt
YXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5n
IExpc3QgPGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgZGV2aWNldHJlZSA8ZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc+OyBvcGVuDQo+IGxpc3Q6R1BJTyBTVUJTWVNURU0gPGxp
bnV4LWdwaW9Admdlci5rZXJuZWwub3JnPjsgZ2l0IDxnaXRAeGlsaW54LmNvbT47DQo+IHNhaWty
aXNobmExMjQ2OEBnbWFpbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiAzLzNdIHBpbmN0
cmw6IEFkZCBYaWxpbnggWnlucU1QIHBpbmN0cmwgZHJpdmVyIHN1cHBvcnQNCj4gDQo+IE9uIE1v
biwgQXByIDI2LCAyMDIxIGF0IDQ6MjAgUE0gU2FpIEtyaXNobmEgUG90dGh1cmkNCj4gPGxha3No
bWlzQHhpbGlueC5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5
LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiA+ID4gU2VudDogRnJpZGF5LCBBcHJpbCAyMywgMjAy
MSA5OjI0IFBNDQo+ID4gPiBPbiBUaHUsIEFwciAyMiwgMjAyMSBhdCAxMTozMSBBTSBTYWkgS3Jp
c2huYSBQb3R0aHVyaQ0KPiA+ID4gPGxha3NobWkuc2FpLmtyaXNobmEucG90dGh1cmlAeGlsaW54
LmNvbT4gd3JvdGU6DQo+IA0KPiAuLi4NCj4gDQo+ID4gPiA+ICtjb25maWcgUElOQ1RSTF9aWU5R
TVANCj4gPiA+ID4gKyAgICAgICB0cmlzdGF0ZSAiUGluY3RybCBkcml2ZXIgZm9yIFhpbGlueCBa
eW5xTVAiDQo+ID4gPiA+ICsgICAgICAgZGVwZW5kcyBvbiBaWU5RTVBfRklSTVdBUkUNCj4gPiA+
ID4gKyAgICAgICBzZWxlY3QgUElOTVVYDQo+ID4gPiA+ICsgICAgICAgc2VsZWN0IEdFTkVSSUNf
UElOQ09ORg0KPiA+ID4gPiArICAgICAgIGRlZmF1bHQgWllOUU1QX0ZJUk1XQVJFDQo+ID4gPiA+
ICsgICAgICAgaGVscA0KPiA+ID4gPiArICAgICAgICAgVGhpcyBzZWxlY3RzIHRoZSBwaW5jdHJs
IGRyaXZlciBmb3IgWGlsaW54IFp5bnFNUCBwbGF0Zm9ybS4NCj4gPiA+ID4gKyAgICAgICAgIFRo
aXMgZHJpdmVyIHdpbGwgcXVlcnkgdGhlIHBpbiBpbmZvcm1hdGlvbiBmcm9tIHRoZSBmaXJtd2Fy
ZQ0KPiA+ID4gPiArICAgICAgICAgYW5kIGFsbG93IGNvbmZpZ3VyaW5nIHRoZSBwaW5zLg0KPiA+
ID4gPiArICAgICAgICAgQ29uZmlndXJhdGlvbiBjYW4gaW5jbHVkZSB0aGUgbXV4IGZ1bmN0aW9u
IHRvIHNlbGVjdCBvbiB0aG9zZQ0KPiA+ID4gPiArICAgICAgICAgcGluKHMpL2dyb3VwKHMpLCBh
bmQgdmFyaW91cyBwaW4gY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzDQo+ID4gPiA+ICsgICAgICAg
ICBzdWNoIGFzIHB1bGwtdXAsIHNsZXcgcmF0ZSwgZXRjLg0KPiA+ID4NCj4gPiA+IE1pc3NlZCBt
b2R1bGUgbmFtZS4NCj4gPiBJcyB0aGlzIChtb2R1bGUgbmFtZSkgYSBjb25maWd1cmF0aW9uIG9w
dGlvbiBpbiBLY29uZmlnPw0KPiANCj4gSXQncyBhIHRleHQgaW4gYSBmcmVlIGZvcm0gdGhhdCBz
aGVkcyBsaWdodCBvbiBob3cgdGhlIG1vZHVsZSB3aWxsIGJlDQo+IG5hbWVkIGluIGNhc2UgdGhl
IHVzZXIgd2lsbCBjaG9vc2UgIm0iLg0KT2ssIEkgd2lsbCBhZGQuDQo+IA0KPiAuLi4NCj4gDQo+
ID4gPiA+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjAgWGlsaW54LCBJbmMuDQo+ID4gPg0KPiA+ID4g
MjAyMT8NCj4gPiBDb3VwbGUgb2YgdmVyc2lvbnMgZm9yIHRoaXMgcGF0Y2ggc2VyaWVzIHNlbnQg
aW4gMjAyMCwgaGVuY2UgbWFpbnRhaW5pbmcNCj4gPiB0aGUgc2FtZS4NCj4gPiBJcyBpdCBsaWtl
IHdlIG1haW50YWluIHRoZSB5ZWFyIHdoZW4gdGhpcyBwYXRjaCBzZXJpZXMgaXMgYXBwbGllZCwg
d2hpY2ggaXMNCj4gPiAyMDIxPw0KPiANCj4gMjAyMCwgMjAyMSBzb3VuZHMgb2theSBhcyB3ZWxs
Lg0KT2ssIEkgd2lsbCB1cGRhdGUuDQo+IA0KPiAuLi4NCj4gDQo+ID4gPiA+ICsgICAgICAgaWYg
KHBpbiA+PSB6eW5xbXBfZGVzYy5ucGlucykNCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRU9QTk9UU1VQUDsNCj4gPiA+DQo+ID4gPiBJcyBpdCBwb3NzaWJsZT8NCj4gPiBUaGlzIGlz
IGEgc2FmZSBjaGVjay4NCj4gDQo+IEkuby53LiBkZWFkIGNvZGUsIHJpZ2h0Pw0KPiANCj4gPiBQ
aW4gaW5mb3JtYXRpb24gd2lsbCBnZXQgZnJvbSBkdCBmaWxlcy9YaWxpbnggZmlybXdhcmUgKHF1
ZXJ5IHBpbiBpbmZvcm1hdGlvbg0KPiA+IGZvciBhIGdyb3VwKS91c2VyIGFwcGxpY2F0aW9uIGFu
ZCB0aGVyZSBhcmUgY2hhbmNlcyBvZiBnZXR0aW5nIHdyb25nIHBpbi4NCj4gDQo+IEknbSBub3Qg
c3VyZSBJIHVuZGVyc3RhbmQgdGhpcy4gSG93IGNvbWVzIHRoYXQgcGluIGNvbnRyb2wgY29yZSB3
aWxsDQo+IGFzayBmb3IgYSBwaW4gaGlnaGVyIHRoYW4gbnBpbnM/DQpPaywgSSBnb3QgeW91ciBw
b2ludC4NCkl0IGlzIGR1cGxpY2F0ZSBhbmQgd2lsbCByZW1vdmUgdGhpcyBjaGVjay4NCj4gDQo+
IC4uLg0KPiANCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHJldCA9IHp5bnFtcF9wbV9waW5jdHJs
X2dldF9jb25maWcocGluLCBwYXJhbSwgJmFyZyk7DQo+ID4gPiA+ICsgICAgICAgICAgICAgICBp
ZiAoYXJnICE9IFBNX1BJTkNUUkxfQklBU19QVUxMX1VQKQ0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiA+DQo+ID4gPiBFcnJvciBjb2RlIGJlaW5n
IHNoYWRvd2VkLiBJbnN0ZWFkIGNoZWNrIGl0IGhlcmUgcHJvcGVybHkuDQo+IA0KPiA+IEFyZSB5
b3UgbWVudGlvbmluZyB0aGUgY2FzZSB3aGVyZSByZXQgaXMgYWxzbyBhIG5vbi16ZXJvPw0KPiA+
IElmIHllcywgdGhlbiBJIHdpbGwgdXBkYXRlIHRoaXMgY2hlY2sgdG8NCj4gPiBpZiAoIXJldCAm
JiBhcmcgIT0gUE1fUElOQ1RSTF9CSUFTX1BVTExfVVApDQo+ID4gICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4gDQo+IE5vLCB0aGlzIGlzIHdyb25nIGluIHRoZSBzYW1lIHdheS4NCj4gDQo+ID4g
cmV0IG5vbi16ZXJvIGNhc2UsIHdlIGFyZSBoYW5kbGluZyBhdCB0aGUgZW5kIG9mIHN3aXRjaCBj
YXNlLg0KPiANCj4gSSBtZWFudCB0aGF0IHlvdSBuZWVkIHRvIHBhc3MgdGhlIHJlYWwgcmV0dXJu
IGNvZGUgdG8gdGhlICh1cHBlcikgY2FsbGVyLg0KSGVyZSB3ZSBhcmUgY2hlY2tpbmcgZm9yIHZh
bGlkIGFyZ3VtZW50IGFuZCBub3QgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgQVBJLg0KSWYgdGhl
IHJlYWQgdmFsdWUoYXJndW1lbnQpIGlzIG5vdCB2YWxpZCBhbmQgcmV0dXJuIHZhbHVlIG9mIHRo
ZSBBUEkgaXMNCnplcm8gKFNVQ0NFU1MpIHRoZW4gZnJhbWV3b3JrIGV4cGVjdHMgZHJpdmVyIHRv
IGJlIHJldHVybmVkIHdpdGgNCictRUlOVkFMJyBhbmQgaXQgaXMgYSBsZWdhbCBlcnJvciBjb2Rl
IGluIHRoaXMgY2FzZS4NCj4gRGl0dG8gZm9yIGFsbCBvdGhlciBjYXNlcyAobWVudGlvbmVkIGFu
ZCBub3QgbWVudGlvbmVkKQ0KPiANCj4gLi4uDQo+IA0KPiA+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSAtRU9QTk9UU1VQUDsNCj4gPiA+DQo+ID4gPiBJc24ndCBpdCBFTk9UU1VQ
IGZvciBhbGwgY2FzZXMgaGVyZT8NCj4gPiBHaXZpbmcgJ09wZXJhdGlvbiBOb3QgU3VwcG9ydGVk
IChFT1BOT1RTVVBQKScgZXJyb3IsIHdoZW4NCj4gPiBkcml2ZXIgZ2V0cyBhIHJlcXVlc3QgZm9y
IHVuc3VwcG9ydGVkIHBpbiBvciBjb25maWd1cmF0aW9uLg0KPiA+IENhbiB5b3UgcGxlYXNlIGVs
YWJvcmF0ZSB5b3VyIHF1ZXN0aW9uIGlmIEkgZGlkbid0IGFuc3dlciBwcm9wZXJseS4NCj4gDQo+
IFRoZSBwaW4gY29udHJvbCBzdWJzeXN0ZW0gYWxvbmcgd2l0aCB0aGUgR1BJTyBsaWJyYXJ5IGFy
ZSB1c2luZw0KPiAtRU5PVFNVUFAgZXJyb3IgY29kZSBmb3IgaW50ZXJuYWwgb3BlcmF0aW9ucy4N
Cj4gRU9QTk9UU1VQUCBpcyB0aGUgb25lIHRoYXQgc2hvdWxkIGJlIHJldHVybmVkIHRvIHVzZXIg
c3BhY2UuIElzIGl0IHRoZQ0KPiBjYXNlIGhlcmU/DQpHb3QgeW91ciBwb2ludCwgSSB3aWxsIHVw
ZGF0ZSBlcnJvciBjb2RlIHdpdGggRU5PVFNVUFAuDQo+IA0KPiAuLi4NCj4gDQo+ID4gPiA+ICt9
Ow0KPiA+ID4NCj4gPiA+ID4gKw0KPiA+ID4NCj4gPiA+IERpdHRvLg0KPiA+IEkgc2VlIHNvbWUg
ZHJpdmVycyBhcmUgbWFpbnRhaW5pbmcgdGhlIGV4dHJhIGxpbmUgaW4gYWJvdmUgdHdvIGNhc2Vz
Lg0KPiA+IFdlIHNob3VsZG4ndCBtYWludGFpbiBleHRyYSBsaW5lIGFmdGVyIHN0cnVjdCBkZWNs
YXJhdGlvbj8NCj4gDQo+IFdoYXQncyB0aGUgcG9pbnQgdG8gYWRkIG1vcmUgYmxhbmsgbGluZXMg
d2hlcmUgdGhleSB3b24ndCBhZGQgYW55IHZhbHVlPw0KSSB3aWxsIHJlbW92ZS4NCg0KUmVnYXJk
cw0KU2FpIEtyaXNobmENCj4gDQo+ID4gPiA+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHp5bnFt
cF9waW5jdHJsX2RyaXZlcik7DQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5k
eSBTaGV2Y2hlbmtvDQo=
