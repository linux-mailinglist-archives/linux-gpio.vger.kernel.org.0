Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE9C2F273D
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Jan 2021 05:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731027AbhALEnz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Jan 2021 23:43:55 -0500
Received: from mail-eopbgr1410117.outbound.protection.outlook.com ([40.107.141.117]:34057
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730310AbhALEny (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 Jan 2021 23:43:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qn8qL/q449fNQD2rClsrAiKT8u4bEZcemzfmffWqaStMq8jmcAtldTjig9NmXlTA+KoZUCAMDeQAc4qcfB29gGRuxxpDNRQ6IeinAi92lurf58m5RYwbdhe66pyruofHwUkCSRhQG/6daNvaZ3TOequORCqQjetQBHa1dIwPyHo5WdaMWtxrLCEXlePdtlkI+L2AVBLEqTzlvI1bc/Pxc2sK9aC6HXkl4mfVfBThjwd8hvsku0FPQvTnqVdfYEgN0zrx7MtltIjm1bns5vTnAUk0Af4jiQzrG46r7gI17tmOF0n5IP2WwmLuaHJeNYmI18KBTCLNtGGLBZ+FM1CoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63B1jCEkSnTGL88Bp67Pew+h8/hNIqxuNkeOKCNXMoE=;
 b=FSSNQZ13vMQGAlWAHvJyCXsE2TgjWws1eQmW8jXEeHdaBQK94MKnOIUW1QQ10ol6Uln2NxVicPlYQzgciGOffcXgaHd/aGZPkPrcjfZKF4xCDWzeRGnRx8l2WzPyIZn0XdpF8EC7mAGzlh0buHOnX0GCWIKCVp6d+jU4BViquVI6CIgmGYnxmj2m9AKsHgpCvsqLGKCRBwIvOfQXkW9sxpHRO4Vpj/+I7DvMYbwKaQS/DBgp6GHRN6IGx+4Y3UHLP//0FYKxMOWQdcJK1EL+NNglcj2rWQMHcw7a7r/frQHvE14e8Su1eA0u73uJIANCvIkGLknBETzeeQTJ2l5g3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63B1jCEkSnTGL88Bp67Pew+h8/hNIqxuNkeOKCNXMoE=;
 b=AW0jfUHjBc67IjhKPqLy6nlZDgiuxv7Y8M511rOGODDQnHUvE/TIQSUPUtWGbj5MU4Nu0YX6g6w8yzAcxqCpM2Lh4IbAi648TC8xYMsLUdLwwn9izFfU242WyEOLGkuORAlYrKHI21iwZRaewRlXwT+BxtoLWL+UaggL5LqU9BE=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY1PR01MB1530.jpnprd01.prod.outlook.com (2603:1096:403:3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.8; Tue, 12 Jan
 2021 04:43:06 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 04:43:06 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        "linux-power@fi.rohmeurope.com" <linux-power@fi.rohmeurope.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 08/12] gpio: bd9571mwv: Add BD9574MWF support
Thread-Topic: [PATCH v6 08/12] gpio: bd9571mwv: Add BD9574MWF support
Thread-Index: AQHW2RWRDefQuJbQhk63Y/3Ij1nfPqoLeOeAgBgOyLA=
Date:   Tue, 12 Jan 2021 04:43:06 +0000
Message-ID: <TY2PR01MB36928A24EB009F309B35B4F3D8AA0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608718963-21818-9-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CACRpkdaDFgoaLnqmPFSnXe3KyNrGnpQObb0t7d2X_btU7VWD5w@mail.gmail.com>
In-Reply-To: <CACRpkdaDFgoaLnqmPFSnXe3KyNrGnpQObb0t7d2X_btU7VWD5w@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7ab2dde4-900c-44c0-247f-08d8b6b48dde
x-ms-traffictypediagnostic: TY1PR01MB1530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1530746B3304970D92943F34D8AA0@TY1PR01MB1530.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NDob52TdGcc21h/SAxHZf2afdMUiW0PS2Ca/kgJmgIugz+Wdz5V2VfMwVsxGp5Nh2oZieAVfho+FctwmFuUtBsMyF1LaMQzGKqhn3ufFQ1qE3DB20KtcknzTlIpzjfVeohzjGyRFaUXSuU6RkCwtiL494LTpdJRJYpTSXyLSthPcUKdZdbEZYON3GY9uRUaXi5iLJlu0rPbY0YjpBFnBnjm3m+6/IHPVrEkmLvsmO/E9kOZQGACHv7gDyeXXqMqBW1+F41s5Ag3AZ7s94yoQIKMz4xAViE00ZIAQna5W4QCwXItPW/OUWMIVvuSXrNA41kaGt10N+v+9PY09QYT9NhepMrgdpU+nOsDt3cxRYdckeKaD0mj3BCzNRaJ1MOEycpqzk+P1fWwfobVcyrRJIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(396003)(136003)(66476007)(316002)(186003)(66946007)(76116006)(52536014)(54906003)(66446008)(5660300002)(66556008)(7696005)(478600001)(4744005)(7416002)(8676002)(6916009)(2906002)(55016002)(4326008)(64756008)(9686003)(33656002)(71200400001)(6506007)(8936002)(55236004)(86362001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UFByS2p1OXpIbm5FZzh0Z0ZSc0Q1WCtiTHFPWU1OS2tRd3NyTGh2N1RYaTlM?=
 =?utf-8?B?VzhJcW9aQlJNUU93WEl0bXJEUjlvOVZZdlBsUWY3cml1eHRVdGdQT09sMUxD?=
 =?utf-8?B?blpsRWdxZkoyVDBBSW1qOTFMdG5KTjlQY1Ric0pUcDdhUFNYS3hHbWw2dUhU?=
 =?utf-8?B?RnFpNi9sTTFBUXlYaHU4TCswNjRRUjFqbUgxYWNrR3diZ3FJU0w0TEZUTGlh?=
 =?utf-8?B?eFpsQWdCdmNUb0ppYlRabnZhSkY4b21nWGpqOUV0MmUyalhZT3dEdWpaOFE2?=
 =?utf-8?B?ekhFcnpwSVA4NUdUblFyM21xcS9ra0NYV0VUdDVOWlBaZnNnNFZ6c1RWbnE5?=
 =?utf-8?B?bG96dzZkS3hIRzhoQk0vUUswMUlKTVJXK2FRbVpSdTZoVHJMQm56OUlUN3U4?=
 =?utf-8?B?QjRaSFVCSE8vL1VZTGRxKzhteHYyQ3ltdzVsMFZpbXBvYW5Qb0RRL1dSVUxG?=
 =?utf-8?B?WGdJT2lwSWZjbHpsZFh5VE5mdm81SWNaMDFxQ0R6M1E4M3BpU05yVTAvd0dU?=
 =?utf-8?B?WTFrR1k2dWpuY0FZUER3OGJJQm13cHUwU1JKK2p2bnNYU0JkUTVjRHVYSktJ?=
 =?utf-8?B?OWswMnlqVzljQTFnWWlwVjdSMDRtTFRGaDZ0UVFCV0F1ZmJWY3owMWExQm1R?=
 =?utf-8?B?ekNHdi9RaVZUb1kyeFp6cFRseHlZdytVSHFkcnV2VnBYVS83R1hibEhYUDZG?=
 =?utf-8?B?Q2dzNS9KK1ZUMGhqenZlbHRHY01hS00vWnVJR1lod1pxaDF0ajdzUThZME9h?=
 =?utf-8?B?dmRlTUVGWnZwZFBDSHFWa2RFbUVhaWkyNXlvV3hTa2JqK0xQQmY5ZzN2c01I?=
 =?utf-8?B?SDRDajJwQmR1MG9PL2JZR0ZJN2NxcEhNU3pmTUR1dXJhcTg4QWJXeTJKdklP?=
 =?utf-8?B?MHAvbzNTUHMwWWl3d3ExRU9ERUpuTFZBZ0pMYUFMTHhVRUlLNkkzQ0dZb24w?=
 =?utf-8?B?MkdybkhZcmJoT0NrYUloc2JDTnJrTGROTklIKzRmK0xIS0VnMVVUR2JHZWpS?=
 =?utf-8?B?aVpabUV2ZXBOZXFrczduVVZxY1pFYWlyeEJpZW5sMVROeHc0YmRlNG0zMzh2?=
 =?utf-8?B?R3lteGhYRkZ3cVdKLzdHY3NWRlVrMUQ2MVB1YTRRRG53WDVCTHF4UW01NVRn?=
 =?utf-8?B?SXZmODhNWWsvVmRBdWJaNk9valcyTUN6QzEwUU5sZkpWQXg0aDBmQkl1aG9W?=
 =?utf-8?B?cy93OFA5RGhkWDlNTXVSRmNvNXBraU9vamNYMVZzWlY0YXkrNTRoeGltL0NB?=
 =?utf-8?B?cEhrYWczN3N0aHZ5c1A0eDdtSzVWYjY1emZnZVZTdmswMDlTYkplVUtLbGgy?=
 =?utf-8?Q?5AWtXNI7H1b2c=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab2dde4-900c-44c0-247f-08d8b6b48dde
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 04:43:06.2500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPtLH4JCcTJqqse7aOct8UfwxJYeN44Ld1Zb/vRGPLeKKJXMD3oE7cjVsR3dHbPWzbHSeDqDP7eSMJ4T+aBMQRs7P+SQqDkX6GjzDHfC2RRzwDelXhGaeR+k5KAiJ0i3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1530
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgTGludXMsDQoNCj4gRnJvbTogTGludXMgV2FsbGVpaiwgU2VudDogTW9uZGF5LCBEZWNlbWJl
ciAyOCwgMjAyMCA2OjE2IEFNDQo+IA0KPiA+IEFkZCBzdXBwb3J0IGZvciBCRDk1NzRNV0Ygd2hp
Y2ggaXMgc2ltaWxhciBjaGlwIHdpdGggQkQ5NTcxTVdWLg0KPiA+IE5vdGUgdGhhdCBCRDk1NzRN
V0YgaGFzIGFkZGl0aW9uYWwgZmVhdHVyZXMgIlJFQ09WX0dQT1VUIiwNCj4gPiAiRlJFUVNFTCIg
YW5kICJSVENfSU4iLCBidXQgc3VwcG9ydHMgR1BJTyBmdW5jdGlvbiBvbmx5Lg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hpaGlyby5zaGltb2RhLnVoQHJl
bmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBNYXR0aSBWYWl0dGluZW4gPG1hdHRpLnZhaXR0
aW5lbkBmaS5yb2htZXVyb3BlLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQoNClRoYW5rIHlvdSBmb3IgeW91ciBBY2tlZC1ieSEg
SSdsbCBhZGQgeW91ciBBY2tlZC1ieSBpbiB0aGUgbmV4dCBwYXRjaCB2ZXJzaW9uIGFzIHY5Lg0K
DQo+IFRoaXMgbG9va3MgbGlrZSBpdCBjb21waWxlLXRpbWUgZGVwZW5kcyBvbiB0aGUgb3RoZXIg
cGF0Y2hlcyByaWdodD8NCg0KWW91J3JlIGNvcnJlY3QuDQoNCkJlc3QgcmVnYXJkcywNCllvc2hp
aGlybyBTaGltb2RhDQoNCg==
