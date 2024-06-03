Return-Path: <linux-gpio+bounces-7074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 854CB8D8268
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 14:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38C0A283501
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768A412C476;
	Mon,  3 Jun 2024 12:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m6QI4MOp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D05F12C46D;
	Mon,  3 Jun 2024 12:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717418225; cv=fail; b=lmkfa9edziQUt91Cubh3Ct46p1/ccYXkptq24Mcl5Ym3Lvn1e5mclYTggM5Thb0TIDI2CUusB7GM6FymjNPUj6KSlhqbQxMZKqN77ma6c1dtiZySwPZzZ0dFxiZ10Y9W6mdPW7G/LJ1AXHUrNb/RNveS9zwzDGxX0235bnO88vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717418225; c=relaxed/simple;
	bh=AxN4uho/p2ZopfkjKVVtaIwj2IMj4XhD5VY+ctFnAII=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ccVNNLYbDoyn2FP9EPsrvXH9gA4LErfRLqOgxKvfQwanS/N2ORiHxc/JYfO1e9T+QaW+vx1FrGsvmSGH1ktJZcZmuFYki3GEf5RbFEkDjgb/diHw01JBpkSlvv6NFUkftrc26qAcfB3fOz9TwSVyINlMy8uCBfllvz/ZfQyi824=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m6QI4MOp; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMmBa7i77zy9OilSTCpzuJDXv6CcjsYNhD3iCGHMEV9Cv8Mts/+yaaduuJwzuQUOOtpzoHQWsiHGCjeHCt6Ce2ONvGeNQFo0HP7u67rHzn1TXfaL0br34mk7JzUMnoLKyu8c66pLYphFLDwejKUC4GcmAXJZVprvVmiG9nsz2RAZ5G/0Q48WjsyEDIvMe6NkbtV8GiNy4K9a8BGJOpeYlEmZIdpPcJ2Ae6VqSXuiVyD0ChygVc6vu5Bv8thO2lq2U0Zw44vMT3bD7nBlRMx0wuTIIvjOmjC5MNzpmgi1FD34x0EJ9lQ43gqz82HA0V/0cJOK9V6AvnOIMLGsU8p8eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=re6L59s8xKjipAkKfp5HIZUufM6AO5/EkAOswYQ+c8s=;
 b=hk/IpWZFue8q4BmbysWiZIddXIyt2QRhPOuBx9j5hUc7DS3Fyqh/4mp4iQCzTd6W7wuhj/u8zQFzAhyIj+7P3VuhlBxpG0VHReLh3ad8vWuvCfcXcV3FzeQtC3FoaJ0XOE/JVTtXtnvt6/a3/VljPUBCqIulDhsNvJA/19bzBexubvNGpAvQSO2y1PQuSWqlOuwHXS11TGQPZ50NSAi+MobmEGbl/Nd06d34AR40FaIgN/Vlxb2J/cmxQg2Rr1kh038cW15zmlrf1Bd5Kskg8BSY+8Plojl5qwPWvnLpvbsKMkqV7J1K+fb4lfng9PZG1S0qE+IjEGJspQ9hTQ68gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=re6L59s8xKjipAkKfp5HIZUufM6AO5/EkAOswYQ+c8s=;
 b=m6QI4MOpbIc5TKvYXzoUfKleD46zaUWc0UsAwcAI8x17nT2CZU2OLlnF4bZV4mgS9lOksaaTyS8kLrGtPN3pV9MZ38tlkI37EIksc5hTOMmhkLQGrcL0rJ/IFwvADOnaHmjHblp3BBilw6J1hcEoaPb7AEd95pS0kVfGug+nV4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH8PR12MB6675.namprd12.prod.outlook.com (2603:10b6:510:1c2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Mon, 3 Jun
 2024 12:37:00 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%6]) with mapi id 15.20.7611.016; Mon, 3 Jun 2024
 12:37:00 +0000
Message-ID: <38cd5e6d-f18b-4ea2-8fa1-40416d4370a9@amd.com>
Date: Mon, 3 Jun 2024 14:36:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: zynqmp: Support muxing individual pins
To: Linus Walleij <linus.walleij@linaro.org>,
 Sean Anderson <sean.anderson@linux.dev>
Cc: linux-gpio@vger.kernel.org,
 Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <CACRpkdbOAoSDNFhXfz3djUZh1_MQ_T75CC+-LmojRXvyCbUusA@mail.gmail.com>
 <06a4e5fd-3d26-4923-bcbf-0bdd66d756c4@linux.dev>
 <CACRpkdbSsgxtKqF6ORXubufTaegjysHU7zH-tJfDfKNd=Kdoeg@mail.gmail.com>
 <51d984f5-896e-469f-914d-2c902be91748@linux.dev>
 <CACRpkdZ19+zUCEBCJJ+MBnnaF+caZKFTDxYiWZ0BRGx+PxN3bw@mail.gmail.com>
 <e4972a07-18d6-4a8b-bb5a-4b832aa2d20e@linux.dev>
 <CACRpkdbL63ZWcopgBbANKzr476rO6_cwZL6JLqkvTDXbzzpkpw@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <CACRpkdbL63ZWcopgBbANKzr476rO6_cwZL6JLqkvTDXbzzpkpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH8PR12MB6675:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a522fe2-739f-45f4-ca12-08dc83c9dd39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlR3TGRHbnZ0L0c3eFZCRVJhTUxrNHVuQklJWjErVGlNMFdIcFB4Z25tZzZS?=
 =?utf-8?B?Q2ZCSXM2N2IxbGFsQ0FjdnFJb2ZSOVlUYVlrY2tzejhtRENRY0pTRk0vQXpT?=
 =?utf-8?B?Y1pDZU12V2QvWGhTQmc5MGJwNHlveVBMNWlBUXlLVmdIekZGRUxsZFVmNk8w?=
 =?utf-8?B?M2pkaDdONlBqU3dKMm01R1c2U24zSlQ2NjI2eWhjSjNoQU84aHdoTjZrdmhz?=
 =?utf-8?B?YTZjNnlWMDIvbDZGc2RoWFhPTnVmVFFEZkZVdWJMcGNDL2VzTWplRjRNL3ZG?=
 =?utf-8?B?TkNVSUExQ2IxbDM0bFNIeDR3dG9kVjl0VzBvYzR5aVlwTWVJMmYxZVM3Rndp?=
 =?utf-8?B?d3Z1Y3E3d0NkelBhTGFaT1RXV2x4NkVBMkFEM04xN3JGVjlMdUZPazcycnJD?=
 =?utf-8?B?bmZydVpaNEFINWpBLzZISDBwclRBRFlIYXYvZDh1S2N0MHI5dU1sQXlnRFZF?=
 =?utf-8?B?Yyt3QSt2Qk9uelV1bkNWMGZXdGhrMGd0QU5mcEcxejRxVFFJcWlsUWc1NEhZ?=
 =?utf-8?B?WGE2NUhDM3llcjhNanNKUXR4YzdQRncvd2s4cGJPc0pyQTZjWE83SHAzc254?=
 =?utf-8?B?Ly9DYjVpSVdsWlFrK2d6YnljbEdkTlhRRnArR0pYcEJoTlVPUDlNNUxWN2t5?=
 =?utf-8?B?Qm9HMWF0RVFVTXNGWmczR29IUVdHZ2RuMXNzUmt5MkZnU2xRV05ubUppVlhU?=
 =?utf-8?B?VW5FZjA5Q1BkeDVRc0gwTFQxT0VsT0tud25qTnhhMEx1WWJOVGpPcGpuaHNz?=
 =?utf-8?B?Zk41RFlTSHhTRlBVVjlwQ3g3blZ2V1l4ZGNRcTRWMTVyUDEzVGNtRTd5MUxI?=
 =?utf-8?B?SHczWVdGdXNWb0ZCUVdZeWtIK1VtSXRLRnlUcmZCWDE5MjJ2VnJ0S3JjMWFs?=
 =?utf-8?B?bVBPMGIvZzJuZE15NkZaQTZuTDlpUHloMTdzWlFSUHFSZDVyNXdPM2NVWlE2?=
 =?utf-8?B?endhV09WbXBLQW13ZWx1MDhabVZTbDYzWkc2eTJuclYrNWMwazI3ZUx1SGty?=
 =?utf-8?B?eUpiZzVlQ2lpK3RhSkZ2S2FMcmcveDhGZVdmbkZsdDlHbWViZ2phYlVTYkgr?=
 =?utf-8?B?MjhESFMvK1FGdTdhUE1CTDRuajhTVUlicit6ZllVRlYwMkpobHpiQ2tmUndK?=
 =?utf-8?B?bjZKdDJla0VDZiswbCt1Zmt2KzZaUUdlcDFDcXp5K3M5Tng1dWRrUy9qOGcv?=
 =?utf-8?B?Q1psUkJHMzVaTlUzSjgrS2hpTnoyTURQNzZLZEN5eDc4NEtKTkRZZG5CWlE0?=
 =?utf-8?B?QVA0UXRSa3djam00dFhRbHJLdHZXWUFjdVA4b3BFdDBTOE92TzRIZEJpd1R5?=
 =?utf-8?B?ek1vSVdoekV5QUNtdVpFT2pxRjZQZlNxZERjRkdqQnFsK3Q3eUdVdCthTCtB?=
 =?utf-8?B?WmdJZzBCZGpZSUUxRTNERjhHNVpvRHkzV2dVME1nMHZXaW4rb2F3MnZ1c3JK?=
 =?utf-8?B?QWpzemM4djN6dHhpb1ZDVWlkNHlTNVBVVzM0WVNNMytRU3Y1bDdrWi9sRkRY?=
 =?utf-8?B?d3pxSFI1M0lXTUMrMGQ3UVl4Y0QwZWtWekxCWHFudzJGQ1BzK0lGRk5kZUwx?=
 =?utf-8?B?MFdlRUdXeXhPelFuNVROVnpyVXl0aFJGQ05rTlA1WnMyR05iTkRIcFg2K2JZ?=
 =?utf-8?B?bGpkTFo5aUJyM1B5MkNWTjV1dTFMOWNUM0ZRUHE1MEkwaUdEbWJ1WDQwYW0x?=
 =?utf-8?B?V2c3Z01IMHJqdFB4cHBqWEFvVDk1ZDJMSDZQOVl4NzdDeE5wQXh6dnNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDhiZFdia2p3SG1lL1YvNzhHMVJRYy9FQXdQcHNLMEU2T0xuVjZOckRKT0hN?=
 =?utf-8?B?N0hWWWZidzZKNkdlb0ZhbnZsQXZFSTZBR0NLMGZTMTdzcDljbHcvYkJ3ZGF4?=
 =?utf-8?B?Rk84SmoyY251d0VCb3FuNmpwekpmM3A4VlZONmlnamdNakVoY0pPbFNBQ2dt?=
 =?utf-8?B?QkR3SGU0ZlFSRlVGR1Q4QkttZk9BbXZTOWxObmRmTTJLK2FMNkljRzFxVEVw?=
 =?utf-8?B?Z2hRNnBxS3Z5cFpRU2VkZDhiOGt5bnNhdGE0cExHd0pCN2luZ0VDZC9xa1RK?=
 =?utf-8?B?UTZaTzlqK3VXRFkrTEV3RFhjcnNRZkt4VmNhOE42MEpiNU5XVFBEZVJJQ1BY?=
 =?utf-8?B?bVFiM1JtS2t0cU1BR05OZjBXSExTbC9BZkZrZTVwdkRnMzFrQ2VXUXU3WmF5?=
 =?utf-8?B?c1QyQnBFbVNpeDBkMWR5WXRuKzNsK0ZYMmhDNVl0aVRUcjBBWC9Ld2VYcW0z?=
 =?utf-8?B?VEk3RUVzYXRNeW9WOWFTOUVJTll6a1JrY0U2MkN6MDdLUFk1M3RYbEJhMjhQ?=
 =?utf-8?B?UVlHWGRGejNLNWtSM2RTTFN1NzAzeU1ZKzVNT2dvQnFRL1lUTmxUV25NWmFk?=
 =?utf-8?B?WkdrSUtqT05xbXVrUU9YZDFEREx5dXFwM1dyM1lQaXRNWUVzM1JicEJlYTlJ?=
 =?utf-8?B?RnRCdko0MWdsQ0NkeXF0bVowWEpBVjV5c2RneU1EcHpNaVpTTkZsWjYxbFZO?=
 =?utf-8?B?VlhlSWJOMzdNL0sxeEd3dnRtMEZMZkg5Z0VPK3BDd2trZW9pd2FscHRkSGV1?=
 =?utf-8?B?QWZNNnRHUno5WE9kVmI4dUlvaHlHRjg3ZG40TE9HNU1XY09PdmtsNGNNMXhD?=
 =?utf-8?B?NTR1UE9hRkZvZEJWV2pveno5RFBMMmlIVTJrb0lzVlVNWGR6SXJZc0ZHSW92?=
 =?utf-8?B?aTJkdXNHMVhsTFFMY2I5amk1WDlZY1NzbjIzcFFnM2prQk1sY0NqeDQvVjRW?=
 =?utf-8?B?QWUzSHlwa0Yra3puWGFaQzNuY0JoNDlVVEY2UXZTcXJUazJTdC90RDl4eUZk?=
 =?utf-8?B?cGw2NjZXSHlZdW5JWmNKaGVtd1lLRHRUejY0QnNzRHNYRWxRS042WjU3WlYx?=
 =?utf-8?B?dVZ5clNVYW9OYUx3ektnK2d0RmQrNTZpd3AwRjNEeVhickRoTFJmWXhYb2Mr?=
 =?utf-8?B?QnZEZ3RQVlBMdnhiMEtoQWZBR1FoNjhIYU1GR2RScHdDVVZxdmZOMm43WDhY?=
 =?utf-8?B?QmJOWXBueCsyb3ZEYXFPQXV1VTUyZUNuOTNrejM0dWpWVDFIVk9MYms2U1Rz?=
 =?utf-8?B?S3k0aDV0cUpmc0grMjV0UXRLdXA1SVNSeGs5N1lkblVQWGhBNk96ak1oeVRU?=
 =?utf-8?B?M2hrKzRxc2U2Y29lc2s1YVBFVFJ4Y28xakJHL2lwdElQQUt6d2p4bURLZlpU?=
 =?utf-8?B?ZG9iRlllUmdXZW5Vd0lsNklpdUtML1VHbk8yazhzY0p1UkkzMW5WbHc5eW55?=
 =?utf-8?B?cmhXOTZEdnZLTXBSbEk5cStEVE5GS0lneWpTWldOYkkyWkdOWkNpLzRrS3l1?=
 =?utf-8?B?OXFTdnpwYzZhQjFhRXhuNTN1eUZMMWlSQk1ueUNhU2dBL0xmWXlmeXBZM2NF?=
 =?utf-8?B?MEFYQ1kzZFhsbDdqTzh2TkV6QXo4MndFZERkT2ZtQjNKSlNsSXY3NXl4dlMx?=
 =?utf-8?B?d2N5RmRLNFZ4S0JaeDdsbnNRVDZhc3NmTnREY1hlU2NYMWVHaUUrdFpSZ3Zp?=
 =?utf-8?B?NEljMGk5d3h4YnJIMkVDeWlSTml2K2plTVpqdXd2UjZvZ0hjS2l3R2lQSGJk?=
 =?utf-8?B?d2VQNjltbzlhWWpkZDhiL0NGNHlFTHd5dGo1Q3BZMy8xRWNTOS9HUkpxUU42?=
 =?utf-8?B?ek1hanBTOEY5USt1dEg1QXV3Tkw5WmF3SmlwcWtRN0o1RnlremVrMGErUFlI?=
 =?utf-8?B?OEZnR3dBaUFGdlRXenpNUEpaNFBXSUtoeG81R256VlVWaWV4SlRGbmdnSTF3?=
 =?utf-8?B?UTFRRmdhMEdYTGxBVWJRV1p3bTFnZ1J3N21icHJQMmYwMEFvTUJ0MzZNN2dY?=
 =?utf-8?B?ck9PZEJ4S2c2a1FBZVZyR1VNRE54bjhhbWtkdFJNV2R2WHpJdGFiSzhVaFBk?=
 =?utf-8?B?OG9vNWp1dHMzVHdkU3hjZm56dENZQ0I3RmlDWVorbCtkR2Y3NURxWHBLR3Jj?=
 =?utf-8?Q?p3rAtMbUgYQlVw6Hzz7gvxLik?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a522fe2-739f-45f4-ca12-08dc83c9dd39
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 12:37:00.4042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/EKMAOZaP61r8QyGlHWaGiYZ1ggqCPBNfHG7k7rdtV4mHHBBJ1CETndVe2t7ep8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6675



On 6/3/24 11:02, Linus Walleij wrote:
> On Thu, May 30, 2024 at 7:08 PM Sean Anderson <sean.anderson@linux.dev> wrote:
>> On 5/29/24 04:38, Linus Walleij wrote:
>>> On Tue, May 28, 2024 at 4:28 PM Sean Anderson <sean.anderson@linux.dev> wrote:
>>>
>>>> Well, perhaps you should have reviewed the original driver more
>>>> closely.
>>>
>>> Do you want to push me down and increase my work related
>>> stress? Because that is the effect of such statements.
>>>
>>> It looks like criticism of me as a person, so explain yourself.
>>>
>>> Writing this kind of things looks to me like some kind of abusive way
>>> to express your desire and that is what burns maintainers out, so
>>> if that is what you are doing, stop doing that, adjust your behaviour
>>> and focus on technical issues.
>>
>> The technical issue is that the driver does not match the hardware. We
>> must maintain the existing set of groups for backwards-compatibility.
>> But this should not prevent improvement.
>>
>> Saying that we cannot have both group styles means that the driver is
>> permanently stuck with whatever was picked when it was submitted. Hence,
>> if you want to have only one style you had better review new drivers
>> very carefully.
> 
> Actually I did say you can rewrite it to the other style, it's just work.
> 
> If the previous approach was wrong, just redo it as it should be,
> and rewrite the DT bindings and the existing device trees. If
> backward-compatibility is so important, add a new driver with a new
> unique Kconfig CONFIG_PINCTRL_ZYNQMP_V2 and new bindings
> on the side and select one from a new compatible such as
> "xlnx,zynqmp-pinctrl-v2", problem solved:
> new driver new bindings, can be used on a per-board basis,
> can be compiled into the same kernel image.
> 
> It may be embarrassing to have to tell the device tree maintainers
> that the bindings got wrong three years ago and now we need to roll
> a v2, but worse things have happened.
> 
> I don't like the approach
> "this was done so we cannot redo it", we can always redo things,
> it is even expected as proven by Fred Brooks timeless statement
> in "The Mythical Man-Month": any team *will* always design
> a throw-away system whether they intend it or not, there will be
> a second version.
> 
> This approach will be more clean, I think? Also it will be
> possible to phase over more boards and perhaps eventually
> drop the old driver and the old bindings.
> 
> I'd like to hear from Xilinx/AMD how they want to solve this
> going forward.

Sorry for delay jumping to this long discussion. Groups were chosen because 
that's how design tool (Vivado) allow you to configure it. That's why these 
groups are described in TF-A. That's something what fits the need for most of 
use cases.
But then there is technical side of things what can be setup via registers.

If you look at uart0. There are 19 groups in Vivado. uart0_grp0 MIO2-3, etc 
uart0_grp19 MIO74-75 and that's what it is described today.
But it is completely valid if you take MIO 2 from grp0 and MIO75 from grp19.
It will work without any issue but likely we can't described it today.

Uart is interesting one because you can configure one RX channel and up to 19 
(number of groups) TX and it will work properly from HW perspective. I don't 
think you can describe it via DT today.

In Sean's use case with SD we don't have groups with less then 4 data pins but 
SD cards should be still working and that's what we can't really describe too.

I don't think Xilinx recommends these descriptions and normally customers are 
not design it like this but from HW perspective it should be working properly.


Regarding driver. I agree that describing all possible configurations via groups 
is not a good idea because describing all combinations is very hard. It is not 
unlimited number of them but that number is very very high and it won't serve 
the purpose.

TF-A should be capable to provide all information about configurations already 
it is just up to OS to use it properly.
If there is something missing we can take a look but we have already issue with 
TF-A running out of space.

 From my perspective allowing functionality per single MIO pins is not a bad way 
to go.
Having it in separate driver is possible but don't think it is worth of effort.

I have asked Sai (driver owner) to take a look at the patch more closely.

Thanks,
Michal





