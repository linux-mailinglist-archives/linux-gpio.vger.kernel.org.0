Return-Path: <linux-gpio+bounces-8364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD5D93A13D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 15:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 592441C21D3C
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E84153503;
	Tue, 23 Jul 2024 13:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J9H3+6ZS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013013.outbound.protection.outlook.com [52.101.67.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20DC1534EA;
	Tue, 23 Jul 2024 13:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721740809; cv=fail; b=fgi0xT8J2q4sPzXuAg1jD0VJUa8bzQ9KUpa0iVIcqQslNcTE14yuk6BGDvWWNo6QGmqwmLYebyh3uw88eWb+cA7l4xSyoTAwLTpIYpYdt67DkiFBA65aJz4lAENc0q5TT00JeXL3COZbe3N1hilI1/9HWV5eP0iOgsgXeQxfscs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721740809; c=relaxed/simple;
	bh=BxeyC++ixUQ/DDPMQruJne9IXCa1QLDuiukr9AcWjfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gNOHu6DWRtAopBDdnhuzBmb5UqJ4zNeTqty+7CVONMpRv1ku3ZG5d+kWu7//YeRKGIvAKDa9nvVoIFkmj4rN7i2IJVfZ1jYq1qlr9jUj8dhO7cov1b5QnGKTAZi4cxpwVvcx1b/YLqiYs18cxb9ZgGfKUBfSpnaTTh8wxwFwau4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J9H3+6ZS; arc=fail smtp.client-ip=52.101.67.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSO7gEgDE8YTT4XBsOJs1b6f3RcmpNrv4rzVBrU7dv25scftQ7Rcj5mQsCxkIE1V5KGzwPYDQKZVwufFpIdNDDpuarjTIO+nX/UlXq5cAjefN4k77NNkckxwejYdoxDnKALblXfXuhxjwK81c0ub7fiKYWO83ByaE8VVwyYg8ApNhGv/yv93JrKDcf9IjrmL3x6mX0POqTZEHe4dU8j9HgKmScGu+unuhWzMvvaIt+WWhhzfTumHg0ELEkwDBmsg/1yevXiWZY+NTVJQ7PyLNTjzmDI70Ofl3Gb4u8grNS7Lm77sB0JYIR5N4fu4pcGPXtGt/gjNN5bhyYHd5kJlHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyfZsYjdSbViPO0x0p7LWcKlsSwIsX5zoGU9VGGgztI=;
 b=k9CVR1CWMPAmKtE0EsinlWxkCo2n8lrWzvWB0Oa2Y1mWQvmJp/cVBXNz+TB5KXjN3s7jngsYpEUU2cL/BBpC9QSUZwHnZWTprxGh/Co4nptISn8IfPGMUhQYqN+3oXll+WPNZ5nsdOpz1z+s+ythxEpSHdXINiMkNSOtkWZAEuiE9sWo0pTzYN4z5FpSh45ORVngwpoLJ2GJ968ZbFaxyMC8iSkfnd6Id4864nDvfs2Fc6ljDcd51y2IlHXOmqIdir/FE09c/EdX31KMjzUrx84Tm7KCm7KNah3Mr84LYU4Bd3UgxKc4X3XCk8RFVq24rNhvlHq/P1/+EI66fkWWMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyfZsYjdSbViPO0x0p7LWcKlsSwIsX5zoGU9VGGgztI=;
 b=J9H3+6ZStyvyKXstiYgqFgwxkShO9JQQZmk32VvKRo/Nbic6SoA6nXPuibO2nohVkoch/0VU8YxwJJDeKbHJt7QKW62koGjZbggMCdpEwM67Z1vxv2fg7y5/Y9+ZfzSKVC0PY6BXrFm1jx781zCqkZDO3V9ewlFm6LNDmz327M4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by PR3PR04MB7258.eurprd04.prod.outlook.com (2603:10a6:102:80::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 13:20:03 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7784.013; Tue, 23 Jul 2024
 13:20:03 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Florin Buica <florin.buica@nxp.com>
Subject: [PATCH 2/3] pinctrl: s32cc: configure PIN_CONFIG_DRIVE_PUSH_PULL
Date: Tue, 23 Jul 2024 16:18:31 +0300
Message-ID: <20240723131832.1171036-3-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
References: <20240723131832.1171036-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::8) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|PR3PR04MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: c758b6c0-01b6-44f4-0433-08dcab1a29be
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEVtbWUyWTlqVUlLWC8vTVdxSGFtUXRMY1lqRzRBSE8wdVJFdENRallyb3VR?=
 =?utf-8?B?ajNkSDh1WnBoSzBCL2JrbnRHbXhzclJaMC9tR2dDTVp5emNRTXRaNmw5Tmc4?=
 =?utf-8?B?dmZFdk40cmM5OHJSYlAxZlpHMFZHWjc5dE5tbDBtaGdZTEJ6RXRHNWE3YjBK?=
 =?utf-8?B?OExzSzZRZEpiUUxwUVYwZUxJQzZObHZDRGJnbGt2MEhYMjRBbnNENVN0MkRm?=
 =?utf-8?B?cksvb0pEbmVWLy8wdUd2d29lcU83Vk9kTlpKUDJaSUVzTTA1QXIxemQvWnRy?=
 =?utf-8?B?UzdRbjN4SXZUM0NjeDB4ZmZ2N3BUaWtkeEpnelFveFpnN1l4dzBPa3dXckNP?=
 =?utf-8?B?eFBLV0JVMzJ3VDRRUndiNUJGRi82MGJNRVB0V01INFc4elJPdjhvZ1FCTmh2?=
 =?utf-8?B?QldpVWtMVFZORWI4WndKQTVFQXp6TmdzUC9pdmlnMW1GVFd3bmtNM2xpWnFJ?=
 =?utf-8?B?Q29yMDZ4SlhnMzhtM2pCeVlQdmxDNFBGTUhjSTFwN1JncUpsQ3Y3bThKRHNB?=
 =?utf-8?B?dDhRa1NiVityZVo0T2F0NmZPc1NxamMvMXNXbDhJelVnMklMTjVhM2I1WVNN?=
 =?utf-8?B?QmdxY3RFMm8veEpaMkN2b0djOTV4Nm81a2UxcWNhdk9FU1lhZnpmRVJKc2M3?=
 =?utf-8?B?S0Mvdm5hTG1nQkhjT1MxMkIzaWNYZEJudElEQVU1RVJIVnNDVWdadlcwdURn?=
 =?utf-8?B?dDNSM0N2ejVoalVWZjdCK2dMUW1LL0toYXBXQ3VUTWsydHNxTGl6bUVIcXFS?=
 =?utf-8?B?REVVSmtGOUl0L2xXOFNTaWQyVUpjK285MVI1YzRpTFJHNmc4V0pSRW45NndJ?=
 =?utf-8?B?Sm0rYWVHQWRqTEs4T0hHcmljVThUZGkzbFVCWnkzQW9Ic3ZwdjlEcEI1aTc2?=
 =?utf-8?B?bUxxa3creHpvRFl0LzdJb1IxMlNUQ1A5M0kzd2FsWXNQUWJsUm9iT0Z1dmhp?=
 =?utf-8?B?RktyeC9JS29lOUNtU1ZOc2RMeFZWUllNUW44cTRVeTJiTnRPYlhWR2srR0lx?=
 =?utf-8?B?cXR6TVVYMlRvRm1IejR0OUZhR0FJRlZkK0tSL3g4M0JmKzdvUDFrMC9GOW43?=
 =?utf-8?B?dzNnR1RUa2Q4N3R2cXI3eVQ4ajF4MUpiZGhuOFZUU0VUZUVMOVp4T1VsMEQ4?=
 =?utf-8?B?eHpkdndzbC84N3JoVEw4U3J4ZTFGenhJcStoMVlnamhqc0hOc1ZTbitFVkhC?=
 =?utf-8?B?OVlEcWpVTGw2ZkZCQ0hTVEdjQk5XT25EZzZWRUdlVkQ0MHVsMllBZ1JMRFRS?=
 =?utf-8?B?RkJZQkdQbzcreU1nWEcrT1FYend2a1Q2LzA3Y1QyU1ZKa2lndkJ6YWZOMjUr?=
 =?utf-8?B?aDlhdjB2NkdoRWloY1VFTGwyWVRLeXBQZ2JJWWMrQWVXV2ozWE1rckJlaVVk?=
 =?utf-8?B?bnJuWmo3T2xRZUs5Mkx6RUx1VmtLM054MFMyTW1jTWpyeVRDYjdud1lTZ3pL?=
 =?utf-8?B?S1dJZ2ZjNThNVEtDMTVQN2ptR2FBZTVXRGRONWdSaGZHTWNaZXVNRnlBaTNi?=
 =?utf-8?B?QzF6TGZUL0RVYUUyWkhnSUxFdzVta20vZEdsY0JYR3lvaG9WMUhzWmRpaTVI?=
 =?utf-8?B?UlZwR1pPc2hXRmNqZ0Z0QXRJU0FnQmRJYW4vY0EwTWNLblo0UFBybjZLeEZk?=
 =?utf-8?B?dFpUZzNmN2lOOS9aN1BqdnZUS3ZNMy8vVE1vWnZPTjlua2xRYWc4WVc2RWpH?=
 =?utf-8?B?QWkrZXVFV1MvcWFTVXJjZmJLdDYxMGFqR0hWQ3NLUjlqSUVpbnM0TjJ2V0dy?=
 =?utf-8?B?Z2dsejcxVmhhbWVTaTAzdFRMMDFhYUZBQ2dDL1RpMGZBbW56U3IrYzFwUGVa?=
 =?utf-8?B?L3pWc1hidUVEUVpmSk1Sait0UXBha1ZzbkNUL1BBQTNmbDdMQ3RJa0tHcmFQ?=
 =?utf-8?B?dWE0UnhSLytrSExwWFMwUGxsWTErRW5DWGRsQS96cjdWdVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHc2aVRlVEJhZWZ6eEZCdnpzMThnK2R0YmRWTndUMXlXUjZDTzJyWTNmVnVC?=
 =?utf-8?B?TjN6dVFFMmZzckNQaytEK1o0a2c1SVpYY2NZd3JHUlFWSU5rK1pLeEVGZFRk?=
 =?utf-8?B?WWIzT2E2OTV6TU1zTnJGTjMxOGdBTkNPa2VHYlNXTE5TYnVscTJxY0V2Z0t4?=
 =?utf-8?B?WjBpK3B6U2Z2bTFHcjdsUUNkT2M4bWNsLzNpOUtZQ2p0eERRSzE2NytBaHVB?=
 =?utf-8?B?TnNNeThyNlVVaFdUVDRKRTU1bkVST1F0M2Z5WmJlem1EbWl6a0lPc3JIYWds?=
 =?utf-8?B?UkdweUQ3YzFDN1VYaFJUeERvWmNHNFJUUlJKcDFZRTlSdjNncGtBdUpXcExB?=
 =?utf-8?B?aE12cVRScnJGZ1ltMFkzRS9pek1xbVhRcjk4MFVDMEtOWnJPcVNidk9jeGRw?=
 =?utf-8?B?enpYYXRaZXZhSHA3Rzl4Q2NjY1RDUEVMWDNUZDRPV1NCT010V2EvbXNFZ2tF?=
 =?utf-8?B?Zkt4UnlMeHl0TFRXTHZOTnFTYzNZRE5xeG1NbVZvdjY5eThIbEFaSmU5cEJU?=
 =?utf-8?B?MVYzeWRhb0hoRGNySThyOUZIbk5BSUZUSjBmRVBzOGIxWXFka1NWSjNtMkFj?=
 =?utf-8?B?OU9HWC9xbVVTdmNweXQ0MkxQWWhqUmE4S1NEdXN2ZXlZYXJDR1JEWHVjdEdm?=
 =?utf-8?B?c3pYUEJkeU45RzZNZlF2bGovQ2QvdGpabzh1bUIwa1lPTEtEU3lRNUFJaWgz?=
 =?utf-8?B?TjVtbDhWVXdRcm8yRndLbEwwUDFsdGlKdEkzeUVkNHdVYzM2S0lkTlZVSFNy?=
 =?utf-8?B?c0Z4LzRnYUNtMTBNK1JrempBaFBwZjNDLzdsWkR3d1Z1bENzclhlVXRKdnBI?=
 =?utf-8?B?aWI1YW9hdFZHcjdaNTVxbTZCa3V2VnoybkdISnZVM1RCaXd3cHhMc25zS3BJ?=
 =?utf-8?B?Z1I1Rk5CdHhyOUxHdEJNVm43STZYOFd4R1daM0xIRm5kK0tLeE9tRzc5Wm84?=
 =?utf-8?B?ejQ2bjhITit0a3g1N2tYUzd2NklOdTFmZmdwMjJWUXF3SFdpeFZEYVplVm5P?=
 =?utf-8?B?aGxoakdoTmw4YUVya3VFNmVTM2lUdVFFOWs5bmZNbktNVVBIMlNoQVpNZEsr?=
 =?utf-8?B?dW8rVFVUdDRkYTJwbVBjYWFCb1VQNHdWSzdlN09VcmE1UW9IeXV3a1JDRzlC?=
 =?utf-8?B?QktzbURYZ1NGMTNvQnVXOXdUcEh4YnJZayt1RFlmWDhnNEIwUmJ6Zi9uSXVw?=
 =?utf-8?B?a2JiTU5PQlNwZUFzQ0tPQld6MXZsUHRPcFA4YVkvVm1mTmR2eC94Q1lDd05U?=
 =?utf-8?B?OW5LbUYrYXB3Ni9sN3RzK01XNm0xcDJhOG0vOWlMT3RWdnNkWllBRG5lOE1F?=
 =?utf-8?B?NUc3UGh6MnlRWjFqTHltSEYwaHpSYnVwa3RQUjZxTVUwTUx5NzRPM25kcUxM?=
 =?utf-8?B?N3Z0cTl1VGhKNU5YYi9yYWpiMFhQdURpWXVvWjdoV2lrYjZqNmg1VFNIdU94?=
 =?utf-8?B?Qjdob2ttcm1sSWlCNk13enFYUDlDSE55MDE0Y0UwK2UxY3QvMlg5Y1hOcDU0?=
 =?utf-8?B?NndRSDM2ckx5ZzF5Zy9XRFdKb3MxV3l3c0NtSUR1ZDBSeWFWTStaa0xuZndu?=
 =?utf-8?B?WnZFMWRuOGdncXVvSng3YzhpUERYYXRLOGV2a2lFa2JkS2ZCRzgrS2lraVF0?=
 =?utf-8?B?ZXIwcStaUWZmUXdLd0pDa1p4M1ArbE5CRVdqeHF4Vk03Qm9iQUdDZ3kxSnUr?=
 =?utf-8?B?MVc4STNRdGczVVBFbmJaeldMdVJzemF1WmIzbCtYeWt2YllqTFdDdC9WMHNy?=
 =?utf-8?B?SkJZZWRRRjY5NTNsaTJ5QTNSM3FqRy82VU5GSjA5WHZJOFczRjN6ckVKcEZO?=
 =?utf-8?B?c3RBMElob2puaGtxYTEzbG5GQktsWVppSE1Sd2pEZUgxUEg3VEpGc0VUMXVx?=
 =?utf-8?B?NS8wc3BaQnRnVTVJSUdmQ2tHWndkMmdwb1M3U3NidXU1emxPTVBaT09WUUEw?=
 =?utf-8?B?Q0hzd04yRVVkMUU3ZVQ0bTZZclRqVmFtL05DdGVaNVNqNTZFMHNGNk5iYVVV?=
 =?utf-8?B?SlFOajZHa0VQS0VZazlyditmLzYyU0ZJYisvb3oya0Nmdkh5NkxjS2NuRGQ0?=
 =?utf-8?B?dC9UcG1hZWppQXRnNXpxdkduSGVLK0hOQS83ajJ2QTRVOW9QeHpwMHVVbnBD?=
 =?utf-8?B?ODRkamRXWFJaT3hrZXduUjQwc1pzaG0zejFwWXdrZ1lWM1FMdlVWUU03d2FU?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c758b6c0-01b6-44f4-0433-08dcab1a29be
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:20:03.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAi6P1IMNeMsyCytVmZnCWTE6mV9v7f83GgFEZz7y5D7zbWDf7Mez8LIKcIIotooBStdALUgQLbrGFeyKQguhH3XDCQs557Agc6EVA9r2Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7258

Previously, it was possible to only configure the open-drain for a pin.
However, after a pin got configured with open-drain, there wasn't any
way to disable it. Add the push-pull configuration in order to reverse
the open-drain configuration.

Signed-off-by: Florin Buica <florin.buica@nxp.com>
Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/nxp/pinctrl-s32cc.c b/drivers/pinctrl/nxp/pinctrl-s32cc.c
index 1f58772c472e..48d9d6df953f 100644
--- a/drivers/pinctrl/nxp/pinctrl-s32cc.c
+++ b/drivers/pinctrl/nxp/pinctrl-s32cc.c
@@ -515,6 +515,10 @@ static int s32_parse_pincfg(unsigned long pincfg, unsigned int *mask,
 		*config |= S32_MSCR_ODE;
 		*mask |= S32_MSCR_ODE;
 		break;
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		*config &= ~S32_MSCR_ODE;
+		*mask |= S32_MSCR_ODE;
+		break;
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		if (arg)
 			*config |= S32_MSCR_OBE;
-- 
2.45.2


