Return-Path: <linux-gpio+bounces-17437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D4A5C4C3
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 16:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9C643B722F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Mar 2025 15:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D033A25E805;
	Tue, 11 Mar 2025 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m8vM1F2w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2048.outbound.protection.outlook.com [40.107.102.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D626825DD07;
	Tue, 11 Mar 2025 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705540; cv=fail; b=A7f1jhf3UlL1zYVej/7Uilp4OxBljbycMpdJQ30f0MVL5yHLb2Jriw+1zYNzJg+3+j5zhVL/fA8cNlWmVKwbCGFTXvNHczb+gmXh1GTpGt3X5ZYnI3wTReJdMKUAtQra0r8FN0k1+pY0SNNka14RKVfnz+A4gLFNVHLRKGM3asE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705540; c=relaxed/simple;
	bh=V6+X59WF6r04bBX6jo8mN8/DtOjk+IpfzoLNufXUBJw=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ianRuwWwW6Cxc+7Zv4Ex3fn8Ef25wk4ODSUCzGiC1p6XwQS5IcepzWqsdIamyjJ2ukPwh5+PDH4TRSTYj1kX4xrcGoj4/vCZIgF+WA12yjJb7BP8+6MWGav23VdHAziH8iAK9lDSdj+xhyL5BN3WzpZEnKZKLwaV7Sg7QOExL7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m8vM1F2w; arc=fail smtp.client-ip=40.107.102.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/K/AVUyrv5wYTLiNqSef25gKE/JH/u7iUWMvSzF30on56Lxp3Hu3TIzkp8jVFXgR3zJz3GtnGqtv9Ac0kq/w/QofRxF385iWm0RoRA+MKzqmrttf0ksDJ7t0efZlz1dCkzgdPphkwFuYuSQcI+7xej34VW2pqMaac1i+eg2NLgHkKW+K1G2H3j2rwwJBVJeKsep2BdMhGMgriYnB13m71CYTEv90mfe3HIuO3o++zJIWB/3aKaUEOfE3eAGSSk4uUGsNoO7eLNyeLRv0QT2Ga5UBB9DUCuOW1GLmdIK4NboH+BBXGNhs07mRnO/DPJf/d0Y/+PjBmmtU9vECm2/kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xpk4TVVwou61IO+ZtG5XgP1evW22r+MVKEaNqnUMAuk=;
 b=iHNnipO1fPoIRcE0VUz3BclinkNiuISLSkcKEbtAf+/5CErfcounngOc6lYhOXOkWRvQGlZh9uDulpmmqYNmbpd85s4LNRM6idoIYo2bpYRK7wxjJpsw9QdZibHe7f//VY4cxCNr/8TyBDADKeJGbKqmV6BaknSp0SIC8PGg0/Qa0zkv6zvyu+yU0ey3Ay4/VW8L4AffuOyf6Ad1XraaHrIS9x4R+FC6DH3tRAEdH0owBn6i/8tqDuaw+Wj3PaeZyFdwqKly3YT/IQmZQAeXAjAIPKYQuw2tT2Q+GfJIMpXleNEiY27wVg5W/whgg8mPNo3vMLXW57nJJPk6tbD33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xpk4TVVwou61IO+ZtG5XgP1evW22r+MVKEaNqnUMAuk=;
 b=m8vM1F2wJD3WmS4Dh8Z9M78ahMb7Ez1hI9fOS0j9FmZFrJcw8HoDb2x0K2hcMIbohFXMFOBXzbnnoYyjqXCHiFtxFS1f6BCgdEJZBomCYUDGtCD1O89uITVGd1vwHXjhoDB4/McIeRs+7qjvMARRLbIzupccDdKZGcgR80+6Fd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by MW4PR12MB7142.namprd12.prod.outlook.com (2603:10b6:303:220::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 15:05:36 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 15:05:35 +0000
Message-ID: <c3a7f2af-d4af-4561-ad7c-8df1d09ec0a9@amd.com>
Date: Tue, 11 Mar 2025 11:05:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] pinctrl: amd: isp411: Fix IS_ERR() vs NULL check in
 probe()
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 dominic.antony@amd.com
References: <617f4c77-7837-4e24-9f4d-620ecfedf924@stanley.mountain>
 <0724fac1-2dbb-480d-bd30-65755f86e148@amd.com>
In-Reply-To: <0724fac1-2dbb-480d-bd30-65755f86e148@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0191.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::19) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|MW4PR12MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a3e99f5-4674-4ee7-091a-08dd60ae2d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTVqK0tqMmZ2RDVILytvN01ETk8zelY0bTk4dkZyWjI0WTZDaklhZW1zUldQ?=
 =?utf-8?B?RlpiQmpsKzdyNm9xNWlNQ2JOWnZDMyt1ZGZTM0lxKzQvT2RYN3phS3JkL09y?=
 =?utf-8?B?TFVwa3VQY0tYc0tNNnlLYmN0ZHk3QlJsT2xTcDNFZUw3b1o5dHlQcVZrK3ZP?=
 =?utf-8?B?NUwyVWdKYnI5Rml1aGU1YTlxclc1MTdhQnRXSDNqdDBmTmc2Ylp4N2VYVEJR?=
 =?utf-8?B?NllGZE4xeWtZUDZMaUxiVThGbldsSEoyV09pNThzS3NmL3Y5Rk1KNHptNWNq?=
 =?utf-8?B?blo2bDJkSytJY2RSOGlIMm1pUjJ4aUN2VUhMaHA3M2tMU1ZQYW9JenJBZE5q?=
 =?utf-8?B?cEdMU3JjSzBUaGU2dk5DSUJLOGpNSXZmMnMwamxlejN1QWcvZjB4SURpRW1s?=
 =?utf-8?B?U0NBSVBrTUhseEVyTlVzNnVOZkM3NTlMS0J2SDNQYU5KY2Y5ZlhLUkhYU1ps?=
 =?utf-8?B?Zlk3MWdiT3o1OWx3M0l6WXEwWVRvc2xwVndMenBKbjJRRS93N2hUT0pKaGFJ?=
 =?utf-8?B?ME4zV1krZFNsR0dSNmlnZWtySWc2czRxNmpWSU5EWm10dklJYlg1K1ljRTF6?=
 =?utf-8?B?cTNXWStRQlpwaWdnRHl2c2xkckp5T2RKelI4UUhaVFRiZER3WVUwbmtIQmNu?=
 =?utf-8?B?MVZiRFU2OVMyajZhZ0ZhdEZBZmo3a2dvVjA3TWg5ODVKUWUvUStNUWt6RTR1?=
 =?utf-8?B?dUFnZTcxc0VsYTRqVy9ocnIzRUQ4RWhmdVBMaXlhWWswUTloeG5VNDJ2UGRz?=
 =?utf-8?B?UHFXblNLTmZhUDVGbExER3owM29LZWY0YjEvS1pwTVVlSXFOQTZSMUtrVDVB?=
 =?utf-8?B?Sm9QT3JPRzJmWDBINnpvRVlpTGFwa0pCY2ZjZ0RrOUE2RGlwSnFBazB2Tm9N?=
 =?utf-8?B?cVROb041ck02aEpJckxpYUhES0doTmZvQ21QR2FnNUFSMUpwTWZYWTdHNG9P?=
 =?utf-8?B?d1RNVXFLY1pNb0lUb29jMU5aUVQzMkR4TmF0Nm1sNUJGWVdMWTNua0J0cHdw?=
 =?utf-8?B?VmtaTDgvVkdXeG4ybjFtZDl1QWVFTnpFZUx0L0JMeXlmcEJ1RTF4MFZUZWZR?=
 =?utf-8?B?cHdFdWJxeGpIUDQ3T2twYmZVTUE0YStjUEdOQmF2SEdTdkxxVzMwRmxjNlg2?=
 =?utf-8?B?eXJibno3aEJtVHhHa2ZnWGhLMXFUWVpuNWQ5MlpPVFNYdUJLejRhVnpSc2gw?=
 =?utf-8?B?L0dRelExMzFTN2Uwd1BBTDNLd0hBN3FuWldhSCsvbCtJWnd2Nk1UMlpHNXM1?=
 =?utf-8?B?b1lVY3dYbFE0bFYwd3RJRG1pckwwUDdrQWZTcVU4Y0h0UlhycnFZR2xrR1hJ?=
 =?utf-8?B?UHUrbzRmeFVlZTFIdzk2UFowVkZXakRoM2VOeURxK1pVL0RidnlFU0lZN0sz?=
 =?utf-8?B?Z2Y4MXNnNk5EMmFWWHY2MFZYKy8wUnFDb2ZKRUtnRmsvWlpRcGR6elVsNkF3?=
 =?utf-8?B?WGkvQ1pIY3kxS2VpU2h6anJ5N1B5ajlUOHBMZEFUTTc0aStFUUtnQmFiM3Ru?=
 =?utf-8?B?R09UbncxUERLc3RLeXM2c3JwL3M2UFozclZIUkhiRGJqTWxqTUdweUZodXpu?=
 =?utf-8?B?TkVBYTlpODd2Mko2MEZyK2xjTHg0ZmFwMUg3WkRyMnNsd3drNHNRQmxBYjdq?=
 =?utf-8?B?TCtEdGVURTk2MkwwYzl3Z1hIb0o2T1E0VzdtaWpQWjloS0V2SmJUSnJRVlBI?=
 =?utf-8?B?OTdUTzJJMGFiVS94WWdxZFBvMGcyeUhuN2pFK2NmdWNEQzFnMDdndGJhbVVx?=
 =?utf-8?B?T3UxS3hON3Q5UzJPUDN3d05LVGJ1RllyUEtlR2VETEdYQ1lGQS9qM2g0ak1N?=
 =?utf-8?B?ZXUyaTIwVWxEbTI3TmFtYUJEKzNlQldmbHp0Q3M2M09NMEpGWUtNL0JJNzdy?=
 =?utf-8?Q?0un9syEMqxLWz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFZvcFJ4dzh1dXUzQXdkbjZMbTlKR1RvRE5OUzRaU0FodGhjVVhXeGpHZzFN?=
 =?utf-8?B?ampnK0wzcG1Vb2FRZUJSb2dpazhIQ1NKVll4Snd0cElaekxwV2FvcDQ4VGFZ?=
 =?utf-8?B?VDFVRmtqSm5IbHpwU0NLQUN2NFZIZGFCaC95TS94Z201MVlEbGRPTkRuUHB0?=
 =?utf-8?B?NDFnUDRzVGR5bVZUR1V1QTNxUXFvTmJCdTgwRjdCZktQa3U2eWtJQ3ZzNTAw?=
 =?utf-8?B?dWpLWWFma0JMZTRYS2ZxUldFWU01QmpwZFdGVk9qLzV6T3RaNDM1OFlUV3Fp?=
 =?utf-8?B?czhuOFk3RTYvUXB6ZTBBdFVUYUlsKzZiZzNkdUZZam04ZkZEazA3YzhvSmZY?=
 =?utf-8?B?THFydTd5R0ZJVEwwMW1DMERCenNsM2FLRDVPZE1oZ1o3eTFtV2RRaG5VbGVB?=
 =?utf-8?B?ODZEZXduSVEvMGRXSHF2THFVZUV1Vi9wV2dqTktacUVHWVdiUTNBc1ZHLzBh?=
 =?utf-8?B?WjR2eWtGRTRlZXQ4TTN0UEViVThoZ3EraDFHL3dDcXc3cnRScnp0SWQwb0RG?=
 =?utf-8?B?ZmVRcWs0Wk9VNHFub293RkFPelkwVDlBZWVwd2tST1JOclpoVC93U2pYVE1N?=
 =?utf-8?B?Mk5QUWF5bnFKVVVuVW9kVzJFZ1JiR3hvUHZIVmVvdXovVlQ2NjUwekViaXdv?=
 =?utf-8?B?SUxzcjFkQXpOdVd1NXoyYkk5b254NjlpbWNxUWlQY29pd3VVSmJta1lkbXE4?=
 =?utf-8?B?VHpDUGhJUktiLzRZVTErU0VZL0I0NFovYkczTjRmZkwvWlUxT3ZJL05DNUk3?=
 =?utf-8?B?ak5MZGtSODh3RWlSZk43UW15MGhtTndSWGZ3QzFIaFlobS9KalpteW9SWFhH?=
 =?utf-8?B?YjlxVEsxOFBOWlBNSUpXZFBGNTZ1S09JSGFRTWxNZ2tQaUZDM2hoSXpabG1H?=
 =?utf-8?B?Q291dWVMY0NOcVI5bG5OS3gzdHJGbzluUHA2Rjg4QTRNbHpnTW92WTFIN0pV?=
 =?utf-8?B?YkFNOGJ0Z0xmVjF6TkJrVnNTWW9pVy9Sb0xVU3Q4TmhrNWtxR1B5THcxbjR6?=
 =?utf-8?B?cCtINFVFN05ZTnBDNXh2eGlHV2Q4MWJOajVJTS9UWG11UEFCS1RWRzI1aE9S?=
 =?utf-8?B?Q1B4dnlDQkY5dEtEUzZpcHNDM05saythSlZKWFQ5YjVoYzd5UVZpblFyOTBM?=
 =?utf-8?B?QzBRREVCcm1XLy8vTkorY21iYi9IOFVHUkplUmhLUGpOVGRFQXJpc2pHVC80?=
 =?utf-8?B?WG1LYnFTL25tVjJqcnNpcWZSMTNUL1BOY3l5ZGlRc2NqU2lYb1V4bGhoQ3I3?=
 =?utf-8?B?b3gvR2hkb1BmL0hNWW4xcExlTit3M2VZQmQxZG12SEpZb1NDWjJjbnlaR2Ni?=
 =?utf-8?B?Ty9ISk11L2hWZVMvb0xmNUc1QjNqZVkvRU9xeWlFeFhER0FldklEWVR2YjFC?=
 =?utf-8?B?eU1VNG9VYzZTRmNHVDBMQkh2RFBpWnhCZ3NubVlhRDJYSml4eWJoY1lPWlMy?=
 =?utf-8?B?TUV2UHEwampIYUxrcXZzQlBkQlowZVA1VmdCZGJoTXFpeFlMaGgyd1ZvOGxO?=
 =?utf-8?B?VDJJU3ZvSHY1d2dkc2JJT0RBUmMvWDI0dEZPdy9yWVByZWZYTFdhT2Y5WUR2?=
 =?utf-8?B?Rk16VUlnYTB0MWkzRTU4TVFmMWZzYmd0Q3d0OWkvam1rOHBUQzdXTVZJOEIy?=
 =?utf-8?B?WG1nZUlDVmYwOEh1Y3U0WTdtZ3l4WUxZT0VhVTRtcVJpdWdGK0h6RndnSzVL?=
 =?utf-8?B?cGRvMU5TUllWd09PYWJockRzWjBtcEpKaTJmSWxmTkNJMGlpNjd5U280YXpp?=
 =?utf-8?B?MjNoY1ladDBldmNWbE5iR1pjajRZanNoRFVVZS9Nd3VkUUNHTGt2RFFnaDlY?=
 =?utf-8?B?MThjTEZKdFFmQU8yUGZOUVhVaHpSS1hsUTlMeTI1SWdXK3BYeEsyMDBNMmdO?=
 =?utf-8?B?azgwajZpL3pBTlEwbHdIS2RTUHZTNGNPcURrdUI0NkNiZzNCeTErOUtVMDEv?=
 =?utf-8?B?dGxQMUZ5UlV0OFJTbEs2MXF4WWh3T1gxcnA3TWF5WjVsTnhha2lSbFJHUlpm?=
 =?utf-8?B?YzNxT3Y2MlF5Y1dyRVdjTmlVb3VobThIdmIwNGgvbTljR2lGTkJnd3JUSnky?=
 =?utf-8?B?blUyaVoyZ0RJNmxZU0F1UVRXMWZ3d3h4QlN1Y21iYkl1RUwrSU5mQ0EwYTRS?=
 =?utf-8?Q?w9a/f4hBoziwcrI0uLgSeXOpa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3e99f5-4674-4ee7-091a-08dd60ae2d0f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 15:05:35.5164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zK7of0eU7ZZ7PBWirWW2g/e8HrQ262k5NCHONaNL+gnVpcQQhdvdcehy0snd0IvMuBe9dr2fnKQvvGe0qUALw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7142

Hi Dan,

Sorry I missed to add Reviewed-by flag previously.

Adding it now.

Reviewed-by: pratap.nirujogi@amd.com

Thanks,
Pratap

On 3/10/2025 12:35 PM, Nirujogi, Pratap wrote:
> Hi Dan,
> 
> Thanks for the fix. I have missed earlier that PTR_ERR() casts NULL to 
> 0, which kernel treats it as success and not valid in this case.
> 
> Thanks,
> Pratap
> 
> 
> On 3/10/2025 6:52 AM, Dan Carpenter wrote:
>> Caution: This message originated from an External Source. Use proper 
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> The platform_get_resource() returns NULL on error.  It doesn't
>> return error pointers.  Fix the error checking to match.
>>
>> Fixes: e97435ab09f3 ("pinctrl: amd: isp411: Add amdisp GPIO pinctrl")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> ---
>>   drivers/pinctrl/pinctrl-amdisp.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/pinctrl-amdisp.c b/drivers/pinctrl/ 
>> pinctrl-amdisp.c
>> index ce21ed84b929..9256ed67bb20 100644
>> --- a/drivers/pinctrl/pinctrl-amdisp.c
>> +++ b/drivers/pinctrl/pinctrl-amdisp.c
>> @@ -183,8 +183,8 @@ static int amdisp_pinctrl_probe(struct 
>> platform_device *pdev)
>>          pdev->dev.init_name = DRV_NAME;
>>
>>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -       if (IS_ERR(res))
>> -               return PTR_ERR(res);
>> +       if (!res)
>> +               return -EINVAL;
>>
>>          pctrl->gpiobase = devm_ioremap_resource(&pdev->dev, res);
>>          if (IS_ERR(pctrl->gpiobase))
>> -- 
>> 2.47.2
>>
> 


