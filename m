Return-Path: <linux-gpio+bounces-38255-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cq9JDG1lKWrLWAMAu9opvQ
	(envelope-from <linux-gpio+bounces-38255-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:23:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB13669ADE
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 15:23:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=tWnQhJl3;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38255-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38255-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE14F30D645B
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 13:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4566640B38C;
	Wed, 10 Jun 2026 13:21:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CDA409635;
	Wed, 10 Jun 2026 13:21:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097696; cv=fail; b=iKCn7Z1uxTSfWj1vSSApmumSTpLiKBT7djyu+/t6mVnNYjaDIibWKyhhIIKwHWI8eJXQtible8LPFG6YcCbcQ5UZjjx2JMwBoWf1bQ0727oR+k/iQB4bkbkLe8fUfb2XnF7f6HM/C6VXTLvG/vtEb5tpSQ3sOCCTBq/l0sq6QbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097696; c=relaxed/simple;
	bh=mYUi3bYrNva9B2kvR0VQYyiAyO0j0Fasp8zeSW8p8pY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OpU8VNTlX31rvJ0X6CffCbZ8j+W/a8XqvLR+l33RUGTwdZyQ4riU5Kxvc584qs3Oa163VTN174eOFkba6DtdB4zfZTM7BvTd20MA7v4Of2nsBkM3zF7tPn1ZqNsfBN64m7Igx/mM4Mpa73CfHTalV0Zvd8N9u3sGP3n5wR+1GPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tWnQhJl3; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPgCIwpIRn/qtQHuUKKjg+xC44yYkibRiF7+YH72AivqcOSQhpYIDwTr+liMK5nRY/BF+FYJjZ4yQpsw0LcCC36jUnXj7IJdt1aG/G0idn1VKKRr6LlvPgIJstJBVA7K/R46nDnzuHHdHHpL1A9nkAq2Dr77Q33CNyqC1SIxniXjI0WbC04T06sv0miqru2DF0/gEy96of/Zt97LcYlv+9MTwbcKs+ScMAmSr9B63SnSPHlj2pG1PRaVJ13e4nGOG4kwdJBMHDjmEjHwfVSqbNc+QSzSmtKvz/0xZHCAOPfCpepeeoN2/hQm8uKVE9OcfbggKGzo4CSfDTPI9dKtwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmZl/R9661A7fspv+NHr8aYf9k7GBB5gDn0B9/6elOo=;
 b=FDcl5fPemUVD5kD4ErEvgkVobvfHRji67PtccZU5C1uFkrLLXkcCfvcdxsBjaK34H0i06St6Was3QiDVp6eQE5xuqOwITjJ0o1ouu+qlskVoari6i7oRi2NfFnOaUpidkk9UFlL1wmQb3srvcbXoijnqyFKcDcYjrV2PotmM6PbaKVrQ4uwdrP6XaCvuWavTwvqraL2gN5L2/opD8601lihURg9jDVb9NY6V1sGzmK7ZiTKHrwlbqdgKjUiLMn6c2KNyKw8h7P4d2Si2y+e0I6I1QX8xcNAL6RhlUjfHVc3ScSLZrxgJO/szt5QCeQT74+wBnm35QJwaXjGQq39z/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmZl/R9661A7fspv+NHr8aYf9k7GBB5gDn0B9/6elOo=;
 b=tWnQhJl3GbR0TONXHuVJMNTU3l+InLX24OfPUcU/+yzT/t2ai+Gr7QaM2NBVnEzM679VYhWNq6AUBLwrxhnJAI62ApDJCDskigwvO9y+a3cF6javej02ZJbDu04HVnZthQUI8jWH9r4/KC9mHLl0vaa8hQF5C1HS6fZjsyM9XeFY51Q5d2fFvO8IkvHgajyTRdRSJ/QpYis0krKzEW+g3U1qyp7N6jhIyr1GZRJBoJjFEwCQDJ2snY754wrwh7LPJl1rCd3e067973EgGxK2ue2XDYHVad8q82UUu55qgGUHq88R2ZLlsASDtcvMG1ZWAUZS0LO33auAGZB5HjHq+w==
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by PAXPR04MB9121.eurprd04.prod.outlook.com (2603:10a6:102:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 13:21:23 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 13:21:23 +0000
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
Subject: [PATCH v11 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO and EIRQ resources
Date: Wed, 10 Jun 2026 15:21:14 +0200
Message-Id: <20260610132116.1998140-5-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
References: <20260610132116.1998140-1-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0038.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::17) To AM9PR04MB8179.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 043bdec6-b311-4e03-2b52-08dec6f32ace
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|5023799004|921020|56012099006|3023799007|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 yyqx7020TE3o0LvXc/ZkqNyEfRLITMnPPz9SSR35SJRXxtDXIgknOjZs1KelQlHYnvIPocNs2C46CoT5etBjzh4n9j7p6wuqMnNtGKeiMAgegG1OmqkBNyHdM/H3B8wkaxXczsOrPoG1BJzQCo1qtvEW/oqORLjAVwYtA5emwj21Jk3ZQ1nJE8+KOp5ummqSMdt8sZMxa6C9UntFjQyiZPyNtmlZ7lfdv4JBZZD5IpNkMXM45Ra09yyEplpm2LdQRE8NlyE/AFOtok/rts/BwrX8pNlNcJWj09phe56W1uA/kG7gZ+QRTlpuFqZs8intCQL/Uu5EBZ46E4ncE8eDuhRX92vFnBSsmbh51kvLVf9zFzc8SvzVOHY76GdoMB+QSstyGM3fhFgGv2tUXxsllGhgyz5ycR00tdbcGBejbSRwzbikFz5NV5RlFVKOznUdbLz03dB6U8tUQa3RHuoOc1XlCd/zny21xq5tu/Oj5alXIYVgeM2k1sOfYLv+vAWvAH5f4IF5USY9iHAnKkyar+ylpjitlE6TeE5F2pVqGIxjQopoRGe4jYLHEioW5wzghAOWQ1CuhDjjk43cDo4+CrM2Gxtmn2392+8W5o7e5iA2fX+f74/Ch4lgH5jMo7Zl+fK+LIhG7kJSu4tYQ7F9SjpXffi08M8ZqJ9tBCnmZY87B1apBvT07O0Fq1f9B7crZswDQVngRMgNSgqQHzIDDG+5rRwkvPpEnA5JsApqPndmsjUnYktntelbfUcB3wke
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(5023799004)(921020)(56012099006)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?T3JUQTJBb3VhSG5Hc2xZb1JhZEhDQzVOVTZaNXhsQitBQko4WnFVZUJsZkNH?=
 =?utf-8?B?dUNJQzRocWlqNnpIbnZqSE1LNFlLcE9QSm9Dd0ZYNTk0UEJlc0Z6dFVDdHZR?=
 =?utf-8?B?Y1JtdDdBdUJ3a0dwQkZLS0dSZzlJbHNKcERpQ1dFLzVUYmFsTVlGVXhHQUph?=
 =?utf-8?B?Sm9iMmpqOCtCRUd1OXRXYklEclJhbEIrSmZleFlFUVFjYTZ2V2RuTndrMFFP?=
 =?utf-8?B?Rk1mT0t5R0s0Rm5IU0tMNzJzMGRsT0RodUJPRnFrU2xvVDlBQkkvT2t4dk1O?=
 =?utf-8?B?aDhRRjRTR1BjcGVjMkZjOFVWU2lhYTFuQ2FJdGZJWW5vY3FSTXU2amwrYVJn?=
 =?utf-8?B?QmYwWHRRWUtyK3RHSEN4VnVTcUxaU0pubE9qNFVzN1FFWUVKQ3N6QXI5SW9R?=
 =?utf-8?B?aGRLUlAwa1NHYnJCZFBHU0xOdXc2eHI1VDgrdStZbnlqeHRWTmlxcmlsOVZP?=
 =?utf-8?B?eEQ5cnVMclpCcjlldk1ObmpaUGVLR0Rlc25hWU1HVXVkZWw3WDhNMTBPYjI4?=
 =?utf-8?B?VnE5MVYyTldDeklNcy9Jdk44dHpVMDg3R29SdUI4YWtDeDh5bWxqY290aGNE?=
 =?utf-8?B?Q0RobUpUaWduZUhoMlhpczIxb3JnaWhCd0VaeHhNN0hnRDJuYk9FSTR0czdr?=
 =?utf-8?B?ZXd6T1dIY3F5SEFZS2ZTdTd3QkhYRjdzZDhXVHNUeVNEU28yU2dMZUlzZFZt?=
 =?utf-8?B?T3dDWmZHbjljN3RuamQ3OC91OFNQRFExSzRHZWxPZkJkdFQzZEFtSEJ5K2Ni?=
 =?utf-8?B?M2h1NTVESUNFTXA5SGw4Q0pPT3ZXcXBHVzZRbDNWRkVLUmtkYWxpc2FOM2xY?=
 =?utf-8?B?OXNjb29DTXJ1N080Z1E5RWdrTFBPcjV2Rm1GZzc5a0x6YU9zTElQaXhtRG01?=
 =?utf-8?B?RFJZclRoRmlWRXFOTEZiN21VazRzR1ZPelg2U2lzYlVVcGtpTXNUN29YWXlw?=
 =?utf-8?B?OGwyL2ZxT3o1SDc0dlc0RDJWbmlxU2t4U2txRnpCbDNjcFBkY2ZGTHJHRmho?=
 =?utf-8?B?NDFORlFxaU5MZ1lnaHlvS2s3K3lTeis0RGZzQkxDSmxraWhSYjZtYlk2c0JK?=
 =?utf-8?B?dnQzR0wwYzlqU09hUTI1YWJHckNtc0I4UVVwdkdLZXc5QU9lT2dqMVBLaStG?=
 =?utf-8?B?RW8yUi9IUXg3ZGh6dTdrTmZPTGZvRTNiSk5hVjNUcW1aMERNRGFwTmFtNGZS?=
 =?utf-8?B?ZExKeGtqMFc3dnBONXcwOVZQTHdRNG9IOWJDdi9zQk50U1BoT0M4UnhSQWpq?=
 =?utf-8?B?WkF4OE9FQmRTZHE3Mzh0aUEzRXBTUmZmUGRuNHVrRDBBTHowdlZxd0JBWXVn?=
 =?utf-8?B?YUN1ckt3YWMxc3JtK3NKUEVUNDRYZjdzQjl5YndTZ1RYcWgzUmJYZWFGUEVX?=
 =?utf-8?B?TmJqOUxBMkprQ0FOT0h5eUVISjI5Yk84VVlac3g1ZlpWbitwQzNxeUVtNk1s?=
 =?utf-8?B?b01JM2lrcDJGMktSVGwycFpMQ0N1S2V6NXRLZTRlaERvRkJnMlFMUlN4OC9W?=
 =?utf-8?B?UmxLelpDaUVqOG1TOFducnJpdXNOS1ZRdEsrOWxoS0poREZZc0xXNGR5eVov?=
 =?utf-8?B?cXc3dFJia3p3ck9TQ01xV2duakhWWnJ0ODk2R2tWS25pSGdxc0xuV0dYZWVS?=
 =?utf-8?B?eE94SjNaVzhmUWZQeVVVeEY0M1QyK2tBQnZtOXV1T2xWN1Jzb01ydk41QjVL?=
 =?utf-8?B?MWcyY0hiZmxWWEZPd2tyS2FXL1FCWURsaUFXWjVYVmNDcG5BSVZROXFVM2kx?=
 =?utf-8?B?NjBUV3paSk13NDVRSlpvUkxRRFRiS3N4aTZrSlZLRWZLREFtbk93UzE0Vits?=
 =?utf-8?B?QUc3a1lLVkpJdFpTdXRlSC8zaCs2U0ZQQy9GM0o2ZFVzd2JrU3NWMjJCTWho?=
 =?utf-8?B?UlFJUTdsb0VLQk16eWVTTDM0L2tDeDFzbDduWWxvbngyUlVVcE4yRFJQR1FL?=
 =?utf-8?B?bU92aVFvQjV0RkRLRktBMGVlOUk3YjlYRGVBRHRPRjluWDM3MGcwQWRjdDNQ?=
 =?utf-8?B?bEh6OEI5Y3VzczRQVzhkamthQ2xwM2tHZldERGJOb2pEM3hnVThiZmdGWTBj?=
 =?utf-8?B?akFRbFFFM0Z1MHBDOC9BK09Fcy92UklROXlpOTROMFFuODI5eVZ5Um1CRlBU?=
 =?utf-8?B?WHRqWTZoMU56bFdheEl4bVJNRVgyaFFOVmVuZGlHZzhHYjdNejhYYldYeSts?=
 =?utf-8?B?ZDRrdWdTZnhKOTFYb0tETUlITElkS2taWExiUE9wMWNCK0hYMzFCL0dVMmpn?=
 =?utf-8?B?T3prYjdpU3dtS1NlUGVlVThseUdrOUFlL2tvdndIYjYxT3pWS0ZnRjZDZHJR?=
 =?utf-8?B?ZzloYkkzVXRtV2VGYjU1ZU9oVHlVKzdFeUR5MjRHbnBzUXowSi94RVBaYndI?=
 =?utf-8?Q?EUkbszcZQwUbSRAwJDCOBLO6S3+CZzQbfymzk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043bdec6-b311-4e03-2b52-08dec6f32ace
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 13:21:23.2356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7m2xj5ztc70CwskOCixeBMy8B5kCuW3yQWlNsCiuKO3XeX9fa86uhCQ7/d9vY7VJ52OXA/3dPIbINpPSK03VYp5KYjqO+t+m8kxFRSXemTGazckKxV/mI4hmuolWjJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38255-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,oss.nxp.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:email,devicetree.org:url,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AB13669ADE

Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
external interrupt resources present in the same SIUL2 hardware block.

Besides the MSCR and IMCR registers used for pin multiplexing and pad
configuration, SIUL2 also contains PGPDO and PGPDI registers
for GPIO data and EIRQ registers for external interrupt control.

Add GPIO controller properties because the SIUL2 block also provides
GPIO functionality, and gpio-ranges are needed to describe the
mapping between GPIO lines and pin controller pins.

Document the interrupt controller properties. The SIUL2 block
contains EIRQ hardware as part of the same register space. IRQ support
itself will be added in a follow-up patch series.

Update the example accordingly to show the complete SIUL2 register
layout, including the GPIO data and EIRQ register windows.

Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
---
 .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 90 +++++++++++++++++--
 1 file changed, 84 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
index a24286e4def6..36f2393fa406 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-# Copyright 2022 NXP
+# Copyright 2022, 2026 NXP
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
@@ -17,8 +17,10 @@ description: |
     SIUL2_0 @ 0x4009c000
     SIUL2_1 @ 0x44010000
 
-  Every SIUL2 region has multiple register types, and here only MSCR and
-  IMCR registers need to be revealed for kernel to configure pinmux.
+  Every SIUL2 region has multiple register types. MSCR and IMCR registers
+  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
+  registers are used for GPIO output/input operations. EIRQ registers
+  are used for external interrupt configuration.
 
   Please note that some register indexes are reserved in S32G2, such as
   MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
@@ -29,14 +31,22 @@ properties:
       - nxp,s32g2-siul2-pinctrl
 
   reg:
+    minItems: 6
     description: |
-      A list of MSCR/IMCR register regions to be reserved.
+      A list of MSCR/IMCR/PGPDO/PGPDI/EIRQ register regions to be reserved.
       - MSCR (Multiplexed Signal Configuration Register)
         An MSCR register can configure the associated pin as either a GPIO pin
         or a function output pin depends on the selected signal source.
       - IMCR (Input Multiplexed Signal Configuration Register)
         An IMCR register can configure the associated pin as function input
         pin depends on the selected signal source.
+      - PGPDO (Parallel GPIO Pad Data Out Register)
+        A PGPDO register is used to set the output value of a GPIO pin.
+      - PGPDI (Parallel GPIO Pad Data In Register)
+        A PGPDI register is used to read the input value of a GPIO pin.
+      - EIRQ (External Interrupt Request)
+        EIRQ registers are used to configure and manage external interrupts.
+
     items:
       - description: MSCR registers group 0 in SIUL2_0
       - description: MSCR registers group 1 in SIUL2_1
@@ -44,6 +54,28 @@ properties:
       - description: IMCR registers group 0 in SIUL2_0
       - description: IMCR registers group 1 in SIUL2_1
       - description: IMCR registers group 2 in SIUL2_1
+      - description: PGPDO registers in SIUL2_0
+      - description: PGPDI registers in SIUL2_0
+      - description: PGPDO registers in SIUL2_1
+      - description: PGPDI registers in SIUL2_1
+      - description: EIRQ registers in SIUL2_1
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 2
+
+  gpio-ranges:
+    minItems: 1
+    maxItems: 4
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
 
 patternProperties:
   '-pins$':
@@ -86,11 +118,38 @@ required:
   - compatible
   - reg
 
+oneOf:
+  - description: Legacy pinctrl-only node
+    properties:
+      reg:
+        maxItems: 6
+
+      gpio-controller: false
+      "#gpio-cells": false
+      gpio-ranges: false
+      interrupt-controller: false
+      "#interrupt-cells": false
+      interrupts: false
+
+  - description: Pinctrl node with GPIO and external interrupt support
+    required:
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+      - interrupt-controller
+      - "#interrupt-cells"
+      - interrupts
+    properties:
+      reg:
+        minItems: 11
+
 additionalProperties: false
 
 examples:
   - |
-    pinctrl@4009c240 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pinctrl: pinctrl@4009c240 {
         compatible = "nxp,s32g2-siul2-pinctrl";
 
               /* MSCR0-MSCR101 registers on siul2_0 */
@@ -104,7 +163,26 @@ examples:
               /* IMCR119-IMCR397 registers on siul2_1 */
               <0x44010c1c 0x45c>,
               /* IMCR430-IMCR495 registers on siul2_1 */
-              <0x440110f8 0x108>;
+              <0x440110f8 0x108>,
+              /* PGPDO registers on siul2_0 */
+              <0x4009d700 0x10>,
+              /* PGPDI registers on siul2_0 */
+              <0x4009d740 0x10>,
+              /* PGPDO registers on siul2_1 */
+              <0x44011700 0x18>,
+              /* PGPDI registers on siul2_1 */
+              <0x44011740 0x18>,
+              /* EIRQ registers on siul2_1 */
+              <0x44010010 0x34>;
+
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&pinctrl 0 0 102>,
+                      <&pinctrl 112 112 79>;
+
+        interrupt-controller;
+        #interrupt-cells = <2>;
+        interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
 
         llce-can0-pins {
             llce-can0-grp0 {
-- 
2.34.1


