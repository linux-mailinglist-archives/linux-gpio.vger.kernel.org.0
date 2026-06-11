Return-Path: <linux-gpio+bounces-38358-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dod0KlEmK2oW3QMAu9opvQ
	(envelope-from <linux-gpio+bounces-38358-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 23:19:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFFA67566B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 23:19:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=2gdLm+cj;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38358-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38358-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9374C30FE46B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 21:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B86373BF8;
	Thu, 11 Jun 2026 21:19:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F2535675B;
	Thu, 11 Jun 2026 21:19:07 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781212750; cv=fail; b=DQQX6YYJ+XeV5wg6W1Dbd/+8UpEGOER4k3e0uSgFeNh5QQozHl4RDPP9r9Ztte6KMi/+dvxfz/+3QM0FbWJL6h0EifguQ6jZZF9iyFDHxZEPr3Mlcp2kYLx2XKEe8aLIWggLI23MRpkDSlTOz323OFnZhGYoKcTJxaPcXuZFX0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781212750; c=relaxed/simple;
	bh=tly50GoQP3WK7IYdd3kgcP6gX2F3nxq/H4ZENXoSI8k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KT7LNM/bKgDNzN9VeszH1Hk9yZQezbu3mus6F4yEzuOjpPxZ9QuYKHLLcgGoG7HiL9lK9dSL1apyRAQ6f5j/+8HWlR9TgnCz41Go8QQ5KnbheEbiPNupDgEJ1RVaqmlXyGa+FO0MUn1gLmSuUabbpaNSxBKEy6eToPeTifsZdf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2gdLm+cj; arc=fail smtp.client-ip=52.101.85.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J89Cb61bkFVLa0ichnFUWdxx8QVaaJaXfyHN2S8qG0DS9Bfcnq6bGPSVakgKU73Er3ZUGEf/NgzKy6LO9eaEkA8AQMiUXoJ5wcYOVmtpLsEX1Sl0ailzHygJ4rAeuhdHcPDsshqDlWjJ6R4GwwOireqF2vHoLWNMVGtxd5D6KGzRSzscKLXsLza8oB5FRKD74o56uJenQpBfE+OqJb4dRJD2JpGAoJkucQger9or9dFtv6D03l9dflBSqdkIQS94S3ND9TPBVI5li5xoX6ymq0FKYqf2OqYeJbLp9pih3y0Isr+qJWLsHh/XA/Om1uIbFem4rDz1PgXbJePb9pcF2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdPv3d2PtKlmiX15AERXdjQp9YrSvJLqUDmWEVvtEQY=;
 b=KWU1Y3P5Q4ayZk8/dCuQm4jbbUJPOpdeJ3/zOzaTzUXCWaMIQfleTkdju3OEPi8w6S6nQ9TYBDcxXEwN8evBVLshyQq0OaKx+fZX6UieQ6/qx0PPXY7oyzhCN97q2KFLDH0mdz6o6X0pGINTHqPt6Kw06ePYT+R5AJtK8f2UdFQdkNSQwXIxs4axmFT4S4Zom76qlo4PqaxLrS9bCRyVyD5CeaWQL02/QXZxp9ZFjKfQ2uVELDjX+Vqq4UmmNZio9fxA2dSr8MTUNbWbZUHhyk7qPn+U15d9pcJ1SOTdZ/rYc8Rg5X5uW6O5gQRsdV8ZJPkWqOr1hKLw99aO3PAENA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdPv3d2PtKlmiX15AERXdjQp9YrSvJLqUDmWEVvtEQY=;
 b=2gdLm+cjlTncuh7mj3El2KROpz1c2neic6J1Orha/QY+pkttrwzWzn5AknB+Xl5PpLXWsg67ViXU2aTSjfPWEAdPdbHhZN7Rb/jjVJ5LKh3oQC33i6lIfwk/146BzLkCkEHc41C0i0E7qqoFQcwqKUHWkYdTMUhoBidj3Kwdw7Y=
Received: from PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 by DS0PR12MB9421.namprd12.prod.outlook.com (2603:10b6:8:1a1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 21:19:03 +0000
Received: from PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000]) by PH8PR12MB6914.namprd12.prod.outlook.com
 ([fe80::2893:177a:72b0:6000%6]) with mapi id 15.21.0092.016; Thu, 11 Jun 2026
 21:19:03 +0000
Message-ID: <4923775a-da86-456a-859b-64b6057f12cc@amd.com>
Date: Thu, 11 Jun 2026 16:19:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: pinctrl: amd: spurious immediate resume from S3/s2idle via
 BIOS-armed wake GPIO with no ACPI owner (Lenovo Legion Pro 5 16ARX8)
Content-Language: en-US
To: Lenart Kos <koslenart@gmail.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAFdvZNt+mRTE9Q+utn=T8GzU7s_09ULhUtzTMMa9dgGCsE+r9A@mail.gmail.com>
 <c982caf3-f855-41ad-80cd-3ce9598913ab@amd.com>
 <CAFdvZNs9jNxnqqaPhDXBt555hqgTHQizV4ORPp_8xg1D=XD4TA@mail.gmail.com>
 <44bd3c12-b8d6-45c8-a7cf-12ea47716461@amd.com>
 <CAFdvZNvWSVCphSyQCVNHx7j0WApsbr0KekVsA-rVLO0eqV0X9w@mail.gmail.com>
 <ef1d3b86-f5c1-4ac5-ad09-821624044ca1@amd.com>
 <CAFdvZNvj2Gkik6de1Wtw1++S+MiVsRyyXwo7cPQ4RnDCnKYNDA@mail.gmail.com>
 <e098847d-fc71-440f-9572-5b3c99035c76@amd.com>
 <CAFdvZNtFYLX4_=T6d3LOdPwQXGjrVAe9Ym6Th_ZMtc=sL1cFMA@mail.gmail.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFdvZNtFYLX4_=T6d3LOdPwQXGjrVAe9Ym6Th_ZMtc=sL1cFMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0181.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::28) To PH8PR12MB6914.namprd12.prod.outlook.com
 (2603:10b6:510:1cb::21)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB6914:EE_|DS0PR12MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 557ef91f-d67d-41e7-f000-08dec7ff0fe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|13003099007|6133799003|18002099003|22082099003|11063799006|5023799004|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	/WAOEoFlKucsFfifm3ECD41ydCeOQXQ5DmJNL5HHyohlcwE6fS+0G14Gi969CiJcZz9hlzNm4nlkD8pYR/SdrA8betc6ZzP+B9DQ90SKkA7yQ23YbY9bbnfrvg0zW+cLvuYK7ToZi71ma00I0eltpdZcTl+K71EfPpoEHIRhIkllcw+x9QmS7eECGOqwbR0Nq2XuR4vmNLm+0RoXr8DpcCtm+0sYjgS2sFXEakUp3Q5BrXIQL7QRYRcnX7aSX+pRUkD5MxzmENk/eNQ4gA0o5QSALzhY3s5tRZ3dqbRg+Pxd/aC0q980+KeoCykFZ+FjGpGYCuRHZOOfDp6Ij3tiC9LaE2wK7kRv4k2nDwLGtgY80/ADaYAXqAH3PPr0mKITCELbN9WS9MbkpqKnG8t0AMegQXbqx3fhNyGPs3/cZp+XEDCQpcjLsh5bAfca2eickIUvRD79todjhMDyJeQW7xIjaKMd9k7HLoKSl9iK54hIHZRXMmB4JBx3p7+R7Z7qd1Nab3GlSfknaPMpfu/qYZWpGmbxMkrUXLVbQfK7FdLpKWkqY9EQRkaDJIu60sCObkoHrRmRcvV9Axg5RuC9PApHQzq9BrpD+T3htoJdxY93MPNLOpGeTatlWx8U4kXGOLByYQCPY5BVou+An6SNHdhE93RArmqPMgq/QnzxGhTMBCa4iAzpfyS71eXHmzWw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB6914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(13003099007)(6133799003)(18002099003)(22082099003)(11063799006)(5023799004)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L29jamgwRTlQWHlza2VocUFVMzJJemdMQndESTVUVE14VTVYb3JGMzB1aEcz?=
 =?utf-8?B?ai9LY2cvNkI1YmRmL3VkZ0lScHN2Tk1MTmcyaVBDcWlpcG9kV3dqSW45VU13?=
 =?utf-8?B?Q2NIalhxSFBwRUxEM013Qk0xRG5mMXRPWUdnaUNZQnV6Zi9YdEZhTVhscE12?=
 =?utf-8?B?L2dFZHVmR08rbjdkM2RmODczdVhpZnVBSU9yL3VIQWllall2am9mckYzL2JL?=
 =?utf-8?B?cHpGdWpuVEZhQmRHZnVBS2szNitFd21iOXlPcmFWeHBQdlJ6NDQ5dGNwOVFt?=
 =?utf-8?B?cEpDSVFMMk0rZnJQRUFkNE9SZFMwNlBzeUFBbHlRbkdWa05odzhVRUJ4ZzNy?=
 =?utf-8?B?aktQMDZqTUJwSWhSQlhpNzIwK1paQlNIMm5tSEREdTdqRllEbDhSbHEzZ1Fj?=
 =?utf-8?B?ODlNRG96QktQbmt5VU1pWDlFVjUxR0ZNWU9FNjdac0VFSEZXRDZPamJtT0Fk?=
 =?utf-8?B?cm1GKzkzeHlHd1ExQUw0UjA5Y0s2RjdVS2R1eVBocVNGY09yQ0ZOTXRGU2Vh?=
 =?utf-8?B?Wll4TEIyams1RHRXN3hmOVZ4VXZnMVkzMlZrNmxueEdudllRbU5ySHlLM3JI?=
 =?utf-8?B?UFd4bWk5Y3FQaWdBLzQ5cVRJOWZUa2d1aDI2MHlXekdnU0dHK2lJY0xwSDU1?=
 =?utf-8?B?R1dGSnJkMWhBNVB4azVRT015NDc1WHY4UjFEUWhid2s2WkgwUmRURk5mZDM0?=
 =?utf-8?B?eStOZXNZd1NJRGtVMnBtWXBaN1p3SVFsbVo5U3pvU3p1Mk02OFhRNERmRndp?=
 =?utf-8?B?ZW9aS2k4bFloMXlRY3c1OGRZSVpLWXkrR1ZvTGZqVmN5dTlYS2FaNFNYYTh5?=
 =?utf-8?B?NHI5dUg3b3lQRWxWRUY0ZkJvUEJ1L3daSEFEbzhwUFlOdktYTzFMOGhwVGpk?=
 =?utf-8?B?OWROUWNSV3FXQ3N3eWRkUVFTWmZ0c3krSjNkTEhCK0RBczN5eWtTdHhFM25i?=
 =?utf-8?B?WTAvWW1BL0NXOG9ITVFJSHJoN0duSDFqei92a3lzcUlZYXBSY0d4dWVrOWFH?=
 =?utf-8?B?dmpkOSt0UUE2alc5MEtUT3plKzJXYnN2NzBrQWdsc3c2OG5kTFJEcTNrMTB5?=
 =?utf-8?B?eGZINEZFMGVMZTdWcDVjdlk1ekl0b1JqZ2poMXp6Q3NGT3BXaldGd1JndEVh?=
 =?utf-8?B?bzFLRG5YbERVbDRZazQ1NnRPQ1VYU2JYOHF4VjA2L040eDhyMEtQS21OSDB5?=
 =?utf-8?B?bVZOcFRiYnMwTEFaT2ZoSzQxUEpadjFnVkV4NFlJSWhxeEFHKzh3NW9WS1cy?=
 =?utf-8?B?L3VURmMzVlErVFlZTkVpTW05eHFUQkwyaTNNSTBLMHMzWERaUVFOdkNBcU1v?=
 =?utf-8?B?dnl5NTMzNjEwN0VjbTByZkJ3V01oYnlkaHNaNE4wZ3piTXpmd0R1Q1d3REhI?=
 =?utf-8?B?ZkErbldvOHlWWjh5eDRqM3hpTnBwK28vUk1RSlpqMnRUbG5ONVdXbTVLQW42?=
 =?utf-8?B?ZUFqLzhabFMrWGlIQlJ2TGVZczFxTy9tc2dyMCtTNzV4RjB2YWJFd0NURlZQ?=
 =?utf-8?B?VFphWmdCZ2FRcWdJd3Q5MFVVMVhkQTFQamIvZ3o4bWtSNnVBbTJqc2g3dmZP?=
 =?utf-8?B?LzJZbE1HS0lHS2czdnZNYy9QeEc4bW1CVkpvSFdFMjN2M3R0dHMwWWNJTkx5?=
 =?utf-8?B?ZlJ5TzZTQ0NxZitZWjV1THRadUp1OVVOcmo3dDdySkZaMDFla3BqaDYrRTFl?=
 =?utf-8?B?Vkh4MTJ1SGd5VXc1c0phMVpnYmZaRG1UellwRDFpMmhZV3M4NitDdHU3eXJn?=
 =?utf-8?B?V2E3bmkvRUVnNmJEazE2eEVHajFLQUluckRyemhZaHBTNThkSG9rY0NrRDgv?=
 =?utf-8?B?NzFXMUl2b1RFOCtLM2hFV3A0TjVBWk5weVEwd2trWXJzb1AxbzhldWdOOFJx?=
 =?utf-8?B?cENnSjBKMGltYVJhRkI4ZXRzQXFaOE4waDIwRUV0T3NJTlpoMlRpRjNWRGQw?=
 =?utf-8?B?aHV6UlE5ZS9ScmxqUXo2YWk0Z043eDRCa0VpNmJKbjNvZkc2YzE5QWRrS3d6?=
 =?utf-8?B?VHRidGxKVDNxVGVTOWJDM0w1eXM5em1LYTVmTWhaeWRKWHRhWU5Hbi9Dc1Ro?=
 =?utf-8?B?bU8xM0ViL2tMbVVOa2loWkFaU3pNZktBZGRxTWk1bTlEVXJNUDB5bXVnOUdj?=
 =?utf-8?B?bTlxRHhIeFBkbVROVHdNQjVqWm1pT3dIeFVJbCszbXJTQkJGSXhxMlpDcTVO?=
 =?utf-8?B?T1R0ejFCMEREb2pBZmtIaGtjZm5pcHBiS3oxWWVvSDIreTRyWXRQZ1dBQkhZ?=
 =?utf-8?B?dGl4VW1IaVVHamV3WEV0NWZpNFdrZWdmUmU1c3Bhekg5am9HNGZiM0t2ZjE0?=
 =?utf-8?Q?LWgawX2qnkqTm5mhgi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557ef91f-d67d-41e7-f000-08dec7ff0fe9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB6914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 21:19:03.2358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Ci7IYb3kaScsrWWKsydm84TstA1giyTfasvSHKvOPyo3+8xZs6bzlVBv91p2/HiL5iGfgitqQ2vhBYZDNbc5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9421
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38358-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:koslenart@gmail.com,m:Basavaraj.Natikar@amd.com,m:Shyam-sundar.S-k@amd.com,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EEFFA67566B



On 6/11/26 03:07, Lenart Kos wrote:
> I'm sending this patch from Gmail, I hope it was parsed correctly and
> is what you had in mind.
> 
> I am second guessing who to report to. *Something* is interrupting
> this gpio pin and I am only sure that the event is being consumed by
> Nvidia. So I decided to boot with no ignore_wake and all nouveau and
> nvidia drivers blacklisted
> (module_blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm,nouveau,nova_core)
> and I was still able to reproduce the sleep issue again. This makes me
> think it might be a platform bug, or atleast is is not caused by their
> driver (or it could still be caused by the absence of the "corrected"
> driver I guess). Sleep works fine on Windows though so maybe it's a
> configuration or firmware issue.

So what you'll need to do is update this paragraph and title to match 
the style the Linux kernel expects.  The background you explain above 
would be better put in the cover letter.

You should read through this guide if you haven't already:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html

A good way to think of it is that everything you write above your S-o-b 
will end up in the Linux kernel git log.  Do you want this all there? 
Probably not.

> 
> Signed-off-by: Lenart Kos <koslenart@gmail.com>
> ---
> Documentation/arch/x86/amd-debugging.rst | 20 ++++++++++++++++++++
> 1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd-debugging.rst
> b/Documentation/arch/x86/amd-debugging.rst
> --- a/Documentation/arch/x86/amd-debugging.rst
> +++ b/Documentation/arch/x86/amd-debugging.rst
> @@ -133,6 +133,26 @@
> The ``amd_s2idle.py`` script will capture most of these artifacts for you.
> +Disabling a spurious GPIO wakeup
> +================================
> +
> +The identification method above is not specific to *s2idle*; ``GPIO N
> is active``
> +is reported on resume from *S3* as well, and the ``GpioInt`` /
> ``_EVT`` lookup is
> +the same.
> +
> +Identifying the notified device is often not enough to stop the wakeup, because
> +the firmware may legitimately route a runtime ACPI event through a
> +wakeup-capable GPIO. Such a pin can be kept as a runtime event while its wake
> +capability is removed, using the ``gpiolib_acpi.ignore_wake=`` command line
> +parameter. The format is ``<controller>@<pin>``, where the controller is the
> +ACPI device instance of the GPIO chip (``AMDI0030:00`` for the AMD GPIO
> +controller) and the pin is the line number: ::
> +
> + gpiolib_acpi.ignore_wake=AMDI0030:00@2,AMDI0030:00@4
> +
> +This skips ``enable_irq_wake()`` for those pins, so they no longer wake the
> +system while their ``_EVT`` notification still runs at runtime.
> +

Yeah this section looks like what I would expect.

It might be worth renaming section 18.5 to "Spurious wakeups from a 
GPIO" and fold directly into the section.

I would say try to fold them together, clean up commit message and then 
send a v2.

> s2idle PM debug messages
> ========================
> 
> --
> 2.54.0
> 
> 
> 
> 
> On Thu, Jun 11, 2026 at 6:34 AM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>>
>>
>> On 6/10/26 17:13, Lenart Kos wrote:
>>> While debugging with /dev/gpiochip I found out there is actually an
>>> acpi event attached to both #2 and #4 so the report about there being
>>> no _AEI resources was wrong...
>>>
>>> The _EVT handler shows what pin 4 is:
>>> * Case (0x04): Notify(_SB.PCI0.GPP0.PEGP, 0x81) // "Information
>>> Change" -> dGPU (NVIDIA)
>>> * Case (0x0A): Notify(_SB.UBTC, 0x80) // USB Type-C status change
>>>
>>> Testing with cmdline
>>> gpiolib_acpi.ignore_wake=AMDI0030:00@2,AMDI0030:00@4 it fixed the
>>> issue as well. Maybe this can be added to gpiolib_acpi_quirks or
>>> should this be fixed in Nvidia drivers? If you could kindly direct me
>>> in the correct direction since this does not look like an AMD problem
>>> anymore.
>>
>> This should not be quirked, there is something wrong with the NVIDIA
>> software stack if it's asserting this GPIO over suspend.
>>
>> I would suggest you contact NVIDIA for a solution.
>>
>> But you at least have a workaround now.
>>
>> FWIW I do think that this debugging sequence you went through to
>> determine the root cause and how to implement and discover this
>> workaround is useful to add a paragraph to
>> https://docs.kernel.org/arch/x86/amd-debugging.html.
>>
>> If you're willing to write up a patch to the documentation, I'm happy to
>> review it.
>>
>>>
>>>
>>> On Wed, Jun 10, 2026 at 11:30 PM Mario Limonciello
>>> <mario.limonciello@amd.com> wrote:
>>>>
>>>> On 6/10/26 16:20, Lenart Kos wrote:
>>>>> I have checked all the bios settings and the closest to modifying
>>>>> sleep behaviour was a setting that enables opening the lid turning on
>>>>> the laptop which was already disabled, so no, there are no sleep
>>>>> settings.
>>>>
>>>> OK - then the LLM statement that this is a modern standby system sounds
>>>> categorically wrong.
>>>>
>>>> It sounds like this is actually a system that only support S3.
>>>>
>>>>>
>>>>> Regarding the HDMI port, it is connected to the Nvidia card. Only the
>>>>> built-in screen is connected to the AMD card with eDP. I have not
>>>>> reported this anywhere else yet, only here and the before mentioned
>>>>> forum post. If this is an Nvidia issue I can report it to them as
>>>>> well.
>>>>
>>>> As the behavior only happens with something connected to the HDMI port,
>>>> I think you should discuss this with NVIDIA before we make any quirk
>>>> decisions in the kernel.
>>>>
>>>> This really sounds like a driver bug to me if it's tied to that behavior.
>>>>
>>>> I personally would not be against more debugging infrastructure, but I
>>>> would think that /dev/gpiochipX is enough for users to debug with.
>>>>
>>>> You can work with an LLM to try to come up with a solution that uses
>>>> /dev/gpiochipX.
>>>>
>>>> I would certainly welcome a new section in
>>>> https://docs.kernel.org/arch/x86/amd-debugging.html to explain how you
>>>> used it if it's effective for debugging this problem.
>>>>
>>>>>
>>>>> The HPD theory is pure guesswork done by LLM. What I can be certain of
>>>>> is that disabling those specific pins
>>>>> (https://github.com/Lenart12/legion-nowake/blob/6b599aad7afd1431e81048273106c5526561764b/legion_nowake.c#L59-L62)
>>>>> did solve the problem, as to why and in what way, I would not bet on.
>>>>> So the statements about HPD and your questions about them are maybe in
>>>>> vain. What would be the best way to figure out if HPD is actually
>>>>> attached to those pins?
>>>>
>>>> You can add some debugging statements specifically for when those GPIOs
>>>> are firing interrupts.  Unplug/plug and see if/when those GPIOs change.
>>>>
>>>> Maybe they're monitor presence lines?  Maybe NVIDIA can tell you.
>>>>
>>>>>
>>>>> FWIW I think that it is in fact not HPD as I have checked the GPIO
>>>>> states when the monitor cable is connected or not and it seems to be
>>>>> gpio #131 not #2 or #4. I have asked Claude to expand on what it knows
>>>>> and what it assumes, this may be of help to you:
>>>>> ---
>>>>> What I have measured (facts):
>>>>> * The resume is triggered by the AMD GPIO controller:
>>>>> /sys/power/pm_wakeup_irq = 7 (pinctrl_amd), and the post‑resume log
>>>>> shows GPIO 4 is active: 0x30057c00 with the wake‑status bit latched
>>>>> and the S3 wake‑enable bit (bit 14) set.
>>>>> * In /sys/kernel/debug/gpio, pins #2 and #4 are the only pins with
>>>>> S0i3/S3 wake‑enable bits set and an interrupt enabled. (Pin #89 has an
>>>>> interrupt but no wake bits — not a wake source.)
>>>>> * These wake bits have no ACPI owner: decompiling the DSDT and all 16
>>>>> SSDTs yields zero GpioInt / GpioIo / _AEI resources. Nothing in ACPI
>>>>> references these pins.
>>>>
>>>> At least for AMD this is specifically more common in systems that
>>>> support S3 (no _AEI resources).
>>>>
>>>>> * Empirically: suspend instant‑wakes only when an external display is
>>>>> connected (reproduced over both HDMI and USB‑C/DP); with no display,
>>>>> suspend holds. In the HDMI case, pin #4 is the one that latches the
>>>>> wake.
>>>>> * Clearing the S‑state wake‑enable bits (13/14/15) on pins #2 and #4
>>>>> fixes it (verified across multiple suspends). Interrupt‑enable bits
>>>>> left intact; no other wake source touched.
>>>>> * GPIO #131 is the actual monitor‑presence line — its level cleanly
>>>>> tracks plug/unplug (active‑low: LOW when a monitor is attached, HIGH
>>>>> when not, confirmed across plug→unplug→replug). But #131 has no
>>>>> interrupt and no wake bits — it does not wake the system.
>>>>> * Pins #2 and #4 do not change level when the monitor is
>>>>> plugged/unplugged (both steady while awake).
>>>>>
>>>>> What I am inferring (not proven):
>>>>> * Because #4's level is steady while awake yet the wake only occurs
>>>>> with a display connected, my working model is that #4 transitions
>>>>> during the dGPU's suspend power‑down sequence, and that transition
>>>>> only happens when the dGPU was actively driving an external display.
>>>>> This is a plausible explanation of the display correlation, not a
>>>>> verified one.
>>>>> * The precise electrical function of pins #2/#4 is unknown without
>>>>> schematics or a scope. They are not the monitor‑presence/HPD line
>>>>> (that is the unarmed #131). I previously guessed "HPD"; the #131 data
>>>>> contradicts that, so I'm withdrawing it.
>>>>>
>>>>> Unknown: what #2/#4 physically are, and why the firmware arms them as
>>>>> sleep wake sources with no ACPI description.
>>>>>
>>>>> Net: a bare, firmware‑armed pinctrl-amd wake pin with no ACPI
>>>>> description, which no existing in‑tree mechanism can disarm
>>>>> (gpiolib_acpi.ignore_wake= needs an ACPI event; power/wakeup needs a
>>>>> device owner; /dev/mem is blocked by IO_STRICT_DEVMEM).
>>>>> ---
>>>>>
>>>>> I have not filed a bugzilla report yet.
>>>>>
>>>>> I hope I addressed your questions.
>>>>>
>>>>> On Wed, Jun 10, 2026 at 10:23 PM Mario Limonciello
>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 6/10/26 15:18, Lenart Kos wrote:
>>>>>>> Thanks for taking your time for this. To answer your questions:
>>>>>>>
>>>>>>> S3 path:
>>>>>>> AFAIK it was on [deep] since my system was installed and I strongly
>>>>>>> remember being it as so, although it is possible that I misremembered
>>>>>>> since I have been debugging this sleep issue since January. In any
>>>>>>> case I have also tried setting sleep to [s2idle] before and it did not
>>>>>>> fix the waking issue even if set in s2 sleep mode.
>>>>>>> The firmware is not modified, everything is installed from Fedora
>>>>>>> sources without modification.
>>>>>>
>>>>>> Can you please check in Lenovo's BIOS setup if there is a sleep mode for
>>>>>> this platform?  If there isn't that's fine, I want to confirm what
>>>>>> Lenovo actually presented before making further assumptions.
>>>>>>
>>>>>> If there is such a setting, what options does it offer?  If you change
>>>>>> it does the behavior change?
>>>>>>
>>>>>> Furthermore if this issue is only happening when connected to the HDMI
>>>>>> port, that's the one connected to NVIDIA, right?  Have you started a
>>>>>> conversation with them?  Assuming the HPD theory that has been presented
>>>>>> is correct their driver should be in control of HPD behavior.
>>>>>>
>>>>>>>
>>>>>>> Methodology:
>>>>>>> Yes you are correct about LLMs, I have thrown every bit of my
>>>>>>> knowledge and time that I have available for this without success and
>>>>>>> Claude has finally solved this after a few months being irritated by
>>>>>>> this. I had decided to forward most of the information I received from
>>>>>>> LLM in the hopes it was useful to an expert in the area, but in
>>>>>>> hindsight I can see this was a mistake without AI disclosure, I'm
>>>>>>> sorry. So for your other questions regarding why this assumption was
>>>>>>> made or why was something done a certain way - I don't know, but I am
>>>>>>> willing to assist with testing. Apologies for this mess, it's my first
>>>>>>> time filing a bug to the LKML.
>>>>>>
>>>>>> No worries; as long as I'm talking to a human about a problem not an
>>>>>> LLM, I'm fine to work with you to see what we can come up with for a
>>>>>> solution.
>>>>>>
>>>>>> I've got various inline comments/questions below.  Can you please
>>>>>> address them?
>>>>>>
>>>>>>>
>>>>>>> On Wed, Jun 10, 2026 at 9:59 PM Mario Limonciello
>>>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>>>
>>>>>>>> First off -
>>>>>>>>
>>>>>>>> How did you get into an S3 path?  These systems that ship with only
>>>>>>>> Modern Standby / s2idle normally shouldn't be able to get into S3.
>>>>>>>>
>>>>>>>> ╰─❯ cat /sys/power/mem_sleep
>>>>>>>> [s2idle]
>>>>>>>>
>>>>>>>> Have you modified the firmware in some way to try to enable an
>>>>>>>> unvalidated path?
>>>>>>>>
>>>>>>>> I have some more questions about your methodology below because when
>>>>>>>> debugging a kernel issue an LLM can sometimes make WILD assumptions that
>>>>>>>> are totally a house of cards.
>>>>>>>>
>>>>>>>> On 6/10/26 14:32, Lenart Kos wrote:
>>>>>>>>> ## Summary
>>>>>>>>>
>>>>>>>>> On the Lenovo Legion Pro 5 16ARX8, suspending (S3 *or* s2idle) with an external
>>>>>>>>> display connected resumes the machine after ~1 second. The wake is delivered by
>>>>>>>>> the AMD GPIO controller (`pinctrl_amd`, IRQ 7) from GPIO pin **#4**
>>>>>>>>> (and pin #2 for
>>>>>>>>> the USB‑C/DP path), which the **BIOS has armed as an S0i3/S3 wake
>>>>>>>>> source directly
>>>>>>>>> in the FCH GPIO register**, with **no ACPI description**
>>>>>>>>> (`_AEI`/`GpioInt`/`_PRW`)
>>>>>>>>> anywhere in the DSDT or the 16 SSDTs. Because there is no ACPI owner,
>>>>>>>>> none of the
>>>>>>>>> existing override mechanisms (`gpiolib_acpi.ignore_wake=`, device
>>>>>>>>> `power/wakeup`)
>>>>>>>>> can reach it, and `IO_STRICT_DEVMEM` blocks any userspace register
>>>>>>>>> write. The pin
>>>>>>>>> is an external‑display HPD line, so the edge produced while the GPU
>>>>>>>>> powers down on
>>>>>>>>> the way into sleep immediately wakes the system.
>>>>>>>>>
>>>>>>>>> ## Affected system
>>>>>>>>>
>>>>>>>>> ```
>>>>>>>>> DMI sys_vendor LENOVO
>>>>>>>>> DMI product_name 82WM
>>>>>>>>> DMI product_version Legion Pro 5 16ARX8
>>>>>>>>> DMI board_name LNVNB161216
>>>>>>>>> BIOS LPCN62WW (2025-06-17) # latest available; does NOT fix this
>>>>>>>>> SoC AMD Ryzen 7 7745HX (Raphael), GPIO ctrl AMDI0030 @ 0xFED81500
>>>>>>>>> GPU NVIDIA RTX 4060 Mobile (HDMI) + AMD Raphael iGPU (USB-C DP)
>>>>>>>>> Kernel 6.17+ through 7.0.x (reproduced on Fedora 43/44)
>>>>>>>>> ```
>>>>>>>>>
>>>>>>>>> ## Symptom / evidence
>>>>>>>>>
>>>>>>>>> Failed-suspend kernel log (verbose PM):
>>>>>>>>> ```
>>>>>>>>> PM: suspend entry (deep)
>>>>>>>>> ...
>>>>>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #2 during suspend.
>>>>>>>>> amd_gpio AMDI0030:00: ... Clearing debounce for GPIO #4 during suspend.
>>>>>>>>> amd_gpio AMDI0030:00: ... Disabling GPIO #89 interrupt for suspend. #
>>>>>>>>> not a wake src
>>>>>>>>> ACPI: PM: Preparing to enter system sleep state S3
>>>>>>>>> Timekeeping suspended for 1.384 seconds
>>>>>>>>> PM: Triggering wakeup from IRQ 7 # IRQ 7 = pinctrl_amd
>>>>>>>>> ...
>>>>>>>>> GPIO 4 is active: 0x30057c00 # bit 14 (WAKE_CNTRL_S3) + bit 29 (wake latched)
>>>>>>>>> ```
>>>>>>>>> `/sys/power/pm_wakeup_irq` = `7`.
>>>>>>>>>
>>>>>>>>> `/sys/kernel/debug/gpio` (relevant rows) shows pins #2 and #4 armed for S0i3+S3
>>>>>>>>> wake with their interrupt enabled, while #89 has no wake bits:
>>>>>>>>> ```
>>>>>>>>> #2 😛| ↓ | edge |⏰|⏰| | | ... 0x147ae0
>>>>>>>>> #4 😛| b | edge |⏰|⏰| | | ... 0x57ce0 <- both-edge HPD, S0i3+S3 wake set
>>>>>>>>
>>>>>>>> How did you determine this is an HPD line?  Is that a pure guess?  Or
>>>>>>>> did you look at a schematic/trace etc?
>>>>>>>>
>>>>>>>>> #89 😛| ↓ | level| | | | | ... 0x151b00 <- no wake bits (red herring)
>>>>>>>>> ```
>>>>>>>>>
>>>>>>>>> ## Root cause
>>>>>>>>>
>>>>>>>>> 1. The external‑display HPD lines are routed to SoC GPIO #2 (USB‑C/DP) and #4
>>>>>>>>> (HDMI/dGPU).
>>>>>>>>
>>>>>>>> How do you know?
>>>>>>>>
>>>>>>>>> 2. The BIOS sets `WAKE_CNTRL_S0I3`/`WAKE_CNTRL_S3` (bits 13/14) on
>>>>>>>>> those pins in the
>>>>>>>>> FCH GPIO register block and **never describes them in ACPI** — decompiling the
>>>>>>>>> DSDT and all 16 SSDTs yields **zero** `GpioInt`/`GpioIo`/`_AEI` resources.
>>>>>>>>> 3. `pinctrl_amd` correctly preserves hardware-armed wake pins across
>>>>>>>>> suspend, so the
>>>>>>>>> HPD edge generated during the suspend transition wakes the system immediately.
>>>>>>>>>
>>>>>>>>> This is effectively an unvalidated firmware S3 path (the platform ships as
>>>>>>>>> Modern-Standby-only); but note **both** the S0i3 and S3 wake bits are set, so
>>>>>>>>> s2idle is affected too.
>>>>>>>>
>>>>>>>> So how did you get into S3?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> ## Why existing mechanisms don't help
>>>>>>>>>
>>>>>>>>> - `/proc/acpi/wakeup`, PCI/ACPI `power/wakeup` — wrong layer; this is
>>>>>>>>> not a PCIe PME.
>>>>>>>>> Disabling wakeup on the GPP bridges / GPU has no effect (verified).
>>>>>>>>> - `gpiolib_acpi.ignore_wake=` / `ignore_interrupt=` — only match
>>>>>>>>> **ACPI-declared**
>>>>>>>>> GPIO events; this pin has no ACPI declaration, so they cannot target it.
>>>>>>>>> - `/dev/mem` register write — blocked by `CONFIG_IO_STRICT_DEVMEM=y`
>>>>>>>>> (the region is
>>>>>>>>> claimed by pinctrl_amd).
>>>>>>>>>
>>>>>>>>> There is currently **no way, in-tree, to disarm a bare (non-ACPI) firmware-armed
>>>>>>>>> pinctrl-amd wake pin.** That is the gap.
>>>>>>>>>
>>>>>>>>> ## Suggested fix (maintainers' choice)
>>>>>>>>>
>>>>>>>>> A working out-of-tree reference implementation (clears bits 13/14/15
>>>>>>>>> on pins #2/#4
>>>>>>>>> at probe and on `PM_SUSPEND_PREPARE`) is here:
>>>>>>>>> **https://github.com/Lenart12/legion-nowake** — please feel free to reuse.
>>>>>>>>
>>>>>>>> Why not use /dev/gpiochipX devices to change GPIOs?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Possible in-tree directions:
>>>>>>>>> 1. **DMI-matched quirk in `pinctrl-amd`** that clears the S-state
>>>>>>>>> wake-enable bits
>>>>>>>>> for the affected pins at probe (smallest change; precedent exists for AMD GPIO
>>>>>>>>> wake quirks).
>>>>>>>>> 2. **A generic override** for bare pins, e.g. a
>>>>>>>>> `pinctrl_amd.ignore_wake=<pin,...>`
>>>>>>>>> module parameter, analogous to `gpiolib_acpi.ignore_wake=` but for
>>>>>>>>> hardware-armed
>>>>>>>>> pins without ACPI events. This would help the broader class of AMD laptops that
>>>>>>>>> hit firmware-armed spurious wakes.
>>>>>>>>>
>>>>>>>>> ## Reproduction
>>>>>>>>>
>>>>>>>>> 1. AMD laptop where a display HPD is wired to a GPIO the BIOS arms for wake.
>>>>>>>>> 2. Connect an external monitor, `systemctl suspend`.
>>>>>>>>> 3. Observe resume after ~1s; `pm_wakeup_irq` = the `pinctrl_amd` IRQ;
>>>>>>>>> the offending
>>>>>>>>> pin shows `wake latched` in the post-resume `GPIO N is active` log.
>>>>>>>>
>>>>>>>> On the presumption that this is correct about being an HPD pin doesn't
>>>>>>>> this actually point at a GPU driver bug?
>>>>>>>>
>>>>>>>>>
>>>>>>>>> ## Public discussion / full diagnostics
>>>>>>>>>
>>>>>>>>> Fedora Discussion (complete diagnostic walkthrough, ACPI dumps, gpio table):
>>>>>>>>> https://discussion.fedoraproject.org/t/immediate-wake-from-s3-sleep-when-hdmi-is-connected-irq-7-pinctrl-amd
>>>>>>>>>
>>>>>>>>> ## Attachments to include when filing
>>>>>>>>>
>>>>>>>>> - `acpidump` output (or note: DSDT + all SSDTs contain no GpioInt/_AEI).
>>>>>>>>> - Full verbose-PM `dmesg` of one failed suspend (`pm_debug_messages=1`).
>>>>>>>>> - `sudo cat /sys/kernel/debug/gpio`.
>>>>>>>>> - `cat /sys/class/dmi/id/{sys_vendor,product_name,product_version,board_name,bios_version}`.
>>>>>>>>
>>>>>>>> Where is the kernel bugzilla that you attached all these artifacts?
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> 
> --
> Lep pozdrav,
> Lenart Arvo Kos


