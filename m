Return-Path: <linux-gpio+bounces-8288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF1935245
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 21:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433D4283AAF
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jul 2024 19:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899E013AA26;
	Thu, 18 Jul 2024 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="f4ItGbgS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F7B144300;
	Thu, 18 Jul 2024 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721332396; cv=fail; b=gUhoiYzIIjyPTIXlxa1ADjiRKsFzlYIXYIg/wZLFDsMEL11cnf7GPKNXG+6qkl093cAIZOunKR2zPj588qVnBtTNJykXSCSlzPJ3RfuMNwiHUb51MuOwoRZJMrV5Oy8d2DdZhKC8ZFpM3Z5zHepVA0VfC5v8EoR4oSQzsdhCJZs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721332396; c=relaxed/simple;
	bh=XFAIrj4bwffX7/RdHDOWGfvZJDJK4N4DF/KlB4umF8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JxWmzITIUkjGIYbWDhXhucgI3mM5OXU2zT7wr6PdPz9xo5JtvDv3XqavcXZnWQS8lqZBTo+ydKo+unKs4E4gAL67leoeTEDf537b8guY3SC8u1ZwXQlxycmiAmm4siKYlTnDp3ZPcAj9G99XMn0OdbZlSQ3EJdmIU2qjrajf/ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=f4ItGbgS; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ig6Yo55ADpe3nSw/YAm3T4I4S6lmtRX3vNk5YaGe1J5WYDO5laBLFQXlgfsaaw3+YxsP75jJwXgRBNL/E1TojetU6h6tG6hywrPVTWmE1UrnUtZjvbDcbNHQYd10ezySSW5aTKOCjuL4R7aFXwvpoBpzHk/HPdVQhVGm8XAj43z7iapOet+wruLI3SFWX44zY7FLDs+Y7lSGmDfsUYz6jJvuQJ7ZTFDodXZi259W8rXVI2KVpWJctKSxoQ5xSH8VL/ZNhB3SSUx0LPbm+VbOR8gbKiCYTTA4hs0eA4U3/1Zkr49eviXiPK2E2HnZuchp/TE9b4Kgsj1unKi2Nr186A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRLkrjr21VLzXZVNbQUG8sa/EEcMJW8sUYpzprtuxIM=;
 b=xpYnz/oqTU/ew3WA6/SHQqYjWxvGY6HcpQTBuHODRSqjgUIe1R7Exshi7+PKXtulNdGmNQ9BXvIlQjlng+Jx+6rHuKh56WC0/alAru0023Gb1MYJSfhZPfxzCHTZmXFc7WqRiTS1JaNCZGBHzproC00stLnmRJ7NDS/rPYtpH86+/Uy3KULlh94jRJhV6w6e87l2VRmDBL5VoaOs5jfpnU+kB5ztUrZ0L9qJNWCJLR4CQuxGfaDV/Q0c3CTQkPw4rTr74OB2QCvZl2l3RTFzpz+8VkxOKNy97sAhoEZLLOtV4mSSUc3VsuFZHt5eV9nhaxu/2Ph5mZt0FaV+P40QnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRLkrjr21VLzXZVNbQUG8sa/EEcMJW8sUYpzprtuxIM=;
 b=f4ItGbgSH1VnT9BzyJQphQb6c1w8qQflVpJySa0mtAWi+PaD+swrlj2dXhps7A11ZhBGsCOCIIMqI8yKy7ZCFBzi71Cn7mUGw45KmeelECDi4hwOVROZ5T/FtFq5rmAhtxPKFQSsBhcSZ8XQyRzJccii6saJ/lLrzvFPS8V9C+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 19:53:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 19:53:11 +0000
Date: Thu, 18 Jul 2024 15:53:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Bough Chen <haibo.chen@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"'devicetree@vger.kernel.org'" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Subject: Re: Question about gpio-hog
Message-ID: <ZplynwYjPiLmUjDn@lizhi-Precision-Tower-5810>
References: <DU0PR04MB949657D9575090C71714D2A090AC2@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <20240718-smudge-splashy-6e8addc80c02@spud>
 <b61742b9-0767-4e28-8b26-dfeb240726c7@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b61742b9-0767-4e28-8b26-dfeb240726c7@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0035.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb64b1a-8ac3-41b7-7c69-08dca76340b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUxxbERzS2Z0Y2VqNDduR0dUWGVhQnFzWGNZWWJ3cDg0b1ZFMVh4S3FYblk4?=
 =?utf-8?B?YVcrd3NpbjEvRmlPeHBHNTFFcm5iYWpwOW5nRUpMZUJCUktidThSbW1QUzM5?=
 =?utf-8?B?TGRYdXRjRjZFZkJIS1NNaXpnTDVpTVJrUVdpNnVIZDZvOEVuRWNvNDI5VHdt?=
 =?utf-8?B?MEhtTnFlMjRtcURuaUN2SW9ON1NwNGFENmw1b1lGOFBFTUtnTjY1amRRZlI4?=
 =?utf-8?B?Qm5qdm0zZFR6cndOR0VGaEtId2ZscHRBdzBjU2c5bFRNdlY4Yk1UWWRmQVpH?=
 =?utf-8?B?M0w2ZnJ1MW1YemY3Y2JleUkwbENDa1J4a1R0SmpidVdVdU9xMUNiK2U5TjVU?=
 =?utf-8?B?RlM3OU53SDdTMmcwZ1F6YkRxMkR5NWdmSTJUUGJSM1pXRTVLa1ZRK2dKRWdJ?=
 =?utf-8?B?djdWRGEzMGJjTlFuZjZndU5TSmUzY1ZkYjlxeU1seDVDbzFsdEIybFBSbGd2?=
 =?utf-8?B?Qys0WHRxalV0bUNtdXJSVFNFVlg2NTJlVjBHbnluSTBtalR0L3lnMlNOandw?=
 =?utf-8?B?L3pjanJsNUE1dFdDWFFTTjAzQjNvMVplb0RHNDhZdHl1bkxjei9PTzBraGxo?=
 =?utf-8?B?dzV4cDhNYVpHV2VIN0RhV1d6VVI4bzI3ck8xbGJUMVhWSXBWSnR1djdQN0w1?=
 =?utf-8?B?SkdhVkFxUG1EaW8yZ0VFUWNhOGVPUnZFY2U2YXhsb0Y2YWNjV0pEQk5nK0xz?=
 =?utf-8?B?bzV4NEo5TTltOWY0aWNMNHZOSFp2VVhWMjJleTF1cG9Qb3J1aElKMTFaZGxk?=
 =?utf-8?B?REp0TEhtWmkwUkxDTUtzMmxDMjc0MFdCZGlZZTEramtLQ1g1bjRvUWZkTjBH?=
 =?utf-8?B?K2pLTHJGZXpNYmtWNzdxMk5qM1Vnd01pUkd0T09WaVNwTFVqZCtHNGU4Uk82?=
 =?utf-8?B?dGYxMlNJbzE1R0RyTjJnaVFZSmtaOGxLTS9ja0l6MnZnSE4vay9Id2dsQjh4?=
 =?utf-8?B?NzBmWTJQejlwN0VRSjRScVN6OU5OMkk5bHI3VlE4dDFKRml0cEQxbFMyY1lY?=
 =?utf-8?B?N0t2d3NuQks2UXhXYnNadnFmM2JoUVB3Y3BKMFVST1dSS01DYWlPZHg3UlZ2?=
 =?utf-8?B?aENOWnNmcVp2ODBHcjE2Y2RrY28zRkl4NzhNblc3K2FsWXpDRmxMaUdtVHRR?=
 =?utf-8?B?aDc0Qk4vV2JtbXoxaWUrc09ZaUNlb0lUd0xGVzFSaEdGZTQwL0d3NDcxZStt?=
 =?utf-8?B?eHRWRjZDMWdGZlBRaStTUEx5Ukd6UHNzTGpYTndPd2VZZ0F3WGdnbmNaaTI1?=
 =?utf-8?B?TFRxWEhOZWNPck16cnNJYzBrc2ovZzM2TTNqeGNxck1Rd3VmZ25tamVKVHhW?=
 =?utf-8?B?Mlp3QWVHeUhQS3VnNjF2QmZNelltY2xTMGRTTjZXZExJMnljWTZHQTlDaUhk?=
 =?utf-8?B?Sm0rM2dZOHNvdk1SMzdUS1dNNldyTDNFYTNEUVN0ZWI4dnZBWTBWcHBaMzE1?=
 =?utf-8?B?eVpSS2hyWncwcVRBbmZYMXp3NDJzOFIrTjhYTGRIWW1OMEpzQ2trYnRrd2Jz?=
 =?utf-8?B?L1E0WDNPdzdLTzIrMjFkK0JHQjc0cVYwdkM5VG9BN01WYWlSbFppOHl3YjBI?=
 =?utf-8?B?Zk1GNDljd0R5QmdkUXlQNnpkSE51U3d1cFFDYTZGNHAzSm84YnAyTXZyL084?=
 =?utf-8?B?OHowcTB2M0lHTW81Y2ZhN3FsSEhJWmNFUnpQVkMvVnljQmdhRVVLTkNVRzcr?=
 =?utf-8?B?N1VMQ2czc0N6d3BsemhIWWVubTFuVk01dFBkdGtiWmdGSWFtSHJ1VlhSS3lq?=
 =?utf-8?B?Smt3RzEzQjNKT1JUNml3dmRaeG1ZelJON25XcjI1NFpkcnRZVS9rNHpGZWw5?=
 =?utf-8?B?c1Vud1hKRTNMVUxPSXlYM1ZKUFplM21rajQwZ3ZqOU5ZRnBUVWRHWVBsZ0tw?=
 =?utf-8?B?ZGlrTFpMQ3FBcWR6QlM4WW1lSTBVcU1TZGtzMTlyTVF5MUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzlZN204MkthZ2Rtd3FwR0ozZGdwMXhCS2t4WTFXRUdKTTNyQVdBQXNYQ0Z5?=
 =?utf-8?B?TDRoa1JubkJQaWpxcEpoZ1VWVUxHdyt1anZSakVaVmZLVTZVdVZDSGtqanlC?=
 =?utf-8?B?NWlMOS9pUmpweUo4NjRyQnVQUnN5RG9sSGZEL1ZiZ2tyUWpQMUpkdlVuYTBs?=
 =?utf-8?B?UGJKR210MS9PQ0l6NlpVWUE2bVozOFVjdzRVdWQvelFUM0lwaTg5ajZEMXdP?=
 =?utf-8?B?Qzk0SU9BUWIzRW5aV0wwY3ZjSURKTkprMEFGWm8wMXJEWmRrZWFHNzBnb29H?=
 =?utf-8?B?L2lWb2xFcGRiL01yeUN5NzNNbmREcGhaQnkxUitDaytERGVBbGdOVzhRa3pI?=
 =?utf-8?B?QTk0WjIrMStZYWQ4bWYwYXdHZ0NqMGt2ampoUGs4UDBjTFdudUlNVWg1TGM1?=
 =?utf-8?B?MGpMUDZOSGJhMDZHK2VsY0FCM0hjRnc0cWsxeEJSUGFzUnFJVTIyZE95ck5Y?=
 =?utf-8?B?bGlqbjBURU9vM25UN2RSTWFpbWh4SE5DU0QrMFFGZFdOZmE3VDdmZmphcjlN?=
 =?utf-8?B?RnhSc3h3RERyVVlNblo3TmJZd1ZvS3MrWEhHKzgvYUwxUVdFalhOV1d3NUZK?=
 =?utf-8?B?SVJlcmw3RUNZR29SdGE1NC9rZSt3ampVbEV5czkzQVBDajVUSmVYeEgwbXN0?=
 =?utf-8?B?dnIyajByOVVoU25VVWRCUHVXWmxRTTNNTElSNnY0MGZLaEVzakFyY09YbVVx?=
 =?utf-8?B?UzJIcURNZndHTlZTRFFpOUMxZTVvc0NnZExNdWExdE9oeThyOUxJYTNNcGR4?=
 =?utf-8?B?dXJ5VXhMVit0NmxPdlg1cVpzUXlHL0dIYkJrZ2s4WVNTcEgwQ2hXRktOMWhZ?=
 =?utf-8?B?M21ENVExczV1T1Q5bjh3aVQ3bFpkNVJnVlZKZ2VqY1BFN2t3WnQwT2lTVFZU?=
 =?utf-8?B?R2RrU2owZzI3UmJhTFQ3MFVYR2VxYTBwem5SK3llOWtpdWI4QlJUTlZySDZO?=
 =?utf-8?B?emN1Ny9FMTFwQzNWSCtkbGVWRGo3TDNvR2R3QzhBRC9VMlBjcG52T1JOWjVo?=
 =?utf-8?B?WHh3NXAycDMzWVpud0Yvd2tybG0rQ0Z0RmVCYWdwcGN3blNldmZvTmFXdjlp?=
 =?utf-8?B?dG40TndydmhQNU50NTFRYjZ3Uk1HR0VVd2Fhd0Nvd1UyYVlmOFR4KzA2b0FE?=
 =?utf-8?B?alVYWnQxd3U3YjlCWUNNTEw4Q2s1MUljQ2I5OGh6czUvVXJ4RXkzcE42Qkcr?=
 =?utf-8?B?aDhGaGRERmxiK3lVYmtRajA0WnAvMUs3ekY0cUVqZ1lDYm9ocEZwbk1jSHhr?=
 =?utf-8?B?Wk1BUEtScFFGaG9EY0NZYWYrNldjRU1xbjMrd2J1NnhsWnI2Z2pGQUZPc1Jj?=
 =?utf-8?B?Y0UrdGhCYysxT1JWRHEvbDdoU1pwWmlOb2gzUlNadFhTbVlxUnlzN28vM0dX?=
 =?utf-8?B?R0Y4MnBUT2pvUktYbm9nTkVkL1V4eG5GWHo5eklUbC9RcGJmUlJLTW50YWti?=
 =?utf-8?B?bDVzbldraWFURHVyVWJkM0FFRkdoWElhQ00vbVJ4YXRuclhqb2gwdkF6NXM1?=
 =?utf-8?B?MkJZNGJZYjFNS1dibTVUT2NFOFhWa3RjMEd2V0gzRVNJWUlLQ0JHQTZIUDIw?=
 =?utf-8?B?UXRzTUorRkUrTWZrYkR3RjkvTGdzTjYybCtRdkl2djUrdStVWTJjYnlmSU1E?=
 =?utf-8?B?bnVjQkVFQ2JaSDE0ZDZVY1ltdmtGK0oxSmNmM1E3b1lDOEtUeTB2Y1dNRGk3?=
 =?utf-8?B?OE4rVnVSei9CTzFCZkU1ajRVbnRHamlCcmR6YzFrVDJBSUwxbWFlVFJGS0Vx?=
 =?utf-8?B?SDBkNXlwWWtSclQyUDBFY1VxNXd5bFZxV25pRk1hS2Z0WFdLTXY0MnFZZC84?=
 =?utf-8?B?a2tybDJpS1ZqVTE2NWsxSmV1RDE0VHJBRnhaczhVaUp0NGFsQ1d3NUFJN29Y?=
 =?utf-8?B?UTNwMXpqVHJnY1VNanFRWHZ5eEN6UFk2MUFRZjJPWldvWmNuenZrRk1aV3d4?=
 =?utf-8?B?WW9mSkRrMzB4Mk9rbVErNGdKcVBaQ3BVVTd1QXlYeGhEdHpSeVNrVWxlN2JV?=
 =?utf-8?B?MFFSUi9WVEV5Ri9HUVMzb25rYmVJY1FjWmsweCtYbnJjTExIVHM4RlBQOHRm?=
 =?utf-8?B?eVUrZTBGZnROTWlQRklka20yYXU2eXAxRmZManBYTUNLUzh2VStOVW9yMVpz?=
 =?utf-8?Q?swdg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb64b1a-8ac3-41b7-7c69-08dca76340b4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 19:53:11.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPuoLpvzC9NqVC7NqneIah5UDF82y3RnqwGddCylyfdXnzbeYwk8mqCYmveprj7GQqdWto1Bxwaw49t6O3zJWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601

On Thu, Jul 18, 2024 at 05:13:22PM +0200, Krzysztof Kozlowski wrote:
> On 18/07/2024 16:47, Conor Dooley wrote:
> > On Thu, Jul 18, 2024 at 03:40:49AM +0000, Bough Chen wrote:
> >> Hi All,
> >>
> >> I have a question of ‘gpio-hog’, the property gpio-hog seems to be used in GPIO node rather than in users device node, so we can’t use the device-link feature.
> >> (sorry for resend, I use text/plain messages this time)
> >>
> >> e.g.
> >>
> >> pcal6524: gpio@22 { 
> >>       …
> >> 　　　/* usdhc3 and QSPI share the same pin, here select SD3 pins */
> >> 　　　usdhc3-qspi-sel-hog {
> >> 　　　　　　gpio-hog;
> >> 　　　　　　gpios = <16 GPIO_ACTIVE_HIGH>;
> >> 　　　　　　output-high;
> >> 　　　};
> >> 　　　…
> >> };
> >>
> >> &usdhc3 {
> >>      …
> >> }
> >>
> >> The board share the pins of usdhc3 and QSPI, a MUX use one GPIO pad from one I2C GPIO expander to control the selection.
> >> So before usdhc3 probe, need to make sure the gpio-hog is configed. Which means usdhc3 need to depend on usdhc3-qspi-sel-hog.
> >>
> >> To achieve that, I can add a fake GPIO properties like below:
> >> &usdhc3{
> >>      …
> >>      hog-gpio = <&pcal6524 16 GPIO_ACTIVE_HIGH>;
> >> }
> >>
> >> Usdhc driver do not handle the hog-gpio, just use this fake hog-gpio to let the usdhc3 depends on pcal6524 IO expander. Make sure when usdhc driver probe, already select the usdhc3 pads on board.
> >>
> >> But this will trigger the DT check warning if related device binding has ““additionalProperties: false”  or  “unevaluatedProperties: false”.
> >>
> >> Can this be acceptable? Any thoughts for this case? I think this might be common user case for gpio-hog.
> > 
> > I've got no idea what this device you're talking about is - but it seems
> > to me like the "hog-gpio" property is what you should be doing (although
> > probably called something like "enable-gpios" instead.
> > What you would do is send a patch for the dt-binding for this device,
> > adding a property, in which case the *Properties: false will stop
> > warning.
> 
> If there is device dependency on the hog, I would say by definition of a
> hog that's not a hog. Hogs are for controller to initialize, but here
> your device driver needs it. This sounds like simple pin configuration
> for device.

┌──────┐                                
│      │      ┌─────┐P0  ┌─────────────┐
│      │      │     ├────► Device 1    │
│      │      │ EXT │    └─────────────┘
│ SOC  ├─────►│     │                   
│      │      │ MUX │P1  ┌─────────────┐
│      │      │     ├────► Device 2    │
│      │      │     │    └─────────────┘
│      │      └──▲──┘                   
│      │         │                      
│      │         │                      
└──────┘   GPIO ─┘                      

I think a typical case as above. There are external pinmux chip which
controller by some GPIO pins(maybe i2x gpio expendor). 

If device1 work,  gpio need set to 0.
If device2 work,  gpio need set to 1.

When dts descript device1 

device1{
	compatible="abc"
	pinctrl = <soc pin mux>; 
}

Need a place to set GPIO to 0. If it put to hog,  hog may probe later
than device1's driver probe, then devcie 1 failure to work.

How to to handle this case to make device depend on gpio. device1 always
probe after correct gpio to 0.

And, is it possible like.

mux
{
	compatible= "gpio-mux";
	port1{
  		phandle device1;
	}

	port2{
		phandle device2;
	}
}

"gpio-mux" driver export a sys entry,  when echo 0> sys,  device 1 probe
device 2 remove, 

when echo 1> /sys, device 2 probe,  device 1 remove from system.

Frank

> 
> Best regards,
> Krzysztof
> 

