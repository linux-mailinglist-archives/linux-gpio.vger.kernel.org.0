Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA2434E720
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Mar 2021 14:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbhC3MGt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Mar 2021 08:06:49 -0400
Received: from mail-db8eur05on2081.outbound.protection.outlook.com ([40.107.20.81]:5888
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231838AbhC3MGq (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 30 Mar 2021 08:06:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLa4yqsDImwTURobHVGTNKjwFwhB/x5s/ZMRHuKQK+b57KTYtQpGcL+XG/KsM1Im4LXfepA3YroirxHJZgee36QVEHI6lzepxTD/7qbc8w90g4Hig4CZozkTSAFjW3GKefRxa7INq9kjgeSEkGfgluPuTwvCiWm5L1LQvmDyp75w/bRUT25iW7sZlU1vl1pTvIeNqateoaoa6FMDAJvUR3lrkM9h0R6GzIgTAFrXwNtQFs0O7d1wINoWkDArGsSiFDT+LgNLlfYgQmSv+rSyq8VHHkAvYnAYm4+omHNeiJsDthOITjeep5VIkoYXe2/41xkkcXEFAKdFcHrH/xeRAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q8Y9a6BtRbh6OYIdVV59n+UBw1pHywUHZN3pehxnEs=;
 b=ZYgl/OyqwqAw0Vds37uRpw1GFDaAZM8Ly4qTRyHOHsD5HNF2NH1yD1y4++UYoMP7Ybh11tIPnpSJO2textkymtez9EvPhV52Ki3px//7V9t46KnHZPjX9bhIBRT/lYTcZtS/MmDbDz/V79CiJqHRbh60gSmmg1IjrFnZ1+ZAUxZpEuWJUqUnElQ6Z7sJP1UAkUbUUjBe9I9zQSqjh4xnTKTswfDroVMnJqCDm8R4NZBke4MaNdoOvtlvp+RN/KxUpQscYH7yqE1aJG1nWEZc4k0oKkgqeouWLBKq6ATjJkQZ1pJktYBcaYX4uabzI2+CD2Q/W0FRDiMSirlpa1vMLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Q8Y9a6BtRbh6OYIdVV59n+UBw1pHywUHZN3pehxnEs=;
 b=RnoStHRmmDkwlFPL3NKY5VP3Hex7QLzXZ/79PCz1DXtFSxjZwlnUWGcSTBV2vrmfFnOGw/4kO4PDbCyr9rRWObLuf6grizld4GKn/HxdLtWj9Z08Cc/rldsEkmIWBULTRRkTB+TXdbPqiju7hbSHXe4JuDPL9ZSvL4TiJzSM+OI=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2170.eurprd03.prod.outlook.com (2603:10a6:3:20::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Tue, 30 Mar 2021 12:06:43 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 12:06:43 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
CC:     linux-power <linux-power@fi.rohmeurope.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
Thread-Topic: [PATCH v5 09/19] gpio: support ROHM BD71815 GPOs
Thread-Index: AQHXJJsGjHVvEbwzhkqZmf3zCM/hD6qcUO+AgAAgJQA=
Date:   Tue, 30 Mar 2021 12:06:43 +0000
Message-ID: <e388002df6dd121b238918724f3b43637831d2cc.camel@fi.rohmeurope.com>
References: <cover.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
         <118a6160880a212d20d0251f763cad295c741b4d.1617020713.git.matti.vaittinen@fi.rohmeurope.com>
         <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com>
In-Reply-To: <CAHp75VdRobc6jpFzAkd3U65BhiiNPLrF4qsnCKmsQBKMYbG4sg@mail.gmail.com>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bf9f3ac-fe8c-40dc-5c55-08d8f37448ed
x-ms-traffictypediagnostic: HE1PR0301MB2170:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB21701C3960A6F902A0995488AD7D9@HE1PR0301MB2170.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 59cLat/O3xPVrmu3gVWkNpqKWNb3EHQviXvH8f1PeobEROca1BHnvbjsVrCp0Q1nCowZhlNkXaWOGYvazqd9KviQkzNJPL9y4Fn/U3ePBSnCrDLCZj24npj9FdYkbuuZZXJa7d8VWKBSLtNtrnMnaRBIMCgxRvWon2kEtRAozKs7eO+FqcB9cZ72/bkF0OZud7D0xEtggdGrTmGS/Gg9w52ETk5fPXJnCwlYaC9QtayY4nj5UhZatFeQlcF746CNlE+Dba8SWlY1zf01OZAfxxJx0SrLwQqixuRmgoiYZ/zN9Q4S170RU9EG5Dgwt5nYpVhg8tEYifDIq0trnS1NNeMGSAKIbSydU1rqWIin1rBkEWuYqK8Ut0VdzzL0Hc0eTBDDnkObF3JI7STRjpDX7HZJcrTXNpOngW6LMhI7lhHiVCPoEsJiKFl8ldYXQbzkq+vLcE3lUQuVFLSiSSgof6FhmEUy9J/QAPSWkEsxt1JtF4kStXsQ1Ze8mGwg1iha8AdaNGLI5eZa3yIi735KnDNJpHRGZNy22WA7tN7tCsbFlezGVbmvdJJ5qgiINjOmJ9dpRuFEPCQ5qEmqaEOXCmG2Mg0gVKafq5txByDhRPXRxSNWuMoSKml5QrOBrQVfLKtxiACp+D4fXPQJET+kww==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(366004)(396003)(376002)(66476007)(66556008)(66946007)(64756008)(6512007)(8936002)(83380400001)(66446008)(2616005)(38100700001)(5660300002)(6916009)(186003)(8676002)(76116006)(71200400001)(53546011)(316002)(86362001)(3450700001)(2906002)(6506007)(4744005)(478600001)(54906003)(4326008)(6486002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Mm9aaEJGTXZtS3I5aHR1WWZweXdzYTRWLzFBMXJjVURRalZwTnpvUm9WdThT?=
 =?utf-8?B?bTFCNjU0RUdzL2l0R1NmL2ZCdmdrWm1pelZEeTBKSFhzeEpwWkNvTS91UUlt?=
 =?utf-8?B?d2JYazNuNVN5bUR2RFhkWXdCY01pOVArL1AxYWU3WjlaYTZCL1pZMGFoK2xr?=
 =?utf-8?B?Q2V0ejJwbENkanBYaXhoaGExRmQzeG9mRlVuTVNweGJybmpERHZmWFpSR3cz?=
 =?utf-8?B?Y2k0eXJSNllLZGpheU14T0xRaWw2YmJON2lGM3BVNCs1bjdaeUFXMEs5NnFY?=
 =?utf-8?B?Yy9OK20vWHltVlpkRWI2dHVUZm4xM1BleGhhUzdLemZuUFozSTdtUjE4L0o2?=
 =?utf-8?B?VXZqK0M5bDAwckNkMlVJNTJna1cvUHNYd3NMc2RiUk1xeFpNeGMwSjRmVVE2?=
 =?utf-8?B?T3Q1YVNLME02S0tMQ1ZBRXRmcWZpMDR6K1VlL0FhYUk4a1Q2SUEwMnVON2gy?=
 =?utf-8?B?ZzZvbzBqMS9yVjBJU1VIZkVWZTJkZkZrRlNKRkQ0S0tSRTlJTmY3QnpCVk03?=
 =?utf-8?B?ODZlWHhPN3NBTklWNEZjUU5UZFkvcTMraGkvekVxY00yMXF3ejdFVzlkaGdI?=
 =?utf-8?B?eDFJM3lTbWFjL3Q2d0xiSHhMNHRrbW13T3hKa0REOHFjeGtNNWRJKzJEMWpD?=
 =?utf-8?B?ZGxEaEh6c3J4NTkyZjFycjFUQTBRcUdCUlB2N1pPeWdpanhFcU5vRzhhNWhN?=
 =?utf-8?B?cnBaRDFCb3d0RVovenhYUUNyUC9zd0l2NGVlZFNaQW5VNWJOakVNZXM0Y3Fu?=
 =?utf-8?B?NWEwYlpNN0ZKUnFiQk9IZWxka0dZN1hHWXJMcXNmQmZQNXlSZkgzaDU3bm5P?=
 =?utf-8?B?c0tNSzVILzZRRVpUTnFPUGlXQ2NUelRiQWJncGJkb2lFaVlERGZGMlYvR01N?=
 =?utf-8?B?S0E0V3lXNEJzMm16MnRZc0VISkZxTEgvcmdvb0FySE0wM0lFOFBKNXZlM1VW?=
 =?utf-8?B?eE1uSjNYcERjU0xhNzNObEhpdjZMMVBXbjh1c3o4N3hoU1JVblQwWk9TNU1y?=
 =?utf-8?B?UXRaWXFFaXREcG1DdDFoMDdBYmxTYzhZT0J5WHpnVzhKTWJ2b3JnTWRtV0N4?=
 =?utf-8?B?Y3FYd0c4Zy9SSDNoWjZnUDJWSTlCZnpaMTRyTHdlR3Npb0xIZ0xEOWUrREdO?=
 =?utf-8?B?bWE1dWVFdnBBMW80YStoMTJUcnNOQVZUZXNNbWJjdDFkRnR6RnJnM1RPbjZ4?=
 =?utf-8?B?S0tTYXRVdnUwanVwZVB0RUsvQlh6WXFaSkxRSDdTZTlmcWZtMXIrem9uT1A5?=
 =?utf-8?B?TEFHRm5lMlByd2UrUDJ1TERoN0lsUFNyaVk5MWNjcDNHb1hUbW9FRDMzVlBX?=
 =?utf-8?B?RDkvRVlyRzZoREJuVWdlbFY2bmF2WTRZSnFtaldyTkc4YUdOMTJhTmI0VW5W?=
 =?utf-8?B?RnI3QVRuU3hGaEtUdGtYaER4Z05pVW5KTnVFRExMRmZkYXl1bXlKUXQzendU?=
 =?utf-8?B?NnhocVpTY2l6R0ZGQzc1dUMzcFJDMzJsT0R5OEZiSlMzWUEwVGE5SHlabmtD?=
 =?utf-8?B?Y1VmbWlFV0R4Q1pNMmpSaTBaQ3dMc1JhLysyMnA0OW9tRXJBd1hteXdkTm1z?=
 =?utf-8?B?OTZkZGNmdk1FMWgrazQ1Z0xsdCtsZHM5RnVkV3RxdXJEd1JOK01qTTdZYmFM?=
 =?utf-8?B?cEJCMFlKSGtRTHdnU1hZTkJxaW1kUms1bEhnWXJjWWxCRkErOVVFeVJrK1p6?=
 =?utf-8?B?MTlJZnRmb0h0dThPamFuckRIaW5uT1MraTh1VmhWYStnd1VXOHl2SkJJc1Bm?=
 =?utf-8?B?SlU5K0FlZ3B2ZDlCcUJKWWEwRWl0WUQycU8xS1hTZzk0M09wK3RVVEVWQ1No?=
 =?utf-8?Q?i8VMMtx3QXATyT1lInzpn8O3+PpCUJTFvgQJo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFB192703B86CF4AB73C3C4B3AEC84C9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bf9f3ac-fe8c-40dc-5c55-08d8f37448ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2021 12:06:43.6757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgJUZa/YSS8lnUB6xIfLpGVDVm4IbKF2WQUv6JkAEIX4nKucB+2PvL1umeyOC/01SSHC5kL7mFJloFziMur2bLEluLdEMsbfeE4mbVRh4zpRPoEvZBPoFWQRlfVJHm0y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2170
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQpPbiBUdWUsIDIwMjEtMDMtMzAgYXQgMTM6MTEgKzAzMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToNCj4gT24gTW9uLCBNYXIgMjksIDIwMjEgYXQgMzo1OCBQTSBNYXR0aSBWYWl0dGluZW4NCj4g
PG1hdHRpLnZhaXR0aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gK3N0
cnVjdCBiZDcxODE1X2dwaW8gew0KPiA+ICsgICAgICAgc3RydWN0IGdwaW9fY2hpcCBjaGlwOw0K
PiA+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2Ow0KPiANCj4gV29uZGVyaW5nIHdoeSB5b3Ug
bmVlZCB0aGlzLiBJcyBpdCB0aGUgc2FtZSBhcyBjaGlwLnBhcmVudD8NCj4gDQoNClRoaXMgaXMg
ZXhhY3RseSB0aGUgcmVhc29uIHdoeSBJIGhhZCB0aGUgY29tbWVudHMgeW91IG9iamVjdGVkIGlu
IHRoZQ0KcHJvYmUuIGRldiBpcyBwb2ludGVyIHRvIHRoZSBwbGF0Zm9ybSBkZXZpY2UgLSB3aGlj
aCBzaG91bGQgYmUgdXNlZCBmb3INCnByaW50cyBhbmQgYW55IHBvdGVudGlhbCBkZXZtIHN0dWZm
Lg0KDQpjaGlwLnBhcmVudCBpcyB0aGUgTUZEIGRldmljZSB3aGljaCBwcm92aWRlcyB0aGUgcmVn
bWFwIGFjY2VzcyBhbmQgRFQNCm5vZGUuDQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZhaXR0aW5l
bg0K
