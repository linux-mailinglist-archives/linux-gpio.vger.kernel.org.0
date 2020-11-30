Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414A92C7D12
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 04:03:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgK3DDN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 29 Nov 2020 22:03:13 -0500
Received: from mail-eopbgr20044.outbound.protection.outlook.com ([40.107.2.44]:64002
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726188AbgK3DDN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 29 Nov 2020 22:03:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfO6k8FDd0FAd1mhlz5UJ3OWvaZac1FFOl8HEabTInGbnaBgWladHBXSrUCtJ9MruKhgbW0u0oryLVpHeRYSzdFpBWGRHS4+0mgeNR+lyd9Tp4gYqfZMEfo/pND64TuiyieaQdkUZppXE7QJ5JuoyEINpR3gEkunRHYvs4jf/g0tioaPLfkzNvUR2Tz9MGWFv9jbW02uJSqZClKGGMTZzeRAPTOdZv0IgEyr++fT0XnWMjSeE3vAaRQMtLy7/W0ceFwkSd1NE7De6va258RF3zVKuwptWzEnZnqL6l4O/A2tckpJulO+qWm07z4NPWlP1+T4AklJU5E8+5JkkvXrng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXWEvwIrtvN/qZOK/WzVdzH9Ox6+iRkuZ51zhjwYaco=;
 b=XqP6q/0O3sn8tcaIlmUDYkTDOWxEiWnVS1SKFNRYe9pCvwNDudJBqfhnYq3Dt8HwvWVp1cUZ1tU+vLSR5svR0QkNArXQ+nAdMJ6UZncuQjkM7irMGD3dlGUFbrycU1m2tHoJRdv2lzt4JnjGR03cRrLdS6drd5EKNjrzxVdN8JDTRpOvk1PnIufyiK0ZeWoMYSkbg7v2pxDaz+jESnRpJerHouBxN3J11n9JJ56LdWulqeL4FzmuQKBvG8AF5PQUNl4ZidvJLD0hz3o31Ef7b0IYZiD7wfP7+kZUfCfG/jBH2dGUZ63kAfdOa8nxz4fYqpHffcRi5vfgdEFxWZl9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXWEvwIrtvN/qZOK/WzVdzH9Ox6+iRkuZ51zhjwYaco=;
 b=V2zHiD4xdUzI0CYQGHjjUOKefGjZAxnZtDXC3UgKEe49u51E66JXu38VjQDA/UKYIwyiY2AvR8KSHCzZRAOQTtlkelLKeft1cnPjgKFCgBcTm6ZT81fk/dd2tjteF6nR4y6N28wkJKD9FG9TPDUxDLhj3syL+3CNaTeCyz6RCjk=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR04MB6645.eurprd04.prod.outlook.com (2603:10a6:20b:fe::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 03:02:23 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::3cfc:a92e:75ad:ce4a%3]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 03:02:23 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Louis Rannou <louis@enlaps.fr>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Louis Rannou <louis.rannou@enlaps.fr>
Subject: RE: [PATCH] Documentation: pinctrl: imx7ulp: fix incorrect pin CONFIG
 settings
Thread-Topic: [PATCH] Documentation: pinctrl: imx7ulp: fix incorrect pin
 CONFIG settings
Thread-Index: AQHWxM8II9ZBtmWpiUytKWLttLxzB6nf/9UQ
Date:   Mon, 30 Nov 2020 03:02:23 +0000
Message-ID: <AM6PR04MB4966C9E604748F7749DB0DA580F50@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20201127150625.1767408-1-louis.rannou@enlaps.fr>
In-Reply-To: <20201127150625.1767408-1-louis.rannou@enlaps.fr>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: enlaps.fr; dkim=none (message not signed)
 header.d=none;enlaps.fr; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba6174f0-1793-4a0f-2d55-08d894dc5c45
x-ms-traffictypediagnostic: AM6PR04MB6645:
x-microsoft-antispam-prvs: <AM6PR04MB66457B95E7472F959D5019D580F50@AM6PR04MB6645.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EQiSCNPC/Vvs9facGxEm7QCvdif50kNnyBHYk53wnrTI1bRtLzOebwcQCSv4i00hKfjbG3Ktu6D5sPhItOky+X0n/3y5GVX6Lf0roCSNRokiHuX5OPV3SC0F9yyDbPnnx6vjerjrWFPlpbgOVnq0wBrMYh7FTBmiPT3kyuI58oEIk6wjHIYvPxcu8JdWfKtcZbAI8s6QiFjZOmH2IOtfqTonUIDUGcv/uXfg1STAGIIAs8XTk/jwY5f/FOk8ZHBhiW+3yHsZ/Suw24Oq8pVbSHjohwuf78niFplI42kRmpY0mpAtZweh/J+eWW4FqQNFkHXxuV87No3oWSb27QOyJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4966.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(4326008)(71200400001)(66476007)(478600001)(44832011)(86362001)(8676002)(66446008)(66556008)(8936002)(5660300002)(64756008)(76116006)(33656002)(52536014)(9686003)(53546011)(2906002)(6506007)(316002)(26005)(83380400001)(186003)(54906003)(7696005)(110136005)(55016002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RzNDeDZVclpoNC9hck1aVWhNcElPNDRuTXlkcFBUVWxzSWc0QkFXMHk1NFdW?=
 =?utf-8?B?VEtSRkZSSnptemNBRkhuV1pBT1g1NVRTVk5TaTFBODhJQzk4Ni80OTQ4M1pr?=
 =?utf-8?B?UXVzZjlpMG8wMzJ2d0xianN5WkRxeWxUbGo2ejhPQ2F5K2d4QTcxTEFTK204?=
 =?utf-8?B?ZnFkTFhtbHMwTlVCa2xUNUQvSm1KbGVPTDBndlBscFlaYkxZSERMS3Q3Y0ZJ?=
 =?utf-8?B?a0sxVjNBOGZ1SlFQSWRCK3RpbmxYakYycEx4ZmR4Q3ZMdGFoRmVGeEV2ZEVY?=
 =?utf-8?B?RDRySG1wdklmbjlFdTNpWFJaRW1kY1ZKUjd3WG1DYUh1WFlUUHBEZ0pBTHpB?=
 =?utf-8?B?V3ZFWTNkeENlc2JXdW1xRklUTC9jUERsOFE1RUkwTHZIU0ZuV2tpRXdTMUVW?=
 =?utf-8?B?NVNOWjFBRExVY0tpaCtJdm1mOEF2a2dUS0lKMThDekdBbFVnWWJ5MENaRENv?=
 =?utf-8?B?RGhhSm8zd0JmOFIwTlVxVlIxdkI0YWtlNVNxR1dRVi9VWlpHaENsY3FTMG53?=
 =?utf-8?B?c0VxTVhsc0EyRDFuTXllS25rOFpPaUpFNlVzTHc4ajVzamNLVXlGMGR6Ukpu?=
 =?utf-8?B?SGp6K3M3ZTFvdjMzQ0pWOEZRVmh3ZGNyMVhYS2k4QWIxVGJQQWc0U2NqSEIw?=
 =?utf-8?B?ZGVEd25BbXBhRGlkY2tRaW9XOUVReHVld0JyUkRPU2lqSndDUzVPRUpZVWFR?=
 =?utf-8?B?bzlTNTRJZWIvQmdxbkFYTmRBanZqd2lkTGRZT3pqY0FPNnlxaTZBOHhNcGlT?=
 =?utf-8?B?a0FIZUtSa2tiSjg4U21Eai9OcXhVYm42MzhwOVNhM3dvUHpDeVh3N2o0OFVV?=
 =?utf-8?B?Rkc4UUQ5dlNWRkd5cUgrZ3JPQVlrNmZXWXJRSTdiYW93aUJlSGFvM1llaEFO?=
 =?utf-8?B?ZnR3NGFhQU56bjZOdzZmbVBIa0NwMVlxUGluY3haYzFPSmFJVEVHZitKY0JW?=
 =?utf-8?B?QVd6WWp3ZHJMTkp5V3lRZzkrWldJY1ZDWU9pN3ROYUppYjhTRlllS1NDdWF6?=
 =?utf-8?B?OE5XOXV0d2pIVldwbkw3U1YzTEt3SjVXb1J0eUtZTmFUampEcXNFZHdOKzc4?=
 =?utf-8?B?NVNTcU1oK0MxUExvMXZlWUUyRm1Od0YrVzBPYWVzMXBxSk1WZm9CdlZlMk9l?=
 =?utf-8?B?MVMySFRXdlVQQW9mTnhHcUw2czUzZEs5STlkNzNMbmtreGRBa25tRXNyNlY0?=
 =?utf-8?B?ZzZLS21OdGxFblpDbkQzY0xTL0E2RWlkeDZvR2FhZkdMWmUvM1VZUzJaMUhN?=
 =?utf-8?B?aXQ4Nlczd1dhbjJ6SWZ6UWxsSHpGbXlNZGZXNmlHeTRxM2JjU1dGN0NIQTdt?=
 =?utf-8?Q?7aCBFxmOIf1cE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6174f0-1793-4a0f-2d55-08d894dc5c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 03:02:23.3279
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OBUinGT9Ir/g5gtSS2BL2kI/qmYbRTMH/8gFAZeur/7QdPfgJ1DEPuRA0c+4rZV78tWKNJ0hvDRp+xclfY2JKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6645
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBMb3VpcyBSYW5ub3UgPGxvdWlzQGVubGFwcy5mcj4NCj4gU2VudDogRnJpZGF5LCBO
b3ZlbWJlciAyNywgMjAyMCAxMTowNiBQTQ0KPiBTdWJqZWN0OiBbUEFUQ0hdIERvY3VtZW50YXRp
b246IHBpbmN0cmw6IGlteDd1bHA6IGZpeCBpbmNvcnJlY3QgcGluIENPTkZJRw0KPiBzZXR0aW5n
cw0KPiANCj4gQWNjb3JkaW5nIHRvIHRoZSBpbXg3dWxwIHJlZmVyZW5jZSBtYW51YWwsIHRoZSBM
U0IgcmVmZXJzIHRvIFBTIChQdWxsIFNlbGVjdCBGaWVsZCkNCj4gYW5kIHRoZSAybmQgdG8gUEUg
KFB1bGwtdXAgRW5hYmxlKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExvdWlzIFJhbm5vdSA8bG91
aXMucmFubm91QGVubGFwcy5mcj4NCg0KVGhlIHRpdGxlIG1heSBiZSBiZXR0ZXIgdG8gYmU6DQpk
dC1iaW5kaW5nczogcGluY3RybDogaW14N3VscDogZml4IGluY29ycmVjdCBwaW4gQ09ORklHDQoN
Ck90aGVyd2lzZToNClJldmlld2VkLWJ5OiBEb25nIEFpc2hlbmcgPGFpc2hlbmcuZG9uZ0BueHAu
Y29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQoNCj4gLS0tDQo+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL2ZzbCxpbXg3dWxwLXBpbmN0cmwudHh0ICAgICAgICB8IDMgKystDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvZnNsLGlt
eDd1bHAtcGluY3RybC50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9mc2wsaW14N3VscC1waW5jdHJsLnR4dA0KPiBpbmRleCBiZmEzNzAzYTc0NDYuLjUw
YWUyNjA1ODFlYiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BpbmN0cmwvZnNsLGlteDd1bHAtcGluY3RybC50eHQNCj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvZnNsLGlteDd1bHAtcGluY3RybC50eHQNCj4g
QEAgLTMzLDcgKzMzLDggQEAgUEFEX0NUTF9PREUJCSgxIDw8IDUpDQo+ICBQQURfQ1RMX1BVU0hf
UFVMTAkoMCA8PCA1KQ0KPiAgUEFEX0NUTF9TUkVfU0xPVwkoMSA8PCAyKQ0KPiAgUEFEX0NUTF9T
UkVfU1RECQkoMCA8PCAyKQ0KPiAtUEFEX0NUTF9QRQkJKDEgPDwgMCkNCj4gK1BBRF9DVExfUEUJ
CSgxIDw8IDEpDQo+ICtQQURfQ1RMX1BTCQkoMSA8PCAwKQ0KPiANCj4gIEV4YW1wbGVzOg0KPiAg
I2luY2x1ZGUgImlteDd1bHAtcGluZnVuYy5oIg0KPiAtLQ0KPiAyLjI5LjINCg0K
