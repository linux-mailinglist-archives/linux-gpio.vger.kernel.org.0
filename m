Return-Path: <linux-gpio+bounces-11348-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADD799E13B
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965351F22968
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A43E1CACCC;
	Tue, 15 Oct 2024 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Io5BPOlQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2123.outbound.protection.outlook.com [40.107.117.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B918BBA2;
	Tue, 15 Oct 2024 08:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728981453; cv=fail; b=IZGLbLefhBiCmIbCRVyAgejZnvTJZJ0JK4OBf7jq5Midl8pscN2QMkNqhuHHUt2OBjcYb3iFsds1FgZEzMhH7ZeIYsHTGmlVcpWrnvBeKjAbzz8PE3U5eloIVevY52Xc6vcXH7ZFAmXMNeMOKUlFI3hXBJ6oy26aOLEQcGUykeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728981453; c=relaxed/simple;
	bh=UjSIxvnIAlMCaWHdzJL3hK2vXW8Qsanijwq142H5gFM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=U79iivuj2CkrMR5wwhqlkISPkWh5+ceD6FbCBzfDoUtmk/Gq77FExB9Tx+rjc31ZJxG/CnY0Vf91W4eZ484viN8t7xeoqsyORoSfr65KA0d5W0+pLnIibTKcMPywK/kPt4S/z+nrq1DT/igzi3A3WCfnPyBoE+9ON9Kb8dhx3Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Io5BPOlQ; arc=fail smtp.client-ip=40.107.117.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CURXA+jFkoXv2EMyGgnRk1Vu68tlVcAQngeXaavyc2HjoYGj/jVjV5/83d7b/is3widkRgIR89yctCIRG5eO3auKReiFPPp00Y+X07EhBPlIg9YPV6Z/n3QVHhTpkMZa77J0pIX4pVjFhVP2lmTu+8T9HGC0W+JTPACUZYAgQ/9h9JweXuTIL/Rwk0CTPbHmzWE9//A82HNwD0FvOncXUzwpPUopj+g04Q5+Twc73nVTDytXV7Vn2u0OtNIhdu5rx+Aa5UOM4JTWqJR9OqUhamzT26vwr5Ah7JmM2TQuKUMQ9BOYTTHA+MGUfV3jU9/reFP8FxoDQaDnzZJZXfG+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hWjWhrWjCzkhKoML8gD9VrPAfDfgjSElLM4qinqYoU=;
 b=t7rmxASn5Fncm9McnjtMvu46jOJYNYufV8jbnLEKdCyYKeJXUFC7M02y0ncFSrhtVXzIHYnp1xfg6/U3hW9RPDB3aApt23ABgMVvHpgE5YTGSXoW8vD5pUN6Tj4Hm/r3i86vCkFq1LOJuAG72zhB+Hv1WYt5hpEak2iJuE+ToBt79CUpmR7t7m32NBXKs+Davd2817aARA++Jcx/yF4OivgorsZT3OxDdyQCMdTYETqWQXefPhsImKrMDuhdVaCLzFbHu3D2I/yuAqkiWeYYQ9bvQNa3b76mxu6ES1UsYBHVAbgBUXuMZkRMoa++M616VkOgjTqfRkOiNxcMEoX7dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hWjWhrWjCzkhKoML8gD9VrPAfDfgjSElLM4qinqYoU=;
 b=Io5BPOlQQkFC4Od3CEUNA6gK3nEUyYDIvmsLYnmwzhL7ecwuSDcbDsNIZAdTta+v3ikZRDStqlbrQpiDmcF3MV2Q8gngdvja4crvmN0KuWvzkMHevAqfD7Axx1d0r9gUG0lJDzKrbF072y2hloIUrNP7uFPD8hjlM1PRKbm3A5WXlfiF21He/1jiD1q5nIi7uWeyqyrSXeKOjkysgQjel565H8t7qtWxNk+Bch9IMba+gNOPp41WG2mRYr2vh4TYbCFH0aKFlHlCdYq0Kgzlv87FDIHK/D2XbA+DgxfMS+Hx7TWhKBHe36eNt9mKbwgcF9UmfyfwPSoIpeDMGrS/mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7844.apcprd03.prod.outlook.com (2603:1096:101:171::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 08:37:27 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 08:37:26 +0000
Message-ID: <106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com>
Date: Tue, 15 Oct 2024 16:37:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-2-3e74a65c285e@amlogic.com>
 <aju3dgugbmj52i74j7csyuwejczsvk4sxtsdzuq62jutq7jxbe@wbc7fveloxv2>
 <1c054eb4-9ac1-4965-8847-d851b9fb1131@amlogic.com>
 <9c7f0c20-aafe-45b2-aa3e-c2c21e3a5b71@kernel.org>
 <6ef6bd97-571e-4243-951f-c6704cdb2b57@amlogic.com>
 <823f7e19-4815-44f7-aa7c-818c29892bfa@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <823f7e19-4815-44f7-aa7c-818c29892bfa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0102.apcprd02.prod.outlook.com
 (2603:1096:4:92::18) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6e099a-2db6-4bd3-958e-08dcecf498f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?enJ2eWlUMVE3RW9ja1R5T09oQ3NSd1d2c2xyZ25aaDd3VHg4U2JJNDUzRWta?=
 =?utf-8?B?Rk5FMSt0NTdFZjhLWmFNZTZsY0hGV3EzRVpaMDkrMVdUWXROcFFzZFZZWTE1?=
 =?utf-8?B?SGJ3Wk0zWENxNk11c0pvSTZna0UyRHQxUEhITFk1VFg3VXowcDAvUnBQbGoy?=
 =?utf-8?B?dWhMb1IrOTFHQmp6cWlDV29Zem5QOVNRakVuQW9Vc3NzcHZRZFNIOVBJRENm?=
 =?utf-8?B?RTFPeTZ5RnVRcjQ4VFo0WW9xeWpIazhleU1hSWh3OU9UZ25ZOFpHWWxKRjBT?=
 =?utf-8?B?UkF5UUdzcHFsRlBoNExCSG1kalI5MlJBamJJbkZoS0g5TC92blAxK0dNSEZl?=
 =?utf-8?B?Q0tyNFNMd3BlWWRYN3E0T0I5YXV1SXo3UWFpb2RxSjVZWlNZcDArRUJXVXZ0?=
 =?utf-8?B?ODdOOVNrVWYrZ21vOFdhcDFxYzA5ZHltOHBBdElVQXdKR2FsSW9KQWlybzdC?=
 =?utf-8?B?Z0o3WEQxZWc1SFJZZWV2MjQvZWI5UFhTRyt4KzBSdGtPeVBlcTB0a0MzYWJt?=
 =?utf-8?B?Smk1NEhlYjRCdzNlUHlSZVM0SExldVpEUEFUZGJNb2FQZXk1OXN1MTlNWFBX?=
 =?utf-8?B?UGtSVjc5c1ZlUVpuTUVqUFl6dGJZTzJZOFcyQ2F4VFBBWCtMY1g5bzJLc2lr?=
 =?utf-8?B?NENEajVTYkFIaFdYRG56U3UvVkFjTXdSMXEvUjB0RndqbXVtRWhHNkR1OUpj?=
 =?utf-8?B?V1RsT3BWYUgxSmxaODNZSWVJaSsrdUNNcXZabVMxWis5d3hsMFUyMzhCcC9X?=
 =?utf-8?B?OVM3aldRd21yYk8vK3AyZGYvL21PQS9vSmU3UWJpYk5wYUdrR21MQzNXa012?=
 =?utf-8?B?WGNPemFIYmgzMndVU1kzTlI2NEUxU053Qm5RbDV1dVBabmJjaG1ldExuMnV1?=
 =?utf-8?B?VkNIQXNrRy9uYXFwU2RrK0xIN3N0YkFYaFR5N0lUclRERmpnb0JPRU8rVnhJ?=
 =?utf-8?B?UFF0Sjhia3hUNWhMTUd0YmlqLzREUmh4N2Z4NTFXODhxenZMd1hZTEJMN0J5?=
 =?utf-8?B?V2RLaXRvWUdGRXZJYVEvYXp5a0x2UHJlaTNMUzF2eU5oYjVNTStwM0hoTHhN?=
 =?utf-8?B?WDlMbCtZazE2dGtOeEovL1ZCOUJEVys5UVFvNHlGdkZ0aTBMcDVqYXlJWm5u?=
 =?utf-8?B?d0RHSHg4RUVMSzRIeEQyRGF0aFRPUEthOEU1elFwZzd2M3ZPTTFURk9iZ3M5?=
 =?utf-8?B?TUJ5NkdKZW1wMWtWRk5jcUJlM0JaZVlUbjZrbmpxck9DNXVDZ3M2Mno5aEdD?=
 =?utf-8?B?S1NXd2NSQStTanJNSnFVZ3dNZVN1Z3FrcWpxNXA3ZW9HYi9rRVd4ZEFxeFRn?=
 =?utf-8?B?SVFONnBmZXN3Q1hnb1Naeks3VmJlSFI3RmxyZlFpeW00NFpMRmEyRzZWcktz?=
 =?utf-8?B?QlQ1SHhhWnE5M2IyQnNIdGZHQ0xOd0ZWZUFUdUxWMmN6VExNT3gvdE5oVnVx?=
 =?utf-8?B?cFdVY1JZY1ZaUU85cVNocFZJMlRqcTBQOE1pTnhtR0U5VGU5MjJYNWpFUnZU?=
 =?utf-8?B?QWhXSWxydjJQNVh5bUV0RmpzVXUrNVNKTFdSbTlGNGROclY3WG55WmM4L0VY?=
 =?utf-8?B?aXpEOWRRYlY4L1N0QUhWU1JER2J3ekludW5OaFlsejd1VWxXYWZzQW1QK3Va?=
 =?utf-8?B?V0R2MGxVMzBKQms4TmFCTEw4UERjeXJYV3JIdm9BRDB0NU8xMWVvd0xsdTNF?=
 =?utf-8?B?RGs2bzdxVjFxWVVDaDF6WDhRUHlVeHkvUUFXS1pFZHlMUkJsS3NwYTlRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUc1b08wNGVoWERrc25rQkRxQVlXR2o0L1Yxa3gxYlRyMlNHaWRNdXVySFlU?=
 =?utf-8?B?aTRtQWZQUnpWeGw4aUg1Q2tjcndsV2s2S1NETTI4MFhlMWVHdy9jNWJMN0Nk?=
 =?utf-8?B?ekxyL2xJanFDUVNwVlRTeEZyRm5YM3FPSzFuYW4wYkhyOWlRRTNCTzlvT2N3?=
 =?utf-8?B?NzlOVEwwdE5UVDBTMWpYQ0hqa1A2Z2hCK1luYTNER3g5a1dkTk9yemZ3Tlh4?=
 =?utf-8?B?N3NtNlZUM0hVSFgrQ0xtMnJUdytzbTBWaG10UzFuREZJZHc2dDVORG9OMVUx?=
 =?utf-8?B?MFRrSHRPZXcrZEtGRUZsWXVGckdVeGVRWkF2MW9oSjZGYVYxWjJDRDA4dlBU?=
 =?utf-8?B?UGVVVSs5dWNVaW5tL1k1NkpVc1ZXbmtpcHYzaVV1aTBxOUFaaGc2NFJtU00r?=
 =?utf-8?B?SWdlVWZGMmlZV0dSbjZXSXJYMDhBY09qMFhuWnhGb2NCV0MvWU4xNWorb0Yw?=
 =?utf-8?B?UE9OdHpxSWo0Vk9sUUQxUTdCQWk5QUNkVnRWWEh3UTBNcnViR1pIL2trdWhq?=
 =?utf-8?B?L2QreG5YUjNoMmlJa3ozZ3N3WlU1eVRLbStxbGVMaXQyeDJiYUJleEF3NlBt?=
 =?utf-8?B?QXZwLzNHbDJrVnhwYjhIUDBwbHBUSjkvOFpwaHV3bkEySFAwSVlrd0VINnUy?=
 =?utf-8?B?N0U5eDRISVcyOFUzWTE1Z2x5ZERTeFVKYnoxTzF5UnM5UUFXYS9tTkQ1OXVR?=
 =?utf-8?B?L1IvK3JzY29aVEFZMHFjN2xIeWN0b0tZaVUzNUdxSjlWajAzdDRyamV1bHAy?=
 =?utf-8?B?YWRxdTIwckkzNXpHTW9vUU5zcW5TTGs3clZqMkYySUNjbzZsMEZNNHBBVEJQ?=
 =?utf-8?B?cytCS1Q3Q1lVcUFDZjl2K1BVWkFIQXNWZ3A3c0ZFV2ZEbG5tOXA2L09FeGp4?=
 =?utf-8?B?a01OL3N0My9RNVJwaFFKYW9SRWFNQ0FWZ1Ryazg3WWNORHpDM1pnVXp2QUg0?=
 =?utf-8?B?MENDTDN0bEt6SmdNd215QUpGa05jVkhhdEVZZytxbUU0bXJ3bS85Y3ZKd0ZU?=
 =?utf-8?B?ODloeEN3ZHFKUlJWVlY2MHFMNVZUczdFZjJFNDVtM3MwWGhTNExyWXZKTXVH?=
 =?utf-8?B?N3FFK3RDcnhpcEUybW5MOFlpTE03dm5oaDRub0tqWVlwdVVTV0VVcEllMXNp?=
 =?utf-8?B?NnlDeTllaTdsM2RUTUpDaFZiOUptaXZRQU5yTXYxWEtDUExRdTFsN3ArU3hV?=
 =?utf-8?B?aGhEQ0Y3b3BLWmxwUmhJRk53cVB1UFYveWlwdXhUN2lnbXRtT285MUZYZnRN?=
 =?utf-8?B?UUJoUXhuYVdhRnRJbE5MbXFDV0x2SlhWM0J1blBLYnFXQWMvdWF6dzZDVjZ3?=
 =?utf-8?B?bzJiRXh6MytyL3J5OWtTWmovT1RHdjcwZ3VMQUxaZEV3enVaYjZ0bVRvMkdM?=
 =?utf-8?B?N3ltSVhsNTVMU09YcEwvZVJqQkg5QXE4cGhQR1FpbjN6U3N3Z0VGUHVUdTc5?=
 =?utf-8?B?cC9DZHBRRk5LMitTVnJwc1N6Y0crMnEyS2VLeXcwWjlSdTBhYm1COERjTmlG?=
 =?utf-8?B?Q1BFYVpZbnhOQi9TMG5CVEFKNjhSbGlQNzA5VllJcXBqWUlCUVMrZGc3Q3Uv?=
 =?utf-8?B?bWwzMnUxc3ltSjAxYzBSS1huMzRZY3hNS0JQSkJNQ1BUUEJ1b0xYb0tzSStq?=
 =?utf-8?B?bDVETmRBN2RMZlY0dlRoOTNFZEpHYkg3UEJHeWpVT2JYaFo4SEV4UUZzckZt?=
 =?utf-8?B?TTRUQmlSbDRkUEhHQUdFTE9OaG42VFZtNUVMOUZhai94YWxKUktqOU81VGpP?=
 =?utf-8?B?dzZIQ1l2aGJsVEFXaG5QSWZwSG1OUERZOFNaQy9VUktudURFNlBRaWsxTG1K?=
 =?utf-8?B?K3dyemcwUzN2YmVJcGwvcEwyNWxxTGx6NjRRbUtDWXJFdkVSV2cyS2JwVHgz?=
 =?utf-8?B?R3hyeFZVZXBaMmJpaHl2Wm5MT0oxN0FMWkJUbGJrenB6UjBCM2ZpcmNiSTRQ?=
 =?utf-8?B?c0RPbk5oWFYzYjVWRElQajc1aU9ZRjY3SmpPQWZXUUNZN3o2QXh4bE5YQnUw?=
 =?utf-8?B?SDREYnZjZG1PWEtrQTdmVGtrK1p1TGVkbzBQWHMvQUZucE52MHRzOHZTMUZl?=
 =?utf-8?B?VG8waXo5NFZENTA5TUd3TXBVTjBmTE9rbEFPby9YdFBJWU5hMHFxSTB1UTIy?=
 =?utf-8?B?eDg2UGNpUUVGRnNZQlJGZ1FGVHpJK3BlblNBVko5VExUY2ovc1lmMHZyMENv?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6e099a-2db6-4bd3-958e-08dcecf498f1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 08:37:26.3617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bF7S8m0ZSNGIxME8iu2UoaAd7n4fNzv3mv0b6LTq0H+oHz15xXBvd7SuNYkwo9koOlI5Ecdzu+oCoMWeEjw5XwChBH9fG15RAAiOzZarfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7844

Hi Krzysztof,
    Thanks for your reply.

On 2024/10/15 16:11, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 15/10/2024 10:08, Xianwei Zhao wrote:
>> Hi Krzysztof,
>>       Thanks for your quick reply.
>>
>> On 2024/10/15 15:59, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 15/10/2024 09:54, Xianwei Zhao wrote:
>>>> Hi Krzysztof,
>>>>        Thanks for your reply.
>>>>
>>>> On 2024/10/15 14:01, Krzysztof Kozlowski wrote:
>>>>> [ EXTERNAL EMAIL ]
>>>>>
>>>>> On Mon, Oct 14, 2024 at 05:05:52PM +0800, Xianwei Zhao wrote:
>>>>>> Add a new pinctrl driver for Amlogic A4 SoCs which share
>>>>>> the same register layout as the previous Amlogic S4.
>>>>>>
>>>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>> ---
>>>>>>     drivers/pinctrl/meson/Kconfig              |    6 +
>>>>>>     drivers/pinctrl/meson/Makefile             |    1 +
>>>>>>     drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1176 ++++++++++++++++++++++++++++
>>>>>>     3 files changed, 1183 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
>>>>>> index cc397896762c..3e90bb5ec442 100644
>>>>>> --- a/drivers/pinctrl/meson/Kconfig
>>>>>> +++ b/drivers/pinctrl/meson/Kconfig
>>>>>> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>>>>>>          select PINCTRL_MESON_AXG_PMX
>>>>>>          default y
>>>>>>
>>>>>> +config PINCTRL_AMLOGIC_A4
>>>>>> +     tristate "Amlogic A4 SoC pinctrl driver"
>>>>>> +     depends on ARM64
>>>>>> +     select PINCTRL_MESON_AXG_PMX
>>>>>> +     default y
>>>>>> +
>>>>>>     config PINCTRL_AMLOGIC_C3
>>>>>>          tristate "Amlogic C3 SoC pinctrl driver"
>>>>>>          depends on ARM64
>>>>>> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
>>>>>> index 9e538b9ffb9b..c92a65a83344 100644
>>>>>> --- a/drivers/pinctrl/meson/Makefile
>>>>>> +++ b/drivers/pinctrl/meson/Makefile
>>>>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>>>>>>     obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>>>>>>     obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>>>>>>     obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
>>>>>> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>>>>>>     obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>>>>>>     obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
>>>>>> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>>>>> new file mode 100644
>>>>>> index 000000000000..dee1ae43edb5
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>>>>> @@ -0,0 +1,1176 @@
>>>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>>>>> +/*
>>>>>> + * Pin controller and GPIO driver for Amlogic A4 SoC.
>>>>>> + *
>>>>>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>>>>>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>> + *         Huqiang Qin <huqiang.qin@amlogic.com>
>>>>>> + */
>>>>>> +
>>>>>> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>
>>>>>
>>>>> I do not see any usage of it.
>>>>>
>>>>
>>>> The header file "amlogic-a4-gpio.h"  is used by AMLOGIC_PIN and
>>>> GPIO_GROUP_V2, The code used  is  AMLOGIC_GPIO().
>>>> This is binding definition.
>>>
>>> Then all other defines are not used. AMLOGIC_GPIO is not used by DTS, so
>>> how is that a binding? Don't stuff random defines into the bindings.
>>>
>>
>> The AMlOGIC_GPIO definition depends on other definitions to be used.
>> It is not currently used by DTS, but will be used by other modules in
>> the future.
> 
> You keep disagreeing, addressing only some parts and ignoring the rest.
> Explain me what do you bind here that you call it a "binding"?
> 

I will drop it from "binding".

> Best regards,
> Krzysztof
> 

