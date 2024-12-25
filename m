Return-Path: <linux-gpio+bounces-14233-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D419FC418
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 09:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5C8C1643E4
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Dec 2024 08:22:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FC9190688;
	Wed, 25 Dec 2024 08:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bFajG8mY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C1418E028;
	Wed, 25 Dec 2024 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735114902; cv=fail; b=RFKwh3roYj+PM9UhM8CNe/JMjMCww73Iud3K3JUBQNh5Rmd5WohXYENCci1+Vfo/FQ60ljmsBhKT/rLYf8sLB1wREOWkBC5N8C5obElH8TNPp42am9pQ/+GgvyFILcBOpkY43kS5Unik0QW+6Wl3xtxZoWjvcdB96pwFNNfpIP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735114902; c=relaxed/simple;
	bh=B9UmoanG/iyX9ITVIsH+kcW+rPiNsQMH34VSNLslU9M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GzD8RNX7sNj13xIMhl9JsWLXq558JCBbJWZdU2IjTWRfPoSY1mTQc23uukWleyDjoqelV3JhluXkMXpIOE/aBpn0Uuva7/xJw9/pviGSAzrzLiH4uoLYVT2XfNxo5X1Fd6Tui4zfQQizQGx7v0hxIR2VTEEJSCxclMzB9v8TD+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bFajG8mY; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mg51SzQIqNXRDfUC/N+gBirlI1pA2G52eu6H64SE3U/Jqpr9/JvS60Ah/ia3ePWhx6/LhedyHoQ6Zu2Ev3U0VK0fYVeL7sHsx4XLQiPpR4jXLBUT9XTFLxfG0HedxypjfVnLqc1IhFNVaH5NkxcU3tda6q9eVrP2qYXkz7tuALfuo6+focTsvzptJlNLUPPK7MZooIjdBIBQ6emX/mNStiudLzIF5EzAcVsVYBqvARbIs44EiYO8Epuqq1jOgf5Mq5CvwNRlEe9bOy+Pit/Q90Pk7wBwg4Qw+wMh1Owd/bX1B8ig+G61/Sbbw0DY1X6GTYN3vFCqj3X6Q+6+HP4FuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5DRiVkBY/Qmj5Xidop8UECBk7ZmAsnb7qNwdiy5bY4=;
 b=xKSZEbfaY+IP8pdu08QytQXl4znX/f0gjHsOiETo+FkGv2nPRfECJw0vODm+4GJe/yHy5U830WhEpFIsoZgT8GC1acJ+TYD2IRTWMEkr4dx2dI9AAtW5Uxpcm5k/NoGPt/guzCL/9dS7EY8i9E9r3ltVrThJ/mQi7tP0BsGbzc3lroqUC6U8mcM6KO89aKzumxlxPABImnwkGIn59B4gk3Cqy0IsaQofOlLafXTq3GPXoB+dEhsno+paVrJXTyrlUXtr9s25WybNigL91CiXn6D1ikNSsZ6ZIRdtAkzUsBmWM0RO6gqKQFY2j5inVw78835cnE4ervU/9eQGi6nSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5DRiVkBY/Qmj5Xidop8UECBk7ZmAsnb7qNwdiy5bY4=;
 b=bFajG8mYHqOlM70k9yjppPRRnOL2oMBL72QeUAJE8VNMDjJGTXQMTZr/ZtoPKU3gjU51XiOZCNVUHHYlgGFObJOkj8pa9UeZkMSJ4sfbw0Bh1qOVcB4baZzoPz03fcYS11pK8mc/zV/zvYo/fYC3EGH03UK4RoyzinsTU4TammtFPBUoTF7DyQGJ5TXlSxhEWg9aqnIiof1kICt0TmNKSgidTDCiMqCvTr4YTS22NWczSn/63ieunI3Nr8U2X9iZ4E8VJs5/jJspufG2UfwcMhD09mFVJ2tkUhKyPaqtHNUVjmnsY7CAyfOHlwub9YFjkbgfO6WW2GBcAGOSsjCaxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB8PR04MB6985.eurprd04.prod.outlook.com (2603:10a6:10:11e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Wed, 25 Dec
 2024 08:21:38 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 08:21:38 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Dec 2024 16:20:47 +0800
Subject: [PATCH 4/4] pinctrl: freescale: scmi: Check fwnode instead of
 machine compatible
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241225-scmi-fwdevlink-v1-4-e9a3a5341362@nxp.com>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
In-Reply-To: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735114854; l=1266;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=7eG0vdViAcWDMFwtbA37HE71/cQbz9oKqAxOOgh/B3I=;
 b=cLKqzw+LzGbMbeOHj7yW2dtjr3VzNTWL+phBGvS3G1CzKImJQ4GFfOFhqIYFN7dLV2gd3Ff71
 hlcHNN3vSw+DqQKqgXE/mG5faOEjXaIGrXwHXzG0P+Rw0qhGQKco8Ia
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB8PR04MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e397cca-342c-4b2a-f7ba-08dd24bd2737
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVZEZFBKRm9nQ0UvTXJYT3UydVRTZjNNbFErTlhnTzlRV216cTZoL1QvamNp?=
 =?utf-8?B?V3BkdXFKOXR2NjczbEJvQ3l3V1JjLzNOdnpLbUdmSVJld1RLSndGV3hRTDIr?=
 =?utf-8?B?VStqWWFHcDFUSkhqQ1VtN3ZmbTFTQUJFcUtvZUdmajRjWTJhMjlNTVRacnJ3?=
 =?utf-8?B?SEIyQXBwQ2FxRDhYd0swenR2K253Qy93RURySVpFOHE2L1VraXNmalFtdTJn?=
 =?utf-8?B?WW8vMk5ZMHN2a1lNeHMxMGhmSHFPK2YydC9rQm5RcFdRUURQK1dON2s1Rzdm?=
 =?utf-8?B?c0MvZS9pd1RrcFRPZUs2aU85RVNCU0VmcXZ4OEJSekFuUUN5UU9iRWpDM0Fa?=
 =?utf-8?B?MkJsMjRhQXhUeHg0aE5HRHdOQ3VHcjhPWGdOLzR6Ym5majhJZ01TU2hHUE9Q?=
 =?utf-8?B?NmhuWm5JZEV0Qlc3L28zS1dxU0J5VUE1a1VGSHEya0x4UUkvUEg5MWYvaDlR?=
 =?utf-8?B?SzVJSTRmUTFRcDFQNjh0K1MxdnpJMWZGZ1pUZ05aYnVJWXczSmtQVHlRa0tp?=
 =?utf-8?B?TEdWekwwRnA0eVZLbjhBRkcwaGZIS3RMREVma245TEx4UXJCdUdGWnF6Rk9q?=
 =?utf-8?B?aHlwWjNPZ1VmekkwTlBZZE9RakNjZXdyOENWZTNVdHF1QUIxaEhBbXprTjVv?=
 =?utf-8?B?MGxnWjBDZjhxV0FEWStxZVJCUnRpcWlvb1VmNjJuaSt0WGN5cjREQ3hGRjJm?=
 =?utf-8?B?cEdqYTg1WGpkWXpTNDE1dU95cE1CWGl2ampoaXZwUVErVFloaDUzbDdlQ3Ns?=
 =?utf-8?B?K3IyNWZuR0czL2xvVTRyck4rK2w0WjIveHltQjVESlZBRE1oc09ZQUhrVXUz?=
 =?utf-8?B?Q2FFUWNoOWw3c1A0RDhYMVZvampRemZDNnRTUTNYQzJSVDFVVGhqSWEwQ0tz?=
 =?utf-8?B?ZVdWaEZ4UHVoMWtnQmNwQzNOY2FlQzQyeG9hS2VsckdGWnRadGJzbWR1RnpN?=
 =?utf-8?B?ajVhTFJwc05QTzltTk1oSlRtR0I4OEltNHZTakQxZTBhdGlURFdJTS9kUHNR?=
 =?utf-8?B?eDdwYmtqZUJrbmR2K05IaktXTW5BSCtJTk1RdmltY3pZM2RuTzQ0SUJWeUE3?=
 =?utf-8?B?VS9JZTdEOS9TeDFRM2lkZ0VuYUp1K0xTYVoyTTVrQ2s3SnJpU05ZaURGQlps?=
 =?utf-8?B?U09HWnJtL05iNlFuOWcvUFJRbTljWDltNWdYK1FhTU9jaEsyc3NIa29KRFl0?=
 =?utf-8?B?cEpPY0I3TkZDb3EvQnBHNXMrNFlDM1p0eEpOYkN6bGN4M2ozTWY5Q1had3kz?=
 =?utf-8?B?ZzFGMEpVWDUxajRQdHdrTzkwSTZidGN5UDRkbys4N2Q3TklpdmlBaVp0TzZZ?=
 =?utf-8?B?bE0wMmhTQXBRaW9laTg2RENXbngzaGxXV05HZ1JFVHVNbDU0bUhXRWF1TDl5?=
 =?utf-8?B?RnBUTFppVDdJcWE4SVhXcjhhaTJXNVUzUGdCb1NHemYrZkIyb0dwMzcyakxR?=
 =?utf-8?B?SVhhZ0pnYXdxcStuRlpYOUZJUG5QTDBLZjRkTDNwNTRiaTlObGxWWjV6dFZk?=
 =?utf-8?B?eEdJVFR3emQ0L2ZvWk1pQWFzeEtqZVF6SnJHbGdBRlYzc1pmMGVYbXJVcklT?=
 =?utf-8?B?WVErNTlzZHJHaXhqRTN6UVV1R3JFNEx4VWxRTVZkTDNiTVBvN1NMblRjeTd4?=
 =?utf-8?B?V0VTYVhscUtuN1BCNkJpdEhtWkxBd3J4S1UzVkVRWFYxZVJZb0NxajIzVUdj?=
 =?utf-8?B?RzBHUFNPdXRkR3RxY3ViZXBSazJKdURLOVQ5OTFMWmNEMXo0YVpBNmNTWUZ2?=
 =?utf-8?B?U2ZOdlJuSEVyMlplcXJETkRMM0hDelRnYlIrOFY4RXpSb2Y3R3lTa2paY2M5?=
 =?utf-8?B?b1Exem5JWFpOQlRSL29RdlhMdjI3QVZjSWh5R3pUenU1ZTMxejBTeDZFcHRy?=
 =?utf-8?B?ZFZKUjBKVEJLbnJVaTBRSVFIODJROEJIY0FDWGNjL2VERW1vTFdjVmU5dW8v?=
 =?utf-8?Q?AppUEuLyDMPWyafOBXmrfJqCG3qofTkm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NisrM1E5dHd0czlvVzV4dGo0amdScGlaeTVEeTF6OGtNbW8zd1A5bDhUUzZ4?=
 =?utf-8?B?WTNHODM1T0g2NTh5ck1jQlZ4ekhsQnY5YXFpbUw1M0xOQ1ZncGNPUjMydldH?=
 =?utf-8?B?eFhrZjJwVDQ3NEtaVFhFL0RVVllnWkFJSXFVU1p0STlTRUFWeUNNRmFCTnRh?=
 =?utf-8?B?WTFWU0dwWWhlWVorbXV4MWdPMFc1emJEWEorV0dacVA1VW5wVjVWL1pJS1c1?=
 =?utf-8?B?OGxvWFRldGorblhTWFdqR2k0SUt0TGwxVzJwSFkwY2xxKzFzMkZoeDF0OCtM?=
 =?utf-8?B?UjRoTDdHS3hCK09oQ1l4SnRLR0FXbDdoT0pNTEd4OGJHSUNPdTNmTE14d1Rk?=
 =?utf-8?B?U1RMdm9obERSRmRvY2JUMGh6VkVFWENpN1ZscDRtZUs5TkZ0Q2R3QVM1anI4?=
 =?utf-8?B?YnVBN21CR2M3bXd2SHdFa3EvYWdUYXdyYVB3THJZeTAvVFRHVFF2bStVNHUw?=
 =?utf-8?B?elJ4UHdSUnM5cDJmNFk4KzIwSzBXd1U0M1NZMGhCWXJOdlFBRVlrTjlZNXpK?=
 =?utf-8?B?YWQvWTlFK2hRS2JTeEJTY2E2bGVwUGFkc3hhR2VlQzZ1V1FiZ0dPZ1F4M0cx?=
 =?utf-8?B?MzlvSE5nSHJqU0ZIMDFISVIrM0cwOG9pbHNiRTlHMDUzMm55Q2pBdTFiRGc2?=
 =?utf-8?B?Y1g0TkljQ3FXcW1IRE5oVWg3UWhyendzVldiQi80RHVqUzBZaGVMcnM1Q2la?=
 =?utf-8?B?WG50RERMdmE5RFZWS3UvZzF3Ui9rL3FtV2RqOG4xUFFEVThSZlRzT3ZzNEFs?=
 =?utf-8?B?SG1RV09xOEJXZzdZdE92T0FUTFNmcUdUVlZnZXNOTlZud3dXM3FuQ3pjMXZq?=
 =?utf-8?B?bXMvZGliRThVemNlcnEySVJ6S25DMHprZEpnUkJBOW5qUUFiVURKeFUzUmpE?=
 =?utf-8?B?UTQwRzNzd01PeEY1OWpJaTNCbDVqWXd2WWNleks5cjU1djVHeDdTWUZTOTlp?=
 =?utf-8?B?L2l6KzBBZFY0anZOVmVvc0kzdjdHWUI4ZmxyZ2NOUVJSNmJxVzRHSm1uOURO?=
 =?utf-8?B?U0lMa0NGdzBLOEZSeW1pMjlXcXQzNW5rVmtDQnZjMysxZEtVUDVaamlKNnVB?=
 =?utf-8?B?VGtkL2JFNFBqYU5oME5GQkJtVHY5YWtZSWVMQ3dQYXlmb2g5WnJ3aW93ZVlX?=
 =?utf-8?B?UjZ5cHNHcmU5T0ZvR0FDSzZxSWNMakc2L0o1NFpQa1JMYXRZZG5nT2NqN1RH?=
 =?utf-8?B?TXJrVEFzNzV3dnV1RmFmb0ZBWkFQMmM3MFlQdnpLbnArenZURGx2SHArcmNl?=
 =?utf-8?B?M1c5RHd6Y1I4VkE0Y3NCTktLNG1XOEE2aUdLb0VRK1V6LzJuZkFYZGgrWXJW?=
 =?utf-8?B?NnMyc2NYTW9TZ3lUY20ybm1HSXhYZURreHo5M21vUG5udlNLLzBXVTloWi9H?=
 =?utf-8?B?b3dRTG13cVJwOWphOXhMZ212OVVFaWNhcHEvMWEwMEZiME1wUmY3anVNbXFG?=
 =?utf-8?B?a1R4Ym5VYXIvR2hSdnBZV3FVTDhQaUdOTXZHV2YzSS9UZzVwSEdHWm5yNFdO?=
 =?utf-8?B?MVJVRy9DbXRJZ3VyclRYWENrR2prN2F2ZlR4WkJBdzdtNDUzYjQ2OGJCMzlm?=
 =?utf-8?B?enljL0pFaGRyak1KVXRXNHZXVUxpTzJwVjRDV040dlpZbEZtVWxQbDVyOXc2?=
 =?utf-8?B?VkFVT2hRNzE2L1JlNWUrVldiTXJVZnBlMXFacnBOT1BCV21zUWhQRDgzQUJX?=
 =?utf-8?B?SG1UeHBNdGFPVkpBbGNOa1ExVHRyL0VKa2wwYVNsTUVBT2dBVVpVUzNRdmgv?=
 =?utf-8?B?bWJpTjl3c040dVdRQW1PcnhZZENpc3JNTnpTUzdkMndWdWJmbXdJMG8zWGRj?=
 =?utf-8?B?QkRyaWNubDJyNmR5bEcvdTZLQnNKNzFXM1A1WGVvRy9HampBUWhUWDFkS1ls?=
 =?utf-8?B?ZE93RnZtTlUzYTFtdXZqSmVjb3NtVlVYbks4N0dwTUgxc2xDWSthTVd4UFZG?=
 =?utf-8?B?Nk9qZFlFaGU0T0k0Qjg1TWsydnFYVmNuUlk2cWc5NDJvK1VTbDNyZkExYXFi?=
 =?utf-8?B?MXJKbnpXYklFcGNvUm10NFF6Kzk4RUE4WVRBaW4vcXN4OTVJYVdCVHVjcVdK?=
 =?utf-8?B?RUt6NnNOOVZEQTJ0djc1ajV3L2kvb0dka0wvYWVLcnF2QTJma2ZDMk9YMytn?=
 =?utf-8?Q?tZiBT/3t25/69XSGzh0CjMOU2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e397cca-342c-4b2a-f7ba-08dd24bd2737
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 08:21:38.2799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQ62ZNGJNnrecRBKfBALn7MdgWhKZTW4K/wkFu8XLb17Ju7upFQJATTv/viyVbiwecBJuW9gbqjQTwa8XGgMiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6985

From: Peng Fan <peng.fan@nxp.com>

For the platform that not compatible with scmi pinctrl device, the
fwnode will not be set, so checking fwnode will make code simpler
and easy to maintain.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 8f15c4c4dc4412dddb40505699fc3f459fdc0adc..5277d30af7084b9bbf83e3523f09c8136d41705b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -287,11 +287,6 @@ scmi_pinctrl_imx_get_pins(struct scmi_pinctrl_imx *pmx, struct pinctrl_desc *des
 	return 0;
 }
 
-static const char * const scmi_pinctrl_imx_allowlist[] = {
-	"fsl,imx95",
-	NULL
-};
-
 static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 {
 	struct device *dev = &sdev->dev;
@@ -304,7 +299,7 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 	if (!handle)
 		return -EINVAL;
 
-	if (!of_machine_compatible_match(scmi_pinctrl_imx_allowlist))
+	if (!dev->fwnode)
 		return -ENODEV;
 
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);

-- 
2.37.1


