Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64CD7440D7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jun 2023 19:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbjF3RHN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jun 2023 13:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232836AbjF3RGz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jun 2023 13:06:55 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43E81420C
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jun 2023 10:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYuenfabywesid1bk5jcYHDZC7TIM8Gh2WtnidHDLhJv0aE4YoCwiPhcnLvy+saBJf6atv8DBMKqiOJHq8JO6nCwB78RpbTO+uwH1azSwJd5zGHZUwFiP+l3ABkA4AjGIWMy2pIuTzKgH9VkQjG9AIB9DtQ4U0zo2LJMYel5hO30PhK92kMG/6Q+S8YlNEzNUutGj2w/uz8hrQAR5bqHE5lRfccKB6zsyJh5KVIoEr1jNEpPLBBWfFBBVLBo0soHMjR26cubVhUAsOzg5alIk/K+qpRgezS8Z+o6eqMkPAXux8Ifknlg+r1hQSUsYsGU/hmmIzSaj+o/wEFh5cl3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hb3I1HFe9Fodgh576BvktZYRxNLIKxvQdKpJInBttgY=;
 b=H+87yHQMgwz1/SzvE605jkZa7NxuNWiXMYYlpfR4Iorop+s5+oa0AOispqHHpyBShv+FGOxM0PzUUD/dYBsX2UkZHv/mWdS/ZfdCxhez6eL80SwgHCz1Ph8GbrtJgrMqD8QXXdXZ+lMVtpAEnFr9T7y+TKIfs7dgX7wkafJ6KPj+D91t4FlmC5Lcgewm2u9Dolreb3uVC2YvwfLAwJBio104CeXP9yeBVmo6rnzItVI0GlQYEB5kq0Xa4xD9Gy6PIy7/l96Vh1wHLPGWqwPYy+rj9U6XOWDHFs5QgtkU7ky7LyRhKVnN0GmePnngcob9SDKmgDXLm1VEo+/flcashg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hb3I1HFe9Fodgh576BvktZYRxNLIKxvQdKpJInBttgY=;
 b=DioXofAeULWR1ouRdd9X8Dd4k6LYbrusDlKpxPudgZpsXUap5gmTP//DS7hESMgUCfFu1sxj2l6KIfcl4rZnI1WP0qC+e45AMgdNbrmGQj0iNekETgvEUz2cGMewIRZSWdotcmTU+AFVz+g5OOUExaKpuT1tQBkbsqFXjLul+II=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 17:01:11 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::67c5:d818:6a60:7e38%7]) with mapi id 15.20.6521.024; Fri, 30 Jun 2023
 17:01:10 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH] gpio: mxc: add runtime pm support
Thread-Topic: [EXT] Re: [PATCH] gpio: mxc: add runtime pm support
Thread-Index: AQHZqr6o8MWwjoMSpUSTvlVF1XuiyK+jEnGAgAB5K0A=
Date:   Fri, 30 Jun 2023 17:01:10 +0000
Message-ID: <PAXPR04MB91851FA4382AA267E3C1849A892AA@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230629191903.2423243-1-shenwei.wang@nxp.com>
 <CAHp75Vc5JFrh1HqYQca9BcYALQfVD6A-kHgmc5OpwtvcGC4beA@mail.gmail.com>
In-Reply-To: <CAHp75Vc5JFrh1HqYQca9BcYALQfVD6A-kHgmc5OpwtvcGC4beA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AS8PR04MB8500:EE_
x-ms-office365-filtering-correlation-id: 42397fde-d986-4604-2900-08db798b9aac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3bmxvWk9LEZGs3iwzY61KF7NmuX0DInFTbBDrz0DwFJdcbBdUJ2KCxweIRBSGAm2l29h4yz/CRrNzgvBIwZWZx3R7x25Mztdsool3fOFuUuiTUgPwwHSf7Mdjekb6f8Va/KLW7HV8cozhaIt4XeCL3FMguWgZAavooVPjxH+mC/e+kRaqmb9QkrICkmCiQIUkk5VGp7f/go4A5hosZYebJNQtnRiPS886EtZTG9pV80LyzKcsuaolHpzS4HdCgK4gnhW75Ik3pFdRbdAlfMoki56GRNogYaIV4yubWfu0jYag0o/1cVVcS3EiQBAgjlfRKG/w/ZYIZFdsM+pth0API6vT8s5TMyAMQJ94dlml6yluitcre6in46rDYEJKkXZCXWHhUEbeOVN+5d7EPG6em6cvmHMSZe6sHz2EnWJ6cCw6wsnzEb7NqmAExXKWSmypO7MiCOJ0lyRmepAihPcyYKth80niNaESqUxfydEWI+kJnQShNFam6YQfvmrVjTdY/AGL3r2AfcbOlr3U9y51N5mRBHziaCziMEru1wO0iufkEzV9TJfC1YwCeziaIpPzI2CeoP/k2i1eTDgN7kdng8MLr0NcBpHbm7B5v4AlKxpT+5G1zv7YV3oaUq+GM76
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(38100700002)(122000001)(38070700005)(186003)(6506007)(9686003)(53546011)(55016003)(83380400001)(26005)(52536014)(44832011)(41300700001)(5660300002)(33656002)(8936002)(8676002)(7696005)(2906002)(316002)(71200400001)(86362001)(76116006)(4326008)(6916009)(64756008)(478600001)(66556008)(66446008)(66476007)(66946007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFpkNmFzaEp4MVBtbXg5UURqY2tBcVdnZWd4YktiSlB3blNJSDl2WTllTlFw?=
 =?utf-8?B?NGRkZXVRcmFyMTJ3cVFjeTBPeitsT3dORUpPMEw1TnppeUY4eFkrNUdVSG8x?=
 =?utf-8?B?ZE9FeTRKZHFmWG1xZnZZYnMrKzlwbGZZQWlOVXdobFVNTmt4aVBwOGdCeDY1?=
 =?utf-8?B?ckFNbm0rc2dYL2UyVW5ONThtZ2d3NWJ3Um4wTk9Hd1NRSmFwNGZJVUFCZXND?=
 =?utf-8?B?b2g4U1JjeXA2U0lNUVc0eEp6ekZCTmE5Yzc0RXZ6NVU5SUpIU3l2b2JkUXIz?=
 =?utf-8?B?Z1dzODR6ZFB3QnpkamlIZnF2YlFXS05mUVluaWZIUUtvK2RUbEpJcDJiR0xm?=
 =?utf-8?B?N3VSZUROTWlFclRrU3A1Rzg4TUg5NjR3dldCcW5DUEJ5VVJXUjlqOFU2S1oy?=
 =?utf-8?B?NzcrSHl1RHpEQncvbDBMSmczN3k2THpFc1RLRkpiQlJnMmVhSmQ3U2k1anBk?=
 =?utf-8?B?bUtUR1lEWGtLNkJGOXl2a21HRElMeEd4YzgwUWFxZEtaQ2VFT1U3OG1ZcjBj?=
 =?utf-8?B?NlJnN1lOQVlaZ2ZPRnZ6L0U1aU83SWh0czFyNFc2alp0c0lqL0FzaUoyVGhY?=
 =?utf-8?B?WGJWZHZUbjJQVnI2azJJeWJBSWJYRnhmZjNRVjJFQjhIRkJobWpaeTRpVjlq?=
 =?utf-8?B?RWo3UThlV0p3TDhhMGEvbklaYithemM3dkxxVklYaWtwcUtqSTYvaFBzQ1Fp?=
 =?utf-8?B?QVVabVlnR1U4aVkyaC8vRm1maCtTTjN0VXpEZTVYNW1yRnFXR0RRZk9uNm5o?=
 =?utf-8?B?LzFBaFF5VVZYYThxMEFDU1M3NXRvZ0s3QjhkYitLZk5GNHVKV2FrNUNmbGNr?=
 =?utf-8?B?ZDlXZkFSL3JIZFJsUi9VNU5lOTdQUTlPSTZGek1EVGpSQm9rcEdLcTVNNXk2?=
 =?utf-8?B?VzdoMkRnR25jNGZValRnU2ZXa1YzL0NRRk1ZUHdMeFU0Z0RxR1BOeDBlbXJq?=
 =?utf-8?B?OHJsSE0vS3NsZFBJaXdlbmUvNzQvQ1FFZzZIVkRRTG5iM1pQZW5POXRiQ1Rj?=
 =?utf-8?B?emFDQ1lMd1NFZzllWjM3ak9VMWJqVG1pNG9BbHVScVdhbTJuWVd3bEdUZDJ4?=
 =?utf-8?B?Y0FYZmIyamUwdHdNb0tiVVNSbDRRV3M4NEpLZC9BekdjK3NKcWREeFU3bVJz?=
 =?utf-8?B?SVU2aW1KcHdDaFRkN2FqVWtnNUlLYnBJRUFKVDd6dUl1dkFOTjZRaEpJN2ty?=
 =?utf-8?B?bFo4MHgxK3RoWHk0cWVNOENMWnkzNkpTMmNZOFdVbC9HTU5xQ3NEd01GcWRw?=
 =?utf-8?B?UGdNd1ZVZVExWDJPUEFWQ3Q2MEU1ZjFDQnV4MjFMNHVDTWNsU0FMTnpkakJa?=
 =?utf-8?B?eTNJQlE1WVVwUE1CZEdaYjQ1bXpHV2IrNnJ4dmZyV253VWZPSnlqa3ptN0FE?=
 =?utf-8?B?cDRwMStyTUhpRk90aEJaMjV6RGpYS0xISXAxMW0xclNxZWhYZ2RUZ2xCTjJI?=
 =?utf-8?B?Z1hkb1kyUkxTSFZudjllM0wrQ0tzaWZWR0FaZ0R2dHZ2Zkg1Q1dodkhiVTBu?=
 =?utf-8?B?eDZzbjQxNnZBandIblh2b1QzM0Z1V3ZDQjAwd0tYeVo5RFZURUVOaTFRdEkw?=
 =?utf-8?B?SjhmYXAvckcySkRFbFRFR1dtNVlTOTBGZy9SNU1yaVVvVU9JWk1HMDA4THRi?=
 =?utf-8?B?NDNqeWROWCtlOEZOaVVwbUdMVW1ERjU1c3dFTytvOW5WUENDYWQySjA5eElE?=
 =?utf-8?B?RHhyck9keHZhWDN1bElaYmoySDRuZ3U3Tm0rV3VNK0ZzK2JhaU5yZk9PQWs5?=
 =?utf-8?B?cythN1N4bklvTHJZeERxSmVHaU9pOVU5Zkd1ZlVLRTRFeWpxTE1Ua3lLVk5i?=
 =?utf-8?B?TmNzZXBObzFiRjNYbGZmSENnbVcvQ0o5dGgvTW9ZUUZ5L0JpK1ZWa0xxTDYw?=
 =?utf-8?B?cHQyVGlEWnQ1TmRwdDlvK2NBV2Z1ZUlveG5WRXNtODFkbmJ1UU9Xc3M0SWdy?=
 =?utf-8?B?MXk2dHh2ODhKZWNleTlmRUVwK29nK0ZvczJMNWtIME1JY0ZHWGcveVVYM1o4?=
 =?utf-8?B?VzZFVjVSMVJickpTRzZwRk5RNmVGNzc5NlVvK1hNb0lLb0hBRGdVSVBtWXY4?=
 =?utf-8?B?WXNwTkhXZE5rTUQ1cmtJQjBCS0toWHViOERrbjRrV0hHMlByRFg4NFd4ZjB5?=
 =?utf-8?Q?xbHQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42397fde-d986-4604-2900-08db798b9aac
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 17:01:10.4874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhudbsJrnhWD8zO79+D0ZAkcgCntKHKbeOtVhA15S4qDTjE7yldn0aHe7LHwCsqH/tq+RIgbN8gukBcWNmJhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bmUgMzAsIDIw
MjMgNDoxOSBBTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4g
Q2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47IEJhcnRvc3ogR29s
YXN6ZXdza2kNCj4gPGJyZ2xAYmdkZXYucGw+OyBBbmR5IFNoZXZjaGVua28gPGFuZHlAa2VybmVs
Lm9yZz47IGxpbnV4LQ0KPiBncGlvQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRl
djsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogW0VYVF0gUmU6
IFtQQVRDSF0gZ3BpbzogbXhjOiBhZGQgcnVudGltZSBwbSBzdXBwb3J0DQo+ID4gK3N0YXRpYyBp
bnQgbXhjX2dwaW9fcmVxdWVzdChzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQN
Cj4gPiArb2Zmc2V0KSB7DQo+ID4gKyAgICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAg
IHJldCA9IGdwaW9jaGlwX2dlbmVyaWNfcmVxdWVzdChjaGlwLCBvZmZzZXQpOw0KPiA+ICsgICAg
ICAgaWYgKHJldCkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4g
KyAgICAgICByZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKGNoaXAtPnBhcmVudCk7DQo+IA0KPiBy
ZWZlcmVuY2UgY291bnQgZGlzYmFsYW5jZSBoZXJlLg0KDQpTZWVtcyB3ZSBzaG91bGRuJ3QgY2hl
Y2sgdGhlIHJldHVybiB2YWx1ZSBoZXJlIGFuZCBzaW1wbHkgcmV0dXJuIDAuDQpPciBzaG91bGQg
aXQgYmUgY2hhbmdlZCB0byAiIHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQiID8NCg0KPiANCj4g
PiArICAgICAgIHJldHVybiByZXQgPCAwID8gcmV0IDogMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiAr
c3RhdGljIHZvaWQgbXhjX2dwaW9fZnJlZShzdHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25l
ZCBpbnQNCj4gPiArb2Zmc2V0KSB7DQo+ID4gKyAgICAgICBncGlvY2hpcF9nZW5lcmljX2ZyZWUo
Y2hpcCwgb2Zmc2V0KTsNCj4gPiArICAgICAgIHBtX3J1bnRpbWVfcHV0KGNoaXAtPnBhcmVudCk7
DQo+ID4gK30NCj4gDQo+IFNvLCB5b3Ugd2FudCB0byBoYXZlIHRoaXMgdG8gdHJhY2sgdGhlIGFt
b3VudCBvZiBHUElPIGxpbmVzIHJlcXVlc3RlZCwgcmlnaHQ/DQo+IENhbGxpbmcgUE0gcnVudGlt
ZSBhZnRlciB0aGUgZmlyc3QgcmVxdWVzdCBtYWtlcyBsaXR0bGUgc2Vuc2UuDQo+IA0KDQpZZXMs
IHRoYXQncyB0aGUgcHVycG9zZS4gT25jZSBhIEdQSU8gbGluZSBpcyByZXF1ZXN0ZWQsIHRoZSBH
UElPIGNvbnRyb2xsZXINCnNob3VsZCBiZSBpbiBhY3RpdmUgc3RhdGUuIA0KDQo+IEJ1dCBoZXJl
IGlzIHRoZSBxdWVzdGlvbjogZG9lcyB5b3VyIGNvbnRyb2xsZXIgc3VwcG9ydCB3YWtlIGZyb20g
SVJRPw0KPiANCj4gSGF2ZSB5b3UgdHJpZWQgdG8gc2VlIGlmIHRoZSBsaW5lcyB0aGF0IGFyZSB1
c2VkIGZvciBJUlEgd2l0aA0KPiBncGlvZF90b19pcnEoKSByZWFsbHkgd29yayB3aXRoIHRoaXM/
DQo+IA0KDQpZZXMsIHRoZSBjb250cm9sbGVyIHN1cHBvcnRzIHdha2UgZnJvbSBJUlEuIFRoaXMg
cGF0Y2ggaGFzIGJlZW4NClZlcmlmaWVkIHdpdGggdGhlIFNEQ0FSRCBwbHVnLWluL291dCB1c2Ug
Y2FzZSB3aGljaCB1c2UgYSBHUElPIGxpbmUgYXMgQ0QgUElOLg0KDQo+IC4uLg0KPiANCj4gPiAr
ICAgICAgIGVyciA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoJnBkZXYtPmRldik7DQo+ID4gKyAgICAg
ICBpZiAoZXJyIDwgMCkNCj4gDQo+IHJlZmVyZW5jZSBjb3VudCBsZWFrIGhlcmUuDQoNCkNoYW5n
ZSB0byBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0Pw0KDQo+IA0KPiA+ICsgICAgICAgICAgICAg
ICBnb3RvIG91dF9wbV9kaXM7DQo+IA0KPiANCj4gPiArc3RhdGljIGludCBfX21heWJlX3VudXNl
ZCBteGNfZ3Bpb19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZQ0KPiA+ICsqZGV2KQ0KPiAN
Cj4gUGxlYXNlLCBubyBfX21heWJlX3VudXNlZC4gVXNlIG5ldyBQTSBtYWNyb3MgZm9yIHRoYXQu
DQo+IA0KPiA+ICt7DQo+ID4gKyAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2ID0g
dG9fcGxhdGZvcm1fZGV2aWNlKGRldik7DQo+ID4gKyAgICAgICBzdHJ1Y3QgbXhjX2dwaW9fcG9y
dCAqcG9ydCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiANCj4gV2hhdCdzIHdyb25n
IHdpdGggZGV2X2dldF9kcnZkYXRhKCk/DQoNClllcywgZGV2X2dldF9kcnZkYXRhIGlzIGJldHRl
ci4NCg0KPiANCj4gPiArICAgICAgIG14Y19ncGlvX3NhdmVfcmVncyhwb3J0KTsNCj4gPiArICAg
ICAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShwb3J0LT5jbGspOw0KPiA+ICsNCj4gPiArICAgICAg
IHJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9fbWF5YmVfdW51c2Vk
IG14Y19ncGlvX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0KPiAN
Cj4gU2FtZSBjb21tZW50cyBhcyBwZXIgYWJvdmUgZnVuY3Rpb24uDQo+IA0KPiA+ICt9DQo+IA0K
PiAuLi4NCj4gDQo+IFBlcnNvbmFsIHZpZXcgb24gdGhpcyBpcyB0aGF0IGl0IG1ha2VzIGxpdHRs
ZSBzZW5zZSB0byBkbyBhbmQgaXMgcHJvbmUgdG8gc3VidGxlDQo+IGJ1Z3Mgd2l0aCB3YWtlIHNv
dXJjZXMgb3Igb3RoZXIsIG5vdCBzbyBvYnZpb3VzLCB1c2VzIG9mIHRoZSBHUElPIGxpbmVzLiBD
YW4geW91DQo+IHByb3ZpZGUgdGhlIG51bWJlcnMgb2YgdGhlIGN1cnJlbnQgZGlzc2lwYXRpb24g
aWYgdGhlIGNvbnRyb2xsZXIgaXMgb24gYW5kIG5vIGxpbmUNCj4gaXMgcmVxdWVzdGVkPyBBbHNv
IGlzIHRoZXJlIGFueSByZWFsIGV4YW1wbGUgb2YgaGFyZHdhcmUgKGV4aXN0aW5nIERUUykgdGhh
dCBoYXMNCj4gbm8gR1BJTyBpbiB1c2U/DQo+IA0KDQpXaGlsZSBwdXR0aW5nIHRoZSBHUElPIG1v
ZHVsZSBpdHNlbGYgaW50byBwb3dlciBzYXZpbmcgbW9kZSBtYXkgbm90IGhhdmUgYW4gb2J2aW91
cyBpbXBhY3QgDQpvbiBjdXJyZW50IGRpc3NpcGF0aW9uLCB0aGUgZnVuY3Rpb24gaXMgbmVjZXNz
YXJ5IGJlY2F1c2UgdGhlIEdQSU8gbW9kdWxlIGRpc2FibGVzIGl0cyBjbG9jayB3aGVuIGlkbGUu
IA0KVGhpcyBlbmFibGVzIHRoZSBzeXN0ZW0gYW4gb3Bwb3J0dW5pdHkgdG8gcG93ZXIgb2ZmIHRo
ZSBwYXJlbnQgc3Vic3lzdGVtLCBhbmQgdGhpcyBjb25zZXJ2ZXMgbW9yZSANCnBvd2VyLiBUaGUg
dHlwaWNhbCBpLk1YOCBTb0MgZmVhdHVyZXMgdXAgdG8gOCBHUElPIGNvbnRyb2xsZXJzLCBidXQg
bW9zdCBvZiB0aGUgY29udHJvbGxlcnMgb2Z0ZW4gDQpyZW1haW4gdW51c2VkLg0KDQpUaGFua3Ms
DQpTaGVud2VpDQoNCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5r
bw0K
