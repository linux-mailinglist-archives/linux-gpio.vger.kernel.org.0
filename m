Return-Path: <linux-gpio+bounces-30893-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM0WH3YecmmPdQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30893-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 13:56:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4390E66EF7
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 13:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 62F5F70C96E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 12:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A2119F121;
	Thu, 22 Jan 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gFkY4tm9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6453C2253FF;
	Thu, 22 Jan 2026 12:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085941; cv=fail; b=tKiyk3GgDNsAexjU+WiBM2owIhQKTlSsm/p83LtsezWC+IM59rZMlQ3ke8tRrX/CYBp6qU4EZOYNYs6z1Zk+c5yXqnvzTNpLs5Y7bbRxeEUfpjN1qb+nhkMyp9L+z/zUfMrKjQBV1l3j56S5LtHFRdr8mGejkwIAf2fKgOPn8Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085941; c=relaxed/simple;
	bh=poEtTdP8rC12kF14NQEbjRLr5XxAS/qx6hCUNtafNSw=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=CMK/xIdgL78iNXa6JjYXPnULsi3vtXMvKXzdV8SjUz5Ydyz6xSPBZxF8AfMTuJfhUgL32QS9M1RBo2bfEqi+MPqc3Mq4yM9WFz/fXrsL5UG4zZiaepHJUga/MFSkyYuxqpiqAQ938B5q7qvmEIVcw4FCgUzmg0eWqL74rPectlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gFkY4tm9; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APMNlG74Jk9K8Tgr+Z8gacfv+KsFv9TbL7j8z7qMMe1bOlTO9gTddUHdRw4AMMxa3JSGXdlQN+9dWibQR832eqFLuWraPQjUMTIC7s8rrznJ4FIAwrJwxQVXiGaUZnrGLj/X9yCYwR4vI5hEPK8am5shvsHDlFV3lheihMtJXGjXTc2yPk9+EGytBuZY0cD5u6mLwiBGv1llFV3t/5Yl9OYgHYeZ7SJAqTzrX2QeafShSNO2rAqlMJ91CKTQG5FLn3zaZSaj4aTO8LlDiZQbV08/MF56hEINHZFHiV3TPUJLud8XIa5gtJ4rBoySzMWX28EpIymjfWVoQvFIzkaWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fHiyh5jnsh+LQtMt2/9tglpTb4IKvAAPFmUk1W7f9Y=;
 b=YDnBR5q/tLDmxEhLgN7TYLd8/LqUj5/13gN73VwCJd8BsLzIa8r6zYnziIDo+GimoeUkylEGNPntO+xckTzIPSpdr/10Csm9pQ7ZvOVF5sN39l2GI1MjJk6KWHXBSiogxlYrtzwyguxdic+vpl0WVW/hZaGmLNGLgRR8QecVOg3qK6Mf36xk1ldben3eB1L/PoaImxalDlpEMpn1fwFK2DrobwE4ab4+R6h4mk3VLrPRYo85ReXqwaZivJCajvB5AgHrbSooRW5v/tkkOAJsXR61K9Q5GnZTxf32fn6FA8T16DrcZaLWZtKkE1TpCITN6aSrbacDxVKS32CGLXWSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fHiyh5jnsh+LQtMt2/9tglpTb4IKvAAPFmUk1W7f9Y=;
 b=gFkY4tm9gKZNo4+52RE1zKYwuoVCt24fxc+KI7V5LVzc3Y4UdQ0aQTKQccz9ie4hdGQ/vwfu2gCdzDEcHb6gw4G3lCshYXDUFvJTlhClBZahCoMH5EbDBD0TmEPqKYNKyLGX7cU+FxC97++mokU3FpWxfqtNMv1JrDbbjWFE3Aa21soTFsACa6XLMd6SJEsK0zGTt/ZyMV8Spfu/V8cJPbdvGRhcHfwfTMUfS7pKfNXUWu6OjuApu+G2fvkcEYLCkR8HCrsabuY+wGNVrj/RtiIDFZBD+5HFfHbYQxMBNsF+BIRk8UowKeUoCIV9l7s7EzLq+AHGmiHvAF1FnKiOlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Thu, 22 Jan
 2026 12:45:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 12:45:30 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/4] ASoC: codec: Remove ak4641/pxa2xx-ac97 and convert to
 GPIO descriptors
Date: Thu, 22 Jan 2026 20:44:56 +0800
Message-Id: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgbcmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMD3eL80rwU3eSc1MS80gJdC4uUFLMkS/Mkc2NDJaCegqLUtMwKsHn
 RsbW1AF/+P/pfAAAA
X-Change-ID: 20260120-sound-cleanup-88dd6b97b731
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 92439367-e8b5-4660-24f8-08de59b4201f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|7416014|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlNuQmpHWGJiMTlHUzhHRTJXSjExUFA3bVRCNnZhZlZtSW52WjdsTVkyRFFa?=
 =?utf-8?B?OCtTYnRRVE54NzhnS3JIM0hzZjJGSExmakp2WnIwWlVudWhpSFVHZDFIMUJU?=
 =?utf-8?B?SVJib0FheEYwUSs4MW5CeE1qZmNhWkNwU2JRRXZ0czIzM2hmWUlNRzFheGxo?=
 =?utf-8?B?alRvL29oc3BBeEt4R2tqTWZ2YmVWeDN5ODhOM1dBT1pobUxnazR2QWhXaHJ1?=
 =?utf-8?B?bVVkUTJRVFF5ZCt5VDJZOVZVd1k1b01iaHNxcUJPc2wvQ0wyOTR2L0t3NXdR?=
 =?utf-8?B?WTBxRGdtT3J6V3M1MWkzaG9KQVJ4TWk4a3N3ai9rRHB6MWhCU3RxV2pCZkxH?=
 =?utf-8?B?ZWVNUnNKbXFjRlZRYktaM25SbVl4ek5obzJEU1R6eHZCWnVuR1JWdE8xbThZ?=
 =?utf-8?B?QWxxNFhHOWdJNFBhZUNYZUNrM0IvcVZvLzlLZUZZb1QxOTM3QllWcC81NkM5?=
 =?utf-8?B?dmdwZDAraXR2MHJLcHdDSWlTdlBVRE8xVjVqa005elNlTUs0VERSR3VOUFI1?=
 =?utf-8?B?WVNacy9rS2h5ZWx0RElnT3YvRjRMM2tHSXZ5bmpTaGNSVmlRZ1phdlJEdnVM?=
 =?utf-8?B?WU5YTkxVUHNLY1c5anBjZlExOEhsSkxwU28zdjFER2JzRnBWdVBVc0VOUkNE?=
 =?utf-8?B?aW5URWVpR1k2bHhCRC9RdGl1V1RWcEJNUVdSbGpmeVpmTnpoY2lYaVBmT0Rw?=
 =?utf-8?B?eGdQejJpZjJlVXJEZ2UrUXltRWhvaWJ0TTFadGJpSHN5SlVwSjVqeFJqTXR1?=
 =?utf-8?B?QmlLcXlHVy9rRC9XNC81WXQ0RDU2ZW40aVNGWnAyaEs0Yno2b29PcDIzZTBp?=
 =?utf-8?B?cDAwKzdQU2t1QUJTQlI5b0dQZmlyaVBHdVJKcGJUdFRsUGNIRGdKT2lQd1Rw?=
 =?utf-8?B?K3Z0ZExoY1BCdmJRRWorMmJMVFgwcTRHZnNBbkdPUGg2SlBlajBkSkFNVExR?=
 =?utf-8?B?RDl0Y21mTmRwcmxuSmJqcW5Wc3VxNlpXWURuSG9yakllbG43YzFPd2ZITWNC?=
 =?utf-8?B?TmdkYkRENVpLNC9RcTI4QXplWjh6UjFCTUZneklaYnhoZEYzVWMyWHFRbGJy?=
 =?utf-8?B?eHlBSERQZzNUUi9xWmd5SnVTMUQ5d202VCtna2dGTWgybElhTGpRVW0rRVVh?=
 =?utf-8?B?K2p4Kzg2NnRDNHl4OFBNQU9mclhucnNKazFxK1hIVzV0NGgzM3RpSjMxOVUr?=
 =?utf-8?B?T0ZwR2psK2VvVUppSVI2Y0ZjTENXT01kMVNOdDEva1NLM0l0SEVBcEdZUkty?=
 =?utf-8?B?ODAycm5abm1SMDFQYlVIVjA3NlRFUWc2WDRTWFM1Szhzbit2Mm9jU01zTUJj?=
 =?utf-8?B?Q1VkNjlINnRrTmNUS3JxTjlDazMwY0tDaW1tMHNEVldta0xrZytJZmlocGIx?=
 =?utf-8?B?L3d6QzQ2RE5kNnVWbllyUVZxWVZIcUlxbXRpN0M2eGw4SjZZNHZqWmhkd2pJ?=
 =?utf-8?B?Y0JvZ2FPcnF3NE5MaEplSXpCY09DQWNIOWEyRUZaVFY2ZlRFWFFSaHMxdjht?=
 =?utf-8?B?TFZrRm5FcG85UE4yZk1VL3p6T2IxOG53cUpLbXVydG9kVHgrWkhocVpQaDNH?=
 =?utf-8?B?VG5lSzdCYkZFNXkySHNiR2RmU0EyRVIxcnhMeUdUYmowWFFrSDduTWJFR2xv?=
 =?utf-8?B?aE1aYWJMSkJ4Q2o0bzZIblRRTUxGNHJZTExaTU82bm5kaStCcHgrUnBHSUE2?=
 =?utf-8?B?WVlzZUhVTkdQTEpqd0dldE55K2wyYWN0RTlrcjUwYTlTT3JoNUladjl4UlA2?=
 =?utf-8?B?MFRlUU5GcDRORThlNmFJTFFkNVdjc0xTQ0dXVGljbFdCcXhmRmdhM2ZjR3hs?=
 =?utf-8?B?eDBGM0lncUpXNGF4MmR5ODB3NGxuTThMa2tDcFNYeXZyZUxYZzgrd2Q2bVBz?=
 =?utf-8?B?ckxhN1NHVXl3VGJSMWFsejA4VjlFZUhidXloTGE3NEw0VHBuSVB2dmU3SEtQ?=
 =?utf-8?B?L2FPSDA0OExSeVJMaUg1L2pML2hzNjVybmpYeVFhSlFLR01pcFRjN1ZJNGd3?=
 =?utf-8?B?Tnh6THVSQ1hIYUExcTFFblk2VVF4a0NZdkhpbjRLOEFobnZ3QXhrajJhWTRZ?=
 =?utf-8?B?M3dEMXJobUVFQm1hVGFJVi9tV3M4bGcyTjJHOWs5OUdpZjhxRGFsREYrNWF6?=
 =?utf-8?B?N2RlL2dJMGt5VE9BM2xvQmpBRlozOFlzMEIyYk1VMHJYZVdDcXlmMC9hMkpS?=
 =?utf-8?B?YlFjUjZHc0pPS3pmWXFxbTYrVHllemZOYkplK2ZVTnVBeTFLWUZWa2pvclIy?=
 =?utf-8?B?eFNVVlBycjg2N1NJeTJCVFFiQkhRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHJ3RzZaVHp5MnJ5MXREYXJOL05iTk51dWgwL1dyZHFvdGpjSmwzYnVMRkZH?=
 =?utf-8?B?MHZsbklQaUxhWklIbktaOEsxMXJSM1lmYlh1SlVCVWNRUmZxblpHRWtJZ0Ft?=
 =?utf-8?B?U1dncEV0a2ExN3krNSsxbXROTGNPaFh1am82Zk9nU2dTb24rdE50Q1l2bS9p?=
 =?utf-8?B?ejlsK3lFYjcxcERqYVI5dlh0WmxTb2NYcmhiM2ZnTFAyb2I2aTF3OHZMNEhZ?=
 =?utf-8?B?M2xoQnFvUDNOOVVreUFrbS90SkRlYUJyNjBudkhLWG5PZThlQXZtVGRaUkZU?=
 =?utf-8?B?dExWeUFQQ1NtUWdDanQwUXRLMkp2eXNFcDhLajROd0xrcVZpQlJQS0tGU3dB?=
 =?utf-8?B?K0hTaEZTYTlmRDZKeWdLQkw5THZUdXRvbVlLcldVc3JTVjhFaXUvS0tobDdr?=
 =?utf-8?B?VlNTWTNXMGpjeDFXQ1F1REFicXJJbXRmMFRlODBGakUzR0svQWc0OFhDSWhW?=
 =?utf-8?B?MVZGVHRWc1BNVjR3MHlMdEtXUlkybUFnWmVscU5hNGZ4SktZUG5DTHdXUkMy?=
 =?utf-8?B?SG1aR1JRWjZqTjRYYlFSVml4S2lSUUI3WXd5TkV2clBzSzhLQkdIL3g0Umli?=
 =?utf-8?B?RnZZU1E3MytVRnFPVy82eldiQVUvemxRbG8xaCsrTGM0N1l0c3gzNDB5TlNi?=
 =?utf-8?B?a2loOFZUMHZiRGVBOGZGVndhdTJRbHRvQmVVaitsU0xXYTNuamdhdnVCclRJ?=
 =?utf-8?B?K00yNUR6YU40MFlYS2Y4M05NT0swRzlBeFVVWVRmaFFOZmgwMXBQcWhOb08z?=
 =?utf-8?B?KzVkVkVlUHhBbDhySkJKdC9CYzlJOHYrZXZtNnUvRDJIbzN6TjQ3djBZVVo3?=
 =?utf-8?B?a2NrcU55bDF3RmNSaE9TR1BPZGV2OU42QkdKOVBSRStEWUNUSGEyM3dSOG1o?=
 =?utf-8?B?OCtCd1pMUFdqZVdJNG5QUUtpa2JaMjZzQ25BTWxiVSszZEp0cTR2RkttU2NP?=
 =?utf-8?B?VEhCZDN0WHIzcFZhL0p0S2tlY05FZjd5czhKQVJncFpPV2c1UVhXS1VkQXli?=
 =?utf-8?B?QzdOVzRTSG4vV0ZJcGthd3RTZW5XZWlzSVhidHNGYmljNWVHd2FJMm5mbEw2?=
 =?utf-8?B?VnJiMkZRVzJwY0FpeWV1NWpqT2VCTmpjWDVrbEhUTjJnK2lraVdBRFdnS0tQ?=
 =?utf-8?B?VUlZWmU2Q2JwdUlGM2lXVWdQbnp6UWRrOG85dVZ4QzFMeXBuTW5aLzAya3Rp?=
 =?utf-8?B?RkJJTDhMdVdHdkxPaForMnJFU21jTkkwK2NMQU5hd2w1QTF5elRXMlY0Y3Jx?=
 =?utf-8?B?N2NyQUhTazhxRUk1Tyt6bTJpcEcwZ1hablBiMWlkVEEvd0JYYnZhNklJaTJJ?=
 =?utf-8?B?dExTeDV1TEFYTjkvam5ibEQyVTZKUW9oR051L3ZnOGRuclMyLzVsU0NubWF4?=
 =?utf-8?B?NnhzandRejE4ZmZUVXNaOVV6ZlJNRGl0MVFtbElTN2tEUWxkd2dHd1VrQXRS?=
 =?utf-8?B?VVM4aHMzWklVV1huL21qbjNoOG5oSjhtbU9WSHFEbWFPc0NYKzVQWmR0SEt0?=
 =?utf-8?B?RDhKaVl0WUczSUFpbzdOcWNDNWhxRnIyMDhMU2UxNUVyUWdvSTY2QTVMWERu?=
 =?utf-8?B?VTFBVWR3SlNHdlJ2eCtJbGZ6MWhoeTEyTmMwclA0TWYwQUx1blNLM2JXcW1C?=
 =?utf-8?B?SGxROS8rN21acHFSL3RFZ25VbEgxMnNiSWJGM1RxLzlZK08wendJQXNVTnVF?=
 =?utf-8?B?OXN6dzEvTnlTam02bkhsVFpRa0F1V2ZkMDh4Wk1BUzlKOEVLbHFMMExacWp4?=
 =?utf-8?B?UzI3cXc3TkhjODMxOWQ0bkloVUlCcGpFOHdYU1kyVll6MWZ5UnIzMGJ1THNj?=
 =?utf-8?B?QkJHbFI5WVBxUS9xZEtkdmh6bGF3RHRPN0ZVZHZjU1B2TVc5RWpqZU85Z2dj?=
 =?utf-8?B?TkgxZ2ZaSFBGSUVRNTM3ZFJ4Rjc1V0pSMzM5a1NoejMxM0NjSCtWVG9KMlpy?=
 =?utf-8?B?eHBDbFFrU0ZBNVFCekxCdklzOVRDY0pZa09XWTdzeTF1ekVqMXR5MXZvMUt5?=
 =?utf-8?B?ME01bjl3aHVJM0JXTGtualQvdmVrV2t3WURRbXE0L3hGZFMyTFQyTTFQTXBt?=
 =?utf-8?B?WW9MVThGRHFraFZoTlhQNUZwMWw3ZUt1L0RUelcva1B4TFFtL0I4cXlFR1Bv?=
 =?utf-8?B?Tk1KL2lTRnBsRy9aRUp2a0w3YWRnNURySC9sckxiaUdlQWtSYnZYa3JXTW9O?=
 =?utf-8?B?cTVabTBNeEJtNVZGT3NPRFNiRE9aUStoTHRXLzBSVjhHdE1DWVRFaFRDZWhX?=
 =?utf-8?B?cEtKdXlHY09FOW5Nd08vRlJFZnZLMyt4ekJxZDdYenRMRGF0MytOaFpMOTZH?=
 =?utf-8?B?Y3pvNCt2VjBiTm9Wa2tjVXc5VldpMmtWRnVsTnVhMjMwQzZzN1phUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92439367-e8b5-4660-24f8-08de59b4201f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 12:45:30.6231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tVipuVJKJDS0TraJZIysTryDK5YTuAr5WydOXeHggz04SQ3bGXxAuZr2ZyWbbSty535TCvCQrq90qVVnuOQ+HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : No valid SPF, DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30893-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[perex.cz,suse.com,gmail.com,kernel.org,zonque.org,free.fr,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: 4390E66EF7
X-Rspamd-Action: no action

The main goal is to convert drivers to use GPIO descriptors. While reading
the code, I think it is time to remove ak4641 and pxa2xx-ac97 driver,
more info could be found in commit log of each patch.
Then only need to convert sound/arm/pxa2xx-ac97-lib.c to use GPIO
descriptors. Not have hardware to test the pxa2xx ac97.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      ASoC: codec: Remove ak4641
      ASoC: codec: Remove pxa2xx-ac97.c
      ASoC: pxa2xx-ac97: Remove platform_data
      ASoC: ac97: Convert to GPIO descriptors

 include/sound/ak4641.h      |  23 --
 sound/arm/Kconfig           |  10 -
 sound/arm/Makefile          |   3 -
 sound/arm/pxa2xx-ac97-lib.c |  50 +---
 sound/arm/pxa2xx-ac97.c     | 286 --------------------
 sound/soc/codecs/Kconfig    |   6 -
 sound/soc/codecs/Makefile   |   2 -
 sound/soc/codecs/ak4641.c   | 641 --------------------------------------------
 sound/soc/pxa/pxa2xx-ac97.c |   5 +-
 9 files changed, 13 insertions(+), 1013 deletions(-)
---
base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
change-id: 20260120-sound-cleanup-88dd6b97b731

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


