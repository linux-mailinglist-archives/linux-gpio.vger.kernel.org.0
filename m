Return-Path: <linux-gpio+bounces-7778-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A63FF91BB8B
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 11:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C2F2283AF3
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jun 2024 09:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A4015383A;
	Fri, 28 Jun 2024 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="uDsFV3Np"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2115.outbound.protection.outlook.com [40.107.255.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD01534E9;
	Fri, 28 Jun 2024 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719567252; cv=fail; b=LFvHxKTIVBTAX719V2NXrFd4VxxS38jCtSFLZnQJXCD/qrVxg5As4w9C0DnTEUxGmSJG6h9O6gRKEVE0beWWU2oyQsUftrc0Cu31pKrf0plbnRAUb3NbtxmlIK2Q2Hbx4ejeYhEQrXPkOf7mzXBEE8PEumTbu/tTEuXOtVOvs4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719567252; c=relaxed/simple;
	bh=V8w7gCtMVy1rXX8Mcefoz3ds+DHMNOfmwAnL8LwLYPM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aXmqj60sC5tMPukmIHG0GKZujB5eVtppjEeUvnBIIV9vDKUvLaiUdOfuylsWCtLR7+m8asEi1Bo87mgib3ECxqzT9xZ3w6MLUB5AmavSvxbfFh1piTDkF4YHpS5JX1eIwEZYWgLPinQqEG+HEgJxwc0xbg84LeTIjvwQo+Rmo4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=uDsFV3Np; arc=fail smtp.client-ip=40.107.255.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFuPnVE5i6QvQDjqxA0ID1ZyL85EQ3VP2b+dnqLvHuiNfo/dDlew7FIRTqy9leX6hs99+ghywCVAX3bbVNKjxKNWbVjWs8Qy5r+0/toc2T2yblwroxjXS3AR+4EPftxHeJ+w8v8XgdoGC1FHR6JiIkAtEE638DZazwY7nII7Y+58kaMp/TVR3Oz0Ds1O2Lt7oWJej6gTb+dzw2AbkM+OwykThI5o8//TR6CyJgnTrT4vB19miRBal7FwU+RmjI7FwWTmSbPdERMF6Ve4eqoJ/3+NCpkcF5leFszpK98mxk6rCkNsBX2OcKSM8Eex/JURTDavUp7jhnD+V8q/cmJweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WFZoF7CljGFThezclI2iSB1WMXfKwBCwIBvLUaWfQA=;
 b=mn1Cr94KPz1Ku7aDML0NtFucMGRjxJEGZwkmbcwTOZFtl2o/h9D3X8elGxQ369bOaJUlRq+XFOv6KJvNVo4M0aKLxHdnxqx5Rc/bwmWu26PZ9WFI/iK5EW0BXX8BlzFVONXOy9PxyPdeUocnxRMP1yNspAf+3cxC8dLb5PEqWoaNoPbfz6FPvMrw+0FCVPsSXR5VcZ+3einbMbfxYGdCUe1tPPcMnUD7NzHop1TZJXGIH+Xx8jbtrOvsR9kewl2wVFYP9Whj09tH5M629T2XuiQLHjYrL14HB3jKfWLWX3hjh/ZmBsCjLLpPDbxgzp1xPqFjuW1fG9+FRhFVLsypSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WFZoF7CljGFThezclI2iSB1WMXfKwBCwIBvLUaWfQA=;
 b=uDsFV3NpiM5A90cnhsURy/bmowKgU/+g3YNR7bELfavGqDEeYb4KEHbuZ7/6b+KP9HcXrH+Iu5y4jQ6dPbqY+5iM8FHdLtimQfNK1xr2nNGM39g6txxcrXttvUPuy2p69NlgmMXuJFOc+5betMOfa6Z3I7eG7HU2PchwQChnPjEII/k7Dg+vqC0bj6BzZl7eDWHWEiFji+Smza4JbkA9agTyIARKaCXu3oxgP3pQvL4N9rIcPC6DFMy8OGcxEn0WQtyHgDedwnWKVwgqibdtjw0/nHz+GW+VAQmtT45iDgkZtJRkKRD8MF5cxL7JTkwGfT8oO/JHBx1DTjnWme9FsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7220.apcprd03.prod.outlook.com (2603:1096:101:ec::16)
 by TYSPR03MB8684.apcprd03.prod.outlook.com (2603:1096:405:91::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Fri, 28 Jun
 2024 09:34:07 +0000
Received: from SEZPR03MB7220.apcprd03.prod.outlook.com
 ([fe80::76dd:f717:3e9:1142]) by SEZPR03MB7220.apcprd03.prod.outlook.com
 ([fe80::76dd:f717:3e9:1142%6]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 09:34:07 +0000
Message-ID: <ef625710-f14b-46d1-a6a6-75e5365f9b53@amlogic.com>
Date: Fri, 28 Jun 2024 17:34:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-kernel@vger.kernel.org
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
 <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>
 <20240613170816.GA2020944-robh@kernel.org>
Content-Language: en-US
From: Huqiang Qin <huqiang.qin@amlogic.com>
In-Reply-To: <20240613170816.GA2020944-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0111.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::15) To SEZPR03MB7220.apcprd03.prod.outlook.com
 (2603:1096:101:ec::16)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7220:EE_|TYSPR03MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: dee203f5-e147-4a81-849c-08dc975574dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFRiR2tyR28rUlY5QWs3cEhwQWxjNDdObWtMU1lQMWhuY2F6L25EdEdPck1K?=
 =?utf-8?B?T1dYNEJqRXYwVVFaanRNY3o1czh5UkhDVmpwaS9EVkVRYXROTkVPZS9Sd0Zq?=
 =?utf-8?B?dTZTN0RpZGtkdFpiM0tobkJXdHlFWTdNY3dCV3o4UWZUeWVMQXZRZ3NMWUtq?=
 =?utf-8?B?Z0tja2tvRCswejB3eTR6U0RiSHJFN0U3RDJCR2RnMWVTMVM0RklsRlVTd1hz?=
 =?utf-8?B?dWc5aGFscU1NQlFBeXBUY0dRTTZxOXdURk5paXNUMnRPemhBQnBxWGpYQWhi?=
 =?utf-8?B?UEdDZjladUVZKzhlL09Cd2w1ZGk3eXpPOGdNSzZpWXlXM0owa0p1RHpIRjRa?=
 =?utf-8?B?QVV4UzduaWpGbTAzVzhINE5wU1dRWmZGV0VoUGRyN2F0dGJCYit1bXFSejd6?=
 =?utf-8?B?NUdmNDBNcmZqLzlsV3RiYUVGajAwMzNYZ0JlUzdkeEg2Q2IvY3A5dzZoRXhw?=
 =?utf-8?B?MjJ6d1BjOTdyUWxoSXBBcG1vTnVIRm5OZHNDRjdudkFVaDNrUlE2aVVQUEdi?=
 =?utf-8?B?eHZCazkyNVNJRHJVRC9WNzNHbmcxQklBMm91YjhXZ3JrSEx0amptWGJMbzc5?=
 =?utf-8?B?VWdzYTNPRGE5VDBRRzkvcEIyeWRrY2FNNHlLWEFpa1N2RHBPUDVXTmVWZGVR?=
 =?utf-8?B?TEU1Q21iOEtNNlJhcHZmYzBjaEZLK0wybjlzanRnREI1M0twVkl1cTZQbG0y?=
 =?utf-8?B?MTVxeDZWOXVzd1BGWGJ0Nk5VcXlWcjVRYlY0M1hjUnpEajVvSnh4bHpCNW1X?=
 =?utf-8?B?L0FTUlplUlV3amxPMXdLUUpWYjZhNlQzSjE0cm1oMlgwR3NkN3hDUm5ickxa?=
 =?utf-8?B?K3l6RFd6ejFoYng3UnpzZGk5WkI0aWZZN3dqdlJoeEdjMGpUUW1sRHRGK09I?=
 =?utf-8?B?UGR4aHMyc0xNbVBXaWZLZTkxbFFFS2lRaHJISUdCY2ZOSjRpTTNSdmVnVWJH?=
 =?utf-8?B?NE8rbWt1WlV5UTFoR2V2dG5yS2pTbXRHTzFySUVvVnc1cVZkdjBDMy9YUHBR?=
 =?utf-8?B?TjRiR1dNaldZS29TS1VpTjUyWWpzcDA4T3pmWmZUeHRNU0dQYXlBUndnRzZa?=
 =?utf-8?B?SG1lbm5PM1NpYjdLV1ErM0NaSlM4cC9nNU1rSjMraVZsOXRVbXBEZEdNSDRN?=
 =?utf-8?B?cnFLdW1yYUpxLzMzNDM4ZUp3VDhDSXB2R0hpNzJtNVV5T2lzdnZBYWRLU0ls?=
 =?utf-8?B?RklZbk9WSGx0WHRpVTFiaVJVL0l3eExodHoxUVYwbnVVUnlHZlNFeHgxT1Jh?=
 =?utf-8?B?R1FmRVdPdWF1bUFrcTNFalpVVTRseWdXMjM4TlpJY0hqMjBBdys2UFVCMXNO?=
 =?utf-8?B?Ni95UEJXNkdQaFlYSWxJN0pLeDdHeU1hV0l0c2JpeWV4b2RSOEIzblV2Z1pi?=
 =?utf-8?B?RC9HWnBtNldqME9nTTAwUzlFbjRwSVpMT1A2enIyYjNhUW1peUZRVnRNbGM5?=
 =?utf-8?B?aXphc1ppWTBhVWwwWDlsa2xOZXFuUE9MTThabjA0dTF2dDJ5SkdtV3V4c1BI?=
 =?utf-8?B?dE1WN01KMm9ZOUpOTnV5aE4vY2xOd25zMHd6V0NDdk4wM3JydXlXZ0Ivb0tC?=
 =?utf-8?B?QWRpUkREbjdnUDBUSjFJL2p5bzN0bDVQMzh3WDFUVzNZVjdZakdvbjBqOXBQ?=
 =?utf-8?B?b2Jpb2tJRW8xRi95cEVWbWFvMDRLNHNvaEh1aUMreGx5bFZSZHJ4bUc3bnpV?=
 =?utf-8?B?WnpVMW1NT0txMWkvL29aSTF2Q09oNXJiMWRnVXlSM3NRbWVtNE9reEJqRXhk?=
 =?utf-8?B?SkNLbldSU3dpT1NtMzBicDArZW92Vk9kNkhCU2tvcmRDb0p2STVRR2JsTTlN?=
 =?utf-8?B?eUNwNXozNWZHaFI3dVBTdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7220.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0ViN1NRb2JrWEgyL1FMcVlXdzZGcHQyRnpTcDVLRmlxTnc4R3lSMHRMek5K?=
 =?utf-8?B?U3luTHVvd0dsU1pYelcxd000U2FyQlh0OWo2YTdkQlVCc0Z2WEo2K2Z1YWRR?=
 =?utf-8?B?eDJBLzNTb0V1d0V3TmlueExFOGNkbVJiNUdrdG4rQm5qaG1FbzZWV0tqenp4?=
 =?utf-8?B?eUJjdVpEZjBkNk0rbEJNZ2Z2RytxbjVyelcwVGRta1JQM25yMkFxTHFrYkZF?=
 =?utf-8?B?YlVxUHJXVEk3dkxOVG1jcVFNUWtxaUNPdDJZeEFWK09mNVBmY000MFZtZFln?=
 =?utf-8?B?KzZ3UFFVdUFyMU91aU8vRUZuWS9pRzdpVGRtRXhYSWc2Z21UVmJxdDBEQnp6?=
 =?utf-8?B?MmhnUnZ1TjltVTBWWFdUQlpxK2FKWkpxa01PSzhaaGxENGVKTDFYeXNUVGc4?=
 =?utf-8?B?SDViNnErdlBKMFFhanMrNlZKdXNUYkl6bVIzT2NPTk9hdlNCLzBYeFJrTHhU?=
 =?utf-8?B?bjlId2lQNDFGVk4zeXVvQTY4NkZBckZHZldoWkxjTlFLVGdoL24vNTNndTNm?=
 =?utf-8?B?ZnpnRk1sdDFJcmZYM3liZjlTWXUwU3JkZVUyRHl0cG9SUmJhUXB3T0sxT2Va?=
 =?utf-8?B?TXlZTVpBVE9ZcFNCcGdNdEJYNFgyais3OWhQcHNXbSthQkJRV1UvcFdubE56?=
 =?utf-8?B?K29WOFkwalROdVdEcldOYmJacWtZT0FzRHJta3J4cW5OckxERExVRVN6ZXF3?=
 =?utf-8?B?cTBqa1Noa1RUbWZtS1l6YVNlY2pZWEIvY2hlbUk3SjB2d0E3QjZ4ODNjR1Z2?=
 =?utf-8?B?ek93VXRadlVacm1iL3lzSlNoYXNGQ0pzd1VVd2lHb2hQNm9HNE9zTXdyRlBH?=
 =?utf-8?B?V25Rc2kyNjdIUmFHRGxJVkVsdklGS0dYRVEzeWxueVE5UFFIdmRoNG1QWHh4?=
 =?utf-8?B?Z3hJVGMvNnNUNGI0ckM3eGdCUmpOOUQ2NHZJN0lNVThRUVJ3ODFpQjRiREhj?=
 =?utf-8?B?UWV1U3NtMHdnWDgzTlJZeVZZRlR1ZHZROTB3UWdWTk9nZzlON1FqaGVrY0xv?=
 =?utf-8?B?MWNKVjRNc0NmRFFGSUdEWEpFQmlndVoyK2RtdEVDR01LM3FuQTR2V3VMTkxM?=
 =?utf-8?B?VUFIWVFLVVlBb0hwZkt4VGtwYUNiZ2FydjZib0NqZTFtMTFOeUIwSDIwL0Ft?=
 =?utf-8?B?MHUrN3NraEtLeUQ4empCQnlVK1h4R293eFRTTHU1Vi9DZnYrV3pwMXNQcFhU?=
 =?utf-8?B?cUE5MnZuOFZNUmJXbm5BWnZ5WTRmc3YybDJuUTRyTm5uWnE2VE5ESTJKNjVK?=
 =?utf-8?B?RlVUNU1ZQlBVMU9KbmhJNGdXMGVNZnRrSnptK2JZUUliRWxPbHNNTGx6dTRU?=
 =?utf-8?B?czYwd1dNdEtoSVNZcWRuMkpRaEpZdDVqaFFRYTUrZTZvNGUzRm9uVmJLQVY3?=
 =?utf-8?B?RWliVFFHMWdLV1BmdU5qWC9RU29YSEhkYnhReWVoMHZCbzQwNW1sbksyTmlo?=
 =?utf-8?B?UGY1YThQTEo0ejc0SXVtKzg2NUFRaGgrWkpCZnk0L2FoOEZHTVdYMUR3NEZ3?=
 =?utf-8?B?SGtuZTBzT0piR3BDeVZUYlhOd2VRL3dmd3NsRW4xRStKU2VaQThsNS94L2Ju?=
 =?utf-8?B?VlJrbU5oS0NNY2loV1dGWEh4WHZxNDFpT050bGt0WVkvdGppT2pOZUpzWlgy?=
 =?utf-8?B?aWNxT2FvbjZhQTkyUFJRalpRSEV1VHdaRE82VXplY3d3Yms1NTZFRGpKSk1V?=
 =?utf-8?B?SGppMGxmVzRvYWlhTldxQytYTEF2dnJHVUVaeVM3b3VMTDloaEI3NkNjNVlJ?=
 =?utf-8?B?M0JaL1k1VFNNckJGRFFRVTZwdUIvV1orQ3R4Skd2SFBKYWF6UXp2ZzJrOWlo?=
 =?utf-8?B?UlFOWnNmZDE4eE5MWG4rU3RBK2NpSjB0eUtmTUdkNzUvRzEwQUNqZi9GS2RX?=
 =?utf-8?B?a08yQ01LNmsvSXNoQmk1dDRpYU8xS25DYUQzL0VNQ05BM3Jwc0FQVDAxekZs?=
 =?utf-8?B?eTUyYndXUmlpdjF3SmxxS1hIWG92a3JPQWY4dUY2R1F1blJERWdOWFhtZzJB?=
 =?utf-8?B?RnBmWFNRU3hVSlRqeDVvMEZWeHFqWFFDZHY4Y2VUUzBIT0JQajVZVERQOG1l?=
 =?utf-8?B?Vno0RVVpZ2ZSU0lwNExMbU1vNkE4T3VQQ2lESE9mMTBwL2tsLzFMOStSSEhS?=
 =?utf-8?B?N014WFVWcVVnckxFWXRSYk0vUEcwUVVDbUY2VHdyOEtKQkxSY2NLb0J2eTlw?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee203f5-e147-4a81-849c-08dc975574dc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:34:07.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1l1cLY3rpNLrXbQpGowRf8RAvEpnLfmEzJvvaYenFDSbI0yBygPY4qWJP+sR8bldseuY8bjK27v79Umfk5zc7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8684

Hi Rob,

Thanks for your reply!

On 2024/6/14 1:08, Rob Herring wrote:
...
>> diff --git a/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
>> new file mode 100644
>> index 000000000000..dfabca4b4790
>> --- /dev/null
>> +++ b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
>> @@ -0,0 +1,93 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
>> +#define _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
>> +
>> +/* GPIOE */
>> +#define GPIOE_0				0
>> +#define GPIOE_1				1
>> +
>> +/* GPIOD */
>> +#define GPIOD_0				2
>> +#define GPIOD_1				3
>> +#define GPIOD_2				4
>> +#define GPIOD_3				5
>> +#define GPIOD_4				6
>> +#define GPIOD_5				7
>> +#define GPIOD_6				8
>> +#define GPIOD_7				9
>> +#define GPIOD_8				10
>> +#define GPIOD_9				11
>> +#define GPIOD_10			12
>> +#define GPIOD_11			13
>> +#define GPIOD_12			14
>> +#define GPIOD_13			15
>> +#define GPIOD_14			16
>> +#define GPIOD_15			17
> 
> I'm not really much of a fan of using defines for GPIOs, but if you do, 
> wouldn't be better to split banks and lines up rather than a global 
> number space. See ASPEED_GPIO() or tegra header.

We have always wanted to make the GPIO code look beautiful and concise.

However, since we put all the banks together at the beginning, this also
means that the automatic numbering of gpiolib will become continuous,
while ASPEED_GPIO() will make the numbering discontinuous.

In pinctrl-meson.c, we did not assign a value to pc->chip.of_xlate,
so this will use the default translation function of_gpio_simple_xlate()

of_gpio_simple_xlate() performs a linear conversion on the parameters
passed in by DT. In this way, in pinctrl-meson.c, we can easily use
meson_calc_reg_and_bit() to get the register corresponding to the pin.

However, when we refer to the ASPEED_GPIO() approach, we have to implement
our own of_xlate to convert the macro-defined numbers (discontinuous) into
continuous numbers of gpiolib.

And we need to define each range on DT, similar to:
	periphs_pinctrl: pinctrl@4000 {
		compatible = "amlogic,a4-periphs-pinctrl";
		...
		gpio: bank@4000 {
			...
			/*  gpio_offset  pin_offset  npins  */
			gpio-ranges = <&periphs_pinctrl 0  AMLOGIC_GPIO(GPIOE, 0) 2 >,	/*  0 ~ 1 */
				      <&periphs_pinctrl 2  AMLOGIC_GPIO(GPIOD, 0) 16>,	/*  2 ~ 17 */
				      <&periphs_pinctrl 18 AMLOGIC_GPIO(GPIOB, 0) 14>,	/* 18 ~ 31 */
				      <&periphs_pinctrl 32 AMLOGIC_GPIO(GPIOX, 0) 18>,	/* 32 ~ 49 */
				      <&periphs_pinctrl 50 AMLOGIC_GPIO(GPIOT, 0) 23>;	/* 50 ~ 72 */
		};
	};
Moreover, we also need to convert the following groups of functions:
	pc->chip.get_direction = meson_gpio_get_direction;
	pc->chip.direction_input = meson_gpio_direction_input;
	pc->chip.direction_output = meson_gpio_direction_output;
	pc->chip.get = meson_gpio_get;
	pc->chip.set = meson_gpio_set;



Of course there is another way to do it. DT can be written like this:
	periphs_pinctrl: pinctrl@4000 {
		compatible = "amlogic,a4-periphs-pinctrl";
		...
		gpioe: bank@0 {
			...
		};
		gpiod: bank@1 {
			...
		};
		gpiob: bank@2 {
			...
		};
		gpiox: bank@3 {
			...
		};
		gpiot: bank@4 {
			...
		};
	};

But this still requires a lot of modifications to pinctrl-meson.c,
because pinctrl-meson.c was originally designed for one gpiochip:
	static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc)
	{
		...
		chips = gpiochip_node_count(pc->dev);
		if (!chips) {
				dev_err(pc->dev, "no gpio node found\n");
				return -EINVAL;
		}
		if (chips > 1) {
				dev_err(pc->dev, "multiple gpio nodes\n");
				return -EINVAL;
		}
		...
	}


The above are the issues I know and have considered. Because it involves
a lot of modifications, and we also need to ensure compatibility with
other platforms, we do not want to do this.

There are many historical reasons why Amlogic's Pinctrl/GPIO driver is so long.
I have been considering whether to refactor Amlogic's Pinctrl driver for
a long time, but I don't know whether the community will accept my doing so.
If Amlogic's driver can be refactored, the driver will become universal.
To support new platforms, we only need to add the pinctrl node to the DT
of the new platform, without having to add a c file and h file and compatible
every time.

If I can refactor Amlogic's Pinctrl, I will provide a new version of
Pinctrl driver within this year at the latest. If not, we can't think
of a better way to make this patch better. We can only do the next best thing
and remove amlogic,a4-aobus-pinctrl.h and amlogic,a4-periphs-pinctrl.h
from the patch. Although this will not affect the function of Pinctrl,
it will not be as easy to use as before.

For example:
	When there is a macro definition:   gpios = <&gpio GPIOX_15 GPIO_ACTIVE_LOW>;
	When there is no macro definition:  gpios = <&gpio 47 GPIO_ACTIVE_LOW>;


If there is any better way to do it, please guide me.

Thank you so much！

:)

Best regards,
Huqiang

