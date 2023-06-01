Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B4B71F650
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 01:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbjFAXBM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 19:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbjFAXBI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 19:01:08 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DAA1B1
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 16:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXsyXFwdGdDcrb9885YRG7JnBSHjG8cThXWZcSWYJruPSJ4yD1dZlTp2SwJ88brrVA2BcXeOIs6SEc6Lkv07rTvcDIcMoU5E3DRM7EoYrYeTL/+l8we+JnLCe0gUxNDcZIfRvMx+7vTtFrimXyuFGPqeUy4JjK+r9BSlxBoxoxWEHw0IutA7FFunsmWMeFc1uba3UGQsfvrU07g9f67lOc2i8llPZWPu97KfVBqXKpgBQqH3vJYHziOvSOL2cM6zrjSjMKYyifm0PrgfPS4JeKj9sto3HAZLg34mrUhAXlUDW0Ui7UBKP7QQZnb4beGeisywycvJ5DSnadZ4C/sa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PoT2+7ggtSlxFjV+3JnhDGmACAr+jFFVhdth00KnJ4=;
 b=G8xTJQ7AupeIh7UwdkxsUWvcVmS4tZwIw0hNJptJJZmWiAH1CxjpcRqJ4yt9lZ29jTI9Hb8V8R+GnuMKVJZgRkLAM9XYDDw3ivpvI4KJVZbd9OkvgkOzzLCsYNlRAxyZ3gdKTZKXrCSU/c6b5fT5aW+TaYCM8UugDe7MPPQ850Ac4FT+b+/5iLwgDIGnSc+fw3xLoEt3wXBt23dIDEVwgpo8OLc/8wqI9/kb+E3HhysMqsLeNGXQqPy6ZGeC2cBmdTAdIaPjz983crEDDzi3F4ZInTwKpy8DtTsJg9P1OIJMHsvj2MFRScCET7lHevpaPYdV7vHfCb4DtG7y6F+Lhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ooma.com; dmarc=pass action=none header.from=ooma.com;
 dkim=pass header.d=ooma.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ooma.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PoT2+7ggtSlxFjV+3JnhDGmACAr+jFFVhdth00KnJ4=;
 b=Kb8VCNhmCQn3K/K+s1/M8msd9WK1/tC8c+dGjR3kHIOvXW5Z6cUPXPlZgw1e8ji3OIqwhTnuc4I14I0/QINKfNQwNIUCK4yHOTgkx4PIOz3AfvChy0Y0nY89+habB0Q298ZzuRzZ9Q3SYjaBc8tQjHsjufL0QXU/pl8rhKQV1lA=
Received: from BYAPR14MB2918.namprd14.prod.outlook.com (2603:10b6:a03:153::10)
 by BN8PR14MB3394.namprd14.prod.outlook.com (2603:10b6:408:d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 23:01:00 +0000
Received: from BYAPR14MB2918.namprd14.prod.outlook.com
 ([fe80::6e6d:b407:35b1:c64]) by BYAPR14MB2918.namprd14.prod.outlook.com
 ([fe80::6e6d:b407:35b1:c64%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 23:01:00 +0000
From:   Michal Smulski <michal.smulski@ooma.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
CC:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH v2] gpio: mpc8xxx: latch GPIOs state on module load when
 configured as output
Thread-Topic: [PATCH v2] gpio: mpc8xxx: latch GPIOs state on module load when
 configured as output
Thread-Index: AQHZlABUd2R6OL2s60i6HW/ofN71XK91j9WAgAEB1AA=
Date:   Thu, 1 Jun 2023 23:00:59 +0000
Message-ID: <BYAPR14MB2918C9A969E434CF01A16609E349A@BYAPR14MB2918.namprd14.prod.outlook.com>
References: <20230531204139.10570-1-msmulski2@gmail.com>
 <CAMRc=Me5aSam-10kMzsHE3mCV0XxUgjm5z9auv++nBGMe3BQ-Q@mail.gmail.com>
In-Reply-To: <CAMRc=Me5aSam-10kMzsHE3mCV0XxUgjm5z9auv++nBGMe3BQ-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ooma.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR14MB2918:EE_|BN8PR14MB3394:EE_
x-ms-office365-filtering-correlation-id: 299a3211-6d19-4a49-2c4c-08db62f4110a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Y9XKmHiE3uZjg+UzDySYbcBGn63uYe3nUxRsKva55Rds0hvbHLdWgjSIqnTX8qUO3aL8peJ50P0wmVwfvDf7+8306o/tv8jG6O+jxA64fr6xmL9HqnPetngUP0wEaPZo9W8Yti5HvF3yAxD/W8g2/Pa3DwfAigvRulMX3rVgd9DDoRw6JVnYXW7418VLn5wYo4+bGWOLyMYnKnBuQb3ubMWDKWaNoqr9UX+QyrRvLLv+HI7687O6NCyV1xfKs1+jQm3lwPxOuhxM/81ZCkXKqV5CGPkA0Un39S2Ngpx6Cbi2UORkO0o1NF/igVi6RhUtjdXeAZuCBa1NrPukv1Ff8IC0Xti7qttcHxUgUEZbIjkLpg3pLbYLm/xKpN/Fj2wxfJ3rg70l6aglwbR7xUTos9Novu5DJxXFl5DBFXk/RYILVHLHLwMy5gIoN1em/NqAWE4Zpq7KEOcKYm2zLoZMjn5qKE3agOANQOSCqqNbAlWMDMIgVwr1OVRUqwmnzs+dMRgmfH1vx6tUinBtHxoWZREFxZWHATuDy4lXABFG7GIXzTJsntBeydOhKmp7pcY3ek43/YswishgR6Aq1tw3iGdniFpbVBzqzYOXyRwZMUpfaQ2w3w9nnQ2ApZHaRQnFnl1BEJaj4TdQJtZWOoyxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR14MB2918.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(451199021)(38070700005)(44832011)(9686003)(83380400001)(6506007)(26005)(2906002)(8936002)(52536014)(186003)(8676002)(55016003)(4326008)(478600001)(66476007)(41300700001)(66556008)(76116006)(6916009)(53546011)(66446008)(33656002)(64756008)(316002)(66946007)(71200400001)(38100700002)(5660300002)(122000001)(86362001)(54906003)(7696005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXRwUkoweXVpb0RZdVcyU1ZDVGtxbWpNL091MHBEblZVVGpXNE9jQTk3b2dS?=
 =?utf-8?B?bXRMc1lWUHZoeitJNTB4ZEpDUjdkdnN5T0NJWStBUno3SXZrZ1JEcmpsZnBh?=
 =?utf-8?B?WTdHWU9GMkxKRlA5b1poVEJXQzZWYzNRZ0ZDdkdrWGhyVWwyc3lFUkhIUnRy?=
 =?utf-8?B?UytkejJtVGM2VGZvWTJtQTYrZ0FEdG9CVk4wWUhuY0RoM3FsSEtvSFR4ZitH?=
 =?utf-8?B?WE8yekEybmt4ZjJFNFBXMEptK2gvNWIrK1diOW5Pa0VJaDNjT1pIMVdOZk9y?=
 =?utf-8?B?UWxvbnd3aytFSEhsVndlN1lUMjF2WFJ1R3F6S1Bza1pvbEorREdxY2RMbUM3?=
 =?utf-8?B?cGZ6TlFMajJYZTJ1eG1BMldWaWFVU0k5dWVMREY5eWFYdEtibFJPMlkwTEpS?=
 =?utf-8?B?ZEJmNXE1SWNhVVRZSExBT3N3ZmJlc1NGa210V2t6VE5XekxTSXlYSXUyNHVG?=
 =?utf-8?B?Y2NpNGJoRkJCMHlQMmNVMzh5VFI4WTNmVDk4MGZWb0Fmd2MreFlJUlE0YTNj?=
 =?utf-8?B?WGVNNFZlMHQvd3loVWpHMHB4b2w5b0k4Tm0vMFFQRERZbzVGU3RZaDRYakRi?=
 =?utf-8?B?WkttWjBXV3BFdHE3NkkvcSttb01sYytsTHhhZ1JWSkVISzJpazk5TmVPb3Zw?=
 =?utf-8?B?R0k4WUpiSEQwR0tvU0JpZkNzWVpuK2hwQXAwY1o0d3VCWCs1aHNaTjhVZ1Q1?=
 =?utf-8?B?cUZsb1BNL3VSWGlzZkxwWTMwazkxSGYycDhXTjNaa3psNTUydy9MRkdVbnY2?=
 =?utf-8?B?TjdEZldkRTVOalM3VmhmWS9nZ2xvaUlaZWxJRkZBZG1mUjZTUGY5V3RvQjEz?=
 =?utf-8?B?TzUyMyt2WnA3Z1NnRTJpSjlEcDBaQkxURmM1YzNLZ1FoVytPMFRZUktKRkg3?=
 =?utf-8?B?dHVEV04xM2JEekZMYzZhZTlQWEdpZ0p6ZWtzMTRna1NKdHZSbGlXUlR6SmNN?=
 =?utf-8?B?SjJ2SWJiM0FQeHBBZGJVYnlPOGxUK0MzZjJESC92dUh6U2FySzdGNGZTK0JU?=
 =?utf-8?B?a3NFZzhlcytqVXB0bU1WbEw4cjVYbUxLd2ZwZmhDSDJrYUVnNEt1bFlMaXpv?=
 =?utf-8?B?VmxaeEdVd0o3VTN1L1NhZ2duWHRDeWdsMDFubDJQVkY3ZklRVEZBNWZha2lX?=
 =?utf-8?B?c0JKbUN4U3hLTE5XTEl6TkxrV1FHbmRwZlVBR2xnbzRXY1Brekx4aitIMzhN?=
 =?utf-8?B?UERsOWF1WWtWcnJSQzhod28xNitUZmFwTUxiTFB2dXIvVlpOMTFvN0tmcUdI?=
 =?utf-8?B?eGt5R0NGeWFEaVhFbjZ4cWh4SW5kZEFYcjJxMURaS1ZvV0xqcDNNQTZVWjJB?=
 =?utf-8?B?K2xIYk1JcE1CYjZ0M1padlN5TkNwWkR2VFdHTExvWEt2b2tiZlRiK3diNlMz?=
 =?utf-8?B?Z2lrQ0sxME5idC9ZcFgrdExsSE5Yd2QzVURlWDRvaDlvZVFEUVBFeU9IWWQw?=
 =?utf-8?B?WlVISlFkWmJHejBjbUpZRXVkUmFDMWFtYXhzUm1hdHhlMGpaVW93a3FVVXdG?=
 =?utf-8?B?T3pCaW01NUZhc1BrQlB3V2VQS0h0M0xlT1BLRDdUakZNczR6ZWRTT25hZDh1?=
 =?utf-8?B?b1ZsQzFnMk90aC9zRWI0WFpSODB4eFJud29PTUpQait1dHJGNkZDWVB1cEpM?=
 =?utf-8?B?YkppNHFGZDZ1b25nc0ZrcytuSStFZzQreE9Ta1hucmtTVkQzM1pPTzNRenRE?=
 =?utf-8?B?VUJka3ozbG9XZkRtWUZUcUNGVlFweFoxWXBKY1g3cGkxdW5RRUQrcE9CTTRh?=
 =?utf-8?B?TXNkMlR5RnJ4ZVVJaUtNRndLLzgyYXdUZWsrK2NjTXdoak9XQ3FuV3JMaExv?=
 =?utf-8?B?RTdtcnVaOXRDTHMxVHVuM1l6aGl4WE1TZDZ5eVRzZ1hQZkRhK1lWcW1xSTFV?=
 =?utf-8?B?MGJnc0dIVEhHcktjY0l5MXMrV2VxRVR3OWg0OFdmTWtac0lDTnhyTm9nZ1lB?=
 =?utf-8?B?MHZOQzNSZi95dTNCUG81QlplYlRob1ptU2FFejdVbU56c3BVM1F6d1I0RGc3?=
 =?utf-8?B?RlBHRU1BTHg0TWtKckF5TFVvN1BRSjVia3JzcWJYNDJ0U0ZDaStyOFZhVTRF?=
 =?utf-8?B?SGNPVTh1NDZhblVJOHRaR0dDMTUzTklSZC9mdzl1SkFkK1ZJb1JSc1V6RXY3?=
 =?utf-8?Q?BTy/Lq5oUP1wLEUuZcYhaFN6U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ooma.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR14MB2918.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299a3211-6d19-4a49-2c4c-08db62f4110a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 23:01:00.0111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2d44ad66-e31e-435e-aaf4-fc407c81e93b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89hQIQRVQWgFhDNgwmQKntHnjvlyop7aWxzrL7sH9K6joaW0HTpl+pyk+4NxdonCDmmbkuVCLOrY9E6/zKxGMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR14MB3394
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

WWVzLCBJIHdpbGwgcmUtc2VuZCB2ZXJzaW9uIHYyIHdpdGggY292ZXIgbGV0dGVyLg0KUmVnYXJk
cywNCk1pY2hhbA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQmFydG9zeiBH
b2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gDQpTZW50OiBUaHVyc2RheSwgSnVuZSAxLCAyMDIz
IDEyOjM3IEFNDQpUbzogbXNtdWxza2kyQGdtYWlsLmNvbQ0KQ2M6IGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZzsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IE1pY2hhbCBTbXVsc2tpIDxtaWNo
YWwuc211bHNraUBvb21hLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGdwaW86IG1wYzh4
eHg6IGxhdGNoIEdQSU9zIHN0YXRlIG9uIG1vZHVsZSBsb2FkIHdoZW4gY29uZmlndXJlZCBhcyBv
dXRwdXQNCg0KQ0FVVElPTjogVGhpcyBlbWFpbCBpcyBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBv
ZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50
cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUuDQoNCg0KT24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgMTA6NDHigK9QTSA8bXNtdWxza2ky
QGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IEZyb206IE1pY2hhbCBTbXVsc2tpIDxtaWNoYWwuc211
bHNraUBvb21hLmNvbT4NCj4NCj4gUW9yaXEgYW5kIHJlbGF0ZWQgZGV2aWNlcyBhbGxvdyByZWFk
aW5nIG91dCBzdGF0ZSBvZiBHUElPIHNldCBhcyBvdXRwdXQuDQo+IEhvd2V2ZXIsIGN1cnJlbnRs
eSBvbiBkcml2ZXIncyBpbml0LCBhbGwgb3V0cHV0cyBhcmUgY29uZmlndXJlZCBhcyBkcml2ZW4N
Cj4gbG93LiBTbywgYW55IGNoYW5nZXMgdG8gR1BJTyBjb25maXVyYXRpb24gd2lsbCBkcml2ZSBh
bGwgcGlucyAoY29uZmlndXJlZA0KPiBhcyBvdXRwdXQpIGFzIG91dHB1dC1sb3cuDQo+IFRoaXMg
cGF0Y2ggbGF0Y2hlcyBzdGF0ZSBvZiBvdXRwdXQgR1BJT3MgYmVmb3JlIGFueSBHUElPIGNvbmZp
Z3VyYXRpb24NCj4gdGFrZXMgcGxhY2UuIFRoaXMgcHJlc2VydmVzIGFueSBvdXRwdXQgc2V0dGlu
Z3MgZG9uZSBwcmlvciB0byBsb2FkaW5nDQo+IHRoZSBkcml2ZXIgKGZvciBleGFtcGxlLCBieSB1
LWJvb3QpLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgU211bHNraSA8bWljaGFsLnNtdWxz
a2lAb29tYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncGlvL2dwaW8tbXBjOHh4eC5jIHwgNiAr
KysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9ncGlvLW1wYzh4eHguYyBiL2RyaXZlcnMv
Z3Bpby9ncGlvLW1wYzh4eHguYw0KPiBpbmRleCAzZWIwOGNkMWZkYzAuLjYzNDBlNzM4YzkxMiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncGlvL2dwaW8tbXBjOHh4eC5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3Bpby9ncGlvLW1wYzh4eHguYw0KPiBAQCAtMzc1LDggKzM3NSwxMiBAQCBzdGF0aWMgaW50
IG1wYzh4eHhfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICBp
ZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJmc2wscW9yaXEtZ3BpbyIpIHx8DQo+ICAg
ICAgICAgICAgIG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAiZnNsLGxzMTAyOGEtZ3BpbyIp
IHx8DQo+ICAgICAgICAgICAgIG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAiZnNsLGxzMTA4
OGEtZ3BpbyIpIHx8DQo+IC0gICAgICAgICAgIGlzX2FjcGlfbm9kZShmd25vZGUpKQ0KPiArICAg
ICAgICAgICBpc19hY3BpX25vZGUoZndub2RlKSkgew0KPiAgICAgICAgICAgICAgICAgZ2MtPndy
aXRlX3JlZyhtcGM4eHh4X2djLT5yZWdzICsgR1BJT19JQkUsIDB4ZmZmZmZmZmYpOw0KPiArICAg
ICAgICAgICAgICAgLyogQWxzbywgbGF0Y2ggc3RhdGUgb2YgR1BJT3MgY29uZmlndXJlZCBhcyBv
dXRwdXQgYnkgYm9vdGxvYWRlci4gKi8NCj4gKyAgICAgICAgICAgICAgIGdjLT5iZ3Bpb19kYXRh
ID0gZ2MtPnJlYWRfcmVnKG1wYzh4eHhfZ2MtPnJlZ3MgKyBHUElPX0RBVCkgJg0KPiArICAgICAg
ICAgICAgICAgICAgICAgICBnYy0+cmVhZF9yZWcobXBjOHh4eF9nYy0+cmVncyArIEdQSU9fRElS
KTsNCj4gKyAgICAgICB9DQo+DQo+ICAgICAgICAgcmV0ID0gZGV2bV9ncGlvY2hpcF9hZGRfZGF0
YSgmcGRldi0+ZGV2LCBnYywgbXBjOHh4eF9nYyk7DQo+ICAgICAgICAgaWYgKHJldCkgew0KPiAt
LQ0KPiAyLjM0LjENCj4NCg0KV2hlbiBzZW5kaW5nIGEgbmV3IHZlcnNpb24sIHBsZWFzZSBsaXN0
IHRoZSBjaGFuZ2VzIHNpbmNlIHRoZSBsYXN0IHN1Ym1pc3Npb24uDQoNCkJhcnQNCg==
