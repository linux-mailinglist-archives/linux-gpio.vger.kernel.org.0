Return-Path: <linux-gpio+bounces-30974-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAnrFR5Ac2mWtwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30974-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:32:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B168773663
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 10:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 41B37305EFD4
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162C2364EA5;
	Fri, 23 Jan 2026 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M5VE8QB2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC0235FF62;
	Fri, 23 Jan 2026 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160583; cv=fail; b=H3/LzIpshlLYZIGS8z72E70DFcD3INit8Er0qMhhuYMYDUldgsUTYaXtwjefOGUXKNpC6/jU+lEVZ0/QVAEbE1uB1Ixbl4yJ8an6tJ+lzD4byq7U1egO0fplmoiVc4MvLoMQKDgau86g2TH+Y23/qL73mR+NN/8LOeRR9N4YD+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160583; c=relaxed/simple;
	bh=WwFB2JCJcL6I4K/6cRmu7P/SMASi1UySVU/H4+n1bUk=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DT1vd5m0Pl/LghT2wV/SlnxuNd5ba2G/BRHsA1F/5f4WN5ylV5NLtMi4DF4pW7YMC+kXmhBvSYhlHX6Ts+PVh4t9/7RDfTNIKRXV+pTXXxKgqlypiU930iynbqYUyc8Yo42EesWPe6Q/K6IognH/HmA9PP9wpu/KqLOp3GomkCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M5VE8QB2; arc=fail smtp.client-ip=40.93.195.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBy3BVqxQ1/sawwUBSPdBkmn/SL3bGSwbrQUnuCO/E0mYnZGP5ZxeljX3zcNpYX8alnyXHMhO+6p+7/rzJ/oL9a69/ZWIXKfvBZI7OG1FkLRbfQmC4mx8u+ntpaLvqrmEv0dfNN98Gn6jmYiTrhNybCdTn5HJU7aGe0sQkbDNWL9jsACOWhrOGfe7XXnRVv3F6jZurwlc42+2TqqNX5TR0XgbO/7G3l+HijiUXmsYhsnL2QrjKTUna32ehruytzl0drr9i6SY2C0XW+6b2i4zeQbUzyXYE1I+kmI+8IlD9uUPsDs77Ys6xbliXTlVi4PDn/Lk1VQVQ0Sz8ePbaBNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29rmhXL3d3FaSoAuuodpSAHA5B5k3QTB3rpZgMDGGrU=;
 b=gCJitACyr0C4abSFHUPmXtfmhPkp9k7RSZ9YjBS1eVD75y0TXQFWkfh/yqXOzomGZId1CgObkhGq1bodq3PDQ54qbfaeJaj8hXWZHN+DLggzsxvIKPyepZW7AOMP6r62h3Ud2Vv+LT+U5n9uMG8/76Zy8OJcsd5Mhjk2U9Tq90b1SIsAkaiHNffoeK28IjH4IQUo9oxsfRqo9TQdjlWNSfxEx9sC3dBM7ilAR9zmsV1ix98+N/Uji1Y/SlVWXsAV0zY9FBC8oW4fzjuWvbZRbifo8zvSFfB2Hy8q7VHKRGws5clBgQ67WC9xlyYnHY7VrKH87hmSbJtXKpRHET459Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29rmhXL3d3FaSoAuuodpSAHA5B5k3QTB3rpZgMDGGrU=;
 b=M5VE8QB21ddWgLTwsP36H7OzIWqkHE8e4lS8K4wGO3SqXzJXPJkD/f4zvpRBDz9p1TnAJph3RMGrxR9VXksCO4x40QPQ7p6k8OfJAnQRroC4Nb+NpwrpQ5JyVSXaQSzWhr1UtG5UZgCb9xDjHCkv/OK6TGsNNMdYzm7uVsa7zaycCW0Hn/DKSRB+6CHXaxSdkU5LZ166i/eTz+r6ViafHICC/5Pvvij2Mz7XqqeueJ0O5l232HCzuGUwj/Z5rXk1zCXJewKvFiQxKhi/u8r1Ch8RUD3/JfwxjO7z8SDwtTf2bgmqw0ZH/cTVJCQC9D44vBWym71EkUbFWQEgwAz4ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 09:29:30 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:29:30 +0000
Message-ID: <20c30d15-fc36-4db5-bdb2-30f8a45f9cf3@nvidia.com>
Date: Fri, 23 Jan 2026 09:29:23 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: tegra: Add Tegra264 GPIO controllers
To: Prathamesh Shete <pshete@nvidia.com>, linusw@kernel.org, brgl@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
 robh@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123064140.1095946-1-pshete@nvidia.com>
 <20260123064140.1095946-3-pshete@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260123064140.1095946-3-pshete@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0227.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::16) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b375fc1-7581-4e75-af8c-08de5a61e923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWpOZTliM0hWOFlJWGJzcWZtV3RWZXFsbHd0b1hZWlBhQTZ3aDJiR1JtQk9N?=
 =?utf-8?B?amhFbzBDV1R6VVRvQXRjS2xlRDErdXdYWTRKYVBhRi9nTnJzM3Bpb2pwWmtS?=
 =?utf-8?B?ZXEyQ2lCWjNkd1d5SytFRCt4UHVIcTBEZ1RXOTV2c1JoeHNicXhPd2MxeW1D?=
 =?utf-8?B?NDJyZVpENlI2bG5MSVZEMUt4amdrZE4rb1hBWXRZTGtyVzFqRWxiYkF1OWxW?=
 =?utf-8?B?T3JxMHE2RnY5VnY4OVZLTlJIVXhpcVhHdjdBbDB4VFdkRlBoalBabVVMWVVU?=
 =?utf-8?B?SFFpcHRYL1hIVzNrSE85TzlJRUdLdXhJaTd0VmplemJKOWJjZjdtaUVzWklj?=
 =?utf-8?B?VlhGR09ta2hKZjN3UVdmK1VFWFpYYUpBeW9VZVJsUmg2UXI4VHZreVdTV215?=
 =?utf-8?B?NVZzQjVHZmlCd0lsOWplbHAraEk0QnM3TkhMODlOQUZ0OWx6UlFEVU04U0Vj?=
 =?utf-8?B?VnlNb09HaDJEdVRoVThSdzlDTjF6SU5hbkhuL0tjV0oxSXA4NVJreDNCOUhM?=
 =?utf-8?B?cWRKdTBRNUdCeGpWRkNuS1BESzUrbklHWFBXRWEwdHlvZ0VPYTZTdzYvbGpD?=
 =?utf-8?B?Mmw0S09IM3R3eWdEUTNCcGJzTkFJRUM2QTg1Wk9SSW9MbitSTTN4b0IwZGZa?=
 =?utf-8?B?Zyt1SVI3bkZOWFVTODhkNjdXRGpZMk81ZlVydFlWWmpkVjQzZko1bG9qRDB3?=
 =?utf-8?B?WU1EbTBQb2lYRzJVMUNNdnVmdjVoaEFTWXYzYzg5R3BzRWE4VzRHVk94Yys5?=
 =?utf-8?B?YlRQL1l5MXQ4YXlJSmVHWU9YZG8zRDlvWjk4b2RpdVRsRlBRQzdrQ2p6QVBD?=
 =?utf-8?B?M3FIMEkzakJackV3YVJEK05JamdKWTNuY0FaZWhPdXF2aFM0V3NxNU5nOHQ4?=
 =?utf-8?B?WUs1eHNlRzlSMXdpOVFEOW5aSkpKTzhDRU91OEk4L0o0ZmNJSWF1T2ViRlJR?=
 =?utf-8?B?aElWM0J4dTlMQmZVbnE0bEo2RVFZRGhVTXdVKzN0T1RDUXpnOWJHSjl3ZDdp?=
 =?utf-8?B?ekZwanJrSHN0MklPTEVSUmdqa2swWWtGaHI1bWRvd0ZUS1VlZ2hyUEV4QXU2?=
 =?utf-8?B?WUtpdHh4MXNEY0I5Rkg4ZGpYa0RORUM4eTlFbjZWQy9oVU5MSzhHZ21hd0hr?=
 =?utf-8?B?bjE4bFJicVBZK05EeTR0bVk2Vy83ZU5JYktFT1gxbTlsSENCL0NkazRFZExt?=
 =?utf-8?B?QndITGwwZE9WSCtYc25PRzBNNGJWL29TRUZZRjR1VWwxSUNCaDFOd29aeDJX?=
 =?utf-8?B?WUZuVkdZZ0hCbU5DNFRPWjBZY003QkpPMEVsYmxsUGVab3ptV1g4OHZ3c2hK?=
 =?utf-8?B?MktNSEdwTVdMWVJZa0VwaHUyTVdZZUpVMzN4SS9BWmFPczR1MytwS21GYWZ0?=
 =?utf-8?B?NGZLVDdjUElXNWhEL0xsVWlhVTRYNlRiNTMzV3NESWU4VjVja0pIVHUxem10?=
 =?utf-8?B?SVFadTdLSSthWFFsbXE0WWtGbWlHNDd5aTNyRGd3RTkxTzBvWGZaVysyR3dx?=
 =?utf-8?B?MFRvdVQ3NTdhS25RdTl3cWxDQ0pWQ2FuN2Q1dVRPeUpVRTBQTzREZnNpcncw?=
 =?utf-8?B?dUhtT1d3MHdjY2cvWEJTNGV6Um1TU2pkbGpvY3JZQ0lPNFpUV2sxZUdpTXRI?=
 =?utf-8?B?U2xzakNoVmtXRFVLTCtnN2pKcTEzZFQ0WUtYSWVWZExlYWRhT1ZhNlZQbWpY?=
 =?utf-8?B?bGtUNmJIQVpxbTN2SHBoK21UOEMrSWtvaVVXSjRyRVJxU0R3NkcrenRLSGlG?=
 =?utf-8?B?TE4vczA2R1ZwR2NNbk5PZHRPZGxQS0h1aVBCckl1WWVMT2xzTThXUjk3U1F5?=
 =?utf-8?B?WXc5RjkxZnJWdUtJUDRSMWwxNW81UHk0UU82UkdjN1hzWjdpamxhVkpZRmZn?=
 =?utf-8?B?MWVLaHpteEhMaEp6YzVLcTF2c1VvMXNXdmRrcnJUcUtwemZxaXBINkR5UExn?=
 =?utf-8?B?RFZWcEQrS0pMTHhzcElnaERoY0NST1lSN3hyZU1ZVnhFWGdQd0lTRXdnRmJJ?=
 =?utf-8?B?cGViYnppVmpWYjdaQW9XdWFCTzFGRStKaHgzUEQzK2JOQUxWUGhoWUtXYnVm?=
 =?utf-8?B?V3k3MnArN0l5VEROVDF1b2ltM2NlZGhEckNjdlpJbG1nVGJHSW1hSGo1MGtC?=
 =?utf-8?B?UkFYekx3ZnVDMWdnUGVBWTZ6MmdNbmx4MHdRK1E3TlpsZHlOL2UwaHlQanhW?=
 =?utf-8?B?S3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUF2bEdqNG1LaGd5M2RlYWxUaXFtVVdNdHVJVDhQd001d1AxSkNHOVZjV3pJ?=
 =?utf-8?B?OTNnSmRwMDdGVFFrTHVqZTZzVGtkL3lDdTI3UC9lNE9oYmw1S293Q0JBTWxh?=
 =?utf-8?B?VWcra1pGWHVBMmd6ZFZDZ1pjVkhZdi9FcmJIVm5xZFlZeGNTcTlUb1B3cjFk?=
 =?utf-8?B?bzZ3Wm5oT0dDSjZaL3Y1eU5CZ1hNZlVrRzJoTnBQWXd4Qnp3ZC9SUll0QTg0?=
 =?utf-8?B?S3dDMTVtb3BHaXhPa2owUTMwUm1yYWNqa0ZFR2NsOXNXWG9JbW1kaGcvdWN0?=
 =?utf-8?B?eVJQQVY0UlpCUzZwWk52Rjg2TEtkcDZ3UmYwcllETVlMd0FVc0xPV2RUbGcr?=
 =?utf-8?B?VGx4WkF0ZmlNUmNXY0lYRXNLUTNvR3BnbVdiU3lSY1dEQjJ3MHhEeXUvTWhk?=
 =?utf-8?B?V0R4MDhKa1dsVXlTc2R2b3VnTWRZTFJoTUd3TTRzbkE1ZHR6ZW5YeVlPc1pY?=
 =?utf-8?B?YkltQ1dxdVVjL3NpcHRVbTFUVmpPRDVYYkIzWGJJTXZOZnBDZzZTWFdEMmFX?=
 =?utf-8?B?d0RkcmprK1FEbGxjd01aWXU1R1hNSFVXNXZQMlhFK1BvMmE2eGdQMmR5ZVU5?=
 =?utf-8?B?OWNpNkNLbElGdTFjU04rbWFGWlMvRWZhKzQ2Vi9XSC80OXp5L0NISWI5VVZq?=
 =?utf-8?B?U3A4SGpCbkVlV3dCOUQ1K1dFWHhpWThPSmVRVlorZGs1Ui9scTliVHJnOG9N?=
 =?utf-8?B?a3liWkFIQ0FjenNqaWxibTNkdUZoZ21ITEovb0ovR2I3a1BLUTFkZ3pueEJU?=
 =?utf-8?B?aE1pQWp3M1RDVzFFc3QzbS9UdVVQQWRyL3hRNWRGdU4vUnNYaUpnNy84Uzho?=
 =?utf-8?B?ajBLQUtFbEd3WHNVdzdHVnluQ0RucjE0TU4rb2tjajZ1ZXVaOWF2cWlOVC96?=
 =?utf-8?B?SWNzRnVxbGRpa2xrbVYzVjNyQ08xdk4rbmZzcWJ3VGIyaktUZTBOY2FFRE1C?=
 =?utf-8?B?ZzJQb3dQMTIybXdYdENxNFZaNS95VnluT0Znd01YNFVleER6QmZERERKUm5S?=
 =?utf-8?B?cUN1eWtjenRjNkRxdEtYUHRRSDg1NGxZcHhORDExQlkzVURoVU5hU1FMblFG?=
 =?utf-8?B?M29SOFRpSnVxbDB0cWpzTFM0Z1JWL3BudzlQWDE4TGYxV2w5amVZV2dpdzZm?=
 =?utf-8?B?VzRkakQzT0t5Zi80dytlcmJMSEtselZnQXBVbGxFTXVxQVRlOVY1WHB0Mms5?=
 =?utf-8?B?ZjRVMGxOMGdlU25LMU9ZSzBtN2J1aTZpRDlKczVtWlNzR1FpdkhJUkxUSTM3?=
 =?utf-8?B?L0tBaFNXeFdwaHdLVnRGdDZCYzFSWVJseC9hSUJYU0hYZi83UXFxYlNrTmV1?=
 =?utf-8?B?eWFnM2kyc2Yxd0EycG15U3c2cjBJa2cvaHRJNUZla243cWVKR2xYNjFqalN3?=
 =?utf-8?B?enM4ZW9yZEFNTUR2YlVEOHE4ZFhhaE54VGVsTGFPZExlNWMvWEtwNEpyZlpH?=
 =?utf-8?B?MllwR0Nhb015d2xtdHJ0Z1BnckNELzcrSE1jYjBCYjVGaVcwMDJlVzhDRkF5?=
 =?utf-8?B?dnNTT3l6ZnV4QnJIZEJxNXhKRDd1cGI0NWlUTExUaWFqTE14MXcrcmJPSk5I?=
 =?utf-8?B?YzU4K2Z3MHhKRHJWMkw5SjN1V1hBVzZSaXFiYnFSYkE2bGxyY1hJNUFyS0kx?=
 =?utf-8?B?ZEJQdVg2UHN1SGFleDVNT05Xb0pxa1QvY3pGMk0rakpxUzRjR2JuQWhNcDVY?=
 =?utf-8?B?cEtDUDM0YWNIc2IwTkhLSC9EYjNiWld3dXRQaUc5Yk9zYWgveng1ZHg5aGZJ?=
 =?utf-8?B?aXpyUmd0ZUxVOHdaVS9vdjBJanBKMDF3S1lzRlpNa2R4SWlGSklYNkVjMGVh?=
 =?utf-8?B?RHJ3Tk5vNFMvQUtKR25RN2tNSVlwb2lzaFZjMUR6VXlEOFJ6TjV4U2V5WVds?=
 =?utf-8?B?VzhhK0dnNUgvNTBEQVBHMFhVQjI4WkpWQzU2ZmM2dXNNd09lQVFJbks2NFNT?=
 =?utf-8?B?eFA0NHE5SmxGVW1NSjBkSHlOTkFOSWw4bmpFUmw2VWhGTm5xWnRtRjAweVFl?=
 =?utf-8?B?YTRYTDVpSkEzOFdMdTFWRHJrek5lWWNBMjhFY0FJeU9NNEg1VUpvVTA3ZU1P?=
 =?utf-8?B?dFlpSUlaOFhjSS9MTHJ2TU05S3R4Z1pXYTNSMFYvZmo4WStJSUppNHZNaDFE?=
 =?utf-8?B?SnB2M3lLRzlsUmNUamF6WWRpOFVqQ3dQTkRlZTdFS0JLWFVsWFU5YklxSDZ0?=
 =?utf-8?B?V1N2YWxMV2xYVCtvZThNVXVyYk5zUXV1QktiSGNwM1N5TkY2N3RiQVk3QmhJ?=
 =?utf-8?B?VmpxajNtU1RXZHpxd0pXU0VBSVBETTVrbkE3RU93TlZlKzduYVZvaEFydFVT?=
 =?utf-8?B?L1gyRTdYVW9GbjRLZ0NJdThqandCT05wdkswZURXTUNOUEE0aWhnWWVyK3Fv?=
 =?utf-8?Q?dNaDbY3Qt+b0N3QZQtmkOLt0kSsZP4FNA3H//55wNk/0i?=
X-MS-Exchange-AntiSpam-MessageData-1: Eh/Rug+T+et+Cw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b375fc1-7581-4e75-af8c-08de5a61e923
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:29:30.3714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwk/Lz+VK3XlrnEzhCcXjJ16dBFLNEiWWu2c/HBHcy0mmt+Err3PEyYm/3RQGhEAAWz2iOi+mPweOrAQyLnI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30974-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.126.165.224:email,Nvidia.com:dkim,c4e0000:email,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: B168773663
X-Rspamd-Action: no action


On 23/01/2026 06:41, Prathamesh Shete wrote:
> Add device tree nodes for MAIN, AON and UPHY GPIO controller instances.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
> Changes in v2:
>    * Update Tegra264 GPIO nodes to use “wakeup-parent”.
> ---
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi | 88 ++++++++++++++++++++++++
>   1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> index f137565da804..cf4de2c517fa 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -3277,6 +3277,50 @@
>   			status = "disabled";
>   		};
>   
> +		gpio_main: gpio@c300000 {
> +			compatible = "nvidia,tegra264-gpio";
> +			reg = <0x00 0x0c300000 0x0 0x4000>,
> +			      <0x00 0x0c310000 0x0 0x4000>;
> +			reg-names = "security", "gpio";
> +			wakeup-parent = <&pmc>;
> +			interrupts =  <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
> +				      <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
>   		serial@c4e0000 {
>   			compatible = "nvidia,tegra264-utc";
>   			reg = <0x0 0x0c4e0000 0x0 0x8000>,
> @@ -3347,6 +3391,22 @@
>   			#interrupt-cells = <2>;
>   			interrupt-controller;
>   		};
> +
> +		gpio_aon: gpio@cf00000 {
> +			compatible = "nvidia,tegra264-gpio-aon";
> +			reg = <0x0 0x0cf00000 0x0 0x10000>,
> +			      <0x0 0x0cf10000 0x0 0x1000>;
> +			reg-names = "security", "gpio";
> +			wakeup-parent = <&pmc>;
> +			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
>   	};
>   
>   	/* TOP_MMIO */
> @@ -3726,6 +3786,34 @@
>   
>   		ranges = <0x00 0x00000000 0xa8 0x00000000 0x40 0x00000000>, /* MMIO, ECAM, prefetchable memory, I/O */
>   			 <0x80 0x00000000 0x00 0x20000000 0x00 0x40000000>; /* non-prefetchable memory (32-bit) */
> +
> +		gpio_uphy: gpio@8300000 {
> +			compatible = "nvidia,tegra264-gpio-uphy";
> +			reg = <0x00 0x08300000 0x0 0x2000>,
> +			      <0x00 0x08310000 0x0 0x2000>;
> +			reg-names = "security", "gpio";
> +			wakeup-parent = <&pmc>;
> +			interrupts = <GIC_SPI 843 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
>   	};
>   
>   	cpus {

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic


