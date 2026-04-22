Return-Path: <linux-gpio+bounces-35334-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCMBC5kp6Gm3GAIAu9opvQ
	(envelope-from <linux-gpio+bounces-35334-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:51:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD644412A9
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 03:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE17A301CA7C
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 01:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBE42E06EA;
	Wed, 22 Apr 2026 01:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="XA6/+kvT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020075.outbound.protection.outlook.com [52.101.201.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA1347C6;
	Wed, 22 Apr 2026 01:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776822529; cv=fail; b=JSU6lGe4isjuzaf7D1biHCdt/RFgQqnpII3WElhT7muFZ1Yw0OXUI9x6oHOAso7lpCNOmTSAiPF08xmnlYJRw0cq8mB0ZksRO/65SbBp3UHPB1Pi8zbFa/KEXWgzS39RsgVcD7C4NMMibRdEN/kfHX3oXBiecXjEA0XNwC8IBFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776822529; c=relaxed/simple;
	bh=wY/a3YQy01wgg0AcHG0ZgZTpy8EWQGo21Y7WCJ6nLEY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JAbHSmUsyVpqV8DMSYBCakYdGSOfkDSjoaJi4VUkYmhbJWIMGy3sxEwaY+9/0IjOGSTf02eVrRYWpYrx74PbHWgtceoSgeBnuRVdl9QXyTAn+QhJMryCNtb9CmgIYjz+2N1WDqb9rFNupdsG7Sf1RB24dev9Im9cPd1OAZtUvW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=fail smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=XA6/+kvT; arc=fail smtp.client-ip=52.101.201.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjKXSDHjxqssOq8AC1Qib74Rwo0GjnLREdXnEyAt2c97p8gp4eot0EqVIKClTUYMyiVDwHh/Pg9LXzHQUdQQpQYGeTMnRLJJPyW6+rLqUr+o2zzyFlL7qvqdC+ANfOIEytK6VlE9doPF2QcLW3Gy4nPEC4HzvXnwrVuoqfSSRJW6DObxjzQG2CspBHtLB3Hw/d4PS1yv0kmtFDhbMhWAoFyh33y74YRo/sJFJZWSEbMnQK5uCNjzgIFI6JzmM9fH0z4jAujMSpMhjn2nhY103ktjl2zPT2goQt6SOBf3dJMGt3AWfvv4a2FdWqra2IelaQoUkwqjxsrebPN/glPH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfXJK/zw/tl6zDGAyScmlTtDfVBO66P99xpLpt3khNg=;
 b=fL8TEBermfklw9iQNwhTxpRCZ8Pfmz+euKxfelqDS89qoF9W9qlOLGeCLX3HdnybmqYHgJ5ocnWolzSj0kQRlP5Sw9nvqcckzI7MDk2ML6ekvg9N+x4HdjNX1mDVJdkMf5jbFdCNAW2peZQIeSUWl6zZkeKVhZsQ0WyVxKhYTZKTsjjZiJuirmAhg0Pu1efMiEatZmsxxvxWo1nxBZurXpPx0xt/tL6b8WtCVUjhd0febUQ+jbcc3xatcvNTeObp8SazafjWk/0QFLKpHGFCVZofDIIv9JNOji5ea3ROpkOkZEaMK1izB9Byo+l+04PEj4Gr1813A4J1MJfjtLXWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfXJK/zw/tl6zDGAyScmlTtDfVBO66P99xpLpt3khNg=;
 b=XA6/+kvT6GkGYD1oA3NDUs1DiLGBNuR/a2NV4QjAIltdr/w2ZpprO7ngDK7r3fLSvWOKXsF6tey+QU7LFk2VZlebrocTW3JOjyAAsgPQrhSAJ9ty5/B07Tf8qRiIMRINsygtS4WTjeFroelCl/556rTskrr4TiPeQD/B7dIJOv8j1HlnCPZKtDEqdzBdG6R9KMk5EGTyoLc0DKmAfCS7pu/6z+qyLoyPo9SdAO70rR/qYrhxOIIwlwnSQnLyjisZHU26MfaqsXpq8lUulrulhULOTapY5SNW5I+4vEaR2kE0XQMipP45ShTaUhOzuD75RZ6iFGvi2+zlAnARrIUzqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM8PR18MB4439.namprd18.prod.outlook.com (2603:10b6:8:34::7) by
 IA0PPFAAEAD3BF5.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 22 Apr
 2026 01:48:45 +0000
Received: from DM8PR18MB4439.namprd18.prod.outlook.com
 ([fe80::ee1b:d9e3:ba51:ed36]) by DM8PR18MB4439.namprd18.prod.outlook.com
 ([fe80::ee1b:d9e3:ba51:ed36%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 01:48:45 +0000
Message-ID: <09cccae8-7ef5-45fc-93c1-7f8304709e23@axiado.com>
Date: Tue, 21 Apr 2026 18:48:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] MAINTAINERS: add Axiado SGPIO controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Petar Stepanovic <pstepanovic@axiado.com>, Tzu-Hao Wei <twei@axiado.com>,
 Swark Yang <syang@axiado.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-3-b5c7e4c2e69b@axiado.com>
 <cadd1ab2-a70a-4f7f-9bd8-3146ddacc2cc@kernel.org>
Content-Language: en-US
From: Prasad Bolisetty <pbolisetty@axiado.com>
In-Reply-To: <cadd1ab2-a70a-4f7f-9bd8-3146ddacc2cc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::35) To DM8PR18MB4439.namprd18.prod.outlook.com
 (2603:10b6:8:34::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR18MB4439:EE_|IA0PPFAAEAD3BF5:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a10b54-a3a2-47fd-d3d8-08dea0114a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9AtsyJuFARYFy+ynNrxEKpa+/UwHlzQp9Xp1tAU5KkH8kzoZBt2g0/i9tlHG+5zlGIsMZQT8qaosNeKR1zzTxu0weEFc7fX9w9AhuEzoaCJtJ2LJtr1rI/L6I4bP4FtNafPqDXacUfLpnjml7qGEfwR8BVH4Rygj9QgRs+XEQtzsMXeVe/RPslVdyhseSXoSc7hLxXGefsxUSHiGB5bU6twQL16l6/NgOXo15pnhqVQlKTvf9PDTz2NfB4z5jeBu6Lf5TLvzMGEwJVcr81luU0SXepj2AjoDKZzEPwHYQfNF0Mp0AsgFhoxkg/WrYpgiGzcjxqpwHEJG52Ol/6P8EHni4DUIpXhkQAXSb3dHvM49v8E7OKvMuvDZrjFFM4UHbIkT6OyxfXkJ4YZx8xkCrq0NsWJfi91HBs+HmdBoPKmPOKUbqfJNSSVkNxl2oS8b5JUfSiqTG5Aok4Zy/O0iHK3dzUm+xsPpNX5KVhhwHMsT3bbzvcttBgXtDKIAj9PTbbFer2GhPOyfH/D9sySGZlpRMXwfEo1x4qDi0EXcPkCrVT0LUEZPrBL3Bbu9dhD1wFycegHRE/CHgtLqhU+joCYlxfUzQBH5J6Wgjap3wyLqQTYk2Un+/v9+fxceJVIickbbpccDvFo/4YDpcr/NaMPleVyYZ+SLapsyvwNA49Ld8gm5EOieF+Sh2XxEf3Cdi/8K2C/5/KfFIhuWIlmi9pBOg5F9IpeiyrR2DimbOZI3APzBJHvSW4K+7GsKSO+EYVhGu7cMU8EvDlERopAjdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR18MB4439.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFF5d2MwREtKQ2NwU3ZROEJSSWx4T0VVbnlROE0vdTByS0R2V3pLNXRycEQ4?=
 =?utf-8?B?RWs3RllQVFlGN1lmTmlUNE9neDkvTUVSdE1rcUxFZXhleHZyNUltcjZQT2Zj?=
 =?utf-8?B?ZDBaZVpVSU1wMVkxRnpicTRDdjFUTmo0eXhCNFFwSkVLS09rSXA3ZXVpT2gv?=
 =?utf-8?B?cXBIUXJseHZ6OHNYUXJaZ2JWckFVUjN1Yk1DSjM1QzVMQ1NRTmd1TkJIMHc5?=
 =?utf-8?B?UUh6UHk5S29XZm1GaUN4aStRMkFGNW8wV3RjUFFwdzRTemVZa2lyQWhhQTBs?=
 =?utf-8?B?eTBLRjFtaXhMN3Z4VzZ3WWNuS1FHZWpyYWpVSE5CNnhmQ2R4aW5VUnlaR0Zw?=
 =?utf-8?B?OGZ5RGVNS0Z6bFA0RDYrV3ZCQXoxT0tkYWxFb3c2Ym1HQVFUSk9rUVpJMTVM?=
 =?utf-8?B?YkkwdXVhY3U1TUpVM1JzYWQ3TTNYVEhKOEk3MC9PZ0FjNTR4V2M3TUQ5bmoz?=
 =?utf-8?B?ZkNxVXRsRncxN1ZGT2lSRWw1VTVIREI3M04zbm9nM3JXdWhyeldudHJLd2la?=
 =?utf-8?B?RWxDUkpxR1hUT29EYXJTTUZOb2N4SHNDNFhMNnp3SVdYMGNWRERqbHVNOHBu?=
 =?utf-8?B?d3RuZVBvUDI4Y0xhNFVVbFY1R0M2cnZBaCtTU0N2WjhRZCtlbktJc1A1MTlV?=
 =?utf-8?B?UGtUWUh2eEZrLys3Zkw5TXV0N0RKVVJRcXFuMHRYbFFIR2JJZGlkVUthT2pE?=
 =?utf-8?B?Uy9vVW5GNXJDMWFSbm1heCtrOHVMQ1lqcUdJTEJ6dFdxazFCY1YyNUxWWmtS?=
 =?utf-8?B?TXZ6QzdzNWVpQ1ZaSUszeTlOU2RuRkNVbUJ2eE4wVnBFNStNNEFkUVZQTjBt?=
 =?utf-8?B?VnA1enZXZmtJN1NJb1lFdEhCOGxSVzdBSFd5czFxNUpNOXg4VVh5emtkbTM4?=
 =?utf-8?B?UlRnY3VNMENpRWpLTTlobGMrN1V4blRBTXVGUjZwalVEUGdzNGEwS3dHd1JT?=
 =?utf-8?B?YlNlL1kydldOUVpOYm9tVVR6c3N4V3FxNURiTkpiaVVxVGNMVU5HWFA5dWRY?=
 =?utf-8?B?NUR3UGxScS95cGdOWHp2ZnNqQ0xHWnpvZnN4UFE5L3BRK2hvZ0VmU3IzUWJB?=
 =?utf-8?B?QlVidSt2Sk11WTQ1b3JHTXFXQ0RtdFU0R0ExeDVOQUx3VVI3aXd5RlNaVXA4?=
 =?utf-8?B?RExmcVJ3ZzQ3UmJ0VVBsaHpBdkd5Y0VjMklmNStnL1BRUGZkMmtuNWF2UHN1?=
 =?utf-8?B?NGRJczNFWlVralRGckRycHZMRGhLN2pFSC9PdkFiQjliTWZXRmttOTY1elVu?=
 =?utf-8?B?MjhQcU9nNGNBWHpXcDFxS3NVdXM2eXVEWlRaUFV5NW8yTWxKeE5YeTRsdTVN?=
 =?utf-8?B?UHNuakVDVHd3MGMwSXJaQlgxWkxNSXhnMkhvNENhejVGQVE5ajJaSDk2MWRu?=
 =?utf-8?B?R043VWdiRCtEc3Q2Si9HbjlEUUtYNDVudWVqK1BydHFPMXFhUWVndWM4Z2Fi?=
 =?utf-8?B?RnF4T09mbUR1U0krazJER1B3Sm9NTmVqT0x6QWJoQUMvUXdSWmlhaTlQa1c1?=
 =?utf-8?B?d28wU2piWFJFTGFGOFhteXFveUxwMzFod1d2WEhRRUI4S2lzWS9Jdk5VZjR5?=
 =?utf-8?B?VEUyZ1AzL3BORDA0ZS8wM2UwTkJEbnN2bmNGSVhTeXFDVEpYbmpmMExCNE9V?=
 =?utf-8?B?OHZORFlQRUsxU3pBZFRRZDBaZ2VnZGNkY3ZzWTlpakY1Z0hyallNQ3dqYXpY?=
 =?utf-8?B?N1g4dWVxbi9xT0pHWC9WV2ljZjFUQ0JIeU1hVG4yWW5Lc1dyN3JTSVh2MWRo?=
 =?utf-8?B?eWxYNFhMNDhETmppVjVXUm1UcUVlTWJLT1VOeGRocXNrQ3ZJbmkrTmIvY2xT?=
 =?utf-8?B?TUxRRTdrWmJjbzFSNW95dnVSdU1jc2p2Si9XbStWYkt1RVZIYzNPYm1ld0hL?=
 =?utf-8?B?SEh3TGt4ZzF2UDZNM2gxbVNBU1U1ZFoyU0hiL3BSN1pkcWxvMnZPdmFFd05y?=
 =?utf-8?B?RGRNMGVacHF6UUFhL29PNXRSemlONlhOeDRkbVU0eWk2bENUU0tiZGZLNWcv?=
 =?utf-8?B?bmtTR2d3T1FocFo1aDZHQXppN0tVbGNtYXlaRVAyTGhkejdDdFNYRmd3T3Bp?=
 =?utf-8?B?cmxyaS9xaHhFeHIzNC80VkhoaEM2WFNET3VFa2lvM1FwN0dKSHJrYzZuVDFi?=
 =?utf-8?B?MkJOWG9ySmR4azZRNHVrN2RXQ3ZKa3dqeTB3NTd4eS8vTStINWVydHpkTHU1?=
 =?utf-8?B?Tll0c09reGF6WGQvQ3UzZ21pcnhpdGZXc1o5am9ybnkxaGF0WG9ON3ZTT0Vo?=
 =?utf-8?B?NEdlaXZ1K0VnTkNpdkNHRWF5SVdPd1Rac2Y3aGlFY09zSFNOOFdKTTd5Tmg5?=
 =?utf-8?B?eG5iNHFpTkE4N1JyQkhENWcrYm9UWHcrQ1A0K05VeFRCTGFHSW8yZz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a10b54-a3a2-47fd-d3d8-08dea0114a50
X-MS-Exchange-CrossTenant-AuthSource: DM8PR18MB4439.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 01:48:45.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pfnbm90N0HNupTJf6/vIg0R4voPij46op3AhzNb/mXsjXiGQZ7/9MWoKwPd6GDtt1OjMYxn/7DwwP1/ot52yjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAAEAD3BF5
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[axiado.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[axiado.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pbolisetty@axiado.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35334-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[axiado.com:+]
X-Rspamd-Queue-Id: 9BD644412A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 7:12 AM, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>
> On 14/04/2026 15:48, Petar Stepanovic wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 67db88b04537..56835c0a1863 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -4234,6 +4234,15 @@ S:     Maintained
>>   F:   Documentation/devicetree/bindings/sound/axentia,*
>>   F:   sound/soc/atmel/tse850-pcm5142.c
>>
>> +AXIADO SGPIO DRIVER
>> +M:   Petar Stepanovic <pstepanovic@axiado.com>
>> +M:   SriNavmani A <srinavmani@axiado.com>
>> +M:   Prasad Bolisetty <pbolisetty@axiado.com>
>
> I also expect reviews from the remaining maintainers, especially in all
> the trivialities like posting very old code patterns.
>
> Best regards,
> Krzysztof

We had an internal review prior to the submission,
and we will double-check the old code pattern in the future.
Thank you for the review, and we will fix all the review comments.


