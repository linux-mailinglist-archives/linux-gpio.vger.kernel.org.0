Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE36F564D7F
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 08:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiGDGES (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 02:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiGDGER (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 02:04:17 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EA5FE9
        for <linux-gpio@vger.kernel.org>; Sun,  3 Jul 2022 23:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKxAJxLT5PAJ9w0gsAyrokcQRnQ73Y/D/bRS39/z2EaDLHL9vUYZnqv4s5FfBRMRE+sqvzRJN5TDsPc0ksz/HiYpLNJCD3+r6KHkTczalyhAMZgZbJipsWUsidhphiLVQlDKqacvaxoS7RcoVItOe209GK42mq/FbTtT4jnBt1gqzccCZuQmF4BRnm5FzvWYEcH5CqyxVTsFLmkiqJkuWj4t4KBIGULAuNtXPKonKbkunVtMpw5zSIJxzr3QhtdABqwkJuUZfvCzzzkBrfzZQcW+M8avbfnkqnOBaLk0nAOkbFh5tLUIJXp0GxtHyfS7tLE0cqMXjA9PG5V5x6JaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fx/6LW/+DWNSMAUGTsRh4wekhUtOCTi7E5zxDEgP+LU=;
 b=WYiaGRd1NrFrEKTHgCMjL9vU2sgqT3SsBPGLT86SZl+z1ygfckDC4gL4ZHBkPThugZdoRr43jz6omaK9lq+ts6VkaY9MRJ7cwF78fd4svGVaVi/GI28tUUPBGOhgJBSdp0Oz7iQGdEtwHtJbcBQOmPt/6wni/98X2NwClT5+t7tbSLWKQiy2R/vXl1an9oTe75F+dExgqPUjMkWeRBzIM4MaltnW72GiVckfsT5QBKne/w1ODRBv/qioEoY7dlr3tBG68r7e2SfCLjOf8hRliAPXK6ZLGvcDPEL7/piIl1jvaXsMAYYb+YssBXUAhwX87gPu5hzv399i+lZles2jYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fx/6LW/+DWNSMAUGTsRh4wekhUtOCTi7E5zxDEgP+LU=;
 b=SEqrsaLo8oop0QQbtssjpUMq89uXLH+gORvPLHRaQhnWVEqi4mQuMwCBlSbIbp6CcF28mvgoxey7kyvGDjgvvFnxXhdDYiOj9WAGDAYEbVSlW9bA20b8JrAjXdP7Imic7QCBKRWODQ53IWvx+5DD/6HkZcKTCLR7LdQLexp+sJQ=
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com (2603:10a6:10:24d::9)
 by DB6PR0401MB2295.eurprd04.prod.outlook.com (2603:10a6:4:48::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 4 Jul
 2022 06:04:13 +0000
Received: from DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::1c1b:6695:20d7:fd10]) by DB9PR04MB8412.eurprd04.prod.outlook.com
 ([fe80::1c1b:6695:20d7:fd10%6]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 06:04:13 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sascha Hauer <kernel@pengutronix.de>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: imx: Add the zero base flag for imx93
Thread-Topic: [PATCH] pinctrl: imx: Add the zero base flag for imx93
Thread-Index: AQHYftQVxw3sppS650SYFFwqmU/2sa1k5Q6AgAjxNaA=
Date:   Mon, 4 Jul 2022 06:04:13 +0000
Message-ID: <DB9PR04MB8412F8BCEA28371979965D3987BE9@DB9PR04MB8412.eurprd04.prod.outlook.com>
References: <20220613031854.1571357-1-ping.bai@nxp.com>
 <CACRpkdZSUYpMeod7kmF1QgQ9YjzzbVnoU_fZ6RcwKDe_1n61tg@mail.gmail.com>
In-Reply-To: <CACRpkdZSUYpMeod7kmF1QgQ9YjzzbVnoU_fZ6RcwKDe_1n61tg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0da3598-8797-453a-7240-08da5d830509
x-ms-traffictypediagnostic: DB6PR0401MB2295:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +iiAJRVVP8v+VbQKjpfLjgZbuJtSiu0aiDSDBtUM5olyzKzxRpvqfdd2/9zAAOMxtVg867kqj24OFtPBq1ydsXSZBTF1Cd0XrIniCG3IKHYtKijfINEg+fDvW5guLrwAmSQ4lhx+k7i/Ym1pYduHx3VfE+9u4JEio9eQQthsTQia34aTFhaKh30QlfKUCqDBKf0eXFsuHPgtlrdIUq2ZqvJ9CdKGAdVDwQZOOC/Ut+ZQf6eVLRR14wgRPL/spG+/RfygiNqaUJVF2tFkTZXEa2hgabFz8se8nuoYABs83wgQaeVlSjuY/MFD6BHWjgLI7hDB1fFukWEiUzBM1k0CguMDxZ26f++/b05cs84T9Q0/fWfDsuQXt58qE+XO/jXJj4UZehbUnalKixxkevMs46sXHH2t3migusvJjNZ5YjbSUInBI28HqE6jetXxqSoQAXAT/1paKSK+BjWmTmMQK0E5C+g5stoEC6usiNRXE6tFonkmhuJAG/BjKgjG9gOFJv6h65mc0GVgie0Qy5PEScj5f2kOmXTgVzG5ihqKZY0aBYlBPFyjDSnVwJ8Yt8UL23DtoIKwmqmgVkvACn+UnxZKiMxtiK8+mx4UNK+hPbCFYgEA0LtMVtNHALzFRn/AQO72sOT7w9ajOWxvATxY7RcD2TDwNzbjOHPXZNqvLdYO7I1wkRUeJz6/HbWV90mppV5v4pfheEiWlQvx4PX3QMwUZ3Jr2DJYIfLElCf5uQvIkyTnQjnmZYV7XO52ealNFzDlh+/WB/2rEftVXNMtKAk/5r95kFUrdm1Gslp+KsHn5qarrV9hSsMNorQSIAmq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8412.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(478600001)(4744005)(5660300002)(8936002)(52536014)(122000001)(38070700005)(54906003)(110136005)(316002)(33656002)(86362001)(71200400001)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(83380400001)(186003)(9686003)(26005)(53546011)(2906002)(38100700002)(41300700001)(7696005)(6506007)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWxpYkk4RHdSMldsdmNWS01PemxJeUh2dEVqWGZzc0V0bnY4Z0pCdUdyUG1x?=
 =?utf-8?B?UDdaL2pRWWVJR0wrWmpad0ZlU2l1OGxVaWJvM2lSK3gxYTJZUmZpTkpyL3Bp?=
 =?utf-8?B?Zm5hSGRKYXpyRVQ0bUNDTHdGOFNvYWpsVWdmVGlkSE5wbklMT3RldWd2ZHVY?=
 =?utf-8?B?QTZKRHJWSUFuWWM3UzZ2QWp5d0Rsdm9Mc1hieVZsVDNzT1JJbXUyMUtndm9B?=
 =?utf-8?B?bHU5WkNlaWd4N1FGaHZvS3VSejVmYWtBSHhQRy8xdDlSclVPNzZJQUNVdGhY?=
 =?utf-8?B?SiszSG1DYmxPMC84Uk5lcThRODQ2YytsOFA1L216VXBtNFF5cDhMQS9pTE8x?=
 =?utf-8?B?SWJnZ2dCd3lLQXZDb1M0djlRMDhJcDVwcUU5SGhhZDByYTFySGJzTURNSURa?=
 =?utf-8?B?ZUIxMTE2ODRpRkh2Vi81dVJnckEyRlA3OWU3K21rTCs4eGRzVTRhOEt2UXVW?=
 =?utf-8?B?c0M3TVhwYWovd2xZZ1NOVVdNeUNmS3FhbkN5QXZFQkNwTlBWRlJNbWNQSTJI?=
 =?utf-8?B?R2wzYjc1Q2pWbGt3SElFSkxXRlExY3ZEaGNtUW9PR1RiKzVvdHNybGR1NDZZ?=
 =?utf-8?B?RU5hM29LSHJSYldPZ3EyUVQ3WTRGYyt0NjBhSDhZcTl4UmFxWUgrMXRPdGpx?=
 =?utf-8?B?SG43bHpqTm9aNFZqZzVnbHRNUHY4YUVqSkVlNm4xK3hNWVNqZjhCN3Q5T25p?=
 =?utf-8?B?SmNVeVJlelFrRmRKZ3dlMk9USDAvK2dMMWU2bFd4aThIUmZUYVFuRGl4Q0dK?=
 =?utf-8?B?Z1d5YWZZOVdlN0w3NTFQcjdTdnlDYnZua1M4M1c2dE5NWVVEV3U3dWg5Q0tl?=
 =?utf-8?B?QkQyVHZ2enZmVFJkRDBPZGV6YzAvd1ZlWks3aDZrS25tb0RrMlNtclhjaVps?=
 =?utf-8?B?VjJmY05NK2lEdW1aUEdzQ0Qycy9GcHFNRVBoWVRRRmxyQVlpeTlQR3hoZjhN?=
 =?utf-8?B?STRYQ01Eay9zNkJ2K3JBTTc1WnhLWmVIZWlYOS9Dd1JSV2FTTlhKZXVLM3Fz?=
 =?utf-8?B?SDE1anRrcXcwTXF5RmxMSVUrZzBzb3J6cVZyK3JEdDBrc3A2SUFHSUtBbXh3?=
 =?utf-8?B?ZmNiS1JZL1VqOVh2b1hSaC9jckh1OVR4WDFwSVhkRW5LZUN2bFdxYW5zS1ZQ?=
 =?utf-8?B?dy9xbjZ4eFVZbjBoTXJQSER6Nzk5WDJPZkJVVWNtWFJWeDlISldqYUZ1MDFZ?=
 =?utf-8?B?Z3laNDJHaVdyUzRCdjBhdmxVYlhuZktqVHZnckZKZVdaYmpnb1BJbVdnakd5?=
 =?utf-8?B?clFYV0lxK2hCVis4S3RNcjF3WVRSSzZpVG4xV1hiS1plTE16WDQzT0VpZTFp?=
 =?utf-8?B?OHJGK0NFRWVLUXF1NFJEM2hKNTExTXZYNEJ4NytmbWFkM3FrRkd1Vk1qdU45?=
 =?utf-8?B?dXhOWjBxQVIwQVgzbGZpUmZ1TkE1akg5QlhXYnRxNGgrRzJlcXV4WDN3czhM?=
 =?utf-8?B?ZDNjMFF1aFNqd1JEZVUyc3QrTlkzclYydHYzQmk2UE4xUVVsY05KV21CVnBY?=
 =?utf-8?B?NkhxempRK1h5ejhIQzZ1RDVscmVIWStkd2NsT1U0T1BIK1ArcGNOV0F3ZlY4?=
 =?utf-8?B?SFRWRmpaS040Uk14LzZvR3B2MGlaNDdoMXZ3ZnNTNzRkMGlhZlhXL0oyVGth?=
 =?utf-8?B?Y2hHUGpTMmlsU1B3cEJUaGRsSjVmekdtQnUxdFZ1RlU1NStBM3BTTWtPclh6?=
 =?utf-8?B?aXd5U1A0ekJyYmNpSFUzMDRSb1Ewc2VmUVpmNlUrbU5vcXJhVFVhaXZuNHFj?=
 =?utf-8?B?M3FuQkFIdlFkUjVUb0U4YkZKTGVZN1EvanpoOXNyTzZYMjJUUnlmRWdwQmIy?=
 =?utf-8?B?WUE2YlVxcWdEeExvY1BJMGRzcUhKaEt0SXZFZjk2YnJaMGU0THBTRGFPWnhF?=
 =?utf-8?B?b1N1Q21lUWh5RHJqSTlIaVVjTnZ6OEEyZXVabjhwbW92eWFUN0tZdXVvcUZz?=
 =?utf-8?B?MkVrd0d5VTA2R2NqTVUyMndzVjJuZVBkb2Yzek1XbzVKZ3pLVlM1d2dMVWNH?=
 =?utf-8?B?UklBZmpRU2dKOTVnMnhOQjJzYzFyOVpyKy9seTgzcno3dnBud05ta3hQWEZt?=
 =?utf-8?B?Z0dqSXRvQys3TTFrVHlEMHk0dFNGa3dDcnkzeElLSURXekVIUUp6a3dmNkNO?=
 =?utf-8?Q?3ITE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8412.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0da3598-8797-453a-7240-08da5d830509
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 06:04:13.2638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llAa3AqrL3fiPZ2CppQQa5PkRJZad/dHtnlAuz49qdIG9SrCM4BWmgjDane/XAI1ojVMdNiYS8djYimfeiUyeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2295
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBwaW5jdHJsOiBpbXg6IEFkZCB0aGUgemVybyBiYXNlIGZs
YWcgZm9yIGlteDkzDQo+IA0KPiBPbiBNb24sIEp1biAxMywgMjAyMiBhdCA1OjE3IEFNIEphY2t5
IEJhaSA8cGluZy5iYWlAbnhwLmNvbT4gd3JvdGU6DQo+IA0KPiA+IE9uIGkuTVg5MywgdGhlIHBp
biBtdXggcmVnIG9mZnNldCBpcyBmcm9tIDB4MCwgc28gbmVlZCB0byBhZGQgdGhlDQo+ID4gJ1pF
Uk9fT0ZGU0VUX1ZBTElEJyBmbGFnIHRvIG1ha2Ugc3VyZSB0aGUgcGluIGF0IG11eCBvZmZzZXQg
MCBjYW4gYmUNCj4gPiBmb3VuZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphY2t5IEJhaSA8
cGluZy5iYWlAbnhwLmNvbT4NCj4gDQo+IE5vIHJlcGx5IGZyb20gbWFpbnRhaW5lcnMgZm9yIGFu
IHVyZ2VudCBmaXggZm9yIHR3byB3ZWVrcyAtPiBwYXRjaCBhcHBsaWVkLg0KPiANCj4gSmFja3ks
IG1heWJlIHlvdSBzaG91bGQgYmUgbGlzdGVkIGFzIGNvbWFpbnRhaW5lciBmb3IgdGhlIGZyZWVz
Y2FsZSBwaW4NCj4gY29udHJvbGxlciBpZiB5b3UgYXJlIGRvaW5nIGFjdGl2ZSBtYWludGVuYW5j
ZSBvbiBpdD8NCj4gDQoNClllcywgSSBjYW4gaGVscCBvbiB0aGlzLg0KDQpCUg0KDQo+IFlvdXJz
LA0KPiBMaW51cyBXYWxsZWlqDQo=
