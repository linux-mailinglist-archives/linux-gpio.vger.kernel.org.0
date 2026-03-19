Return-Path: <linux-gpio+bounces-33780-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLlFA7Zcu2nfjAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33780-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:17:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E702C4D42
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 03:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C055305F668
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 02:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4253815D9;
	Thu, 19 Mar 2026 02:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MVPGIVsT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0087C27979A;
	Thu, 19 Mar 2026 02:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886627; cv=fail; b=bj9xo6Xh0I5OVTyeNo3XTnMmScv1Q4eHWHRJFRIq2v36uUVeBegLxBavSQIPI6TLbDPRearmClzgo0fCLnF4Zd/1ufX10EYqVqKr3FwfNPsiD71utwUMM6Yk19t3Qods5T9X6m6DKCQ835FTbD79cN3tuH2aCt9l7rfx7Hvz2XU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886627; c=relaxed/simple;
	bh=vnNd9lTXrfajruD5uvYR+AWA3KaGXOQ0GCLUXC6zX2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uyUIreHFIGyfkfui8mU7RYAyjwqqPwDfNHB+M+YAPvuJREtv7/cpAYwOol1hTKArTqPsISgB3ArlYCrEh4VkFSgEeK6F11Aez2CmAaE2Lw/DQ7BkP/356weyjXHqh/6v5P9VudTjn9Kha24QdAPJR7JK58tgamJTIQwQUpI6XM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MVPGIVsT; arc=fail smtp.client-ip=52.101.52.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipo1T0ALifAKEh4uDw/gIeINbY4hFnIMGulJ/fINr7tWHv1M9xXGbB2LFUWBoIEOiZ/nCowtDXogbZEccLHrEBCBEF0XdCZWG2yAbslP8aABi7UuajBD2tgCRxUdVrzMtifQw7/3/geCy71ZIrDa3yqPhzxguwqQUtHH/y3ngC5cTldWrRdQkyPGWLl/mFpD6M/CvGlX+o2sanIHEqaiXLV9L30km9GyG6oowUyq2IHBD/Y/YKxfl5rht5YsUJEZH30Kv9rqgxOctkwLq6UmeOFaStVCYvJccI4GtFQLr84nwxTyDpC9JhHL/V/B654bd89EmNI4R1VwrY3Hhss2GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zk9tUTMjxx41x8gsA95beiD1w+2pmRbap62bIBUdxvU=;
 b=TuHSKxLzy6jrStkIGOSqoIit6HxwHWM4YHIhE/Z5ZJJXe98x6p0cmm2MSSOuH0PM4cBxOh+aYLDjJgadUWZbOu2G+0MN439SU6QVgRRuqvG0OaHboMu+5tzD1t8knhBg1+DHP5U24jd7nxPIHEOZ39djb8viDhNd0bC4LIw5MgIGuENo66PbOvXNPNoMlH2B1yrgiXNtN1J6namo72rWd9Y21hdEI1OM7oJxvwUJE9cvpHAQtsjgqtLgGCQTew6K1fFzekEEzAsdSm+Ec8SXMO5RlJc/OxqknyNKDz9zRMwoRJSNG/CN6OassOnt3i7U2jCMVxf5ffTk3cxyxo20DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zk9tUTMjxx41x8gsA95beiD1w+2pmRbap62bIBUdxvU=;
 b=MVPGIVsTH+rboYuRhj8/aID8zaQFdaZ8Wy8yJgMkCCQiOEaggPh3uTrQwcE/o+Wmg+0D0WD47kMw5T3EZOWNIF9oms8rgraBujv+j9doRkI5WsfKrLiUWayRQeeqMtq8ekrFePYcpBHdToXOiOf/D7D/YlbpIsdA1DKTxo0FnDWAJj4IATUGodDs3/kM3FJgi299ovYsvAvqgkHV7Ad8MOA+lfFV6m0L+4vGHHKnCchWwQaLn9Jq+Al0BIOEUYtIpOcB1FJICZZ9c8OzcvlCq3hxExEW4BMj6GmFt0H31/2GIWgC5dZhOO6p+cAwObGPub9JmSSQpDHl5TqRjYK0PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 02:17:00 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9723.016; Thu, 19 Mar 2026
 02:17:00 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Jon Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
Date: Thu, 19 Mar 2026 11:16:48 +0900
Message-ID: <6713290.mvXUDI8C0e@senjougahara>
In-Reply-To: <abrsS1UW-q6J1rEU@shell.armlinux.org.uk>
References:
 <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <b7ede8c7-acc6-485a-b433-35d780d6ad1c@nvidia.com>
 <abrsS1UW-q6J1rEU@shell.armlinux.org.uk>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: 9581c145-fddf-4160-c532-08de855d9a5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KFmQ9kR+FWOUwik2CPKvHCu5GMDOF7mcaGbNstekjVFF6T+A/rvEKzjXbi6dff1cqIKoVtwgzkXLuw/mxeOwEapZUYEDVgSme6n2s04fQOqyrZyyVvEeZ6jAk5Vir/R41kXXnd34RhXbfN4kfjD9GNMk3EBUulW5Cemay9V4Yp6TpGScgLtpY1yqZEibtT1OLxlFD9YlOLicW6mG4UnOCsf18I8Ur8aoxyl36tq2pHUJIluek2Y7bKsjU5kKBHpf+GM0ELdAwrfE8ficZD0gnXAm+m8fWmi09aBtr8uvlhFX9e/Z8r8OLQC2+2W0Jec/CLSF0dUcfAGlSrN9tBK0u1gBFLSCoZmDa/uyLF/leK8WXySnv2y7kLWYG1mfu1lWgay70vw/yiqXd/XdPDwX+TZ3LkEOGl8U4p1HnalxqpEZAdBxeCXxBLprXDjnNmGj3iqhYFDbMRfDQOZaJnhTrN6h3WBfWkQsj+7xllUYzOQ7eYlf2xqfSGpSX8NnVUDcSYrdMVazHNkYM6uh5KMwgL7/SIWxsPxFV1TQ8N2GqWBybuiMHN4QuoygPUHaxxFMAPF6DFKiNa/uKjFSsDTtiJVL31R69Yb/WHSCLyQlSyDVv7Nr/YHwgr1G0njO4CghDKhZPXQswj1J2QLXzuIG621Y6cIIVkf8CJ1ABrLnKDbpkAGHM6xtWiBqj3wt+rvMSx0G64KuGgpIQ+b/7GSba3jpqRxwraUdvNxqJc9i6tA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUlrOFZGK2pBNHZwTm1qSktISkJFYlJDRU1FSG0yMkIvSERwWW05dzNtSWUv?=
 =?utf-8?B?eTdyMmRDZTZCanVTSVpPNGVrd0l3Z1dkM1NWYU5VZE8yR2NNbURUN0hJVDBJ?=
 =?utf-8?B?SnRuaEVBZkFYUUlpYmMyMVNPb01XWVA5VDU4ZjhQTjFQT0h6bXdSQXllMUtO?=
 =?utf-8?B?c3l0OVRMcGd6Y0tyZnI0VStIdVU5b0pXWFJkd0FZRzdvOWd4cEE0NysvTk9i?=
 =?utf-8?B?eGd2bm9uMlE1YVBSdzVrTlMvcERDalJCU05KYXVDQ1FmTzljMWNQMmdXaEUw?=
 =?utf-8?B?Rkd4cDFyVTh6aS9hSWJsTUFKOHBYZ2Z2Z2NodGFKalY3NGlqVndNUldlSHl2?=
 =?utf-8?B?MUdqNDkxQzg1MGZJK0JTSzRnbjYrMkxQYTdEYVJkQnNRMkp5cHNCRndLc2tD?=
 =?utf-8?B?ajFsRU13ZGYzZnJVc1ZRZCtSMHVBMGk2V0JyTFkrQ0pEcmNXaFZGb1hsL1lz?=
 =?utf-8?B?ejcydEVTOTVScGxLUndtanRoMEFOZXl3N3ZVZFk2ZmZvSkpGWGw4ZDZQOUdB?=
 =?utf-8?B?WE1ReXQ2MjZpUWJNeWw1RkxhSW9nT0FUdDhheGNkek4rakluZ2xYRHBlSmlq?=
 =?utf-8?B?dWZLbFp0ZzFGalp0QzVMcUtoREg1N2VOYTBOeUdQbmtvdC9UY1pxOVlVUWtn?=
 =?utf-8?B?c3duaVpQc0FGSDFkYUcyOUszdVlBVmEzekQ4MkZuSmNiWU5mbEdINjdrMVJC?=
 =?utf-8?B?c2t0YXpDNGZjMTU0dXdmUUlmVlFpYk5sUFhTWWxXVkJCMnFNZGVjRFhWbFlo?=
 =?utf-8?B?cTl2T3plZWt2bUZocGZ4NzlwMHFSREp2NzUxdXFxL21UdXBOZm5nb3ZEQlVN?=
 =?utf-8?B?dy9KTVJIczE1WHFvakFoL3dYY1NYVWlSaFdGT01UMzhNMXUvdXYya1o5ZHVN?=
 =?utf-8?B?Q3pBamtTQnl3eVAxS1pQNUxwWTNLbDdHV1BEL1c2K0FBMGtFTmM2TVhNb2xR?=
 =?utf-8?B?M1FtbEhHRHJFdHlXUEtGY2FpNC9LdVhoNERqbjBpN2RCRVFBRGpGTmFRN2sr?=
 =?utf-8?B?ZUJ5amhSY0ZjaFJ5SWNaZ0lzeGp4VzZIL3ovcmwwSkJPVnc2cVBLMzRFNGZ5?=
 =?utf-8?B?RzNyMVA5Vy82cjliMFVXa1hCaWhKeDAyaFozRmpaZXhEc2V3WlRUNEFpOVpL?=
 =?utf-8?B?L28zeTJPeGNtNzY2VmhheWE2L0tuaDN0aHhmTnAwOU8zcXNGTS9aSGJ3eUhT?=
 =?utf-8?B?VkMxU3duZDdPU2tlWEJvRTFKdmZMOGZOdmFqTmo0UnptaVdmU0N6U3BqWDF2?=
 =?utf-8?B?MWxvMUJTNk9pb2V1V0pyb09JWjE5Q0VJYlUySlovYmJvYjNZZVdKS29XeXBD?=
 =?utf-8?B?TVRieE53WUpJTHQ3UlJuUGdVRnk4dy8vTjJWUTdZUEFDUDJoSXplRC92UmRm?=
 =?utf-8?B?MVp5MSt0VmEvQnJSR0YwbjM1SHZWQnhMbk04Qm16U3JWRyt0NS9YdmVDS1dw?=
 =?utf-8?B?SnBWZTNLQmtEZ3NWS0h5U1QzcEQvaENUVDNmcGY1WXlkN2FwRWgrWWl0OWdV?=
 =?utf-8?B?MTRES3JaRk1WelN2WjlwNTMwbENGbVBEN1haeExvblBUeS9ETVpzMGNWdW1s?=
 =?utf-8?B?YVNZL2RyU0JTOVh2aVY3YzhmV1ZZbXIvQjA2TXN4dk5RbHVuelFVcUNHVk9x?=
 =?utf-8?B?Q0dzNTl0RVhFd25uRHJqVG94cVNMamZMNzFYaTl3WkxPZFc1eFBBdFplbnQ1?=
 =?utf-8?B?S2JtUUZ1aVc2cno1OWN1aWlGTzFHQk9jMUhha0F1dWdkMXd0OCszMHg2eDBU?=
 =?utf-8?B?M1ZNT0Nua0E1ams2MU0vdUZJNVdmQ0NrbWF0NXdoeHNVZnVvUVcxdE1HUkJt?=
 =?utf-8?B?M2lERlV0aVgwNFk4N2N0cDZiMmdoRTVlcUdyNnlQSnNoY2kvWmp6NVpJMnpo?=
 =?utf-8?B?QWxmMml3Rm9LL3pYQmdjZkJIQXpGY2tDd2s3RHYxd3l0M2toY0xVcm02NTZk?=
 =?utf-8?B?OGlNQUJVWU5wU0JLL2psNUFkT3VpTHhjbjBHMmYyOHAvWHpVais4ZUtTNnBv?=
 =?utf-8?B?Y1BJWWwyaFREb3hnNmNURENBNXRyYVdtc1FpZU5GYlc4SEN3R2MrWDV1TmIx?=
 =?utf-8?B?bDN2Z05oOUhNclBaMm1iK0lXRVN6Vm5jWjBNNloyUzUwRm9TTkZTZUhReDM1?=
 =?utf-8?B?R0ZBVDdvNjM2emQyWnB5Tk9BQnNoekZqTGxoNm4wNnloOFRobGJSbURnTTcy?=
 =?utf-8?B?VFlzazhXOE5IbFgzdm5na3hvNyswenFpVCtTMGQ5UWRzQU1OVmVxeEdFYmFr?=
 =?utf-8?B?T3J6aEdGTGk0dHlNOHBSYlJQTUxDUTcyWU45YlduRUhtc2JkV0UzNVZyeWVW?=
 =?utf-8?B?cGR6M0Q0Y1U4d0VBNmc0OGhYcXBBbE1CVm5OREFTWXZDOG5PeVJzZVNMalU3?=
 =?utf-8?Q?S5VbGTyfmGuhvf7oqhMDGW1AkFuP8Ye86s/JkkrALqoD9?=
X-MS-Exchange-AntiSpam-MessageData-1: q5f+NOYwfqrfbw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9581c145-fddf-4160-c532-08de855d9a5f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 02:17:00.4143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86yH5vVg6piH0Q+YSBb1fxEZXIBt39c6nDHbsBQZudB3CMlTOhpT866ygB8p5KNoUchaI5r/hlheWTt1ckisng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33780-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A8E702C4D42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thursday, March 19, 2026 3:17=E2=80=AFAM Russell King (Oracle) wrote:
> On Wed, Feb 18, 2026 at 08:30:49AM +0000, Jon Hunter wrote:
> > On 18/02/2026 01:35, Mikko Perttunen wrote:
> >=20
> > ...
> >=20
> > > > > > Yes we should always follow that rule. However, in this case, I
> > > > > > believe
> > > > > > that the build time dependency on the PINCTRL subsystem was onl=
y
> > > > > > exposed
> > > > > > by adding the 'i2c_dev->dev->pins'. Unless I am misunderstandin=
g
> > > > > > ...
> > > > >=20
> > > > > Yes, it looks like it.
> > > > >=20
> > > > > However, I wonder why the dependency has to be complicated.
> > > > >=20
> > > > > ARCH_TEGRA in both arm64 and arm selects PINCTRL, so we can assum=
e
> > > > > that
> > > > >=20
> > > > > PINCTRL will be set for ARCH_TEGRA. So:
> > > > >    config I2C_TEGRA
> > > > >   =20
> > > > >    	tristate "NVIDIA Tegra internal I2C controller"
> > > > >    	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM ||=20
ARM64
> > > > >    	||
> > >=20
> > > M68K
> > >=20
> > > > >    	|| RISCV || SUPERH || SPARC))>
> > > > >=20
> > > > > +	depends on PINCTRL
> > > > >=20
> > > > > is a shorter way of writing this, and it makes sense - pinctrl is=
n't
> > > > > required because we're doing a compile test, it's required becaus=
e
> > > > > the driver itself fundamentally requires it with this change whet=
her
> > > > > or not we're doing a compile test.
> > > >=20
> > > > Yes that's true indeed.
> > > >=20
> > > > Mikko, do you want to take care of this?
> > >=20
> > > My thought was it would be better to keep the PINCTRL dependency grou=
ped
> > > with COMPILE_TEST. That makes it clear it's only needed because of it
> > > -- clearer to the reader that ARCH_TEGRA implies it. Kind of like not
> > > checking for NULL pointers in C code when the contract is that the
> > > pointer is not NULL.>=20
> > Russell's point is that regardless of the compile test, the driver has =
a
> > dependency on pinctrl and so should always be dependent on it. The I2C
> > instances for the DPAUX device on certain devices require this and will
> > not
> > work without it (before your change was added). I guess I should have
> > added
> > this dependency back with commit 718917b9875f ("i2c: tegra: Add pinctrl
> > support").
> >=20
> > > I can change it though if you'd like.
> >=20
> > I think we should.
> >=20
> > Thanks!
>=20
> When is this bug going to be fixed? This is a regression that's
> affecting Xavier systems. It's been over a month since I proposed
> a patch to fix this:
>=20
> BUG: sleeping function called from invalid context at
> kernel/locking/mutex.c:591 in_atomic(): 0, irqs_disabled(): 1, non_block:
> 0, pid: 59, name: kworker/u24:6
>=20
> Please see:
>=20
> https://lore.kernel.org/r/E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk
>=20
> for my original proposed fix, complete kernel messages and analysis.
>=20
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

FWIW I did post v3 of my patch a while back: https://lore.kernel.org/linux-=
tegra/20260303-i2c-dpaux-irqsafe-v3-1-75ca95b96666@nvidia.com/

Mikko




