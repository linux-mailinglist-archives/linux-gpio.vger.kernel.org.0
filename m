Return-Path: <linux-gpio+bounces-9171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF595F376
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 16:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7607E1F22E1C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 14:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7DA154456;
	Mon, 26 Aug 2024 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ii/OZwDl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC9CFC08;
	Mon, 26 Aug 2024 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724681015; cv=fail; b=OvtbNAd8sf0OvKG3RF9wDXet6OiKydOYpXzAZaX4/vdBsnEZK5Jk/qNn29lcklRjihV++l+r4DagoAQdKmOQMxixbBnTq84BkJLE6v415ec8SS34HNYoHJSkgTNIYILriuMfwQL4Yud5O6Jk4HUiovhPg+gptxrG0F4tPuUIAYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724681015; c=relaxed/simple;
	bh=jvR7tXYhmx4GPD7fCVPTbgYd6ZMSXCe7t79JIaWoWc4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pQXsTMPumwSvKWKZVXTitNxtVrWK/7hbx1w/0lj4J4e0payCEq1T95XBm+mue+yW63ed0jjT4A5qliPhbXCgYXj+8fvogT2i6R1iofTqz65BKgjcukJdoRvcchXl3k3VRlDwVcdwSvSXw+g7tqgCAn+URNW0kSXXABHT0k4OZCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ii/OZwDl; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3c0WLkgAYiBEpOAOYplzkdSawSZD0DmHBax4ZeQR5aSW6Wqh7KWdQSNG/Yzhg77Sj5KFuOrnbmezfUDmPUAu3BGgaqkkrWWKUqIsAv7eQykSKyNVdizQGHEo5xoKFGJMp0K3XYTrmmZd0Jg9x9qEGF+FLrlv/MngOAA+SNzJZJSJ0H+QifGh7w0yF+Ksi1l8AKvGbWbAycVi5+RVuglFPJ0qEdCkDKgcSZmGYG6PLtIM0S2Kvn8am3Hrp437lmYkp/5rphnvu2uS7H0erLkXP6H6CnZfE8K/qm2Tr9rFJqLFeuVHo8faFuaYNzrsqri4Pom9z6xXih4yZXLk5y7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z57tdaY2usLr0gn5jSx4L3jtla4ZNH5YjqfsiwulGL4=;
 b=u30yjkIj/jv/rgs+JZrN5Zx9xgkP1prLLtLoA8YoyOemV+4LO31e5xXXHXZBm/oLsWOcTxW+old6YXDoAIA988vWeNXEarlHjreilW8JwBBVk46ETafNNRZ7FkyyVvW9MH43Lx/fCdUhPrw/mBDwrT+P+GgO+N5RPwqk7ODUc+m6OTClhO7etbMd8SN1PtpV7HHOB76UDC+wPsQWbckvOV/qtYtHejeyoLjILh/X4+aP9MolBWA6wOwUcoyFju+j2RNF7h3p2WEGrZgR7P6P8HsGMITGeehbmLeRinTds3BkIFk18xUgaNTqjTYDRFN213brdC+8UFl6d882EhvXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z57tdaY2usLr0gn5jSx4L3jtla4ZNH5YjqfsiwulGL4=;
 b=Ii/OZwDlY9Tq+aicMQxdwWCdXxnXLlm7cv3hDAnSQOLbTiM9JEHR1aKrMHjxMCaF87Luaei4hzp5BEjThiw8gUGSVDWibUnddq583erPfQ/U4SKipiIpEllS3bGEyyUwS73NxlVceimmFZhG6kKYHUy+tBg1JIPWdhQt0E9tmO40de9CSHi61T+2QkriLXm6rFN5D83gt1MzdUVFixE5LjkX9x/z9yZg9Te4k5wCnmHvuMNMO6IN1Jfj11KswcCZ8CC6UQ64wlq0qa0cdjSAo1L7OOY/rafaLMQBDQRhbSpP4OgSqia4+opWwECya9c3FMUeyaDjhmkUiBTpK4/nKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DB8PR04MB7115.eurprd04.prod.outlook.com (2603:10a6:10:128::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 14:03:29 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 14:03:29 +0000
Message-ID: <974b2f66-e855-4322-99ba-23cecd45c2c5@oss.nxp.com>
Date: Mon, 26 Aug 2024 17:03:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drivers: gpio: siul2-s32g2: add NXP S32G2/S32G3 SoCs
 support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 NXP S32 Linux Team <s32@nxp.com>
References: <20240826084214.2368673-1-andrei.stefanescu@oss.nxp.com>
 <20240826084214.2368673-3-andrei.stefanescu@oss.nxp.com>
 <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
Content-Language: en-US
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
In-Reply-To: <fd18295c-6544-4da6-aab0-6d6b9c12581a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:208:122::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DB8PR04MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d15cdd-1cd6-4281-0b06-08dcc5d7dce4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXZ4NHhFZXFGSXdFdzhkOXZKb0xXN0lwbDAvYzJDOC94OTFnT1VZbDhDTHdO?=
 =?utf-8?B?RDIzQ2Jkd0IyeXY4Nk5HWVJkRXc3NERoMU41b2dYRFpUZzlMWHhKdXduR1Jx?=
 =?utf-8?B?WXhrWThId0pFYVE3bm12QlNrVkZyVXhvN1ZzVWQzbHJQSDlramFnTWx6TE1u?=
 =?utf-8?B?T2JpcmF5WWUzdU1FZ3NWWWhraVZwVEZsa1VYa3JsS3pwWllCcnpCYUpIcW9u?=
 =?utf-8?B?d3VQR1JBKzhjemc4dUdrNGpOQ1dteXJZN0xUOThhV21KSStTWXZqSyt1a2xQ?=
 =?utf-8?B?VDczV3dLSEttUnQ5MkwySWtPVUt6QWFjMFV1MkVtc1lXWkxlMitMWVJSMWlu?=
 =?utf-8?B?ZGQzTTNsNGxwbFl0VktCbzU5cVVyT01CL0RsRHdhYTdaOFVxcDdoMFFiMHlz?=
 =?utf-8?B?dmRaaHg4am9VNDZXRGdoamVzMDRoTHhWM1pEYlRJT0p2cHc0akdDQ1ZCT2pV?=
 =?utf-8?B?VGEzRjlLNC9qdmpoMGhFYUQwT0ZwS0MzVXpGZ2hJQXZGcWYrTjlmc3pNZjVR?=
 =?utf-8?B?bjFsRjQveVk2QkN4WC9uWjFXNGtOSkMwRFROY05wbkFUQVk4Y0JPK0RLdzBi?=
 =?utf-8?B?ZFZxUGl3YjVLblBmS2UzY3NFRFBzZEdmelJkckNpM1JXT0dsZzVXUmo3UnpS?=
 =?utf-8?B?aEp2WUJzcG1Zd204T2Q0UVpGajdoaC85UUZOVzRUMWxDK09FSi9BSjNML3dY?=
 =?utf-8?B?UnlaV3JYMXhGR1g1bTc2OHY5cFZEamFJMXk5OFkxMTRwc3k5SFlqd0cvLzhp?=
 =?utf-8?B?L0RVTzJuZWdVZFlpcmFwZjdFVDNkaUFncC84QlBHTldIbDBiRFdVWmppR2NO?=
 =?utf-8?B?V1padzl0UUV0VFh6T2NoTUhxQ0JBNnFRVE1oVFpvdC81ZUsxSXlUdThJcUJE?=
 =?utf-8?B?Y0dTOFpkQ1hRdTQrMDk5anVmZzVSaGY0d0tWVDJETnBRaTZQalFEMEJBeVVm?=
 =?utf-8?B?dUt3TVdoK05IZ2MxQkIveEMvNi91QUpxSFl0RW02a29RQTVTTkdPQ3d0bXZM?=
 =?utf-8?B?RkpHdlNKWTgva2wvUnM5NFo0aVkzanFQZDBudjI1aEtLcCtpUFFqVE9iNERn?=
 =?utf-8?B?TDdIMVkyWUVuVlozSjhpUkhZOUwzVEo0dklRS1ZqY3VUY3YrVDlLNGhvMWYw?=
 =?utf-8?B?aFJwQ3JzMm5PQ1BvZ0RHQkFZUmY1bGFGM2RBUlVlNC81L0xXYXE1eGtjSTJO?=
 =?utf-8?B?V2NsYnVzcUYweUplaUp4N29OMk15WndaUktYUk9sOUxWdEpLaGg3bHVVcGYw?=
 =?utf-8?B?YjJtWWN4ckdBd1k2SGRlZi9DRU94SmtCS01sdW9ISkpjQjZQM2VPNGthNkZt?=
 =?utf-8?B?bnZoSlR4b1RoR0plM1djNHErY1BmdnBCYkpnaUhSU2R0VDRLRUtNZGYwSlJ2?=
 =?utf-8?B?VHZvNU5WVkdBY2Q4OG5KL3FRZXhvVU9lcENwV0RkQklGMXpMNXlrOVgrMmxB?=
 =?utf-8?B?RFBjWXZHdURDOWFKdGpqM1FkYnRPWXVvc3VLcXVnNHVnUzBvRHlOaFZTc3Yx?=
 =?utf-8?B?OUhqaFdkdnBoMG5PTTJYemZwVFk2YXFpem81VzlOVEVPZ0RWQTREQ2xrQXBH?=
 =?utf-8?B?bTd0L1J5TldyZmZQLzVNT3ZsaERQWlhQYVladCt1dXAyeWh3bGNwMWllc3lB?=
 =?utf-8?B?QTZGdENhUHhCUkVER3NKM3d0aEhFbEtkVzlxdUMrMVVNanZqWDJjcmVmNEZp?=
 =?utf-8?B?YVBTOGFWNmY2ekFNK09LZ3Zib1Fza3VvSUNWdlNMckdDN1pXdFlYS1pVbVpF?=
 =?utf-8?B?ZG16dEwranRkcUNXQVZsa3JJNEMwRUJEZW05UzZ5aUNuSTZueG1LUjJwT0FF?=
 =?utf-8?B?T25OVGtjRWd5YTQ4U3JkTklSVGtVY3FJbTZZY1R2YVlwQ05ON0xhQTFyamhp?=
 =?utf-8?Q?/OTZNyw9dn7Wo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktRbWpja3U4UkpnWkR0ME80aUQrR1NxT1dMemtPbmpHT2dYN0ROZzMyUWVJ?=
 =?utf-8?B?eXJDeWs4U3dyZDhYY0NqTHBrM0VPdnhaN3pveFp0bnZoOHpJQXZpc0VpWG8x?=
 =?utf-8?B?VDNDT3VYaEZ2VW5Nc0ttaC9abFZZM3Eyam4rdnpodGI4YUdaSFJsb2tPYlUy?=
 =?utf-8?B?cENmSmx6RnNha2pHYTNwT05waHdKVlpnTDZjNXg4aUdoWmFObWhpR1h3SXc1?=
 =?utf-8?B?Z2JaeDNOSHFRKzhEVnZ6VmFwbzFlZUc1VlQycXVLRDVBOHFVdUdxV1JNRmNU?=
 =?utf-8?B?UUxNL0hVTTd1NDNMRUthY21pNytWYXVMcXhqeTBaRGZvOGp0UkxobkZYYVRu?=
 =?utf-8?B?RFZFV2x5UVFtaGxOc3dkcVBnb2grUngrNTRiWExlQ0VrV1o4UzUwZXpmQkll?=
 =?utf-8?B?YWNDajMxb2pxNTJ1cG5zcEtDeStDTnB5N2VmYXZDcGQzaVNnR2J2enhsYSt5?=
 =?utf-8?B?UnFpOVpIZXZhKzlOK3c4L1NISmJPR2VUSW5KVGhNQmhLbnozRzc5eERYYjJG?=
 =?utf-8?B?enhPMzdqZ3VRN3VqY0lMWUxHcHZienlsRXhFbUQ4NXZhSE13SHpON0RKOFJw?=
 =?utf-8?B?QzN5NlU5Z1lKbFIwS3pLRmJIaDNjR2crdEpNVXF0WWllM3lWTzlyOC9VKzJl?=
 =?utf-8?B?STVja3luWk9aNUFwbUVQR05tTk82Rkw0TThrRWgwc2d6RzRybndDZEQxWTZi?=
 =?utf-8?B?YlJLQWVScTJyNG1BUHNKUFpUbUJQSUw4ZGNqM2tSY1JscFF1bFY4VFhCT2hN?=
 =?utf-8?B?N0VUcHlUMkVienIxMWRFYWxoSzJUcU1rNmJjUlRkVSt0M0s2RHN6SmlVdDFy?=
 =?utf-8?B?bEl6eHBIcjdGOEpTcldCWGd6b3lUbGVCK0pSd0tMemoyTUJNQ2hJVUZtbHJz?=
 =?utf-8?B?cXJkM3U3NkJUSkNOWkZBMWRxWnpjKzByd09FTS9QQTZ3N0hEU2xtWDNYMU1t?=
 =?utf-8?B?N2l3QVFldmlFa2R2ZWp1Y2lKd0RPYk96Yk55RkYzNTBYWktTT29FTjBFSFJU?=
 =?utf-8?B?MlY5UDJydlpCa2k5YmJXSTN1MWtBd3ZveEFvdTlFem02eDYxeUNJT3ZjRmxo?=
 =?utf-8?B?WnJwKzRsL1FPTzhOUDlTbGFNNkpMSWpMWVhlYVVUV0V2ZGVEdDRBUzJLR1Rr?=
 =?utf-8?B?ODdOYzJwMDZrZlFBZWpDWGs5ODltNzAra2RYcHhwUGZ1V1dJSkNsTnRndHZV?=
 =?utf-8?B?NkxlQ3dWaktPVUdoUjE1M0FGaGR5L0FxYTlNUlk1Y0RXaTM2aElWTVNYZFZM?=
 =?utf-8?B?SmYvdFltWjV0OHM4eVhYK2lNK0J1RDlHTEZ5WEh5cHIwZ1FXa2ZKeFNvTFZ4?=
 =?utf-8?B?cFViZG1QN2o3MUFoWlBlbEUxUzBMMktoZExHOWt6UzBnMkVUOGJaY2tCOWF5?=
 =?utf-8?B?TExGZ0dBVkx3U0grS3lTaWRKRTY4Nk9FbXExSXZnQjhWQVJ6aGp1UE81a0xF?=
 =?utf-8?B?Sm1nditaV3YzUkxZVVFvOFBncUEyU3l1K3UrVWRlalBKNXAwbkdqV29peC9W?=
 =?utf-8?B?Uko4cGpPL0ZFL3pPZTBCU2ozOFQ1OTZSR3dJOUlnV1NGSkYxc3E1am9HcnZ3?=
 =?utf-8?B?cWtTV0w3UlVoVDQveFp4WGJpdk1IWGtQMytERHRjSi9oalZsRDdJTmNGbnQ3?=
 =?utf-8?B?bjRTYStvdGo5OXAvL1FLcVE5T2w5L1ltM05vUHRRTlY3SWJ4dHpuc21VelRQ?=
 =?utf-8?B?M2VNSTZNR1RvOGt4bG9Ob2ZzMHhIZU9XL29DV3JrTU5WaFBLMmdJQjBoczhP?=
 =?utf-8?B?Vk1Pai94cUVZTEYyaytySGIyRHdoTVV5UmtUZVU1dkFlUVRBWTlwMlUxV3Iz?=
 =?utf-8?B?RFpKTG16dGUvZGZ4UjI5c3M1L3J5NXJkai81K2FwY2JUMi9tZ1M3bEU3TUdK?=
 =?utf-8?B?anVKdG1qVzZIYjB3ZGd6elUraHZJSFd2MTNuQXFNOHBoWnNXRzRZb1huYzg3?=
 =?utf-8?B?Z2VXOVU4d3VEMWFqbWI3d2lZRHRkcUNJQysycTVYT1JnYWwwNFc1NFAwQmxU?=
 =?utf-8?B?bjVYaHJwK0dkZWdrRS9ocGlBKzM5Qmd4QS9sM0ozakh2dmhyRlJTK25ubmp3?=
 =?utf-8?B?U2ZlNVRGNXpYcDFzUWFMR2JnZlpuVXc3ME5PSURVS3R1LzdMN01ERlc1cXRK?=
 =?utf-8?B?WGdpOFVSQ0ZyaVNZbUM2enNRZnJuRXNhSzR4bUpoaUxHa3N4dDhmaCsreUZF?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d15cdd-1cd6-4281-0b06-08dcc5d7dce4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 14:03:29.7149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXnURFrlY9ykwOyuFGdEi0ZlSL3J8Qo3VRC/DgeeraR0ua8uCqykCx65RXTZG+NPIFwJHJmNPFJqPaDFDTc9Xn8MfyXjgywKQ8NClXHSAUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7115

Hi Krzysztof,

On 26/08/2024 12:10, Krzysztof Kozlowski wrote:
> On 26/08/2024 10:42, Andrei Stefanescu wrote:

Thank you for the quick review!

>> +	raw_spin_lock_init(&gpio_dev->lock);
> 
> Why do you use raw spin? Are you sure you need it (some people just
> replace it thinking this will help them in PREEMPT_RT without actually
> thinking if it is needed). IOW, do you have here irqchip anywhere?

I don't have an irqchip in this current patch series. There are, however,
other patches which add support for interrupts and implementations for
power management callbacks. I thought it would be easier for review if I
sent those after the current series gets merged.

>> +
>> +static const struct of_device_id siul2_gpio_dt_ids[] = {
>> +	{ .compatible = "nxp,s32g2-siul2-gpio", .data = &s32g2_device_data },
> 
> Why do you have match data? There are no other variants.


We do have another match data in our downstream version. Could I keep it
here or should I remove it?


I will fix the other comments in v2.

Best regards,
Andrei


