Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C054AC1F2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Feb 2022 15:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbiBGOye (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Feb 2022 09:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344134AbiBGOgl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Feb 2022 09:36:41 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2106.outbound.protection.outlook.com [40.107.113.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40AEC0401C2;
        Mon,  7 Feb 2022 06:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXLftOXvlZqtkD51G/3lj6AJYgktrqMLp1yMscHdm5oSJ02oEbgDoUSRnEWg/VlqH1BvzbEOwQAX30MaBFMDJA/Y2kLbRDwUAcZYW1I1qO+tPZqSc0yO54nkfyMLS2doSE+EJZUh7mOq/5vsPR/OWg0uh6vQ1Yga4npique4FAJkjFfu8ca1J/7rZQFqULxIO3sTaD2w0ZXSIy4zOqHlwpL6CRMQwPnB8TSykjjA1sv/NsoCc0dmTxvygrHXaPmCjSQ/O5pwJoB0wDqvlCjbnzDDMpT2o7F9IcmuH8qfbfqmxWcj/tpi3SbM5Z1+PrBjxSLMjK589AvKqgpbIvVlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaprG13wVh0ODONNQVK2/cvnmY6HNRofyyywc4ugENU=;
 b=nify/h/QWgx+hvuOM0ePUSGWCywe5x3rbX9LslV54w+K/YGAEzRdwwsX1kEY4j1y2i1tr1VzRQ4mPFc5AQQ4cVQtbRG8euT+OFicuMBwJTfekX+pLH+0g6OZpv5YqHQef5Dp7cpcMARIeFoLK6b1RTgBqtuLXTDhG/4RB5CJTJECFq6AS2FDZ+gUFBdb3R1IL31OvHGCW7mSf7kDji6CwBgn4NxpMjs8ST+Tdz1Jms2s/4bnUWrj370+/fpjPUS4CCX7mJrQYFDo+7KOz6KCkgGGfxFH2tnLG/OPap7HwJ9oAgopX2yU65maXTeXO8JFmwHVaPxxMRw0ISobOHLS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaprG13wVh0ODONNQVK2/cvnmY6HNRofyyywc4ugENU=;
 b=vDzNWp3dlxiXk1XKRGhsU25p+MyT3d7Dp9LUc6FJn8XUxlJ9JRzC2gAZ+KA/YjJG2uhCQjQkRLJrBkVBgvok/kGEbo8/BMkUW+G/Mvusg+5CzMXb/HNYf1gwPfZ4sLkk9wUuX9OYZTTl6QuQOQFH6ZYxHD+WXygox+OjyB1U+fc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8336.jpnprd01.prod.outlook.com (2603:1096:604:190::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 14:36:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 14:36:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] pinctrl: renesas: Kconfig: Update description for
 RZ/V2L pin control support
Thread-Topic: [PATCH 1/2] pinctrl: renesas: Kconfig: Update description for
 RZ/V2L pin control support
Thread-Index: AQHYG5I2+psTDc4ihk6AUMmQ1CK9kayIJ4AAgAABVlA=
Date:   Mon, 7 Feb 2022 14:36:38 +0000
Message-ID: <OS0PR01MB592233484843608A5C10307C862C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220206194614.13209-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdUXr9hWGKR8bzvweLJKX0m3sdCPSCawgbJ9Sjn6rdC+mg@mail.gmail.com>
In-Reply-To: <CAMuHMdUXr9hWGKR8bzvweLJKX0m3sdCPSCawgbJ9Sjn6rdC+mg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1db2afad-e026-4bd1-5cc4-08d9ea473ffe
x-ms-traffictypediagnostic: OS3PR01MB8336:EE_
x-microsoft-antispam-prvs: <OS3PR01MB8336343BE46B3E5933168CE5862C9@OS3PR01MB8336.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6/1Ll9hdtHBMZpBydY/3rwTkUarPef12xSBSbiER8mlebDASmoII0AEULnymXjA7qyAnXj14JhjKS11eORH2Os7yECJByyOxU7TcqWen8rln5jhaw4vDoReuZHv2dWQZhE5rSYB52TFqy4MgdAgc4oKAy31q63OM1wgBBugUi9sjuvrOJk0BgM2cGCgUr5hCgMgSazppzTBYTupDZOUaNIi0EFORL6Kd6m/YRYr/8QAa2ScaAT2XOAp0uMYOOrPflNu7UQAsNadzpA9ixX/5Cai59tiz2xbvgtlrruw6EluYdUTD58c/8uf0KfXzirzA0avN7EuhlixDpLrkqI+mtW3fyprHV8l02ljpQxMdwWf/2SbZQ+6Ev/Qw/uWwSdkCTdyeoBfj8RO9jWbQqxYsyeTYy4q0WKyaCmnattXwUqsLJXaY0pEUt/3rnPDx6LSYmhaNq2xzQlAn3wum8ZZ3mpcWwtnBhRYJLHo8ZKaZwyVaYWXKhl4FPNUjogCAklRhYuMY9ZqFVN+X3LvvyaN59Du54azRLLXVag5iOhgyX6b4NtZc4cam4N9vxl4n+CP8P1OR/5SJfGO91Fwn4ob6gi8wwsPAt3sxVRYnMNAirrNqxxjl5bPDT2Ta/P+QlTcQFEqR1PjqI5WKJIQAl/3LTOG4TAnxm+IbEyEbZrznpVMC4+DNuunRUdXgDegY5ZEiNK7YylElRWFU9NzN9cqPIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(38070700005)(53546011)(6506007)(7696005)(33656002)(38100700002)(122000001)(508600001)(54906003)(76116006)(6916009)(66946007)(8676002)(71200400001)(4326008)(66556008)(66446008)(66476007)(64756008)(8936002)(15650500001)(4744005)(316002)(186003)(52536014)(26005)(107886003)(83380400001)(9686003)(55016003)(86362001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXZ1K3g5Qm1XVXNDTUs0d0gyOGdPdVdSVjAwUHplMUIyL000bWVkSk1iOEpy?=
 =?utf-8?B?emlEUFErOXcyaGpoakQ1aHA1QkFiY1pScEJaVVJMRFlzUlJ3SzlOMS92YTM1?=
 =?utf-8?B?NENnRHBUaFhXUUtuWnJlUFdDS3RMOGVZZG9JeGw4emxSRFBnMlBrOU9CM2pm?=
 =?utf-8?B?SldheHg3QXVmNk1CMVA1eUJHVGE3NUwwOGRxUTRDYXVtbHRNQTJyNjcvMkpT?=
 =?utf-8?B?MTUvZWdqa3pHS2FVWGFILzRwQW5hWkl5cW9GZTdKV0VBRW8zZmxlQ05xQ2p3?=
 =?utf-8?B?bDNBdWhPbU9sQ2JCZkRSclY1SnA3aWs3V3VwaENuenZLdWZqM2l5UlAvUXFD?=
 =?utf-8?B?cEgvY0NaRnJpUXZ2L2xvV014Q0lNM0ROYVEvanMwQlNHM2kxOFFJRTRGOWpR?=
 =?utf-8?B?eUJzV0VkMnNDcFkxL3R0MWc1UVN1YXVScVBqclU0NmliMXU2ZkhqZlZMb3Ru?=
 =?utf-8?B?QXY2TGlBdUpJbGEzb0JOQURQOVduMlZzZkxLQnV1bHBPSUxtdGxMM0J6VDYr?=
 =?utf-8?B?TDJidEpZSnRWeWRidEthbDE3RFV6L3ZWcldtQkdYbTdmK1JXSDZWbEk4eUsz?=
 =?utf-8?B?UUlwU3VUQlBpRlIxSmwrcUY2L2gyT2ljb3ZML2FPZm9UWnoydnFIaitKVmtG?=
 =?utf-8?B?SE16VW9NOHR0THJPVm9MY2phYTc4UjIzK2RjSlRTdzE4TUdHZmFKaEh4UlNr?=
 =?utf-8?B?SHpidGUxSHZyY2Vsd282Q3VmNVpEaWI5TnZoZTJhRTdkKy9KbkRRR3NZVjZq?=
 =?utf-8?B?clp6eTZtNzVwaW1rOVJYRklROWtBQ0ZLTXVhK0RTR2gzTzg4ZnVCZUJtc0Rk?=
 =?utf-8?B?T3laTXliZ2ZmSEZUSlRPd0FOazVPSnBlcHN5VURNQ3BoNElWUjNNa2tUbUNs?=
 =?utf-8?B?Q05QdU16OVR3QzlpenQzV1V4ZnhidUhuN2JxODliUThJVUZOeVRQSnFneVo5?=
 =?utf-8?B?TnF1N1hrRlZ0bTZQT3l1SkVLSE9pNmNHakgwQkZCd0ExeGRGeDZQMjZMZHI1?=
 =?utf-8?B?OTNibHpHb0FkOUFqNVZrMXhLc0xrVjhzV1dmQ0hzeDZzTmFSYUNaS1o4MXhL?=
 =?utf-8?B?b05NN2xnTE9EeTVUeDA5K252d3F3VnBIOGtSZjZGb2E5R2VSWlg5YUhlSFI1?=
 =?utf-8?B?Z2U1cjZIZTY3K1VEbEhORWlQN293b3MrdFF1VXJjMmtISVI0R0gyaFZUZW4z?=
 =?utf-8?B?eE9uSXZ4MXVVN2Jwemd0eklwYmtPOW9wTTVqYURYeEo2MHEySU1TaDhqSFdk?=
 =?utf-8?B?bG1hS2xWdWY0U08rUWpHR0djUk02UmJqUklBclRLTnorRnFyRWJ3VXNUUjdJ?=
 =?utf-8?B?Qk5nc1JqdXNoTjQwem15TkNoaUtJUE1XN3ovbkVYdzJ4QVUvcUp4S1VYekVD?=
 =?utf-8?B?VEM1WW5EbVpWWCt1dkRudEN0WFJmRVk3SnIySllnaEN3L0lpaHVPYzVRK1hC?=
 =?utf-8?B?clNEeW9zN0lFdm5lWllZZmlOYU1ERzVaTUdESWgraktFS1V4QTBvNHNiRmd2?=
 =?utf-8?B?VzlzdEFaZjQxSmJ5TTJXbllLeUR5UHZVZjF6K3U1bGRZNlAvbVUwbHRKWjFZ?=
 =?utf-8?B?ejQyWTNXYUhtUjJ0KzcxaVgzc0ZNeThjT3RsQjVFOWRQYkcvRVZUbXhxZVFU?=
 =?utf-8?B?b3FhZmRxZGdHMGVJQTVpSVNsWXBoVk13aW1KRVpWMk02dktCU0NreFdBejd4?=
 =?utf-8?B?ZzVxU242TWZ6c2RJeGpYQ0M0TFBvMDhkZFhsaWF6NEMyYnpFSU5lcDlKbUVy?=
 =?utf-8?B?aE1RMmVVRGJVemVCYmRPUUFSdG95bUJtTlhNakV0Y29PWXFMc3g2VC9OZGc1?=
 =?utf-8?B?RUF1ekU2R1E3QTdyWTNha052YmxlZDF5M3NBUXRFMUFCWVFQZGE5SG1zTDFz?=
 =?utf-8?B?T2xwa0JrZ2RKZlRyL0VYVytoMVdTSWN0d21aMHdUTXNhY0pMODhpa2RNVzVY?=
 =?utf-8?B?emFGVlF6c21yWWhJNFhXNFpXb3RHN3hVeThEb2RtNGhGcTdSSlFHMmZmQU04?=
 =?utf-8?B?ZWRRMTVMTit6N1JLU29mWFJZaFdYOEswZDh6SXhZd0ZONHJGUlVJVkZ6bmo1?=
 =?utf-8?B?MHdjbEs5ZjNMVkYzVFlGT0ZudmF5dGxyczNoZW10S0lzVFRkanNvQ3JOY3R3?=
 =?utf-8?B?eWRNRG9PcmY4YlVjWUFpZ09tYWk0NEc5OVpFMnhiejQ0dHRCRFprN0R3SWhs?=
 =?utf-8?B?ZGMxak1yMkMvMjdtbFRvd0t6Yy9LbzMxbWJpV244emJhY3Z4TmxXc0pIbmxU?=
 =?utf-8?B?Ukw2QWFBR2F2ZEk3MFo2NEE3MFh3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db2afad-e026-4bd1-5cc4-08d9ea473ffe
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 14:36:38.6066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TA+uq4BtbTRAMee/EJYNG3nip8U+VqXgJR1TPsUSIfrjgUNqg1qwMvJRH4m6iFy1/TOUE7+bfM99jNYEQybZ37D/Wcwn3Dm2dRLFBaSgUxE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8336
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8yXSBwaW5jdHJsOiByZW5lc2FzOiBLY29uZmlnOiBVcGRhdGUgZGVzY3JpcHRpb24g
Zm9yDQo+IFJaL1YyTCBwaW4gY29udHJvbCBzdXBwb3J0DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gU3VuLCBGZWIgNiwgMjAyMiBhdCA4OjQ2IFBNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gUlovVjJMIHVzZXMgUlovRzJMIEdQSU8gYW5kIHBp
bmN0cmwgZHJpdmVyLg0KPiA+IFRoaXMgcGF0Y2ggdXBkYXRlcyBkZXNjcmlwdGlvbiBmb3IgUlov
VjJMIHBpbiBjb250cm9sIHN1cHBvcnQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0
Y2ghDQo+IA0KPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4NCj4gDQo+IEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gZm9sZCB0aGlzIGlu
dG8gY29tbWl0IDlkNmFlNWI3MmY3OGE5NGYNCj4gKCJwaW5jdHJsOiByZW5lc2FzOiBLY29uZmln
OiBTZWxlY3QgUElOQ1RSTF9SWkcyTCBpZiBSWi9WMkwgU29DIGlzDQo+IGVuYWJsZWQiKSBpbiBy
ZW5lc2FzLXBpbmN0cmwtZm9yLXY1LjE4Pw0KDQpBZ3JlZWQuDQoNCkNoZWVycywNCkJpanUNCg==
