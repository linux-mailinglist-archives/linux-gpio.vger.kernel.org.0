Return-Path: <linux-gpio+bounces-9190-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF9C95FECF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 04:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6219F1F20FDA
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Aug 2024 02:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7549479;
	Tue, 27 Aug 2024 02:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b="O1+zumqo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EB82564
	for <linux-gpio@vger.kernel.org>; Tue, 27 Aug 2024 02:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.206
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724724371; cv=fail; b=iYl9g4aWjUnJx5Af7hUYB92llAq7nAZeidaSTvGHhZd4EGJYi8NT4nRGw2cHxTR5L8JB5TNnQpZIxkObyQ8IFpNHB5VhJU+OLidZ8FxfaF5FBUU9dQtXM6rsciFZ6YrYEDGK1HfkcuFwxn4bvspwdg+wKkN//v1BNdQbtnHHAAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724724371; c=relaxed/simple;
	bh=vL/HLRWnBk36c6i+4GTZ0vrPwZw4tJ2ykFOd3ZJ+/dI=;
	h=Date:From:To:cc:Subject:Message-ID:Content-Type:MIME-Version; b=YGuyTbEohEUINxbACpMPALQBZfscclV6YQJ4829Uq1aSf+Zfr0IeMEIcDZDyS6K1LKYw/SQUqiWNW4vCssSRJagOBz6yzoN4VVGCKah1SlJRnHqyMIETAe/tJYkzr+tHn9ve87L/zhUmnJTm8FqmoaLMBfp6wstO9ClqJjyrfx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com; spf=pass smtp.mailfrom=digi.com; dkim=pass (2048-bit key) header.d=digi.com header.i=@digi.com header.b=O1+zumqo; arc=fail smtp.client-ip=209.222.82.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=digi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digi.com
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174]) by mx-outbound-ea15-210.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 27 Aug 2024 02:05:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7gzB9JTfbWJHkzIRx7yNJtZjbKmR5nMoDHtOC7K3ReJjFQr0Tkw9RzJazUasL4/xb/wL6ARiogpm2858lAZHxHzYHQesI6K1e93MvU2f1Blx28wJbVbspq6KkKLWjl6ZHsdpgvCJrAJrO3Tyb2AquOJWFbH5mDDYsRvkP5GHuvrqzKcuL/jhNxronr2/PNZI3nbDLpOtD3xZterGT/4WIJLXYdP6aoc6jDsEbHr5GBRFfo4QCcQcDFRO/YCYCjOfcjzk7WUkOtuvWCOkRV983Ftt3NxmdIcnpFcyO6tLoI8zJghHHpF0xjE+0eaza8e9arXn8LQRd5TflLFw15TtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dItNAseAbg1VBls9FArhRH8HvkLM11kb4Y31Sg6tLdw=;
 b=ofOPRGelLUzVStXYpkPtryFMCQLKC1XJJT4nH4a2D4Tsfm1hrTZBi1rfHGcnF/4ModGpe0wAjCF/VlBar82q+xWyr12yrN5k4082ureMTKQDSgEBVQEchUi0LPONfTq6LDSfJAZUEGsil7NtT7mmy0yvA+RxvSy5wTccmTTH7NndyOTVh7ulipT+rtv9T44YeHmlP2bBdWGrkNErxn+Uk4ZRUYKXtwN6UBbiO8SaQUex/oYkYNzfvsLTCAf4wQeaj4G+GJRGIt/Px9z2D7xBfyd9qhIiwp71IT/WjeF5FZwkYXCHdxiftWVAHFnouBR8WYBDeE6A/ARmwe+uRQOj4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dItNAseAbg1VBls9FArhRH8HvkLM11kb4Y31Sg6tLdw=;
 b=O1+zumqoJ8/xCsr7wO/5ZyLJ4IqXzGFvCkXGxUCEfv6JrfSdr1bLdBxHzwU3Fk9GcbIoRQ2aDKuK4V4e14Vc6axQT7VqQRW5RufxmqIb60sqhWRDVTnOozVSCtUu+i44Z4T0g+WoDAhSlAHsnWegq2wC6ZBHWg028DydgRVj6a49sEe1Tz0z5O+qBZuDEyoSIU2SdxAPGiF2ugkuT8ysaN1e1D0IpuqID8rohJJl1glQ1aom2cjKwfU2mGPcHkorZ+5bXmPuWeaTcLQoQc3bnRi53VViu7iogEc3AWdeM54dcIJZ2zfilCQFCnxYBacGJsfD7SjLtY5fqhIZQv97CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from DS0PR10MB6918.namprd10.prod.outlook.com (2603:10b6:8:136::8) by
 DM6PR10MB4122.namprd10.prod.outlook.com (2603:10b6:5:221::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.16; Tue, 27 Aug 2024 02:05:34 +0000
Received: from DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae]) by DS0PR10MB6918.namprd10.prod.outlook.com
 ([fe80::3697:c0ef:caee:24ae%5]) with mapi id 15.20.7918.006; Tue, 27 Aug 2024
 02:05:34 +0000
Date: Tue, 27 Aug 2024 12:05:24 +1000 (AEST)
From: David Leonard <David.Leonard@digi.com>
To: linux-arm-kernel@lists.infradead.org
cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
    Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
    Pengutronix Kernel Team <kernel@pengutronix.de>, 
    Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
    linux-gpio@vger.kernel.org
Subject: [PATCH 1/6] pinctrl: ls1012a: Add pinctrl driver support
Message-ID: <8cd0b743-4fff-e17f-9543-d2d4d7879758@digi.com>
Organization: Opengear Digi
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: SY6PR01CA0021.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::8) To DS0PR10MB6918.namprd10.prod.outlook.com
 (2603:10b6:8:136::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6918:EE_|DM6PR10MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 64eab99f-0b86-4652-a2e6-08dcc63cbc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+qRjNX1rQtK1rjkEKXb2CW3ccgt2v2P2NNawcWzkso6naIppvXSPTM0bw73f?=
 =?us-ascii?Q?mvYEBZ/RlvlChxF7chRIZLNyf8+Ja877+2W0XshXQm0DvymUw/QC1+WveQSL?=
 =?us-ascii?Q?5PXsLLQ7EmlLe9KOm0LREDoO4sZ9nG5VNZWaYYtZOmUFwqgMK4R6VkLOPdsl?=
 =?us-ascii?Q?bIaE0imulJr7YJL/Zxt8OYVGi4/TFRf0olAZgtedYU1Arr4QjM3jEmh3Md/k?=
 =?us-ascii?Q?buj+f7PE1jIsaP0Oclg2kCE2fYA4S29OPmANmiJDBKQLp4HZQqC0tAa8C3OM?=
 =?us-ascii?Q?eloKGGx97rUs8fOVCgwNrfHyfxECpSrLtmRQmxH19tpJdII0ljqwlEl/fmn0?=
 =?us-ascii?Q?Lk9Jx1QR/vl8EN/zRoLDnW7oyXKBkgrbuQ4Ani31ZbY3skR9w37z90wcxWs5?=
 =?us-ascii?Q?8UiTVpcllOvvakqMUuntwhbZaFFlOjAI9zizg1Twy/shaxENGBPD3foCXdiq?=
 =?us-ascii?Q?VPiYn5xIsHP3d/xrmS9Czq/yv4l0HLXyrirrowyPHFJ0G2rMEKQ79cjvCLFs?=
 =?us-ascii?Q?dMwJ2o8mkwoCXXcIenOuHsl0zQNlb5UypPV71XrFkLY5d5w1mbGV2Qo5Wvcb?=
 =?us-ascii?Q?by92IExm7YyAzxH/4drgbYNk8LMcP9IsjbH0lJLlIA7qUJEQbqTn47DRMECd?=
 =?us-ascii?Q?TfTeOtvSkUEErNo2JFyKZTXVAMCXdcOtwEqJBwFZdYpOmojkBLajI/Rxr/is?=
 =?us-ascii?Q?aH4ERheVuZhjgDoRlRQQlR+tWUw+BHFZeQSVhMhjdNr/fmVrUKCXVhqlRfde?=
 =?us-ascii?Q?uKodIHHmepLSrAr8sjSxrcuEDQALojhbhl39xV90DtQGAh6P23fmjFHGRuaf?=
 =?us-ascii?Q?pGb8em5oqrGOjnzBr50fW2sTtfaGFF2VDa2lNRPshOY7t7xEsucaZDm9EzFy?=
 =?us-ascii?Q?NSkBR9gx36LLLyGIDtroIYVrwJKEECEACSLTsBOSi1hDTLbiThRkq69EO0ht?=
 =?us-ascii?Q?ebmVHwzZhvuUl/45NdvBQ/QoFFLpDJp0Xj4y6IhP7PYXPRF40XmfisMmMDcN?=
 =?us-ascii?Q?+2Z7wdGdzGjJlXpRF28VBsK1Gt+sPEhdfKpZ37+R6Kwsx2tsCmwWEqh5At6M?=
 =?us-ascii?Q?uvhXfpTQXsXPzlHADRnoRba/WbTLoxecC44RV2JkzSr+tiok+Rm9+7lqyjgO?=
 =?us-ascii?Q?wD1Sb8OHGlk9LGVF2AO3kPpxVO9ZaFY18kLqlBrLT3+7vinoI+Mh4icJY+UZ?=
 =?us-ascii?Q?o+ohxsXjr2+i6UGs+r+6NgA/AR7+CoUHI7Xhavz3QgUrzLsSaT76ZzBNoEXf?=
 =?us-ascii?Q?kJOMapq1lfpV+Qx5MjaUIUckyKkk3RwEdq23S2QPrK+5u+21xo249P1Rsp0h?=
 =?us-ascii?Q?IwI3/EdYjgiOuguQocVsKAKI85uIKqES4FGU8+ileiRVUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6918.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?70d3m2nmfWMlTxbdjybupz28xNSL//N9v+5vL8tUrMQeO7YN1Y0TPakPwO9O?=
 =?us-ascii?Q?RDfj6yqH3z78UpwWCAwRekJ8wMz2ItgwN11ZzyOb1I3KqRLak7gTOrm8QwJB?=
 =?us-ascii?Q?SdZ2tv/XGZbE6FI8SjvNZ8jVMuk2/z+1tAqpuIPQVBDfYJSvW+a+U/0MYTGU?=
 =?us-ascii?Q?UhVE6zHLsgfuNvuD+5NL3K+cSt0x2O57mVoYicFnF6PiZEGwtzFfClPYCSJg?=
 =?us-ascii?Q?L0ujoe/4PiFBS5Bxxw/pe8TmRShNDuFMJU6rv5dPqhcZvvd5pXrAO1TKcNsQ?=
 =?us-ascii?Q?V9Y8T2KDHf7jfDghEjlV5QgVYizCCr/0TomPjlB/cVzLUyk3I+Ro4fz6dZiV?=
 =?us-ascii?Q?zqkvYiQxfJNDYfoMrymFk1mKYba1BWeWkMW9R90pawmUgWBoLurPos3PJjPz?=
 =?us-ascii?Q?TOlbXmWqbnX6TtSClOK0hvgaWjUVl+7W1x/C05u9vhP/xgOUg3gjMXG/XPs0?=
 =?us-ascii?Q?WpX3JiyWaNkLyvnzi32QH1mrFrfSicqJkM+fB1lIYAH32KhYS/WAcGT3Zfcy?=
 =?us-ascii?Q?K+2/5TtuTxLG7jv07Xs5vMfVT/Hea+VHgjLZPsFOlSdV0GUZ2eWLmMgeMqqt?=
 =?us-ascii?Q?JuHYLHD61o8uhr6EjVoJPJip6FCYyZdo6Q3GKAnIabjzSHwu9i3K9a27sK5D?=
 =?us-ascii?Q?W6oZ2Ktz/MZPY+mkXgAZLCQKw3Xr397Y9e120pgStL8EPpwqXwfQHhrhLsbO?=
 =?us-ascii?Q?UVQBV6kjjyor1Z+zTP1NA7hqFXA0frKm86DfYtuC/fy9gSk/JOAJLGfvGFLg?=
 =?us-ascii?Q?rZMKiFViwkPK0gnAX2c+BxTHdQwS44NGb+fit3xnC11gOqvRAN43p4NfTuep?=
 =?us-ascii?Q?8ShyeTQ+o2a3/pEIzc/UZcMLnQzzFXBly2MSUp/2emj0r4VeTdtKlYWgLTPM?=
 =?us-ascii?Q?v+ljPLcMV9LKu+dI+k7CXTCNETJuhG7VS5BeBAHqSRJ6ZDgIjyIg74MH1IZu?=
 =?us-ascii?Q?wAD4ynXjY7DTDjBtW0biHh3IM+dN6aI8WlgshHTIdgr8E9T4PHRUsb4F+eiP?=
 =?us-ascii?Q?yofrn+KvxFuJNoI5pp7lG9JQYsur+N9fmxIhOkbWKKQRDiRnDvCUW7Alx0H9?=
 =?us-ascii?Q?IpaEu6ftIXRJxiM8t9wGWeGnCem70CEWeh/rwhVEN3OblT/Yxb8CQ8JMvONZ?=
 =?us-ascii?Q?HjsDLv5qqGBELhzNZHqayWE7bOxh/n/GVcKy5nYCAdyokjp/MTcf0kp1dJDD?=
 =?us-ascii?Q?+Z796CC+sq28WSXbz3zAKRu+KJorFbhBhzWgJ5vZK7B0bGb8W7fnDh7B6y9B?=
 =?us-ascii?Q?sEGaiDaQHytFR+08exD69DCu/qMDOeX7hXJcQI0OW7VgJN78neWUW8bTAaF9?=
 =?us-ascii?Q?QuM9UiursSMXV+TnHNOIS5ZGTSmqbgmMvqLMGktJ/SZasNBKhLKMVz7cazlp?=
 =?us-ascii?Q?Rdr67HqvQoytNpQqSjIkHUmmh5FQz+dOIIm2VyRpcJTgRSIKC82/72U9Y6Rt?=
 =?us-ascii?Q?Z61FW1k3XS4cbQHZ80lyq8s7Tdm9St1BXkNnc6N49aC+tnsDo7LuX0hvQhJJ?=
 =?us-ascii?Q?Ut8vqvYNTWcoVmIIImVWMz+OcGXf4jJKjCmcl8TEuOJStG3I5DHO0aspNusl?=
 =?us-ascii?Q?cCLYn954BaV4XuSKIXprXRX+q88p3AkwsFij0dewuQHdt6cFPN59gISgGfG4?=
 =?us-ascii?Q?x1gwUTIKz9uJoF90D2Q7NysmYIV44KNzAjvduer4qf1i?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64eab99f-0b86-4652-a2e6-08dcc63cbc4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6918.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 02:05:34.0481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfOYsjukHbBKg+CeBjhSfM8paq8j9GGT1yeqG4i5bf+Ijjlt2lUpUaWDbwZcW5L5uy/UsfLN8SAs1r1FIMR1yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4122
X-BESS-ID: 1724724337-104050-25130-68743-1
X-BESS-VER: 2019.3_20240823.2007
X-BESS-Apparent-Source-IP: 104.47.59.174
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVobGlkYWQGYGUNTcMNnMIskoxd
	gy2dzE0iDZKNXS2Mg00TLVLNU4Kc3cRKk2FgAJCZTkQgAAAA==
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.258621 [from 
	cloudscan22-50.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1


Add QorIQ LS1012A pinctrl driver, allowing i2c-core to exert
GPIO control over the second I2C bus.

Signed-off-by: David Leonard <David.Leonard@digi.com>
---
  drivers/pinctrl/freescale/Kconfig           |   8 +
  drivers/pinctrl/freescale/Makefile          |   1 +
  drivers/pinctrl/freescale/pinctrl-ls1012a.c | 381 ++++++++++++++++++++
  3 files changed, 390 insertions(+)
  create mode 100644 drivers/pinctrl/freescale/pinctrl-ls1012a.c

diff --git a/drivers/pinctrl/freescale/Kconfig b/drivers/pinctrl/freescale/Kconfig
index 3b59d7189004..a2038042eeae 100644
--- a/drivers/pinctrl/freescale/Kconfig
+++ b/drivers/pinctrl/freescale/Kconfig
@@ -209,6 +209,14 @@ config PINCTRL_IMX93
  	help
  	  Say Y here to enable the imx93 pinctrl driver

+config PINCTRL_LS1012A
+	tristate "LS1012A pinctrl driver"
+	depends on ARCH_LAYERSCAPE && OF || COMPILE_TEST
+	select PINMUX
+	select GENERIC_PINCONF
+	help
+	  Say Y here to enable the ls1012a pinctrl driver
+
  config PINCTRL_VF610
  	bool "Freescale Vybrid VF610 pinctrl driver"
  	depends on SOC_VF610
diff --git a/drivers/pinctrl/freescale/Makefile b/drivers/pinctrl/freescale/Makefile
index d27085c2b4c4..6926529d8635 100644
--- a/drivers/pinctrl/freescale/Makefile
+++ b/drivers/pinctrl/freescale/Makefile
@@ -35,3 +35,4 @@ obj-$(CONFIG_PINCTRL_IMX25)	+= pinctrl-imx25.o
  obj-$(CONFIG_PINCTRL_IMX28)	+= pinctrl-imx28.o
  obj-$(CONFIG_PINCTRL_IMXRT1050)	+= pinctrl-imxrt1050.o
  obj-$(CONFIG_PINCTRL_IMXRT1170)	+= pinctrl-imxrt1170.o
+obj-$(CONFIG_PINCTRL_LS1012A)	+= pinctrl-ls1012a.o
diff --git a/drivers/pinctrl/freescale/pinctrl-ls1012a.c b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
new file mode 100644
index 000000000000..d4c535ed6c07
--- /dev/null
+++ b/drivers/pinctrl/freescale/pinctrl-ls1012a.c
@@ -0,0 +1,381 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Pin controller for NXP QorIQ LS1012A.
+ *
+ * Copyright (c) 2024 Digi International, Inc.
+ * Author: David Leonard <David.Leonard@digi.com>
+ */
+
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/pinctrl/pinmux.h>
+#include <linux/pinctrl/pinconf-generic.h>
+#include <linux/of.h>
+#include <linux/io.h>
+#include <linux/regmap.h>
+#include <linux/platform_device.h>
+#include <linux/sys_soc.h>
+
+struct ls1012a_pinctrl_pdata {
+	struct pinctrl_dev *pctl_dev;
+	void __iomem *cr0mem;
+	bool big_endian;
+	u32 ssc;
+};
+
+/* Bitfield macros for masks and values that follow the datasheet's
+ * bit numbering schemes for registers of different bit-endianess. */
+#define BITV_BE(hi, v)	((v) << (31 - (hi) % 32))
+#define BITM_BE(hi, lo)	(((1 << ((hi) - (lo) + 1)) - 1) << (31 - (hi) % 32))
+#define BITV_LE(lo, v)	((v) << ((lo) % 32))
+#define BITM_LE(lo, hi)	(((1 << ((hi) - (lo) + 1)) - 1) << ((lo) % 32))
+
+/* SCFG PMUXCR0 pinmux control register */
+#define SCFG_PMUXCR0			0x430
+#define QSPI_MUX_OVRD_MASK		BITM_BE(0, 0)	/* [0] */
+#define QSPI_MUX_DISABLE		BITV_BE(0, 0)	/*  use RCW */
+#define QSPI_MUX_ENABLE			BITV_BE(0, 1)	/*  use PMUXCR0 */
+#define QSPI_DATA0_GPIO_OVR_MASK	BITM_BE(1, 1)	/* [1] */
+#define QSPI_DATA0_GPIO_SEL_SPI		BITV_BE(1, 0)	/*  DATA0,SCK,CS0 */
+#define QSPI_DATA0_GPIO_SEL_GPIO	BITV_BE(1, 1)	/*  GPIO1[4,11,5] */
+#define QSPI_DATA1_GPIO_OVR_MASK	BITM_BE(3, 2)	/* [3:2] */
+#define QSPI_DATA1_GPIO_SEL_SPI		BITV_BE(3, 0)	/*  DATA1 */
+#define QSPI_DATA1_GPIO_SEL_GPIO	BITV_BE(3, 1)	/*  GPIO1[12] */
+#define QSPI_IIC2_OVR_MASK		BITM_BE(5, 4)	/* [5:4] */
+#define QSPI_IIC2_SEL_GPIO		BITV_BE(5, 0)	/*  GPIO1[13,14] */
+#define QSPI_IIC2_SEL_I2C		BITV_BE(5, 1)	/*  SCL,SDA (rev0) */
+#define QSPI_IIC2_SEL_SPI		BITV_BE(5, 2)	/*  DATA2,DATA3 */
+
+/* RCW SoC-specific configuration (read-only) */
+#define DCFG_RCWSR			0x100
+#define SOC_SPEC_CONFIG			416		/* word 13 */
+#define DCFG_SSC_REG			(DCFG_RCWSR + SOC_SPEC_CONFIG / 8)
+#define SSC_DATA0_GPIO_MASK		BITM_LE(421, 421)
+#define SSC_DATA0_GPIO_SEL_SPI		BITV_LE(421, 0)	/*  DATA0,SCK,CS0 */
+#define SSC_DATA0_GPIO_SEL_GPIO		BITV_LE(421, 1)	/*  GPIO1[11,4,5] */
+#define SSC_DATA1_GPIO_MASK		BITM_LE(422, 423)
+#define SSC_DATA1_GPIO_SEL_SPI		BITV_LE(422, 0)	/*  DATA1 */
+#define SSC_DATA1_GPIO_SEL_GPIO		BITV_LE(422, 2)	/*  GPIO1[12] */
+#define SSC_IIC2_MASK			BITM_LE(424, 425)
+#define SSC_IIC2_SEL_GPIO		BITV_LE(424, 0)	/*  GPIO1[13,14] */
+#define SSC_IIC2_SEL_I2C		BITV_LE(424, 2)	/*  SCL,SDA */
+#define SSC_IIC2_SEL_SPI		BITV_LE(424, 1)	/*  DATA2,DATA3 */
+#define SSC_IIC2_SEL_GPIO_RESET		BITV_LE(424, 3)	/*  GPIO1[13],RESET_REQ_B*/
+
+const struct pinctrl_pin_desc ls1012a_pins[] = {
+	PINCTRL_PIN(60, "QSPI_A_DATA3/GPIO1_14/IIC2_SDA/RESET_REQ_B"),
+	PINCTRL_PIN(61, "QSPI_A_DATA1/GPIO1_12"),
+	PINCTRL_PIN(62, "QSPI_A_SCK/GPIO1_04"),
+	PINCTRL_PIN(122, "QSPI_A_DATA2/GPIO1_13/IIC2_SCL"),
+	PINCTRL_PIN(123, "QSPI_A_DATA0/GPIO1_11"),
+	PINCTRL_PIN(124, "QSPI_A_CS0/GPIO1_05"),
+};
+
+static const unsigned int qspi_1_grp[] = { 62, 123, 124 };
+static const unsigned int qspi_2_grp[] = { 61 };
+static const unsigned int qspi_3_grp[] = { 122, 60 };
+
+#define GRP_qspi_1	0	/* SCK,CS0,DATA0 */
+#define GRP_qspi_2	1	/* DATA1 */
+#define GRP_qspi_3	2	/* DATA2,DATA3 */
+#define _GRP_max	3
+
+#define _PINGROUP(name) \
+	[GRP_##name] = PINCTRL_PINGROUP(#name "_grp", name##_grp, ARRAY_SIZE(name##_grp))
+static const struct pingroup ls1012a_groups[] = {
+	_PINGROUP(qspi_1),
+	_PINGROUP(qspi_2),
+	_PINGROUP(qspi_3),
+};
+
+
+static void ls1012a_write_cr0(struct ls1012a_pinctrl_pdata *pd, u32 val)
+{
+	if (pd->big_endian)
+		iowrite32be(val, pd->cr0mem);
+	else
+		iowrite32(val, pd->cr0mem);
+}
+
+static u32 ls1012a_read_cr0(struct ls1012a_pinctrl_pdata *pd)
+{
+	return pd->big_endian ? ioread32be(pd->cr0mem) : ioread32(pd->cr0mem);
+}
+
+static int ls1012a_get_groups_count(struct pinctrl_dev *pcdev)
+{
+	return ARRAY_SIZE(ls1012a_groups);
+}
+
+static const char *ls1012a_get_group_name(struct pinctrl_dev *pcdev,
+	unsigned int selector)
+{
+	return ls1012a_groups[selector].name;
+}
+
+static int ls1012a_get_group_pins(struct pinctrl_dev *pcdev,
+	unsigned int selector, const unsigned int **pins, unsigned int *npins)
+{
+	*pins = ls1012a_groups[selector].pins;
+	*npins = ls1012a_groups[selector].npins;
+	return 0;
+}
+
+static const struct pinctrl_ops ls1012a_pinctrl_ops = {
+	.get_groups_count = ls1012a_get_groups_count,
+	.get_group_name = ls1012a_get_group_name,
+	.get_group_pins = ls1012a_get_group_pins,
+	.dt_node_to_map = pinconf_generic_dt_node_to_map_group,
+	.dt_free_map = pinconf_generic_dt_free_map,
+};
+
+static const char * const i2c_groups[] = { "qspi_3_grp" };
+static const char * const spi_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
+static const char * const gpio_groups[] = { "qspi_1_grp", "qspi_2_grp", "qspi_3_grp" };
+static const char * const gpio_reset_groups[] = { "qspi_3_grp" };
+
+#define FUNC_i2c	0
+#define FUNC_spi	1
+#define FUNC_gpio	2
+#define FUNC_gpio_reset 3
+#define _FUNC_max	4
+
+#define _PINFUNC(name) \
+	[FUNC_##name] = PINCTRL_PINFUNCTION(#name, name##_groups, ARRAY_SIZE(name##_groups))
+static const struct pinfunction ls1012a_functions[] = {
+	_PINFUNC(i2c),
+	_PINFUNC(spi),
+	_PINFUNC(gpio),
+	_PINFUNC(gpio_reset),
+};
+
+static int ls1012a_get_functions_count(struct pinctrl_dev *pctldev)
+{
+	return ARRAY_SIZE(ls1012a_functions);
+}
+
+static const char *ls1012a_get_function_name(struct pinctrl_dev *pctldev, unsigned int func)
+{
+	return ls1012a_functions[func].name;
+}
+
+static int ls1012a_get_function_groups(struct pinctrl_dev *pctldev, unsigned int func,
+	const char * const **groups,
+	unsigned int * const ngroups)
+{
+	*groups = ls1012a_functions[func].groups;
+	*ngroups = ls1012a_functions[func].ngroups;
+	return 0;
+}
+
+/*
+ * LS1012A
+ *    Group: qspi_1             qspi_2      qspi_3
+ *           ================== =========== =============
+ *    Pin:   62    123    124   61          122    60
+ *           ----- ------ ----- ----------- ------ ------
+ * i2c                                      SCL    SDA    (RCW only)
+ * spi       SCK   DATA0
+ * spi       SCK   DATA0        DATA1
+ * spi       SCK   DATA0        DATA1       DATA2  DATA3
+ * gpio      GPIO4 GPIO11 GPIO5
+ * gpio                         GPIO12
+ * gpio                                     GPIO13 GPIO14
+ * gpio_reset                               GPIO13 REQ_B  (RCW only)
+ */
+
+static const struct ls1012a_func_mux {
+	u32 cr0mask, cr0; /* mux control */
+	u32 sscmask, ssc; /* equivalent in RCW */
+} ls1012a_func_mux[_FUNC_max][_GRP_max] = {
+	[FUNC_i2c] = {
+		[GRP_qspi_3] = {
+			.sscmask = SSC_IIC2_MASK,
+			.ssc =     SSC_IIC2_SEL_I2C,
+		},
+	},
+	[FUNC_spi] = {
+		[GRP_qspi_1] = {
+			.cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
+			.cr0 =     QSPI_DATA0_GPIO_SEL_SPI,
+			.sscmask = SSC_DATA0_GPIO_MASK,
+			.ssc =     SSC_DATA0_GPIO_SEL_SPI
+		},
+		[GRP_qspi_2] = {
+			.cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
+			.cr0 =     QSPI_DATA1_GPIO_SEL_SPI,
+			.sscmask = SSC_DATA1_GPIO_MASK,
+			.ssc =     SSC_DATA1_GPIO_SEL_SPI,
+		},
+		[GRP_qspi_3] = {
+			.cr0mask = QSPI_IIC2_OVR_MASK,
+			.cr0 =     QSPI_IIC2_SEL_SPI,
+			.sscmask = SSC_IIC2_MASK,
+			.ssc =     SSC_IIC2_SEL_SPI,
+		},
+	},
+	[FUNC_gpio] = {
+		[GRP_qspi_1] = {
+			.cr0mask = QSPI_DATA0_GPIO_OVR_MASK,
+			.cr0 =     QSPI_DATA0_GPIO_SEL_GPIO,
+			.sscmask = SSC_DATA0_GPIO_MASK,
+			.ssc =     SSC_DATA0_GPIO_SEL_GPIO,
+		},
+		[GRP_qspi_2] = {
+			.cr0mask = QSPI_DATA1_GPIO_OVR_MASK,
+			.cr0 =     QSPI_DATA1_GPIO_SEL_GPIO,
+			.sscmask = SSC_DATA1_GPIO_MASK,
+			.ssc =     SSC_DATA1_GPIO_SEL_GPIO,
+		},
+		[GRP_qspi_3] = {
+			.cr0mask = QSPI_IIC2_OVR_MASK,
+			.cr0 =     QSPI_IIC2_SEL_GPIO,
+			.sscmask = SSC_IIC2_MASK,
+			.ssc =     SSC_IIC2_SEL_GPIO,
+		},
+	},
+	[FUNC_gpio_reset] = {
+		[GRP_qspi_3] = {
+			.sscmask = SSC_IIC2_MASK,
+			.ssc =     SSC_IIC2_SEL_GPIO_RESET,
+		},
+	},
+};
+
+static int ls1012a_set_mux(struct pinctrl_dev *pcdev,
+	unsigned int func, unsigned int group)
+{
+	struct ls1012a_pinctrl_pdata *pd = pinctrl_dev_get_drvdata(pcdev);
+	const struct ls1012a_func_mux *fm = &ls1012a_func_mux[func][group];
+	u32 cr0 = ls1012a_read_cr0(pd);
+
+	if (!fm->cr0mask) {
+		if ((pd->ssc & fm->sscmask) != fm->ssc)
+			return -EOPNOTSUPP;
+		cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_DISABLE;
+	} else {
+		cr0 = (cr0 & ~fm->cr0mask) | fm->cr0;
+		if ((pd->ssc & fm->sscmask) != fm->ssc)
+			cr0 = (cr0 & ~QSPI_MUX_OVRD_MASK) | QSPI_MUX_ENABLE;
+	}
+	ls1012a_write_cr0(pd, cr0);
+	return 0;
+}
+
+static void ls1012a_init_mux(struct ls1012a_pinctrl_pdata *pd)
+{
+	unsigned int func, group;
+	const struct ls1012a_func_mux *fm;
+	u32 cr0;
+
+	cr0 = ls1012a_read_cr0(pd);
+	if ((cr0 & QSPI_MUX_OVRD_MASK) == QSPI_MUX_DISABLE) {
+		/*
+		 * Prepare a disabled MUXCR0 to have a same/similar
+		 * configuration as RCW SSC, and leave it disabled.
+		 */
+		for (func = 0; func < _FUNC_max; func++) {
+			for (group = 0; group < _GRP_max; group++) {
+				fm = &ls1012a_func_mux[func][group];
+				if (fm->sscmask &&
+				    fm->ssc == (pd->ssc & fm->sscmask)) {
+					cr0 &= ~fm->cr0mask;
+					cr0 |= fm->cr0;
+				}
+			}
+		}
+		ls1012a_write_cr0(pd, cr0);
+	}
+}
+
+static const struct pinmux_ops ls1012a_pinmux_ops = {
+	.get_functions_count = ls1012a_get_functions_count,
+	.get_function_name = ls1012a_get_function_name,
+	.get_function_groups = ls1012a_get_function_groups,
+	.set_mux = ls1012a_set_mux,
+};
+
+static struct pinctrl_desc ls1012a_pinctrl_desc = {
+	.name = "ls1012a",
+	.pins = ls1012a_pins,
+	.npins = ARRAY_SIZE(ls1012a_pins),
+	.pctlops = &ls1012a_pinctrl_ops,
+	.pmxops = &ls1012a_pinmux_ops,
+	.owner = THIS_MODULE,
+};
+
+static int ls1012a_pinctrl_probe(struct platform_device *pdev)
+{
+	struct ls1012a_pinctrl_pdata *pd;
+	int ret;
+	u32 dcfg_ssc;
+	struct regmap *dcfg_regmap;
+
+	pd = devm_kzalloc(&pdev->dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, pd);
+
+	pd->big_endian = device_is_big_endian(&pdev->dev);
+
+	/* SCFG PMUX0 */
+	pd->cr0mem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pd->cr0mem))
+		return PTR_ERR(pd->cr0mem);
+	dev_dbg(&pdev->dev, "scfg pmuxcr0 at %px %s", pd->cr0mem,
+		pd->big_endian ? "be" : "le");
+
+	/* DCFG RCW SSC */
+	dcfg_regmap = syscon_regmap_lookup_by_phandle(
+		dev_of_node(&pdev->dev), "dcfg-regmap");
+	if (IS_ERR(dcfg_regmap)) {
+		dev_err(&pdev->dev, "dcfg regmap: %pe\n", dcfg_regmap);
+		return -EINVAL;
+	}
+	ret = regmap_read(dcfg_regmap, DCFG_SSC_REG, &dcfg_ssc);
+	if (ret) {
+		dev_err(&pdev->dev, "dcfg-regmap read: %d\n", ret);
+		return ret;
+	}
+	pd->ssc = swab32(dcfg_ssc); /* untwist RCW fields */
+
+	dev_dbg(&pdev->dev, "dcfg ssc = %08x (grp1=%s grp2=%s grp3=%s)\n",
+		pd->ssc,
+		(pd->ssc & SSC_DATA0_GPIO_MASK) == SSC_DATA0_GPIO_SEL_SPI ? "spi" : "gpio",
+		(pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_SPI ? "spi"
+		: (pd->ssc & SSC_DATA1_GPIO_MASK) == SSC_DATA1_GPIO_SEL_GPIO ? "gpio"
+		: (pd->ssc & SSC_DATA1_GPIO_MASK) == 0x80 ? "10" : "11",
+		(pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_GPIO ? "gpio"
+		: (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_I2C ? "i2c"
+		: (pd->ssc & SSC_IIC2_MASK) == SSC_IIC2_SEL_SPI ? "spi"
+		: "gpio+reset");
+
+	ls1012a_init_mux(pd);
+
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &ls1012a_pinctrl_desc,
+		pd, &pd->pctl_dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Failed pinctrl init\n");
+
+	pinctrl_enable(pd->pctl_dev);
+	return ret;
+}
+
+static const struct of_device_id ls1012a_pinctrl_match_table[] = {
+	{ .compatible = "fsl,ls1012a-pinctrl" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver ls1012a_pinctrl_driver = {
+	.driver = {
+		.name = "ls1012a_pinctrl",
+		.of_match_table = ls1012a_pinctrl_match_table,
+	},
+	.probe = ls1012a_pinctrl_probe,
+};
+
+builtin_platform_driver(ls1012a_pinctrl_driver)
+
+MODULE_DESCRIPTION("LS1012A pinctrl driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


