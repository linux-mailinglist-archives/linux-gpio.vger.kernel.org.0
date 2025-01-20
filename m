Return-Path: <linux-gpio+bounces-14932-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D99A16671
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 06:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 572763AA699
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jan 2025 05:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CEE17E015;
	Mon, 20 Jan 2025 05:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="HyC+UF4h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2090.outbound.protection.outlook.com [40.107.215.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B3716F0E8;
	Mon, 20 Jan 2025 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737352680; cv=fail; b=ulE8jqvw6h3IYLbWkqdeG5H2LhXWAS7i3UpcgychigdGPR7DVb3yBr2JP0H6YsuEkY35itJw0ZcbA06wsRJRvW3CNBE8HCw4RmBVYHB+5uFGdyUFcPblxhdG9M/cK5gkwxf7D26ke3vt8h78iL3dqRJR2K4QumQuzo7alMKV0+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737352680; c=relaxed/simple;
	bh=BctRcs69daNkCekyEso5EyJHXFbeJ9tF0WNsBCsqdyM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CY1Pyf5qAJtb43/aBp6h8NpygjTeFHUN2zJBS1bt7CyQMsxaxpqH1n/1MjDnckZBlpDFLtbD823NBWfih/QSIecR6YtzL2AwiJJMT1uFw4NF6DtkkPzXhn6yMfgjK64EUDL6VMWy05CtQUyWHOd8NTEv7EYmgXVcmJpwYcjSwbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=HyC+UF4h; arc=fail smtp.client-ip=40.107.215.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGtZWoZrSfLKQWfo/M3v/eKwF4X9TbE6LLKEknAPvPEXMgl1U8hNNUfQb3vz//fb/WYD7cXnnCp415GYim8g/rT6jo7WUMvgRZFgoQOidypWY2MahfZG+CO2t9oKxdFhwhzBmr8Q7usW2u2cwlhsfRvahdLHvp/o4sv+YdkcQ+tIZi+ohAkfb5M815vJsN+eL6LxUMwFBb85rCyhWrrb0ElMZJmrs5gLQvLGqhq8T9gkvQbrj+mnw9Bg5GxR9CjkqJcDA8Iwel7jtX1lTSj3+caKbiLTe9IdFhI8rTYsMjOOO9h8cpAWDWx5g4pd0JbdIRXBd/OMxpTo4WH2LjkS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWbungsVXX9dtPl5blFkpuI3fBOpExatAZLbJfUv4tM=;
 b=j/MvjPS3WgfGqLohWJcqiyU+PK0cKUvV4lNogmHHqg1fSTyno+uY1UiIplY62YZHjlmi/j7qDrPBKMzxHnAqg/oa4j8Nsrz1cy7oHkpm9C89YqFB+fB6k8+Bf336m+c+Og5aibZwlB0coZxMLxdqPqriwbf8eq5Odb+XBz0pKWrFX7wCKrMp+5Id78Z95maTBGHXjQugcaVpJDwzjHKJETpBYt5xgh5nU4xl9KGJB1UpuKvdflwBAS/yL3bOoKBTHWZPw4R6g/JYw2J6H6RrHRNjCxKCUqqIINbXNXD9lEs0p2MyzNKyL+/hSGumr6XujjWDEbwn7UYdWPpOuh14Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWbungsVXX9dtPl5blFkpuI3fBOpExatAZLbJfUv4tM=;
 b=HyC+UF4hYs1Yxdg2Vvd7aJRWJMaqwSibk5HnJsxwAdqne05ymPtPYyMWZE04xojw/PoXQswU+9jkagLoccjPv3A8ufQj3XftDqtsslUzYW8yAlOulhRwO526Lh+Ea2Tnk4rNR+yaoU6Bof1GnolmYq8BuQa4xJswGbZ6w4SyIVaXFbSCln8bVOKS/zQNqVEFql9fTvW4FirB6cUq3MLfhOliINGuVPkJ/Iv9MEJeg6e8EgIKMe0yOy0xGtS9+/57iZwZJfS7N4QbFe547DF0Q7xg8SlqXVqyTGZBeFUa80FtaHfr6zdgtMYm+I6enK9Q4SX1N+EvQJxo0q3iPwxeDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB7411.apcprd03.prod.outlook.com (2603:1096:400:429::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 05:57:55 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 05:57:54 +0000
Message-ID: <012cfaca-e8f5-4614-9393-a4a46a797adb@amlogic.com>
Date: Mon, 20 Jan 2025 13:57:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
 <20250115-amlogic-pinctrl-v3-1-2b8536457aba@amlogic.com>
 <20250117-intrepid-nano-horse-98e817@krzk-bin>
Content-Language: en-US
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250117-intrepid-nano-horse-98e817@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0096.apcprd03.prod.outlook.com
 (2603:1096:4:7c::24) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aae5cc3-e557-4bd1-a369-08dd391761b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXcvWHRvWHU4TUdzUWVURGpURUtHbmY1TmxmRmtHK0RUYlpmekRCQ0QwTGho?=
 =?utf-8?B?aVYwNnB1MTFKTnZ1M2lWcjIxVW40ZFJna2FWVjVQZFBpN2RCOUNNeU1xVjhw?=
 =?utf-8?B?QU9aSnJJb2VKSG5JTjZ1dWV2S0NNR2RSRHJyZEhUUkJxL25VNmhWT29YNGZ4?=
 =?utf-8?B?K1ZZL2o5QWkvNHRzTGlUcGp5aGNGTU5HLzZFZTc2M2RyK0wzZlRkK1Rac2FU?=
 =?utf-8?B?dUR0eVM2OVVSeTlKbzRwWnVQVlV4S083dWVSMGJ0aVpONXh4Z0VLREJxelF5?=
 =?utf-8?B?eTFUV1RIY0hBWTVnZUhzcGh4NWUvWDlUblh4UlJzQXJ2M2tlWGgwa1JZeCts?=
 =?utf-8?B?b2ZyUHhOTThXWkFCWWxpZWxwL1owRmNNd1habWlVUnczVFVnSHBrRUZqSFFw?=
 =?utf-8?B?ajlRMnlqYnZ2QnovZnBLMVJrVVZvMkI4SE5xbVpzOXg1UGRBZ1VTZVROeWpZ?=
 =?utf-8?B?M0d2WjRkbFRCMHErQzhCRUdDSmpYUklXT2s2Tk0yVlA4Ti9PaDU3NWlObURF?=
 =?utf-8?B?U3BGeEMxeEhLMW8zTmt0RnhwT015aVRWamdCNE5wQk5mcThXanUxTjlYMkhz?=
 =?utf-8?B?Qi9tQkxOMmp5TjZNKzFlNDkyT28ySGR1Wk9aK3FhbkZrYVU5ZTA3VnFhYWV6?=
 =?utf-8?B?TmZlUTdOdXhJVWdXckpqWXNCMWVQTFVFRXRINWRzVjBQT1JKSXFNYzI5em92?=
 =?utf-8?B?clZ4ak02eHZFM3AzcWh4WHg2L2xxWFdDRXJseVhqMUNyTjg2ZUZyVnVldHNu?=
 =?utf-8?B?Mk5HWUt5K3NZd0xycHNVU1l2Q3lGTitXbXNGZTlxTGxnREZYUXNMQ0NEYXRs?=
 =?utf-8?B?N2F6MjZuQ1pHbU8zelJTL1dITVdpODN1eWZyMWxqZTBmSWEvY2dPWExQS3hN?=
 =?utf-8?B?K1FXS2JGZGdMdDBTM1NBUGVWKy8rVWZaaTNTenZlWFI0UWZISUEzaTcwb0Zl?=
 =?utf-8?B?Mit6ZjJybmxXckg1SzBhd1lBSXAxbmRZcHFlQUVaalhobUdaZEpydmNLNzRp?=
 =?utf-8?B?U2cwb1dhekVJbWRTcTB1eVdYZlp6Z2w4UzhRUW5xVG5veWZqUzE1Q295bHM2?=
 =?utf-8?B?TDhXNkoyc0RJUlNzUnpGdEpiMzVRdVBNYmtxYVhCMStiQk84ZzFVVzgwNC9I?=
 =?utf-8?B?Uk1pUUdzMFMzVWQwYndUeXQ2WGo5ZlNYeEdGU2NXbkV2T1lVMUFQMFZBd3Fa?=
 =?utf-8?B?QlBnUXNHSjhWL1Yvb0NZaG9ZYXE3VHNUT2phdUhnbnU4NzNFUjF6MTM5UVdZ?=
 =?utf-8?B?bG5YVEp6U2tEbUc5aC9JcUlaTm1UK2FaTVhJNjZHSkM5ZkhHZ3hveTdCNWov?=
 =?utf-8?B?c0lsNUl2UGk1dHNrcWNqYTh4dlFJbnhqYmtZaGtSOGpab1g5ZER5Y241MTRZ?=
 =?utf-8?B?LzlFbXRNOEpYT2UyMkhBb0oxKzMzMGxSblVDbUFtR09VdVUrTmkzTlQ2Zmtq?=
 =?utf-8?B?OENGcVRLNWVaYVNJN2FpdXhMME4zdnVPZHJZUTZIUGFYRGV3Tm5EL0tMRHFZ?=
 =?utf-8?B?UlhETk1HbTl5NmVxZ3NLOGp5YTBBdTJ5d2dSRDJ2Y28wcTIrRDVnRGE0eThD?=
 =?utf-8?B?K0dTTEdNNGducDhKYUhxRnoveWRFUzI4S1hIWTFrNkRuRmFnZFBSaG1IY3hI?=
 =?utf-8?B?UW1oclVqb1BNQVhMN3hzWFAzK1JyVzdIdzNLa2VNOVV3R0k5NDArdStnNDlQ?=
 =?utf-8?B?N0psMUhnbWljajdYU0JTbWhOc05CY0t2ejg2R1Zzb1gwU3hwTjZBRmluU3Jp?=
 =?utf-8?B?Q2N6RkxRT0swTVlxT2dhdVN5OGhQMUh3L3FCVnpJdmJMU0ZNMXlqVDZTL1cz?=
 =?utf-8?B?LzZaV3IxeUhqL0l2TnVwTUUrVy8va1NhajVMMytOM3NoS2tmSHVvMU9Fd3Nx?=
 =?utf-8?Q?wBSnYS7X5i+71?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjBPTFFPbjlWdmhUVlVwVEZwN1ZGeWRsNDJZOEZXUEFHQTRETm40TmVHQ0tw?=
 =?utf-8?B?cEZ2UTcvNStWSXRZZkJseUh2SGRQWWFaaVRoZUhXWU1JTzlNY0JoQ0xhQ1dO?=
 =?utf-8?B?c29GdVVrVmJlc1dGZWF2TnJrRXM1ekFlNkJ5dWhDaXl0TSs2a0JMdnRGTUVW?=
 =?utf-8?B?TkxCN01IdnhlSG56UVNLdkhITXVUclBxVlY2bmo1U3Z3UHU3Uy83OUtKZUlr?=
 =?utf-8?B?bWp2RnRaZk9DM2FFNTA5c21CbGtqd08vYmxCSk1jOXhrYzFmbjNWSnZ0cUNM?=
 =?utf-8?B?MnB0MGQ5L2pDckd1cStYWThlWGpVZ0F6WUtISGVIR05DYlZRSGJ4d0RncnBJ?=
 =?utf-8?B?RnQ1V2RJQkhVcXdLZ28rSEVQdmFERy9tU0JiM3J2cSsxRCt0ZzA1RnhQTVh1?=
 =?utf-8?B?WEZkbXcxTkl2YXN0R1B2bEgwUm9QMVJWNzMxVkJKM1J4MVk2YWp6aG5PZEhw?=
 =?utf-8?B?dW5QYlNjd3AvQVZ1REpoZDd3bE1WM1V1RGw5SmxwbFpIejBLbFJGbU1mdVhY?=
 =?utf-8?B?RDd0aDc0Tms4dWV2TTNHS0pRQmFHYW5RVGI3SDBZcTFYUnJhMjMwN3N1L3pV?=
 =?utf-8?B?ZVhNYldYMXF3TUhUQkJpZmp6U2hiRUUzQ3V5cVN6UE4xZFhSdGZ2cjQ4NkZp?=
 =?utf-8?B?YzJlSitNT3NjYzMvNng2RTBxVk1IamEwZzFPMFg3V3J3SlQ0Y0psdjRpaDdy?=
 =?utf-8?B?bm55bVRYR3REVkVhckNqcFhSazNmTDBjUFR0a2FsV1p4L1YvZzNKYmtPZFdk?=
 =?utf-8?B?SXlIZmVhcXU4RmRWM1R1dkxGMVF4UUhQVEVFQm1nNWNOb3U3azlwOVlVWWM4?=
 =?utf-8?B?NjVNYkVDZ2pWMVVaczFyb3BvSEJWamVVUDF0UGE1b1RUeWtUblVMQWJONXhO?=
 =?utf-8?B?S1VIRXAzRmJ0WXBTSXp1NnhWOXhxUHY4TjRpRE1IUEFXWW5Md1dKNjRGTHlv?=
 =?utf-8?B?ZjVlWkUvRHorU1dreU5mY2ZRZUhGNXI4M0ZCVGp5ZTcvZzNjOFJDQUpLY1pn?=
 =?utf-8?B?V1VPSXZZZDZYVzFrZEZBTWJSZGgvemZ5WjZjVzJBUmt0WU55UlJnV3VDQjJi?=
 =?utf-8?B?NE1kbE83R3YvQloxbENaMnorNlRPTUlEbDhZeW84UmZYTk9FanhaR1RDVHFh?=
 =?utf-8?B?M3ErK2k2TzBJZTBKU2ovNG9DMi92UmVxVlBQSGt4UW1TTWh4ZFI0RndEQ2tu?=
 =?utf-8?B?VjhTUlZIeFpDWXRWZmo0allXWS94NElzRERhcE1ZNGFoVkJ0MHg0OXk0cXZI?=
 =?utf-8?B?cjNKTkp4d2R6N2JzQ0tFbjJQVFJ6QTVaRnNnU1IzcEZ1ZEcwclFxMXN3cW5u?=
 =?utf-8?B?aTV0UVBzL3dRRGR2WEtVdW9Kd05icGlud0hQWjZGcFN3Z0ZiSWZNMnF6NG1C?=
 =?utf-8?B?UG1qcDYxRFprbFBBSGV2a1d5aDJJT3grMFVNUUJFekxGZ1VnQ3BQbkR3Y1BM?=
 =?utf-8?B?bDh3em9YZTkxWGl3VGxpQWJ0a0lDeTdMK0xvaXRXcktZSFlEK1FaUE5DYXpS?=
 =?utf-8?B?eWV3TEFuQldKMTZQRWJ5Y1NVMXZMOC9XUEhUcTdlNHJrb2M2WThobnJPZ2tV?=
 =?utf-8?B?WE1kOVVVNGxSNWdjd1g2cXBza0ZKdEcwQkxVSjF0amd5NUNNL1JiN0VGNWFV?=
 =?utf-8?B?dW5pS0NPTlZJOTVBdWd5ZjViK2o4eGYrcGh5YUFYeWI2eW5FK3NaTHI3OE5Q?=
 =?utf-8?B?TjF2eDRKclEzUkZOYzRhVkpkaEFPK2w2SjJOYTdrU3pza2lDV1QxNG9CUkNK?=
 =?utf-8?B?eXp0Q2hSNGYrTEVwZ2lPWEswbERHT282QXZWQXYwclB2UzZDN3hSdWhFckhh?=
 =?utf-8?B?N3hTNXM1ZFlKMmNXWDNvcnJNVS9FVWJDakNyM1FKRmlENFZYMlhUM2V1a0hM?=
 =?utf-8?B?SjVsRjl2OXRsaWI3ZkJDOWkxRkJPcGZ3WmVlVS9DeHVFZkx0bWxvSVZVMGZj?=
 =?utf-8?B?d2IwYUo0L0RaZFM1cXdzc2o1cVNhRFlUS0JlOHEwWTN5ekR4V3pJV0JmZEQ1?=
 =?utf-8?B?TkJYWWpnSkFnN3dLWG4yRndZS0NDWElhVnVtRTFiSmlpNU5PS1NZSFRPc3lB?=
 =?utf-8?B?a1pZOHVhdmNxalF6MXVzWVNmUllZRUFRUk9vc0pkanBSTEFRVHI2a043VHhN?=
 =?utf-8?B?ZkZyMVRZU3lZYzd0bUxYRmlnY1VjWjVROG1FcWJOUXVDVTc3RGlyRlhmdWNl?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aae5cc3-e557-4bd1-a369-08dd391761b8
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 05:57:54.4788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bIK/KUR90yFp8ahM2dU2qHpMkRNOhl+PUd9yew9cvXDHsbaBuWEojvJ+m+CQfGvtgTdmUkcnclRnUv9+zWkYCdR7by6aHgiKt0YsyaxtvhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7411

Hi Krzysztof,
    Thanks for reply.

On 2025/1/17 16:48, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On Wed, Jan 15, 2025 at 02:41:59PM +0800, Xianwei Zhao wrote:
>> +properties:
>> +  compatible:
>> +    const: amlogic,pinctrl-a4
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
> 
> Why this moved to '2'? 32-bit was not enough?
> 
Previously only represented a register address offset value, now 
directly represents a register, through 'ranges" which to represent. 
32-bit is enough, but since APB bus is defined as 64-bit, here is 
following. I increase support for 32-bit. Like the following values:
   "#address-cells":
     enum: [1, 2]

   "#size-cells":
     enum: [1, 2]

>> +
>> +  ranges: true
>> +
>> +required:
>> +  - compatible
>> +  - "#address-cells"
>> +  - "#size-cells"
> 
> Keep required after patternProperties
> 

Will do.

>> +
>> +patternProperties:
>> +  "^gpio@[0-9a-f]+$":
>> +    type: object
>> +
>> +    properties:
>> +      reg:
>> +        minItems: 1
>> +        items:
>> +          - description: pin config register
>> +          - description: pin mux setting register (some special pin fixed function)
>> +          - description: pin drive strength register (optionanl)
> 
> typo: optional
> 
Will fix.
>> +
>> +      reg-names:
>> +        minItems: 1
>> +        items:
>> +          - const: gpio
>> +          - const: mux
>> +          - const: ds
>> +
>> +      gpio-controller: true
>> +
>> +      "#gpio-cells":
>> +        const: 2
>> +
>> +      gpio-ranges:
>> +        maxItems: 1
>> +
>> +      bank-number:
>> +        description: |
>> +          bank-number are provided by the pin controller header file at:
>> +          <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> gpio-ranges tell you that, don't they?
> 
Yes. Get it from gpio-ranges.

> Anyway, you would need here minimum and maximum.
> 
Will drop bank-number property.
>> +
>> +    required:
>> +      - reg
>> +      - reg-names
>> +      - gpio-controller
>> +      - "#gpio-cells"
>> +      - gpio-ranges
>> +      - bank-number
>> +
>> +    additionalProperties: false
>> +
>> +  "^func-[0-9a-z-]+$":
>> +    type: object
>> +    patternProperties:
>> +      "^group-[0-9a-z-]+$":
>> +        type: object
>> +        allOf:
>> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
>> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> 
> Missing required pinmux and maybe other properties.
> 

Will add required.

>> +    additionalProperties: false
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>> +    apb {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      periphs_pinctrl: pinctrl {
>> +        compatible = "amlogic,pinctrl-a4";
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        ranges;
>> +
>> +        gpio@14 {
>> +          reg = <0 0x14 0 0x10>,
>> +                <0 0x14 0 0x10>;
> 
> One line.
> 

Will do.

>> +          reg-names = "gpio", "mux";
>> +          gpio-controller;
>> +          #gpio-cells = <2>;
>> +          bank-number = <AMLOGIC_GPIO_B>;
>> +          gpio-ranges = <&periphs_pinctrl 0 8 10>;
>> +        };
> 
> Best regards,
> Krzysztof
> 

