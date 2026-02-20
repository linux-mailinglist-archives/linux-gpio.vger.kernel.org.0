Return-Path: <linux-gpio+bounces-31943-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF2CEDEmmGlQBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31943-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:15:29 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D933C1660ED
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 095633006466
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A1FE31B810;
	Fri, 20 Feb 2026 09:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R8G35ffE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011042.outbound.protection.outlook.com [40.107.130.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B1267B89;
	Fri, 20 Feb 2026 09:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771578924; cv=fail; b=q2F0JtRRc9MIRBgDF+gzxFiBuscPjAuB8vz12TqecNH8H4tq0f5A4dbz9VCCSRttTb6JFKPD6OeVrA9gA9t82wPwd/bsoTxY+UtbUgFy5lekq0xC3BaU/HtcLf5GaIeEgYuSGBaIqTM/Y0fve+1p6/Sx35QFd5i+E2aXKUfaqq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771578924; c=relaxed/simple;
	bh=/1jSOlTKooCS7b3tD93IrTir9I/Sp1eHmjJssTWq+7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=btBmf1vROU4DGklEVs+YTknrqjnk75OtdVTbCdUzNhua0fs+aXcMuowTjGWfWEmU9NY3xeG9+fy5Rptd1t0jw23MSqpICk3gueQGzvrrzSq7kzIgCKxf3uC9rKBkSuwLKAk+quTCYC1sCq1vPE7buLnxulcjnC5ZfQiAFY0vWYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R8G35ffE; arc=fail smtp.client-ip=40.107.130.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfNCjUZrPx7zcBr2nB1AcHb+9vf70JNZ7m/tCSwTyrdvDl9m/KJng+Jkj9krHaP4zfXo8EjEenC92vKsQWsRspRhu+onMzBhCyj5zXTz2AiDm0AB731H2NkJbj/FGD6g/H3d5QJU9zia1gTyzxDZm+CfgCZJRzbBbzeKK8dMBaa1hcqgjCt5GpDmFMSVVn0HsCqnxPRJNPXAGH8Bu9583kX4yIbUrdiHtQvuNxQPMbDWO6BsXJBtASP14z5Tj1iv4G5Ui/ldqR6eXeCEoCEB2nz4axvHSB4fR0oO3lLCD5qq/RKKkmtpEyJrVmv5mhuBlVpGLluoCo8gWw+hf12r0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTWv7ZwehlBvuLBVlpei/IuODFeqQddwR2LZeJHySBc=;
 b=ZrCiZGAW3GY3HLKQnUAI6arOrDZnLwy4bNhMOvn1M3k1xCZGkZosHe1DAlMc0p11gdDRaLrBEAIGYBjWIlkxYCk94S0eIjUM3QnDuxP4zpjwEB3B5nXgdn2IrstnLCVhX4ZVNd2ILaYIYU5fm4q3PpxOB3e4XEdptiq7ldLYJPtoMTP/JYY6+utDx2uWKtRLCnP5j5dTbWDfSTH7VGKfjDca0fyfdZOOVQmiLzuq+7CSoUgQtEPodO7btMi1eWHnU5gaXAz1Zw0b2jo0qb+LYaxqjPwnty4ht+xb9rk06buM10rW+KDxQPF7zcZUBQ9yLnb1WXnLljeh78UhDOrM3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xTWv7ZwehlBvuLBVlpei/IuODFeqQddwR2LZeJHySBc=;
 b=R8G35ffEHqDGzdDMURRAUHa76NrJ90GhInAP+imT2Q8bLgrlGPm1ZMF6/PChX+FUp0gzwhcLoOUIRcXXHqG9OL3QC6I2VkIb9V0/Kt9o4EVgOJtR/e7bZZ5mVDRtoQMBopd79o4Ux+E7FLDtvtJ92P8BZ7MdvN8kKz9QQHKKwhG07MdgjQwniRHdP1XjR4lN4vb6XPlmPbjAPmLRjxdCKPVvMTcR5BtEs5eSqzmjPmrvAipjqMVecjp6wbz8YrypOj5tGAFrveHQxRqqk4vFor456piRS3AiDkcXefjkwYiTNRhyrV5EzutSy8Lsb8+KEC5k9gvMzRz+EZO+aWY/Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by GV2PR04MB11834.eurprd04.prod.outlook.com (2603:10a6:150:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Fri, 20 Feb
 2026 09:15:17 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 09:15:17 +0000
Message-ID: <69de4747-fd38-4d04-8831-c538cd758566@oss.nxp.com>
Date: Fri, 20 Feb 2026 11:18:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] Enable Remote GPIO over RPMSG on i.MX Platform
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, arnaud.pouliquen@foss.st.com
References: <20260212213656.662437-1-shenwei.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260212213656.662437-1-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::17) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|GV2PR04MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: 5492e625-b288-4f07-f78f-08de70609044
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk5zaWt3cGMvTmFCUGo4eWVvY2tNNzBoaEk2Qnc1Qit1K3ltZ3R6TEFQb01G?=
 =?utf-8?B?T0hWLzhYUk96NjFmVDk5UHpOenpJT1kybEFwR2Z1NjNVM2dKZVY1ZDN2dDM3?=
 =?utf-8?B?Q29IVzJZOE13V2RpcTZ3bTl3aEJjcGJxcUErWFVEcmZZR3ExYW8veExQZllO?=
 =?utf-8?B?L0lsUHFxNEJVajY1UjRTNUNEMXFLYzhhbjZrSlp4UUpsUFJaMVJJK2YwTUxB?=
 =?utf-8?B?elNzb1FQQjJTMWt1MVN3SG9UUllkZmFFZ0JrOElOTkZ1UUxWK2svZm1ORXB6?=
 =?utf-8?B?b1hMdXBDUmlObURTcEtiNmxhbzZsc1RLTHpLRUNxUC83OWpSVDhNdjcxL2dR?=
 =?utf-8?B?bUhqRFhhb0NhaThlM1U1ak9zbEJjSG5lbDBkdjJ1M3d3aTdPaW5sd0ZkRGpF?=
 =?utf-8?B?eUlQNEV3MHZzby9hbHVCWWxBRlEyU3JhY3BoNHJMMDBXSU5OWEgxeFlQdFhY?=
 =?utf-8?B?VmNtS0YwU3dUdWswM0tWYnYzejU1b3l6YTQ5QThvWWpVbUs1T1lzNUpUMGZ2?=
 =?utf-8?B?bGl1WHNYcit3dXNnc2JjbUQrSFlsYW1OeWdCU0hweWJxLzcyand3clVGKytS?=
 =?utf-8?B?TXZXSzdGRWpXSk9Xckp3cHZ1bUZOeURPUlNxTUp2NzRyWWZTWFA3T0EzV29R?=
 =?utf-8?B?WkJaM05CL1luL3hUVkNZOWlyRGRVT3k3cGc5OURoTzFMSTBnWGVkMEpDcU45?=
 =?utf-8?B?ZThVSzlIMG16Nnk5cjJPWDFPVEpMaENhV1JQamZtU014TnlIaFBVVTlkU2xx?=
 =?utf-8?B?RC85T0hzcjR3dmhYSWFDcktQVmNxeThieUlLL1h6Vk5tU2ZSanpYS2xsYUcx?=
 =?utf-8?B?WTZ0SzIyb1g4Y0NqMWJPRU1LOUpXMndJVkxEL2hTdGJ3TWRoVkR0aWE0aW9z?=
 =?utf-8?B?VGpISW1GeWJzR3M1OU5hSlROamdYclB6VG82UDdIVSt0MEwxdEhpbE5qZUZE?=
 =?utf-8?B?UVJLOUJYaWNLUkQ4ZG5aMDJFY0ZBR2t5T2poNXFFdUVSQ0hSL3luK2M0Smc1?=
 =?utf-8?B?WGZIQnA0eEdLQUt1MEJDSkhrWlFPakhDUHgyQ1VQTGNoVSszSEw3S1JqK3RB?=
 =?utf-8?B?NWRPMVA4RU1mTDVCWjU0SjFZb0FHV1ZlRjhRaVRQbkdYNWhlNHFIZGREeGRL?=
 =?utf-8?B?dXQwMWRXckNBbVdYVHZrUGtaZXVadXRWNU91WW9BUDdpSFE3RU5DTUxvT25K?=
 =?utf-8?B?cHp1U3IzdlBkMmRTQkNwYUNPdFJhQUp3UmxrWGppOHErUStCRVNZMkNjNURM?=
 =?utf-8?B?QVhvdFd2Y1phdm54N2g1TUpleHBhUGp3ZHkwRjV2S3U4MmxLaG1SamRnaEZX?=
 =?utf-8?B?Sm9NeHdHTkxWQUNaTi9yOCtIUUtTWEVkcnBxcVlqaVcxNXppSTNxWDhSYnUv?=
 =?utf-8?B?ekg3V25FOExQbTJIM0kzVmxBbVFaZ0x1MGRGeWdjclJud2RkYUg2R20rTHh6?=
 =?utf-8?B?bkhCUnVTaXV6ZG9WUTZ6QlQzUE56cUI1SU9rRzR4K1NvM1BzWnhsaHREbDJY?=
 =?utf-8?B?Q3pjaDU2cHlTT3R0VHlsME40MzVOWjFSQUN3eDRUU0hadkJUcjJLV0VyT1VQ?=
 =?utf-8?B?M0VoR2RmT0g5NnVXOTRNZkFoRnhwQkx4Y1FBV3ZTbHdML1hkUGUzK3RIZlFs?=
 =?utf-8?B?SUVaOFlNTlZRcVo1RzVMdXN4bWdNMmp5aE9kbk1NWVZJM0NaUFpodGhpaTl2?=
 =?utf-8?B?THlUb25sKytCeERBaTdOZHJhSUt1K3E4SHk5TUp1ZWF5MDYzSzlRWHljV0Qz?=
 =?utf-8?B?aTlNUDZ6ZnJqMXExZFNHOGNHWnpSM2J0UDBsWUhtRnRYRzEyYTdqMGJrSkda?=
 =?utf-8?B?TkdGVU83VEp5VFJ1RW5qV1dFK2U0TVFPUFROWmhmdDRuSmF0bG9JaXNEQ0FR?=
 =?utf-8?B?UkNFOWRUVXZ4T0pScW04WG9QSk9RTm1DbVRhZWtNWTlrT296WDEwZ0NpbmlH?=
 =?utf-8?B?cjR5R0NESjZJMk1mRmp1Nmp0SldPSVl4RGQ3c1dTNFYzYUlNNFZvOUoxaE40?=
 =?utf-8?B?ajY1R09PK0JUQS9IWHRqa2JGY0JvZkpnR3A3RVpaUXQyN094b2QreUgxOWhG?=
 =?utf-8?B?YitLUzNHU2J4d0VpNDR6RkZaNnNrSis3Wi8waVlndGVuSDZjdUk5ODZkR1hL?=
 =?utf-8?B?a2FUeVFYUjZCNFVGYkRPVzNEZUlVNEdwUUh1dGN1dTY3a3kxOVRzdkV0Sk12?=
 =?utf-8?B?WVE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVFpcXU0ZWZzNHNJaVp3Zkw2U2FqaFQ3WUxTcGpGQ3dZSWFjU3NMRldMckth?=
 =?utf-8?B?NmJJV0gxVDBZQ1V2d0hxMnpxak9TcGpmMndqbUpMWFhNdTJSWElsZkRRdkh3?=
 =?utf-8?B?bVNrN3FCZGhLa0thWEFWRUhwdjlPQ3NaYUtJOFZ2cEU0V2JCanB6Rmg0ZHd0?=
 =?utf-8?B?bitrdGZCMHZ4QUczd0FobXlPcG16QkIvMisxSWRpWlhzS3ovRUYvbGFQY2ox?=
 =?utf-8?B?dEltcGxVT0R4RkNCQklwajNJdUhpRWpYSDdRcHBIUzIxUVhxOHAzK0VuY2Yx?=
 =?utf-8?B?K3pSZ1NOeEpNR2pZZG5EeUU0dE0vTzBHSENxdCtOZ3BLOEZGMUIvT3BTTE9i?=
 =?utf-8?B?d0JMNG00d2xNaU1TTmZwQnQwSzViOFVzbEhWZVl5eEIwaUI5TElTaHVBdkxv?=
 =?utf-8?B?V3d5SXNzZk11M3NNRXBkTWp3aUdmZGhPTVlVTmJSRHhQbUw3WUpoT3h6eVFG?=
 =?utf-8?B?RXkwSkxoRnpiRUM0QVowZnF4ZkVyUVBtdVRkL3JLU3VmRndMV3NDRC9GM09M?=
 =?utf-8?B?MFF1Z2lCZUdUZDBhV2hVTE41QzR5QzZlbXFsQkd1T3crai9xRjNkWUhSM2xk?=
 =?utf-8?B?aTZNY2tjTVNJSGxMUEoxM05Ba2lhNTE4WTQ1RWthL0lQUHd4c2pQSDRrQ2o0?=
 =?utf-8?B?UndtWU8rZS9KUDB2LzZpM0Y4bmxDekhKVmtBNUY1ZU9NMFRKSFBseUxxV011?=
 =?utf-8?B?NFZyWWF2enhveVdBZi83MjdsUVhUYUMvbS9zRXMybHg5U3hObWJhYUw0N3di?=
 =?utf-8?B?YkJRRmtoRWdmRng1WUN2ak1pc3F3QXF2aWFTTmxxZldiNXBUeFZGUDZRR0JD?=
 =?utf-8?B?UXhSd1dONkFvN2QrbWVNdEsrMytmaURVOTdlbDYzOWZlUHordUtzODQ5aEFV?=
 =?utf-8?B?bkI2bVdFTXJWQUlKMkN2OTBoMFM4MS80NDFIYndGZms3VHBja0I3VzBvRGdN?=
 =?utf-8?B?aXdybWoyTkJOTXdraXM2VE55djRJejQvMVNxUE9CLzU4WlZRU2pmOVZCZUdZ?=
 =?utf-8?B?VXBaVU5FZDQzdSs2WGhSeHFaZ3J5SVZ0MEg0WGFyZHhrZW1lYWpjcmVxa05L?=
 =?utf-8?B?cUdaRXArbmMxdTFQWHV3UTNVM3cwa0c1WmpxOFhyZllna3lzNmZXR3c1VmxS?=
 =?utf-8?B?Wks3WllwNi9qdHA0NlhYVzg1UXhBcXNyTjFpT2Q4Z2tZb2l3MkRZbjI0OHB6?=
 =?utf-8?B?WGlSTVB2NFN3RS81M2xnbk01U2N6MW52bU1MMmJuaExNRmxra2RaRFdndTl1?=
 =?utf-8?B?S0ttVVpHZHRhT0VuWWIxT3NDdnNpcXUyQjRQOUdkOWhkbTN6bUEvK3oyU2hS?=
 =?utf-8?B?bzc2Vitnb25xVkxSZjlmcmRBd0hNTDZTYnkyMkNXQ3gzZXJCSkJOUTR1bG92?=
 =?utf-8?B?L3dCM2NwOUlBdStoNDhmZHJqdFJnU1YrdFlWczBkdGJ2Nlpjb1ltazJUdHZX?=
 =?utf-8?B?OTVxL2xvSGw1M0ZPU2VoZnF0TXU4d01pcnoreUIzRXBDT1FCbzdtVm5naVVj?=
 =?utf-8?B?aDdtUjg3bW96K1g1S0JYNEZJeE5ZdHZiTnRXVXFMejhTT2grdVBrRE1OSjdQ?=
 =?utf-8?B?OVpkQURMbUNmRXlOYkVkeXltYm1WUUIvUzVoRVROYTNLUXBuY2JtaGJGNXl5?=
 =?utf-8?B?d0N4T2p2UnF6VmsxM1pJTHl4TE9NUVJOdG1sMGN4R1VMdEJ3WSt5RVVDY0pO?=
 =?utf-8?B?MlBjbUJYamU2QUkvNHZpUnJ0RTlxdkxFdU9IV256cHN6a2lVUzR1MnErR2VI?=
 =?utf-8?B?Q3Y2cjVlejNCZFdxYjhZRGZOVDhlREFJb2padm9YOVhkakxaL0liWHN6TmFC?=
 =?utf-8?B?cHpGMHhHWHROVWxiVVdvZzhtYXJrTVkxTWhqQVFFSTZOTnNzaTVjWkw2VW9P?=
 =?utf-8?B?dGNlVXplRzc3aWkwWVBLOVlHSzdNMncxUHhjcXhiSC9BMUJyOUJxNDMzWnlT?=
 =?utf-8?B?dk1RRmhSeGhNV3ZyalZGY0U1UEJLMTFaQjFBS0ZsUjNSMnE4K3N0Nml1enEy?=
 =?utf-8?B?MVZuaVhYM25MZkgybGQyMDJVSTVMejRzTmRQNEx4aER3aExUaWNiWUZBS1lR?=
 =?utf-8?B?WHlPUlV6aWFFOEkza3BLMXpHUlpid1d5cnZPTEt3dXF3NlBrRHJvejl0RFhZ?=
 =?utf-8?B?SkRwTko4MG5ZUThPek40Y0ZBSEV2U29FUlJSTHh0UHhXVEhSVDEzM0tuUzNC?=
 =?utf-8?B?OHJkMTNGZ3VOZkZ4aE9KMzdmNVdTbFBBZ2l6dkxZSVV1WlozeDlZYUFTVm1H?=
 =?utf-8?B?VDAzOHZLNUNLd1h4UDlkbDJuOGpBN3Fsb3l5dlp2LzhwZzFJL3E1YWRJMjJy?=
 =?utf-8?B?ajBWM1JLZStlN2JKN2lnaFdtZkw5OWx2RzBlNFN4aTMyWmEwOVNXUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5492e625-b288-4f07-f78f-08de70609044
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 09:15:17.5334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mxhjpDFsYCcGewC3I+vlTbhnfax11GghIrCJUFCLaM7+qyw2gZPJ2fQIkEmJO1fEp/L4CDY1ABjQ+yXRW6WuGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11834
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31943-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org,foss.st.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: D933C1660ED
X-Rspamd-Action: no action

On 2/12/26 23:36, Shenwei Wang wrote:
> mments.
>  - update the yaml doc per Rob's feedback
>
> Shenwei Wang (4):
>   docs: driver-api: gpio: rpmsg gpio driver over rpmsg bus
>   dt-bindings: remoteproc: imx_rproc: Add "rpmsg" subnode support
>   gpio: rpmsg: add generic rpmsg GPIO driver
>   arm64: dts: imx8ulp: Add rpmsg node under imx_rproc
>

Shenwei, do you have a full example on how to test this? Including remote firmware part.

