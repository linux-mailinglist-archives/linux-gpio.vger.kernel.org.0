Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E0D3BE5CF
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Jul 2021 11:47:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbhGGJt5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Jul 2021 05:49:57 -0400
Received: from mail-eopbgr40071.outbound.protection.outlook.com ([40.107.4.71]:4229
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230429AbhGGJt5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Jul 2021 05:49:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZPsnRTN4E8XRbMh0j4xX2TH/LxrW0eXk4v8uKWFdeYcSAdnIc6e3YeyoYhBX1yGsXVlGHSdhuA7mhAX0zFdC9qA+mGl61j8UA0vkp3qFe7jcpNesYkaU0HAnnwXZdY4NGv/m4XgkXI0higYhHzAED822o6A+nW/+Pu6wzVSZin/TAzcYxPlVRruEFhWee38JdHf5mfz5NcyxC/Pbb+0TQ5Kaoto0VkAqxiM54E0CMrUR2QNyelC31IVoiWyPmwBybXOla0gdx8yWXCbbspxDfbMSYCQQ8cqGR+q/saolqS9mmyOIpKhhfEepohvKFawpgP5vI7n8OO1V95WH/x8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td7VJtdkzYBCrqxHmTtX46lf2bQlniiYvGcwXtmobKs=;
 b=hY1wm07+HLJ5nRTfGjcH0PZlUomEj4X6cTdDp1+92IgmlVz5Sb4pS5KFpRwavedkosNVjhpUArzRLAFiSisfShHEwqglYp7KGzN677mGt2gMdqR3766DO8WY/UoY7MpFArsIBMBf+ZgVS0CgDfO+8UIQYuBTVCGrLowsg53k6I7fG87AUuU8rMZBfIVJ9CHQd8fkGLjDac5Jak5nPz9QJzRqyNAsP8BMgatmw0uzPetNXUgVLskNVjszhVfp64OhHMwibrRn66ShFhYyLiAaCw5PiPQ6Z1XHzlfhmsTWPYemdbJBU9mlcAcadDgCUtLAA5eta0KZK0xBQRl0tbOy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td7VJtdkzYBCrqxHmTtX46lf2bQlniiYvGcwXtmobKs=;
 b=OdPt8gMs/Z8we4Z+DWWpXrr0gLLLYN/psQ1g/lNtUOyR/esfuuXTOKO86dovWphTBAJMNcx1shSu61U+Kbpqs2E9YyVvbMunVpLwAXSCwM7wbCYcrh2ARzBU9oRP+pKBHo7ezSiQdTbDjfgCRKwee8C2iyilEFR3pko4ufXyy3s=
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 09:47:15 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 09:47:15 +0000
From:   Aisheng Dong <aisheng.dong@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: pinctrl: imx8ulp: Add pinctrl
 binding
Thread-Index: AQHXW2Jt7SM42fNmVkqHAkQvi/BfF6s3cz1g
Date:   Wed, 7 Jul 2021 09:47:15 +0000
Message-ID: <DB9PR04MB8477578464805587D35CD639801A9@DB9PR04MB8477.eurprd04.prod.outlook.com>
References: <20210607061041.2654568-1-ping.bai@nxp.com>
In-Reply-To: <20210607061041.2654568-1-ping.bai@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba74715d-7c02-4402-e321-08d9412c3424
x-ms-traffictypediagnostic: DU2PR04MB8536:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DU2PR04MB853690641511F160ABB23498801A9@DU2PR04MB8536.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +jWrrN8G353opiDHo1ax8JFSQoyh2FSjMhnkfejDn/cGBoSazJN6IAqJOZYDeSfwOoHaA70F0MelV2GuctxdoU0BDCxrQtcqAWit6VvrCkbgdbar9+MB3inctjNHqGOQjvmnp9URgouPFxgBf+tVFMncAoTxjLTM0g3QPXhlbzGWI46WO5G59duKsCob6lkvkcDASLt3zr9fUZtdjUqQxnC/UQH0jyJ7LOhN/HocKYNat7sPUEy+5oOdnDQHSmHF7my/UwEkyWP+RB8iui8zpG/GPf0+/tzl27Uex7q2ImmBlxPcjPWePp7Hwj8McEXgIZ6Ct0Vi/j43bYNqJTvCi0FtsnerIHUbyUluXpdkJZUPd+K7S3aZumbDhMcZTChTsPDhN1uyboS1nmw/yH50aBRbTmgEwqOzd1zcLokY4Ei/CQ4q/vfdGuaHC7xJWVQKkvUGTF0jY2nAb27o0g0kBxS2R2wv7m1vl4QerHmReeWv98zqfM4eff5yEJJ5Mn4WjKAvyrbo/7FX43ZRgCK8JMwGVH8Pdcfqw2VwfD1/AlbYfFr7cnHp/49F0Do3S0+P87ggRdhiHRK7GWtRLK55KEhBTo9NLmSge0jhbebjx/bX9q0oXfdoVqBITeyCoLyso/TU2hyny2ugKLyQ+ROB6VTpIRY2e3S9T6Bz4xn44rum4t9bL0s1Wt5UNas40xOJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(316002)(8936002)(33656002)(122000001)(558084003)(110136005)(8676002)(478600001)(7696005)(4326008)(38100700002)(186003)(66946007)(9686003)(26005)(66476007)(2906002)(6506007)(76116006)(66556008)(55016002)(54906003)(86362001)(52536014)(44832011)(71200400001)(64756008)(66446008)(5660300002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckFTYUFzeGZ5NDFWYVAwY1BoQTFvU3JLSDBBbGtSNjhmM3hxVnpKcU9ibWJC?=
 =?utf-8?B?Z2g4T1A3OXBmWDNRYnoxSnVCU2tnK3lvMjRUNkRabE96K0R2MkZieE5MQzk3?=
 =?utf-8?B?alQ4SEhySVVTdU1ENm4wV0RFLzhoZWsrTkpJRVVIS085aWpJdm5MbVJQUklG?=
 =?utf-8?B?VTIvV1JOOWhaVDYycXMzWTEwUWtZSmVJRkFKbzNqYkxtNDNrMGJ5VjNCczN4?=
 =?utf-8?B?eUliYUVZS1FPRFloOVNIWElnSkIrMHRDdUcxZG4xS05xNElBV0MyMzk4TzY0?=
 =?utf-8?B?a2JmZ3hzVXJXTk12dXUxRFM0MU1DekpEZ2pOUUkwdWhMSFpGTXU2N1BuTjdm?=
 =?utf-8?B?dlh3MWZVQTBlSFRYRnc2Z0FGWFhmdyt5c1hUQ0puckkwVjVBdEVrYzcrMldq?=
 =?utf-8?B?OXNoeVpqcXd0U21CM0JVTDQ4OWk2cE1nbGlQZW54R0xmL05sZFVVM2N6REFT?=
 =?utf-8?B?QkVQeGdUN2U4Y1FwQkVNakV0WkVORGp3OXVFdlNhOHIrSWhoMlRuOCtBbmxh?=
 =?utf-8?B?anRDOGNaNzhwWFNYcmlETmxhQ1NQbVZkY21UU0xZSnRzSnZUcDIvTWNFV1Ex?=
 =?utf-8?B?Nmw5U3gzbDNSYUZTZndnRkRMYmNrc0U0RVBFZjR3VnJuTGxVQkFaSW8xN1dl?=
 =?utf-8?B?OTRXK1hYNzV3UnhVMW9MblBQNzVJRzVmakdXaVBZajhRcjY4Qm9WSzgrc2Yz?=
 =?utf-8?B?UWRlNEVjWUQ3NDJqc2xWZDlCQWxSbTZ5Q2kvalh3NW1rbHV1RThxSTRxbzJw?=
 =?utf-8?B?clJOd2pVVUptSStTVlhVaStwRTN6cjd5Rm1YR3JldWV5aWUzMkVua1pZMUht?=
 =?utf-8?B?RTlFNVRuTU9QUTB0K09SZ2JnVFAwQW9KMUUvQUlvRHJvM05DemN5blhlTDlF?=
 =?utf-8?B?L05zb0ErTkd0MVNUT0tmRUZlUDY2eTBUOEs3ekYyYUs1QkFkN3BEbTVvNXdO?=
 =?utf-8?B?eFVhRjA2eXZBSlRNZ1c2WnB5cktITk5OQTFaUWg0aGhOZElLZ1FjckZGQ2t6?=
 =?utf-8?B?dWl2RW1LTytRYmNILzdncjVPZDA4aUlmMTZHdEpwb1BnWkpUY0RBR1RObnFZ?=
 =?utf-8?B?K00vM0RaOEZ5c3dxM2dIY0cvRVJJVzRubmNPUVhzNXEwUTlHc2Rlbnl4cExG?=
 =?utf-8?B?YTYxeGlQUDJuR2VPT0dNWGN0VkErSEwzNERNVDNFcHdIV05SOTVNaWxzTGpn?=
 =?utf-8?B?QkQ1dlpjYjJmMnpXeGJyZTdicU1BMFN5WFJpUldST2xnTmk4c3J1NDYxNXR5?=
 =?utf-8?B?V28zUm40anhCTUtuM1k2QzdSYVRmUEU1MzkwOW9WVWZKcFU3cE5QdHdYMURW?=
 =?utf-8?B?WGM0Zmd0aUFKczhtdFptUXd1Z2toRnc5QjRCdnF6Zlp4SUIzSHdOcVBrVDhy?=
 =?utf-8?B?aWRPWVhvQ3pLM0dFeGhGc3VVOUJsRk5HVGJCKzZxY3ZTUzRQMThJMVBhUGpN?=
 =?utf-8?B?eUNzMUtLVHAxanZRbTZyMFFaVDlGQnRHVGxyOHlOTHVZRlBsdHRadWxoUDlD?=
 =?utf-8?B?eDVqejluWHpPczFxbzJDcEZTZ096OWp6TVloQ1pPN2VUM1hKNVpFQ2lzRlYw?=
 =?utf-8?B?ZngyNEpPM1dBRGxRcWphK2svVFVkenBYdld2V0RBTzVBYkkrWndIdDAydGJa?=
 =?utf-8?B?TmpjTzgzRmt4dlYvTGFtSjdab1ArL1B0U3dHRVd3Y3JwYmpsRWcrVDNPQkMx?=
 =?utf-8?B?VzlJaHJuaDlmNFRwQi9ZMFBTdE8xQnBONHdYYURXbzBEbjFsOWVteVRqZCto?=
 =?utf-8?Q?om40Lel/6vd28NUb7g+zt6GQ2Ykh46IqR0v3UjA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba74715d-7c02-4402-e321-08d9412c3424
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 09:47:15.7909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P+AZWqNp026dcp69Zk8IM9afAKDIRl7ZelEOoZSjma6+WDS6TeGJcsf+vWeN9ku+61kxnKu8To73gd4n1k4fYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8536
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PiBGcm9tOiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVu
ZSA3LCAyMDIxIDI6MTEgUE0NCj4gDQo+IEFkZCBwaW5jdHJsIGJpbmRpbmcgZG9jIGZvciBpLk1Y
OFVMUA0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFja3kgQmFpIDxwaW5nLmJhaUBueHAuY29tPg0K
PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQt
Ynk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQoNClJlZ2FyZHMNCkFpc2hl
bmcNCg==
