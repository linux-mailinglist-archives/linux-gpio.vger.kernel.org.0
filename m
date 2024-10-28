Return-Path: <linux-gpio+bounces-12219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE5F9B2BC6
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F4171C21C9E
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1F4199247;
	Mon, 28 Oct 2024 09:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="ZpfxnlJ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2124.outbound.protection.outlook.com [40.107.215.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D49DA59;
	Mon, 28 Oct 2024 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108783; cv=fail; b=toOlqI8XZjM5KOZtqI0Exb0kNZdf+p7LDT7lja1NuoCQFZTimD9xDtA3GsO+K0n9YAH3rAV5JmrkSWrFEGzgdYh8fznln9oakHdWAesnLawRcG5npOYz9LB00smCduNNrWNcdf3zQcRFijWf1X9qQTfwvGMD+TYqIMuelv2aRrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108783; c=relaxed/simple;
	bh=D/WNTSNoRzFe/Ta0Wd/EbAzQhUYBjV4xyr3E1N9AHR0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MJePweCGfbqH/mPhHkL77BqUWJPLjbOW0mBy7TfI9m+GcZC8YGKj3NJA6NzeuujYiCzGmLsK1v8toQc6ZcObQEWf3e9xmUUf68mKkWCaNyP9fJjSECO3CSvQamEnvQJFsOpCZ8o4EwjypJkFZcglO9R7XMpLaaxqZrnTf/2aOA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=ZpfxnlJ5; arc=fail smtp.client-ip=40.107.215.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhlcTmfQRGOv5C+m50KZuaycrvCjTn8DpvfdBKSJsI6ya9TKLTqi574lkSyjj50KZO7UQ7hUwufctfl3tXii1PQ8IXBTSAPFsQpDa4nv9/MDNy84/QixOJ/I7HZkHpUrT8TBCIzmw9foxuho8b+VJvRk+wt+tcJRBA+jZ2sgpbQUs6UD98lwcePImgMLWJMg4wK5t79WTKWH5PZx/mZTj2O5BxtrPjU5u1/UUiyzk6urCZx1TUiS+52Euf7Bf40wu8cNyn1BdHssVtwuG4ts8KERwnSbtqeJWDeEe7PirrW4vP50hIN+71BI6I4hXdHys1zHHaEh4TvQBvRtRg3jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jwd59WQSoiErQB6BixJlsteA3t9qp5NbDaFpDQplZdw=;
 b=IVfgVJPEHxXPe+T+sNlUlHlam7/GDRhk6jIJkQnzQA+QPf4ovnRngnTPUSkZ5gBCxAHMKWa0vDLbo3mBf9dzh5/MO/jc8R82P5xSN9vpYid29XySNPOM2QJYevcPbvFSLO0J7qqEAXUf6nK+/7q9tLw9wlSKq9vQVYeJKFNy9fllThoSinJn3dIFqw0z73pXMWGTmDINnLmDtvXU24cR8z2+dr7KJQJW2o41AFxD9LL8KkS0sb6VWPwipHR83pnMT+igSoCt+Tnqr9ATrFR3CeHeiPn0kuzbzxM34MxOrVxQj+f/RL5mRZzj4x0E/8O+Md7DkN7bFDfYFnBqKmtZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jwd59WQSoiErQB6BixJlsteA3t9qp5NbDaFpDQplZdw=;
 b=ZpfxnlJ5A6IBmw4lhZKGFt14Mg0vG9LpS7CsGGqsZJ6XzIy7mY7TiXStdgPClDRGwnUly100soirblQWLc7uS2wbTx/w9Euk0jFEuPj2TQCUthZMEwbPLVN81dUcXADjmmpSwHU7TfR7FYS3TTeUa+WSsxXhFX0lNVVWmHv09lUk/e7PptD9eYflzLEjpqpZ7EyvUpy2ZhNCm4blLtzNsqWHpCCpwrUKQlwXkC8b0wea16Q/Mwp6mvG+7V50UttLz6P8QqI1T+8gbGVFi1NnHw8Kpn8ylZLT0IIEVfhOhurTvycMu8hua7M29g2i8Opv1Ey5ii3dnOoMfp2p1wcSKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by KL1PR03MB7742.apcprd03.prod.outlook.com (2603:1096:820:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 09:46:17 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%3]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 09:46:16 +0000
Message-ID: <99730b97-2adf-4688-9430-423d8e0dee4a@amlogic.com>
Date: Mon, 28 Oct 2024 17:46:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-2-e76fd1cf01d7@amlogic.com>
 <3e1b23e9-d5a3-4b3d-973c-546b994e3ae2@wanadoo.fr>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <3e1b23e9-d5a3-4b3d-973c-546b994e3ae2@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0033.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::20)
 To PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|KL1PR03MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1af87f-b431-4a4b-7cda-08dcf7355df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXVzblBWWVZtbVQydUdoajNZb0JlaWNTd1NlZ0tzSUp4MmhtR1ZoSTlGWTB6?=
 =?utf-8?B?Q05oNVJGWUlXUHEzNGxYbkxNa3dYTEc5aExNUFBUTnZObWYxNUIxNnloenpB?=
 =?utf-8?B?WnJGWjc1S2ZqTnpxOUZ1bTVXM09KeDVPc1pTY1lqaHVoejh3eVFnL0VNN2FK?=
 =?utf-8?B?dWdmT1YwSDc1S3l2VUFRRzJ5Rkt2ZWJ3ODVGQWZvVWRFTFVCT3pRQTRoQXUv?=
 =?utf-8?B?Z1dwVFF2cXNWVHEzSlJhbVM0ZERmcGRRRmR4czJ0VGk2ckg3MGx4ZzBBT0ZT?=
 =?utf-8?B?Qmd5VzlwYkpxL0k0bWtEckovYlBYSWtHbmlqbXdvR2R6MENoNVpxOHkrSmNy?=
 =?utf-8?B?MTNxM3FKSmlKUVlKamo4ODZBYk5UZmhhNHdjSUt3SGJpRXRMMUMxcmtENGNz?=
 =?utf-8?B?dGtHYTNKTEx0TGNzL2wzVGFRWFVCOER4enNxK3hkczF0WHAxS0NSeHJCUzJV?=
 =?utf-8?B?a0RFTW9mSkhGd0hMeFNISnc5V0pLN2cwSkVndHNOYTdvcE1LS050cU5abUhV?=
 =?utf-8?B?dHdNOUlCN2VDQmZRRUJyNkJaV2M0T2JUNGFnb091dUxqTGFVNDZPR0tKdDhz?=
 =?utf-8?B?dzdrUHo0dUdzaW9FbGZNbSs4WHZXL3hkWjRoM1pUT28vTlVlTmp4clN5NlpJ?=
 =?utf-8?B?MGxYNlAxV3I3MGxaWDNwMFBuVndOb3BtdHdBWjl1ako3d1FDZTNHOWZFWnBy?=
 =?utf-8?B?M2E4akxVWVdaNVJ4aG1vUTBVWkJUdkJIeGtiNXZXdHo1b0lqK1g1WXd2V3Vn?=
 =?utf-8?B?VGJjbmgvYkdVK2toQ1R4VkZlK2RPMkFuU1FuN1IyYTc2V0FHOXdpbmpYMXVQ?=
 =?utf-8?B?VmN6NzkreXdDT0tFbEtpNU1sNzNSbFFBdXJZd3Z0N2NLSEtwY3YxVm14Y0Na?=
 =?utf-8?B?UHR6Qzd1SnpzQnU1SzRtWGZLQjZuV2RLN05vd2oyQVluMFV3SDk5YVhkZ0k3?=
 =?utf-8?B?Wk1GU05GTDdENnJOOVBISnN1Vzh6R2lLZUdISStUSS9UQ1pPQjFOeW51OEJV?=
 =?utf-8?B?WEpnZjJWclV2VGVxeUZYZHNzQ3JNZk5YRWE2TGZHRUtQNzk4R0NUUUJySWV2?=
 =?utf-8?B?WlloVDJYVUFwR29uanZBU251RFNsd0VRVExKdTBHMCthT3ZXSSs2cHZKQ1VJ?=
 =?utf-8?B?NWMzeFlhcTVsSGFEZ1Zvd0Z0OWovcjNNaFUwckM5Yzd1bzYvaTFlNWRlVGM2?=
 =?utf-8?B?KzF0UkVIb1FiZ3k5OFNkQVZrYjY5dmtZRWQ5dDdaa1IyNkt3UWNuMFRKMStx?=
 =?utf-8?B?ajAwdUZTL0VGNVZSdmdxY2VMMDA1UnNpS0tmZ1ArTnNSckNCK3NGMlY5ejRI?=
 =?utf-8?B?SC9TVmF3V1JrR3NSRU5FVlM4RW5HVmhPcFVXS1dRUFNUV2p4V01EVHUyMUxI?=
 =?utf-8?B?N1F4T2VnczJLaE8zNVE4aTlwd0pWSVJ0b3cwUE5MNW9uRlB6QU9RUDEyeHhM?=
 =?utf-8?B?MEVrUEdRMk5Rekx5WWpSZzNvOFk5a0x3RzV3VXdwMHl5bmFZQ3Nhb0ROWDUw?=
 =?utf-8?B?WEpLcWw4dnV4Q2dFTlRoejl1TmxDL0o3TWNqcTNTaUJMbmFqU1dtd0tBVTdV?=
 =?utf-8?B?ZHRtMU5ORnJ0V1lRVGNBMHNrc1V6VUdzbUgrNVRoY0NDUVU2anV2MkVzMzYw?=
 =?utf-8?B?UStpNENWMFRZanp1cDZWN21XMStKRTA0eVI0d2ttTkk5Nlo0SWxBVTN3MWJq?=
 =?utf-8?B?NktGV21URGozbmVrdnMzd3FDMmVyTUx5ZGtyaHZTYW8xNHN4SW4zQm9vODJX?=
 =?utf-8?B?bnFISjMxa095bGFobGFGV2s5bTc3aXJTL1k3dFhjRGFTcjlkcndrVUdqQ1Rs?=
 =?utf-8?Q?ybMsQz2LQXF1/AObJ63YIP0C1zeBew4g00Ta0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGVtYUx2T2Y1Q2EvU1VuUmJXbW9RcmtFWHpqK0U1RWNDYnl2NXdNRWVOaUVJ?=
 =?utf-8?B?K0hJdUQxWExPNllhZHQycm90VHA3WlZkVXpBdnhsUDJlbFR4dDFqRzFtczVy?=
 =?utf-8?B?YSs5NHhDaVNLS0pVcjRQNnFKVU1FU1pEN3JBdUpSdHBma0tqUjRaRDdNbTYv?=
 =?utf-8?B?ak5RdVp4ditsZGtTRE5yYmpkY0JtM25WTVN4MzFUUGlYS040bkFhdEU4eC9h?=
 =?utf-8?B?akFRYlIxOUFpcnA3VkxxSm0vRlZkNHVBbmlHNE43RlF0VFgvT1AvTlNNekJ5?=
 =?utf-8?B?Q3M3VzBWWEpzWVlXU1B4NDdCUkd3eUdpaTFOZFJwTHg4eXFKMzcvRWtjdlFQ?=
 =?utf-8?B?RUZ5VE9qbjdHU3g5dXAwY3JTS0ZzR2tiNlZBZFh0WXhIWTR6SUx5aG9OUnBU?=
 =?utf-8?B?VXU0NmpxU21QK0wrekZjNTVzZG1mNWkrYmtwZEFQRGZGUVVkalJtYW9qdXFs?=
 =?utf-8?B?RlhMWTRaQ0Jxa1ZxREV2SDFxR3dTMVpSL2ZKV1lXZitmYjd3S2YvdGQzb0ZC?=
 =?utf-8?B?U3Jvb0dELzJ6eHFrWkhBVm5FMkhLYkd1cnc1UFg4cUM3N3FzYWdIYk9HaSt6?=
 =?utf-8?B?Nno1MHdnNXU5ZUhzb2ZmYVZMRDNPcUh1a3ErdGU0d0tPU01hakpjVExHYncw?=
 =?utf-8?B?eDNSMHNCN3drT1dweXZzV0FZZm5UN0lLVS9oK3BQNGRRY3lyN0ovWXFrdlVC?=
 =?utf-8?B?a1VkQnFHSXJxdWJzTU5uU1ovclVYNktCSFFkSWxpN1FuTjk2R2NXZHpJTzRz?=
 =?utf-8?B?L3JQMzJYRVVFUm5ZVXlMM0Y4cWhHdVlLS1J4Wmozd1J3Qkt3Y3NhT2hyU1lz?=
 =?utf-8?B?SGN6TmxwZFZHeTl3enY0TWVvdjhidGsrUkxZQ2JRYWdOZEJ6VEtJcUh4MFpF?=
 =?utf-8?B?UHdVNFlrR0VzcFlLanR5WG9nb2tPemVRYWp0bXFUaGZaM2xxcWZqUTdnSUJr?=
 =?utf-8?B?b1JIU0IyKzRCWEFtc2h5dUp0c1dWOU51ZzBhUFNWU3o1UGM3TnhweVNMS3p4?=
 =?utf-8?B?a3VaRVpWMnBmaElJUnkwcC9OSHdNa3h5U0R0Sk1WZWJIRDdGVUZMZVZPU2FC?=
 =?utf-8?B?a2NaNmdNM0Y1azVCMGNlNHYxalZTckkrdWRFSFdBWWlZTldrYXZ1R1QrOHRF?=
 =?utf-8?B?MTlWWE52QUtjM0xXQkRuTExjaDJPQlMveDJLMlJLSHVnY3czdjBqZlBCc0g1?=
 =?utf-8?B?VHBZVXl0WG9odW1jYmFuQTUza1diOXpBM05DZGZDbTZxNDgvZUp3YnhVTTlR?=
 =?utf-8?B?V3ZoZ3hnRDEySmpDN2Jvc0VZSjhSaHR2R3dpK0g1WXdHYnBJSk9HQTNWd1JM?=
 =?utf-8?B?OHhxeTRvTU1qdWdGRHFPRXRjVDI4ejVGcERzY2hmZTZPTnpsZFRlVVJNVXNj?=
 =?utf-8?B?VlY3NkFnQlVQOWN0dk9pc1lkeGNQVDNOUktYb2FDYUhZeGV0STBWblRSQ3g5?=
 =?utf-8?B?aWxJYjUyaEJVa1JjWU1xaE5MVURRcmV5WXl6RUJKZWs5K3oyU2lvYVpSWVlv?=
 =?utf-8?B?R1A1OUNFYjhwOWFobGFzUG9ZM1FPN3ExYnFtYlQvc1RTWXphWDJnaVdmMzhG?=
 =?utf-8?B?aFoxd3lQTTZDaE5jWjYzNlJCY29ZbGVndFJHSUNyOHZrN1I2eExpZWxrRDFG?=
 =?utf-8?B?TVBwVDY5bVdQK0dodjZldWM3YnRtdDJEc3YwWXgvTkZaTDBadkEvNWZtd3VQ?=
 =?utf-8?B?QmNCeEkzN3Y3R21Kck84Ylk3eWxkM3EvYVJrTlpRK0RLQ1h5NE9xOHJYNFBG?=
 =?utf-8?B?bTAzWGpNbkxEajdMaDlmckFqclF0RVZ4QXNVTTJEMUVhU1JsUmhhYnlDY2tq?=
 =?utf-8?B?M1JTSmlmSEg0ZnRxQ3ZOZTVCajljVkxRYyt5UTNnZjZsTzFrU0dTWXdVTEpm?=
 =?utf-8?B?NGowaWd3NWxuWGNWSDk1N1A0VlhzS0xHalh1UVAxZlhreTAvVUZ3T0JxUXdl?=
 =?utf-8?B?cS9hOHBXL1h1QXdISDN3bURjVm1HdFc1bjRIVVpDSHNOVEs5UXlKWGxVMmdl?=
 =?utf-8?B?L1VTbThyakZYUlVZYnZGZ0Y5QjVyTnNTeWRDWk0yeUhZMC82TGJOUkxGQ2ta?=
 =?utf-8?B?RkNhUGtZZHE2SktnK0xtb25VTTN1WUNxL1czYXhIRDdYendwWHJEdkpCUEs3?=
 =?utf-8?B?UVJYM1JDaytlVzRWL1BtMzY1clB6aTNrNnlyeVJPNU5IdnJ5RitrOGpHSTJy?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1af87f-b431-4a4b-7cda-08dcf7355df9
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 09:46:16.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpUAJ8lgkBUciBDtRr+6DSvQpKGO6JvwWBon5RzpQUyWj2Ux8vHS5bGAh1DwXvr8VgeRnm3Ok7arcyLHXvE1WOe4Hhyp6ALzwvrj0HSGCrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7742

Hi Christophe,
     Thanks for your advice. It will be added in the next version.

On 2024/10/18 23:51, Christophe JAILLET wrote:
> [你通常不会收到来自 christophe.jaillet@wanadoo.fr 的电子邮件。请访问 
> https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
> 
> [ EXTERNAL EMAIL ]
> 
> Le 18/10/2024 à 10:10, Xianwei Zhao via B4 Relay a écrit :
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add a new pinctrl driver for Amlogic A4 SoCs which share
>> the same register layout as the previous Amlogic S4.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/pinctrl/meson/Kconfig              |    6 +
>>   drivers/pinctrl/meson/Makefile             |    1 +
>>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1253 
>> ++++++++++++++++++++++++++++
>>   3 files changed, 1260 insertions(+)
> 
> Hi,
> 
> a few nitpicks below.
> 
> ...
> 
>> +
>> +static struct meson_pmx_group a4_periphs_groups[] = {
> 
> I think that struct meson_pmx_group could be const.
> (same for a4_aobus_groups above)
> 
>> +     /* func0 as GPIO */
>> +     GPIO_GROUP(GPIOE_0),
>> +     GPIO_GROUP(GPIOE_1),
>> +
> 
> ...
> 
>> +static struct meson_pmx_func a4_periphs_functions[] = {
> 
> I think that struct meson_pmx_func could be const.
> (a4_aobus_functions above as well)
> 
>> +     FUNCTION(gpio_periphs),
>> +     FUNCTION(uart_a),
>> +     FUNCTION(uart_b),
>> +     FUNCTION(uart_d),
>> +     FUNCTION(uart_e),
>> +     FUNCTION(i2c0),
>> +     FUNCTION(i2c1),
>> +     FUNCTION(i2c2),
>> +     FUNCTION(i2c3),
>> +     FUNCTION(pwm_a),
>> +     FUNCTION(pwm_b),
>> +     FUNCTION(pwm_c),
>> +     FUNCTION(pwm_d),
>> +     FUNCTION(pwm_e),
>> +     FUNCTION(pwm_f),
>> +     FUNCTION(pwm_g),
>> +     FUNCTION(pwm_h),
>> +     FUNCTION(remote_out),
>> +     FUNCTION(remote_in),
>> +     FUNCTION(dcon_led),
>> +     FUNCTION(spinf),
>> +     FUNCTION(lcd),
>> +     FUNCTION(jtag_1),
>> +     FUNCTION(gen_clk),
>> +     FUNCTION(clk12_24),
>> +     FUNCTION(emmc),
>> +     FUNCTION(nand),
>> +     FUNCTION(spi_a),
>> +     FUNCTION(spi_b),
>> +     FUNCTION(pdm),
>> +     FUNCTION(sdio),
>> +     FUNCTION(eth),
>> +     FUNCTION(mic_mute),
>> +     FUNCTION(mclk),
>> +     FUNCTION(tdm),
>> +     FUNCTION(spdif_in),
>> +     FUNCTION(spdif_out)
>> +};
>> +
>> +static struct meson_bank a4_periphs_banks[] = {
> 
> I think that both struct meson_bank could be const.
> 
>> +     /* name  first  last  irq  pullen  pull  dir  out  in */
>> +     BANK_DS("E",  GPIOE_0,  GPIOE_1,  14,  15,
>> +             0x43,  0, 0x44,  0, 0x42,  0, 0x41,  0, 0x40,  0, 0x47,  
>> 0),
>> +     BANK_DS("D",  GPIOD_0, GPIOD_15,  16, 31,
>> +             0x33,  0, 0x34,  0, 0x32,  0, 0x31,  0, 0x30,  0, 0x37,  
>> 0),
>> +     BANK_DS("B",  GPIOB_0, GPIOB_13, 0, 13,
>> +             0x63,  0, 0x64,  0, 0x62,  0, 0x61,  0, 0x60,  0, 0x67,  
>> 0),
>> +     BANK_DS("X",  GPIOX_0, GPIOX_17, 55, 72,
>> +             0x13,  0, 0x14,  0, 0x12,  0, 0x11,  0, 0x10,  0, 0x17,  
>> 0),
>> +     BANK_DS("T",  GPIOT_0, GPIOT_22, 32, 54,
>> +             0x23,  0, 0x24,  0, 0x22,  0, 0x21,  0, 0x20,  0, 0x27,  
>> 0),
>> +};
>> +
>> +static struct meson_bank a4_aobus_banks[] = {
>> +     BANK_DS("AO", GPIOAO_0, GPIOAO_6,  0,  6,
>> +             0x3,   0,  0x4,  0,   0x2,  0,  0x1,  0,  0x0,  0,  0x7, 
>> 0),
>> +     BANK_DS("TEST_N", GPIO_TEST_N,    GPIO_TEST_N,   7, 7,
>> +             0x13,  0,  0x14,  0,  0x12, 0,  0x11,  0, 0x10, 0, 0x17, 
>> 0),
>> +};
>> +
>> +static struct meson_pmx_bank a4_periphs_pmx_banks[] = {
> 
> I think that both struct meson_pmx_bank could be const.
> 
>> +     /* name  first  lask  reg  offset */
>> +     BANK_PMX("E",  GPIOE_0,  GPIOE_1, 0x12,  0),
>> +     BANK_PMX("D",  GPIOD_0, GPIOD_15, 0x10,  0),
>> +     BANK_PMX("B",  GPIOB_0, GPIOB_13, 0x00,  0),
>> +     BANK_PMX("X",  GPIOX_0, GPIOX_17, 0x03,  0),
>> +     BANK_PMX("T",  GPIOT_0, GPIOT_22, 0x0b,  0),
>> +};
>> +
>> +static struct meson_pmx_bank a4_aobus_pmx_banks[] = {
>> +     BANK_PMX("AO", GPIOAO_0, GPIOAO_6, 0x00,  0),
>> +     BANK_PMX("TEST_N", GPIO_TEST_N, GPIO_TEST_N, 0x0,  28),
>> +};
>> +
>> +static struct meson_axg_pmx_data a4_periphs_pmx_banks_data = {
> 
> I think that both struct meson_axg_pmx_data could be const.
> 
>> +     .pmx_banks      = a4_periphs_pmx_banks,
>> +     .num_pmx_banks  = ARRAY_SIZE(a4_periphs_pmx_banks),
>> +};
>> +
>> +static struct meson_axg_pmx_data a4_aobus_pmx_banks_data = {
>> +     .pmx_banks      = a4_aobus_pmx_banks,
>> +     .num_pmx_banks  = ARRAY_SIZE(a4_aobus_pmx_banks),
>> +};
>> +
>> +static struct meson_pinctrl_data a4_periphs_pinctrl_data = {
> 
> I think that both struct meson_pinctrl_data could be const.
> 
>> +     .name           = "periphs-banks",
>> +     .pins           = a4_periphs_pins,
>> +     .groups         = a4_periphs_groups,
>> +     .funcs          = a4_periphs_functions,
>> +     .banks          = a4_periphs_banks,
>> +     .num_pins       = ARRAY_SIZE(a4_periphs_pins),
>> +     .num_groups     = ARRAY_SIZE(a4_periphs_groups),
>> +     .num_funcs      = ARRAY_SIZE(a4_periphs_functions),
>> +     .num_banks      = ARRAY_SIZE(a4_periphs_banks),
>> +     .pmx_ops        = &meson_axg_pmx_ops,
>> +     .pmx_data       = &a4_periphs_pmx_banks_data,
>> +     .parse_dt       = &meson_a1_parse_dt_extra,
>> +};
>> +
>> +static struct meson_pinctrl_data a4_aobus_pinctrl_data = {
>> +     .name           = "aobus-banks",
>> +     .pins           = a4_aobus_pins,
>> +     .groups         = a4_aobus_groups,
>> +     .funcs          = a4_aobus_functions,
>> +     .banks          = a4_aobus_banks,
>> +     .num_pins       = ARRAY_SIZE(a4_aobus_pins),
>> +     .num_groups     = ARRAY_SIZE(a4_aobus_groups),
>> +     .num_funcs      = ARRAY_SIZE(a4_aobus_functions),
>> +     .num_banks      = ARRAY_SIZE(a4_aobus_banks),
>> +     .pmx_ops        = &meson_axg_pmx_ops,
>> +     .pmx_data       = &a4_aobus_pmx_banks_data,
>> +     .parse_dt       = &meson_a1_parse_dt_extra,
>> +};
>> +
>> +static const struct of_device_id a4_pinctrl_dt_match[] = {
>> +     {
>> +             .compatible = "amlogic,a4-periphs-pinctrl",
>> +             .data = &a4_periphs_pinctrl_data,
>> +     },
>> +     {
>> +             .compatible = "amlogic,a4-aobus-pinctrl",
>> +             .data = &a4_aobus_pinctrl_data,
>> +     },
>> +     { },
> 
> Usually, there is no extra "," after a terinator item.
> 
>> +};
>> +MODULE_DEVICE_TABLE(of, a4_pinctrl_dt_match);
>> +
>> +static struct platform_driver a4_pinctrl_driver = {
>> +     .probe  = meson_pinctrl_probe,
>> +     .driver = {
>> +             .name   = "amlogic-a4-pinctrl",
>> +             .of_match_table = a4_pinctrl_dt_match,
>> +     },
>> +};
> 
> ...
> 
> CJ
> 

