Return-Path: <linux-gpio+bounces-14936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C701A1672B
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 08:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABF9418880DF
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 07:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A57190696;
	Mon, 20 Jan 2025 07:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aJBKPw5s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03518FDCE;
	Mon, 20 Jan 2025 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357279; cv=fail; b=tL9ztna+TB1CUEb/yNNFlO5BIrTo9J6gsHFBn3E8QPZOFm1quADyzpLdUZNkm+QxSj0xjXWT7YxChVc54xtkjolgiO09ZslZZOi5c5GErkwypkDupCIPRo/eSle7UZHo47q7V0azn6/9Gyc9E3NO6kvGxqUg7RWQaYcsCUdXNNk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357279; c=relaxed/simple;
	bh=sp+OqPQfpWgE4cAJIx1oo5i1nCWvRdX06yZ4FCxSaNg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GrGyj4hnhbBId6PPQAvI/dF4EO46cvu1DqSOmxIIfTmLSPJjajy+5pIkaTODHi5RYAgESIpvrA8FjCP4lJck1YbwolKm6QYQULWNt+bqR3VPsTck9ozeDu2+lWkcp6iI/cgvIW3KXZJbAKq5TDQBFT9bjocgCr6dplQ7QzS9Jqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aJBKPw5s; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcgalTFbfcpsV+yDz05D3jlw221QK8z3V+PSnbSRtNboZQJF4kHQ0CjqScOxR6VriiVz2awycFabd8NcFVwfO/+qRYpW7w18epEP6UETdbAqDQu+C0JdhXOJM5fgFUoSgbWXaAxIxyGz1crXWbju7eoZ9gPPkzXfZFgFjSQoC8f47g61rvc5vZdFH80+oqwLUlq2nvzSH7DEXqi3Kp4I1WJKRW5CcOPWlwUQlwrmN1IYLJihp8xSalRy2IB5j1MTEx0ZUaQ/eq2liOykOheVBZ2/u5BTRTxuNVimyt1qlO89Yewn5D3RtFcdUF+R59rfohw6KiHi/OwczEAUdpyQFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N4soaqVvGniFGVKXuIwxhaCY94c2fcgCzLF1RtnT2U=;
 b=gIGO/zI9f8xeblbFH9S5B1/DAMJYEmNrBmkOugjU5TjFbDGAD9oYyPdavFwBKzwFwWlOtD5dBjzme3bR6l7AaDKi3qoI7EPQd8MCLWyBdWpDYOoFIOo4eVQBo+bc9TDiPDYXCJxxxEhBsJn1ESzDsrSYQnFBoAcJJhulJ39xu+FApJKlJjXIpli7j5kLdoKHGRNeOk23fK6M+X0BnWCOEa0nO8PWxml14mISFFDGmxwl0jb6OFB2HVugWxOfDOjl+CE1W4d3GHHHKOLJXuA7qboJDld1Hu8BJe/97WLodxfPl5uxMhZ20G2isrwXtmK1ykcCzLi590YZXcDdnqRz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N4soaqVvGniFGVKXuIwxhaCY94c2fcgCzLF1RtnT2U=;
 b=aJBKPw5sUMahEG6vJrQn5QdseNQzNUu+PQmeyK8JNI4jwIOSXHkzsJn+6pBm7XZhtujpo8VAE2SWlfuNiKolFsMGHbMgPfDmNTBa461k1L8Dd3AuC/PTO111rWcTNgVcAbFz9kPRSiqQnm5UKwj9DE8+qnb0DV/4zmWjusu0tWvhfJcG+qt/YEmBLWaEIDJwYUm3ONaSCHGM0rJcroxBv+s5li114spN+4bdPsx2qXc6DxBEYz59MqfImTeoi72I+ytxVt5tYJheQPl6ztVHxHVnaciMqk+aTnhyhBa3fcA74zLXq26FQ1pp+ycrbIzgp5ShE1JXHnOoks722AcXzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 07:14:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 07:14:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 15:13:30 +0800
Subject: [PATCH v2 2/4] firmware: arm_scmi: Add machine_allowlist and
 machine_blocklist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-scmi-fwdevlink-v2-2-3af2fa37dbac@nxp.com>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737357232; l=2685;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=aQkTl5KnV+Ghr5dkzA87eUlMVoRB+D46A6vU1kqaigQ=;
 b=2VL8YIT/05Gg64JAQiw/Y2bzpscQRRjXN/on6j2pFc5P5hM0/NihawvdpJmFbEJQQb+20Rg6M
 MfGAJ+yl1pdBV6ezgTlbGKzcXN+C9vgw3n8RcKHVIZ7a14O6HG9YCWc
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d68899-72c9-40d1-3a60-08dd392217d7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzNTU0Q5ZnBwOE0rMVNUY0NCT055NjNIdStGaEszRlJBSEpoYm5DYWUrRzhX?=
 =?utf-8?B?aDlUeTVFckN5VHFhRHorMWw0NzErRUIwa2VVQVN5L2l1dE5jNWZnUU9uUFZE?=
 =?utf-8?B?TXZ3YlVaTTJYTzQ3a2lIQzM2cm9KMmRwdXVGTTFodXZmUDN2TndsNjJaWEJu?=
 =?utf-8?B?NmFwYzFSbTlEaGRGejBuNWt2YlVNaEh4ZWZEWUxsQ2RrNmdTdHRxdnMzV2xN?=
 =?utf-8?B?U2kzRGZSMGp6L0g0VE9xbCs0d1Fud085WGlLVkowREdzMDdOQW1tRm5IZzFD?=
 =?utf-8?B?ZDZKSkIybU5CTmkvUTBDc3QyY0RxNzNDSy8zUXBFUEcwOFlrTDdocmpDR09h?=
 =?utf-8?B?ZkNUd2k2aHhMZHBMWmREVGZzeEZwckNQenprS2Y3djM5MWtuVGZXb25hSk51?=
 =?utf-8?B?MHpNM3JGbFFqdFIwOW5hYTh2dXM5Y2NIaDdHYzZCMnpPNEpDSmRYZVpUbHlM?=
 =?utf-8?B?TlJuZmxFSDM1d0V6ZnNKYVZURkgvWm9zSGRpMEVWdk42UG8wN0hMOGpvUTds?=
 =?utf-8?B?WTUwRmJVT1Z2MDk1Y0NyMHYzbklyKzRWMDZPYVdDYXg3eTMwMHJNRmZ3YU9H?=
 =?utf-8?B?OU9uUlJhVTJUbTgwZzBpV0pEZmYxeGVFRWluMXkzZXl3UDdYZ0RlZUYrQXE3?=
 =?utf-8?B?UlFaTUlSQUc1UzRzU2hOcVBnNTZBcm5iRGFXVytzUzZZTHNCNjczYThNc3dh?=
 =?utf-8?B?aXNpZFVHbUpmOHZGMDVvYXllWWM1dmRJR1FhaDFNdzdvYjNrQ2ZGMUlpR0Ry?=
 =?utf-8?B?UWE3WTExUSsxTm1TZDdlZE9VYkJ6N0RKSmF6TWdSSmtadmUzdDlEVUlldEdq?=
 =?utf-8?B?QjI0MVlmVndmMG13LzN1alpIbXVUSktVMnlzdXdNN3pQc0t3TFdOeHp1bEcz?=
 =?utf-8?B?NHpLVnJsbmZ3YlVieDBvM2N1SnhYSFNQeG9VSzhNNWZCNmNWVThrdXlFOExK?=
 =?utf-8?B?a0lieEtoYW5xK29pZkdPcWg3V3lEV0h6SktnSXk1N1VieU1HTk0xanNmZGpt?=
 =?utf-8?B?aDE4b2pQeUZCTHdZTFdXSWpINXJNei9XbmFIQzFLRmllQWhHT256TnRKRnVV?=
 =?utf-8?B?UnJoZXM3VndsMytOQldNRUc3Vk9DRnFMVjR0OW1TNitPMWRkZE9valRhV2hn?=
 =?utf-8?B?QjFNbEZidXVPc2YzVEdldjg2Q1R4UUxYMmZwYlVhNFlmazc3ZjZINTdKZzBH?=
 =?utf-8?B?M1E0NmxzMEJJWE5VdHVhYkVRb2llNm92dFBWYThnY3NSMGpEbXhMYk05MnYz?=
 =?utf-8?B?MHVudk5lenY5NCtpNnhFcU1GWVVsV0NhMXFoMWVTMkV1S1F5dFFwVWw4anNn?=
 =?utf-8?B?bHhpV1RYc1ozcVBVZGNRYmI4cmlQcG4vNmxuV09veWxwUGFGTnpsQ2JISHU2?=
 =?utf-8?B?a3RyNnBZeE91ajk2UXFHQ1BlNkdmMDErN3ZITWNOMEpBY1BqRThLNENJaHR0?=
 =?utf-8?B?SzJzY0hVallQK2FmSmg1czU5c1R3QmtjWEtZdDJJZXFvZGR0SDVacDNpYjda?=
 =?utf-8?B?U1U2bkw2NUptdnVLUnRIVmtwajM1RkxrTThsWEZRWlU5Qmh6Y3ZXTFBabHZm?=
 =?utf-8?B?M21iNENrR3I2bEh3MFdtMm9BQVZBVFFoU1dxSnlFQUduUVhIRmlIOGZObWZM?=
 =?utf-8?B?Z0lib1ZUZHRjcW82dTIzZTJVUVZVMWdJMFlEOEJoY2ZmSjBsUlFUKzEyRnpi?=
 =?utf-8?B?cWdCTXg2RjBTaFZmMUVWdGxzY3hFQm9GcW1sQlpRenBMN1R2V2dJZ0dsY045?=
 =?utf-8?B?Um91c0YzRW1NY3c3OHMxdWN2TUhFRGJDK01hUCt3bWR0Znh4ZUNLWVVoeFZB?=
 =?utf-8?B?eDlZSjlQK0Y4NVIxcjVucFlCa0xmV2FPbHBNeW8vUWJwbk9pcHp3ckx1MXFF?=
 =?utf-8?B?cTJHVU9QRnVLWWlvZWlTYVRIT2trWGJ1cXM1NXlxZ0FCbGw4T0ZXMkxrdWVH?=
 =?utf-8?Q?GjI23m+TGQjrWMbi7JfnB/rWY4sIQDb3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWlXbTdYWmVacTlDT21XdXNqMEFVUjBpa3dGU2FEMjBGWkhZa0VuOGlQc0o5?=
 =?utf-8?B?ZzFZWG40WDFSNWNnWGNMNXI5RFlwWTBILzBwekhCS2dXdTMvZW02dWZYd3pl?=
 =?utf-8?B?emJSZmNMaENENzF3OUd0c2hURWhFUUorSkw0SUt5c25DUXJmd09kM0pHY0JX?=
 =?utf-8?B?NWhwOFZ1Z1hHRVhCWEZOYUxXazk5bU0wQldINzlBS1hxazZIYTJuNGNGL2hj?=
 =?utf-8?B?V2k2empybnd0eWFCeit4MW05S3o5QUJPODVZMTVqMlpDUGI3RFhqZVcrNmhi?=
 =?utf-8?B?UGtvblIza2FDY0Mwb0F6QzFHM3I2VlZ5cEVtWGpDN3huZXlhcys2VXRRRmEw?=
 =?utf-8?B?VkFHUHpBR3VXN1dWZ3pHc0tMKzVsamFZcTl5VDl3UkpvbENUTitrWVFmWGZL?=
 =?utf-8?B?UHFlOFlkYUl2V2laa2R1RFhwcnhmdEg3eWRVbzhoWS8xQlFGRm1XUVIwMjV3?=
 =?utf-8?B?YnUreGxLWnRqM3JiUlN1eUwxaU9OSjZnakI0SGxlRmVIalY5NGt4VHg5TnQr?=
 =?utf-8?B?WjlTQmVmbzFMNDlzZW04OHh5ZFFVSXRLYjMzRGc5OE1ZTzdhS2I3YzllRnBF?=
 =?utf-8?B?VjBCTnJ6cTdyN0dmM1BDK2xyMXI5QkRwR1JVTU1ndXplNElRdFBmb1U0ZGhz?=
 =?utf-8?B?ZnEzQldwMmI1YnFaZy9Nb2VkclRZdUd1ejM3QWdEQlJSWGpKUkxIU0pRSHlN?=
 =?utf-8?B?YjFUTkhBaVVuOWsycVdmaW53NkVaTy82SXI5ZUdhZzNZdlowZkFlSmFMMG1G?=
 =?utf-8?B?SzJXcTRMQ1BidkhpZWtON0t1STl0ZkFodkNYU1Q5empGLzZlOUliTVRtZDdj?=
 =?utf-8?B?QVdlUWhOWUdWUDdLSjF5eHpWMzVoaU5tYktITUQyYUMrVFZodXFoNEhsMkR4?=
 =?utf-8?B?MXFIWFRvYVR6aCtranhYL0lHUUc5T1JmU3BCSWNQNVVTZmNWc3I1MmdHL1hh?=
 =?utf-8?B?b1lUYXBtMnN6aGxmMDFnOHB1Z1ZIODRub1loUXhOcEsxdXFWbk5LL3hZWDZ0?=
 =?utf-8?B?Qitub0FWOFRCc1NkVVN6VktRWmxHZGZiOUVHaWJhZXQxME5mc1NBS0MzeVBm?=
 =?utf-8?B?ZlQ1QlRkRWRjbEFvYzFJclI2Rm51aDB2UXg3ek01VzFLOVdsVk5LcFRrT21p?=
 =?utf-8?B?UjRsTjJ4V2xWRktLNm5TWXZBSU15cSs5WDhQczAxMHVoenZNb1AxRWpOZEI4?=
 =?utf-8?B?RFdEVFNtRVl3S3YwdzdicHNYVjVNaytkUnNrMUY2akNyZ21idnR6Yk1zem01?=
 =?utf-8?B?Z1pKVXMvVU9iTnY1bmJoZjVPY28zQUtwaEk1bGhkeFJCeFBoV0daMXAzZC85?=
 =?utf-8?B?YUw4WjhwbWU3QnM0MStjaVBOZ1dKd3ZkVUwzbDJ2VVB5K2ROblR5NGVWNC9O?=
 =?utf-8?B?N1M4Sk5KM2ljbE5zam9Tb0tmbDEvKzNoUEJMUjNpYTFJRnZHSkJOZ1RUTVpZ?=
 =?utf-8?B?TFk1aFMvUDhFYmFhZGNWcmM2dUdIVkJkdlRiY0M1WEdPVTJQelV0aXVpMXUz?=
 =?utf-8?B?b2NYUkUxMkJ0RzkrNlF1ZHpJQldzbTdjVWhrZlc4Nm1QaWM3V3BqTHovTHRN?=
 =?utf-8?B?L2dPQUJHcEd6alJram1EaGpGWVcxRjRQbEJ3R25RWU1PM0s5VjNkTDN2T1Vh?=
 =?utf-8?B?U0s5K2tTVytZQzQzUjNPUWMzVTc1WVhnV296SFZwSVBNUW1GZ1JxdElVQlE2?=
 =?utf-8?B?OGdhelEwWVR6VEhocUV4dVNxYVVmK1lWVjdHWGxySXhEYUtWNlJ5Z2M1Q1lG?=
 =?utf-8?B?ZHJOaFV0V0VSaDRWUnR6VmY5V25qTnRiVHV5bk1QS0ZQRnFzK0FyQk9ZWm1O?=
 =?utf-8?B?eHhtNEhOb0Fkb0puVFZ1TEF4Uk1yd0RPWHFHRkYyenF0ZzBnUmNKUW5pQkps?=
 =?utf-8?B?OERMYVJUNWF2bkFxNDR4ZGlTWFFjam5Tejh1WDNubkN1dUh5cUYvNDNZSmpB?=
 =?utf-8?B?bGhYVDVBNkJzZGVVR3AwR29vc1M5MVU4QkgwRXl3NWlZSldJaDdLVzBSc25Z?=
 =?utf-8?B?SG9ibHVFcjgzcm1qQWVCTmhibmdNWFh4dTFlUGVxM3NOeklYaVNLa0UwV0Ur?=
 =?utf-8?B?emE5TkNVZURxc2lMZHVXMFduMzlIdWE2Z21lejhXTU1NT3RpYjZoNnd3ZUlm?=
 =?utf-8?Q?WG9QMUv93O+3TxtBFdtMKaX5x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d68899-72c9-40d1-3a60-08dd392217d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:14:34.9012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REi370fSPUW4AcLbqJ4vA4XwXQMrOWGlh+kw09ku3PJ47vzlyFEoB2eGWhY6g9Kwa9UC3rNm+MJAubKfxLb0Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442

From: Peng Fan <peng.fan@nxp.com>

There are two cases:
pinctrl-scmi.c and pinctrl-imx-scmi.c, both use SCMI_PROTOCOL_PINCTRL.
If both drivers are built in, and the scmi device with name "pinctrl-imx"
is created earlier, and the fwnode device points to the scmi device,
non-i.MX platforms will never have the pinctrl supplier ready.

Vendor A use 0x80 for feature X, Vendor B use 0x80 for feature Y.
With both drivers built in, two scmi devices will be created, and both
drivers will be probed. On A's patform, feature Y probe may fail, vice
verus.

Introduce machine_allowlist and machine_blocklist to allow or block
the creation of scmi devices to address above issues.

machine_blocklist is non-vendor protocols, but vendor has its own
implementation. Saying need to block pinctrl-scmi.c on i.MX95.
machine_allowlist is for vendor protocols. Saying vendor A drivers only
allow vendor A machine, vendor B machines only allow vendor B machine.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/bus.c | 14 ++++++++++++++
 include/linux/scmi_protocol.h   |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 7850eb7710f499888d32aebf5d99df63db8bfa26..76a5d946de7a8e16f5d940abc4f542aac5bb2b92 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -55,6 +55,20 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	unsigned int id = 0;
 	struct list_head *head, *phead = NULL;
 	struct scmi_requested_dev *rdev;
+	const char * const *allowlist = id_table->machine_allowlist;
+	const char * const *blocklist = id_table->machine_blocklist;
+
+	if (blocklist && of_machine_compatible_match(blocklist)) {
+		pr_debug("block SCMI device (%s) for protocol %x\n",
+			 id_table->name, id_table->protocol_id);
+		return 0;
+	}
+
+	if (allowlist && !of_machine_compatible_match(allowlist)) {
+		pr_debug("block SCMI device (%s) for protocol %x\n",
+			 id_table->name, id_table->protocol_id);
+		return 0;
+	}
 
 	pr_debug("Requesting SCMI device (%s) for protocol %x\n",
 		 id_table->name, id_table->protocol_id);
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816247d24704f7ba109667a14226b67..e1b822d3522ff25168f895a4b1ed4c4e9a35bfff 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -950,6 +950,9 @@ struct scmi_device {
 struct scmi_device_id {
 	u8 protocol_id;
 	const char *name;
+	/* Optional */
+	const char * const *machine_blocklist;
+	const char * const *machine_allowlist;
 };
 
 struct scmi_driver {

-- 
2.37.1


