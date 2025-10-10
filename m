Return-Path: <linux-gpio+bounces-26972-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2511ABCC912
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 211471A66D7C
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 10:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BCE285CB3;
	Fri, 10 Oct 2025 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ho9ri0O5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631921FBCA1;
	Fri, 10 Oct 2025 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760092647; cv=fail; b=I+ZvxT6HilGiLF6wgvhBJUp1WtKDX/In/Jh/cnKgYbQFOQtFkFv1OOHx1huDqC+cOjOvZke8s3JVy0vlVEmwqVcts0j06rS+LuNRavDuHK8z7fce9OeghHJeHhk3viB5C2t4rZhuYKsL4N+pIDfJFHOBZqm31GnC7UXG7sPKqGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760092647; c=relaxed/simple;
	bh=QkIeZKPeOfU3LA4il1ECI2dLYYPJtaVK0sDTnRYq1+8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fR5OOxZP9phNPqzvfZnuOJ/ZJqM94FLVb7NdHTGY9tWmHLj+W9MpHyZnxTe2PfcB5Ea9lKnZ+g9KlYgMIc2AKzyop4paned/PBcBk88638Giwc5Qhjq9R4heaikqF80/O9d6h2MuBda1XnGzCKPXLTXX3zT/RrWKnIDr31Twivk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ho9ri0O5; arc=fail smtp.client-ip=52.101.46.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoxmsBAh+IpmBQmRCfc1pUb1jqG+3uhvSWDvk2NAU/7jEKSQbz03aoWBt20nbOaB3cVau4s1np6p/XFj3/RANjGbBUXztZcgUp/64SRZdx6+sg8rL7jPyjXJK6x9L95723blKbN12GBSsBPXCiWba8uaKJ1zX0KyAMzkBTaXhQNCdFvMn/WGqDmipN82d+82rAkFseX1EGWdf9WK0pnguCU+xLNepfzfKoGcErh19u+8nu8Z+BC0irXcfGfjVYGHagybNrcgHmJ0HDGJcnaPH+m36cxPnoAlsPoqx+7QgKVHkpKl1TPO+mG2PmIwL07+nLGXPCoJ6aqXHXViEJpXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVSbiVEGpWOqGCiXhRRT/c6cDVz+XGpw+5LLRSo91ng=;
 b=vgF36H2SnkjfW7+YDkEXEx12PlicmvH8teGKyz0TEzmyzslOlpSImnqTzhxCkP3cfohnFtC2MtkihML2BgcIjRHVDnI4pe7MzLHrp42Fy5fZNU5TIq5n35Vewqrp9t+HtxioeQh2Mna5hwmY2PItABXd8B+SkrYGS5lujEb4X6I2XT1k5Ksd07m41yhblsfayRYuJi876AYUYkxAY2r567QZp3EfmmpgS89Q8eCFnrj9jaD5ODcMwCEr1jIqOIpRcCufh5GMs35xQO9Mu07xf7WZT/etkaHJcMHeFWdgyh+ydJlz5YHqRbToLkj+4ibAnFbAMjbyOHwu5bMeslHE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVSbiVEGpWOqGCiXhRRT/c6cDVz+XGpw+5LLRSo91ng=;
 b=ho9ri0O54Rd3GkTQnuJS0T1w59CYH4WSXqHGfKBCSWSP0lLpp0vmubDivo61ulle4+gVmZ7UEtVehhnYGZaRfww0OnRrXKW2xWzaVtAJpYQRGyiHztnGmLT+M5pOa05KhkLL9SYXpje63vgjFpgd0DyG/R6bQFmZq4K9v8nyVJINSt5S03Fut8dcqVEzSYxXZi9YKt/B84Qy/JNNipV7s6FhLGKMDjixiWyFF4YkSAlAASJh0e9k9CrqqQ9wNZWUCbEmpiaqW+uCeQKphRNJ0HW6ylOTR7bEMk/RZ2gWKNEFtE26yY3E9EgR9xgyY/HsocsKuPewhTZSJOeodhnNbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by MW6PR12MB8866.namprd12.prod.outlook.com (2603:10b6:303:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 10:37:20 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9182.017; Fri, 10 Oct 2025
 10:37:20 +0000
Message-ID: <511a920f-b800-4fce-80e7-abe0a75e29d0@nvidia.com>
Date: Fri, 10 Oct 2025 11:37:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] gpio: tegra186: Add support for Tegra410
To: Kartik Rajput <kkartik@nvidia.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman <nhartman@nvidia.com>
References: <20251010101331.712553-1-kkartik@nvidia.com>
 <20251010101331.712553-2-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20251010101331.712553-2-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::17) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|MW6PR12MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 45566624-5e7a-4203-5371-08de07e8fdc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWRkNjJxbU9CNi9XbGgvSUk1ekhkSlZ2QUJiZExWeHdXeWZ2TUJxcEsrMWhS?=
 =?utf-8?B?cGk1ZExtdndUTWFuQS9pcUN1K2wxQUlzNEhVNlJPYTBJOVN6ZXZBaDVOZTB6?=
 =?utf-8?B?bTR1QkNyZDBocnh6OHM2UTdNQ1NIYWVPbGQ5aWxXL1hjU3VZZ2wrMkoxVi9W?=
 =?utf-8?B?NnBKVGEvT3ZmbzNoV3NaUk9rSGlBMVNadjBQejV1R2hVcWFpT09uS00vWmQ0?=
 =?utf-8?B?aDRNVWYxYko0NGhUVzRuR0sxc1FmcjNNZmFZMG5JeStmMFg0REJJb0Q1LzVh?=
 =?utf-8?B?L1BuREN4ODJpKzNBV1N2czRhRFhNMUpHY2FmaWxUdkcrL1BnUzhDaWg3V0hx?=
 =?utf-8?B?WkFXeGN5YXdueVNwQ212YkRkYTVqZDJBTnVRWGZ3ZU9hSjIzTWlMS0VQUmhU?=
 =?utf-8?B?ZVhDTUd1QWdEU01JZlhZSW1NRS9nVDZCcTA3REovbTZvYk5zaEoyOGZiZ3Z5?=
 =?utf-8?B?ZlVmUXEwWThCNVIrdzY4ZHljbHlHSThvNnhTL0RFOUVkS3FHZktpNnN1L3hl?=
 =?utf-8?B?ellMWG5pRGxiazFOdlMyUFlsbzdsbHZBbm0yQ1RQelRKZHN5SXRFaXhPVWxL?=
 =?utf-8?B?R0diZXlYZytGSFhiVVc5cGVHZHF2cElWcmQyKzFwY3Z5TVhiWWM4eXlJNWhD?=
 =?utf-8?B?U0dDby83eDhDNGhFdU43aEZmMlErSGZmQTFnZHJKLzdXQ3Y4SCtTZmVtdCtB?=
 =?utf-8?B?RUo0d1VMc1lQc0hwOHMrRDd1eXpvTHhCc2RqVm9yVzhFVTFtTTZ1Z1IzOGw0?=
 =?utf-8?B?bkZFaXQ4TUZGRFN1eDd3UG5nUkgzbUpWdVMwVjRLMmZGUDBvNmJNc09yOVlN?=
 =?utf-8?B?Sy9MTDh5cDdOWFNBUEptVlpWS0poOHh2NU5rZjgrMVNhWmZUTTFmV1k4R0ZP?=
 =?utf-8?B?WnhSVGZYMG12QjUwYkI0VkRYSFY0ZDVzNVdmbGFwb2dIT3A4b3B1YTdyS0My?=
 =?utf-8?B?TFJ2M0pGazV2T0pZUG9KTUtBLzRlRWpNdEFTdEROOUxZRnJjSDhaVzEzVmhM?=
 =?utf-8?B?NDB3am9uR044Vlh4WkRpRDVCazFQWXZVbWQ5eENPZG92alN6TFRaU0NEdWRs?=
 =?utf-8?B?QzhQSjJwSGVlNW5FcCtzbExhMnVUZmlUbkFuZWdkQ2k2cndhSHJZdEdWK1Fj?=
 =?utf-8?B?cDlMMjZtZjcydElzbFV1V3dkVXlHMmNwSmN6SXlNa21DWHJLMFN2ak13UXVM?=
 =?utf-8?B?enhjcUFXTy9MTUF5M25GZUJxVExTak10QzhpKzBmQTJDVHdjVHdMNkhublpE?=
 =?utf-8?B?ME1Db2E3QnVKQXlNRGh1cWZzcEZVMEZFQk9SWGJRakhDYUtzdnhHSHEzbE01?=
 =?utf-8?B?RGFJb1BVRy95TFB3Y1plSk5hdHhianJnc1JYcXpOWUN3QlVKOEVCeTRudmN0?=
 =?utf-8?B?OTlSeGZIcU5EdW1nUXcrMTBLN1VmTE1uanVqSWo1YU53WSt3bFlZb0d1YzBy?=
 =?utf-8?B?U2lJSW44eDh5djdqU0laQmRDK3pWYjNkcHBJYS9Ca1VRWDhYZHEzZ2w1N0pL?=
 =?utf-8?B?YmFMenVIemFpTnNqc0FhdUZoVS9SV0RVc05QTUNYWGVVT3dIZVBoWUxDQWpD?=
 =?utf-8?B?OVVvRHNNejlNUTdLaUs1d1AwZGVwQ3hqSTdqUDYvZHNYUk5YQnlqcEZiYVlW?=
 =?utf-8?B?enM5YXU5aWFCd3c5SWdLY0Z5V2lQditpZWY5TW5HSU9ETklnZlBDeCt4T2gx?=
 =?utf-8?B?ZXQwZ2hiS0dYdWlGRFl4bUcydHd1bTNKQW9IK1JOd3JWNXc5bWtYSkdtZDd4?=
 =?utf-8?B?ZnBwOG9KQnpWMGRkN1d2RTBxVDdVYUZLWXh0TzNiNkI2bDMxc3BxZTFacG9T?=
 =?utf-8?B?a0VXd2RsdC9EeFZBSXQ0R0o3L3FHMElyaHQzYnR1aWJMQ2hGWUhxRkpQSUI0?=
 =?utf-8?B?OTVmQU9FUFBGVGF3OHNqUkE4WDJHMGNGekQzNGx1OUhFOHVvb2NOWDdmblJY?=
 =?utf-8?Q?B2+PhEwnKwfHCxmYqqAc/cFKJFilMVaD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHFmRDBUZG1XcmlmRVZzRHROK056YWkvWkV5Q0tCV01wUE1WeFpXTDBUUUpi?=
 =?utf-8?B?UTZkRnpETFNGNHBWZ2RFcFdkY3RjY1lqRnRSSW9pT1BXVG9xaVc0cWVFWWZ5?=
 =?utf-8?B?anpjT29jSDEyM3o4am9uOW1UUTNRRjFJN0xaL1ZaN2x0TUtXZStGLzdBUTlZ?=
 =?utf-8?B?L3lCWlo4b0NhT0xBdzZMZHQraUx3UDMxazg4Z3hSclFEMG5TdjJBSkNrbFZP?=
 =?utf-8?B?UC9SSnBaOURKaUlSTUljczNucENJenZoc0JSUVBCUUtycFN5UUdSQ0R4MlEy?=
 =?utf-8?B?U3A0NFpvbFV4K1BvT0Jaem1Md2ZKc25UQUtiM1V3Q2o0YzZNMkd4WmJFYktr?=
 =?utf-8?B?dXNWNkpOY0dUK1hTMjhJRVVqK0J4dUppcmZCRWtjcXU1ei85cHBJRmgvUkhz?=
 =?utf-8?B?R1dRTC9pdVQyZ1VWWXQ5b2FUV1VERUgrL1pMczJEUTZMZWo0VFhVZFVjakcz?=
 =?utf-8?B?MWYwbDVRbGtsMkh6RUc4MjdLcGpSdnNjQkxaendwNWRiektMclJJODdkY3hS?=
 =?utf-8?B?bWZ0QjR1Snc5Y1picTRNaGVoVU5NRnRpajJZcG9KV0lUbjVYOFdzRXBwcS9i?=
 =?utf-8?B?Y3ZuTzh2ZjdGemlkQktkVW9UQXU0aUdlM3JUWnhtMVkwemU3UVRCQU1jVmhC?=
 =?utf-8?B?R0VVUWxXM1dwR21ZWFYydGdxWnp5Z0duUk9GcmVtVnpTcmlqRFhmNFlkNXlH?=
 =?utf-8?B?Z0FDaTdLUjhsVS9lelRtSm5YNlN3QTY1eWxmeUN4eVlvVEU0VDVXNFQ5eEdq?=
 =?utf-8?B?Y1JoWmRycGwzQitRSXVWOUxCaHRseENYMU9rRFZWU1FVV0ozL3ZkdTRrcDB6?=
 =?utf-8?B?SGR4akIyeXlvWkl6K250TXdqOVJYNVJpL3BtVTRmejFRRUhkNlJsYlNGY3pL?=
 =?utf-8?B?VHJlMU15YkJhTU14U1ZqejMxY3lUWVFyNTdHL3Y1TkhzYm80enVIVXFWMmxI?=
 =?utf-8?B?dVVtWldESnBZK2hEc1dWcDBjRTQyTTJ2L1B3OWFiT3pSbWk3cDVGZmZZZ0x3?=
 =?utf-8?B?cUNMRDVGbFZMWXZ3S3BKQVNNZmY5UTlHU0JubTFpeGROaGJRZVptdEZvTlFy?=
 =?utf-8?B?ZXBHVW1nK3dQWkRSUGlsbFJTUjlZU0FNbWYxV2ZNNUJsOXh0UTdNVlJTQ1R3?=
 =?utf-8?B?UXlHL29CKzhEY3Y3dW54K2hNMWRvd1VrVmMrSysyWHkrQUxHQjVra3FmS3FU?=
 =?utf-8?B?alVxaEpaRDVLMXhBRlRXRFZEOTZZYWZ2dExyeFFqRTBNSS95WFJSZUZJbUJm?=
 =?utf-8?B?dDE0U1E3NjhTR2tCWnR5VTlDQUtmVGFaZTczM0VtbjJLVWl5azQybE9lOGha?=
 =?utf-8?B?RGRRYW5LVWsxZ2xTRkVmVklJekhlREh2Z2dza205aXFQeEpzeThlUUFKWHVO?=
 =?utf-8?B?S0l1amVHTjVxR1VLelFrUHdOZlZMQ1M5WTVwd1hOSXh4RGI5L0xoczB6bmND?=
 =?utf-8?B?MlhQbjE1MnlIMjhKeERxaUJMSXBDTDlXT2lUS1BhVWlXRU1wTDB2REQwLzhl?=
 =?utf-8?B?dzhWbWlLcmk2YUVvd2pJRUtTUmlTRlZFNWxmNUpCYmpjcEprbVZwMXhRMmhm?=
 =?utf-8?B?YnlwTWozaUdrLytYM3dsUDA2cVA4OTJ5R2drWG9RQ0VFVGdJRHFRa1lNczdN?=
 =?utf-8?B?ZUZPdWpqbEFLU2hrQ1FMS0E3YVFYaFZ1Um8zNmdNN2dIdUYvUTdCZXpFYzRL?=
 =?utf-8?B?emdlc0pLL1pSbUk4bzZab2JTVXJRQmkzNUxpbGcycUJiUE5lS05kajlXOGpr?=
 =?utf-8?B?M05ldUlyczFmVnRNMnlSbWx3ZnFyUVZTWGo4M1ZFVEVFdWlPaVg1aHZ4TUNi?=
 =?utf-8?B?dVdYY2NZRW1WUHZNMDc4a210K2srM1lDaXN6aU9aTks3SG9Ed1pHWWlIVGJt?=
 =?utf-8?B?RXV4bmJvUHRYK3FibW1hWXZlR1kxUzlGVkU1MHVxMi9zdlY5U1pWQjdjUm5N?=
 =?utf-8?B?OGwyZHJzLzh3djRhczVCdTFmRFVuT0l4c2FVaGtZVHFXb0M5RFNJVU90eTlG?=
 =?utf-8?B?Z3Y1Z28zN0pVd2hISmZqWUx6c2RqMGNSTmNiaDllR3MrUVM3Q1czY21tTEJj?=
 =?utf-8?B?SDY5U3BVZ3ozRXRJUHRLcVIwTVZvWGJzaUkvTEtqc1M1Q3dvOEd6SHV0U1VO?=
 =?utf-8?Q?eCEU7bjvMh/9XGKUtlkkeRCD9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45566624-5e7a-4203-5371-08de07e8fdc8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 10:37:20.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOy3hluFAYUYSSqUWfXQzpyPiSR6y423rjyBHp8rbRtMvSAME9qaWNUZRPI7xZY9GKrS8V2K32m+06fePHlAFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8866


On 10/10/2025 11:13, Kartik Rajput wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Extend the existing Tegra186 GPIO controller driver with support for
> the GPIO controller found on Tegra410. Tegra410 supports two GPIO
> controllers referred to as 'COMPUTE' and 'SYSTEM'.
> 
> Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v3 -> v4:
> 	* Remove TEGRA410_COMPUTE_GPIO and TEGRA410_SYSTEM_GPIO macros
> 	  as they are not used.
> v2 -> v3:
>          * Add a generic TEGRA_GPIO_PORT macro and use it to define
>            TEGRA410_COMPUTE_GPIO_PORT and TEGRA410_SYSTEM_GPIO_PORT.
> v1 -> v2:
>          * Move Tegra410 GPIO Ports definition to gpio-tegra186.c
>          * Rename Tegra410 Main GPIO as System GPIO.
>          * Add Compute GPIOs.
>          * Update ACPI IDs.
>          * Set instance ID as 0 for SYSTEM and COMPUTE GPIOs.
>          * Added Nathan as co-author for adding compute GPIO support
>            and renaming MAIN GPIOs as SYSTEM GPIOs.
> ---
>   drivers/gpio/gpio-tegra186.c | 76 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 75 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index 7ea541d6d537..83ecdc876985 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2016-2022 NVIDIA Corporation
> + * Copyright (c) 2016-2025 NVIDIA Corporation
>    *
>    * Author: Thierry Reding <treding@nvidia.com>
>    *	   Dipen Patel <dpatel@nvidia.com>
> @@ -69,6 +69,30 @@
>   
>   #define TEGRA186_GPIO_INTERRUPT_STATUS(x) (0x100 + (x) * 4)
>   
> +/* Tegra410 GPIOs implemented by the COMPUTE GPIO controller */
> +#define TEGRA410_COMPUTE_GPIO_PORT_A 0
> +#define TEGRA410_COMPUTE_GPIO_PORT_B 1
> +#define TEGRA410_COMPUTE_GPIO_PORT_C 2
> +#define TEGRA410_COMPUTE_GPIO_PORT_D 3
> +#define TEGRA410_COMPUTE_GPIO_PORT_E 4
> +
> +/* Tegra410 GPIOs implemented by the SYSTEM GPIO controller */
> +#define TEGRA410_SYSTEM_GPIO_PORT_A 0
> +#define TEGRA410_SYSTEM_GPIO_PORT_B 1
> +#define TEGRA410_SYSTEM_GPIO_PORT_C 2
> +#define TEGRA410_SYSTEM_GPIO_PORT_D 3
> +#define TEGRA410_SYSTEM_GPIO_PORT_E 4
> +#define TEGRA410_SYSTEM_GPIO_PORT_I 5
> +#define TEGRA410_SYSTEM_GPIO_PORT_J 6
> +#define TEGRA410_SYSTEM_GPIO_PORT_K 7
> +#define TEGRA410_SYSTEM_GPIO_PORT_L 8
> +#define TEGRA410_SYSTEM_GPIO_PORT_M 9
> +#define TEGRA410_SYSTEM_GPIO_PORT_N 10
> +#define TEGRA410_SYSTEM_GPIO_PORT_P 11
> +#define TEGRA410_SYSTEM_GPIO_PORT_Q 12
> +#define TEGRA410_SYSTEM_GPIO_PORT_R 13
> +#define TEGRA410_SYSTEM_GPIO_PORT_V 14
> +
>   struct tegra_gpio_port {
>   	const char *name;
>   	unsigned int bank;
> @@ -1267,6 +1291,54 @@ static const struct tegra_gpio_soc tegra256_main_soc = {
>   	.has_vm_support = true,
>   };
>   
> +#define TEGRA410_COMPUTE_GPIO_PORT(_name, _bank, _port, _pins)	\
> +	TEGRA_GPIO_PORT(TEGRA410_COMPUTE, _name, _bank, _port, _pins)
> +
> +static const struct tegra_gpio_port tegra410_compute_ports[] = {
> +	TEGRA410_COMPUTE_GPIO_PORT(A, 0, 0, 3),
> +	TEGRA410_COMPUTE_GPIO_PORT(B, 1, 0, 8),
> +	TEGRA410_COMPUTE_GPIO_PORT(C, 1, 1, 3),
> +	TEGRA410_COMPUTE_GPIO_PORT(D, 2, 0, 8),
> +	TEGRA410_COMPUTE_GPIO_PORT(E, 2, 1, 8),
> +};
> +
> +static const struct tegra_gpio_soc tegra410_compute_soc = {
> +	.num_ports = ARRAY_SIZE(tegra410_compute_ports),
> +	.ports = tegra410_compute_ports,
> +	.name = "tegra410-gpio-compute",
> +	.num_irqs_per_bank = 8,
> +	.instance = 0,
> +};
> +
> +#define TEGRA410_SYSTEM_GPIO_PORT(_name, _bank, _port, _pins)	\
> +	TEGRA_GPIO_PORT(TEGRA410_SYSTEM, _name, _bank, _port, _pins)
> +
> +static const struct tegra_gpio_port tegra410_system_ports[] = {
> +	TEGRA410_SYSTEM_GPIO_PORT(A, 0, 0, 7),
> +	TEGRA410_SYSTEM_GPIO_PORT(B, 0, 1, 8),
> +	TEGRA410_SYSTEM_GPIO_PORT(C, 0, 2, 8),
> +	TEGRA410_SYSTEM_GPIO_PORT(D, 0, 3, 8),
> +	TEGRA410_SYSTEM_GPIO_PORT(E, 0, 4, 6),
> +	TEGRA410_SYSTEM_GPIO_PORT(I, 1, 0, 8),
> +	TEGRA410_SYSTEM_GPIO_PORT(J, 1, 1, 7),
> +	TEGRA410_SYSTEM_GPIO_PORT(K, 1, 2, 7),
> +	TEGRA410_SYSTEM_GPIO_PORT(L, 1, 3, 7),
> +	TEGRA410_SYSTEM_GPIO_PORT(M, 2, 0, 7),
> +	TEGRA410_SYSTEM_GPIO_PORT(N, 2, 1, 6),
> +	TEGRA410_SYSTEM_GPIO_PORT(P, 2, 2, 8),
> +	TEGRA410_SYSTEM_GPIO_PORT(Q, 2, 3, 3),
> +	TEGRA410_SYSTEM_GPIO_PORT(R, 2, 4, 2),
> +	TEGRA410_SYSTEM_GPIO_PORT(V, 1, 4, 2),
> +};
> +
> +static const struct tegra_gpio_soc tegra410_system_soc = {
> +	.num_ports = ARRAY_SIZE(tegra410_system_ports),
> +	.ports = tegra410_system_ports,
> +	.name = "tegra410-gpio-system",
> +	.num_irqs_per_bank = 8,
> +	.instance = 0,
> +};
> +
>   static const struct of_device_id tegra186_gpio_of_match[] = {
>   	{
>   		.compatible = "nvidia,tegra186-gpio",
> @@ -1302,6 +1374,8 @@ static const struct acpi_device_id  tegra186_gpio_acpi_match[] = {
>   	{ .id = "NVDA0408", .driver_data = (kernel_ulong_t)&tegra194_aon_soc },
>   	{ .id = "NVDA0508", .driver_data = (kernel_ulong_t)&tegra241_main_soc },
>   	{ .id = "NVDA0608", .driver_data = (kernel_ulong_t)&tegra241_aon_soc },
> +	{ .id = "NVDA0708", .driver_data = (kernel_ulong_t)&tegra410_compute_soc },
> +	{ .id = "NVDA0808", .driver_data = (kernel_ulong_t)&tegra410_system_soc },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(acpi, tegra186_gpio_acpi_match);


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


