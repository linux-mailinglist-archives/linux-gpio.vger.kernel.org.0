Return-Path: <linux-gpio+bounces-38252-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dJnwLHlmKWoCWQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38252-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:28:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCA4669BA6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:28:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=or6edlD2;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38252-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38252-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 119EA3076B24
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1843F409633;
	Wed, 10 Jun 2026 13:21:34 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64D20ED;
	Wed, 10 Jun 2026 13:21:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097693; cv=fail; b=WpvhHV4aJLodEp6W01AWJPt1R/gtado/Ml2IsWoHD6GgW2GqNM+RwLHiJy/gVt3qLngIe2n9bzCm3czGh/bkpcoSaEGJDlNhJ+VGiIBPTR25A3Y6OC/q4UC/8oDxS/d92d5j8D7lI1WLeQOJWVkW3VqQ2+vn6KV9DuNTB7CEIlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097693; c=relaxed/simple;
	bh=5AN5g4RqUrJoR5lPS3QZp6hQ0rJ5M8/+EXziFuGbpd8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NElxgK82vFXiFs3WVdfWWG74wDjSF4VzIey+JFfXEtjHZ8xTuE8H735uxnd9LgdQ8wIBfbSVJQHIaVFsGf4pnZfaWdvxhIvSPP0GwSrlb8GE2yzwtS7jbl+EZCAS5bXbK/Ez3zALHs4qNmEjrp2GPzivfaWMbc61r2wYwKQ2ZvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=or6edlD2; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIuP8ZjHYuknfq2v1M2Q3LJM4mRsztCTm4Ihq0bLAQtH+SrmEwau9RoDuJkPXNg6BvX0+Pct8/L+sf9vdgjGM0sxi2gJ5jlvBFCNl4pJ2UMMH0qg0QTOzI4U0vJV/4aVLHSlpLa7K6TqwMP+BeJd1uxCec5YgFGDRhH5ra7ktB0SwM4mORit9JRSi3m+D61i5p2QFtASKyUQgQLN3ztN0f/tBjUCLe2wdbZqAHB+a30KWDAI7QBy1tepkrYtRr9g6Lmg6SJSAMdyf7NdtP0EOXX8ySV9/lZP0W2hphtucIHHO1v7HE05ejaaOBBx5PT+PTwrFE2N3aB2biUGERICXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZHAA3hf6Ky+cKk5YvVq/KUgrAsJLG0OcvX5sOj6T90=;
 b=FvLUDQ+QC7j1SOS4pmZfC6FJ186aRMznwXkE7f3rfzI909DdCezyzfxJc+97izfDonY4O6UatE1TQ5F8VZqRejkuz8NCVytFN3cpFI4gg1xSWCZAL9Uak9yY/QRo8SNWj8oik+DMrZw3KS2EN9xtzbOhorrpfKoL9MiUbOvNTgWILfOHvl0OxAozSaKuHekTYbPTYgxrV1CVGicpE+4+rwHKWPWxqIirzuVpmtfR5lapGyF3IWwTdSRDnxZbCWo+tUH9dfFexun6RSIkSCbfYc4QZCicHDI3Ugf8S7+ihYKy+ADXk9gIwqg4dX5bMnUKT9oLKHB91kOdmguxTv0sTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZHAA3hf6Ky+cKk5YvVq/KUgrAsJLG0OcvX5sOj6T90=;
 b=or6edlD2SRdwYhs9TmZtSovFyh6KNTbccxJyxktARMQmS+cT0QBgV0cX3cqU/fW9rR65RUVbZN2a3lgezhGlpnFTKPDWYnXLQ6KjW4pD3KJrSv/Pauoznx4X9i3GH8RtM0XO4UjaeH5JUPnmycSot5nOWLJFgs8hf85qyHzmfJgDKVD1mea9y9G7dv4wu3ZDtRTbZbTmKfFPOuDDBo9u7ufLjfaRSakVtXAn+ENlgUZx2t46VqZ0r4z9vEMQI49q3FnTym+UVlj1pwVkgycwKILE1h6TmZlgK+2CrjD8r8h480Tmh6WxYcodDWRzNlvynCjw/SUm7jkWgV6Ix/XSAw==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 13:21:19 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:21:19 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v11 1/6] pinctrl: s32cc: add/fix some comments
Date: Wed, 10 Jun 2026 15:21:11 +0200
Message-Id: <20260610132116.1998140-2-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0045.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::16) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|PAXPR04MB9121:EE_
X-MS-Office365-Filtering-Correlation-Id: 592ddabc-f1a1-4baf-179f-08dec6f32895
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|921020|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 AImvoILUr13ba/Lqy+6yrW5PHB6SnQz9ZQSBkGVGKNn1VEp1/V3TWAS3px5NS8M6M63ylc+q0YWb1VWC69+lbJG/3ICkVAZL4/BmYiJHFtEAuLTQNcdnWvHMvCqNZvTGWxLyD66mpHMU4sj594LeeB1l/BGpoFQGU6f9a1rVQgFSnO9D4Ul4Tg2DDyeZ6MIxm0pg3unQa+3jwPR/H5UevvwQlLcK/2Swa7bvXilVnKReUR/vCVkWAZTwXVseB9zHGsFMdUdtYM4ZHU61TZtVo4j3fXSQwlVAcPj1fbdddkWhEzO/UYx0bh+cgU4fxHBdFa1n8SlMDzKqqFKUbxRUKGd3L2AADgF0ozkMTOSKxWagHB5jXdSiOzZ5suMLAnNT9yGrSE39sm59WY6qPK6ppAFGpaxWH1FneP2EmAxvuj4tjKtgqnKPXtsBSsNWiWL3l3k+1wl6lnbvn7Bho/1XOa3QI9prjoMXM1Y4opApGJsBDei3tm5Rlb/0ad6klqyFVuig7KzRHnPfYmtgIVrV7jGY+ASi+bWxErQZsYWJ78DpPsZr4DRavX5w08eKKAoeikFxCi7dp72XJ5rs92bEoNZ+0xxblzApSh7DwAJySMglbmZ5O1alUiEUPYBy8gzoGdXW2hrcYyrB82Zb1iVnPzGnv7lYFTtKpcY3FhURFpoNlrvmffMHMyq9+UxR5eXueYLztXZVahHMhCmgz8DxTS6ssFxLIeRpqCNhENKN2jE=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(921020)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N0xCaWFmZTBGdXRWem11OThBWHdoQkVHWVRjQjQwckZLZ04yMUJma3JCUFBY?=
 =?utf-8?B?R2Y1RlV5L0JtRVg3SnBUVWhFbjBRL1dDRUdiWXlweXkyVC9nVzdoaEQxU3hm?=
 =?utf-8?B?Q29vWjNHdGpwUVJVUEV1THM4MmZTaFlRME54MmxUZjhWcTJFelFsWFhadUl6?=
 =?utf-8?B?K0ZKa2xicE4xZXF2b01tcFBKSXlZMEd3anQ0MHBXaG5seWtPVWJhVXJmUXlD?=
 =?utf-8?B?NURzTFpVWWlzWnlzQmw0T09XNXB1UGVYL1JlcDM5ZWZCdWV1RFZKR2VGemhB?=
 =?utf-8?B?UUxnSWJGYUZ6ZnJQWUt4Mi8yUThDZ09TMmx6cFYxdWdTS3dHRFZ1Vjk1WU0y?=
 =?utf-8?B?a2h3OHc1Ulh1cFJPbklnM05TQXNkaTFoTXo2WW12N3JSTDc5WkJpSUhLNFMz?=
 =?utf-8?B?VHhSWjQwNUd0am1ERHZ2OTFNckpEMENydVlGMHpNRGN3dkY4ZzRoSGcydVM2?=
 =?utf-8?B?Z1JyOWUrYXZYK0k1RmFKM3RGUkVuaVR0YXVWdVNibDRZeDlBa0w3WTFmZXU3?=
 =?utf-8?B?cUJFYXZBeXR2enhGcTc3ZVdhM1VvbEM5dHM4MW90NkY2N3F5YU44c0tjbk5m?=
 =?utf-8?B?YUUwcmx4WmZ4SlFqUktEVnpUamNEMG1KVllCZXF1TktJdWNuSXYwSTJaVTdP?=
 =?utf-8?B?eG03Y0s4TjNhQXRpdGN4ZHF3d29vT056RXAvZms2QlBMSld6VmFXVU0xMVVx?=
 =?utf-8?B?S2tydkFacDFDSDROZlRUSjBZMXpYZzByV0xTOVRqbWkzWDU0eVZ2SitNYThO?=
 =?utf-8?B?b0dOWHJVSjRwSGI3b3RpRUF0MllyQjVYalhBdnNVUG8wUUhzdVNsWGFJUWhj?=
 =?utf-8?B?MllXR1VDc294QjNqM0FNSkNoRTJvZG9QaWs3eFo4Ulo2cjNZV1hHSkt2ejJE?=
 =?utf-8?B?ZEZIdEFxUzV6OTZZT0pDZDFTcWRJaVFLUDZjaVo5cklBTyt5OHdBTENFU2sw?=
 =?utf-8?B?d2pwRFdEbll4VWQ3ZVZGUjVtcjBLekZsWTBTbWZYdkowaXlhVjFTeG1qSHhl?=
 =?utf-8?B?TEpNMjBWTTlkWlRHSlUrRCtyTnNkM1JsbWFWbDVaUURMSzErZmY4WVVlZVNV?=
 =?utf-8?B?N2U0aVNjTWZmYkRKeTdpL2dwOWl6SC9YbkZFSTgwdnZ5MGpRQWUyK1p4Kzlm?=
 =?utf-8?B?cDM2a2VmSjFrR3A4a2tXSGZxVEdYeXM5WWlEcitkZytBaUU0ZGFWRC83V1NR?=
 =?utf-8?B?RXd4eUFWd0s0NnpuRnBuRDB4SitTSGd6a09BaVoxbDZtelFvQTZyRDh3SS9a?=
 =?utf-8?B?alVKYWJnQ3l1ajZtdGxFek81VGZUald5VmZZc2RUNHl2Q2V2WVcxNTlLVk9X?=
 =?utf-8?B?THg5Z3A5ckVnTW8wN3RuTndrWWpBYXQ1azF0T00xRTcrQ0hNMG9GQ1dlL0tt?=
 =?utf-8?B?SDhDd3M2WUx5K0kwN2tCbFdWaUVkaXpRaStUUzMzei9RcGJMbk1zc2FUL2ln?=
 =?utf-8?B?TjVraUhMdEJIY25Fc1pLNWJUNXA0ZGluYnRVdExiVjZvR01Sd1gyMnVaZnVi?=
 =?utf-8?B?TTFVNHZjVnF1b2dOcitYNUJ2eVVxc2Rad3N6SUlTQ3RGNnQ1aHBJNkp4cU0v?=
 =?utf-8?B?ZnpEVExFY3dmYlBBK01IK3V4NTR6T0g0ZFNNNGJ5dEJ2Vm1MYXFuWjRCS01H?=
 =?utf-8?B?U0tQMjlzRHhFRGVKb0Z1NXJhWE1iR0tRWHVPRFZody80d3JsY1k5WEN3YmFJ?=
 =?utf-8?B?MTRFcFFNZThmK1BlQjVxL3UzMkN1b2N2WTZMWE1LNnAvTEMzdTlQTjdGbE1O?=
 =?utf-8?B?cGRQaUIrNXh1emc2ay9WM2I4ZW83QlNQNm45WmI5NG00Sys0Mjk0ZmNZNm02?=
 =?utf-8?B?aUpOTlZETEEzd0RFVEVnSlQ1R0JtQ0phTE5aMDd6d21IeWlaNktqbU9pZXBV?=
 =?utf-8?B?ODRyb1h6LzRleDJpMzMrVVFqK2t6ejA2NDhRb0pYUGszL05zRTV4UktIWm1v?=
 =?utf-8?B?aHpUT1dqTWpTcUoyb3ZUa1ZzWlBESE4zdGNQaWF5cVFkVC9lQWhHOTJzaEVN?=
 =?utf-8?B?dUFoWVJkTDJ4SEVob0VHbUlvYjF0eU91eDhrd3JvWFYvSEJMeG0yZThpWTZB?=
 =?utf-8?B?RmlsUk1qNHQzTkROUDcwQzZTSGtKSm9ZbFJjc3hOTjM1N1o1Zmx1bXI1M3dk?=
 =?utf-8?B?VE5YbHViSWNrWlhrUTdrMDZ1UGZFcElPclVBdlcvL1dpWXhJcWFBUXNBOUJC?=
 =?utf-8?B?Ri92YU1zNzRnTG5EOW5qclNJbFlyU0E1ZnlqbWVlSnlPcU9PTTU2blBvVWpN?=
 =?utf-8?B?N2JOKzBtNFpENjNFTFYzZ1lVZUdDcHAyMzZNRW1LYTVhYndnUE9TYU1tTHcy?=
 =?utf-8?B?NGd6QnJKaDhUTTB0MmI2NTZOekcreUE1SHpDNHV0MEltOTlkKzA4eTBXSm1w?=
 =?utf-8?Q?FYGSoGi9UNicERmzDzIpZiSp/B5X25gfmtmlq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592ddabc-f1a1-4baf-179f-08dec6f32895
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:21:19.4705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhJqTxTxZyvVPzSifgBmapG0/WcjjWb/32/WDO7tRGtRBlc6351E2eeyciKq8X6l9iH8AbUdZNkYbuEh+ji0JIW/4Avc4WEipAN0aNRll8xR826ueKx15nNz2SZjaj1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38252-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khristineandreea.barbulescu@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,oss.nxp.com:from_mime,vger.kernel.org:from_smtp,nxp.com:email,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CCA4669BA6

Add/fix some comments and print statements.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index fe7cd641fddd..4f88c24e62a2 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -60,6 +60,12 @@ static u32 get_pin_func(u32 pinmux)
 	return pinmux & GENMASK(3, 0);
 }
 
+/*
+ * struct s32_pinctrl_mem_region - memory region for a set of SIUL2 registers
+ * @map: regmap used for this range
+ * @pin_range: the pins controlled by these registers
+ * @name: name of the current range
+ */
 struct s32_pinctrl_mem_region {
 	struct regmap *map;
 	const struct s32_pin_range *pin_range;
@@ -67,7 +73,7 @@ struct s32_pinctrl_mem_region {
 };
 
 /*
- * Holds pin configuration for GPIO's.
+ * struct gpio_pin_config - holds pin configuration for GPIO's
  * @pin_id: Pin ID for this GPIO
  * @config: Pin settings
  * @list: Linked list entry for each gpio pin
@@ -79,20 +85,22 @@ struct gpio_pin_config {
 };
 
 /*
- * Pad config save/restore for power suspend/resume.
+ * struct s32_pinctrl_context - pad config save/restore for suspend/resume
+ * @pads: saved values for the pards
  */
 struct s32_pinctrl_context {
 	unsigned int *pads;
 };
 
 /*
+ * struct s32_pinctrl - private driver data
  * @dev: a pointer back to containing device
  * @pctl: a pointer to the pinctrl device structure
  * @regions: reserved memory regions with start/end pin
  * @info: structure containing information about the pin
- * @gpio_configs: Saved configurations for GPIO pins
- * @gpiop_configs_lock: lock for the `gpio_configs` list
- * @s32_pinctrl_context: Configuration saved over system sleep
+ * @gpio_configs: saved configurations for GPIO pins
+ * @gpio_configs_lock: lock for the `gpio_configs` list
+ * @saved_context: configuration saved over system sleep
  */
 struct s32_pinctrl {
 	struct device *dev;
@@ -974,7 +982,7 @@ int s32_pinctrl_probe(struct platform_device *pdev,
 					    ipctl);
 	if (IS_ERR(ipctl->pctl))
 		return dev_err_probe(&pdev->dev, PTR_ERR(ipctl->pctl),
-				     "could not register s32 pinctrl driver\n");
+				     "Could not register s32 pinctrl driver\n");
 
 #ifdef CONFIG_PM_SLEEP
 	saved_context = &ipctl->saved_context;
-- 
2.34.1


