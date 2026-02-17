Return-Path: <linux-gpio+bounces-31756-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCUBCVxtlGkEDwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31756-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:30:04 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB114C93E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 14:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09D5E30073E0
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB8036B048;
	Tue, 17 Feb 2026 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jDTLGF8m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4A136AB72;
	Tue, 17 Feb 2026 13:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771334989; cv=fail; b=jdntPcgH1zPII0Gx0Hap9sUH8bIQYkxUcwHPRQETOC31JjmIPaTlfoZ3b88PeJcpleZd58QzRsqyoxvggVpkN38C/rIprcKaqnHhREBLn9OsBcXOtJGylJj9nM+DmeuvTpn1HJ4rD7XRHOgRi7FuJldwoY8LwwaphSJ7zzT1BFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771334989; c=relaxed/simple;
	bh=giSroTm3LaxXXXExfLTyVwtNeUjOWDWziWlXKSk44Ig=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FEXSJnF6JWboBi4vWa8COGwbO8OfN0ATwQ4K9hPCPw252ruThXetMN2uVNftLn1uCZZFWMKMCOwtUa3QnnsAbIc+gVa5J3A/s2/FS3k+U6TeN4HGaqkVy0KXKid8iXSHDHQ0dHTe1c8KzXcntz9MGNz3/97cwhMyoexLX/Gyjjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jDTLGF8m; arc=fail smtp.client-ip=52.101.56.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ldvnkvYAGMgWzBYkK+eQLRLnGaHsiHWuTBeA/a1uJZqssOQrN4M3hUAZtCVyGuT9POOob5Al+jqBeBSFUTk8oUwZJU80RJWoS4lCm3lpC9XWmgbrHD2CIedMVLFCJE4eNGoEU/z0ZC62IIIAIiwh3xeEmROsmJnsNqW1atWq/iQnA3kzykVzEVQ+Su+PTFo5a1foEDWck9m7KKwaU5dFWJZBVU/hyGArgEL7OGW+/b6EHa9rnshJHvisAVgxZ6Sp0dQVVJYetSZLlivSYnbIynhC795R0bgK2t3pr7tFT9vGmvFtureHAavADu516wIlx+hU3sjYI4nLvBO4LKKG4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhYJZs80uu5KUWS6OECjHX2fSgmgNq5OOPKAlLlMG+0=;
 b=MR7ihmQi8bWKQIVK/KZGRa3K1NaQAoEin+ZqjPGr3AZdc+SmsGVLNXku8bSHMIm3mOL6b8TXrkWe7BlH7l3GNJWp92Cx1CG1VPYliePyXeuI+meaa3mHvll+pTCX23xTa81cg0+GkLX6p07iuGPYpBcIyYMCtU/yllCLWOn2lVWO0yqjYI/Hfo3Q3eUYcdpPg3KSGmxPAbPEEtZPKtyqBweFpDv6+YlftJNVYrwWtg8FFdTCKSu+g2pJBF3b34Hd1OekWcrELdsZOBRZ84nX8xy4JhH8E/sQhFR7UU1+CYwgeic5eSg6c+KL/5LnJYNIJ52CqM+awEBkE0NqWJcy0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhYJZs80uu5KUWS6OECjHX2fSgmgNq5OOPKAlLlMG+0=;
 b=jDTLGF8mZe/u61laxUfn5Jwt9IMS16bB82vYjXFXmq0tfijhxxLi0aUwCSxgISMdj6yilaelk/CFlYW9cN1GPZVp9Ous6pzn1PdfjqkhNGEpjjdcKqLoutAINgp3wrXZbDNw804fPnOc2p0AmcImYxPnAya/wczb+iRqFeVCPs6NS5UbI5iQmDLWsnrQY8i2rblbfiS8TOghwExodATcVxLJogszs75vbixwieeRNi+5pNchY87J/zzfwCtrl3xu/x8r8ZozvOzCFszxggpcBHp3HQ6/iLkYlw28FLYLGPhX5xbRzMvVWV2wWDy7i/KsO+ct8FNGFgJ2rK7Z9VxfTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH7PR12MB5997.namprd12.prod.outlook.com (2603:10b6:510:1d9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 13:29:41 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 13:29:41 +0000
Message-ID: <0e0588c6-3c5e-4458-bca2-0e6ba935c7b5@nvidia.com>
Date: Tue, 17 Feb 2026 13:29:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] gpio: tegra186: Simplify GPIO line name prefix
 handling
To: Bartosz Golaszewski <brgl@kernel.org>,
 Prathamesh Shete <pshete@nvidia.com>
Cc: linusw@kernel.org, thierry.reding@gmail.com, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260217081431.1208351-1-pshete@nvidia.com>
 <CAMRc=McfztA2kf2S_4R8KYVnVFvAL7x0n3_O9BHh709L8Op9Dg@mail.gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <CAMRc=McfztA2kf2S_4R8KYVnVFvAL7x0n3_O9BHh709L8Op9Dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0022.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::14) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH7PR12MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb4db74-f6ff-4e22-da90-08de6e289b31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3lHT3RQYXZYVmFYUk1YNStzT1pjYmcreVo2aURCZXR0Y1l1VjQ4NjQ2OFp3?=
 =?utf-8?B?RHlhb3VqNmJZSFBmajV4WGF1a0lkV1QxR3BvaGRBWmZYakM5aFlaR200OGpT?=
 =?utf-8?B?Q0grYkZQZXBqdlBlYk9EZGEvZ3ZseWVnUE1WTThVYnNvWm1aSFZicmtrUTlH?=
 =?utf-8?B?bDc3RGJudGZVdURXbWNLTk12SXNyU2xlenhUdmtLSi80UXBlSzBBZXpGb01w?=
 =?utf-8?B?VUNwdDJQa2dvcnNrajExaDNxRlVrVWpGdjRwZ2pXek9tTDRuK1RDN25kYm5n?=
 =?utf-8?B?bDJFd0ZNRjFIcDNvSEo3b3BZVjJzcWxPV3hYWGcyckRicU1TOGprejNFMW5B?=
 =?utf-8?B?SFAyNU9Ba3ZzY2FURXRmN2l3RUFHSGhWcUpRM1lrRnNsMTR3ajhIRlJUdURt?=
 =?utf-8?B?ZVhKWCtBbXFnNEZLSEJRMFFmL2ZnbGhiTW5KNW9uWVl5Y3FSb3M3WGlHT3hU?=
 =?utf-8?B?UEpBOVljdk8xQUhtTEJSMis0TUpsRWdzbTcxWGVyNXJnU0dpU2RET24vckNt?=
 =?utf-8?B?Y2pUTGVhQkZJaDY5djcvUGZ4U1E5SWxrOXdNZVNQa2UwdWNvQktEVjR3U2lp?=
 =?utf-8?B?OTNtZmV5eVdwOTFaNTFXamwzbjJxaW5KQ2FaTU1FZ1hodjZXdEVYbFNaQml2?=
 =?utf-8?B?bGRHb1ZQQmtrcWdKc2dRdjZZTXFWdU9xT2RYdUtJd2hCQUV4SkRtbXFHNkpY?=
 =?utf-8?B?TUZoMktYZTZDSGFCYWV3aHRYWG5FSUJMMGlNRXVCTW9tU29aVDM4UGxWRmJY?=
 =?utf-8?B?L014K0RJRC9XQ2N0MmZMY3l1Q255dG9PbWx3aktMdlFFN00rTEZmQTVqQ2lI?=
 =?utf-8?B?NzhZaEk1ZzE0Yi9uT1hUNy93cHlsTVVzVDFqQ2VEUUdzRThLdFFMOGdrWE83?=
 =?utf-8?B?U1VRTUI3Qk9PSTZycDF1R3pkMW5BWjJ4MXZjalNNS2tVM3R1QzJ3WENra3M0?=
 =?utf-8?B?ZDQ2NXdhQm8vWHJWR3luY2M4S3J3VC85MnN4eXViMmJDcHBMMllDSFpldTJm?=
 =?utf-8?B?cFdVYTRvY1JvSW8xOWZBOHlQeWFqbmJQa2hSMzl0K2h3aXI1VDRkSk1lM0ly?=
 =?utf-8?B?a29vOXNMNnEwdXdMb3FJbUc1aDRKVHVLTFpFRnRxcUhPTlAzUmsxSjFjc1VV?=
 =?utf-8?B?ZXRaM09mWnZVeUVneG5NTGpvclBENnFDZks1ZDFGY1I3K2tMaTZwMitmTlZY?=
 =?utf-8?B?Ymxzc0N2TkFUTlNWVmhCV2hETUQxRVpuTzFuZHJWMytuWVpLKzdzRXFTa2Ur?=
 =?utf-8?B?SXVYZHIzSkZFNVRRbitlN3RSbi84eFBpYzF4MU1OQ2dDa3QyeUlZaHNiamR2?=
 =?utf-8?B?VlBCKzU4L2ZERHl2VnJnNmlSZGNSTFdNQVNtS3d4L0RkaHM1ODlYazE5TElJ?=
 =?utf-8?B?QnNKeGVLeFBMZmNXKzJxR3RjWEd4bWpVV0hRaFdvcEh4U2tYY2VWaFAxUitj?=
 =?utf-8?B?SGhXVnZ4WUZLNXg3bmNxUGxURDk3VXhkN2svRjlkai9nYisyY2VhUkZRVzBS?=
 =?utf-8?B?eWd4ZHFaNWk4YWtXZjR5K1NKRyt5eHZZTzV2bURodWtYRGpBeEFYUXdieVpX?=
 =?utf-8?B?YUpCUUlCY0U3TFUvclRmWVV4SFF4ZFFSbUttWVJiMWVDbHZicVFFcEtZOTV1?=
 =?utf-8?B?RXpVUXByaUEzclRkSDVLTHRFcUoxUitOM0MzZWtxSEtyNDVDc24vZlRmYXFw?=
 =?utf-8?B?MjdiWmhtZ3psVlh3YUowSlQ2SnkydnRpTWpqcmVKRm9TeGF3Z2Z3M05RNUNW?=
 =?utf-8?B?MTQ5cU95RThUTlRNbVJ0Q3FZMGJoVTJPd2hDUFJmeEphZnBDN2VkQVJGQlZH?=
 =?utf-8?B?YkJsZ3JadUI2TWU5OHF4TVE1RHFMZHpWOFNFZ1VPcnp2Z0FtTHFmV1ZHbExl?=
 =?utf-8?B?SzRualN3bi9jNmxpWjF2VXpscUo3MDhuSlZML3RWa1gyOUZGb25vbmpPWGRU?=
 =?utf-8?B?OUtUQmxCZGVNTE9vWEhFcHg1TTRWQ1RYbXk2OHhQNEl1SVJxTUt5OC9tTk53?=
 =?utf-8?B?alU0SWsrRk96YzUxZlFGV0w3U2VBNnhQckNOR2ZieHd4UWJyNFA1Z3RFTUJK?=
 =?utf-8?B?eGp0QSt5OUN4MzEvMDF2MmtmQ3VPOTBILzg3cHExUSs1YnB6TUsrTFpwMS9S?=
 =?utf-8?Q?7Pz4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emRBT3BDdjN2MGNjNitsZm9uQ1ozNytCSE04MkFiMWNxc0s2WSsxUHAwcUVx?=
 =?utf-8?B?Mkw2a2FCcUxZRENBUkRwZk9tVEw3OE5oZGN5ZHpXUzFncyt4RXUrZUd5K3l4?=
 =?utf-8?B?TTVqYkJQYm4ydHUvaEwrcmtuWjJjUjFNVkorMnBoWHhBSHczU29wSGVjTmJH?=
 =?utf-8?B?ajVseU9nQkp0a0QrdXRaQUxwb3pIS01nVFFSYVpOanJUdVJ4WGNjalE1ZkxR?=
 =?utf-8?B?NE5CUU5ZWTNNeUl1MzhLeFZxbkxPQ2tBNlE5b2dwT25rN2dZM3VGZGJYdlJy?=
 =?utf-8?B?YnNZb2k1TDY4T2grYi80SklUOVRjcnZGUWtLMTEwMFp6MXdQbXB0akluOXZP?=
 =?utf-8?B?a2c3VU9ZY2lBTW5ldnBCTGNMaTNDeWVBL0hiR3ZoUStwVHJRVUs0TlJQWndU?=
 =?utf-8?B?VFcwKzlKeHI3YVlaWEZkc0Y2LzFFdnlDRk1KeGlBa3RHb3JyVnY1SU9pcjdj?=
 =?utf-8?B?clp0QWdHTm90Y2t5U0o0cWdNR3lVN2ZBTURjeWpQOGVzU2NNY0tEdVdFRG1W?=
 =?utf-8?B?SXZOSWFIcGZpbUxqc3NTNExHRUUrN3J6ZWFOMFZnL1E0VGNQNTlFNkZFLzEz?=
 =?utf-8?B?anRoK1ZXVU5jZW5NRnVPK2UyZE9IN0ZPVWlPSm1rd0VXbzl5MXNmZlNacUlT?=
 =?utf-8?B?TU1XaXJwd3pwL3BzbTJFSzgrUG8vSU1nZ1dsUmthTENxOXJrNUJRZUpHU0FI?=
 =?utf-8?B?ZEVJS3cwY1phNGgyTVdHQjlzbzY3cFVHbnR1Mk9TUzM0RmxjcGhLSXNpa2Uv?=
 =?utf-8?B?NUs5eHZJTUhRaW1Kd2ZkaDJxL3lmNzdQbkY1QnF2a2M1VVl6MUJWTU1WTVJC?=
 =?utf-8?B?UU5Fem5DaTVhL1ZjREhOQUtVTnh6U2dQcEZGS2FCbUtkbGRteXV5TThzSDdE?=
 =?utf-8?B?aUV5NEJQZkxHVHZQMytnOHFocUlvZ3k5ZDcrbFRoeHlMSThyNU1kQU91R2Fy?=
 =?utf-8?B?dGFUbjA3SGczU3cwcjR6MGZ1cytnd1lSTjY4SkdtZGo4QWdNYU52MFl3NFVE?=
 =?utf-8?B?SUJGeTl2U1lhd0tVb3ZkU3RUdzYyTnBiRmErRFJIVjBVbE92aVcrYjA4SE9q?=
 =?utf-8?B?WUhkQlptd1I4WTFoUVhHb0F4dHlGQThZRGpyZU1RT2VpR3VITkhKTWRTbS9h?=
 =?utf-8?B?SE0yYkVtL3hWZ0V5dWFHVFc4eUt2SG5VNWt5ZlFWN1NldlN0T1ZpSGxFUzhI?=
 =?utf-8?B?RGJrdUZHWTVLc28yUzc5UWthbVZMZmRtZitYQkVzRmxEUUp2VTZRVmZRNW5h?=
 =?utf-8?B?RWRuNEtKVHNmcmg1N3IzcURueVZMeEcwczVJT0Vlc1ZXYUFtNk9rWEtDVG11?=
 =?utf-8?B?UHRGQ0N1bXR4dmRCRUN4WGlhTmRCUWU4bnNUK3M3Nm9kcHdNaWg0UmtmY1lT?=
 =?utf-8?B?V2FSVTFtMnQ3NytTOWc1WHZBdGlhZTZqYTNVWEtGckExSHkwUTFJSy9ENUdN?=
 =?utf-8?B?MVhFVjVxQUNrVk4zOWhWU3hxalBVa1puVjZabWZEV3hSVVV3cHZadnRaUE0r?=
 =?utf-8?B?dnFycll3T3VJbVo2NGo2eDhIcXJTU2dGSGhCNnhxZU5tb0p4aFNtSENrc04v?=
 =?utf-8?B?d01Xc3RJVy93RkNuUjZVaHZWT01EeU5yWnNNOUJUNjEyS0R4bXJpTktGRDQv?=
 =?utf-8?B?ZDMrb0p3N1dTN1oxZ0FrWmVMV2hQRnJTai9DcXFOY2VZNUZoWjNlVUw2aWc4?=
 =?utf-8?B?VnAxTWJQVUdVY1dJN2JCNFpOdHpFelBScTFiaFZpWDZ4azBpWngvaTkzSG52?=
 =?utf-8?B?WUZtQ3lSSjRLS090QWdMdG9yaVZWdUhyV1Y3TXpQaFpUSkV0ZW45eDNMNXZk?=
 =?utf-8?B?K1p1U2hxeS9ZMXIrUmJGbzdrMmJNT1c0Y1FkMEJxYWVaTFlyc0RWVXZuNHp0?=
 =?utf-8?B?NjJQa01aRnBqTEVacnhCcUZBMk9FQWwvVFNlSGRXZGZZd1ltNUFpUEg5WmRT?=
 =?utf-8?B?dVZWZXJ5VStza09lWlpXcnQwN0FMLzQyZnZMaFRVZ1VvTGdvR09pTTlHV215?=
 =?utf-8?B?VXRFaGlUc3M5bEI5Q3YrRFdtYUdKSDl2RHhjaDRyTUxwVy9XQWlONGlNMlFq?=
 =?utf-8?B?SlVUbVpPK25PcFlwMXlwVFh4eVA5elhvaHNveVdlbW5YVjZVVVpKUmhKZHZF?=
 =?utf-8?B?bkRtNiszUVRoTGNtRm1vYjlUT0pxblFucFBWOTZCdFlIN2RoSlBPZEtjSHJN?=
 =?utf-8?B?QlFLWkFjeGM4ZnVjYWR2QmVRS0ZXN2RUVFgwV09NTDlRYWdiVU1VSlZIamRN?=
 =?utf-8?B?RXFyeEdQYkRXckVqY3lkeWFWb0duLytyZTQwdzI0VTJZL2VsRXVSNnkrRHhl?=
 =?utf-8?B?UUZqaWNLZTBXbTlCQ2ZHQkxkRC8rMWxZUnNjYWo3L1p0VllDbTBWdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb4db74-f6ff-4e22-da90-08de6e289b31
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 13:29:41.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6cw4Te5n8nC5k3SKCUuzfIAKEgN0kRPXVUd6JP3FdPzJ8+A34z99q4Zf0vbdC0SDsWIxsoF9Llf6bO1oMTfcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5997
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-31756-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: D7DB114C93E
X-Rspamd-Action: no action


On 17/02/2026 12:17, Bartosz Golaszewski wrote:
> On Tue, 17 Feb 2026 09:14:30 +0100, Prathamesh Shete <pshete@nvidia.com> said:
>> Introduce TEGRA_GPIO_PREFIX() to define the Tegra SoC GPIO name
>> prefix in one place. Use it for the Tegra410 COMPUTE and SYSTEM
>> controllers so the prefix is "COMPUTE-" and "SYSTEM-" respectively.
>>
>> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
>> ---
>> Changes in v2:
>>    * Split the v1 patch into two; this one to simplify prefix handling.
>> ---
>>   drivers/gpio/gpio-tegra186.c | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
>> index 9c874f07be75..f04cc240b5ec 100644
>> --- a/drivers/gpio/gpio-tegra186.c
>> +++ b/drivers/gpio/gpio-tegra186.c
>> @@ -942,12 +942,8 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
>>   		char *name;
>>
>>   		for (j = 0; j < port->pins; j++) {
>> -			if (gpio->soc->prefix)
>> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%s-P%s.%02x",
>> -						      gpio->soc->prefix, port->name, j);
>> -			else
>> -				name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "P%s.%02x",
>> -						      port->name, j);
>> +			name = devm_kasprintf(gpio->gpio.parent, GFP_KERNEL, "%sP%s.%02x",
>> +					      gpio->soc->prefix ?: "", port->name, j);
>>   			if (!name)
>>   				return -ENOMEM;
>>
>> @@ -1373,6 +1369,9 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
>>   	.has_vm_support = true,
>>   };
>>
>> +/* Macro to define GPIO name prefix with separator */
>> +#define TEGRA_GPIO_PREFIX(_x)	_x "-"
>> +
>>   #define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
>>   	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
>>
>> @@ -1388,7 +1387,7 @@ static const struct tegra_gpio_soc tegra410_compute_soc = {
>>   	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
>>   	.ports = tegra410_compute_ports,
>>   	.name = "tegra410-gpio-compute",
>> -	.prefix = "COMPUTE",
>> +	.prefix = TEGRA_GPIO_PREFIX("COMPUTE"),
>>   	.num_irqs_per_bank = 8,
>>   	.instance = 0,
>>   };
>> @@ -1418,7 +1417,7 @@ static const struct tegra_gpio_soc tegra410_system_soc = {
>>   	.num_ports = ARRAY_SIZE(tegra410_system_ports),
>>   	.ports = tegra410_system_ports,
>>   	.name = "tegra410-gpio-system",
>> -	.prefix = "SYSTEM",
>> +	.prefix = TEGRA_GPIO_PREFIX("SYSTEM"),
>>   	.num_irqs_per_bank = 8,
>>   	.instance = 0,
>>   };
>> --
>> 2.43.0
>>
>>
> 
> I'm perfectly fine with patch 2/2 but this one is giving me a hard time. What
> are we really gaining other than some questionable obfuscation? Keeping the
> dash in the format string makes more sense to me and if we ever reuse the
> prefix, we'll need to remember about it trimming it. I would drop this patch
> and keep just 2/2.

What we are gaining is by adding the '-' to the prefix directly in the 
tegra_gpio_soc structure, is that we no longer need the if-else clause 
in the code to add the dash if the prefix is valid. And this allows us 
to use the ternary operator instead.

If we drop this patch, then after patch 2/2, we will end up with nested 
if-else clauses to handle the prefix and multi-socket cases.

Jon

-- 
nvpublic


