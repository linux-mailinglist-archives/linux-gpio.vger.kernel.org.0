Return-Path: <linux-gpio+bounces-31773-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id rC8TOWgXlWljLAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31773-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 02:35:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A0D1528AE
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 02:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43B643031AE4
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 01:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D10266B67;
	Wed, 18 Feb 2026 01:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yu/LZx7o"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012044.outbound.protection.outlook.com [52.101.43.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62372634;
	Wed, 18 Feb 2026 01:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771378533; cv=fail; b=czSf6/5+bbknmgkuYVqCXpH9s2qEWwFjM2iYRkcv83Jp2sOExOob+twc75oK7UlHdb2haMxdYlLdx/dI50ZU+pTc0KQWoVxVMMx+GYJIvleTeHTKpy55N8axQLw1h2D0qgyAmlRXQZgWzB5/8DxVIJRwEAYm9SXbR5ZSiPuQ8O4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771378533; c=relaxed/simple;
	bh=zfQqi86BUOzP+LYFtW7ZegnFtwkjmdzmoGjdN8ZD3e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a3WnDjmwqQlDjgU/cashH3P8N+iAvN6ivXAsJRtiAfmDxuj+YXUvgWqe9I8HQtV65uQJ5/DzLw0MzgJIx2ccBwLvEIDQb2r5JwokWOzjw1KC3AMzgSmJM1GZLA0igsHFZnTzeSItuhv1Km8BoSd8F6D6LvXD04kRdkBeLXkWVmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yu/LZx7o; arc=fail smtp.client-ip=52.101.43.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYWObJytqICc2ROl0pPQHqP/zfDHuR4qPj4/Kn4PtUqUNwmaQUAlW7SzvvnDZ212ThcYDnsNZe5SghUf5Uytb+JxjpzVu8JzUaev/mc62JG/XfbNHgVxc167lUzEyfg7bHwEqoMQY/1tImZaDxnCiNV3ZhTLzcqG6VYeyzSX8yYG++Blkm2it6aUcUO+jxTjBkg7iZBzkV765w6Q8YPXUzHJ3azHVJ3v3y47D1a5sHceF8/MFUNRmuI+a99IZEmfDauxGaW40XKDb5pe3/kIvxlRuXJKQbNILUyf3Ehy+WqX6R++ci2je+szasjj+FFxBju8mnBRCzLV7jmjHvTUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ECDOgWkcpu7zPO8ODFPcrD1QzqRVtxb7yVYLfSAJ7XA=;
 b=zSJi3fcIfQwkvhuCQk3b7EhEJA3Pya4eRqTQVeilgK5K+6Fkh2BSCtBXdKZ0s658Lfmi00vfBMt0UyFoH62Ab5huRztQUEkOy5HW28xJ1NJottdMjFJXKXiHmLJe3iplp/7V/TnrrnSDANBCPgE0gSsxJnERJPYzvd24HTEVCcl7TQoLMbjA49t6E1L9WHuXmLFHcyZPPYNCoIjKddKmPgk0CkuW3hNE1MuiXhZIpoweIqb5oAsAcnRrYnYMINrTIgkA19tUQAi3hDbi8gTdlYTAh6EOWjZrPBT2/ILIx0oB7QDEfOh47MnTfykt2x5n5pwWNHpoYfB8fzqs/GrHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ECDOgWkcpu7zPO8ODFPcrD1QzqRVtxb7yVYLfSAJ7XA=;
 b=Yu/LZx7oUs2X49RlCm3Zz8hQZ4e5stJdZGOiRvaDvtJ1WXco5lnL3G//pCOlWdAsrCGKSTqFcJjuvA/BRbJDgl3wzis4lZNn06soukDbOhJH8Um5UTHxLUdwLURv6+RKfP1rqlWaplfhEtpBlY/bBdaqMFxF9Q2YQJIdRCl2mSqi5xS1dfSeDId0D8AjpRPgNFxXZt12gMW9r5yMnGDYnaMp+mSkMZJtuAwb/WCtU68GqxWaz9O5pmvO7H9rlxTeG9imMYo6FoENtrNhiaB/DRFncdx6IvchzZGpolOPFw7K04P9cx2eDYVmt/udAyyfLQjlD20zosM5HYYliWeRHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 01:35:27 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9611.013; Wed, 18 Feb 2026
 01:35:27 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
 Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH net-next] i2c: tegra: runtime PM is not IRQ-safe
Date: Wed, 18 Feb 2026 10:35:23 +0900
Message-ID: <15817166.RDIVbhacDa@senjougahara>
In-Reply-To: <046c9bca-f6a5-47ce-8147-6e864b364dc3@nvidia.com>
References:
 <E1vsNBv-00000009nfA-27ZK@rmk-PC.armlinux.org.uk>
 <aZSZ54oZS9C1Qf1h@shell.armlinux.org.uk>
 <046c9bca-f6a5-47ce-8147-6e864b364dc3@nvidia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0358.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::9) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: ff73080b-5cc8-418f-fcf9-08de6e8dfe59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzhuV2JrL3laQUNmdlZYcFZLQTRQR0RMQTR3a01QcTFNZXRoR2NSZm0rcWs0?=
 =?utf-8?B?eDhuY2Iwd3o2VmNxV1RaS3hvbyt5SWJRblhWNE5QQ0oyUmdJMUllK3FGQmhS?=
 =?utf-8?B?V0lOOGpCQzc1RHZUYjJuRXVFUFRhd3Z2QlBjNU9raldhRXZVbFo0OU9TeE9W?=
 =?utf-8?B?VCsxcm5vTDlSZVp2bUlBU21Zd0RBVVQ0OG9saXpOUWc3cVUzOGpQM1Q5bXNQ?=
 =?utf-8?B?WVVLbmloL21ISEFiREsrS1pvNkZ2dVluTmN0UENCTjl0RGc3aTYxdW1lVy9T?=
 =?utf-8?B?UjBDSGNva1FQTVR3NmRKZnBiSzZLMHJGMlNRZExySnRhaGI1UlpOb1dMc09v?=
 =?utf-8?B?ZHJmc0tZQTVkY2hJcHpZNnYxUXBJL0g5cllJWnVvcFc2Ly9Nb1lSQ0xKZFpl?=
 =?utf-8?B?KzZwaHZrb2N1SFBQMlpMRnNZZU90QW1CaEpqL3RlMUNad2FyMERtSXBiMkdj?=
 =?utf-8?B?RWl6VWg1c3lQODVkUU45NnNQSmV1bk9jOERVaVZ6OGlaZ0Y0NGVXYkQvcGRW?=
 =?utf-8?B?K3pKbnNJaGE4STgxYXFDVEJwc2RHS3NDTWNHcUZIWG9nWU1LL1ZkaGdGREU5?=
 =?utf-8?B?OEN4Y25UcUNGazdJc1hkTVVtcEg5Z3ZiWHJJZnVXSG5lNHFOZmlsRUxGelV6?=
 =?utf-8?B?MmZJemlreXZvVmNSSEd5WEY5RWFZL3ptWitoS1k5T2FEMGRaaW1reHhiYVlT?=
 =?utf-8?B?cVVBMFBUbEU2dHR3RW5wbEtjYTg4WnUzMXVNTElEUXRyS1FJRTE5dUgyWkh4?=
 =?utf-8?B?N1VMVGJwWFdLWVR4NUViaWZYT21LRUJVb245eEFFdURjNDR6ZEtUSUM5Y0I3?=
 =?utf-8?B?WHpBaVdCN3hPK29McUhGeGZLbk1CbmcvRStSeHkxaHUwVWphWjFyTVdHS05K?=
 =?utf-8?B?WEhBWjdMYWJydDRnY1pXemM0YkNwaHBBcm9JQ2ZqUE9wUW9HR3V1ZDl6bkNP?=
 =?utf-8?B?eXNFb1Q1YytOeURMRUlZSFlOaE9RMTY2c0xudko1UHRrVHJTQzl0bFRzK2VS?=
 =?utf-8?B?TTNobkt6VTZSSXpXRUZNYW5qL1cvOGcra1JxV1c5eW1jeXE0Y3RHNUdlM01a?=
 =?utf-8?B?dVJoWm5CVEZMaCtoMVdVMUxwZjZmeFZsTnpqYW5sSkNVV2RZSDhJVlp2eEpJ?=
 =?utf-8?B?UnFZZjMvZ0JKZVNQWmIwYmNSZFRicC9BWTJaUXkzT2g2VzNxWXJ6aW5hMkdB?=
 =?utf-8?B?K24zaTFRbGFIeFl3b09jZVcwMUxmRlBVZTZ5cDQwU1ZvcGxyOGdRYnJJcEVN?=
 =?utf-8?B?U0tjTDVWcnM2d0ZwREFUQ2xFcW1BclNNdGdYYXVxTGNmSXFnWDJmUE53eVpD?=
 =?utf-8?B?RnJQZmU2RktrOHZmWVZyaE41WWxnTC9VZE5CMXpqczZ5OUo5dm9WcVdBaW04?=
 =?utf-8?B?aFJDNTlqQUdkZllpR3hScThYWEV5RG1jUzd5UVdFVk1WL2tvUm83MEp5YUo0?=
 =?utf-8?B?RDhsOThLNWwwc1pqQTBwaGkrOGFwaSsvVFpIWXRGelg0R3lIdWxzdnU3YjVD?=
 =?utf-8?B?ZnBpbW9YRVFkOVpYOHdwaDluZGdpSEZyenkydmszNUZ0Ni9NMkNVV255Z3hM?=
 =?utf-8?B?eE05RXUrcjZsT2s5bzViMVNoeHhoRGlsODVaVkFZbU9Uc0FodUNiSFFXZFRI?=
 =?utf-8?B?ZTB2alliR0lyK3A0bDJpSGNIbGpzejN1UmZNN1pUSXY3K1dERnB2Rmc3c3l5?=
 =?utf-8?B?OEdzNUtmcWhqWDJxcGgreDNLY1ArY0J0R2Q2TlNEM3A5Y3dCRVEwdEZCUFlH?=
 =?utf-8?B?VUxML0o2c1NNemNhNXZMaFZvZlI1aTB2QUh0S3prYUlkK2JnWmFxS3RWRmor?=
 =?utf-8?B?eUFLcDJZUlhBdlJ0QUduanFoWld0R2hxNmE2SUx2VnIxTWU3QkVMMUlPYUg4?=
 =?utf-8?B?Tkc4a2h4M0RkeUQzSzVwV04zTUxwcm9sTXNDc2ZXdE5BOStqSXA0b2FlOHpr?=
 =?utf-8?B?d3JYOGl2Si85Y1pScDJaUUZCRW9MN3JGaURrVUlVZWZDdW8wY0taam9xT0pO?=
 =?utf-8?B?L0tjalpJMndzdkVJNUNQRXFLdGxlOHJNUnpSZWZUemcxRjlGSGNpbGR4VVcz?=
 =?utf-8?B?ZUVVbVBLRitLQ3YxT2tBWjREaFFYZUUyRlRjYzFoNkVSSmc2bC93QWNtTUtX?=
 =?utf-8?Q?mCrQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1FrNm1heUZBWHBjOFFPdi9XeTRsZ1pLMEN6eTJqVUNVNkhHS1NZNDhnTUVI?=
 =?utf-8?B?QUtMdno0RzlOUkpPRmpWWUYxdU9EUXpza3lsaFBsd0ZIL2dmM2I4RTlJaEo1?=
 =?utf-8?B?R2xmejJNM3BiNllSbDVLNGxLUStUcWFOUDBUeWVtRGNkRjV0TjNxaEhOUUpZ?=
 =?utf-8?B?UUJPWmkvOGwvL0dhZE9xSkJQMVcyZzRUb2lKanhCQUZ0eU5yOVIvczZoQ1NV?=
 =?utf-8?B?VW9wN1RXS2pXUitxK3JzZWZoY3Jsc2VQa2wvSjJVYitzcXZsbTQxbmRqcGpO?=
 =?utf-8?B?TllHdDNoaUh6M0o3OC9wRTVuT0RvWEZWSHpqamlxVlUwQWViOUMwbzg4UTBD?=
 =?utf-8?B?U055VWpCckMxcUpTdk1zVTJQNDR6d25QRC95aGJmdUk4OTRrZ0N1Z1daek9F?=
 =?utf-8?B?U1R1cUhyR2Y0TUZQc1kvVzNyYlQ5NHhBWFRZVFp1WEs1YjNnUkJmYkdEWUhL?=
 =?utf-8?B?Z2MxTWIyQ29tOUEwd3RjU3N1eVplSE1zTFMvMjFQMU1waFFuNzgrQjcwT05n?=
 =?utf-8?B?bkN4RUFpYThlK0JFNlR0Rm5mZW5sc3VaYXlZL1ZiWC9sRHB2dmFhOWFXMVRH?=
 =?utf-8?B?NTcrMmJrSEdoTFRlMXRRNUZ2aGJiR21YTmduVGVXMUllNWZIN2plSHBYczJv?=
 =?utf-8?B?Z2M2N1ZXamltZUNQaktjZUlRNnZvSmVraWozUjJheDRrK3NybmI1aG9KQUpK?=
 =?utf-8?B?cUVQSlA2NnpxRStNR3NOemZPdnM1YjBBWm1vUGV5ZHQ1UGFQS3U0WURwZWxh?=
 =?utf-8?B?Z0ZsUTJ2TzgyVU5kSnNSYkNleXA5SVNSb3hlelphNXV2aXpDa2QzTFA0SHBm?=
 =?utf-8?B?aHZrdGMzbGRYV2lESzQyaTNBZ201NEE3QzlwV0ZZdFp1eDBNblp2S01FcGFa?=
 =?utf-8?B?dFErMGU3NW54WFVXYWpqZ0JHcGVxbDdyZThtaXVQTW1JOFlJMUo0WjlldXlw?=
 =?utf-8?B?YW5aMXdEQWZFV3lYNG56V0p1MHl3U0NDZGN6VVErOXVhaTJMc0VnbW9sc214?=
 =?utf-8?B?c3grWlhEbUdnL3BWNGdWbzBoNDlzWm5mS1BwRGVqU29iNi8yOVZDTjJsVHFm?=
 =?utf-8?B?bjVFTXprcDBIVDd4QzdwYUVUYzlHU25rUm0yUGdlMU8zQTBYdlRhdHNOa3RK?=
 =?utf-8?B?dGFrbXpxb2Z0UFVERW1EUHZnYVZwTkVqZHVMRTNHcmtKTEV0MFB6RW5UV2sx?=
 =?utf-8?B?cEs5SWNYeDZUUzJIdFovV2lDTHc1OGhnNUxXZVMxL29Ya2F4cnRRRGhYc2VP?=
 =?utf-8?B?aDVaYnE3TFVYc0dCbUlGMGVsVktBZGZaR2Y3VkU5MDViNkhRZWFBZEZkS0ZE?=
 =?utf-8?B?YUFOQnhGWGlVTlk2OE01dEMxZE5PZElWS2NHTXZpQWpXc1RVbDZESUQyVG5G?=
 =?utf-8?B?WWxiWTYrcER4RnZ5bk1nZ0VKYmxwZlhlWnFFQW5GVytJRFVYNWY1b0RPbkQr?=
 =?utf-8?B?UlRiSGZIMmNXNDJUUFpIRVR5eG52WUdwaHpMM0lzYk1ub2JtZ0ZhbE5mL0ZL?=
 =?utf-8?B?c041bGxRQW9pQnhyRXpmcUV2TU9jZHd2aVFCY1FBMStWWXBQRGZYQ2lya2pq?=
 =?utf-8?B?YlRMTnRXcjhHcGo5eUZOQnlTTWFHZW5iMFRsR1ByelB2cFAwaW1nNTNackpu?=
 =?utf-8?B?d0ZmYWlmTXlLMDAxMFRlUFgzaXdXMXMyZlZBaFJiNDhtS2MrcDlEY3VPbVly?=
 =?utf-8?B?TlMvMDRnNC9TbFN4SnNXOS8wNmd2Tmhqa2lWRXpFMWV3VFI4MHJHL1E4WEJq?=
 =?utf-8?B?eXN6NTFXRFlQaGZWMVI5S2tmOUlOK3dzWFlqWWhaVUVvcXdlZGpITUo5eWVU?=
 =?utf-8?B?ZGRwdlc1T055dnZXZzl5TVN5YlpJN2h5eFRWMjh6UGV5eFBTbjF6VmJ5QkUv?=
 =?utf-8?B?WlNjNG1tTUg4Nzd6VFlkZ2hnQ25oZ1Z5N08vMzhnUTVMdjNXQktIaDZtMlRQ?=
 =?utf-8?B?NmgyalovUktxblpNN0lHdFFIWncrV0U1TWM2eHNXTFU5bUt2VVpLUTdqV3Zs?=
 =?utf-8?B?cXB3NXJhc2Y0enpYMGlkOFFwRkl2V2grbGY3eTY1eWhjbWZFbUdIN0VWMDhB?=
 =?utf-8?B?SnRzZ0dvY2h2MFhsZzhOdWZyd0praGZTSGRuK0ZBL2xXaW84NDJmV3h5eWNK?=
 =?utf-8?B?bFo0QWl6NENKemdGUTdOQ3Z2b1psTVk1cEZzTlNCUnkwTjR2LysrbzJEVGtp?=
 =?utf-8?B?TExrSzdSZWNlYmlZU1cweFpoc3hweDNQTWsyYUJuZUNNMzhlcVBaVEo0cDkz?=
 =?utf-8?B?YTg1eHA4K0dCZkYxYk45RVJkVHpDdzkxT1pxMGhZU1BKOHg3SktVekJ4ZVU5?=
 =?utf-8?B?VVFBQ1pKTWhjUlBpdEtVWmVLZFRVM0N0NGNFRW8wYmxOY3pMeldEd2dGdEdI?=
 =?utf-8?Q?Cc0CKcRAOJRvJKIUKEqPl8lCKCP45iXW5rVzdO5mfKuXi?=
X-MS-Exchange-AntiSpam-MessageData-1: MFzUzJ7JeSU7nQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff73080b-5cc8-418f-fcf9-08de6e8dfe59
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 01:35:27.1762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdI8B6ttPOrWHal5vtQUNO9dvWwTnOE56R9s5AvfjhKzCik+82Gk3/lUjV+RyCzttbuk0w9dpFXAOmBCMOoFyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,gmail.com,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31773-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 59A0D1528AE
X-Rspamd-Action: no action

On Wednesday, February 18, 2026 1:46=E2=80=AFAM Jon Hunter wrote:
> On 17/02/2026 16:40, Russell King (Oracle) wrote:
>=20
> ...
>=20
> >> Yes we should always follow that rule. However, in this case, I believ=
e
> >> that the build time dependency on the PINCTRL subsystem was only expos=
ed
> >> by adding the 'i2c_dev->dev->pins'. Unless I am misunderstanding ...
> >=20
> > Yes, it looks like it.
> >=20
> > However, I wonder why the dependency has to be complicated.
> >=20
> > ARCH_TEGRA in both arm64 and arm selects PINCTRL, so we can assume that
> >=20
> > PINCTRL will be set for ARCH_TEGRA. So:
> >   config I2C_TEGRA
> >  =20
> >   	tristate "NVIDIA Tegra internal I2C controller"
> >   	depends on ARCH_TEGRA || (COMPILE_TEST && (ARC || ARM || ARM64 ||=20
M68K
> >   	|| RISCV || SUPERH || SPARC))>=20
> > +	depends on PINCTRL
> >=20
> > is a shorter way of writing this, and it makes sense - pinctrl isn't
> > required because we're doing a compile test, it's required because
> > the driver itself fundamentally requires it with this change whether
> > or not we're doing a compile test.
>=20
> Yes that's true indeed.
>=20
> Mikko, do you want to take care of this?

My thought was it would be better to keep the PINCTRL dependency grouped wi=
th=20
COMPILE_TEST. That makes it clear it's only needed because of it -- clearer=
 to=20
the reader that ARCH_TEGRA implies it. Kind of like not checking for NULL=20
pointers in C code when the contract is that the pointer is not NULL.

I can change it though if you'd like.

Mikko

>=20
> Jon
>=20
> --
> nvpublic





