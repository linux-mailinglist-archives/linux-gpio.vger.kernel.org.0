Return-Path: <linux-gpio+bounces-30578-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6843D201BD
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 17:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCA6B30080E9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0CD83A1E63;
	Wed, 14 Jan 2026 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GJvb11U0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013045.outbound.protection.outlook.com [40.93.201.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086A3A1D15;
	Wed, 14 Jan 2026 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768406839; cv=fail; b=lwHM77yXufDhzM92MT4NDQvcDRQDpCtgKgMnB1cZCyBhgIvSurQT2lpShjFV+bDLFyU52N02ubwaYNOKvsu93WR7wUfiMvcnIQgO6qDqL2IgG7iKRZ+/dST2qSSNSTDbtOCfxR/su7jWS0vGJ2mb5ffKHruKB3Ve4NKhvrDHJtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768406839; c=relaxed/simple;
	bh=RWDkB3RZ0y13Ow3tF+hI7RjcplsIiBoyYDv8g59TMG4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bnp73S01lL7AhiMT8p9d7WWJEidKe7xZph6iAQ0T72nXErobNYB48BMmbWS14EIQMVTSLXGl45jC2BVszeSEm0fO2uVa5k12K///KnyHnugDXRcv3FhZ6+8a1Ou+vYa/eJXG48C3DWaq8iOftn3jPvFDE+H+hsKb8DOuX1hr2ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GJvb11U0; arc=fail smtp.client-ip=40.93.201.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae7+j5FhoetWXQAt7sgp07iBWAl1mphEmt1j6XeyV4uwT7EJ6kJPb+UHcq0toLb9BCIOzNAAqw7tgvk2pr2ZO4RjZOu8ERNKs3/qhpe1F0Qhz1mwT1Vx4VNgrEbRQniDdGLQXFBue2rvGuMfPDZg+XqlsTGotBCF/5GhS+BfATbcgH5IT4RJlnZ1iPlQQ6U6364Y3qcwtTCH7wKd3RHzletsGLHE7qTvaZoHGHO3NACpLW5m+Qs+rImrIIsU0oSkWzsNGuacCE59S6hhq5uEaOZqkIy2FmqXiKMbcWXdAlzRVXkw31r3JxArWBwHADTzFm0A5uRdjDUG6agEYhwMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4Y0gwYYHF0/ZfEAV7sUgX3yyICq6FWTyQoqpVfYfCU=;
 b=icL86bYWASsY31b/INzDGUD2P82N3jLYYsvRpZ6SOV7GcCoazvd5961sAyKINdNY6GeN0RWa66IDBojfJPXbjkbsV1ntntFmVIZ9eo1cbTlUNWpAZWJAgO3VnZ1rYitrrkUNsSO/kSzHsKyb9XZrOhQ8XqTfnW41QqtwkzfDJz6P/cO6DVS1cJMJ3o0KHcfx5eYhnkwZy90cKgV7lh5DlIli7QnVHqTMyLIMHAY4QQqrgtQpOABhrcOdRo9jSevRru6efmpq+WJGDHa50oTRWWMH5Y0bYjQOh7Sd79ppq9yCcni8egDkPkRE8//6kJ7+9aiH+sI/np8QQeQBUUZFEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4Y0gwYYHF0/ZfEAV7sUgX3yyICq6FWTyQoqpVfYfCU=;
 b=GJvb11U0cZWt3hllvS9wJb24F+uOHqFSkD1FdUhmkc6foNwPskCYW932LyIzGgmxG4BDwEePE2VAUYA/XRDSlUraMpV01yDoiS0Cs5z2trrHiiO+CsWc0RtWZ/Zta68S44ZkmTHhzgKrp/rITSmO3LLNx897hjkZ3A8wWZe4t+arRN7z8MynQNViYT2uIF1PYtlmpx7z0nh342KDN2O2QbKoIZct3uJ/m5q0pv88uLV1fuCQnnRm3h7ekYHdYLhbKxY4WA9FOw0O2sqerst8u3b03VnRJzmcH+2kptu7RKwOV++UbBEVg3UYEZw3x8YuLwTfk2URt+TPgKiPYaBm+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 16:07:07 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 16:07:06 +0000
Message-ID: <e8f79a63-be17-4814-97e9-dbbe57d73c3a@nvidia.com>
Date: Wed, 14 Jan 2026 16:07:00 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: fad1225e-623c-4196-2a34-08de5386f669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OFhCdkx6YkMxNmExeDhKR2JiZUJSSzd5aDZpRnRETk1hb2lvWmc4TzQwRk9s?=
 =?utf-8?B?aVlKR3JZU1J0YlgveFczVHdkTW82T1lZYU9PUXFxVjl1c25GeGR1Yi92S3N4?=
 =?utf-8?B?M1p3V3B4bXdIYnVSZkNwUXl5cFBQWlByR0krNVVnSE0wVTZSUkxaVnIyUENs?=
 =?utf-8?B?bUhJY0tOVkVSS0F6bjhkRmJtUmhEdHlLQUpNb25OZkp6QkhJN2FDNVpaQ2JI?=
 =?utf-8?B?Skk2Y0M4aUhIbm85dXVlNXE1aUdUYjNDZTV3YW9oS1ZmWTZlWU82NTcxYnBU?=
 =?utf-8?B?cS94RU9hSkNMOUFJMEJPSVAyd0RMdTJLNU9jbGR0Z1M4OFA2MlJzeTNkVlBI?=
 =?utf-8?B?eGU4M0lxeFp4S05LQjBnaVo5ZDZKNVZlQ0UxN1ZmVThEek5VNWQ2MDh0RnBQ?=
 =?utf-8?B?bzZHQW12Ry91cTdlM3dWU05tVW1nS1g5RkpTbFpPYkRyQkphY09kczRsREpU?=
 =?utf-8?B?MzRrRW9jeFdYd01mVDBNUlZzRVFuRDdJSGkvejh2VXpXRlQzTmZpekgvc29U?=
 =?utf-8?B?dGIvT3B5N3hRaHhORW9LeWNWdS8vOVJJTGNsazlkbzlWN0crV1ZiUStsQlN1?=
 =?utf-8?B?MWx2aWNZMHFWa010QkdVKzFiUVA3cW5hQWMwR0dndTBDemJLZ1RCRE82V3Nl?=
 =?utf-8?B?R05rVVcwV2JvQ3VNL0xoYWxySVZ2NHdacVkyZjBlbWN3ZHBqOE40L0tzcDR2?=
 =?utf-8?B?Q3ZBZ1BNZVRnWWIvY0JKaFhWclo2dTVOdHE3MWkxWS9RZm1oTEhJaG9OWFNQ?=
 =?utf-8?B?aWdyYnpWaGxnYjhEOU52a1M3ZDJEUUw1QVZlQkhvZlFRYktQY01kUmZFNU52?=
 =?utf-8?B?Uk5leUV0SFZ3Y1hBY25JZ05NMWpqeVRXV04vdnlHWkVhQVpMeXlwYkpqcDJU?=
 =?utf-8?B?OVllb1hFaUFlVHkvQy9WbTFCMTdxaTF4TkJiczhLNFlMT3RmdnBoaW1FRytV?=
 =?utf-8?B?TmExQTkxT0ROaWF4TjRBVTlaS081N2pZem5OWGhCUzBMNWVrYmwxMTk2N1JV?=
 =?utf-8?B?ZnJzK1N5Y3JGcDBGMy9MNUYxTS9FMUpyRDFsL3FlWEFSRENrUlVuZ0RaUTJL?=
 =?utf-8?B?ZmhkS1A0THZ4VktoN3hWMUQ0TFFSSFROTXNjSVMvbjliL2gwWjVBdDFNeUdm?=
 =?utf-8?B?a2xJN1d6MlA1WWZNdHNZZXprdmNkY3hHOG9sSmxZMFJwanhZTno1dnZGbzNt?=
 =?utf-8?B?SlpWdnhpTTIzNkZQK3RiVCs5YUdOVWdYWDZyYUFMN1pjS2VNZ0k5UnJtb2Vk?=
 =?utf-8?B?eUNPd3pUemU0eStCdDRxRno5Mnh2aWtxMkdHRjVESFh0aWIwZUlEUmVwa1ps?=
 =?utf-8?B?SUg1VHJISnQxWVk1WFBSZ0laY0VhR1ptNC9HUndMckNNeVRoeGhUcEFXZkFj?=
 =?utf-8?B?L3RUMWNYTEQ2TmRIRDZXUy84V3ZNdUp4R1BzYXBhNmNoRmZoVnRXaVhRM1A3?=
 =?utf-8?B?RFVOQ0J6bEZiL3JZdXQrMkxybnljb29Oc0R1M3ZSNnhMTGQxS3VVbU42Kzly?=
 =?utf-8?B?a0ZhSXlvTVovWURzU3NVMUxDWUVhbDdmY1gvTGkrb2cwbFhJMVloQUNlM1Jp?=
 =?utf-8?B?ZjhVZEp6cDFRTWZCbUxwN3RSTVppUTNnL09Gek55cjJWbWwzb1N5T1JNSUND?=
 =?utf-8?B?MWJOMGtHTmtubzlFMjJhYW0waEVmNWFmVXkrZUxWdnBDYTdwRzVEWDBTQ3d5?=
 =?utf-8?B?S3hXMmhsZmxCaFhWY0VEdDE5b0Jnd1FGM2RaYWp4T0FrZVE2cUtwdzJ5QTAx?=
 =?utf-8?B?RkdsajhobzNTaXFoRUNwVE1GTERVVW1vbzd2SUl0VTZpajBFL1RNUGhaUFY3?=
 =?utf-8?B?T2lSK2lqeW9pQU9zMEE1ejdrUEsvcy9oaGExbUhnS1BlLzd4SkJMOUdyTkVn?=
 =?utf-8?B?dnVtRHJSWHhZeVkrVDIzbTVtaWE1RVBwbG9JZmlUdWE4L1FMd1lXNHpvU3V5?=
 =?utf-8?B?TEpibEpZVU8xZU5BVVREYWFVZ1hXdlE4UnNLN0VQNkZxL3ZSTjB2M250Qld0?=
 =?utf-8?B?ZVI5Ny9kRUVxYzR5RjJoOGZxMWU4S2FMRmNCSDdPYnZEK1VZOHp1dTFRN3h2?=
 =?utf-8?B?Vm53UlNmY1NkY1JHN2RLczUvb0tkek9tTGFaZzE3TTRZVlZSY0tMSy8rSEhO?=
 =?utf-8?B?QXpoU000ZXV2bFhnT3lDQzZjaWdXSGZjWU9McjZYVDFkK0djUXpqYkd6RW1p?=
 =?utf-8?B?c0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnRIczBTUzdLK204dUN1V1hQTU10cTJyUk9xWEh0aVJ6dXJCQWdRTlB3UU5H?=
 =?utf-8?B?MisyU3lkTlBIaHpVY0pLMXZ6cUpNcmdCenM4eXhPNFpBZUpta3JxWi94QTRE?=
 =?utf-8?B?LzN6SWpLS2JxbzVRdUZWNWxxcU93T1E3WEJ6RGRPWmFwOWlVdXZPdldhTllr?=
 =?utf-8?B?NHpkdjNld1hFRU94NFNFamYxdWZCclQra2Zzc0xxam5TMy9sYm5oVCtxcnpm?=
 =?utf-8?B?eXo1UkhSU3NTbFE2aHZkV0pUZ1M3Mk0ybUVkazRKMUNvMlZCdCtnYUU5TDRx?=
 =?utf-8?B?K2dkOXVxOG0rV2ZNRnNyaU5Hd3ZJV3VDOTk1OTZNVWxMai9zS2ZUYUcwWElR?=
 =?utf-8?B?ZFROSFBtMGRoczZPemFQOG8rTDB1RWV6NUh1ZENKVHhoamVhMm8wSC9TR0xU?=
 =?utf-8?B?bFF4UjFjVlRJNXhYNHEyV2Uxa2VUbmRMMmQ2SG1mb2RLWnNqUDR6aDRYUUVm?=
 =?utf-8?B?Mm9FeFE4L2swcmw3NVRrZmZxNHBaRTM2QStXc0pkcmJPenNyWlFRMU5lUHBO?=
 =?utf-8?B?NnpJRmljbU1mdktuRmpWL0tSTVZyamo0bmdVSDJPMkRRTFdRdTNhRklMMDRq?=
 =?utf-8?B?WE9rb1UycUtwbExtZVBGZ3BTVlg0cjhsMlhZOGR4RzlsTk9JUWQ1RElUSE96?=
 =?utf-8?B?YWQ5WTJycWR6TmhRVmxyQjhKNktPZUlrNU9IV0lINlAzbGFZN0hZdWwvUGJI?=
 =?utf-8?B?Tjl5VEZyMWtWdHgwdDcxdmliTzhNS3lQY05NeGc2OCticmZ4Z0lMREZoSmNG?=
 =?utf-8?B?ODZiTGpBUWxUNzVzeEpMYzZZb2xPQnZnWE5LWmlVbmNHaUVvcnpreUhaV3R0?=
 =?utf-8?B?MEdkOTlqa0loa2lUaTVrd28zQTRtTGZ1djNDN0w0WFl6V1NxaDF1cHVWTjJt?=
 =?utf-8?B?eDBnTnMrZTllUnJYUTZidEFxemRpL3RWTHA2Z29ML3cvUG1kSEUrT05GNXVh?=
 =?utf-8?B?bC85bHpPQ0Z2SXNwOXo2S2RaL2tVY2JXK3NmOGdIRjFuZU50MStiQ29pdFp0?=
 =?utf-8?B?Y3ViUEczekU2emJDRHZMdjQzaUVGZEV5OXVvNkxRbTB2UEVNaFhkMWZ5Vldp?=
 =?utf-8?B?c25QQzBxYi9JVFBQSmI2M3g4SzFuZGJGUWYybmVLVGtpajFnTlhjZWkrVCtv?=
 =?utf-8?B?bGZZSlI0dDRaZ1BwUkVBVGw0aDl6N1pyNGNMS0V1Qjk0QXhEU1Z1bHhpQ28r?=
 =?utf-8?B?Zms3WXQ2ZFYxcVpzV1pVOHhXYXhURi90TUtYLzZMY1dLb3hxWTFUSVQycFdG?=
 =?utf-8?B?RU1lMTRYSk1MWjJxQlBaM0Jtd2NSZGR0RmllWVRnSzc0Wms4MTBsMklySE9Q?=
 =?utf-8?B?SGJ4NEVVYWFuSkx0em9RdzlBTFJhUlVuZklGM0d2L05jSmFZNDMzSXNDdUV2?=
 =?utf-8?B?eGRaYzlpMkFmSU9ZTCthQm5nMjcxS0tXTnUwdytsd0N0ZEN6eGcxSGk2ZlJU?=
 =?utf-8?B?YmdCcTBaYW1BTmdEZ2E3RHZ5VjdiWHM4MHp1TXRHRGp4OElVbHAvb2dBWXdP?=
 =?utf-8?B?SzllcGNLNldFbU9RVkpMQ0ZZVzdySTVKRkNlb0VPeWR0YzFZMm1pWjBIakFh?=
 =?utf-8?B?T05RbjhBc1NwVHpNRGt3SlJNZStFQy8zYWlqMTdCeGhEYTRZUWpNKzh2SEFm?=
 =?utf-8?B?eU9RdWl5SGNPdkYwYWdzaWNtbXB1cW10QUZFY3BqeU8rU0FMeksxN2Z4WkpT?=
 =?utf-8?B?czJsbWo2Q211SkZhV0pXWk5ncElsaFRlNlBHRGIxZ1pJalZPZklaMkF6RWhB?=
 =?utf-8?B?NVUyZzQ1TXBMWndkSGozckFuNVllVGtRZWEyWFE4SnVoS3J4Y3hxaDhKMHRl?=
 =?utf-8?B?ZWJhUVNTRVhhMGc2NWlNKzZUZUQ1N091UzlkOFkwRWZMaFJiMFJhV05yNUtw?=
 =?utf-8?B?WWhrakV0ZWc1Nk1GR3R1OG5xdHAvaFluZWFVTk5nYTJ0UUM2bnFFWWJLY0lq?=
 =?utf-8?B?S0w1RUYrZzFPS2ZMNkZScGJsTERYWEZCZks1UnRvVTcxTC9aZk9GMFlEOWRW?=
 =?utf-8?B?UmFDWVhoajZ0U2ZRang5VVpMODNoSTZWY3QzMDIzbEtSQmFQRmY2YTNVb0Nv?=
 =?utf-8?B?RHJGeU9mUkYwc2pSVGQrTElWWTZYcks3NFlNeUdzeDhRZDUycTZ1SWxXckh0?=
 =?utf-8?B?bkEvUUtvU1hYWXJYN2VkbUJqMzNPSUVHZ09hZUFnRkxQR2xTbWNVOXgyaU45?=
 =?utf-8?B?STdQK2FHeXdZRVFKZi9lUHdIWHFhM0s3dlZVbzFzZU9EczdKRjNpbkUxWC9E?=
 =?utf-8?B?WlczajZtNjFFbzVLYVZFaW5QNW83dGI3MjBKV2dZc2N3Y3RsTWxhNUtBekNk?=
 =?utf-8?B?RWwrVUdmOHFkQkdoK04zWEgxYi9adTV6VHNqNG13ekZ3MGtINWE5ckxiQnIv?=
 =?utf-8?Q?aQ7cq7jNzwqZM55zcZBd1Olwnf7X/0kPN1BYVPy5EUJIg?=
X-MS-Exchange-AntiSpam-MessageData-1: cspSR+/X9u5xxg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad1225e-623c-4196-2a34-08de5386f669
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:07:06.0952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XS8KI+KdonUWjVXFH1bHtPcu8Np/QRAJQDp6vn5DiLvpl9wl0O2dDnPlWBQUBgGPKCyrQh+tXTJvpuZUv6kDDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258



On 14/01/2026 15:30, Krzysztof Kozlowski wrote:
> Make the padctl functions a bit simpler by returning void instead of
> always '0'.  The callers - phy init/exit - still need to return 0, but
> these are smaller function without if/branching.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> index 49c5edeba87f..34a373f7e04d 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
> @@ -474,7 +474,7 @@ static const struct pinconf_ops tegra_xusb_padctl_pinconf_ops = {
>   #endif
>   };
>   
> -static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
> +static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>   {
>   	u32 value;
>   
> @@ -501,10 +501,9 @@ static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
>   
>   out:
>   	mutex_unlock(&padctl->lock);
> -	return 0;
>   }
>   
> -static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
> +static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
>   {
>   	u32 value;
>   
> @@ -534,21 +533,24 @@ static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
>   
>   out:
>   	mutex_unlock(&padctl->lock);
> -	return 0;
>   }
>   
>   static int tegra_xusb_phy_init(struct phy *phy)
>   {
>   	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
>   
> -	return tegra_xusb_padctl_enable(padctl);
> +	tegra_xusb_padctl_enable(padctl);
> +
> +	return 0;
>   }
>   
>   static int tegra_xusb_phy_exit(struct phy *phy)
>   {
>   	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
>   
> -	return tegra_xusb_padctl_disable(padctl);
> +	tegra_xusb_padctl_disable(padctl);
> +
> +	return 0;
>   }
>   
>   static int pcie_phy_power_on(struct phy *phy)
> 

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic


