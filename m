Return-Path: <linux-gpio+bounces-38810-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kwW+EtAkOWqtnQcAu9opvQ
	(envelope-from <linux-gpio+bounces-38810-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 14:04:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 987556AF45D
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 14:04:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=iopsys.eu header.s=selector1 header.b="aPOgO/Ie";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38810-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38810-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=iopsys.eu;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 354FB3020ED0
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2026 12:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D46C37883C;
	Mon, 22 Jun 2026 12:04:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023095.outbound.protection.outlook.com [40.107.159.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909D2281525;
	Mon, 22 Jun 2026 12:04:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782129853; cv=fail; b=Uauo4EhwOi49q0RqkP4AtN03Zh91kneU7JP5MJHjqAF8gNwY0vGUIZctOYtng3Rtr6YT7/7C4H/Dc+LSp453b/xgoESYQSldv4Mn5bErUIIvaZH+2sYcfjCCRvf1ZmGgCgc90SD7ZtIYLlKedQGn8992NOUOkmwr8sHVATYVAGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782129853; c=relaxed/simple;
	bh=lIB9KgIOXlKnPnnYSRelE3cU/SQH2K5JkDfLlaWwz6o=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=grW3+jSudQ4v45z3idOLmkRAsd0boh8GqZybPNJtnNQxfuVdqJLtgktzaYZ054uOOO20FS9/uN34eZiytvXYVjoBKN6KJs2vhNXIGQvMe1k6z62ja72t+lX0eWSkO4zopdAH97Vy3feil8aJCIpBZgxPNlKXEL32By2E+WkCKws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=iopsys.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=iopsys.eu header.i=@iopsys.eu header.b=aPOgO/Ie; arc=fail smtp.client-ip=40.107.159.95
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kV4/CadM51IqfdUlcnI50eWluGXme44BQNeiMvMV4b6vvYC8XWD18zXcUBPe72uej0g5/+hnP1InHYTMfNTthedkFLCJpDGDT8cl4DKJ9+/zj7FaVmsNv4YhKEFgaD7kEOs3Szpfbpn++gfcdzUU9YEmSsYLgFT4nGv59dow7PwI559aS/Cr55caTNjpmzq1PnDMZEyeNdYx1kKDRICJJi8Pp8EQ0y4NWxhH1W/hWuWcYVXxbnUU8xbbA2TZsttE5MFzhkeQYd6GndT2Hs4iiSFYlrYz9Ex/Jo/vO3GMoMGhVIm7vZF/Ozm8LaV5jbCnWc2qE5G0HdQSUa0rrpQSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suWYQzpLDVSk104oxwpnL2DV28JV9L/eUzSJhdA9RXY=;
 b=huQTHejo9ZssQGVJqnCbyQ8YorYvA37w6speBerezkzZYgkRlc8wutWT6DmEEvo//PpBCE/xBf1dS0mjRSN39UB3puyveVLpAH6Jtx1HdcpBuntkYzeOPW8KLEhlOfoTOqN01Ykwqr4/nU3JpqNzQvn0ID4jAZrBdaL3e6EVHts8wIrLTjnkyFqS4eiXWdXFkayWd8iYU4Krfp/EDDMAcsAr1NDNAEkuT/pXvjKEeo6fF0e8UCwIPXc/vZd9yosG0/MNQ9bKhELD90wytqAUobAa6qHehql5+BMXMQgTamIiP3T43FoBAUug/iNA6QYVv99oIuM9xG/zVbfA/XG93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suWYQzpLDVSk104oxwpnL2DV28JV9L/eUzSJhdA9RXY=;
 b=aPOgO/IeFwSO/TzSkQ4VClLWvNr0VD2QeuMLWM+HASWh7FcUYXZKteq8B1ygKH1vP32CU4oovX5Kta7/NhKDldxzvtFdm0/gNA8Zk0M+brd8mg8sWBeJRxsgPGyTM+wmqxSkheWVIah4bqWnkC5VCx4WpB6wLPi51NmYaS6kusQka12arK6XnCKQLuN7ehatspu/5Jz4wyfu6n1YevP4Bs/dNZ0V15JQNMXBjqbJxKyHsIcTbszZD1KGCPWGZxN46OVBNAsTxVw+dDSkRqAh9LkmxttwcjXYq4KImLRy1iszdaBM4Wp3Ub1qeR+cAYr86NK5C+yhbeD33n4ktOBjvA==
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by VI0PR08MB12009.eurprd08.prod.outlook.com (2603:10a6:800:346::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 12:04:05 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%5]) with mapi id 15.21.0113.013; Mon, 22 Jun 2026
 12:04:05 +0000
Message-ID: <ce67c3d2-abdc-4d33-aac2-08267234d1c6@iopsys.eu>
Date: Mon, 22 Jun 2026 15:04:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/16] pinctrl: airoha: add support of an7563 SoC
To: Matheus Sampaio Queiroga <srherobrine20@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>
References: <20260622113046.3619139-1-mikhail.kshevetskiy@iopsys.eu>
 <20260622113046.3619139-17-mikhail.kshevetskiy@iopsys.eu>
 <kNxYkw2WQ92M6zgbpnkZ0w@gmail.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <kNxYkw2WQ92M6zgbpnkZ0w@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MM0P280CA0079.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:8::12) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|VI0PR08MB12009:EE_
X-MS-Office365-Filtering-Correlation-Id: 11d1812f-dd16-4fdc-7880-08ded0565b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|11063799006|4143699003|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	rKJfR6zR5QuMGpFJy035asLqln0QIjzRuyZLLoUEAEFd2R8LDcZgTw1F/Wk56qtEv813R0/E2M3aoyncFsq/BCQsq7difl0x4n13drhjGGzL8f2sFRLV/r4DX+D5aurSX4VknR9n4EoYvO3x+AcbnEPmwThzUSro6VWvwNpmNZWFZC3EOkSrtTkP+43UYxgzS+mJ8FwLnRhp90s1VhI9kyz3C23HjIvaCCaRvsBTt+tP6Dy6TBqTdMn0bLwdwxKsav4G3S4OMoBpjlMBF69dsjAngCs01hJNV0OsWza4dMqxHmQTMZo86aePIMkxQENoszECeKxtUuPG+YaKO2UhxJM9zNAtW+yYHo3oxb/0Nm/LeetIw7QbDmcRMCaMxB7nwobKdQlUv3BfQ37tO80eksSixRvj6TcbJTvx5+tdK58lGYEtjRVoBnls7zTbBZhS8LioxJFHmF3BjxRyl7wUt8sw9NvKpCLxJJlem0zXLMQ5WJP5LvhmcAK8Vvk1ucrDLJv8QzZ6x99Z+Ype8Xshlqeb1C/MJxAERMK+qM2JKoQ7GAiVeOhJnaPWuNKlLkZyEkKXCtwgq0Ur+Wg7O1MltxaEetaFx/ikAFmy8jzn+pPxVH86KJvG95W2QIcJksVsnQHx8dwQRkNkmZ0DWMfVmzWCWjV1iaAq4ofbtaqNLM7QU+WKYPHsVoIcYMbzFLxUNLvhqQbExwpJLEjU9z4PtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NndCbGo2TDg2TTFkbVBHWkZic3ZqNWdZS0xqc0NBVmQ4T1ppTUFHQ0tRVytW?=
 =?utf-8?B?a3dOWWpiTzFXTEtEMGcxM3dwczRwN0d4dUJ6VFpCbVRETzB0ZEdOVGczQ1Bj?=
 =?utf-8?B?dE1yNXdhMjhYd3d5cjdFY3AvNitLU2JSL01vYjk2QytVMjFDVUJmRC9OTy9o?=
 =?utf-8?B?NjVjRE9XT3pMc1hGWTFhK3U0a1ZoR1Rzcy9VV3VKcUVWc0RteGFjbURRMXk3?=
 =?utf-8?B?bitPTnFybWxSRUhsd1hzWVdWU3RQWnNvM2thaHkzOTlkekNySFJobkkzd1F6?=
 =?utf-8?B?Vk5xak1kMFVuVGdCN1NwQmo2OUNTeCsydWFBdHZnN29tUlp5MmplNE82VWcw?=
 =?utf-8?B?anJSR09wSmFtZWQ3aWtNbGhJK0Z4V2dwZ0lXY0xFamluNDN3WXNFS0lyTWxu?=
 =?utf-8?B?bTV2TkVVNnlMY1p5Q2JGSy91ODVDNzNDa1gxN3Z6dE5aT1pFTkJWUUZjbUxZ?=
 =?utf-8?B?em9tQnZ1NndiMDBLN2dtVU5jTVE2dGYyRzVmVndyK2Q0VDRQVVNlYnVmMGhh?=
 =?utf-8?B?Z05iRlZRR0pyaFk0VWtYMDM4aXk3bWp4cktsYUZhZHlpaWUxMG9nOHZxMHg5?=
 =?utf-8?B?MG14YWdsd0VRdmpwb21EVWE0YisraFZENU9vV2Z1enVPQ1RJOTc4R1J1UWEv?=
 =?utf-8?B?dllpWWxWak1lS0Zoci9DYmZZRWkreVRxOG1lRDQ2cnlHNmhyc0NSVTA4bU81?=
 =?utf-8?B?eDJ2WHl1VVl6Vis4ZEdsMjBtRDMrUzJRQkloUW54b21rZDBkRnptR21oWXYv?=
 =?utf-8?B?VGpYVUhFT29OMWFxT2JJSzJmSi9ZTUIyUnZ2Z3ZBK3RSam5zL0k4ODllNTRi?=
 =?utf-8?B?aVVCS0dtR1V5OUczckdGN05ucTl3YktRaXMxR0xjeVowRm5vQzV1NVZURjll?=
 =?utf-8?B?VkU1UnhkdjZqQ2hKdU9rT3NVRS9XZHlTNko3aWJKMTVjcDhES2ErY21ZNC9R?=
 =?utf-8?B?NlFPMG94R25rQWoyZDc4M29GSE84Rm0vR1liUHh5Y3N4azNJRGxLdmcxL3VE?=
 =?utf-8?B?eHJyZWlBVGpoblVCdXFOUXg2Zkd3ZTVMbW1nWm9UUTRTOEtXS2RBZjZPRTlv?=
 =?utf-8?B?NC9BMTBYWk5HZUZzZStLZGhIdlMwc1NJVDJVeHlhZmpadmJXRTVKcnZrOXlQ?=
 =?utf-8?B?TnM4dno2U1laRWJYUlRsWFcrZW43cWpQYTlaaG9acGJzR2pySDErY3VnR0tZ?=
 =?utf-8?B?Ni9XZVFhRXpOQUhjNTRiNTFJbUd0dUJSVDJLaGFyNGNnMHRpMi82WXJVNlVw?=
 =?utf-8?B?eVE4NFpmSDRhd1J1SnRjTWk5YlExRjlPQ3dLdTEzZGNFOEJQem5Vcno0YURZ?=
 =?utf-8?B?TGJkQzJBUVo3OXZoQW56OXpjUS8yL1F1RkR5Zzc2VW52NmEvb2hRaGlITHhR?=
 =?utf-8?B?cnlWaWpJTU41bEt2TU0vbG1jZXQwZTJOMC9kbi9xTUMzdGlwN1ljSTRneTRF?=
 =?utf-8?B?RFNRN1RiTyt2WEJIaWRIU3dwR1JpN2VMcFowZU9JZlRJVTJ1clp5V2U3V2Jv?=
 =?utf-8?B?YmhSN1lRaTZOQWxNRm9QMFNIWXlLMnlSeUV3ZXdtSWJPa3lScU9ORkRnZ2xu?=
 =?utf-8?B?RWdHTUIzNkM1NzFmeVNiSlBWdW1JYzdnZFpYSVY0YXo1MWNuUS9MelhrQWxP?=
 =?utf-8?B?VXlEQ3RuaGJhZHUxU3BpcDVuWjczMU1YYW5oc3J1SGxBT3IwNUhMcTZzamtk?=
 =?utf-8?B?eUxaL2NpRVFMWnY2a2FGNkZYZ2dzdjlPbERHdzZnOGNaTndWKzRybTF5Uncy?=
 =?utf-8?B?N3dJbi9JSXh4Mnh5Mzl0UGhxZkU3TW9hRW1DUFFmR0dNL0F3c0dnNnBaRXI1?=
 =?utf-8?B?Q1FvWXJUN1lLMmd2SnNCdHhCd3N3RzRweDFCVm9SS3RxRVJlWHZLTXhSVHBw?=
 =?utf-8?B?eXFOYU5RUy95TkJ1TEVpcDNLUTNaOWpiMnVIWjRjOVFGL0dlRHBveEh3NzdN?=
 =?utf-8?B?WDV3azduQ2JEZGxQNmVybkk2bHVSbzVhOFFiYlluL0lIejB1ZTBucGlNSEhw?=
 =?utf-8?B?UW9ISGtBZ3lLUzZDS3pQbU5Zb3R4STVJVDUxOGtBRC9LQXFFbituQ1NDVTRM?=
 =?utf-8?B?Z2NzVUpwMFVYVG5vZmdPSm9hbGJjS1RVck5rV3UwK1BTdzNaUE5DM09wV3ZJ?=
 =?utf-8?B?VjlTdmt6NTA2bk9ZVzdCSXpZalVxbURYTndrVkhiZXRuYU93K1N2TXh2eFN0?=
 =?utf-8?B?cFltYS9lazVjM3h6VVVWR05tNzNpMnVIQmNRNTI5K0N6dStueEFtUzFMMFd1?=
 =?utf-8?B?UnFNb3dUVVNEVlROVzZuNjhOV3JSbzFCaVY1Ti9US0VjditpZm1yd0tlVVNt?=
 =?utf-8?B?T1h4Z3hCQi9sOEZZRE9wWit2QVBRekVnZC81Zi80NHZZdFNiRXhpangyQ1No?=
 =?utf-8?Q?owT35rCnWGocmuMw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 11d1812f-dd16-4fdc-7880-08ded0565b45
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 12:04:05.3515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CscEtG8pzxw6cRgXZqcLWRkzKrOCspuOwP2YPRrKYDq2KN0dSu04ZNJdZwmzpCPyOEL6TJGio0ZvdYxSzJZSnWNG1naf+c+aRDgiXSfQe8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB12009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[iopsys.eu,reject];
	R_DKIM_ALLOW(-0.20)[iopsys.eu:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38810-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srherobrine20@gmail.com,m:linusw@kernel.org,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:angelogioacchino.delregno@collabora.com,m:benjamin.larsson@genexis.eu,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,genexis.eu,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[iopsys.eu:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikhail.kshevetskiy@iopsys.eu,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,iopsys.eu:dkim,iopsys.eu:mid,iopsys.eu:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 987556AF45D

it was moved from airoha-common.h starting from v2.

On 6/22/26 14:55, Matheus Sampaio Queiroga wrote:
> Em segunda-feira, 22 de junho de 2026, às 08:30:46 Horário Padrão de Brasília, 
> Mikhail Kshevetskiy escreveu:
>> +/*
>> + * shared - named RG_SW_TOD_1PPS_MODE on AN7563. Only the LAN LED mode
>> + * bits and GSW_TOD_1PPS exist on AN7563 (no 2nd I2C, I2S or PON 1PPS).
>> + */
>> +#define REG_GPIO_2ND_I2C_MODE                  0x0214
>> +#define GPIO_LAN3_LED1_MODE_MASK               BIT(10)
>> +#define GPIO_LAN3_LED0_MODE_MASK               BIT(9)
>> +#define GPIO_LAN2_LED1_MODE_MASK               BIT(8)
>> +#define GPIO_LAN2_LED0_MODE_MASK               BIT(7)
>> +#define GPIO_LAN1_LED1_MODE_MASK               BIT(6)
>> +#define GPIO_LAN1_LED0_MODE_MASK               BIT(5)
>> +#define GPIO_LAN0_LED1_MODE_MASK               BIT(4)
>> +#define GPIO_LAN0_LED0_MODE_MASK               BIT(3)
>> +#define GSW_TOD_1PPS_MODE_MASK                 BIT(1)
>> +
>> +/* shared */
>> +#define REG_GPIO_SPI_CS1_MODE                  0x0218
>> +#define GPIO_PCM_SPI_CS4_MODE_MASK             BIT(21)
>> +#define GPIO_PCM_SPI_CS3_MODE_MASK             BIT(20)
>> +#define GPIO_PCM_SPI_CS2_MODE_MASK             BIT(18)
>> +#define GPIO_PCM_SPI_CS1_MODE_MASK             BIT(17)
>> +#define GPIO_PCM_SPI_MODE_MASK                 BIT(16)
>> +#define GPIO_PCM2_MODE_MASK                    BIT(13)
>> +#define GPIO_PCM1_MODE_MASK                    BIT(12)
>> +#define GPIO_PCM_INT_MODE_MASK                 BIT(9)
>> +#define GPIO_PCM_RESET_MODE_MASK               BIT(8)
>> +#define GPIO_SPI_QUAD_MODE_MASK                        BIT(4)
>> +#define GPIO_SPI_CS4_MODE_MASK                 BIT(3)
>> +#define GPIO_SPI_CS3_MODE_MASK                 BIT(2)
>> +#define GPIO_SPI_CS2_MODE_MASK                 BIT(1)
>> +#define GPIO_SPI_CS1_MODE_MASK                 BIT(0)
>> +
>> +#define REG_GPIO_PON_MODE                      0x021c
>> +/*
>> + * AN7563 specific: route the standalone pads to their GPIO function.
>> + * 0: pad keeps its base function, 1: pad is GPIO<n>.
>> + */
>> +#define UART_RXD_GPIO_MODE_MASK                        BIT(22) /* GPIO37 */
>> +#define UART_TXD_GPIO_MODE_MASK                        BIT(21) /* GPIO36
>> */ +#define SPI_MISO_GPIO_MODE_MASK                        BIT(20) /*
>> GPIO35 */ +#define SPI_MOSI_GPIO_MODE_MASK                        BIT(19)
>> /* GPIO34 */ +#define SPI_CS_GPIO_MODE_MASK                  BIT(18) /*
>> GPIO33 */ +#define SPI_CLK_GPIO_MODE_MASK                 BIT(17) /* GPIO32
>> */ +#define I2C_SDA_GPIO_MODE_MASK                 BIT(16) /* GPIO31 */
>> +#define I2C_SCL_GPIO_MODE_MASK                 BIT(15) /* GPIO30 */ +/*
>> shared */
>> +#define GPIO_PARALLEL_NAND_MODE_MASK           BIT(14)
>> +#define GPIO_SGMII_MDIO_MODE_MASK              BIT(13)
>> +#define SIPO_RCLK_MODE_MASK                    BIT(11)
>> +/*
>> + * Note: on AN7563 GPIO_PCIE_RESET{0,1} select the GPIO function of the
>> + * PCIE_RESET pads (0: PCIe reset, 1: GPIO28/GPIO29).
>> + */
>> +#define GPIO_PCIE_RESET1_MASK                  BIT(10) /* GPIO29 */
>> +#define GPIO_PCIE_RESET0_MASK                  BIT(9)  /* GPIO28 */
>> +#define GPIO_HSUART_CTS_RTS_MODE_MASK          BIT(6)
>> +#define GPIO_HSUART_MODE_MASK                  BIT(5)
>> +#define GPIO_SIPO_MODE_MASK                    BIT(2)
>> +#define GPIO_PON_MODE_MASK                     BIT(0)
>> +
>> +/* shared */
>> +#define REG_NPU_UART_EN                                0x0224
>> +#define JTAG_UDI_EN_MASK                       BIT(4)
>> +#define JTAG_DFD_EN_MASK                       BIT(3)
>> +
>> +/* LED MAP - shared */
>> +#define REG_LAN_LED0_MAPPING                   0x027c
>> +#define REG_LAN_LED1_MAPPING                   0x0280
>> +
>> +#define LAN3_LED_MAPPING_MASK                  GENMASK(14, 12)
>> +#define LAN3_PHY_LED_MAP(_n)                  
>> FIELD_PREP_CONST(LAN3_LED_MAPPING_MASK, (_n)) +
>> +#define LAN2_LED_MAPPING_MASK                  GENMASK(10, 😎
>> +#define LAN2_PHY_LED_MAP(_n)                  
>> FIELD_PREP_CONST(LAN2_LED_MAPPING_MASK, (_n)) +
>> +#define LAN1_LED_MAPPING_MASK                  GENMASK(6, 4)
>> +#define LAN1_PHY_LED_MAP(_n)                  
>> FIELD_PREP_CONST(LAN1_LED_MAPPING_MASK, (_n)) +
>> +#define LAN0_LED_MAPPING_MASK                  GENMASK(2, 0)
>> +#define LAN0_PHY_LED_MAP(_n)                  
>> FIELD_PREP_CONST(LAN0_LED_MAPPING_MASK, (_n)) +
>> +/*
>> + * CONF - shared.
>> + * The AN7563 standalone IO conf registers use the same bit layout as
>> + * EN7581 (UART1_TXD/RXD are named UART_TXD/RXD on AN7563).
>> + */
>> +#define REG_I2C_SDA_E2                         0x001c
>> +#define SPI_MISO_E2_MASK                       BIT(14)
>> +#define SPI_MOSI_E2_MASK                       BIT(13)
>> +#define SPI_CLK_E2_MASK                                BIT(12)
>> +#define SPI_CS0_E2_MASK                                BIT(11)
>> +#define PCIE1_RESET_E2_MASK                    BIT(9)
>> +#define PCIE0_RESET_E2_MASK                    BIT(8)
>> +#define UART1_RXD_E2_MASK                      BIT(3)
>> +#define UART1_TXD_E2_MASK                      BIT(2)
>> +#define I2C_SCL_E2_MASK                                BIT(1)
>> +#define I2C_SDA_E2_MASK                                BIT(0)
>> +
>> +#define REG_I2C_SDA_E4                         0x0020
>> +#define SPI_MISO_E4_MASK                       BIT(14)
>> +#define SPI_MOSI_E4_MASK                       BIT(13)
>> +#define SPI_CLK_E4_MASK                                BIT(12)
>> +#define SPI_CS0_E4_MASK                                BIT(11)
>> +#define PCIE1_RESET_E4_MASK                    BIT(9)
>> +#define PCIE0_RESET_E4_MASK                    BIT(8)
>> +#define UART1_RXD_E4_MASK                      BIT(3)
>> +#define UART1_TXD_E4_MASK                      BIT(2)
>> +#define I2C_SCL_E4_MASK                                BIT(1)
>> +#define I2C_SDA_E4_MASK                                BIT(0)
>> +
>> +#define REG_GPIO_L_E2                          0x0024
>> +#define REG_GPIO_L_E4                          0x0028
>> +
>> +#define REG_I2C_SDA_PU                         0x0044
>> +#define SPI_MISO_PU_MASK                       BIT(14)
>> +#define SPI_MOSI_PU_MASK                       BIT(13)
>> +#define SPI_CLK_PU_MASK                                BIT(12)
>> +#define SPI_CS0_PU_MASK                                BIT(11)
>> +#define PCIE1_RESET_PU_MASK                    BIT(9)
>> +#define PCIE0_RESET_PU_MASK                    BIT(8)
>> +#define UART1_RXD_PU_MASK                      BIT(3)
>> +#define UART1_TXD_PU_MASK                      BIT(2)
>> +#define I2C_SCL_PU_MASK                                BIT(1)
>> +#define I2C_SDA_PU_MASK                                BIT(0)
>> +
>> +#define REG_I2C_SDA_PD                         0x0048
>> +#define SPI_MISO_PD_MASK                       BIT(14)
>> +#define SPI_MOSI_PD_MASK                       BIT(13)
>> +#define SPI_CLK_PD_MASK                                BIT(12)
>> +#define SPI_CS0_PD_MASK                                BIT(11)
>> +#define PCIE1_RESET_PD_MASK                    BIT(9)
>> +#define PCIE0_RESET_PD_MASK                    BIT(8)
>> +#define UART1_RXD_PD_MASK                      BIT(3)
>> +#define UART1_TXD_PD_MASK                      BIT(2)
>> +#define I2C_SCL_PD_MASK                                BIT(1)
>> +#define I2C_SDA_PD_MASK                                BIT(0)
>> +
>> +#define REG_GPIO_L_PU                          0x004c
>> +#define REG_GPIO_L_PD                          0x0050
>> +
>> +#define REG_PCIE_RESET_OD                      0x018c
>> +#define PCIE1_RESET_OD_MASK                    BIT(1)
>> +#define PCIE0_RESET_OD_MASK                    BIT(0)
>> +
>> +/*
>> + * PWM MODE CONF - shared.
>> + * The AN7563 GPIO flash mode registers use the same layout as EN7581:
>> + * REG_GPIO_FLASH_MODE_CFG covers GPIO0-15, REG_GPIO_FLASH_MODE_CFG_EXT
>> + * covers GPIO16-31 (bits 0-15) and GPIO36+ (bits 16+). The SPI pads
>> + * (GPIO32-35) have no flash mode configuration bit.
>> + */
>> +#define REG_GPIO_FLASH_MODE_CFG                        0x0034
>> +#define GPIO15_FLASH_MODE_CFG                  BIT(15)
>> +#define GPIO14_FLASH_MODE_CFG                  BIT(14)
>> +#define GPIO13_FLASH_MODE_CFG                  BIT(13)
>> +#define GPIO12_FLASH_MODE_CFG                  BIT(12)
>> +#define GPIO11_FLASH_MODE_CFG                  BIT(11)
>> +#define GPIO10_FLASH_MODE_CFG                  BIT(10)
>> +#define GPIO9_FLASH_MODE_CFG                   BIT(9)
>> +#define GPIO8_FLASH_MODE_CFG                   BIT(8)
>> +#define GPIO7_FLASH_MODE_CFG                   BIT(7)
>> +#define GPIO6_FLASH_MODE_CFG                   BIT(6)
>> +#define GPIO5_FLASH_MODE_CFG                   BIT(5)
>> +#define GPIO4_FLASH_MODE_CFG                   BIT(4)
>> +#define GPIO3_FLASH_MODE_CFG                   BIT(3)
>> +#define GPIO2_FLASH_MODE_CFG                   BIT(2)
>> +#define GPIO1_FLASH_MODE_CFG                   BIT(1)
>> +#define GPIO0_FLASH_MODE_CFG                   BIT(0)
>> +
>> +#define REG_GPIO_FLASH_MODE_CFG_EXT            0x0068
>> +#define GPIO37_FLASH_MODE_CFG                  BIT(17)
>> +#define GPIO36_FLASH_MODE_CFG                  BIT(16)
>> +#define GPIO31_FLASH_MODE_CFG                  BIT(15)
>> +#define GPIO30_FLASH_MODE_CFG                  BIT(14)
>> +#define GPIO29_FLASH_MODE_CFG                  BIT(13)
>> +#define GPIO28_FLASH_MODE_CFG                  BIT(12)
>> +#define GPIO27_FLASH_MODE_CFG                  BIT(11)
>> +#define GPIO26_FLASH_MODE_CFG                  BIT(10)
>> +#define GPIO25_FLASH_MODE_CFG                  BIT(9)
>> +#define GPIO24_FLASH_MODE_CFG                  BIT(8)
>> +#define GPIO23_FLASH_MODE_CFG                  BIT(7)
>> +#define GPIO22_FLASH_MODE_CFG                  BIT(6)
>> +#define GPIO21_FLASH_MODE_CFG                  BIT(5)
>> +#define GPIO20_FLASH_MODE_CFG                  BIT(4)
>> +#define GPIO19_FLASH_MODE_CFG                  BIT(3)
>> +#define GPIO18_FLASH_MODE_CFG                  BIT(2)
>> +#define GPIO17_FLASH_MODE_CFG                  BIT(1)
>> +#define GPIO16_FLASH_MODE_CFG                  BIT(0)
>> +
>> +#define AIROHA_PINCTRL_GPIO(gpio, mux_val)                     \
>> +       {                                                       \
>> +               .name = (gpio),                                 \
>> +               .regmap[0] = {                                  \
>> +                       AIROHA_FUNC_MUX,                        \
>> +                       REG_GPIO_PON_MODE,                      \
>> +                       (mux_val),                              \
>> +                       (mux_val)                               \
>> +               },                                              \
>> +               .regmap_size = 1,                               \
>> +       }
>> +
>> +#define AIROHA_PINCTRL_GPIO_EXT(gpio, mux_val, smux_val)       \
>> +       {                                                       \
>> +               .name = (gpio),                                 \
>> +               .regmap[0] = {                                  \
>> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
>> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
>> +                       (mux_val),                              \
>> +                       0                                       \
>> +               },                                              \
>> +               .regmap[1] = {                                  \
>> +                       AIROHA_FUNC_MUX,                        \
>> +                       REG_GPIO_PON_MODE,                      \
>> +                       (smux_val),                             \
>> +                       (smux_val)                              \
>> +               },                                              \
>> +               .regmap_size = 2,                               \
>> +       }
>> +
>> +/* PWM */
>> +#define AIROHA_PINCTRL_PWM(gpio, mux_val)                      \
>> +       {                                                       \
>> +               .name = (gpio),                                 \
>> +               .regmap[0] = {                                  \
>> +                       AIROHA_FUNC_PWM_MUX,                    \
>> +                       REG_GPIO_FLASH_MODE_CFG,                \
>> +                       (mux_val),                              \
>> +                       (mux_val)                               \
>> +               },                                              \
>> +               .regmap_size = 1,                               \
>> +       }
>> +
>> +#define AIROHA_PINCTRL_PWM_EXT(gpio, mux_val)                  \
>> +       {                                                       \
>> +               .name = (gpio),                                 \
>> +               .regmap[0] = {                                  \
>> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
>> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
>> +                       (mux_val),                              \
>> +                       (mux_val)                               \
>> +               },                                              \
>> +               .regmap_size = 1,                               \
>> +       }
>> +
>> +#define AIROHA_PINCTRL_PWM_EXT_SEC(gpio, mux_val, smux_val)    \
>> +       {                                                       \
>> +               .name = (gpio),                                 \
>> +               .regmap[0] = {                                  \
>> +                       AIROHA_FUNC_PWM_EXT_MUX,                \
>> +                       REG_GPIO_FLASH_MODE_CFG_EXT,            \
>> +                       (mux_val),                              \
>> +                       (mux_val)                               \
>> +               },                                              \
>> +               .regmap[1] = {                                  \
>> +                       AIROHA_FUNC_MUX,                        \
>> +                       REG_GPIO_PON_MODE,                      \
>> +                       (smux_val),                             \
>> +                       (smux_val)                              \
>> +               },                                              \
>> +               .regmap_size = 2,                               \
>> +       }
>> +
>> +#define AIROHA_PINCTRL_PHY_LED0(gpio, mux_val, map_mask, map_val)      \
>> +       {                                                               \
>> +               .name = (gpio),                                         \
>> +               .regmap[0] = {                                          \
>> +                       AIROHA_FUNC_MUX,                                \
>> +                       REG_GPIO_2ND_I2C_MODE,                          \
>> +                       (mux_val),                                      \
>> +                       (mux_val),                                      \
>> +               },                                                      \
>> +               .regmap[1] = {                                          \
>> +                       AIROHA_FUNC_MUX,                                \
>> +                       REG_LAN_LED0_MAPPING,                           \
>> +                       (map_mask),                                     \
>> +                       (map_val),                                      \
>> +               },                                                      \
>> +               .regmap_size = 2,                                       \
>> +       }
>> +
>> +#define AIROHA_PINCTRL_PHY_LED1(gpio, mux_val, map_mask, map_val)      \
>> +       {                                                               \
>> +               .name = (gpio),                                         \
>> +               .regmap[0] = {                                          \
>> +                       AIROHA_FUNC_MUX,                                \
>> +                       REG_GPIO_2ND_I2C_MODE,                          \
>> +                       (mux_val),                                      \
>> +                       (mux_val),                                      \
>> +               },                                                      \
>> +               .regmap[1] = {                                          \
>> +                       AIROHA_FUNC_MUX,                                \
>> +                       REG_LAN_LED1_MAPPING,                           \
>> +                       (map_mask),                                     \
>> +                       (map_val),                                      \
>> +               },                                                      \
>> +               .regmap_size = 2,                                       \
>> +       }
> These defines are similar to what we have in airoha-common.h, whatever is not 
> the same add the define with the prefix and the defines that exist only have a 
> different regmap, move to the add in the define parameter, do as was done in 
> en7523
>
>

