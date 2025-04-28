Return-Path: <linux-gpio+bounces-19373-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 059FEA9E624
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48ADE3BCE75
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4F71C863A;
	Mon, 28 Apr 2025 02:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M3mjz4Wz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A13A1C6FFE;
	Mon, 28 Apr 2025 02:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806263; cv=fail; b=PAmAR4OvzoTiwt/OX4S0lMEBxvmhiJD7K5JwYAbSHuyxkwTlphoUaf0SO569K7WLHYg66xp5OVHjetkrJ5b3U8F2Ljs1rUXcLaMwZvZHng2c5CseAkeRrCdJ0f6XH5eHOfQr7/TjMBTsKZXEV5rFBvTFf+3y3HeYHKzgJDxiI28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806263; c=relaxed/simple;
	bh=hRlT3/ewzgRHoWAAW4auCAg3K5hopTijr31RLhkkEZQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iPmgrTeBAi1qFaytyLpIe8+C9pr76c+yhqXpYZI6pX7TXQ0WU5tfxk5ks/i40dze0gKfN+04Pkqbdyia9wabRN3amBTq/5IGz7Yjldtv/EPgodcBxHCuEZ2jUW1Y/aqSB5556b4a4LG4Ixhz9QODN7dor3N0YN1YW6WWP1/KrKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M3mjz4Wz; arc=fail smtp.client-ip=40.107.20.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR+7y+7Qb47QppkUpdXScb/ULC20xUnghUNHeIVf5K5tlJt8EsJPnCgWhl/ohK3dvARpYLHbD0yQyMCjEo+Hx5dkxtbBejLj5qDqDJCq/eXL5miYCK+B18of7r5eh3j6tv56Psh2r4Na2T689frN3g7/Is8RQaybEmyJNST7Mf8gzstinrs6nd2PzGVHsxObMD6IbFo+kpwoPMI366wZCXmEuxNKWhcfThrJkz1ie4RKYaN2KbOq8KHZzgNZcUWBftrj+wVKoP1XCN/EmCWTcn91GyKLUwWH5gPXTr7hKyQdrI0fZYnvoFUN+ao4Mqtjeaae5kQ9/1bgRXeas4KEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NzIn22C/bCqKKCp92PT/0N8Qjb6tiddD259dSvsaWRI=;
 b=UXPM+1P+oAetj6mLSA7BhUS1AHAtBOFNQNBxGTie3O64UGK26QYOT0mldcQdXnbgAGcQ4yrMG3R84MQwqUhzW1A8gxMKBANIY/xqsHdGT6y3xtA8qISuDU0RNxlT3yhnDFm+qKUDqlDZy61ymOfwyyIZBsM12Jtlz21j1pBqqkHq1mDgqHTsLugPQEorKs8UEstSol8Br9MJpHQs0FytlEdxyRzPDW3TIYaAL/dZ0JgHsjx9kBbpLdebToUNMhTcvgeOtuDOzhuNpk+xO8UC+NlEW6e+Pi/kNT5z/CoTupfo7/nawZFOpfXGfZGHmg05dfnu6Vyu2jlZ3isWeK9hUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzIn22C/bCqKKCp92PT/0N8Qjb6tiddD259dSvsaWRI=;
 b=M3mjz4WzTeQktogC7gWiphCemsA1j102AHPgj8kV8kZ7nwjmhg7KNfhuby7MpZfRfLC4CAbENcn54LNIITxlQKgo3M7SlyaZOtpk7y4oOpcYJ2+7RJ7xZIrYL0NeJFiL0NWmhHiFqGzGw38vrstSD5s/ivjSp31eMptHAMqTltPkCtTyjJ+PjnM+o0mt7yYHFX2T28UBxdS5LoXLcF+8MFu8ABdRE9q3EYKFezb2TqOe5U5wg4ZBac/Wlq0M4FQbcNcjk9S+fNGSmhFlLDVmxHwKkoalvkVKJigVENqyHh0x6bUPnXXEIO4BKeeguGkZb1BH4Qh8wBUqRboWL0j+hQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:09 +0800
Subject: [PATCH v2 8/9] ASoC: codec: cs42l52: Drop cs42l52.h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-8-e8056313968f@nxp.com>
References: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
In-Reply-To: <20250428-csl42x-v2-0-e8056313968f@nxp.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=4795;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=+Vvp6+/DXS9mmi5+1a0ljPE8nIjFVG5lF9th4X+L+ew=;
 b=UNon3MNQXjyFipqZNeSxEEdandzgri7dISt2W39bP18q0P1qqykhrL6kTjBONeAzTEzBRZnBz
 0Yt/T7yZvydAufxwtX6eN15iz2+aCdTI2Wc2LKeg6BGUKfEr9CVQuZa
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9901:EE_
X-MS-Office365-Filtering-Correlation-Id: b6cd969d-b6e9-4b63-47e4-08dd85f9eb42
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnRoYm9sRE9ub0MzUkpPNFZwNmRNR0x3NEZYZ0pwd0dkSEltNTNBSUlrRGtn?=
 =?utf-8?B?WVNYeHlHMEptZk92eFZ3QW92a2dJem5Va08wSjF2K0xHVXRDaDlhZzYvdE95?=
 =?utf-8?B?RStWT2tLVHhUNkNydE44UnVGQ2g1azFBdVpOcHpZTnQydUpVYjF3c0JDemFY?=
 =?utf-8?B?Q1Y0czhXSFRpSUwxblJFOXUreFFURjNRWEhTRFNmMXZSb0xabmV1NGM3UFBt?=
 =?utf-8?B?QjZIK05RNTd5MmhpVTlMeWxZUC9FSENKQnI3SVZiWFJSV0lIVll5c2tkdm5S?=
 =?utf-8?B?cTlyaVJPN2hRZVZoZVRTRE8rUlhTRGhrczRDNXYrUmpMYVoxUGR3NVd6QXpP?=
 =?utf-8?B?YWJtU09hMVhuaTFwc2l2TmE0UUljaTArcUFzYmZ5SVVmWjU0K3VUaXd2Q2hm?=
 =?utf-8?B?YTFQaWNUQytKUmJvZTd2YUpZWDhtaFA0c3FOV0lGQkM3bHg1eGdYVENId2xx?=
 =?utf-8?B?Q09DMXpPK095MEM0TVdmUHNlcUhDZXI3VHNIZ0VDNk1CWXpGZDM0bVVFSk85?=
 =?utf-8?B?cHRUNURuZWUvZWVVZFJKaFpocHhwSUlHaFJMTDlGWGdnSzJYYkhLQVYrOFM5?=
 =?utf-8?B?MENFbHZERm1ROXI1L0M5RkJzcTZvVVpIVWYvTjNSMzR0d1p3a0NVUm1ZSUNK?=
 =?utf-8?B?R2ZxSXpqdkdEUlVXeVQrc2RGUkJOZy9lOEdWTytLSjhkcm43ZUUyWjNLWFBa?=
 =?utf-8?B?enBaeEdIWGF0Qm1CcUNrNEQ2SENOeEZQL01BcmJhVkFWZDZMem9MbWhkTU5O?=
 =?utf-8?B?VHVWWUQ0d1lqZzZyMXlpVlIrY3RrWFptOUJrM3hIMXFmb1V3OHhPa0cxSFpv?=
 =?utf-8?B?SGplK1kwUjRqZE40WWVWYmx1N2dzcDB3eDZGanpWVGkzdEtJVHc0V0hwcXlv?=
 =?utf-8?B?dkpaTzNBK2dML3RCVndoSVR0aVhhei9GbDUzdUxsMGVVc1F0WmF5aVYwNWg5?=
 =?utf-8?B?NnprZlZFU2lkY1h1Z2ltM3BZZEo4bkFiRnhjUk5mTVJvei9QUCtVVE9pMmIy?=
 =?utf-8?B?bEdmeWNJWU1MZjc1a3FFQWNLdXE0QUN0WjdVSWI2U09zQ29hT1QvMnlUbVVx?=
 =?utf-8?B?b1oxcGFPdGRVMGhUblhEem5XOGszd05XUmx2eFVTZ2g1ckFQQkVkVU40Q1Zz?=
 =?utf-8?B?SHZZOTFBZDNuS216dmFoV0k2Tk1ySDRNY3Vhc1pQdHpLdllmdjZYSCtWcDVH?=
 =?utf-8?B?ZmJzcWdEcjdEeE9rN2cwVjdydVpuYjhaTUFJejdlZ2ZBOEZUcmdjaEF4MURi?=
 =?utf-8?B?VTdab0c1elN6VXMrVFdDR29mYmhaS3RZUlN2OVJNeEU4OTJnS21ORnNxZFZy?=
 =?utf-8?B?T3Zsd2QzZ0twbjJPWk1obGs5bklCSWZkSXdnU2JiWk5KbXpWbklabFBEdUlC?=
 =?utf-8?B?em9xQ2licGZhZStkTU01a3hTUE1EK2VUSjVkY21ER05mWkJKazhPSUZXSVYz?=
 =?utf-8?B?a3pqRzQ0bWJuTVFjcXZ5YW1vQkJ6RlZadzlOMHJmVG9BMHZFWDNpWC9WV3Fn?=
 =?utf-8?B?YlJkcUlzUlkzWDcwVEJhMFBnZy90V3VjZmlBTElqNlB5UzlPMHhsYVNaYlFI?=
 =?utf-8?B?YXF4L1JTNVpkOEFHYzZQR2xMWmVLK24zNGRQMW5Na3ZKSWxyeS8wUWRueTFM?=
 =?utf-8?B?aWY0L1NEUlRXWmg5enBJUFBQMmFOamFTZFg4RWNlYlFiL2ZheWU5RVJtQjRV?=
 =?utf-8?B?Sndpbk92RHlRR1VNQ1RrWDJMeUw4Z3dWeUFmUzV6dVpMNG1kbWE1OVF1elRD?=
 =?utf-8?B?OFdGUmNEbVhFM0h1Z2dnclNVVU1tU21UZERWenIzSWZzUkZ2cjVHenRtWmMr?=
 =?utf-8?B?citNRUc4enZHVmo1Y05EdXVQODMvMHpGVk5vdFNUc1Y0eXh4SzBWR3VubFFm?=
 =?utf-8?B?YjZQeXpTOWl1VUJyeUlJNXZYZnB3anM1UFVQYVAzeWtOcnJHOHZmZzg2RWM4?=
 =?utf-8?B?dEE2dG5CQ1ZMU2ZUdFJxdENvb01rSGZ0RENxNjRwVTM5WURqenczMUpSR0Iv?=
 =?utf-8?B?QWtOY3RyUWpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEY0V3A3c1VlVDMrRSt3RjhQVW9URHhHS2oyZVdGVkxFTVhtekxmZkRTQW9k?=
 =?utf-8?B?UDFaaG42dTN6SmFRMXIrTmJzOTNUV0ZVNjM3a2ZwV2JYNEFqeWUxVkhpeGJQ?=
 =?utf-8?B?K3V1bUhnejIvM2tLbDBXb2d0YktUMUhGWjkxa2RCNkl4b2QxSEtZaTF3NDlI?=
 =?utf-8?B?bHFQdXhnT1BwL0U4bVhaZ1dicExtbmE1dkJSMHRNenAxK0haK21iM0lQRm1G?=
 =?utf-8?B?eDRJYmZvdm0xZVBsWmd1WkY3YUtrYXh2UXdiNm1tYVZnd0xLSjNGa1JPVEEw?=
 =?utf-8?B?c3B0cmlLYU1xNXUreWFoOW1XZ3g2UVYwQkhZRFdwS2xrR2xnNW5SOHRjVG00?=
 =?utf-8?B?S3dpNnl3UHpNelVvQ2pEN0ZyMEJVUGMvNkpWRVRRU3BBZXZIQytBdjhWdXMz?=
 =?utf-8?B?YWdWRVo4S0h6cWpwY0pOTmQvU3BiNko5ZG53ZHpFQlFvM01RZWcvbUZOTi8z?=
 =?utf-8?B?WGNPMWF1V3FpRlNmenV1dFhLRk0rT1V5OVpWd1VuVmlPZlNSOEt4aWo0bWt5?=
 =?utf-8?B?QkE5aWFoNVdXS3UvdEh4SGJoYnh1UzBqOUpCc040cWJiSUFFbllpdVdKZzd4?=
 =?utf-8?B?MUhzbXpLaEhNQkZtNndBNlNkMXBvaWJHNHFjbkd2N3hFNm44T1M4SS8reTFa?=
 =?utf-8?B?ZW1LWjdjMGI5MDExQ244TlhPWExkTmExaUVTQ0doaG1SdWhPVktEN0N4N0ZT?=
 =?utf-8?B?Qjh1b2xUaU1peVNFcnBJYmxMaTJpc25iOFk1QzY2bG0xdUN1eFNySzRQeW5L?=
 =?utf-8?B?VVZLU3lyYjNVUHJTVW1LZno3S2hIUXFNR3Z5OWxCNUh5MFduTHR6NVR0WUxK?=
 =?utf-8?B?WW9xK29TVWpCckVZZXNkN1E2dFJxWU5aTi9DNThuMFNKdllQMDdROVhncUhZ?=
 =?utf-8?B?aUl2dEdEdEFJUGt2bFRGMk50RXBnb2ZZL1lrNmZEQ3NqL1IzeCtSRFo4MXd0?=
 =?utf-8?B?d0xsMnd6ZDVrM1JQaC9FcU5yYzVmR1hkc29GZGc2cC9kbElHVXV4V3Z6OGVZ?=
 =?utf-8?B?cnEySzVsbXJYMmN2NUpXNkRONmpZWWhoOUgwdGxkQVVVTklUTkhKNE5mMUFk?=
 =?utf-8?B?cm9rcUMvU2pRSVBTWDB5UXpUVThQMEdlM2d0elJycWJCbU5mM05CVzlFVmhS?=
 =?utf-8?B?eG8vZkJDeW1JcVQzZGtDVWtqaFgzUFljZXlnSUNYcHdzdHNUQ2Y2UE96SE4z?=
 =?utf-8?B?Q005YVgrU0prME5QUk9WeHdGWXlaU2gvMG8rYnZrVnNHSHA5NnhjQlZzS29S?=
 =?utf-8?B?SUE5Q3dCUkgvcUZFbWRoWENQSU85YU5ldzZUOGVLY1ZYYmlxN21xSG5Gd2tp?=
 =?utf-8?B?UnN2aDBsYnRKdExyRDZlNUd3L1NuVDVJVTZOV2tLbXdhU2l4cVhkNmFLWnp5?=
 =?utf-8?B?RVNpT1N3b2dlRzZ2Q3ZTd296SnFaREVJSHdCd0I0YUNyZGJuQ0dnbGZHWkxY?=
 =?utf-8?B?WXFDNlJab0lxM3MrUktTbXhSK01oUUVVUDhKNWtVeUhObDVtV1R2YmMxcVo0?=
 =?utf-8?B?OFR6SkF2TURmUmg2Z2xMQS9BNVgvM0tvRUt5amJxWnBTYy85U0s3b1hDLzdK?=
 =?utf-8?B?c0lXaHd6azVmdzgvc3Bla0c1Ty85N0YrYVdFL0NINmFwK2d4Y01XNDZSell6?=
 =?utf-8?B?Z0FXN1JxZ0RqalMwV1FUeVlkV1U0QStTcEVQODB2bjBsZ0o5VjFac1BEZGtN?=
 =?utf-8?B?K0FONWVmcGFndlg1WW1UbnZzWlVobUdObXVubHJEc1g2WXVBSUdZWFhUTUI2?=
 =?utf-8?B?Rk5mMmdwNzhpcWlwR2hpTldrbGNBeVgvUFNaUTRPM00wdEZUaGJ4QmFBd0Ey?=
 =?utf-8?B?OWVibnNxMGJJYVhKL3F6WjJQUUVRRm1NdWZCcmRoSXg4WCszQVlkMDJIbS9p?=
 =?utf-8?B?NUZSeTR2Y0VUeGw1Qnl6REtsWDAvWGlqdUdWc1g0ZTFQbGl2cFd3UytEc0Fj?=
 =?utf-8?B?dXJJS0gra3Ztc0VuVmsrNm1WZ0VpWmptb2lwK3lvVTlQeTJuN0cwbWR1Q0tt?=
 =?utf-8?B?NFVENWsweHB1NGJoQVIrbndZR2VqZ0dlbWMrbjAwQVE0dFhOWU9ZbGJ1MGxq?=
 =?utf-8?B?ZTRpZ0FnV0t0bTZLamFJQkFyd3ZhTFMvT1RhNWN6cGZ3Z3NnV1BVSWxQTjNj?=
 =?utf-8?Q?aK9vVE2frOX9EvYE5PXwoOS5L?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6cd969d-b6e9-4b63-47e4-08dd85f9eb42
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:59.8345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/cn+UP/t13Cr0HMobhNWWK4FRM21Ij9NpoTtxCpGvqgJRNRN/zJwntdLeUw/tQjJIe9jSM6ku40kq+FkngGHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

From: Peng Fan <peng.fan@nxp.com>

There is no in-tree user of "include/sound/cs42l52.h", so move
'struct cs42l52_platform_data ' to cs42l52.c and remove the header file.
And platform data is mostly for legacy platforms that create devices
non using device tree. So drop cs42l52.h to prepare using GPIOD API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l52.h    | 29 -----------------
 sound/soc/codecs/cs42l52.c | 78 +++++++++++++++++++++++++++-------------------
 2 files changed, 46 insertions(+), 61 deletions(-)

diff --git a/include/sound/cs42l52.h b/include/sound/cs42l52.h
deleted file mode 100644
index c20649666abe5dcbbf628f6c2d1692d3e7190eeb..0000000000000000000000000000000000000000
--- a/include/sound/cs42l52.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l52.h -- Platform data for CS42L52
- *
- * Copyright (c) 2012 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L52_H
-#define __CS42L52_H
-
-struct cs42l52_platform_data {
-
-	/* MICBIAS Level. Check datasheet Pg48 */
-	unsigned int micbias_lvl;
-
-	/* MICA mode selection Differential or Single-ended */
-	bool mica_diff_cfg;
-
-	/* MICB mode selection Differential or Single-ended */
-	bool micb_diff_cfg;
-
-	/* Charge Pump Freq. Check datasheet Pg73 */
-	unsigned int chgfreq;
-
-	/* Reset GPIO */
-	unsigned int reset_gpio;
-};
-
-#endif /* __CS42L52_H */
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index ba2ccc818ba6cc1b5fbcfb38e07e9bc8f68c4a6e..aa8c001cce099e3c1dfc979678fe8000caed097f 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -22,7 +22,6 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <sound/core.h>
-#include <sound/cs42l52.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -36,6 +35,24 @@ struct sp_config {
 	u32 srate;
 };
 
+struct cs42l52_platform_data {
+
+	/* MICBIAS Level. Check datasheet Pg48 */
+	unsigned int micbias_lvl;
+
+	/* MICA mode selection Differential or Single-ended */
+	bool mica_diff_cfg;
+
+	/* MICB mode selection Differential or Single-ended */
+	bool micb_diff_cfg;
+
+	/* Charge Pump Freq. Check datasheet Pg73 */
+	unsigned int chgfreq;
+
+	/* Reset GPIO */
+	unsigned int reset_gpio;
+};
+
 struct  cs42l52_private {
 	struct regmap *regmap;
 	struct snd_soc_component *component;
@@ -1090,7 +1107,7 @@ static const struct regmap_config cs42l52_regmap = {
 static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l52_private *cs42l52;
-	struct cs42l52_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
+	struct cs42l52_platform_data *pdata;
 	int ret;
 	unsigned int devid;
 	unsigned int reg;
@@ -1107,38 +1124,35 @@ static int cs42l52_i2c_probe(struct i2c_client *i2c_client)
 		dev_err(&i2c_client->dev, "regmap_init() failed: %d\n", ret);
 		return ret;
 	}
-	if (pdata) {
-		cs42l52->pdata = *pdata;
-	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
-		if (i2c_client->dev.of_node) {
-			if (of_property_read_bool(i2c_client->dev.of_node,
-				"cirrus,mica-differential-cfg"))
-				pdata->mica_diff_cfg = true;
-
-			if (of_property_read_bool(i2c_client->dev.of_node,
-				"cirrus,micb-differential-cfg"))
-				pdata->micb_diff_cfg = true;
-
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"cirrus,micbias-lvl", &val32) >= 0)
-				pdata->micbias_lvl = val32;
-
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"cirrus,chgfreq-divisor", &val32) >= 0)
-				pdata->chgfreq = val32;
-
-			pdata->reset_gpio =
-				of_get_named_gpio(i2c_client->dev.of_node,
-						"cirrus,reset-gpio", 0);
-		}
-		cs42l52->pdata = *pdata;
+
+	pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (i2c_client->dev.of_node) {
+		if (of_property_read_bool(i2c_client->dev.of_node,
+			"cirrus,mica-differential-cfg"))
+			pdata->mica_diff_cfg = true;
+
+		if (of_property_read_bool(i2c_client->dev.of_node,
+			"cirrus,micb-differential-cfg"))
+			pdata->micb_diff_cfg = true;
+
+		if (of_property_read_u32(i2c_client->dev.of_node,
+			"cirrus,micbias-lvl", &val32) >= 0)
+			pdata->micbias_lvl = val32;
+
+		if (of_property_read_u32(i2c_client->dev.of_node,
+			"cirrus,chgfreq-divisor", &val32) >= 0)
+			pdata->chgfreq = val32;
+
+		pdata->reset_gpio =
+			of_get_named_gpio(i2c_client->dev.of_node,
+					"cirrus,reset-gpio", 0);
 	}
 
+	cs42l52->pdata = *pdata;
+
 	if (cs42l52->pdata.reset_gpio) {
 		ret = devm_gpio_request_one(&i2c_client->dev,
 					    cs42l52->pdata.reset_gpio,

-- 
2.37.1


