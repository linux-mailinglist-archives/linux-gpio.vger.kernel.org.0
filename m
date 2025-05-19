Return-Path: <linux-gpio+bounces-20302-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C83EAABC7EF
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 21:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD33C1B62D6D
	for <lists+linux-gpio@lfdr.de>; Mon, 19 May 2025 19:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D3B2116F4;
	Mon, 19 May 2025 19:40:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from WA0P291CU002.outbound.protection.outlook.com (mail-polandcentralazon11023135.outbound.protection.outlook.com [40.107.156.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EB01991CD;
	Mon, 19 May 2025 19:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.156.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683613; cv=fail; b=IJsJUdcGaAnbdq8TRTkAmLoImjQTP0NeEd+wWcbPWmWMojC2P1ql3QaaZzd8hylXHnxH6SOvoEXb7DZ/fYuIop3y0E8dVoPrLbwSrWbq8LAhqAyds9ig80tkSV8Zrl3FmtQ/qJbRTFEPAJ9+wkbWZ6ihIFCK9c+mr+eP5TSj1xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683613; c=relaxed/simple;
	bh=sagWI2AaWMnBYCI8xzjyx0uYQIHKQEJVXsxc7SezSrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WwNhpf646g7D0V/JW7xdjrGLNbKQunExK1zzk6D1oeitx9u1XVp7niC5iucfdNkmGhfvTHsSnE80oFQVGRmgk0UfIOkyNvlfD+hFPb/RvIETfl5opbVlq5DA6+/kPrMHpeZn+HytVHhuUXiLDLrOSk3PkJk9K8buGtcAbuyJgX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com; spf=pass smtp.mailfrom=videtronic.com; arc=fail smtp.client-ip=40.107.156.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=videtronic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=videtronic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqU/P0NZwbA3gTcM4FWBGithJEfwiM3wMUKNQAxvQ+USCBfLHSYzHDD8YYV++x3IBpK7p9P8tDy6xPJt2gQMwpsRWCulWxV7RV8/BjV1KSrnGt66eW1ml9ecuJNV4CB2t8nSz4q+Iuwd2+qy+2iUeJ5tpGkXUu6EmnKsxrDyp9iDIWROiPvg6E8QGYu34MnigjWsN0NXh7lD+QH9H3EPRT8vGaNhf1q5/IadVISKGgoE2AXsEtAianP/hUHRSBXXdEd4ci0a8BpCai89MFESxS2MXq/Ei8H1MQOtCwrwfaylteuPUZSTqnXS6KgIOLTuwRfEBc0kJzKt2rdz0J/2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFPvibD8cTdBSw3pHU6ciqJqoQV74fTu5NT3eTvhzeo=;
 b=VnzUFrLxAtWacu/IszdIYsUvyxZbw+CVonalUPydzUJNYIYWvU/JtQDrh9akFY7/Rf9ljPrOTlOLpypyvCU7LX3lAv3DkuhJsR4Us3QWNJ3AAgOeqT1DysFFlx7dcRh363tXlrnenruIwnRuW2UPdsjFy9vYSAMa8Dpy38RcM81zNMOQsTu85QnPVHye9n10hF4XtKIPHCNNQvlfViSAHffFmMJ7x2VCmvSZ2YL5brtKynS6faeG3CyKR7Z4qar3/FVdAX9NW8ztmpxWEm8TtvE/yvER1SfRL3zHGhAC3e0ncUrgB/IT0Yywki3ifJWQBlzPfHrTwK+5nvZnT/0bdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=videtronic.com; dmarc=pass action=none
 header.from=videtronic.com; dkim=pass header.d=videtronic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=videtronic.com;
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:24::14)
 by WA0P291MB0099.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Mon, 19 May 2025 19:40:05 +0000
Received: from WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f]) by WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 ([fe80::5b7e:db51:5934:a36f%3]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 19:40:04 +0000
Message-ID: <16b2528d-d0e5-4683-94fb-77e0fb88785d@videtronic.com>
Date: Mon, 19 May 2025 21:40:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>, Julien Massot
 <julien.massot@collabora.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Taniya Das <quic_tdas@quicinc.com>, Liu Ying <victor.liu@nxp.com>,
 Ross Burton <ross.burton@arm.com>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Eric Biggers <ebiggers@google.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhi Mao <zhi.mao@mediatek.com>, Dongcheng Yan <dongcheng.yan@intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org
References: <20250512212832.3674722-1-demonsingur@gmail.com>
Content-Language: en-US
From: Jakub Kostiw <jakub.kostiw@videtronic.com>
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::19) To WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:24::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA2P291MB0309:EE_|WA0P291MB0099:EE_
X-MS-Office365-Filtering-Correlation-Id: 02fe57a8-77a7-480d-6c8f-08dd970cf3ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTh4OUJSeWVkWEozWWtESCt0YTZoUHRTN0k0NGRIYzdORjZNSFA2VHpMK3Jv?=
 =?utf-8?B?aEpvb00rT29WdC9QUW5JVlRsaWRQdkwwUjg3bUR5bUhsRFFQaG5iQlg2R1pW?=
 =?utf-8?B?RmlybzB2THBTbTJ3NDMvZVVlL041bDEraE5Hb2Y3M3l4S3AxK002QmZOQUVr?=
 =?utf-8?B?ZHUvTlJadTNiVnJlWU92T2xvWGg1bmNsUHo5d1AvV0UyMmdxNjNqbEVZbEIy?=
 =?utf-8?B?eEdaMjJST0xoS0NtcWdseU5MQ25YNXFHQnN1Tnk3ZGdHeTlzakZESUxuQlk3?=
 =?utf-8?B?QS82UE1YZWxPYUl0UzA3T1ZpRnVra2RFMmtzblBtYVVWblNBWDltd0xRWDJu?=
 =?utf-8?B?SHU2Q0dTdFZmV3NSelpGVGFPVmxKNTZldVh5S1pHS3ZUVVI5K0FOeWhYbU1t?=
 =?utf-8?B?M0lVVWFRVVpONmdtb2prOEkyak4vbXBYTUxjS2xwWXR0RklCY25iVU1HdExm?=
 =?utf-8?B?azRJWHBmMWRRVUpCVWU2ZlQ2OVpTTXBHRXFoUkoxRXZrRHpXVWdxN28rQXRN?=
 =?utf-8?B?akhyT2dieUY5NWJTZXJLOG5paitMd1pRZHpDekpkcXR0cVJDQW5wVWt2Mi8r?=
 =?utf-8?B?d0Nqc3Bjb29Bd0NHTHRoc284N2ZFcVVPMVV3WTJueEVmeVhpTmw0K1g3eGRy?=
 =?utf-8?B?aEVtR1R2NDVLclJaVUFrUFU1cGxEMC9YRm0zQmdCRnBvLzZPZlhrTDljOUNG?=
 =?utf-8?B?cFpyOEdzWVh1WmNPcmtoYkdrQ1ZTMzc3MWU3cWgvVHU3d1A2aU81VXBSY1NE?=
 =?utf-8?B?TEJHenVFTW4xd05jM1JibnVsaFF1U0dNY1FtZktRTmtuVktRQTl5T3BuNGFh?=
 =?utf-8?B?aTY4VEJSMURqd2N0ZU9YeC96WjVRTlI2OFBPdWtQbWpCSlZsYk90elFGeWhu?=
 =?utf-8?B?L0ZHVlFsTG9qcTNDNTdPemkxVDIwTC9mTk5WbHRvMk5ic2hFSDk4WVJEZVRW?=
 =?utf-8?B?ZXluY05EaTNpVGFZeklUY2VKUDkrSHBPUVRPcnE1TmUzeVRqd3Bqb0R1cXpj?=
 =?utf-8?B?cmRKbkRvZlFjMENMZWNCWFdVVFpHVG9ZaFE1QTdOV2FRbGIzN0M5OTdidHBH?=
 =?utf-8?B?YXFQY3gzRWpxUWl2d2tmdTBmamUwOVBxVzk5MUxGV05wWERCNzF4OE1RK0Vr?=
 =?utf-8?B?V2ptTWF6Y3oxb25vbTZCTlhRTisxSWptMVZ6bU5qL0d4Q1N1SldZeEtqY3Bi?=
 =?utf-8?B?TzI3NGwzaUVsN0NHOWZ0SDlyM3Rwbk5zWDdxQXZFbjBZM245aURmd0h1Um9p?=
 =?utf-8?B?VmtRQlp6RjROWng5R0NFU0lVL04vVEl0ckhwbUlUNkR4ZW9hSGVaVXFWbFZE?=
 =?utf-8?B?QlI2bnk5RjlISDJIVU1MWWxzZzJYZlh3aHFueWlBTnZ6Ky9oeXUwSUFET3p3?=
 =?utf-8?B?bzJkL3JpRDRUanJ3R2U1M2l1bGpvUnNSWjRQWnBXcDhaaVViSS9ESmVFUWlM?=
 =?utf-8?B?UEhjajdpQkZTczFwd3VESXV6L1AzMjIwZkRyamdiMFpMVk1ZOE9TaVFoWHJP?=
 =?utf-8?B?M2dkWHZtRzZKajhoTkgxa3RHVW44L2pJd3dVYmNpWXZQRnlYejFDZHVwZjVv?=
 =?utf-8?B?d3lqMHNzM3REaEorZjJEb0twWlRZNTJxTjNYWFpFVTRTc2FILzloODRqNzEz?=
 =?utf-8?B?K2o1cjJiTVQ2KzVJaFR1TVlPZHpNUFFUNXh1SStaZUd2SjZzR2JOUzRpZ3Bh?=
 =?utf-8?B?dnVFV2RHMEh5TzlEamdHQStZODNHMUFlMjFsYkhoRWlqak1QU0RkTURrQ29t?=
 =?utf-8?B?enZnY3lFdXNBTmM4K2tOUEJnUVQyWUpYekJlMTAwRTJpRTlNaUpSQVpFU0Nu?=
 =?utf-8?B?Q1JkUmdyYkMyT0FHTUVXSjl2dGZrcVBNTW9jM3pOZno4eVV2Nm5VSStZOVF5?=
 =?utf-8?B?VHg3VW9OWFZrWk5uMmJzNkN4empCUVlqWk5icHJ6WStabHRmR0dyLzBZOVhm?=
 =?utf-8?Q?KPTOiLbCnYc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:WA2P291MB0309.POLP291.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RklRY0RhcDBQbTFGVHphNEp5OGtUcHFRRjErcTBPdjZmeDBkRWczSnBhRm4v?=
 =?utf-8?B?cXRuZzFFZysxaTg0WUdXOEVRdzEwWTBqZW93Um1zQU8rZUcyQVpFbUlLbTJm?=
 =?utf-8?B?dU9tamNKb0x5SllzRTUrQnpKNWFkVUl0QlVEOHBadU9RaWlEbDNWeXRlaEg2?=
 =?utf-8?B?N25sYTM0QmtNRnFYWlpsSThQL2piL3dMWnYrNHQ2UWV6RWJOTXpXcFd5NGhq?=
 =?utf-8?B?a3hFSU53SkowRDQ4RTRsaGNVWm1YdlZaRDhUdEZ2RVhJYlFPYjJxYk5rWU5E?=
 =?utf-8?B?UzBERVVhS21TczVkRXVLTm5jNXJTdmNqcThvNi96UlVhUldVWTRLMVhqanpN?=
 =?utf-8?B?aWhJeDUzWTIwc1ZtMXZpMmcwQ0VwZGpISTVlOW02ZERGeTdIZXZBckhQZ3BC?=
 =?utf-8?B?MDFWdTc3dzZZZVdZaHJubUQyVGNYcWRtYmU4bTE0T2FNMDJoK3hwOHBST0Vh?=
 =?utf-8?B?Qk5JZG8zQUJNUVVRZzNhMjBqS3RJVmxXamNCeFhzbGdTYW92ZjVTc3VtNzdy?=
 =?utf-8?B?c3NrTWRKdzFPNTVHUnkwaVFYclU1d3JMNWRCOUVRNnhZejR6ak9TdkNKSUFG?=
 =?utf-8?B?VDFEMzI4MHZUVmw2eHB4eHI3bmpSNFpjKzZrZ2V1NGZmZ3hiZHdaMnRTQ0Zu?=
 =?utf-8?B?YWtBMWZBVEZNV2RwK2tKVVI1U0toTytLTWRSTHRBSzNGWkdyTC9mM1Z1bnU3?=
 =?utf-8?B?Tm00SFI1cUxxMmdiNXcxcnNnbjF6Nlk5TlhaRzB0clg0S2dRdmJjWE5OUG90?=
 =?utf-8?B?N0FKQXNuNFFNZHNKeC9hai9oeC9NbTA5UUN3VHA1WWFIWmlZMk03T0l4U1Z2?=
 =?utf-8?B?QkV0UExEWkRKWFNOTllHTEY4eEgvbjI3aHZiYXhrSEVzN2VYWHZiNjF6NUdB?=
 =?utf-8?B?WFd0WHk5Mnl4U0d5aityMnpHRmxBd2JUVmVyL1AybXhGYjB6cXZFdGN6a08r?=
 =?utf-8?B?WnFEWVAvT29kdWd2M2ZMVkdqQUhpVTR5RjN3ZE1tTmovQm1VY0Zrb0lGeWZK?=
 =?utf-8?B?ODFPZEp3aGNMSkRycmRwRk1ub3NaZE12b21Ca1hVdXBJTTFQUlAyYlN4aFZW?=
 =?utf-8?B?SE0xLzNHcUxiMlcxUjc5UUVwMCtTQXpwa1M2U2lGaFRsZmpDbHhuWDd0TWhD?=
 =?utf-8?B?djdIbEl1cm9hZ2pDYityTm9BWlBtTllXbHpVeHRhUVZ1K1MrcUIzQ2pUcTQ5?=
 =?utf-8?B?UzJuY3lJam5tNGFvOWJVcXhNR0dFS015SWxJRFJweTlBUVI4N0VSTjd0Vy9M?=
 =?utf-8?B?OVVTbHdhSHVaVHFNcDFaeWRJU2plNGdGcW5QUGhMMVlSOU9YY3doRGhaZjRv?=
 =?utf-8?B?WkJKNWdIQ0VYMTVXMWduVWtSbWhLRFN5RVNubWhLQkNmeWlxRjV1SjRoSU85?=
 =?utf-8?B?YmhHNlVUeGRwUnhxZjVPQW5lYnArVWF2am9XTDVGbHJ1UFp0U1JFTGJDSHQz?=
 =?utf-8?B?MW1iaDkveVc1V1NoWkRjRTZIZWZzRlJWdmg5ZXFjYUhmbTJyZ1dnWFNodm9M?=
 =?utf-8?B?SmNjUmVhTEl5UHVCbDBYKzR6ZXlRQ25JZmhVNWZYMmJBaW1BUWU5TzVoQXVx?=
 =?utf-8?B?cGNuRXM1dkZYN0pscUU0M3FTQ1AvNUZWdlcxeDRVSWhidms1V1ZpUUxSMERO?=
 =?utf-8?B?cG92NFgyZ3J1R3Fyb0J3Wko5QWRlTi9lN0VYWVJ0ejJCNEpIZWtrMlRiRTB2?=
 =?utf-8?B?UE1DemVGOXZzRTRlbGRGYk5kTVVtTEs0U0xGRzB1QWpLWGh4S3J5NnNodEI0?=
 =?utf-8?B?VjY4QS91QytkcncvRXk1WWJlV2dPVWFvSFd2YUhqNDZyOUJmOWpuSWpTUk1o?=
 =?utf-8?B?bjB6cGlPVis1dGszT25pMmJKb1J0TG9zVlJZcnlQVWdPY2x3alRqaTk3cG1s?=
 =?utf-8?B?cjJDWXFPSDBzMk1ZT29UZTdYQVByVmVHdjMzZnVMdkxIWHFnRjltSGp2amxy?=
 =?utf-8?B?cEtrZ1BhTThVeVJPRDNiS3JjRW9WNEIybEhlUU5uMWdkNkFvais1NzBIWUk0?=
 =?utf-8?B?ckdqdzlhOVBEaVFaZXZNQ0owdHdFRW54Mk4rVE01L0Z1aUhEMkxsaUdJWkxw?=
 =?utf-8?B?ZWJpOEU4ZWE0cFVMbHpGSjJLYzU0M0lOOWgxK3dUbnd0b2FxandDRmJHSEhL?=
 =?utf-8?B?Tk1pR0kyeXNkSUtGdFpDc04xdm1TVUd6OGMxOUlmUW1pUnh2SWNpckEycXNt?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: videtronic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fe57a8-77a7-480d-6c8f-08dd970cf3ce
X-MS-Exchange-CrossTenant-AuthSource: WA2P291MB0309.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:40:04.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 42908bfd-23a4-4a6c-951d-1ef4d8e0c612
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFW+7Txk1DYyz5TuqGmviemt3bp0eqmRbEJUUg+EJasVQuh7gmuK1bwxV+mCdVeNEnxmRaQvOicDDDSpiITbv0FzanC+OvuVmQkfVB92dAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0099

Hi Cosmin,

I have tested this patch using following hardware setup:
* Raspberry Pi 5 + MAX96724 + MAX96717 + IMX219 * Raspberry Pi 5 + 
MAX96714 + MAX96717 + IMX219 It worked as expected without issues. Great 
work! --
Cheers
Jakub Kostiw

