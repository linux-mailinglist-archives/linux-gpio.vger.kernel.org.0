Return-Path: <linux-gpio+bounces-31640-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NCHCjpIjmm9BQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31640-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:02 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BE8131492
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 22:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E18630E8E61
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Feb 2026 21:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE33935502A;
	Thu, 12 Feb 2026 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lq2yowtJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15F828BAB9;
	Thu, 12 Feb 2026 21:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770932272; cv=fail; b=ScWtyDwcj6D/wqP5mCbq0n/Mu6Pt64BSIBJnFcSpaSfX2SeI5IUdy4mH3b8TUPEieOa6z7tj3rX79nIA0RDfFB/V6xPDlG3qeHVGFCRkbvM4z79kKnoYqgemJalLb5kmKaxAg3RtvkJvDfLCu2up3Px5Nr91TUJSvhKqthneO/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770932272; c=relaxed/simple;
	bh=XCHHg5xQUFImblsUTbLrNjHJlACVMiXQ0fmJmPjMQE8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DtmFNnudCg3McFHZ3koyU9r6ltMN7pFGftxzhDODVFYW1fPqGkCL8XbtTg+wISRJ+lYFekRwkH73R+mSc81Lf2P7WuQSaC5CCh/Yf3guTowRu6TiURg+559fVnjBJ9kuvmgTSePnB/C3nijUfByNAd0KDVnyxlVq00+nm5Vaj4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lq2yowtJ; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyEtpIm0KvwuFRJ241bFPInoPS3wv2GPq7CPobS4vi87FkBxbCY6O8wf1lrUqFGKFPPDRGuN3/4ElPGc1mUcgT0BL6wQ7huxT/YNUZLebIdfuFbHMTjvzb8NFucUFvZWbyyQyKk9fnHdWLGMCZfQKQ6wXsvvkG7ihqetClQHUwxeJzlrHAbDtdda0mph9sHPKM7NGNtZNXda7vnm4Xd9X183yPfCV1WFl/HTnPpy/r2Swu7v9tuZ54rcGNxpFsQ3bZEvuTFJcNN+0SoxzTbwGw5frO6+9plMMfzpJwhvgqbTcd9uBtr5jMenHZLZL8YkPXhemCFfPQgqsw/mBfrhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9u+o5I7Nd09Hz7oiEvZoe78/DtPn0vzoJC/yhbNUzig=;
 b=kCFpuD0lRx7WMmB3X0lO800cVN3qW+GKrgRHVCtN7tv920sXx8RSIfnwKqsJIX9iKM/0M+HW1zMpu5I8yeAkgNJxwtSc1KvKzzu9l9XUtGXt3o/DZtnh38L2AEs880q3KKu1lzmsFp0MVuEvcq3BVx4DYfquvTCddkJBnDvVV/G3NvZ/2GWO3hUWjImhlpMN3jb96SE0CCUbNh/rkG68CwtXluV15d56MCsg4xXG3gXa9EY9JGqGiJPqCIop1qz/QlbrHvyo8l1rqpOc23PGDywpllhIluPJ+JAtnr2kGp11PP8liptmU0yPRSJtC7YJ0oxs3CSdlbKmieSDCxILWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9u+o5I7Nd09Hz7oiEvZoe78/DtPn0vzoJC/yhbNUzig=;
 b=Lq2yowtJOjE6XR0JyMdFI59LbNMy9ognYbVx0LbIUiA4oS++5xWzV5Mqac2uGL+KYLcHMwL3lgpBlgG+oO7WBLtAH624SbDaOUShoYWjeKjFhgimZwNrrhizWheYnm4veKliVQ58i0g+aiHYmV5sInKJuotPkRHB8qU3sqVdHj0YBoNZBhtWswaGPXr8apW7qgiogYYXEu6YcVRtC+M+1oMq/SuE6wfOltlXJvzEO2qqbnLhClJb9diOHiNL7TdCbOHEzuXPWqckSvov2UDNmODAHpaof0sn6we7GzK/ZCt2b4InMhLdcEBoQzPbHAttApvZcS+qTpVWOqI0AkDxJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB7936.eurprd04.prod.outlook.com (2603:10a6:102:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 21:37:47 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 21:37:47 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	arnaud.pouliquen@foss.st.com
Subject: [PATCH v8 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
Date: Thu, 12 Feb 2026 15:36:52 -0600
Message-ID: <20260212213656.662437-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0040.namprd17.prod.outlook.com
 (2603:10b6:510:323::26) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: 98642628-7c66-450a-c7da-08de6a7ef6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VfGiYZowMDF7Urm/ULNfFPRMiMTDNYHHkCgBcQytx/vbf4PRvSazWv7VZTHk?=
 =?us-ascii?Q?U2xDC4jAFwyDY50PLQWXxxVDr1b/rjN0W5/tHUvD/t5BJryNWp59AA9rx8Ck?=
 =?us-ascii?Q?1Z0eIjQ8tevG4MQTO/tAePWeFiJHaLYcKo0ifTP+MtcbK5H4SSj7tO7z5A5J?=
 =?us-ascii?Q?5o0ET7eiPba0hONZBDWfZnQ3JSRAueHbJyL8Raess6NcIAhP0SDGtXwIU5Ji?=
 =?us-ascii?Q?krmEBdPHeq7Js6B/8zn9KmfAsPP+U32iWR+k6dg6eBybSedjaPS2Gtb3BGb0?=
 =?us-ascii?Q?gJIeuhQXGXnN2RqVbhpP6UYSYQv7gGQIp66cISLVRQMMnkyfU766t5YZzcxr?=
 =?us-ascii?Q?MR0n1uGDvmsGeUOoPhIN+PL7J9+D6dRYXHQQ+oIV+DOHVb7Wn6WGyLum7ZXl?=
 =?us-ascii?Q?gIf+SNCEmNTKfJEmGQqObFUaZ82v+xQeoEQd+x04ILUHvaopMR5PQSv5huhk?=
 =?us-ascii?Q?h0MoDvRQfaOxu4BUncGuov+xEQLMFBYgg/huabDhTUrYbAtOehHdEMdWAt6t?=
 =?us-ascii?Q?xFF3rjQCp1jhEv7v1khcDOu8mjcNxhFKo/9clXlkdEavPzPRQXSSQRBNvp8C?=
 =?us-ascii?Q?AX1aMFb/wsqjTfrpMXLAR7E4b4ZiySLZeNY+QU94QhjEsMNyrGmFmbaGYFp4?=
 =?us-ascii?Q?MrGY0JN+j1bPfGKgFe95yU2w2fWHqnrWlC/KPbfxiNXkX8TlnuPzUacLxBtD?=
 =?us-ascii?Q?SXdzhaurTv/KwAbmufuov6lts1+URbdkVepRzn3eox8h2gX63OiJheTS8Tqj?=
 =?us-ascii?Q?GoRf0lucv05m/+bcHJjaifipIyZkVP8NuCjyYyex+gyNtbFajkGZdUAtgwAg?=
 =?us-ascii?Q?g7De60vTlN+N4T88SYMCSBSEWmbLYlfKY18EFcGjdaoLjisYXgi5BGpLIUjv?=
 =?us-ascii?Q?ttxfl587IWjLNLTHM9NN2NpN8aTsu2x4C2fKcaS0KIfOftKVF+C6nGPGwWy7?=
 =?us-ascii?Q?lyCxF12zolbCD5q4dVLaqNQD7+tyqJv8u8jkBZ2SMOnxqq3xcj0Es9+CicnJ?=
 =?us-ascii?Q?Y0ZQNHT/YKbzcJdgxKEErP01uSY1lefzvaiyhSBxxEYgJPWMNWGB2VDBO0+P?=
 =?us-ascii?Q?3Boaeh1HLCusysL5uwnfbTyEKpirOJWOnbCHFnoHrLXdw5W47/ZB9ntB2O7H?=
 =?us-ascii?Q?KFFcZ5gr2Knav63dFpMHOLWAJTBScXyw5e/iPiN0JlfS8gscLUsk1pnqthf4?=
 =?us-ascii?Q?crVrKi0BNqWPp4LNO0BMmtn8HuFn8oCNY5aGHG30xZFUbPv6UxPmx4GuWoLi?=
 =?us-ascii?Q?hvS0ndylt9Fwn1RWiG0WqiruF+PT5akIWnCKSYFKzLWXeWEf7ZJtYG3tSCbO?=
 =?us-ascii?Q?Jor5xb+hJJfmn8v9kmgb7RyYcqhu0uln3PoLt/rEEL+6x1l6Ym+AcbyPL5gO?=
 =?us-ascii?Q?YI2K9bVuSmsa7/2I8T3qqP90NINrT7DVWDvEONUdhtf/FfLoIJBAe8OhWFb1?=
 =?us-ascii?Q?zVnxV48Y+uEF66RoFWxZ033yCwpZGbF9xOr16IFNAqg47mN3TXQ12sWIqUEO?=
 =?us-ascii?Q?vku1qDpFsF5YBUkGurCLFtERjlMPIHjXN833EvBtdbnVGSmDS8qvRsESMxpV?=
 =?us-ascii?Q?cGLBa0k8xhChUTSPMR9Xf5gN4g0POvKRuwSmEzObkaSaRvNPukRV2g1P7HWM?=
 =?us-ascii?Q?ZmhCnenaEyQvHZjgydZ+mKFw0nJ7lPnDWqJW1toP9MU4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bNSj1mypChlNQnwiYixQIktEY9mwxalV9sNejzI/f8XgzVDILBP+0RIU5tbh?=
 =?us-ascii?Q?Spv8HvzRtbqz4dYH5/ITz1cJFvdFTVh9tNAPwM2FR/joZb+lKr8Qe8SRs4Vo?=
 =?us-ascii?Q?teXQC7bifNoiyIg8B8nEFmAhouU+/yUyo9iN5jbUKBPV5shcCtK2iGn/6Fc9?=
 =?us-ascii?Q?TYYmPDeFZgZvZe33LJw92PkLV+YyQ+DSVzKWA9y2+buglu00TtBvDqMi2Dfb?=
 =?us-ascii?Q?AKCSwmegGobw/Q5mSxucBFkFFEk0kyUorpTk0+ILZkpN+JApoPJ0LL13fup5?=
 =?us-ascii?Q?ReZTsCRdJNhcsMEunF+a+Guz+UU4LdgPZW2n0EYfRUepa/nAAkNA5mb867fE?=
 =?us-ascii?Q?0yeDwFF+sgDh5HyeddUK+oCmRT+BPGzObwJB12u8+0GQNjaiNc3CltFsUZMf?=
 =?us-ascii?Q?5tKpzAiOQA4wVmADhf95At6Oj30ki+C+nqaojhOO+AIUqvrVHfBmMk6AUKID?=
 =?us-ascii?Q?CLKx8Zz2YyIQSAY4ic8eji8m3MXTRrqIe8dhavntScwegSfqAX1zn60AqTiI?=
 =?us-ascii?Q?+OxWvVEQqkmvf5eKqx1mQfcvn5o68I8CB2yEDbwAU2wBpE0KF3gTzindx4PT?=
 =?us-ascii?Q?S584BALK/tUwJnRFc3nE6Q6ARWiH07Kp5AYAkff/lMWBU1GODnaO5lQNdvQf?=
 =?us-ascii?Q?zKRtDnKtBxq45HLz55LWx+I84JVy67E7f+QLXoltHSKzUqOSi3V+pyCz7ycb?=
 =?us-ascii?Q?wgMJN6FqbB5UytyhFaymXlLt6tenhUisdUu25nM7zZ5YWz1qHgR/j6tkEFYS?=
 =?us-ascii?Q?GxspG5xdwyI1lX5Y+h2IIGbfzK5B2q7QjpZXqf8nQXmneapY3QPK3GQPlqNO?=
 =?us-ascii?Q?ABh7fxDp56VyZ9hhM98vO2vinMJbKyh5mue7weYltwkBDT2QXTtl5+RL/6jc?=
 =?us-ascii?Q?PD+Y/f8YrZJH6oT7OApmHcJAsmcQvGhg//WQz1Fe2FEj0da2RTE+4tBSZjIn?=
 =?us-ascii?Q?MRmklfhehLUgg4R/gCsJLqpgImktafy9MlJPr0y+UcfRz0UGk43tfW2AWD8C?=
 =?us-ascii?Q?dpwWp15fwQypfgviP7ioVncBKyw77bB4lGrdrJ33S+IhsNi60teCExOfRtXZ?=
 =?us-ascii?Q?b6Pl+u1KAbxmgRWcvrLUnC1Wts/WxpfCDBsXOUDD3ZL6gfwVGbfSj3wQ0T/o?=
 =?us-ascii?Q?pGCo6uDvvSuO+nqWB5JWbltuPFKVrWYHS3Yc0P/FwDsrJMySVG1rHkF2Oqjn?=
 =?us-ascii?Q?rcw3bvbZApodgds/WCmk5OmKSXyXvKG0ieV/dqJnCaxbUZgjgW0h+EXdgm+O?=
 =?us-ascii?Q?QeYVSmmVAePhmMc38yeIMaUizZtVIL+KSKQ6kx0TKDyQlYlENpJywzi1eLNF?=
 =?us-ascii?Q?+Vvm22cbfIQOFxYrR3nCPuTjTRHim9PXXCEGdATV+qfhU6B6e8a0vLUIHVQc?=
 =?us-ascii?Q?+HaMNGD7Jrwix6/J4buUrD0zMQoH+MJ87n6cI6oLGXZMt6aEurFlJ8cXbGi5?=
 =?us-ascii?Q?WK8j/owS460/fcq1fP+6Fn574sYKhZhM7X3fOhucTVlgMgQ4GXdJy3Li9Btr?=
 =?us-ascii?Q?rv29TLuaioNKrGW1kiX50yTYKIRT5CjfAk05pZXu23fUHVKV9eSXpNxRFZs2?=
 =?us-ascii?Q?ArnhP35MMKoYCrCgtl8gIyy7IB7lTkSrRHtV6gv20jafuucePDGEN+J+Bn57?=
 =?us-ascii?Q?0H1GiurBTk4Km2TuO76swvO/wDNMaJQ+Zr6BnvitBOYBYwokdXT+JQKMtCHP?=
 =?us-ascii?Q?3I05dI+rNI/BC0Zd3WE+ItBpGAehda0xAK/TBZiWHJ1TLZwQY5ZYkpatz8sD?=
 =?us-ascii?Q?iZiDZ1H1/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98642628-7c66-450a-c7da-08de6a7ef6dc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 21:37:47.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CARB7P/PrgQBLYUqk0SuvPIVHG+3JDTxDFHGyQI+LttK0ll3vt7Yyc+y16ucDvuJhfNfz6SJtOMr/pbCaVklQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7936
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31640-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2BE8131492
X-Rspamd-Action: no action

Support the remote devices on the remote processor via the RPMSG bus on
i.MX platform.

Changes in v8:
 - Add "depends on REMOTEPROC" in Kconfig to fix the build error reported
   by the kernel test robot.
 - Move the .rst patch before the .yaml patch.
 - Handle the "ngpios" DT property based on Andrew's feedback.

Changes in v7:
 - Reworked the driver to use the rpmsg_driver framework instead of
   platform_driver, based on feedback from Bjorn and Arnaud.
 - Updated gpio-rpmsg.yaml and imx_rproc.yaml according to comments from
   Rob and Arnaud.
 - Further refinements to gpio-rpmsg.yaml per Arnaud's feedback.

Changes in v6:
 - make the driver more generic with the actions below:
     rename the driver file to gpio-rpmsg.c
     remove the imx related info in the function and variable names
     rename the imx_rpmsg.h to rpdev_info.h
     create a gpio-rpmsg.yaml and refer it in imx_rproc.yaml
 - update the gpio-rpmsg.rst according to the feedback from Andrew and
   move the source file to driver-api/gpio
 - fix the bug reported by Zhongqiu Han
 - remove the I2C related info

Changes in v5:
 - move the gpio-rpmsg.rst from admin-guide to staging directory after
   discussion with Randy Dunlap.
 - add include files with some code improvements per Bartosz's comments.

Changes in v4:
 - add a documentation to describe the transport protocol per Andrew's
   comments.
 - add a new handler to get the gpio direction.

Changes in v3:
 - fix various format issue and return value check per Peng 's review
   comments.
 - add the logic to also populate the subnodes which are not in the
   device map per Arnaud's request. (in imx_rproc.c)
 - update the yaml per Frank's review comments.

Changes in v2:
 - re-implemented the gpio driver per Linus Walleij's feedback by using
   GPIOLIB_IRQCHIP helper library.
 - fix various format issue per Mathieu/Peng 's review comments.
 - update the yaml doc per Rob's feedback

Shenwei Wang (4):
  docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
  dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
  gpio: rpmsg: add generic rpmsg GPIO driver
  arm64: dts: imx8ulp: Add rpmsg node under imx_rproc

 .../devicetree/bindings/gpio/gpio-rpmsg.yaml  |  55 ++
 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  53 ++
 Documentation/driver-api/gpio/gpio-rpmsg.rst  | 236 +++++++
 Documentation/driver-api/gpio/index.rst       |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    |  25 +
 drivers/gpio/Kconfig                          |  17 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-rpmsg.c                     | 588 ++++++++++++++++++
 8 files changed, 976 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
 create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
 create mode 100644 drivers/gpio/gpio-rpmsg.c

--
2.43.0


