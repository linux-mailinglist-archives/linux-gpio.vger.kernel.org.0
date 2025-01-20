Return-Path: <linux-gpio+bounces-14938-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD5A1672F
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 08:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5AF18898C3
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 07:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F88818FDC5;
	Mon, 20 Jan 2025 07:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UhS0AXxC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293C18FDA9;
	Mon, 20 Jan 2025 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737357287; cv=fail; b=cikFwrB6rzfOs+etvHZJbC7lflnB4FhK2rQk3SALmO9dblh6rdqkILQByzBsqU8uaqtT87l+EPomNuc0I/fmojMpAg+JifFEL6+5IY6ZA1VdR2+tjq8Luz6Jt2LESNiY6B2H14Nf9zSQjnEeOzgIhOotjY5gcpPA+wtm1smlA/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737357287; c=relaxed/simple;
	bh=nkl5d3YY/qHLV7k8ahkYMZBbTm/SeFBorP6JxzMdbTk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nzVY6YbpNTcFMfv3GgP1nsvsFvxZwUvq6Gjpev+0hHsCiYMXd/8CjWwXR8TM83WIPE1i47i3i6STbxNX36Ug9P4hioPnfV1eV0kocLnmFYWplqdHFb12xIcKZCFOuTb3i6ljCuZF6OhNZ9uIfzdlhoL8Esbw5Gwaq452fC3RHMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UhS0AXxC; arc=fail smtp.client-ip=52.101.70.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3b4cwnVJHOCM1fyQQt75gvGB5ScpYgZ3qFqQwY8DWElb6a59h2QnakUmWipgXjVqGCrFO9Ycr8xCcUbZj5sTFDXb/hvVrakC4RrXojkfDodpnG1OqlXVxWPN5wSbtAuz9qEprw7IzyhxGf2Zf39TkB8BQQMsPbekDg43rHCZJE0k+coXgSFjPu9fRTM4fgf17Ek3HE+vEirAcUORrjCnzbRBlPBp3r3PFSMGOIcV4tOX9pDMsTmbHemA6JyOBCvx9xDMRaAbWdwnL2w2iDokOZ35bOdigo4pyyXbxfNKSMmsjArs7yPSfKmOcrT9tsGQSDYnPQvdV/xgc5UtOW/qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HikyuC85c4OtraaH4/n4z+kHD9b1BNSNvuSvTdQjvkI=;
 b=hdbbgsKdVKOieERjBFB8vdRkaPCdB5lNZMUqC2J4ZW7JMS8DcbENlWHvFncN/sGr/yh7n+kPnHMKRdz7HrIxAWkwn+EFRVtOW5SjBGnrCvRnhon4cVG5R/rrGOFGhBdFw6thLRnmgS0VKusu8k11LfoM4kC9iL3zYNggIEh+M76jIR+0043CHx9yYQWE9C0MQWHsc18RBLPOqCurKtG2Q9aGzs2IIOcTFp5kDaVdnyftYuRsjpiRZ2rym1tR+aEZ1FPj37pR+AOiuGx1ZAHaKgW9yCaLNFC2JHz5IlkL4HjQWlf6Ym69iOU/L5fkmytSHDhK3dCsajeZLeNOFnSyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HikyuC85c4OtraaH4/n4z+kHD9b1BNSNvuSvTdQjvkI=;
 b=UhS0AXxCuP+8AJ94DdiF+QEpP7PZKAD+wrWBhU3TOcBsZhqmAdbqR6AFEUpZAPrk71pkQhi26U/oR2BAP7fgcbSbo8KDSoZCHABrDTgeRwZ6zIMS8g7UUn8OJZ1yRy+uYVfMi15ZHtHyXFYN7ejR/me4Dyhi9SfK6xMXlaG7IcPmx83XdNkQZBYs6WDEj3hYt75z3RgYjs+pwngRxS5Y2IKpwGyZjaPKnFoMVuLbp0AxppbD3cCoENIwQRqdPB1GXLiZ/0CrKcroWi7+Eh1DXTzqG0qSFY9s+G+MZzxbmJ20O6Qun+5yBimy0K6l0ewLj2d8Osktcm1I+g5ynLT+WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7778.eurprd04.prod.outlook.com (2603:10a6:20b:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 07:14:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 07:14:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 20 Jan 2025 15:13:32 +0800
Subject: [PATCH v2 4/4] pinctrl: scmi: Switch to use machine_blocklist
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-scmi-fwdevlink-v2-4-3af2fa37dbac@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737357232; l=1588;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=y7Jz62QD/LOAhaSVNi4OjY5Sw5Y/G32ouDnOiFpe8Ls=;
 b=fG648whABDouqN4JkTlzP9apGuFyMly2VDnFJtrGI9WX5yafoZQaDqiJZbEzSCKOIu1qgNFnJ
 Qx8k6znkT/qD7ymvWCrjSw/CjPNoHiE3oPFHrbHqhOPxK1Pg12V9w/7
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7778:EE_
X-MS-Office365-Filtering-Correlation-Id: 4530a3ca-ce49-4ef2-e484-08dd39221d1b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUwxWWVReklrZ2wvRzFJRFZqa1BrOEZGZlN6N1oyMFlJOFlFQWltb3FIZGRa?=
 =?utf-8?B?c1BSVlFybGtzRTBoTVZ3a0hzaTZiNllXcjMrbkRwU09wUm5ic3RmZ2JYMmNG?=
 =?utf-8?B?N2VHU2ViY3AydkFNeUx5SUZCYWR0M0xmWWRZbkc0QjhPaTk4dWE4MXJnTjB0?=
 =?utf-8?B?UDhvS1Azbk9zWDQ2QUo2TmxOV0tVMmRKZ0lKVDQveXNZaTBnczR0MSs0VHla?=
 =?utf-8?B?K1FmNWtqTzBFVkFab0h6N3F5TWVPSFFCVkxIVDdXUFk0YUI3RDRrdXdaNzJy?=
 =?utf-8?B?VTB4aUs2SE9LaE5ES2FSR25qWjBVMGFCb1VLVWo5T1JNTnltZ1BmYkVzRmVY?=
 =?utf-8?B?Y2x1U2JGM1ZCU3BwVHE2djRIR3J3NVRyWWFCUzlCVEJpT0l5STd6MUVkbE5L?=
 =?utf-8?B?ZVN3cTNtaWd5S0hXa01sU1dsNWsvWTI3ZkRJNVcweUZxVjE4bXlwVWNoK0xQ?=
 =?utf-8?B?YXg1dWxtQmJQVjk4a2pYVGdxdzBpci9iNnVaWGN5RHFaYW5NQnZyUkdNTkdZ?=
 =?utf-8?B?ekFPdnE3aUpobU8zYXpwRzB3THZQOHJ6OUpvMjJrSmMrZHFjUFNIVUNSbDlX?=
 =?utf-8?B?bmM0b1BycWJNeXlHRjd2TjgvbGowcVZobmNzc2dBdDM2MFAyd050V1g2MzBV?=
 =?utf-8?B?QXpYaEtJU3dCaUcrcG1sa1NrcG5za3Rhc0M4Z0xmVzlJS1l5NEwrc2V3RWNv?=
 =?utf-8?B?ZFFOTis5NHlZMmtvT0svcE4zQ01QVmJiSDZJQVBJemNmV2V1di9EWXFsSFlh?=
 =?utf-8?B?TWx4SDlQK1dCL1ZOV1p6UG1jNUlvV3ZOYUVocGx3SXd1NXpCZ1NtSXp0WnJD?=
 =?utf-8?B?dHk0Q3FRb0lscGFsUFAwd1dOVDd2UHpyZ2pxZkhheDQ5MXh5MlJCRmF0THBY?=
 =?utf-8?B?RlZpR056cXhoMHl0aTJmQk9uZWFIS3ArRWhnUEpIMTAwMmQyemRhVnBaTnN4?=
 =?utf-8?B?SjIzdFhtQWl2c2NobkZYNXp0R3M3VmVMa3ZoT1d5MDY2ZzBqaUI0UGxRM3dl?=
 =?utf-8?B?RHEvdElwS0dqaU9ocEVIYnEwc01tcy9VMEhGRmZsM2IxRSt0TTRGWXNhUFpS?=
 =?utf-8?B?M1ZaempZcmloM2psdFBmU1pVbWliMFVXYm0yWXhHM2tOT1NhcHBJdVVJTEQv?=
 =?utf-8?B?Nzd3b0lBblloeU4vQk9EdUJkZW13eEkzbFZyMDE3dWh1MGJyZDMxVCtIUzZo?=
 =?utf-8?B?MHowSFBScVROd3FSYk1UdWJYWjdDT1EvNnl6Z2lZdVRoY1RPcDRSalJlTlNX?=
 =?utf-8?B?TWw5NEVmNDNJYjhLTmlCSk5Cc3dWSWsvcGk2RXlSbWxHbjhFNmljMEI3Qmwx?=
 =?utf-8?B?UHVrZGE3OUtMM2RINUViZElIN1p1NzIvN055em1qWEZOcUtSTEhTRjhUUGlS?=
 =?utf-8?B?MkJMai9NdHdTdTEvM1FqSDBIb1dkTHBlRG9HdGVyd0pQeWZLQWMraVNNaUxV?=
 =?utf-8?B?cTYwV2RZeFVkNUpLYzV6WThaaDBrbm0yY0UvZUVOMDgvU1FkZ0pIM2QzY3Bi?=
 =?utf-8?B?cDArN0hyL2lQOWZzTjl3VjFnbm9FVmVWNU9vOGI0T3d5SUc1UndSRE02Mmg0?=
 =?utf-8?B?U1JSUUU2RlkxNmRQc3RJWnZmbTNicGtzUGVjcUNLa0ZXTG9vVER4S3hNOTlE?=
 =?utf-8?B?VnlQOGN6YlFQNzBCR3VPc0g4eERYOFA4L1UyOWlQQVg1bkZWY0ZqaVZ4eW5U?=
 =?utf-8?B?T2k4V3U5aU5vQ2xkWGQva1JXVVR4T0tZd2s5RC9zU0ZXOGFZSC9iY3RVOFNY?=
 =?utf-8?B?L2psNGIwMDcrR1J2WXZkMWpWeE1xbTYyQllWWFhUV3NTZXpGeHdWYnJ0dEhl?=
 =?utf-8?B?L0NsMHhiMUhKNWVUZXJxN0xaM0hUOWRjUVQweTBaTTJKRkdjMFZJWjU2SFVw?=
 =?utf-8?B?RWhXVDNyVmxqQTNNVlk4V3NKeDhSc3FzQzhtclkwaTZEN01kcUwxUjk2NXNQ?=
 =?utf-8?Q?0cpqviJ21Ocxr0FsJbGh5KjbhkfEywlF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0RtT2VVcWo1cjJZaGdiK2xDTWNmUllXNDlFeExjc1FFV1JiMG5hY1VPYnRL?=
 =?utf-8?B?bGNZcjhjbGdhNTRpODFJbkczNTVZY3JRMUxFOFhJNVlaRjZZc2dURkxTU2pr?=
 =?utf-8?B?aFNSTlhvNmhFRzV0T0RKOHVHMlExZ0JGaFY0c055dzlZVXV1aHVJTTMrVFh6?=
 =?utf-8?B?QmxQQzFaS0kwc0NwY2pEMWZ4cTRmK0NSMzJBckZpMG5jUGVLMG5HeTlKVEJ4?=
 =?utf-8?B?S3lkekFrQWxncGpsQ1B6Tk5HUG53bVJ4L0ljZmg0ZGtCMGlpdUpzRWQyYXVn?=
 =?utf-8?B?UVNhcWE3aU1YQkF0dElMaHZNMCtHRThKZ1RhdlJJRnN6REt3L01QZVJ6YnRT?=
 =?utf-8?B?RlN1c2NSR3FVK3pEVktNblRyaTVjejhiTWVSV2pqT3A5UWgwcUNxMmxWcGN3?=
 =?utf-8?B?QXgvNGE5aUJFcDZZK3ptcnFad3VRRFJPM0Z2UkZnMW5EZ3JEOU1jWkw1QjFV?=
 =?utf-8?B?WitoRnlYWXlnVElhVzFHOFYrZUZkRzR4ZTlPbk1CeEdIQ1dwMXAxWklPRmow?=
 =?utf-8?B?a3hsZ3pONGtITEV5eGxhRjFnQ1VrVUYzb0ZyaVN5MW5tUmRhQ3krMldaTllz?=
 =?utf-8?B?SzVPZWgwU0pkbFdxQnhBaDArNUFYWEVxaHJWRzI4NVYveEpIYVF5citBS2M2?=
 =?utf-8?B?bE1hbENPcVlGUWRHVDgvZFdGRnE0M3V1WVl3SkczNkVGYXhzcEJGZVhYdDhw?=
 =?utf-8?B?aXBja3FKT292Y3pXclREL2s2aW01S3RlK0hjVkRxbVI3bFVtZjQ0clQvU2NT?=
 =?utf-8?B?Ris1Umx6NXFGTlJHT1pNUTdqc2N4SVFwc21jNWMzajNMYTZ5ekZ4VHFHbS93?=
 =?utf-8?B?c0NjWXhMUUU5VHM0VmszQ1o1UWhhRWswdkQwVklUMG1kSVQvK2xOclBIRlhn?=
 =?utf-8?B?MndMTXVWZVZSSWVlMVhxeFZxUU53eDlzRnpTVjIyY0VMeVpYeTlGMjR1cU1h?=
 =?utf-8?B?Y1hjcmI4QWpSeUE1T1RsOFJIWWdnMmJDdWxvNXpJR3ArNkxXb1NLV3p6WGR3?=
 =?utf-8?B?MkZobzdNSmY3UC9Fb3ZsV04yblRFQWJsVXdSTmZ5NVVGMnd5V21INDVtM2ZI?=
 =?utf-8?B?UmIyR3ZHSTRvenQ4cmtBdENTNmJrcjFvUGRsRmxuOU8zaUJiS294M1QybFdm?=
 =?utf-8?B?cERPQ0ZKakJYYzVGM1Mwc3phMlhpdnhlODBHcFdaM3cyMGNkWVZXWitYNXhX?=
 =?utf-8?B?RlVFWHRkZ3NBeHlUZ1lSYkNOOUU1UGhOL0FDZUtoeDBkd1UreU9mUFJYMURV?=
 =?utf-8?B?WjZuS1p5VGpOOWg4a0hNS0VWM29NVUhSRHNBYkNlVmNXMVdRQjd0SEVxeXl2?=
 =?utf-8?B?YkhDemc1dURzeWlReVVLeDI0R0dFYmlKTGVnRnJiTnZtdG1JbUg1NW1kMnp5?=
 =?utf-8?B?aUx6MU9SNEtYTkIrakJhUEYzeWhPRzdNMkcvc3N6MmtWOWkxQmNDZUd6dHgz?=
 =?utf-8?B?SVlLYWZ4WjMyVXd2YldiV09yRnRxVTRtcTk2UC9OTWRURzR1Z3Z0OGp4WnVy?=
 =?utf-8?B?YkFMOGkrbkRFUEZkaGxYcExKV2hBL2R2czh5YjRBWmlBRi9FaHlKaFdSaGRi?=
 =?utf-8?B?a0kyUmlocFY5WCtoaStJSk12TVJESlZaVGtQR0ROb1l3d211MitrWHJrMU5N?=
 =?utf-8?B?K3JVUVl0TVVnbjFKaFFBS0thbnpoZjlqYUJNRUlvWjR1bEtrbEJqVDVRc1pt?=
 =?utf-8?B?UmxxNFU4alphKzBpa0p6T1Z2Y0l0aFRRTnVxQ0VDaHcyc0pJUUNhS0VpdTEr?=
 =?utf-8?B?TUVhNmFsNUVyN0xWY0NmV0FkQ2NzcmcxYVhLUUtGaVA2a1VCYmZmNkw1NmNs?=
 =?utf-8?B?Vlo5R0UyMms4aGQ3dXFSSlJkSXlodXRyNXl0alhPSThPRHp6dEdBR3ZISnhr?=
 =?utf-8?B?UWZPd0tOZkE5M2sySlYwcVd2MjlPbm5pd1V0WmxaeWlFV2I0VmwvTENETWFY?=
 =?utf-8?B?aXlBMUVoZ0F3Y2VtWWxRM0pKajJCWGp1bGJNL2JiSFlEWERSeWpXVFdjd2J0?=
 =?utf-8?B?Z09HcTZueTZEb0ZodjBJclB1T1RoUGJSMEExeWx4cHBuaWtpN2szV3l3RkZX?=
 =?utf-8?B?ZHBGbUczKzI3ZGVkTmZOYmsyY3d1aWpkbCt6bU1taDZkUjhuWGhpTFJLWFc5?=
 =?utf-8?Q?9MX/OQ2tmAIxim/iCOf95jyt2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4530a3ca-ce49-4ef2-e484-08dd39221d1b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 07:14:43.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vbepuf5AUcIyZqx36fN3xfH4qvz6q0ewqZDC4tAOmm9c67LeMKBxjlFHXedr7nMNOISh7+3J8fswAsrF2shgPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7778

From: Peng Fan <peng.fan@nxp.com>

With machine_blocklist, the blocked machines will not have pinctrl scmi
devices created. The fw_devlink will link consumer and supplier
correctly.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index df4bbcd7d1d59ac2c8ddc320dc10d702ad1ed5b2..f041478758b50e85d99214f4fe42208d0c8c808f 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -505,11 +505,6 @@ static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
 	return 0;
 }
 
-static const char * const scmi_pinctrl_blocklist[] = {
-	"fsl,imx95",
-	NULL
-};
-
 static int scmi_pinctrl_probe(struct scmi_device *sdev)
 {
 	int ret;
@@ -521,9 +516,6 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	if (!sdev->handle)
 		return -EINVAL;
 
-	if (of_machine_compatible_match(scmi_pinctrl_blocklist))
-		return -ENODEV;
-
 	handle = sdev->handle;
 
 	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
@@ -561,8 +553,13 @@ static int scmi_pinctrl_probe(struct scmi_device *sdev)
 	return pinctrl_enable(pmx->pctldev);
 }
 
+static const char * const scmi_pinctrl_blocklist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static const struct scmi_device_id scmi_id_table[] = {
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl", scmi_pinctrl_blocklist, NULL },
 	{ }
 };
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);

-- 
2.37.1


