Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B394601092
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 15:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiJQNzE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 09:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiJQNzE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 09:55:04 -0400
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2072.outbound.protection.outlook.com [40.107.103.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C03F36416
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 06:55:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geD81doqbwAKPrCd7QIXTwL9k/4W1q2E/Mc6MLsIGK/DteElL7XBdJJ997bSk4ONbFCPqy+ZroXnKvqyExJ/BRSiLmNyxpgJAjnk8Ow/Y7Dv6JPobqVWiYIyxeYdJkb/ebV6I/Z3UMV4XZEdR6VcNEEhpt2Osq/7CgekXpJymJ3lmrEwGw0jqTf32FSs6kMhDBdPJuDq8oFuCchdXgctbpcS1tsmX1keumnE2CnWnf68wf2RpkEyPoqMWD07HrYESgdZ6CkS4gtMgTT6v15kI9ALw+RDQDEKcZWb/2vtu09vbD8bD2cEqngw+ucrXBb3F6fX3QF38Z7/rf5jFTJipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pc+HBG+/1ue/j02k+ZVMQiqRB8uq+65O737FE4VBZIU=;
 b=hdsY0oDTPwA3FGGfYV/LO0G7QgCa4Ugrf9hc0Z/5UGGESoFEjKqT1niajQh1xOU1TbSIXRb1NNcO3CCSA2vmzzLdJtelJnpDSEGuW2KcSkEyaBmqEQiD/kLuCzLY662o4SUnGtLmjJOyuAYfz+NE2qA18D/KhfgryKGTcV9f1r4JnRsd7fQHvRZ2ZemUI6Z0pR2YJ46xMkUS8I8Inyd4OwEp6cT7shx/3XTNo4NJfj+YoqIylgHV9FLObwF/E5JKcTZF0mobVOcGEqobCdsceVP84kPuEsFeSWKevOnARp8nCuJuEsp+lDCdChkFGRz1ENRJYN4j/h6BUMbPB2AwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pc+HBG+/1ue/j02k+ZVMQiqRB8uq+65O737FE4VBZIU=;
 b=GfHXuFOogrlEUbRhwvwOCJSgOYQKdIAMm+31RhTzrW8KfTgZ1lruRYN7Vysdvmrghaoh/HVdggGqJjHVpyJnecr9kqQKVJsfzn/efW0+17N5NQtK1fCs74I0Wmi2uLvyMmZdyYg/dFDRpliJQQPYiULYKgrK6fud+0bYwkccnhI=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7662.eurprd04.prod.outlook.com (2603:10a6:102:f2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 13:54:59 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4150:173b:56ec:dc6c%7]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 13:54:59 +0000
From:   Shenwei Wang <shenwei.wang@nxp.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>
CC:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: RE: [EXT] Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support
 for i.mx8x SoCs
Thread-Topic: [EXT] Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support
 for i.mx8x SoCs
Thread-Index: AQHY2mGOiCWmYydHdU6c31ilQ3tOMa4SY+WAgABCMgA=
Date:   Mon, 17 Oct 2022 13:54:58 +0000
Message-ID: <PAXPR04MB9185AE67BF20108CFBF0546289299@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20221007152853.838136-1-shenwei.wang@nxp.com>
 <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
In-Reply-To: <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA4PR04MB7662:EE_
x-ms-office365-filtering-correlation-id: ac4df06c-06dd-44fc-2b6d-08dab0472e45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gXa8zyFhA8lxqKLzTF2jHFbVw1eAV53pKsmqoNIdVpHyVYP+wFUsRFcZ9QHi6+p6qUwIKBqT72q7hWGRPqIubhaN63w8w3h4m9eF3AjpxQiZSR4BeBeUEQV48iG9O7jlt+ZnlguRk6sJXUymC09AZu4XYWUrB1j4dkwXwKp3116xWYVOWKn8NFLXNPtvX6v66NkdesPtwkK8Jnlu/4lx9/j5FN6AL908BnEAukZkVJ/jPGDMHLMmU8VAwsi+BbEeQQERa6nEP8e2q2He8kFJgaTKzvQdfsbmOcq10tGZ0rGXKe3/M33ErZYgV2LNJKLSKlwrwoBD62d2JMGrDbJ8RXs+YQIQQYHiRsEJYxOpXBeqbpgpwQuYWtbp/ugHJwlPzzMqOOVfYyaGE6QGSKBxv58Y0u5olgxJE3RExgk+9djMagKG5ZzFSFPcJH4qDMRls0W/WZzyqfoE9IpLH0GfRI3lcMtoaKonKvY1jcO4xR9r+uVs1dU6L+5ioz7b/0Sx8zvZaSM7aTiXlRAHX9+YXD+ufFl9Qpra0b0FksX3ydxvi93477bFcEtXmMxo1NoPIcrRcZnBLseEDHuPJcCI+xmrFlQXzr+wsT0Q6OXiG3FamcZvNdy6F0M1RWc6Ej9hVvL8VD1wrSNFi7jguyZw7mIH88PyEqQfkKycLsbTbl43sitQ8v02JcgfD9am+42WeH7j3d4VXwup83MzQ+9wpabiAFCT1UbGTdrlCntA7IFiVnaq/ECktmMQo+o+lDnE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(6029001)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199015)(54906003)(110136005)(6636002)(66946007)(66476007)(66446008)(64756008)(66556008)(8676002)(76116006)(4326008)(316002)(15650500001)(33656002)(186003)(2906002)(44832011)(86362001)(55016003)(83380400001)(55236004)(53546011)(26005)(41300700001)(7696005)(6506007)(5660300002)(9686003)(8936002)(52536014)(71200400001)(478600001)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlRyNk54bXJFWmVGTUFYNUxtb1Q0QUp2anh2d1lQRHBzT0ZPMTdpTkVJREE1?=
 =?utf-8?B?MyszWFZiL1Yrc0lQUGVOTUdjbCt4VkRFQ1FVL002aEFIOXpuLzg4NE1TSFFN?=
 =?utf-8?B?QWRlQXJmVFlNNEZHL3N2TGFXR296aGxOSXNnOGpTVTlMMFJjdVE3NlFsd1M3?=
 =?utf-8?B?M1JTZUwyRkYwZ2VHTnQwRVZkY2Z0YVZ5bUU0ZzNBeEVRUVl0azNlYlh4Tm5I?=
 =?utf-8?B?YkdVckJIK1psOUFKODFFSlZRbmV4SU5BYXRoQk9OemJkM1hDSEgyemt5bU1Z?=
 =?utf-8?B?VWo3dnJNWW9neUJSamFkNnhDSE82bDl5V21keUlqK3N2RHUvVStaaDFmdCtL?=
 =?utf-8?B?VElQMk9MSG8zZDVuaW92TllTc3FDaUM4dk1BSGZRcitJckhsWHg0cHM2algw?=
 =?utf-8?B?eTQ1Z3BPeXFGY1JYcTBKQUk5QjUvd0F1T21iUTF2SFNvVVJjUVlxQUJTMndE?=
 =?utf-8?B?VmFnZmdSNkQ2WVZlNlpGblN4WGNUMUFJZzdZUnovYmVJQTI3R0d4cEljRXdF?=
 =?utf-8?B?bUxucjRHdHZyUXhFeHhMV3lUbDAyN3B4QVBESkVmd3NNdFlXZ294ZXpNVkRp?=
 =?utf-8?B?cGJyZUFHVVlDMGRDTVozaHRSZkdpSmpibzVyUm14QjY2cEdHeFo1YjdMeFd1?=
 =?utf-8?B?cXFqcFdQVkR5cTI5WlNJbC9NamxJTkVzaU1KSndERmViSnFqM2dxWkREMWJE?=
 =?utf-8?B?TTJKV1lZSEpVbXgwYU4rcnpnSnljTDJRU1htdnlBVld3cVdZNWp1TldVeURU?=
 =?utf-8?B?dEcyY3BkZTBuZEx6MnBocTQ2SzRwNFJwUjI2Z2JRZUVBSmNIOHBMbU5sN1pp?=
 =?utf-8?B?bDdlQ0IxT0pkSXpnSDE1aHFCZ2R4WlJLbklza3FpNTd2dFRYOUllWUFTTlFy?=
 =?utf-8?B?ZmxhTGtET0ZGRktub25wbTFQbTRVY0M3RFN1YjNsa1ZDSkQxTzNMZ1A1SlRO?=
 =?utf-8?B?b2E2TlUxY00rNTZsaTRTd0czbTJiOTlyaVB3WDB4WmcxbS9ORjZ4OUw4dkNt?=
 =?utf-8?B?UzB4NStXUEJwaFNBaWxpTDBQY0x2U3lmWTJ5YmlKYnhmVFc1NG1jZkZGMEUy?=
 =?utf-8?B?Q2xCUXFOQjVLQVlPTFZkZVlCSHRINEpBaEU0YzYyOXI0cmhZaFZRTnR4WmtH?=
 =?utf-8?B?NWhFaFpJbXhEajJ0N3lqRzZCVklKVmVudU1GRFk3MHZIOWd5QS85WnUvS2cr?=
 =?utf-8?B?cVd5Zi9HZ255UjcxYlgrYTdJSFUxdkRCbmJzZHJkQ2tpVEJWblRSaVVwSnE3?=
 =?utf-8?B?SnNqQU1pQ3R6eWJ3WHBQRmlnamc5NUswSjJnZW9sand0UUZBdkJrbGZ4Ymw5?=
 =?utf-8?B?Rk5KRnVJRC9ZbVR2b3lwYlVSemo1ZXNObkczMUEyMGx0V1IzQnB3bUh2MzMr?=
 =?utf-8?B?bmxFR285UkZHWlV3b0NNTG1RUEpaVE16L1pFMTBtUENwdjQ2bDcxTXdTNE5E?=
 =?utf-8?B?ZlM4NWlCaGpoajNEMExzRVBONW1FSTdQaUxhSnlWSkZTWjdJYytXdGdEcWQx?=
 =?utf-8?B?dVRaZWN1bVpZWTNhQlJ4NklZUTNIZThoYVorZE1jeUg4QjVWT2czZE1NOHg1?=
 =?utf-8?B?TkZDMEtua0RYNTllQ2dFbzNZTmJwV29pM3RoT1ZIVkxoY1M5bkZXS2VtTzBv?=
 =?utf-8?B?VGNVQ0NqajVvbUtjb0JZc2xEMkd5R25VSDFGYWJoNDZ0b2Y3eThNbGRUdW1N?=
 =?utf-8?B?Vk1FUVpiN2NERzAzZjBmM3N6czh5djdMSDlkc09xcDIwRmgyZDN4S0tvVGRC?=
 =?utf-8?B?eXhGdWM2SmxjYlY0cENPKzVDY0JkTDZWQkp0MFdHbkhOcTVtWitmN2pvQlQ3?=
 =?utf-8?B?c2duK3JsWEkveDhXanJ2MkNQdlN0cDhwY1gxKzU3R0JxYXhDWnJBbXhra0xF?=
 =?utf-8?B?bmNXQUUwQ1ROL1ZUejI4RlppWWo4RWdKSVJoTU5sWTluOGVQQTZYU01WMjVH?=
 =?utf-8?B?Nm9iZEJFSlgwU2pXMSt2SnVlL21jcDB3ZGZBZDl4LzdxdWdZblNRZ0Uxa0ox?=
 =?utf-8?B?aUYyVVdxcFZKNGhHcmcxTjB2dzBpRjhCVWhWQzMrOWdCVFFOdWx6anZRSVZV?=
 =?utf-8?B?akxSNENSN0Z1YTR6MHM3NXhyczRDcE9NWDUra0VlNkZSSmMwb2lpOXlQRXQr?=
 =?utf-8?Q?BgBK7xEzS0MU1mDZ2rqn72CV0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4df06c-06dd-44fc-2b6d-08dab0472e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 13:54:59.1329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZl1NVl2DdeVRophV3qiIDuzkioRW8kIUKneFrh2BXzeZztRLVFTC/qWlMJxKQbHzipHd6sAgo4IvL9USxhTYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7662
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPg0KPiBTZW50OiBNb25kYXksIE9jdG9iZXIgMTcsIDIw
MjIgNDozOSBBTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT47IEFp
c2hlbmcgRG9uZw0KPiA8YWlzaGVuZy5kb25nQG54cC5jb20+OyBGYWJpbyBFc3RldmFtIDxmZXN0
ZXZhbUBnbWFpbC5jb20+OyBTaGF3biBHdW8NCj4gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBKYWNr
eSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQo+IENjOiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmds
QGJnZGV2LnBsPjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7DQo+IGlteEBsaXN0cy5saW51
eC5kZXY7IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+
IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0ggdjIgMS8xXSBncGlvOiBteGM6IGFkZCBzdXNwZW5k
L3Jlc3VtZSBzdXBwb3J0IGZvcg0KPiBpLm14OHggU29Dcw0KPiANCj4gQ2F1dGlvbjogRVhUIEVt
YWlsDQo+IA0KPiBPbiBGcmksIE9jdCA3LCAyMDIyIGF0IDU6MjkgUE0gU2hlbndlaSBXYW5nIDxz
aGVud2VpLndhbmdAbnhwLmNvbT4gd3JvdGU6DQo+IA0KPiA+IE9uIGkuTVg4UU0vUVhQL0RYTCBT
b0NzLCBldmVuIGEgR1BJTyBpcyBzZWxlY3RlZCBhcyB0aGUgd2FrZXVwIHNvdXJjZSwNCj4gPiB0
aGUgR1BJTyBibG9jayB3aWxsIGJlIHBvd2VyZWQgb2ZmIHdoZW4gc3lzdGVtIGVudGVycyBpbnRv
IHN1c3BlbmQNCj4gPiBzdGF0ZS4gVGhpcyBjYW4gZ3JlYXRseSByZWR1Y2UgdGhlIHBvd2VyIGNv
bnN1bXB0aW9uIG9mIHN1c3BlbmQgc3RhdGUNCj4gPiBiZWNhdXNlIHRoZSB3aG9sZSBwYXJ0aXRp
b24gY2FuIGJlIHNodXRkb3duLiBUaGlzIGlzIGNhbGxlZCBQQUQgd2FrZXVwDQo+ID4gZmVhdHVy
ZSBvbiBpLk1YOHggcGxhdGZvcm0uDQo+ID4NCj4gPiBUaGlzIHBhdGNoIGVuYWJsZXMgdGhpcyB3
YWtldXAgZmVhdHVyZSBvbiBpLk1YOFFNL1FYUC9EWEwgcGxhdGZvcm1zLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNvbT4NCj4gPiAtLS0N
Cj4gPiAgQ2hhbmdlcyBpbiB2MjoNCj4gPiAgLSBmaXggYSBidWcgd2hlbiBmaW5kaW5nIHRoZSBw
YWQgaW5kZXgNCj4gDQo+IFRoaXM6DQo+IA0KPiA+ICsjZGVmaW5lIElNWF9TQ19QQURfRlVOQ19H
RVRfV0FLRVVQICAgICA5DQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BBRF9GVU5DX1NFVF9XQUtFVVAg
ICAgIDQNCj4gPiArI2RlZmluZSBJTVhfU0NfSVJRX0dST1VQX1dBS0UgICAgICAgICAgIDMgICAv
KiBXYWtldXAgaW50ZXJydXB0cyAqLw0KPiA+ICsjZGVmaW5lIElNWF9TQ19JUlFfUEFEICAgICAg
ICAgICAgICAgICAyICAgIC8qIFBhZCB3YWtldXAgKi8NCj4gPiArDQo+ID4gKyNkZWZpbmUgSU1Y
X1NDX1BBRF9XQUtFVVBfT0ZGICAgICAgICAgIDANCj4gPiArI2RlZmluZSBJTVhfU0NfUEFEX1dB
S0VVUF9MT1dfTFZMICAgICAgNA0KPiA+ICsjZGVmaW5lIElNWF9TQ19QQURfV0FLRVVQX0ZBTExf
RURHRSAgICA1DQo+ID4gKyNkZWZpbmUgSU1YX1NDX1BBRF9XQUtFVVBfUklTRV9FREdFICAgIDYN
Cj4gPiArI2RlZmluZSBJTVhfU0NfUEFEX1dBS0VVUF9ISUdIX0xWTCAgICAgNw0KPiAoLi4uKQ0K
PiANCj4gPiArY29uc3Qgc3RydWN0IG14Y19ncGlvX3BhZF9tYXAgaW14OHFtX3BhZF9tYXBbXSA9
IHsNCj4gPiArICAgICAgIC8qIEdQSU8wICovDQo+ID4gKyAgICAgICB7ICAwLCBJTVg4UU1fU0lN
MF9DTEt9LA0KPiA+ICsgICAgICAgeyAgMSwgSU1YOFFNX1NJTTBfUlNUfSwNCj4gPiArICAgICAg
IHsgIDIsIElNWDhRTV9TSU0wX0lPfSwNCj4gPiArICAgICAgIHsgIDMsIElNWDhRTV9TSU0wX1BE
fSwNCj4gDQo+IHRoaXMgaXMgcGluIGNvbnRyb2wuDQo+IA0KPiBJIHRoaW5rIHlvdSBuZWVkIHRv
IHRoaW5rIGFib3V0IGFkZGluZyB0aGlzIHRvIHRoZSBpLk1YIHBpbiBjb250cm9sIGRyaXZlciBp
bnN0ZWFkLA0KPiBwb3NzaWJseSBjb29wZXJhcmluZyB3aXRoIHRoZSBHUElPIGRyaXZlci4NCj4g
DQo+IEknbSBub3QgZW50aXJlbHkgY2VydGFpbiBhYm91dCB0aGUgcmVsYXRpb25zaGlwIGJldHdl
ZW4gTVhDIGFuZCBpLk1YIHNvIGNvcnJlY3QNCj4gbWUgaWYgSSBnZXQgdGhpcyB3cm9uZy4uLg0K
DQpUaGlzIGlzIG5vdCBwaW4gY29udHJvbC4gVGhlIHdha2V1cCBmdW5jdGlvbiBkb2Vzbid0IGNo
YW5nZSBhbnkgUElOQ3RybCBzZXR0aW5ncy4gIE9uIGkuTVg4DQpwbGF0Zm9ybSwgdGhlcmUgaXMg
YW4gZXh0cmEgcGFkIHdha2V1cCBsb2dpYyBhbmQgZWFjaCBwaW4gY2FuIGJlIGNvbmZpZ3VyZWQg
YXMgdGhlIHdha2V1cCBzb3VyY2UgDQpkdXJpbmcgc3lzdGVtIHN1c3BlbmQuIEJlY2F1c2UgR1BJ
TyBtb2R1bGUgaXMgcG93ZXJlZCBvZmYgb24gaS5NWDggcGxhdGZvcm0gaW4gc3VzcGVuZCANCnN0
YXRlLCB0aGUgR1BJTydzIG5hdGl2ZSB3YWtldXAgd29uJ3Qgd29yayBhbnltb3JlLiBUaGlzIHBh
dGNoIGp1c3QgbWFwcyBhIEdQSU8gd2FrZXVwIHRvIHRoZSANCmNvcnJlc3BvbmRpbmcgUEFEIHdh
a2V1cCwgYW5kIHRoaXMgbWFwcGluZyBkb2Vzbid0IGltcGFjdCBvciBjaGFuZ2UgYW55IFBJTkN0
cmwgc2V0dGluZ3MuDQpBbHNvIHRoZSBwYWQgd2FrZXVwIGZlYXR1cmUgaGVyZSBoYXMgYSBncmVh
dCBwb3dlciBjb25zdW1wdGlvbiBhZHZhbnRhZ2UgY29tcGFyaW5nIHdpdGggdGhlIA0KR1BJTyBt
b2R1bGUncyBuYXRpdmUgd2FrZXVwLg0KDQo+IA0KPiBUbyBtZSB0aGlzIGxvb2tzIGxpa2UgdHdv
IGRyaXZlcnMgY291bGQgZW5kIHVwIGZpZ2h0aW5nIGFib3V0IHRoZSBjb250cm9sIG9mIHRoZQ0K
PiBzYW1lIGhhcmR3YXJlIGlmIHlvdSBkb24ndC4NCj4gDQoNCkl0IHdvbid0LiBUaGlzIHBhdGNo
IGRvZXNuJ3QgaW50ZXJhY3Qgd2l0aCBhbnkgcGluY3RybCByZWxhdGluZyByZWdpc3RlcnMgYXQg
YWxsLg0KDQo+IEFsc28gQ0MgaS5NWCBGcmVlc2NhbGUgcGluIGNvbnRyb2wgbWFpbnRhaW5lcnMg
b24gYWxsIHBhdGNoZXMgbGlrZSB0aGlzLCB0aGFua3MhDQo+IChBZGRlZCBvbiB0by1saW5lLikN
Cj4gDQoNCldpbGwgYWRkIHRoZW0gaW4gdGhlIGZ1dHVyZS4NCg0KUmVnYXJkcywNClNoZW53ZWkN
Cg0KPiBZb3VycywNCj4gTGludXMgV2FsbGVpag0K
