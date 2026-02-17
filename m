Return-Path: <linux-gpio+bounces-31763-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKO3M7CPlGk9FgIAu9opvQ
	(envelope-from <linux-gpio+bounces-31763-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:56:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71D14DBF1
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 16:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59FE4302FA9E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 15:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EDE36CE10;
	Tue, 17 Feb 2026 15:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="s0klKonx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012026.outbound.protection.outlook.com [52.101.43.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324BB280A29;
	Tue, 17 Feb 2026 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343758; cv=fail; b=FJw7V7QTPOZn4JMNhAIRcCELzutB5NAFv+pQeXFdorg4MwmKD1yfYnkTNAkUrFrzqy1ib2zBE2xMZzzFcXjaqyLAY7uH2S1pzNKG5WjZPDwEAjng/qZsBZ1G0Kkc2HCYUmz4mh6A9L2bRKYxzvyl6+szpowPiE/5ent9j8HnF/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343758; c=relaxed/simple;
	bh=rmh22rfRQnNdCovKr8ZQUUIgGJBoWpUTzebVBS0YSzE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EAaeZWLlHUbmEVH1s95x7dYuUBb7EqqP7xmaRW7HODj62v5+8UnWTGf+V8sJkGobWhlvg1sRI27Qo9RXFCEuzlbfkkAV/qeIu0EsHjwwaSGQn2lbUuM8/u/cP6+BxBybXE14LZSH4kXyd+6aSQWhzB/Bj+P8DHsiJH8g/W411lg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=s0klKonx; arc=fail smtp.client-ip=52.101.43.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3oHWue7uV4hvALJTJ8a6hTTuoWIf4avVnadhuul9fmqX5KngNxpAmdLqgcqTm30auVyjf+o3S44qU2pk7nFqzs7UWlSomsGGHvrL7QOi55TBQWdvIHhlwENMTOOi+bJEHvzIIaxSsiK4TAb2ODZSijnuYmhBFc/NRPMAYYQcKTqbDNJH27mO4EuOUwiryomdbyMJ/cwDRbKUfmlxHgYZX5rs/IsZ/Cq13lW16I5+SFKZ1emM8O9iVfcFolheN2RPAI+f4WUpFdTb9yINm4a+nz3t2Levkd1zdfTdR0O7vQ89lUSeW5toxLB1Zg7Xf27T32JENYhrTqGckRP2O/kcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMZIhBEhaSqfMfyKwj5jnpAaX0wwOwBwSllX8jsvr5U=;
 b=BID/1Y8w6wYTq+uRADbkqtKb2lPNAa50zp3AKwYYMbs3rv8ZSc23LFBra9JVDn+peuYhwPbm27j1zMh/+/sHJmcOTlzDJwpHRLeBzW+0D0dXwmp+NEq//d1y0V5AcdZrTpW6+O/jxlPESm3n9wj9ORt1t5wTtr/+SyaWa6cxSImsSVlKy/+x0+0Bc+avznIDUmyD4eFebUQ0xC7ebobT9d/vTEjsGkLT5sCKfVA6QglzHRhb9QFy/hITt6jh2W/q74l3HZdSLb9bHiJlBqnccA/TB1OPLbnUdJv/FCsANjUobZ7b6fdNyW3UxlEOk2z70AE7Nq8IWXg0cbtfWpTxFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMZIhBEhaSqfMfyKwj5jnpAaX0wwOwBwSllX8jsvr5U=;
 b=s0klKonxPkXyJGxcmRjJSpFUaQQCo1GCQeYY3EiSNFQNIkVymPVf9vLa11lA2xaqYIm+jNSLt6kMFOS10kayBIq5gtcfiSZ1QhzpUnfZRXed8c9byPK4no1t/oIGjXbTFOY/OF8XXVMNBCkKTWZ+VlnzceN9o43ZlPFYSuX90RGV5keNtPFMjXOWzGQxt85GUYQvMTkXWHv5+SbFrwJpEc+yUd7uCEa1TEvr/S6/FjiKERLo+3vSVpanQnouyF1UEHBZd3fMhHE38n/p5ZMjFIxfb0Qcl4DWXef/wC9Uym3U/ht1xdYstytd9uOYa5kpRWGAH7QfcpMVGpW8FSe2Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 15:55:52 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 15:55:51 +0000
Message-ID: <a97f726e-58f0-4cdc-8e4c-a11c1e1c76ef@nvidia.com>
Date: Tue, 17 Feb 2026 15:55:47 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::8) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: ecebf929-9974-4599-bb6e-08de6e3d0653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YlZPQXBvRWJkVzI3MFpJU1hlNEFsNEJWa2QzZSsxMy9Lc0oxRWhQOVFhVEll?=
 =?utf-8?B?U2tXd0hXMDdneHU2ZTVGeEx2TW9LTVVoc2htU2czVjVCMm1VQVltZG16RzE1?=
 =?utf-8?B?R0ZTdVdSVzMzbUIzM1Q3NGlTYlZyZmhmczZNV3dWV3JrRURVZnpXcXpyYXoz?=
 =?utf-8?B?Zi9jdHdnTldzODRwSGM1SFAwdytpTHJzcUcyL2V1OGZ4TUNEY0tmSDM3YTV6?=
 =?utf-8?B?Wlk5bjVkVHI4aTVPMWxEaU5WcDhmekE2QWpkSmdkZnJvUmhYUXlydlRaZXll?=
 =?utf-8?B?UjlRbEliUnNkOGNNaWFSQ0dFT3VWazNad0ZNNmpuK08xbzRZQ3RLQU5nSWIw?=
 =?utf-8?B?Q0tQeU0vby9Gc1V6MjBtMS9YQ1FKWXhXajEvWDM4Q0VjVnpmcDIwSDJZZmNk?=
 =?utf-8?B?SUp5OGlkYWFTV1hpNlQ0azRzOGZPcG8vdC9rbVpJSW9SVEp1MVFhYjFBakFm?=
 =?utf-8?B?Rmt5THNtVlcwR2xVWHhVV1FubUtISWtkejR6S0RJNGdPejAwV0NET1RiR1lF?=
 =?utf-8?B?cVZhRjY1cWFBcyttNFFXSXRlSDBNa3JLdlgrNitlenp1MWpMWjBaUEtzeXF3?=
 =?utf-8?B?a2Y1MGttVUFYWTZIdEpBeDEzcVNydW9hRjl4QytXbDllb1FFcDVMMS9MNkVq?=
 =?utf-8?B?WHVTaGpaTjF2SzJxdGEzekcrS3hKeGc4QmJaVXZ4OFpEQU5Kc1UzK2YxeHRD?=
 =?utf-8?B?Q0pxUGxlcndMZzdLSkhuQXc4bjhHTjd1YW5PNURoQ3o1dC9aUnhOekpIRGFs?=
 =?utf-8?B?V1JQRTk4REhlQ2JaS2dDTG1sVW1TRUNCVXhEOHEvVDkwYTBFclc4cGc5Q1Bl?=
 =?utf-8?B?bkxrWmxDcE95MnhPbTczZVhQUThndFI0ZjN6WHh5MTBlYXg4ai9FT0M3M3I2?=
 =?utf-8?B?YnY2WDgrYnZ5OFFybmRiS0xXc2xyNEgrWU8xUzVPWnNyNkRnMTlUU3hmMWIw?=
 =?utf-8?B?MG9wUE80bHdoUi9kZW5BVGZpZXBiZXVzWWNNOWh4dXQzTjFESnBVRTdlNzlk?=
 =?utf-8?B?V3lmcFNIczNyWCt2d0xzdlFoMTd3S2VYNCt1TVJZWWNQZjlDM0E2Z0dnbXo1?=
 =?utf-8?B?b3ZWbktOZW01TUo1MFJERUViWVN3MDdkMWJpcTJXK01ocFVSaDB3bXlyQkZV?=
 =?utf-8?B?Qm0rcWFQdWRZZTNJUUFFOTllb2l1SGJwZEtORHQ1WkRHZmI2WThGQnJEWVAx?=
 =?utf-8?B?bXlHMXVYTy8zZUpXWDJxR2U0WWFVOFVQZFlVNWFlSWg5d2sxMUc0TER6SUho?=
 =?utf-8?B?QWhZT1M4QXB0eU41K2IyQWp2eG9jN2wzNmNYQWpUOURibWFWanZoZVhaU1ho?=
 =?utf-8?B?cU42WnJER3Bqa3NiQzErYWFSZC9jWks4K3BNZTBJT0d4cm0rcHlZekVzam9X?=
 =?utf-8?B?MEh3eTJNQ1lzOW5FMzY5OGdHZ2lGMnQyUTBRNE9ZeHF4TXpMSmZwUUZYa1FI?=
 =?utf-8?B?cWd2cmFrb0czaVNvUnpGTFRqc24xdm5Tdzl5MW5KamNaa1ZHaE1LaCs2MHdp?=
 =?utf-8?B?bUJmTzNXVkNoSCtmZUtFVkFwUFA5Q0lCWk1ZVHQ5Q09xK0E1c2duZGtCUnhG?=
 =?utf-8?B?VUFIWGswTEhRN2hSd3owQzFHb3pLM0g4N01mejd5TWNBVVFwWmQyLytoaEwy?=
 =?utf-8?B?cE1IM2tVTVF2a1BFU1dBc3hOMFVHYm1ybFZRWTBuYWxEMFNoMW5mRmZVcXh5?=
 =?utf-8?B?bThZMStPaTRVbm1BNVFzZ2g0SVdtbFFJTTF0YkhhVllDcksyNzBRU0dYdkZD?=
 =?utf-8?B?dDBncXdPYUFwcmJ1ZEZ5WlN0YUdpbmNDdWVaUkNnR09JdU9STG0ycVZOc3dy?=
 =?utf-8?B?RGRMMWx2ZnR4TTNqcCs2Sjk0NEhJN0FyanA0dVBydGV5TVFCVXNGSCtBeUdL?=
 =?utf-8?B?cnhsWGs1RnU2SHBKU2lrQVlqVG4xU2JsbW81Rmpvc2NJWE0wdU0vZjdVNTIz?=
 =?utf-8?B?eUJ1L2M3Q2RoVGIwVitjNnk4dlpMbnNNY3FtK25vVE90QTB3L1BIY1RsTU05?=
 =?utf-8?B?QmtPamFqODMyek02bytadDZ5MmlxeXkxMFUvM3RVS3hDcDFPcHFVMEl0dHVi?=
 =?utf-8?B?djB6MWdvc3VQbFEyQS9SNjVRS0FKL2JYQzhveU14QmMvSTczMlNldVhJYXlQ?=
 =?utf-8?Q?3exY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW1PMWVTVk0zQXU4TkJQRnlOcU9kSk5WVVI1WElRY3RXOHdQNCtWMjJ5TVBJ?=
 =?utf-8?B?QjdWSWpsczh5MHArM0VYNEhWK2FEN1NKOFlZeHJVYXJsM2hjMkRqUGRwNmRT?=
 =?utf-8?B?MUt3YW5TdHhkdUpreDhyWG5SejBuQitUZVdzeW5waHVrZ243ZnhiUzNoWlF1?=
 =?utf-8?B?Q1lXZlhjNk43Uy8vZlpFM2NrSTk5MEQyZTF0bTlIRXdVcnpLc0EyZnZ4U0tx?=
 =?utf-8?B?ZXkxMGdFdU9xTkRVbWl6ZjFsTy94VVFNemlIM3M5dENrb0JYRVIwUGNsQ3lv?=
 =?utf-8?B?SjdoTitqMnFjU3NGWG9PVytBUFN3b3hLa3RkOGlGdDBvYnBIWmUzazJCVGZs?=
 =?utf-8?B?Ym5CZlVTRlhoNzBROHNVc1NtTXlQL0hLZ1FPeUNPR2FtMU95MkNISmxZMDJ4?=
 =?utf-8?B?ZXc0UDRMWWhhSDBwSGg4SDJnOE05NDhOUlVPTVpLaFpKVkM4d1VjU01lNjV3?=
 =?utf-8?B?UXpLOXUvem9Kcnp2amhCM3c0WlNHR3d3cnB6WDJUMWNPd3VsVVlhNUZmd1Bk?=
 =?utf-8?B?RmkySHhodXQ1SGFrVFV1TjlDUlpPMUdaQkhINmRLOTAvSHZENm1ISm94Z016?=
 =?utf-8?B?YkhmSytGWU0zVkJTSHlJYmRtVURHV3dKUHJULzFjWE9WRkdBeGtSRUl5MGRo?=
 =?utf-8?B?cG9jWUx1NjQwWDVySlZwSjFoZTQyUGtmMUFocDAwZTVvblNOVUpZV2pRTVFD?=
 =?utf-8?B?aW5UVDUzaEZzekJGWTljZXl5MzhIanhGNEZQZ3NrMHV3VVVhNDdDZnE2NkVX?=
 =?utf-8?B?cnZSc2xNTFNhOUVEN1JEbldyQkdaY3VmbWZ2RFYvKzNtaVdKMklFaUwyZkNt?=
 =?utf-8?B?TVVxYUpFdng5QXRIbEh3dVpleFVXS1BaQWdCalhhUnRDZnI3NXREbWxVeTR4?=
 =?utf-8?B?Q2lwc0JpenFOaytsK0tJWW4xdGFBRURWSTlubVVkanJzYURYWHlEZzIxdHo1?=
 =?utf-8?B?SVdsa3NYODQ5ME1MKzRkWTUzdm5yT1c5cjdwMGZSazFsaGtBSTBRSmZBQnhU?=
 =?utf-8?B?ZUtmcGlZbU9iUDZFcFRPT0I0blNxaVRnSFA5ZDJIVlJZY0ZDVFM2WXRzQm5K?=
 =?utf-8?B?K1ZUWXZsNW52dFNrRmhoV29SeUoyZWhnRCtuZ2I5QjRlNkoyK1hjbXlXMVps?=
 =?utf-8?B?eTF4dkx6UEdKckoydnhFSnYrU3Rad3NPb1pBWWpZTWhtY0NyQU82Z0NKZ3dC?=
 =?utf-8?B?UXdtelpJWEVadS9wZnNldm5YUG1PS1VXS0F0WS94TGV5Q0d6a0JIZEZnRlF4?=
 =?utf-8?B?YTZGWlA1Z05XYkRnMTBDeWZHSEpBQW5PYThTYWFPVTdkdFZOUmsyZkN4ZG1u?=
 =?utf-8?B?L2E5YmpPenRicC9iQUhkcUZ6ZFd1a3NxQ1BTenAvSkJBM1hBUmJvNEZjemJv?=
 =?utf-8?B?cUUybzRQQmNTQWVrREdya0wyeUEyZ3NFcGhpOWlTWm95RWMyUTlsOVQ1QXMr?=
 =?utf-8?B?emFYeWpLTm16dXJFd1k0R25RTTFLRkFvTU9RcEFDOUhIMG8wTldqSmVndFhH?=
 =?utf-8?B?KzR0enZQc2lCenZvOUNLZ1NMVVh3clU1MDBzVFlveTBIb2pQZXpwY2lJSWJV?=
 =?utf-8?B?TGMyekRyV0twLzVCR0ZBMFJQZ2tRajczcEllWnZPU2RPem9PMkNzYVZVVDA5?=
 =?utf-8?B?Y3I5bzhueWtzVzdlVFB6VjYwYU5OMFdNUVpnRTNHR3Nodm15dFZwbE1jMUhN?=
 =?utf-8?B?UFVhdEtUekRDUDZLNnlJME4xY1JITkVmVWdXa1RrK3BaZHFRNzlCYW1sejNz?=
 =?utf-8?B?d2NrMG1aVTBqYzJlUGpQY1ludFZ4TzAwVGZYK0V5NmxwUE9LeU1jUTI4dXd5?=
 =?utf-8?B?RzBucDMvTjI1SDJrTzg4bWlWSDZpTlBzdkFZREZpT3VsdGgveGY3Uyt4VTQr?=
 =?utf-8?B?aW93OUt4SHdvaHBlYWVPcjdobDRvSnNnbW02allDN2RWSUtkS0VFNlRBdHFn?=
 =?utf-8?B?TURSUW5mT2VaR1I0cW9YU2dLVWR1ai9FZVZzUGoyYy9kc2VGV0JGR04wUzZQ?=
 =?utf-8?B?M2hxZWlIeHR0RGpJN2M4ck1vQWtSejZXdXRlT0RwZzQyd1NLRlEzTUxxV3R6?=
 =?utf-8?B?eGRkS1pCb0c5aGVNMk9mZ2RlU2g1SEQrNDNxL1Y2SXE2SStVaXZGYVRQYUV6?=
 =?utf-8?B?SVFFMmp5bTgzS3Y0S3VuYTZod2hiZ2lLY2M5ZmZkZytpYzRrL1BQWTNyVC93?=
 =?utf-8?B?MXY1OFB0cW5mNG5HVXVJZllwVHJzc2lhUjVKMEcwY0l0UjNlazRvOFR3TWgr?=
 =?utf-8?B?SUdCNDZ5bVhveEcwYW8yU0dkU0lKcThFOVI2Qk9LcUNPQTN0Mmt5dFBvVmNU?=
 =?utf-8?B?cGdVcUZFWUp6OVZhcEYvNUVaOTBvdEtoVEJ2TG5YVUlNMW9FZk5FQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecebf929-9974-4599-bb6e-08de6e3d0653
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:55:51.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61WrWRDYr+jzrYQXr10KoibEUuDv4oSUk6DKFHCYcu6Ou+4hY+Qh8K3jdfIWiED0ulEpFkM32idSgSO91WHYwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31763-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[armlinux.org.uk,nvidia.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathanh@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,kernel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 7A71D14DBF1
X-Rspamd-Action: no action

Hi Russell,

On 17/02/2026 15:40, Russell King (Oracle) wrote:
> i2c-tegra marks its runtime PM as IRQ safe using pm_runtime_irq_safe().
> However, tegra_i2c_runtime_suspend() calls
> pinctrl_pm_select_idle_state(), which eventually calls
> pinmux_disable_setting() which will take the desc->mux_lock mutex.
> When this happens, the result is:
> 
> BUG: sleeping function called from invalid context at kernel/locking/mutex.c:591
> in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 12, name: kworker/u24:0
> preempt_count: 0, expected: 0
> RCU nest depth: 0, expected: 0
> 3 locks held by kworker/u24:0/12:
>   #0: ffff000080020d48 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work+0x184/0x628
>   #1: ffff80008225bde8 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1ac/0x628
>   #2: ffff000080ad90f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x2c/0x188
> irq event stamp: 97058
> ktime_get+0x130/0x180
> _raw_spin_lock_irqsave+0x84/0x88
> handle_softirqs+0x448/0x494
> __do_softirq+0x14/0x20
> CPU: 1 UID: 0 PID: 12 Comm: kworker/u24:0 Not tainted 6.19.0-rc8-net-next+ #591 PREEMPT
> Hardware name: NVIDIA NVIDIA Jetson Xavier NX Developer Kit/Jetson, BIOS 6.0-37391689 08/28/2024
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x18/0x30 (C)
>   dump_stack_lvl+0x6c/0x94
>   dump_stack+0x18/0x24
>   __might_resched+0x154/0x220
>   __might_sleep+0x48/0x80
>   __mutex_lock+0x48/0x800
>   mutex_lock_nested+0x24/0x30
>   pinmux_disable_setting+0x9c/0x180
>   pinctrl_commit_state+0x5c/0x260
>   pinctrl_pm_select_idle_state+0x4c/0xa0
>   tegra_i2c_runtime_suspend+0x2c/0x3c
>   pm_generic_runtime_suspend+0x2c/0x44
>   __rpm_callback+0x48/0x1ec
>   rpm_callback+0x74/0x80
>   rpm_suspend+0xec/0x630
>   rpm_idle+0x274/0x42c
>   __pm_runtime_idle+0x44/0x154
>   tegra_i2c_probe+0x2c0/0x540
>   platform_probe+0x5c/0xa4
>   really_probe+0xbc/0x2c0
>   __driver_probe_device+0x78/0x120
>   driver_probe_device+0x3c/0x160
>   __device_attach_driver+0xb8/0x140
>   bus_for_each_drv+0x70/0xb8
>   __device_attach+0xa4/0x188
>   device_initial_probe+0x50/0x54
>   bus_probe_device+0x38/0xa4
>   deferred_probe_work_func+0x90/0xcc
>   process_one_work+0x204/0x628
>   worker_thread+0x1bc/0x360
>   kthread+0x138/0x210
>   ret_from_fork+0x10/0x20
> 
> This was observed on the nVidia Jetson Xavier NX platform.
> 
> Thus, no, the runtime PM is not IRQ-safe. Remove the call marking it as
> such.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> The IRQ-safe marking was introduced by commit ede2299f7101 ("i2c:
> tegra: Support atomic transfers").
> 
> However, since then there have been patches disabling the IRQ-safe
> marking:
> 
> 9e29420ddb13 i2c: tegra: Don't mark VI I2C as IRQ safe runtime PM
> 14d069d92951 i2c: tegra: Do not mark ACPI devices as irq safe
> 
> Clearly, the presence of pinctrl_pm_select_idle_state() which can sleep
> means, definitively, that runtime PM on this device is not IRQ safe,
> and if the original patch introducing atomic transfers relies on these
> being IRQ safe, that patch was incorrect (maybe on such devices, it
> should not change the pin state, and the driver should have a flag to
> allow the driver to be used in atomic contexts?)
> 
> The alternative to this patch is to get rid of the pinctrl calls in the
> runtime PM path.


Mikko recently posted this fix [0]. Hopefully, this also works?

Thanks
Jon

[0] 
https://lore.kernel.org/linux-tegra/20260217-i2c-dpaux-irqsafe-v2-1-635a4c43b1a7@nvidia.com/T/#u

-- 
nvpublic


