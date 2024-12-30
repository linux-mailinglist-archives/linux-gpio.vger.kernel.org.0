Return-Path: <linux-gpio+bounces-14339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D14919FE18E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 02:07:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17BD53A1913
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2024 01:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E481799B;
	Mon, 30 Dec 2024 01:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C5fHcHuL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2047.outbound.protection.outlook.com [40.107.22.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F598F4A;
	Mon, 30 Dec 2024 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735520821; cv=fail; b=lD6mrBnOx9oU7jYweKPY9d9BYLCCFar3yn8f9h5gkDElyKQuKjHX5vQj7N/+KdwfVId2feNxB8MfmiYp1+CAeFQ8AFaxUcfeg9DsGDwMtx8e6M4xxxbx3rSKX7VfXcylEd0xs1fqIYmlONumgYjz3lH6KfpBmjc0MeOY1v688pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735520821; c=relaxed/simple;
	bh=+ownQYuZTCW0grOslyCsVAWS3l9qLoPSy8SJCt1LW8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pRg7/SPUQmAu4sbQ7Uqi7SAwF7jeIgsjf0LWP3ds/qG8ZPJFvDelw8nWRT/mbaHm8M6DVQUPxwDzTq/icqQSG83mXQ6rxarei1zLsI9N0+gghpBvOtZi/l3pW1Qnsbra6Fhxp20EQ6TPbQp6+nYSd/bVVVFQBhmQBfTpbcSbFwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C5fHcHuL; arc=fail smtp.client-ip=40.107.22.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqe1p5L6a5+74+8s7axcnfTRd0wNG+pkuARGVALojnfCXJCNqtvkU1Bztdsu9r0IX8stWzfsIssLGY2RNlXna8cbWwlPOk9ILlq0E6xEtAXYpUf6J3ZKa9TgoKvFpBm5OiXHXrW4QZwUTnES3OuGMim//pyhrtWiazpIgSLLHNAL87LSlwQqrGuoZMOoXCE2rlhhcm2H0vyDI0RcSAPsSPbibJmgawCi8txfdZEpoFaG1ylM/vHB4I6ttJhW3g5ovuLg4dVZbhLJQnPxFT4KIcqtfGarQW92GEb4c3BLCdc7iAKWVKpzD18eQFwXZq23CM9VTOPJddbtf1dOHhOZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ownQYuZTCW0grOslyCsVAWS3l9qLoPSy8SJCt1LW8w=;
 b=Ax7FBWIsn56dp0dUlK5DKSHHSO89Q5jTN+bBPnPZLzxcGbopxpd+xFmqXB2Uscv4jJxZ+w+kpXZa0jAlDMjL4B+2f39BcLXZg4gLepmrgUfsL5Y+enNa23bUviXDNyUysb/R58RfGy47iOSZbWEZgI/NeO2Ru8dDaC7gc16vKLIG8TlpIWAu9ytcT9td8d/7BqwwIFUUGi1uNNOESBbip9/SqpNgWdKC5st25fN0Ek1EQoiwoB+jeWW9BpYL0ny9wy0pjbrP8Qj49zsTpgMsdFd9bKFNJDuiVjvWJodgMJNt6krAAMAyKZl8DBL7QWGigAcGiBlk7YqweebnUNGbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ownQYuZTCW0grOslyCsVAWS3l9qLoPSy8SJCt1LW8w=;
 b=C5fHcHuLsQJs7iatBpeH5SMkYnnnNMrhxW8KQaJzNapvTOUPfzxTITxBx40ctcIT0pUE0oG8e+PSCPr6orcSdnbVtmEVvivAme2cBaL+l3AGodUoRStNwg62WKp9ppmerWbj4/YHMWDPPMO9diHfQj41mrJFNYiQn7fBTXQjCPecxTU3M9kVogfYLLYqc6akB3sn5dfviD1+fGXYg3f4vXmP3Zau8RuIjI/fDMNTGH8IWP0m3bboZFMnmOwMMjR5DkaNsc53K1bncc93FeRks4rZRV4MXTanD9iGaVCfTUsLjw5fUTRQUJfz0QRAvDFoZMbSKcu5vo0TsxzWouMTLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9086.eurprd04.prod.outlook.com (2603:10a6:150:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 01:06:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 01:06:51 +0000
Date: Mon, 30 Dec 2024 10:12:39 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] scmi: Bypass set fwnode to address devlink issue
Message-ID: <20241230021238.GG28662@localhost.localdomain>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <CACRpkdZFQDiLax1QtPDr5zWbhAqwWuXdC=+VtBLD-S2c1FLpAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZFQDiLax1QtPDr5zWbhAqwWuXdC=+VtBLD-S2c1FLpAg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c3f86fb-b6ee-4bd4-c1d5-08dd286e3e76
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SitSR3JDRGtZZTRRUmR3S2hKUWh6Y3VESTV1NGVGSEVxZWJFaWZGd3ByUEZt?=
 =?utf-8?B?OExYTTRWVHhRVzZiNVFtd3RsUFkzcTd4bU5hZk51dnNYbUxGTWh0cnZUSHlZ?=
 =?utf-8?B?QVR2MXRsek84eGFZemNORUdnZ2I3eENLMnQ3QnRqVkpFS2dZNmU1WHl4TXF4?=
 =?utf-8?B?VkhTL1RubGRvV0U4aFY4SFJFRFpOVWQ1cWduRDEyYS8yRWx3SkZQQTBLYVo5?=
 =?utf-8?B?ZHJjSkprZWxjeGhmV3N5VTBqLzBvVWlmeGZoamx6cDFxVFFmbjZidnc5WlQx?=
 =?utf-8?B?S0dnVzg5L3RWMnEzL1cxTUlqQXBMeEpPUVE0aVJObGdROUd3M2g5VFVsVWVk?=
 =?utf-8?B?ZXU4cHB1dTEwRGU4Y0lRK0JCWW50R0FLdkwwTUtsbjBEbHJHS3B6QjZDV2po?=
 =?utf-8?B?WE9pVVV4NHhtNDdSREY4ZU9kb3Z6bTVWd0J6YlJtRldRbzN4MUlLUFZwWTlk?=
 =?utf-8?B?aXg0ckpKcG1FcDVXend1OGp0Mjk4bmI2ak1kTVNXaHAycGJMbHhxSnhDUER2?=
 =?utf-8?B?clNZTm5DOHNTb3BkNzM1cVNFVmE0cTJ0STYvbEdZZXVBNkRONlc3ZDF2dVNF?=
 =?utf-8?B?UUtQRkNXdnBJYWxMUG51YTJQbHlBcjJOWFpRVU14Rnl4cW41NDlvbEROYVdm?=
 =?utf-8?B?ekVmczRQcGNBRHNVUng1WXBUWmFqSUFOdlhoK2prWSt0NmNCRWtuN2xPSit4?=
 =?utf-8?B?a2FlMVpJUXpDRy9FSjhTL09QdnpUYVlGalNjVEhCQzJ6ODlpYkNBZGxNWmNF?=
 =?utf-8?B?MWhTMU5KbE95TFZRelNPMWJYVkd5ZEYwMUdrcnk4OG5nbjBvNGlESFFGNEpt?=
 =?utf-8?B?M3oycmNCYmdEVGllVjFhVXFWN1RucU42VHVWRkxSVkE5bTJrZHplc1RyaDc2?=
 =?utf-8?B?bkM4byt6a1Exdk4wa1V5dTRUMVBVSzBtRFdsRGcxSjBQb1lERE5JbmJyc05i?=
 =?utf-8?B?ZWJGbjUyN3RQT3hhejBJMHdBRURFdEdIV2txM0RvaUE4Tk4vK25aV1F1eDRk?=
 =?utf-8?B?dXU0V3NSeGJCUVk3bGRYYmtlQ1dQNTVPTlE2RVNxRzNBYnF3M2JCdEs5OUVl?=
 =?utf-8?B?NU4yRVJFeFVDdnJ2eHM5N1Zzb2xlTFdLcWt1dHNkL3FaLzZ2VjFlTkt5aHQr?=
 =?utf-8?B?SWFLS0lKVGlvcFI3SGIwMXFRaW1mK3cwOGs4VWJLK3B6ekRlNjNwczlKem9z?=
 =?utf-8?B?bGFGWmpJUFRXTjQ2aUNMV0VwZTdmOHprMVdkRVpHMHZWM1JSKzl2Vmt5bWpO?=
 =?utf-8?B?ZEN6VFF5ZFRmMGpSeEhhc1JMdkt2VmZ1dWc4VXdLNEJEbHJZOHNCR2RtTS9o?=
 =?utf-8?B?ZmMxL05oZzMvajA2RHcxdHE5Z1ZuY1ZRK0xLVU9DVDd1RGZUWGpCZ0NjUUxv?=
 =?utf-8?B?VnJEUVo3cHhwSW1HK096ajF4LzZCWFVvWGF3bGdQRkQycFZNTjVDaUUzQTF2?=
 =?utf-8?B?THJ3WjlDb3JVNkRjVE1YakVYSm5wMzdPcEVYRDlaODNYMHZJc0xPaWt2VFhI?=
 =?utf-8?B?ekFYUFFGaEs4aWw3cGk1eEZMYzhjM0pYcWxGaFhHSWtMaW5tdkFvaWtOYkxF?=
 =?utf-8?B?dTBGTkcwb0daMGpSTVExNzhIaCtjY1lDQnVJVWF2RVV0dGtSUldSeDJJVTN6?=
 =?utf-8?B?Y3JGS1BDOUhCVitDdGxVQlZ1ZTdRNXhSa2JpM214OFR2V1gzc3g3aVROZzhO?=
 =?utf-8?B?N1lvbFNzOThFNWVkRTJSV25MVWFmQm85UlMwSGxuQ0tBemt4N2h2Rnp5eTln?=
 =?utf-8?B?cDRyaVNZUUdBOFB0L0JQbUpHV2ZsY0tUOU9pMFk0bXowUW9BTXBrZEJaUk54?=
 =?utf-8?B?VmpGVVh0S3E2N2svWkVIUVd6REF3M1lGSm4zNXFjVVlDM0Q1L2JBUmlKUDRt?=
 =?utf-8?B?OHRHaTdZNEM2eFRLMTdhYWdFLyt1T01SM1VKTmU3aUVFVmt4Y1FYNGVSWFNU?=
 =?utf-8?Q?ENy8VxvAz11eVbfuJjKOZAvCoPI5SCTR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2tnclZ6WEc2OFhlY1VsZTlsU0pTd0pnWEVWVUp6NFptU3lFTElaZ0l1WlFy?=
 =?utf-8?B?Zkh0a29KT3hWazJYR1hZL0RET0RhMzFLNGdlb0VkNmRlZ0ROdWtibEU1TUpF?=
 =?utf-8?B?YytFRkRXUUZqdjRUQzVVWWNHSGZCOFUzU3lGaTdXT1ZyeGhFUWNWZTA2ck1X?=
 =?utf-8?B?elkzcXpwcXhOUHZGTWdQWXY4RWpnNy9vcVN6SkplRHBERmpIQm5Ta1VZWVFW?=
 =?utf-8?B?WCtOaFZYSkx4d1VBWEdKWk92WGNlSTR3NHlDRWRwVDJCNlA1MkhoN1p4WXR0?=
 =?utf-8?B?ODVFcy9wNjNUOU5KNnpIc0tLZ1ZqcjdVb0dkdGNTK2EreEFKeHYxNHI1emVK?=
 =?utf-8?B?SUZ4WCswKzdWbzl3eE93UndTYXdEaktNcmg4UlVTVUtJSnI3N3k0NHM1bHpp?=
 =?utf-8?B?VVR2RUpNZmZFZFJGTVByY0Q0di9rUGpDN0VqeTlXV0trR3FTeDVDL3VZa0Yw?=
 =?utf-8?B?VWthTlBnd1JDb01vWG9zemxMRUZCWWpYMFBmQ2lCeFFoSUJvTEFXaDRHT3hk?=
 =?utf-8?B?bmFwSnhXaWZtZXRCcS80T0RrUXMveldqS1VpLzkvTWoxWFZhM3hWM21QZTNW?=
 =?utf-8?B?RDFQejA1bVBKOElYZGx5SXhpb0RQNGFLWkROTCtDSnkxa3pOVGNFYW5ueThY?=
 =?utf-8?B?RGdTc29Eby90WWFHclZVY1FRdDZaYjVWazZWcHRLYzE5Wm5OdmpQbjA4N3lQ?=
 =?utf-8?B?cS9wbEhOZGw5SlB2ajE1bWZQaWx1YlRVNlZwWGd0UjhaSko3aEhpRHBaVDNv?=
 =?utf-8?B?TkdUTWVUVHMvdXRBaFZDMEo1MU5sWHo1QnJCd1hZNkhVdGZZVXVsSFcvNTZP?=
 =?utf-8?B?RXR6czR4eE14d0dLVmhOenlNWTBqSmhkRDhKblQ3SXRHT2hBZDhUOGlPTWVy?=
 =?utf-8?B?MjRDVy9BMWUzNjFPd1FMNmpQVkt1b1VFblRFSDhRWjBncjhiL3FEcndpV3A5?=
 =?utf-8?B?aCt3Vk1pMTVIY0R6cnNBYjVtWG5jcU5LWHMzZG9DaU5xUTVBVDllMjUzU3Ey?=
 =?utf-8?B?UG9JUElrYUlqRGptb2xvU094OXMxVUNKeS9XczB1TFZwMkRscWZxUy84MEJO?=
 =?utf-8?B?NTd4OGVrT0NsSUViLzlpME1OQUc2V1Nhbkx6OGVwUTVKcGgraDd6QjlTak05?=
 =?utf-8?B?MGhSNkRRUUFOSzgvOXQ1RWhjMFBFMkU5KythbUtlTzJrbFJuc3VEUUhzaXhp?=
 =?utf-8?B?eGMzRXlvRXdES0RyRE5uTForeW5XZmE3WGtuTitWdFR3dmxtVEZ2TE1SQkov?=
 =?utf-8?B?SDNYZXRmVk5PdGx3L2FQMUxzbGFLM21MWU82YmRyTkM2YUF1RjlUc1VOSG5T?=
 =?utf-8?B?R2F6c1gxZVhMOUZEeFVMTUk2UVNSWkVTUmVsTUtLenR4Q05zNGVHc09FM0ZY?=
 =?utf-8?B?bHRNN2dVWEZjNHo3akJQNnBRbDNSZFBQbUExb2Y1aGc0d2xUUmFOWEk5UU5v?=
 =?utf-8?B?cFZERldOOGlzOGoxdzZLdzdUY0FvQWwrMmVvY1lvRFFlU3RpRmpJWGhXNkhY?=
 =?utf-8?B?OUlldUtRNGE0SmRob1Z4VElvc2wyUmUxMWhRU3lPZXRXaW1Zc3QxM0xSL1Nk?=
 =?utf-8?B?bU9qc0FkMDdNVEx4VVhEQkxvVE0zZXdkYzhIY0tNelJRWHpOSWtKSEVGOG5p?=
 =?utf-8?B?ejQ3OXlsekdtWFVERGtXa05SbjA4aUdqNU5mQ0NwM1Y4SnlicUZwOVI1Q2FP?=
 =?utf-8?B?dm51WVlxd2VnYXJBRDlhVFNQUUFPRHpWR0hvSCtpKzhWWk91MnRpYXA5N3Z1?=
 =?utf-8?B?WmZhVlRkclhhVDdVclNLMHBnbmtHOERRcHlmV0M1K1VYRzBqanN4dVpyVFpt?=
 =?utf-8?B?YUYxeFRvWERhSTgzYVlmRThJajZTYktGMVI1Q2ZjWjh6WDBzc3lTV0JiMFls?=
 =?utf-8?B?cUhFWVdQUzgySHdiOGVoL29tTDdZakpYSlQzd25wTEpNWjBvTWk4RjMrbDhy?=
 =?utf-8?B?TWs4ckVPSHVJWk5YaWxRUGxVMEdnOW1PZnZVRzM3akw3MjJhN1BDNGJheU9G?=
 =?utf-8?B?WTZGUTdkNkhpcGxIOFN0OWlUc2ZOWnFtNVg2eTNkWlBmcW00blk3SVNWNXY5?=
 =?utf-8?B?RnZFYkFuQm9wa3UvTmd3UmcvZWwxd3Z1dGZ3L0pKMzBsSndRbXA1OXJ0Q0hD?=
 =?utf-8?Q?dFi7/swgG9mqix/oxCKPmz+lR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c3f86fb-b6ee-4bd4-c1d5-08dd286e3e76
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 01:06:51.6994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1oRMqve9XtLryCpkfwneGSLSdRssHiFM4/S4TXsuBjxpseIwGrKBnVyHfpAaoP/zr6fyu3/rw57I87E5NKcfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9086

On Fri, Dec 27, 2024 at 06:06:24PM +0100, Linus Walleij wrote:
>On Wed, Dec 25, 2024 at 9:21 AM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
>> Current scmi drivers not work well with devlink. This patchset is a
>> retry to address the issue in [1] which was a few months ago.
>>
>> Current scmi devices are not created from device tree, they are created
>> from a scmi_device_id entry of each driver with the protocol matches
>> with the fwnode reg value, this means there could be multiple devices created
>> for one fwnode, but the fwnode only has one device pointer.
>>
>> This patchset is to do more checking before setting the device fwnode.
>>
>> This may looks like hack, but seems no better way to make scmi works
>> well with devlink.
>>
>> [1]: https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=CfZWQ-hNUzz_7LZ0voG8A@mail.gmail.com/
>
>Please drive any devlink-related patches by Saravana Kannan, he's pretty
>much the only person I trust to know how to do devlinks right.

Quote Saravana's conclution[1] here:
"The best fw_devlink could do is just not enforce any dependencies if
there is more than one device instantiated for a given supplier DT
node."

So I think for systems using scmi could not rely on devlink to build
supplier/consumer to make driver probe in order.

[1]https://lore.kernel.org/arm-scmi/CAGETcx8m48cy-EzP6_uoGN7KWsQw=CfZWQ-hNUzz_7LZ0voG8A@mail.gmail.com/

Thanks,
Peng
>
>Yours,
>Linus Walleij

