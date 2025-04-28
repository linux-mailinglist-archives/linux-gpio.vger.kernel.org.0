Return-Path: <linux-gpio+bounces-19370-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44789A9E61C
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 04:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECE153AB008
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Apr 2025 02:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1E9193062;
	Mon, 28 Apr 2025 02:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="S0w+jOhL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603AD1A3159;
	Mon, 28 Apr 2025 02:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745806253; cv=fail; b=dJdpWc7j5DKDlUY5xDbWVAY4KHNsLT6zswT4NDznzEz2nEmYMyX6UA+4O2J0HlKd4cQAFSPldFuqunNE6aw9qcXxcoH/R+LbTUqSScnH+wO/O+s3F4r+X4fok/I/HFELvqllNeX+uC2zINDfcwJU1tfUYnEqdhLRlNxkFWGCocM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745806253; c=relaxed/simple;
	bh=ELs0prRj4buO7DOMESGbfYW3eNKKzXbPc6UawqTh6bQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t2OnDkw8OsGlTkT4VqSR12FRJqo2Q8jmiZpr9nZ/FpxaNMzDbpKHXymqDeUVe5AxgzMkHO3PNsTNIYZKkIbIwzIiH8EkNlfpVE53WbA9Vk3clZ+rikTAepgFl6bAAWKeRLLl98ijZslmqhB670tWoaRL7AjIjI4SDxqXs5LVel8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=S0w+jOhL; arc=fail smtp.client-ip=40.107.21.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7ufjhPZd1ZWBFTjLXP6icxEF9EUy/q96vlYwZ/ZquvVLA0U/q4ZS0WUbnOdoY6fC/+05jKann/yQQy38XtLV9dyqVCWOPEZjDEsd4QVwFJVOa3dVjseQNmlU0Rr1Kh+//Oq0XTrzfu0PAIUCLDYlUq0KuYUbcpQ7iGMn34ItOfOOepAyTFNrbWhqmVJH7vvmH+hXNQQFV/MmvKXbkSgGw+gFByKMEHhxf7x/qaIKB/lIGVnnIaUBY/w8yDCFxvSe2xeqAjsyKXgkcwEUXqRN008X74zxNDcbFxdzaiNmh3IN8c4jOI8YQOPrP2bFNOttyYRJDVel+UsG5/BXI/Ixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4BbDRr0H7lZYE/FYwfwbyAmQbK8yhyjyFqJ7j7fmjA=;
 b=dDbbEmrgoJQbn9AdNPyVRSED2+ihxjUE7DK3ib1+z5Jf6DncL2rT7jJiHv+6VdWdmZUGN9u6uwOGkzWHZSIgf24o+IssoySAhDLACbXTpQbMhvvff1apLVRsfXGNPD8C4pTcpWWxYsTKBjsR8n1Qw/gi3mTlu5IkeYHG8k4M1i29j9UneOh4ARMxKRcuhB4qrRHllWzTWj993w/wFblV4IN/jhlhVJJ7CIEcU4h1ur/KOqSy22ID7ff8mQU81RnSu0Z4BegnB0WQMxZJ6cGQ/7+8033bbsQL38+Z8E+WtnCI7DnWi7lzDTjBkwraLHZXlaDe58ongv9D+RKA++cQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4BbDRr0H7lZYE/FYwfwbyAmQbK8yhyjyFqJ7j7fmjA=;
 b=S0w+jOhLweePQKmjuyGHu2cRRskDGyY5rXIYbCgXfutUcHw+lV5zkbuI5lvnQF08s6Qnw9sqvMUZKUDhqoFdgIfZs1YtVc+KTFf7BA99MezfoZfe1RRnF+y1bDQAmJ64u5Hgog7pUSqpEpKwDIS5MzsJQ/J908qTyqDGi/sDAvJCLGpGilRelanzgNAxdyMcUbgp86vHwArzcVdLUql2J+I+DCeA9J+DzkHcXiYzsb/dIaHEOwrYPI7DRugsZ6gXqJ0JbR6IxkMeHJTT24g8Loc0n2molO9FM40ua+S9hcUO5aspQKtDI5RtUn6VxiXr+Sua2bGdK1kngkxb2y1Ozw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9901.eurprd04.prod.outlook.com (2603:10a6:150:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Mon, 28 Apr
 2025 02:10:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 02:10:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 28 Apr 2025 10:09:06 +0800
Subject: [PATCH v2 5/9] ASoC: codec: cs42l73: Drop cs42l73.h
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-csl42x-v2-5-e8056313968f@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745806152; l=3246;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=rew4x52/zX89IH2Hq3pLjiqBbHThbPuEbhuzSoJGRZc=;
 b=7F5DYwTEWiJDTFcjWApZhtd7NO7LRSt6tPttwhiRs3u56u47P1N75/uCqDEK8KK1t+HmXzXE9
 +aJwqay94zsBNgiLHgYJhuW1mjSM58ntp0TvM+f4GOy0hCaQZGuEWG9
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
X-MS-Office365-Filtering-Correlation-Id: 24fc5994-c5a9-4cb2-8f96-08dd85f9e406
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N1A4Qm9tMkxpRVN1YUlqdjl6WkRyam04aEZNVWRaMTYzWElKWDErc21SQy9u?=
 =?utf-8?B?VFpRempWV1ZPZ1ZJZzlYVmFNQmgySkFoT3B2ejdVUzI1OEJkTzUvUjNuYXdV?=
 =?utf-8?B?STN6SDliL0xKRk9tcXQ2U01BMUQ1ZzdLcHhZVXlvNnJvaVpIMjFPS0hrTjZH?=
 =?utf-8?B?TVlHcWNVY2RURHBxc2Y2R3J5Yks1amtWbFdmTFNabUVJYmwxQUhZbzNXczRL?=
 =?utf-8?B?NEZycDc4TWFsM2t0VnhZOFpCUVVWSmxodW53ZkFJekdNRDdCUEJEOU5WcUxm?=
 =?utf-8?B?MVVwSGp0aVhibGhuYlQrTmt2cDBBV0dsNEZhNER4dU9hUWlpeEZXS29XRUEx?=
 =?utf-8?B?THJiQitWR0FWT3l6QVJ2Z3lRSjZTcUJrOXdhOUJyWVBvTUFpa0k0Ykh6dWhn?=
 =?utf-8?B?Z01uSTgrb2hEbzZIcEQ4OWRTTndxMEpGMHhwOVNYVTN2b05qOHl6QXovVXNn?=
 =?utf-8?B?UXltL2J6clpVZThsT0lhUGJEci96djlPTy9WU3FQait1aVhoZytxc1I1cUVI?=
 =?utf-8?B?U1lOUUJURW5GVU1VdUY4Y2Z2MkpuZXNsUWU4QkZYQlJxZk53UGhkUHV6aXYv?=
 =?utf-8?B?MUhhMVNIeEZ4c0MyU0tSaDhKOWhMT1gvZVNPZXJpZlUxVTBOYlorUjVic2NQ?=
 =?utf-8?B?NGpLZFdyUkNrWmJyUDgzak44N2ZHZ0l1UlJ6MkJSd29uR3graWN2SkRuelV0?=
 =?utf-8?B?K0kzaFhDWExzQ1MwRUMvUFpXSWd0KzZxUEttd1JJaExTMUppblRKRHY1R1hy?=
 =?utf-8?B?dVBJb2gyaGFyQm5YUEsvbGFpYnY1R2FWcUtQdGsxYW9qaXlpbStnbFErMnRv?=
 =?utf-8?B?U1RXcm5IeTBZbkN2SUpkeGVXYkRxak9RbFJ0RE5PaUw0RWJpVXNyM0lHSkdP?=
 =?utf-8?B?YkMwUE9NWUJvbWFLa0dnc1A1S2g1QldyUnNOWGE4VXppU01hMTRBajdTbFFm?=
 =?utf-8?B?UTBycXYyOW9oREZlVllkdm4raEtoenJGZFNCeThXY1NUb1FDWDU1K1VhMFov?=
 =?utf-8?B?ZTR0bWt1YnYzbXdjVVczcVhwT2hpaW9tY3R1MENpekJEdmphdXQ3eTlmeTBO?=
 =?utf-8?B?eUt3VmZjd1hITzYrazMwMFNwbUMvbVQ2U2poYWdkOFdKakFLYjVKRFhEQUxl?=
 =?utf-8?B?NnMwdnRTVmFrejc2Um5BVkpidm5sTExyL2p1YkFtVlcwSkV6UC9hZDRpY09t?=
 =?utf-8?B?dHltc2FaUHZCbEo5MWpRZGI5bXR2VDVtakVmM0p6QXZyTVZkR29qMnQyVllD?=
 =?utf-8?B?WTFmeHFveUVhK3Fzc3hyd29ndFBvRkpkMHZLMGVOclhidCtCVFZpYVgzUVJT?=
 =?utf-8?B?cFN4Tmo4THhnNWpBZkVFZllzdlRMUm5RcXVEQVY3SWpiRGN3QlVyanZjRk9m?=
 =?utf-8?B?QmZFL2xMU2tSNEFoUGY4VnZZODd1Ty9BNXBrQ1NCT2d2ak53TkhtZ2R0RjU2?=
 =?utf-8?B?NE9SbW1qM2NQMURHM0VIeUUzWWZ2TFl6R2FucVZMdWc2RFRZNVU3ZnZPdlFI?=
 =?utf-8?B?cTZWQ2xuQVZPN21SQm9nU3hwNGEzdmlXYUgxaDAwTmFlSDFWRFRwVEZPS0NW?=
 =?utf-8?B?bEgwY29IaUR0MEFjVGFybUNFZy80ZDd0ejVBcVdQQ2k4VWhkUXhaeVAvQ0FK?=
 =?utf-8?B?YUdjWXQ5UzVtY0hWL2tqVXFleEIxb2dkZ3RyY2tUVGVIYXAvb3J0OGhZUmdo?=
 =?utf-8?B?VHNmb1h2alN2dmV4emZGR2xwSzBVZFVWT0RpSHFxNjlzWTN3cEVuV2xXaEZw?=
 =?utf-8?B?Z00wRzVwSThtVENrYzAxSC90aXhzc0V2Z1JQUy9CRUU0WTFuTXFvYVVZU1Ay?=
 =?utf-8?B?TkM4c3p5akR1ZC93UXBUL0dzSHk2WFl6MFd0YzNoRHNncGF5NWZpeEt0T2lp?=
 =?utf-8?B?bmxKSTZobDFxNE54WFNubUZVZWZUaFlJVEhTMU1lWFBBYUp4eXJVSTFqcWUy?=
 =?utf-8?B?UVlSOVNiOExYRmdiZGZjWXpZWGZGWFVkbExhTERrNC9iNXU3Rlpyd0hGY0dw?=
 =?utf-8?B?TDJIczlqMGtnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFpWSXppTjZuL1FVQUVQZklHN1kvZnZPMHZTMEliUFpkSFhXdkc5OEZTUHZF?=
 =?utf-8?B?Yk9zWDEzR2ZUSytlM0VlTUxrWjdYdTVURS9MWm1Mb3pSMDdxVnhwWjVPOTBE?=
 =?utf-8?B?bnlTeEo1cncveXVwWFYrZjhTYXVuSjJYcWJaMWNoeVNMKzBBRXpNVWRUSWUw?=
 =?utf-8?B?c3FvdWtGTjJYbnRMWUZTMk8xYWNPYndwS24zcUhGSmxXQVI0SThSR3l1Ui9u?=
 =?utf-8?B?cDF0ODZuME1WSEsrWGNFRVJDV3dVZDlWY3BONkFLVW9FbUpXQUt4R1BZYkFi?=
 =?utf-8?B?LzNsVTVMbVJrVTFoZ21ISlFFQ3hDWS9MdG9tTjJqakFld3plZ0RTZkZYZTUx?=
 =?utf-8?B?ZzdGYnNieDQvNzlubFhXTytyK0NKUFlQQXlVRW9tU09ja1V0QWs2dmFtMUh4?=
 =?utf-8?B?ZUl4bnZEdnpweUI5VloyeW82V0JSOTNoZ045TTdKNFNhYWh5ZU1YbVVoVEp2?=
 =?utf-8?B?VGtNQzdibUZJK1R6ZDhzKzU1cG43U0QyWVZGeEc4Nm10b0RGZGFMRDZwRWFo?=
 =?utf-8?B?T1dqUFJvelJwZ2tsREFiZm44MFd1L0JjaGJLQlVVMEsvZlJ3cVUvN2dMME1F?=
 =?utf-8?B?LzZTcXpXeWhOOEtwS0JQOVpGeCtjdU0yVU9zcHJFOW9qWGtnblJIclU0WXRL?=
 =?utf-8?B?OURIUDNNMSt6b1Z2MGZUVVBmZXFKY0xySityczlVdjVOdG56bjJ1VTZDZzd0?=
 =?utf-8?B?a1ZYOG5wVE80bHBjOGdxYXJYUmR0cmR6c1pnWWZUZ0JvWFV4ektBSTBYeXg3?=
 =?utf-8?B?bkQ4d0VRQk1Menp2aVI3U3FjTTZKandOWVVEeGtOcWxzYlJGdDVOVGxoL2J3?=
 =?utf-8?B?d2VKRlFSOG00ZVlpYW1Ua3E0M2xFRnlDamY3eXBpTVg4RVZNckhEckhyZGk3?=
 =?utf-8?B?d1V2cUYrckRTTE1FM25yK05YNjZOMnRKamxCblBzMDZvM2RwQmdVWHVMM0p3?=
 =?utf-8?B?MUhXb1VmMUhmNFFyN2dCcFdObjEzMUdmNnZyRmFObXU4MUZ1dTNMR0pGdmd3?=
 =?utf-8?B?UERVVUVkN3kvWm5oTmF6eDc3MkdhaU5jcEd5WlFzd0c3Q3UzcHYwTlFjWVYr?=
 =?utf-8?B?Tk51V21NUklVUHJoL0t2OXErQ1lVYkFnMzBkRlNnc1BHcE9hUXVRemNEN0Rs?=
 =?utf-8?B?aEF3ak54aWpiSDdodmpKbDUyOGF6WGpia0hqQW9zRGpuUnBPWXdHRm9qSzRh?=
 =?utf-8?B?TG9IV045cDNPRC93YVg1SWEyTGVQSHBSVUIzNjE1dm5aRXRqcTBOeVhUREJv?=
 =?utf-8?B?L0UvRmZlaHF5OHdqKytNcVVUeFFmYU1XNDVGMkRLVkZUbTdCemNTM1RBaDVx?=
 =?utf-8?B?dU5tbEkrTk1wQzdBUnVMQkYvUlQ1cmo1Y1MvR2tuQ1JTZ0h1VzVtdXdROFpo?=
 =?utf-8?B?Z0grS0o2Tlk4Y09Pa1hVN3R6L1JWOXQzaDJXbXhaVGhzVTNCNUhiR3hHVnRJ?=
 =?utf-8?B?RXV0b0dndFhWOFFldkpmeGV3QTFpbVhSMUp5NWhQWXlQcWJnWUllQ1BFM2Er?=
 =?utf-8?B?M3p2cDd1YzlKejBhYWRQRW1IbWhhZEtRRUJsTkFkekFxVVIyS0FOUjhzL1l0?=
 =?utf-8?B?MXRwY05ocFltb3ZVSm9NVmxHeEpGOStMc0tncXplNTgrT3o3WHhaV1ZCazhV?=
 =?utf-8?B?a2NPQnlibDZwb2lsK1loQlIzVHFZNEd2cUdSQ09oMjN6NmVGVURuUXA0eWhO?=
 =?utf-8?B?eXJ6QVg1b3NFRUpkV0ZCbUxyWjVzL1dGcXBGeW5tSXpHQ2g0aVBkdTEyUThO?=
 =?utf-8?B?UUlRQ2xSRHlkaU5nT2RvTVVoM1FjQ1REV3Q5S1BUL2liM3NncHc2K3U4Rno1?=
 =?utf-8?B?ZEdSZ0tVaTZHcjQwNC9JZXI2WXZSRHhhMDBLQ2dmRy9RL0cybXZDSU1XR2pn?=
 =?utf-8?B?d1o4YWNOZWtHSGNwMXlDWm1OWFhIWFhSb2RwUzh0Y2krTldPajI2MVlBeGhI?=
 =?utf-8?B?b25tWEZDcTNHZFd3dlVnR3pJanluUXRpbGRzeCtqdGE2aElvcHR2anhaVlJJ?=
 =?utf-8?B?RGwyVENQVHB0blpMTW53UGZKRmRTU2ZFditKUWtJZlkreVpLdUcyczZaMWtM?=
 =?utf-8?B?TDNmVDlGSXFETGlCcFViQ3BuWnZTSlUxWFhIcU5kdUlwYkg5dXhkTjdVUWc5?=
 =?utf-8?Q?IB1OFnAl1rPQiqSWgeDbjJ/f7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fc5994-c5a9-4cb2-8f96-08dd85f9e406
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 02:10:47.7850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGXLdCFaoutiDj30TbYZocwc9LBSI/QGb923437xwq9E4ckDmjndkmcglD8t41x8bGwV6CYoAhB10Nh9EY44rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9901

From: Peng Fan <peng.fan@nxp.com>

There is no in-tree user of "include/sound/cs42l56.h", so move
'struct cs42l73_platform_data ' to cs42l73.c and remove the header file.
And platform data is mostly for legacy platforms that create devices
non using device tree. So drop cs42l73.h to prepare using GPIOD API.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/sound/cs42l73.h    | 19 -------------------
 sound/soc/codecs/cs42l73.c | 36 ++++++++++++++++++------------------
 2 files changed, 18 insertions(+), 37 deletions(-)

diff --git a/include/sound/cs42l73.h b/include/sound/cs42l73.h
deleted file mode 100644
index 5a93393b6124f746bfb7bf5076e4bd1f458019d2..0000000000000000000000000000000000000000
--- a/include/sound/cs42l73.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/cs42l73.h -- Platform data for CS42L73
- *
- * Copyright (c) 2012 Cirrus Logic Inc.
- */
-
-#ifndef __CS42L73_H
-#define __CS42L73_H
-
-struct cs42l73_platform_data {
-	/* RST GPIO */
-	unsigned int reset_gpio;
-	unsigned int chgfreq;
-	int jack_detection;
-	unsigned int mclk_freq;
-};
-
-#endif /* __CS42L73_H */
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 556270befa941a69e17b47a15677e1c4f912b14f..c09c23487d2e73340b8947ed0e1ffadb24414e7c 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -19,7 +19,6 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
-#include <sound/cs42l73.h>
 #include <sound/initval.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -29,6 +28,14 @@
 #include "cirrus_legacy.h"
 #include "cs42l73.h"
 
+struct cs42l73_platform_data {
+	/* RST GPIO */
+	unsigned int reset_gpio;
+	unsigned int chgfreq;
+	int jack_detection;
+	unsigned int mclk_freq;
+};
+
 struct sp_config {
 	u8 spc, mmcc, spfs;
 	u32 srate;
@@ -1276,7 +1283,7 @@ static const struct regmap_config cs42l73_regmap = {
 static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 {
 	struct cs42l73_private *cs42l73;
-	struct cs42l73_platform_data *pdata = dev_get_platdata(&i2c_client->dev);
+	struct cs42l73_platform_data *pdata;
 	int ret, devid;
 	unsigned int reg;
 	u32 val32;
@@ -1292,23 +1299,16 @@ static int cs42l73_i2c_probe(struct i2c_client *i2c_client)
 		return ret;
 	}
 
-	if (pdata) {
-		cs42l73->pdata = *pdata;
-	} else {
-		pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata),
-				     GFP_KERNEL);
-		if (!pdata)
-			return -ENOMEM;
-
-		if (i2c_client->dev.of_node) {
-			if (of_property_read_u32(i2c_client->dev.of_node,
-				"chgfreq", &val32) >= 0)
-				pdata->chgfreq = val32;
-		}
-		pdata->reset_gpio = of_get_named_gpio(i2c_client->dev.of_node,
-						"reset-gpio", 0);
-		cs42l73->pdata = *pdata;
+	pdata = devm_kzalloc(&i2c_client->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	if (i2c_client->dev.of_node) {
+		if (of_property_read_u32(i2c_client->dev.of_node, "chgfreq", &val32) >= 0)
+			pdata->chgfreq = val32;
 	}
+	pdata->reset_gpio = of_get_named_gpio(i2c_client->dev.of_node, "reset-gpio", 0);
+	cs42l73->pdata = *pdata;
 
 	i2c_set_clientdata(i2c_client, cs42l73);
 

-- 
2.37.1


