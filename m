Return-Path: <linux-gpio+bounces-10609-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B37E98B9B0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 12:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD72284500
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Oct 2024 10:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A6CC1A00EE;
	Tue,  1 Oct 2024 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SSOKzR7e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73E23209;
	Tue,  1 Oct 2024 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727778531; cv=fail; b=TId0ST5c5snMGACfa991scREfS1pxa2ynRwJ0GQQhB5Fbmbm31Nwh9XXjfPhM1mpNcFm3MFuOiB4H7ulSGZVxLRmAsJyPVui3YBpzo6lfdmueDcuV0Ud1e7Vso/rV0aoP9RMznxL/+uCbXFL2TytAvKKJnec4LpRdogm+DdDyZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727778531; c=relaxed/simple;
	bh=fcwjaXlDiJyl/IFkuMXDbW+oSKq5dGkgzYpNu5K03ms=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pIKNJoVdPgUJ8dfsFFxVDClBgaNK1l86cB297rA1BwaB+JX3EaLwfW0x7sXZ0oi9EFQK9yu6HqYMq7OCPeL9V2aT1b+z9WmjRXhMWSUJ5zr1atnxmz6HzRHkRqXgWw/i8rNoWxkuWB6z4DIjn85XWlIUVIItjrGjayR/NO+q8sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SSOKzR7e; arc=fail smtp.client-ip=40.107.236.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ct1FYpsbyc2NTDJQGj5KEe6CSVvy44UDGUBgMyd1o+BJ0ErH8MTvPM23xd2j7wj8ahtLgkH+z4qaJYrjNoJRauJto8eaJB+rCwKw2ydVXPWJ4Qbwd/SRgBf+LG9GHjVf8EY9x/cNss1dKwxMVFC9FakEQH8MJhRxhYcjWuEatuikX9RpkCkZepliN4eFPGoyuR8FjpJD8dzFOVFyRN90UAODXYNWxjhMgPenizGZrub3yHyHx9vnh2U5K7hGX3cOuZvrL6ufNFmm+1doILM1endwsVw0kr7F6z2e7jBzAGiPRHNt1tQWnD/a9VGL0XQesM1w5Qn8XfExLpLNqft0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7r2Mb+kvAwRKrP2DgaZv1eivO4e3dnLguq5mI4esS0=;
 b=ZTBI1lnqJ3qVgrZItii47tQsyQaLB9bI5gVnab2ZzbogKKCfILYZMrhNd4XPMzKuQpfbC2jEU1LOh3+IKcQlc7njNz6+/qJNpDYjKw9pBdHxMHJqqBLQMkK0OIRlujs8S8+QcWL2zbO+c2dJQ7w9SW6wcH9rC1YWzzMT6Qe5khTBfjMrHvlVvU4HCpoDP9kYgpxfHvHEpLKJ568M3cHOgDKTJv2tqdWDbBTad2+62VpdupU4bRBAwoj6mK1tUU2FWf/zZEJRmWJnYtVNpr2Cm5+qsiNh+VtYqVki0cyLD9zRdmQYrWm/f6kDekfZRIvMS88T2xL9snujs+UNEpGydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7r2Mb+kvAwRKrP2DgaZv1eivO4e3dnLguq5mI4esS0=;
 b=SSOKzR7eETrSI9lK6bRTqfU/r47W7/ovqJqzMNviu2qtEAxv6vGqoGgt7Tbj8RIvrAb4zO4xqGFqrgIVLTZ1beIHIYBbBe58RUw14Dfmf6m05F4rDpfNlBe1cUHtDDXqmV/9DCGkIx/id5bTuPmoLbYal1qCbW6qybSElkCuflc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7)
 by IA1PR12MB7662.namprd12.prod.outlook.com (2603:10b6:208:425::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Tue, 1 Oct
 2024 10:28:47 +0000
Received: from SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899]) by SN7PR12MB8101.namprd12.prod.outlook.com
 ([fe80::fdb:e120:f99c:c899%6]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 10:28:47 +0000
Message-ID: <fe3669cd-99a5-42d2-99af-acbe28485577@amd.com>
Date: Tue, 1 Oct 2024 12:28:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: xilinx: use helper variable to store the
 address of pdev->dev
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
 Srinivas Neeli <srinivas.neeli@amd.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240930144804.75068-1-brgl@bgdev.pl>
 <20240930144804.75068-2-brgl@bgdev.pl>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <20240930144804.75068-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0226.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::47) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8101:EE_|IA1PR12MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 926695f9-28ac-493c-88a5-08dce203cb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHY2NE9YLzY3N2JGd1BuN3JYdjIwYUc1MmJENDVsS2ZTd3lzazNjYVBsMDdm?=
 =?utf-8?B?ZDdHZXAxRjdMMnpRbTZQY0wvby9NRWhQQWsrcXBqTW5lcVNkTiszVkc2Z2xS?=
 =?utf-8?B?YTFCNGVrakZrdVlnMzA3bmVITllFSXRNc0tGc2ViNUw3Y3Z4Q2NUQmJ1Q3p3?=
 =?utf-8?B?OEN0UDlOeHkwUm1GVHJKeWtqZUZDeHJWSzhzN0t4ZWRSUGJkUml5YTZXaGRS?=
 =?utf-8?B?MDRiaUdBTERSc0RzMHZuWHNubm5ZYjhtU0tpME1TRjhQRjdUR29wQ1ZST1ZY?=
 =?utf-8?B?bm1sbm84b1RmM0hmeVl3TkRubkdybUR0TnBBQU1UWkt5ZkVFdndlaVE1Rmc0?=
 =?utf-8?B?ckZqeGdNQmJNWkVCQTU2cmdBellycUgyeFVwNUo3T0oxVjQ5YzFCYU5LUVFx?=
 =?utf-8?B?M01pdHcrU05VZXN6WTJRL0dMQjVCVFI3Wkk0QVcwLzdaMmV1ZGdpRlZEdGRN?=
 =?utf-8?B?cFhzWjdzaWdxQjB3QXhyUE5DVUVLczV6L3pqYUtNMXZGd09KVGc3LzlNMVRm?=
 =?utf-8?B?c1JRYWIyc0lYY2h5RCtwbmtQbFFhYjB3aHBFU25RUkNONjdaNlBvaTk4bW1G?=
 =?utf-8?B?cnR0cDd0bSs1RlRZRzgrWW54cm9OTHB0eWs2emlyV3A3MXkrQzdQY1hSWTJU?=
 =?utf-8?B?eVczM0ZCRHJXRWdjY0VicnJmc1h4eGxxd0xqNU0vcGRRL1J3VFJSQmlIc0cw?=
 =?utf-8?B?ZHZlVGt5Q0IxbS8wQ2dzS1BrRzJNRW9JRkQvTVF4Uk9SOUFQM2hlSTJ5eDVp?=
 =?utf-8?B?aThvcUdzRTgxcVVpV3ZxRFgxTGxCR2lZNSswREVkYjFMdkQzYm80Q2l3YWpT?=
 =?utf-8?B?b2lSQ3UrTTB6NWpPdHVndHRpVHoxN2xXdG0ybC92bXMzS3owWEwvWWhBZmo3?=
 =?utf-8?B?YVRLbzFiYnNDRWVSUkJTL09tVFZFSE9GMWx3Yytrb2UyS0pQeTUxaGdIMnRE?=
 =?utf-8?B?M0ZKallJWGplUXh5N2hBY0I4dzVieFZTcXphc2pPbUhDNEpwcmFvblZzb29H?=
 =?utf-8?B?blBCVWRjRmJldmEvOU9JQWd6RWdUeXl1UFNnbm1wVzAvU1diRkZHQjZLVXJS?=
 =?utf-8?B?KzFManlzMWxUaEdpSW1iVkVSb3hzNWsydVJMU1d5Z1lHVElvcHVXRUhwQ0l2?=
 =?utf-8?B?V3ZvV0tiaSthaFNjYUVWbFJuZ0lSemVwRkVrVlhodWZqMjBnM1lYTFJGd0Fv?=
 =?utf-8?B?Y1gvTFBOK1hyRm1IVU9Ec052Z1g3OTZleW04dDJ0dXlOVm9Eak5MOXJSMTFp?=
 =?utf-8?B?dHJhMmdVWGhaOHNoZkIvam9wZUFoNkRVZks3QUR6RFhpUzhmcEhiclUvUlBz?=
 =?utf-8?B?eTRaZm01YTdwSEdnNVc5ZklXaXZwL1QwY093UG9oUHlUWXhVaWhLQjlPVGs2?=
 =?utf-8?B?MmRacXdjMDZLREsxTUxzMWJmWk44dnVWeDRkMTRLY2lLdWFCdGRqS3RPTFZO?=
 =?utf-8?B?enBjbmR4eG16RmRFbHdhbGQ1SUJkMFVLSTFlaXd2Q3RLN0k2ZmNFZXFJNDBT?=
 =?utf-8?B?aDFMVGgvc1c0OWJXV2ZvT29KblpyRG9KTmlEeWZFYkppdlFsQTBsaVVQZjFx?=
 =?utf-8?B?WjZRT3pJTm9kbTdhUXE0UWJuL0NqZWcrVjVwTG1semNRMTBWbGFaZWpFS2Zh?=
 =?utf-8?B?cnpwdThpR1VrUEtJMXh3Yk8zOVYwdlFRZjNuMTVKYURocE0zUC9LUFBsNG5h?=
 =?utf-8?B?WXQvb0xka01VTkNhcFd4QU5FeHhnZmFNVmJKVThsL3EyNWFwTUV3T3E5TVA5?=
 =?utf-8?B?c09SQVcvM0RaN05LT21wc0ozVTNHalVKaWdjVDNpajUyL3ZtWm1vNTRsMndk?=
 =?utf-8?B?RlNNU001OHk0TWV5Kys1Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEZzRjhXdmEzeTcvQzc1WE51UjJEN25tWTRpb3BhcVdhaXpEUW92dXVZT2xJ?=
 =?utf-8?B?ZTFUUlZLc0ZaRzN6TWw1eCtnakg2eDNCZUIwVE4xUVRhK1orVW1vZEVlMGhL?=
 =?utf-8?B?d3JlY3EzR0V1eCtJUWVvblppQ3pidWZ1OWU5K1ZkdW56eDVhWU90UlI2cGp1?=
 =?utf-8?B?aE0wVDJITFlzT1JIYTFNRG5RSis2ZVI0WlRhRUZkQktoalE3R3pOVWJpamdS?=
 =?utf-8?B?REFFQnQyUTZsdnB3K0JYWDRKRFZWRVlNYUhhL0xOcDBGQ2NXT3p1c1Fsd3Fl?=
 =?utf-8?B?eTdnRUEzRkpRbnIxejZUNWVrRm0rc3cxQjhrTHUyN0Z5K21WNlFsNmo3OU1B?=
 =?utf-8?B?QVRwaXBscWt0TlVQVGxQVzkzWmYyQzBZN0hSNWVYYVBoMWVvbkV3cnA0LzZv?=
 =?utf-8?B?TzJDejFHSnYxb0NkTXFCRGxvLzNHd2JVNGNrWE5sL3pIMno5TXJ2VmJNNTlC?=
 =?utf-8?B?YW94RWtHMTEyWlRtWnpFbzZuMEFvL2gzWjAzRnFzUUJiaVNwYmtBcUVKTCtB?=
 =?utf-8?B?MjUzMndYOVdIT3paa2VXY3NJcTJ1UDVCZ2t3QVY0bUtrcXZ5Z3dwOWxCVlA3?=
 =?utf-8?B?M3kyMXJ0Tk1zemRxRXlwVkk5Y1hlWllSSnowY3F6aStwY3ZhdUtiM2pFYkJZ?=
 =?utf-8?B?WTl2dmJ3L2QzVHltT3ZpL3pIV2gwSXBLTnowc1JYSUYwaHhLWS9GSFhJd08r?=
 =?utf-8?B?dmxoS1lDMWpkNmtUMlFWNjNUU00wUXJIcUlyYWoyUGk0QnFGMXlQd0dleHoy?=
 =?utf-8?B?YnRBM2FQcUxkUHJ5bVI4R1JjUmJqWTFRcjBzQ1VlVzBmYUJWcllCUUkwRzYv?=
 =?utf-8?B?cmxoQ0RiRFJzU0ZvSUpkVjQzdHpjUXJHMlliNU1xc3JOR3gyWUZJbW90MXl1?=
 =?utf-8?B?SUQ1UHVrbDNMOW9TTUNmOGtxWDk1d2pQSGJSVWVsMXFjT2l0eDBTK3RIankx?=
 =?utf-8?B?cnNMNFdUUW5DTGplWi9nelVsUFZ2Q1BaQzI1V2NHQ3ZDZVJqVHF5V3ZJUnRK?=
 =?utf-8?B?R212M0ZoNFdrWEpYNzFVK0xWSTN3SlNBb2ZqRFZRNVBBTW5vS0V1NFJ0UkF2?=
 =?utf-8?B?YytabytmR0M1djZIM0o2QlpQSzQxc0xuWmliVGxFZzc3ODA2cVF6QVZNVE81?=
 =?utf-8?B?emlKdzlUdzJ1Mm9PSVNZZUcwdy8rV1BqNWxIa0FPc0xRa0lpR2xjbmZzYWtK?=
 =?utf-8?B?ZVZzYWF3VkppVHAwU1RxVUxCRmRTR05PL0JxdXdPTElRMjYyeGFSZXdNYUw1?=
 =?utf-8?B?MDlUeDJnYjIzei9zTmUvamRoNGp0dHhYRjQyY0RPTlI5K2thMUlEK25BV2o3?=
 =?utf-8?B?LzkveFh3U3ErdFIxMmY1TjEwRmFPYjM0RmQwd3MyZEMxTUtZTDVFTFpzQ3FC?=
 =?utf-8?B?TkRDdEQwbWJqU0dENHBTenJTLzcxRWRoN2xoMUkrenhNamwrS01CZVhrTVo2?=
 =?utf-8?B?REZGcXBmYlNGZkMyUHJlWU1kQmtDWGsreXE1UlYweVdrS0NpU3ZYQ2M3blVn?=
 =?utf-8?B?QzVRcWg0N042NzB6K3JJTkl3eFBkMmY3R3VNQ3hpendJT3lheXdVREFSRkZQ?=
 =?utf-8?B?VU9zTDJMT3djQVEwTWtJK0xBdmxpQWxxRHRDOUlNMS9vdFh0b0lGeUhYb09S?=
 =?utf-8?B?dFdUWnhRQkd1am93OS8vd04xRWp4QndoMStEMGlraU5VcGNHN0hnUDdBbGtz?=
 =?utf-8?B?THZGaHRCb0lZVVkrOGdMRnlIdFczUnNWMm93R3ZMd2ZDUzY5TTkzRnZoUmZ5?=
 =?utf-8?B?NWRzcDB4T1lpSXdqNzF4K2ZtWDFabEhvRUpkL05FYUt5QUYrbmRKVFoySGpZ?=
 =?utf-8?B?SzNraUFJOGdRTlE3SUVyMXpUMDJtbXZYMDIyQjNTL01FUkRUMWd6d0xsZjFu?=
 =?utf-8?B?RktVQlBzZGhHWSs3MFZHZ3dQU1V4bllhM2Z4Y0VIdlN4MG82M0RweDJmR0lE?=
 =?utf-8?B?WFlHSVQ1OHRsTnc4OU95c1VoblR6TSthSkt6TmZFMVBBVWludzl1Mnd0emJ2?=
 =?utf-8?B?aFpLT3VKMElRblZNemxWaTVFb1RTaWNwdVk4TEdvOTdwdHJJUHN4WjFPcFIw?=
 =?utf-8?B?OUFmZjhpTWhaNk44YmJlTVhIYXRVSFhBM3RFdXA1MFNJbnNTTkkvU0RTd2ZD?=
 =?utf-8?Q?X35kf4ADpMe+9aEwya9a0k2j0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 926695f9-28ac-493c-88a5-08dce203cb53
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 10:28:46.9587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxGW9vNPr2lyMMsQGjeN/stIsxYYI+jhTH73vcSkCdtmVFEOYKW51FwSpie7irS/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7662



On 9/30/24 16:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> For better readability don't repeatedly dereference pdev->dev but
> instead store the address of the embedded struct device in a local
> variable in probe().
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/gpio/gpio-xilinx.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
> index afcf432a1573..d99824d42c77 100644
> --- a/drivers/gpio/gpio-xilinx.c
> +++ b/drivers/gpio/gpio-xilinx.c
> @@ -561,9 +561,10 @@ static const struct irq_chip xgpio_irq_chip = {
>    */
>   static int xgpio_probe(struct platform_device *pdev)
>   {
> +	struct device *dev = &pdev->dev;
>   	struct xgpio_instance *chip;
>   	int status = 0;
> -	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *np = dev->of_node;
>   	u32 is_dual = 0;
>   	u32 width[2];
>   	u32 state[2];
> @@ -571,7 +572,7 @@ static int xgpio_probe(struct platform_device *pdev)
>   	struct gpio_irq_chip *girq;
>   	u32 temp;
>   
> -	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>   	if (!chip)
>   		return -ENOMEM;
>   
> @@ -624,7 +625,7 @@ static int xgpio_probe(struct platform_device *pdev)
>   
>   	chip->gc.base = -1;
>   	chip->gc.ngpio = bitmap_weight(chip->hw_map, 64);
> -	chip->gc.parent = &pdev->dev;
> +	chip->gc.parent = dev;
>   	chip->gc.direction_input = xgpio_dir_in;
>   	chip->gc.direction_output = xgpio_dir_out;
>   	chip->gc.get = xgpio_get;
> @@ -633,21 +634,21 @@ static int xgpio_probe(struct platform_device *pdev)
>   	chip->gc.free = xgpio_free;
>   	chip->gc.set_multiple = xgpio_set_multiple;
>   
> -	chip->gc.label = dev_name(&pdev->dev);
> +	chip->gc.label = dev_name(dev);
>   
>   	chip->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(chip->regs)) {
> -		dev_err(&pdev->dev, "failed to ioremap memory resource\n");
> +		dev_err(dev, "failed to ioremap memory resource\n");
>   		return PTR_ERR(chip->regs);
>   	}
>   
> -	chip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
> +	chip->clk = devm_clk_get_optional_enabled(dev, NULL);
>   	if (IS_ERR(chip->clk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(chip->clk), "input clock not found.\n");
> +		return dev_err_probe(dev, PTR_ERR(chip->clk), "input clock not found.\n");
>   
> -	pm_runtime_get_noresume(&pdev->dev);
> -	pm_runtime_set_active(&pdev->dev);
> -	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
>   
>   	xgpio_save_regs(chip);
>   
> @@ -667,8 +668,7 @@ static int xgpio_probe(struct platform_device *pdev)
>   	gpio_irq_chip_set_chip(girq, &xgpio_irq_chip);
>   	girq->parent_handler = xgpio_irqhandler;
>   	girq->num_parents = 1;
> -	girq->parents = devm_kcalloc(&pdev->dev, 1,
> -				     sizeof(*girq->parents),
> +	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
>   				     GFP_KERNEL);
>   	if (!girq->parents) {
>   		status = -ENOMEM;
> @@ -679,18 +679,18 @@ static int xgpio_probe(struct platform_device *pdev)
>   	girq->handler = handle_bad_irq;
>   
>   skip_irq:
> -	status = devm_gpiochip_add_data(&pdev->dev, &chip->gc, chip);
> +	status = devm_gpiochip_add_data(dev, &chip->gc, chip);
>   	if (status) {
> -		dev_err(&pdev->dev, "failed to add GPIO chip\n");
> +		dev_err(dev, "failed to add GPIO chip\n");
>   		goto err_pm_put;
>   	}
>   
> -	pm_runtime_put(&pdev->dev);
> +	pm_runtime_put(dev);
>   	return 0;
>   
>   err_pm_put:
> -	pm_runtime_disable(&pdev->dev);
> -	pm_runtime_put_noidle(&pdev->dev);
> +	pm_runtime_disable(dev);
> +	pm_runtime_put_noidle(dev);
>   	return status;
>   }
>   

make sense.

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal

