Return-Path: <linux-gpio+bounces-28955-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810AC7A399
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 15:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42D414F5D55
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE3734D937;
	Fri, 21 Nov 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="acKKIXgW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011051.outbound.protection.outlook.com [52.101.52.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CA6348889;
	Fri, 21 Nov 2025 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735148; cv=fail; b=am8HYomHAEBiK+fNoewIazrjWUYqWJDHdEa35UwVudQi5ufMHdnv9WM1eggZ3wBbCeivmZMj0vD5JFiBDt+p2uSfJUcvELXxB1WaHYdLq3yGGbDOY/1o2QKHIQ72BtfJXw+ZqAnuYQg/3Cvqa8RL0AqtlIxiI/3NvMFHt8XseU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735148; c=relaxed/simple;
	bh=eXbL8mHIYoep5hMYVcIMdueQA1n9wnwP1TxMKeMYZ58=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dXcYoBVK1WYnaj5wxL++rzGuQl8Rg/BZeErEbCftrJgq/FKHqd+oSDvRK4imLayJGoGA9BxcQGSUh1NxaUoLwH3naKYKzyGjnQksyg1MVEfU+0L4pZS6/MkodeEYo4GxHNYlimv/zyeF9SswqLL2yWcCOObE+RjPnOEDbChr0YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=acKKIXgW; arc=fail smtp.client-ip=52.101.52.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzy+R12L5IKdwesX5WEi0VjZnXt9AJRvJk8v1NRVND6D1+wTMy5cXbmi0PrBISnQEAMsIjMsbNyR9KSkl3SMHLW2nD7lPM27Z0agjTjIeNUlDl4yloOnlzvQH+Ijt+MSYVTgZO7P04Auuo+6guuOWWduCQdQ+TVcpSvK+6ULX1KWxzAGfJuMNhzwmixnSbfm61gdOEhwvP+UQrf6J+3RkBTo/x3r2oCEEqw0JSX6MDypT+H5h9O5dBnGqGStEEhjiv2ArlbnCR13ykuXNv/sdd/6a2rRXG6XY9QDRzHTrGYSkZUrQgbxOxq8ueJtJV3wbnkHgI7Drx4PAJ4MLChyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YG2N5vAKTaLFYBGxb/UYch5q83ipWbSSkFhDUAWTO+I=;
 b=tNWf7ZA11gPA/II2TeVEt6OP3j1u3uZtkM2VC8hYejKzPMLeKynw4Rx/qzeAyGub8qDhSd3W7vEfhixS7PpkFI52FRnqF7PAtGPhEvx0yZ5JLps+MOj0+EbAPO1GS0BqPkXC5mTh1Wp9EOuy/aPRNyGbMi1WexZix0MlMo7pqKMRZHB6GumlidlRvqKxtDfCf+5ddCnMr4ey1mKDpJKKc/y7k1Cn7G0szQt44YQNVcZMLbowUdaqOTFs91gYe+IUh05nhu0kV/YmskpuJlh6dgyamhsnzoG4fa+aj9irAq4q1gWWHV00yoeNuDAGEYuVNAqLQrvi/dy4wAnJ3hcwUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YG2N5vAKTaLFYBGxb/UYch5q83ipWbSSkFhDUAWTO+I=;
 b=acKKIXgWK7VnYYdnfIUVUfbe69sUg24Psi4ookhtKrRmeiLDUqKA3Ahow2OzSwtnpyfHU/fQ6oT8S9fP/DRUjsIJFY5lwOfzx3g6MiwCzWMCo/ZDTsKo9e35wfR/LpBLXn1PrsUg++MrjkNFlHgGqDCwD4h2uc19bBFEla+S3ZSfMPpU07uqgdHsPOvHiCCTJdfkKC9x+nB33x70fC+9TL56nQbmpfcz5MVtPbEFkcBfsgYzbAau3Q++BjR8mkjsuRUzc/4cGmug8oslrkU6A+pPaEzxQeuxPQ2ce4bbxPpDGk1gHgPCLWmuHbZopn1JQEz1GXHtthDkph2wv03TAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by PH0PR12MB8773.namprd12.prod.outlook.com (2603:10b6:510:28d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 14:25:42 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%4]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 14:25:42 +0000
Message-ID: <b67b887d-541c-43a6-85fb-3fe7ac490d26@nvidia.com>
Date: Fri, 21 Nov 2025 14:25:36 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpio: tegra186: Add support for Tegra256
To: Prathamesh Shete <pshete@nvidia.com>, linus.walleij@linaro.org,
 brgl@bgdev.pl, thierry.reding@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250823055420.24664-1-pshete@nvidia.com>
 <20250823055420.24664-2-pshete@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250823055420.24664-2-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::6) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|PH0PR12MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: d5399ea0-0e6b-4d9b-4372-08de2909d9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEdUbThYZTZtcVg1Q3c4UVUvQ3p6TDA1MHJWODNZMGZXcUhLSmhDNUhhZUI3?=
 =?utf-8?B?V0d0c1BlclJxcUtJTTlBTXV2MzRWTFZReVluNzRrVFoySExDSVBLUUUwd0JC?=
 =?utf-8?B?SlBmVWROY05UVlc2S0JacHR5ZUFlV1p6UFJreTVxWm1BVGJ3UTY5N0ZjVFNy?=
 =?utf-8?B?WkFSYlhEMFdjUCthMlhEMXBlSlM0d1ZvaHJRcDRuVG1hekRkVlNtWXhhaVkz?=
 =?utf-8?B?U21MZkt3ZzJUdDhTWHV1R0NWWFVoQUNUWVl0Z1h0eTlNdWFIWE11bzZXUnZF?=
 =?utf-8?B?SGVpbm4zUkpmQzVncmd6MWJxZGViaHoxb2NJNGhWWnM0NHl3VzFUcFNERVVa?=
 =?utf-8?B?Ym9kM1Rsd1lBL2ZGUHdYaEdwRzBCRCtsczEzTUlPRzRpU0NHbVFMTHRoOXZm?=
 =?utf-8?B?VzM1Z21yRmw3THJIV3R1T0FwNFZnWEs4Ym1nZGJEcGppdjlYSUFVQjYyNENs?=
 =?utf-8?B?aG90b2w1b2g4bWUwcDBVRFU3c3c5WndnVFgvSHcyRml4QnRmdVloTXh5MWty?=
 =?utf-8?B?Wjc1NS8xaWNMMEdkVElBR2QvZEwxYzlJeEtWMGdwYWQ5dEM3L2c2OFFvS2hv?=
 =?utf-8?B?NFhhMXpML0F2cU0rQUw5RUY4TjVTUXBOOWlUSGpadFBBenI4QXFybDFJSVl6?=
 =?utf-8?B?ZW4yWXFNd0JyV2Z4ZWZEdkFoRmZkSStJV3ViSHJCbkpzb2RjcGUrbjhDK0J1?=
 =?utf-8?B?MjZOL3Q0c3crSHA5aTZIRzYwNmJ3MzRTWS8ra01aNmhyL3ZtUlZ3SWY0Unhs?=
 =?utf-8?B?N2hUUCs1TDU5cy9IaGJVME90bVlxcnIyR2xXWEhvb2JaZVJLWDZoS053alJm?=
 =?utf-8?B?TnJCaGlLN3lJMzVBVlhkWDg5M0s4WDlqSTl2UmVjWGp5S2hMcEZQU2dqT2dj?=
 =?utf-8?B?U2VGRVRtVG1XT2h2c3MyWlgyTy9WdlNJRTNFSXJCTG9RTFlqZStPczFFQ3g4?=
 =?utf-8?B?ZnZTcSs2dUl6aU9PZk9zM25qNHljdTZ2ZVB1UjZSY25ySzdodGJ3RG45bldB?=
 =?utf-8?B?RDJzUkVhUU9mZEpJUS94SldINDVLd1U2YnliNzJqNHhLRmw5TmcwOEszWklj?=
 =?utf-8?B?OTFPRkQ4WGxqamwwbDRab1JVVzcxTFlzVi9qS0o5WUxITWorS0RHb2FuUGtO?=
 =?utf-8?B?b1cxM0ZvbXFnWkY2Ymx5aUgveVNrcm9xR2hWYUUyOHR3UGxQU0JidytoalJq?=
 =?utf-8?B?emdVWHJUaHAwZHV1U0tSTnFCdStXZ1BPMUQ2Q0xnS2tvTXVYU1dhSHpDMVFq?=
 =?utf-8?B?NFpiTnFNdGRRTWhJWjVWZmFnSU9QQUE4SHg1ZTF1NGRsMUNaWmJ1YzN2ZFFO?=
 =?utf-8?B?Mk4vVWxaUEFFV2lWeDBDeDE4eVZCZHMwOS9DK1pJNnRhSGtxM0dzVEZqaTIz?=
 =?utf-8?B?b0E5R2FWc0lmTkowaG9TTnhRbW1ORFlRWDdEbnArUy9PZU55UVlWaUtJYm1x?=
 =?utf-8?B?bDFvZ2lVNmRTN0g2blVpeVQrVTM2OUdCZkJIS0QxOVltTXVod0hPcEpJeU9E?=
 =?utf-8?B?SFV3Z2xDNG9VZnc5aDk5WGFsVUx6S3ZyUmJtT0lNVXZCNUpraTQ5aUg2TUR2?=
 =?utf-8?B?ei9Md09TUHY4R09qVWRuQkN4aUdTTCszZUQwQWIxUEJlbVB3bHVTcEg3YlZl?=
 =?utf-8?B?aDRKU3IvV2laZ29QU1I1bUozeDJRUjdpcGE1bUJ0czhCT1AyMzBHUGZHU29Q?=
 =?utf-8?B?b1JOSlNzaTUrbS9neFJIOFZRQ2JPdHhVaFdxQ2F6RXZDOWpnejlVS1BtQ1VW?=
 =?utf-8?B?WWhsL2orcHdpZWo0OW9wRnNUSkN5a1MwRXpCTlhiQk9sSHArWi9ucFdFU2Jh?=
 =?utf-8?B?ODdRZExTVFpuTlluTFlaaC9HTjJFb0pLV0VzdGFKcXRtMXpTdGREbzVKUkMr?=
 =?utf-8?B?U0VOVEViaUdySGlndUs1UzV2eGZqTGR6MHRmSTlMTy9na2UrOWV1YmQ3S2F6?=
 =?utf-8?B?S1JKOWJvUFF3UUtoUEZWZDBGTlBIZnFjaXE5Tk0razhTeU9uUktERVdCbDRJ?=
 =?utf-8?Q?tSb65hkPTM4mpjjlKig2MoRw/nhYYk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alR6TVRBU05aU3pLQlFrd2lKU2ZXQ1QxemxidnRxVHFVWlYxd0dQMk9hZDlN?=
 =?utf-8?B?azVRQy91bU5pNzVzSjFYTkszWjEwRXRKcGw1OFc0NHVaMDQzNzFnQ2VrcXlX?=
 =?utf-8?B?bnVCeGVlb3ZnZ1NhQW1XdVVpWjV6ejI0SEJCTkdtSGtaWjBiWFpBNTBGYmJO?=
 =?utf-8?B?Sk9Obmg3ait5dzlMYzZlZXp0ZDY2SmwzQVBUTm5Wc3RkYXJXMDlTekVISjEy?=
 =?utf-8?B?cW03VFhtb2t5LzFRSWJNcEtadm41VjBZYVhQblBzUDNEZlBNVW5vVENCMVFQ?=
 =?utf-8?B?eGRGMDR2bGlzWUt2cFJBS28zUEw5VWV0dGlyaitoZ3ppek9tVW04TnR3Q1VL?=
 =?utf-8?B?UkhqejVDM2w2YUtyVHEyVDdTdzJlYVVSUEVtQU9rTDdycmg1T2xvQ3RxWnRC?=
 =?utf-8?B?bmU1ZjJEUHhGR09EWjlVeC9XTkRXMW16dzV5eTRqdkdHUkR3S2RFaStVZ2lC?=
 =?utf-8?B?N1k2WDVGaHNpS2pvOEl5c3hMb2UyUFFHYkpZRndHZm1kVmREMWZ3Q0JzNXU3?=
 =?utf-8?B?YXNRT0xySUFGM1N4OEVLdVpCTnB2b3JyRk0zV21EY3ZEbEN3QkkrbDBSQVAv?=
 =?utf-8?B?bjEwNXZKbi82SnlocTRMV2J3bGQ2U0NqaUExeXRHdFVtcldYemVVNklRZXNm?=
 =?utf-8?B?cmwwNm8yZlQ1R3gzSi9OdE1VVmxZR1lSTjhFT2NtZU9GNStRZlpEUXJYcy9M?=
 =?utf-8?B?Qmd6TnhyNWdCVktsVUJsd0ZSKy9QM3RRNkVxK29uR1N3eVZPZlBYUStEM05F?=
 =?utf-8?B?MWNybVBnYzRqUEUvUnhGcUowaWNPTDRIc1B3RmR2RmZtSC9TQXpWN0l0UzNh?=
 =?utf-8?B?QkJLQ2ZHY0J5NDlSSkJaSWUySDNza01KQTZ6cThacFRqWGtuTjQyTzRYV1A2?=
 =?utf-8?B?TUtjL2srMk9XNmlyNEdGSC9Gc0Z6UkN5RWVJL2ZPWWhXWjBabmFwV21Wei9L?=
 =?utf-8?B?Y29PcFlzUGNkSlFlbDg4czZMdUJ2K0FGTVFkRWUvTUY3VUgybnVPUndkdHNR?=
 =?utf-8?B?NHljRHltQVkydEgzUHRuVlNYRVc0cENiNnhKKzgyR3JocnphM2tqNUd4R1ZJ?=
 =?utf-8?B?TnIwQWZJMzhhRFVTa2I1ZlI2ems0a0VtVUwxVm5mR2ZQTll3dEg3RklNZDF5?=
 =?utf-8?B?N1ByZ1dXd1lJQk9LcGREOW8zRE1ZeC9qWUNHUHNYaWcrWHBXeHQ2T1Y1K09Z?=
 =?utf-8?B?KzBNSVVUWUwzU1ZNcldaYWtjTmc0RERPU2EvZ0dvd3piaEZhYTNWYVlQUHIz?=
 =?utf-8?B?cHQ3dXRuUG5LUyttbzBhem94cndnSTRwTEpmb3RLV2EyUVhsb3VxYVdIVVlD?=
 =?utf-8?B?KzhHT202UkVBZDMvbzJiK2Z4ZGdmS2l0ejV5WmpDUjFLTGxtZFpVcDl3eEhV?=
 =?utf-8?B?TXpvcm5wYUNkTVdJMEJ3YlpFbE10dmdtSGhYc3MrOW1PQzRKbUF3TlB5RXR5?=
 =?utf-8?B?Z0JhSUovbCtSb3puL29HNXB1azZ4ODNaUFp1dHRuL0lNblA3YVNmWGJmbTVm?=
 =?utf-8?B?eHZyR1pwd2tTVjdra3hvNC9GVkpXdWJWaTBpb3FxT2hqb2JzTjdCUjZPRkxD?=
 =?utf-8?B?azhnSnd6em1ydHlYRTJ5T0VyYVExWERUTFJVQTgxbDFwd3JJKytOeWYrL3dE?=
 =?utf-8?B?NmM0K3BUMDhLV1JPazc2QjkzU3IrZkJpaXFoUWNheFM5d1c4T1ZoODVma1F6?=
 =?utf-8?B?MzZmRUFJeHhva2pGQ3JDdHBFUVVudWQwN05HYU1aU2M5cUcwVHc0Kzd2QWZ0?=
 =?utf-8?B?V2xYSnh3NWE0RVNwU1k3ak12SFQ2WEN2M0RNMzNHWGR5ZHQwY2pQTDdrTUFQ?=
 =?utf-8?B?RTNLTGRXYkFEUk9PVml1eFJ6ZmxwTXdoalhFMVRteE1hM1J6d2NXN09URTdx?=
 =?utf-8?B?UThkVjBhWUkyNENkZDkrR2svVzBlVTZ4V2hVWjU4VHhwclJlZytUM2wvWlU1?=
 =?utf-8?B?K2I1R0NrZSsreHpQamVlc2ZTY2Y4VVJUdTFaeS82bENmM2ZxU3lYaUhUYjVP?=
 =?utf-8?B?ck4rU3pDaGxMNVo3dFczbjVkLytZZ0VQeXRSK1pJRnNJSUVtejBlVnZ2K0Zu?=
 =?utf-8?B?NXBLbHBicWlkbDZtblkwSFAzY2JRNGZGRFN4bk5KNU92TDBMcHAyTVJpY202?=
 =?utf-8?B?Y3VveHQ1cFBmNWNlaEtKN0toTGVpcFFmeWJwVlRML0FjVm5GTExneFdCUHpQ?=
 =?utf-8?Q?LxE30o2h1vecFVIIGeR14pnkm160ZgQdyn6FLxC1MRj6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5399ea0-0e6b-4d9b-4372-08de2909d9f4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:25:42.3794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LckVErckwPxWMx+2M2Ski6mnHx6YOkxMRKvUomAGcN1iJT9bMxqRitUPG5CnluunpHU3mXfKEB+PKdtIbVqOJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8773


On 23/08/2025 06:54, Prathamesh Shete wrote:
> Extend the existing Tegra186 GPIO controller driver with support for the
> GPIO controller found on Tegra256. While the programming model remains
> the same, the number of pins has slightly changed.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>   drivers/gpio/gpio-tegra186.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
> index d27bfac6c9f5..c9f1441a7b30 100644
> --- a/drivers/gpio/gpio-tegra186.c
> +++ b/drivers/gpio/gpio-tegra186.c
> @@ -20,6 +20,7 @@
>   #include <dt-bindings/gpio/tegra194-gpio.h>
>   #include <dt-bindings/gpio/tegra234-gpio.h>
>   #include <dt-bindings/gpio/tegra241-gpio.h>
> +#include <dt-bindings/gpio/tegra256-gpio.h>
>   
>   /* security registers */
>   #define TEGRA186_GPIO_CTL_SCR 0x0c
> @@ -1274,6 +1275,30 @@ static const struct tegra_gpio_soc tegra241_aon_soc = {
>   	.has_vm_support = false,
>   };
>   
> +#define TEGRA256_MAIN_GPIO_PORT(_name, _bank, _port, _pins)	\
> +	[TEGRA256_MAIN_GPIO_PORT_##_name] = {			\
> +		.name = #_name,					\
> +		.bank = _bank,					\
> +		.port = _port,					\
> +		.pins = _pins,					\
> +	}
> +
> +static const struct tegra_gpio_port tegra256_main_ports[] = {
> +	TEGRA256_MAIN_GPIO_PORT(A, 0, 0, 8),
> +	TEGRA256_MAIN_GPIO_PORT(B, 0, 1, 8),
> +	TEGRA256_MAIN_GPIO_PORT(C, 0, 2, 8),
> +	TEGRA256_MAIN_GPIO_PORT(D, 0, 3, 8),
> +};
> +
> +static const struct tegra_gpio_soc tegra256_main_soc = {
> +	.num_ports = ARRAY_SIZE(tegra256_main_ports),
> +	.ports = tegra256_main_ports,
> +	.name = "tegra256-gpio-main",
> +	.instance = 1,

Shouldn't this be 0?

Jon

-- 
nvpublic


