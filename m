Return-Path: <linux-gpio+bounces-12218-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0A9B2B9F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10DF72821C4
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B49C1922DD;
	Mon, 28 Oct 2024 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="C7+Pn+dm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2107.outbound.protection.outlook.com [40.107.215.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89DD28DA1;
	Mon, 28 Oct 2024 09:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108187; cv=fail; b=hslUdTl72vlDS1We9asPJTjQx82bqE+7xApiWbLEDLM2/R2KDC3imUYYHIPwK4jE9nR5i3qhtkyX5hQPYW9kHU6qMfHl1WArUQQ0+q3o23gxC8fb5h2wawue+KEQ/sPG7r2wFcBRcDqwJjvrmMhFMOy8fMjOHC8aQn9M55vev4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108187; c=relaxed/simple;
	bh=hdH4jZqdXssSxJiAtvQ7Bj6Zb5KR8wipuq1Ldlwu+dM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nv3nsWvSHwTbXgmSUupVTJanQZXYNLUx2Rf8OThEEzCW53Cb8DmLIJ2dNdF2src1BXcb4Ad5S0DGrU0sJBq8VbogstiFuQPj2Y4qyAfMMHl54/1YbBKn48SJtgs1XS1K/oLDiZopeQH9Yc1iWt/KEpl17g0GbW+GBSljjq22Yqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=C7+Pn+dm; arc=fail smtp.client-ip=40.107.215.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tr8z/j5SiC3FQc9tgCx2/a1/epg+7NlKByTkfTBQag1a4IHcSRl4jsV0+/mmaIi9AKm+Dqz49flHMYrKuq4avF9L4ArZS+W/IV+72Og5aRwMguXaSy96WcBujuvmF+5u9yRE0kfQZe3Pjpwxhh0GjJWl419RVKRMEfTPbTUpv84VE/Q4ohke1s0RKDVNYXcGDAxh/vf0u964EOYUp2MkP7Au2SXwmixeu07Ow3semukcJj97yzDo7Rn2GVM21ox89hLlSZ4bTPILVz7oOzo/+YvPm0ZKfVWff/eUHYYRx9z2Eu2bvGVt0AUY1CobEDsKaYROkesYvJIZQFyIXTWY3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj7dJKstOKG2jwJmYvlVySZaTqYcboJuoN6wJUTgSnA=;
 b=if5JKY8jrEqj76ykYNZoxSvRE+EYcm6V/5L1J+sGyAYDv0M/zwpv8pLv57VBEXHjYZwDcdDg71MGybzM8syZR4niFwKdSOFeVm6Y4HgpGEnhJVBLTkAsUf2JvRkGq8mDDcA22WxSLVBeypdzxb+roJyBsq6GmSy7HI10bE4+IGFTumVztJTTkNMT6XlyRDz/frVgSpzW6v/FVWwfJebOsTFcbdhyl1TTXmxhS31rwHV7jx5aR+WGgCv7La9ZlPQzSzXWuQhDaRJIPPFqjt+7jy3OxHUIZAPoFgGFYICROgXTLyKPC//E0aUlwB+LZcKSrVlpYJTWj7MyNeoY3CBiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vj7dJKstOKG2jwJmYvlVySZaTqYcboJuoN6wJUTgSnA=;
 b=C7+Pn+dm5dzTo+j3ydgMJ0YThCGztnhod+kSgisQfVt6VfyaBMdTEJ7lqDLAPrzRuC47eQOi6G8pWdhtF9ze5fn0jJa7u8AH+7uKUYqHOq5fV/NRujVG/QiEw3XoibbAIE2EOdyKSK5hB+pci1pKJayz6J6Sp8VwpKR7/AJp486cHjw7RX/cOAJMuzQ98hPTLLkVAjW06OQ7asy6Q+G0yfDM1jQ3aQEBn0Ztzm3jdsbVNTN3F6mi99t3FdwiDMMec6RDcWFe3ZQBbj3QvAoiIYnBKeLmvwC926XCwqgrl9C3PuKemg0J4C/qBsDL5zhrckFMLrLNz5/obqS8gY3y6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com (2603:1096:301:100::7)
 by TY0PR03MB6774.apcprd03.prod.outlook.com (2603:1096:400:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 09:36:20 +0000
Received: from PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f]) by PUZPR03MB6888.apcprd03.prod.outlook.com
 ([fe80::57d0:f9e6:1d9f:91f%3]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 09:36:20 +0000
Message-ID: <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
Date: Mon, 28 Oct 2024 17:36:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Content-Language: en-US
To: neil.armstrong@linaro.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
 <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY2PR0101CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::15) To PUZPR03MB6888.apcprd03.prod.outlook.com
 (2603:1096:301:100::7)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR03MB6888:EE_|TY0PR03MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 1848bfaa-0cb5-4c2b-b2bc-08dcf733fad6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eWV5V044NGNxRHJEUUFjQ2xnLzBydjRsSlRzTXp3UkdxQjhxZG5MU3ErRDBQ?=
 =?utf-8?B?UkMwczNjN0Q1bFc3dWR3MkFQbzQvTWtIVmJudEZjelVYeDcyZmRnVG1vTlRI?=
 =?utf-8?B?b0NjU2xaVmxic1hWQkJ0bU5GWmx3d2NtR2FsZ29pejl4NXVJTGZ6TFU1Lzlk?=
 =?utf-8?B?MnMzUU5qMUIzdkk2bnc3MHY3dnpWOGhybHpMd0pwZWg2UURnV2tXMVg0Q2Js?=
 =?utf-8?B?alVkT1FXNzh2dCs5YTNEOWtLekNONitOZXlrd2R1Y0JQTHAxSTcyNnVIUHRV?=
 =?utf-8?B?RERCdXgvbCt4Nk1VQWhUL2RFWGp3TFUxQVhUSmxMSDdEcGVSczRKWXVTUGFn?=
 =?utf-8?B?TDZuSHdtWkV0SHRPN0dtbDM5WHNCN2tWTG03THFLb09xYWpSQkFLRXdKWmVN?=
 =?utf-8?B?TFpNUDdjVUJIVDBaOWIrVGhiRnlnVFpBbDljNE44eGtCdVZkWWVJWEJ6TGhT?=
 =?utf-8?B?anAzWUQ4dXJ6S0JsdFFxbHk4amVrSzJaWGxNNjJESU1GTmRmRW5waml3c2la?=
 =?utf-8?B?Q3hEcURWV1p2bk5UbDdSeUNDQXc5bjRaamtsR28yM2xJb1JrRHk2OXNLSG11?=
 =?utf-8?B?eEVEbTlDYVRVaE5zQmhVbzNrTW04ZmJINXB3VS9wUUp6MnJBbitZenlhTEFP?=
 =?utf-8?B?UnVJbUkyRnQ2ZmV6UHJiQWNLUG10N3lkaTZUa3RFMUx4TE5kWElrUDB4Snpo?=
 =?utf-8?B?VDhteUhWaks5SWRZVFhic3pvdnFtbjgxbkJYd0V2L05LekFUd2I2bG5RL2h4?=
 =?utf-8?B?cG1MR09wS3BVcDFzNVF4QmtMQzFqcUFZUXYxMGdlSGFKOFdlRUxRZVFza2Uw?=
 =?utf-8?B?TGZMb2RtQU9oc2hUb2Npc25oYlBzK0xlVkRHVytyc3lobUZ2eGxuajl5Nzdz?=
 =?utf-8?B?Q21uRkxBbW8xUGdsaGQzQnorQ0FMRmZoaUpFUXJOR3hwbzhlMVowL0J6dHJh?=
 =?utf-8?B?YzJpRUNoTE4zaTl3VXpZK01sM0RsTDJXWnRaQ1JadWFSK1NzZ29jczVjRVRk?=
 =?utf-8?B?Vlp6RUdXQnhPdkpDYUVKN1I4RFFPdHNyb3N6K3Y5TDRVTGROQWJvVGZROFpF?=
 =?utf-8?B?bjlDL2Y4OEpMVzUrU0xRRzkySnorYmVscVdqZVVyaldROFRrU1BHdjJVREVK?=
 =?utf-8?B?UDlEd1NGbG9vTDNqNElBMkV6bW50UDFhREo3MFRPYVFYSWlVOWVGZXhVZG82?=
 =?utf-8?B?aVJjNHN5UE9maSsrVFAvY3pDdURISGRtMlhUVkpVU1RSVUZPcmwzaDVCNXJP?=
 =?utf-8?B?aUZ0VEdMdVBibVBuWjRKZEZpUE9XZjNlRzZPMzBIV05GOXdxeDdaZjJSYjAz?=
 =?utf-8?B?d2FwY01Ka2xTemVCSDB2eTkyQ3Nyc2RVbnVJOWZ2TWpyZVRRT2cxN09yMHU2?=
 =?utf-8?B?dTN0VmJLUnRoclJCdHpLcm9sU1Z3cHJYSVdVSnFuMTRpZ0NXbVdKWVpmUzhh?=
 =?utf-8?B?dk1Fb3Mzbi9JOStJYldlU1dvWnRiMytQVUFwYTBxUGhtZFBBSWQrRTlRbnVz?=
 =?utf-8?B?a25XU3I3WnFvLytRcGx4eTdtMUFHUnRXSHdyNXFpck1kKythajB6L3k0MXBj?=
 =?utf-8?B?c1hWZTFlc1BBb1VVU1FrWFNVUHAzN0FYZEQxODMxOS9GeVpWTElTeEJDWmhw?=
 =?utf-8?B?LzJkdTA2RGRqU3BaN2NheXEvczFSQUJSZzRpQ2l1YUNRQU9jUWd1YzBvUDVO?=
 =?utf-8?B?ays5cVAvTDVjNlhCVml0Y0JEdFpKNTAzM0ZnR051TTlvdTg0UW5jWEw3aFBh?=
 =?utf-8?Q?aw5s+0afkShP4Cyvw3+9xPxVpn7Hkki/Ma72ZJz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6888.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mm16SGxGRlFLU21XRHV0ZE1LNnFHdStQckNkeGdCeWZxcjRqWHhmcEUxa2k1?=
 =?utf-8?B?Z2xyU0Evci9zM0xnWW1sKzNEeVZDQ1g1eHUvQVIxeTdOSStGcGdxUjg0MDJv?=
 =?utf-8?B?bVJOZjcwQy9EV0d0Mm1zNWl2SHlIOXJFdlZvNzE2N1pRNHUwd0RvQlRvY3Jw?=
 =?utf-8?B?VkVlL0FkY3pWY3ZRc1B6S0x5a0FrZTBCalp1WEE0WFoyYTM1RWVkemt4UkxX?=
 =?utf-8?B?ZUJRK29xeHhaQmdEK3JzV08xdmltMzAzVlVEVW5PVk5WMWxYciszVnEzemlH?=
 =?utf-8?B?aXdRZm5Ec1Erdk9seDNwQ3FOTUJIRER0a2dyZFNYYnMxM1JmcGRXa0x2Qmlr?=
 =?utf-8?B?MjAzdklrMXVlMmwzNGtES0pGR0cxaC80K1ZibGVZcU1lbFpodE1jOEhXdjQy?=
 =?utf-8?B?RDY0cmRGdnFSeDRxSithbUU4WExMR0tSTXd1RFJWUkZpajBIaWI4Rk9sNUxs?=
 =?utf-8?B?Tzd4ZHBDUGkyd1lqQi91Qm45aFdqVmNsU0I4ZDU2WlFSaHp3M2o3eGRzMVpM?=
 =?utf-8?B?ejFmQnlrRStEeWY0ZmpRNGd3Mlowd3NzTHVjV3phRmdkVXY0VEM0M0duVHlE?=
 =?utf-8?B?WUFVcUwrckpxUVAwRlZ2MWpSb0x0dGM2OVBsSVZWY1huZDNHSzE5aENLUzhv?=
 =?utf-8?B?RGR0WnZiMnFDa205c05HakhjNzN3SW5zaHVMbFhMd0g2bVBKUWtsa1dnb1c5?=
 =?utf-8?B?amQ5NzlwTzV6K0xTQS8vcmdDWDVvakFSR0luVVlzNThEZVFlNW55dW05bk5m?=
 =?utf-8?B?L2pVaUhqclZEVm02VFVSWWVPTXpnb3pkTlJkdFY0czFoSHFacWRpZWZnbTNx?=
 =?utf-8?B?S1JRL0I3K2k5czVUd1ZrMUwvTzhlZGYwanV2dE1YSzZHbStYRnBPcGEyV1Z2?=
 =?utf-8?B?QjF2Vlo1cGZJb3NJU3BkMHQ4aUhnUFNUaUhWQzBudnF2MHJGZFlwM0YrMnVv?=
 =?utf-8?B?R0tLQ3RvSHc3S1lIVFIxRGNzMS8zSllRODhodjlYUStkaDF3ZDhGRDQ3S1Bw?=
 =?utf-8?B?V0hDVG84anRjelN5K1g2NVdibDBEMWxXbmMzcHBTVm1ZQm42dG5pZHZVZXRi?=
 =?utf-8?B?Vy9tRmNMakZWbnB0QWo1NGpqeG9zM0NzeUhGNm1Qa1BjeXpjcHBsUVJRVTFo?=
 =?utf-8?B?UUkvZTFLL2V1QnVvY05SUlhnWUdsU3M0RjR4ZG5wcGU2L1VEYVJiek9UK3Jo?=
 =?utf-8?B?WFpybHdpZTJoSkJNaFVFdjgrcEQxQ3pySTlWNmhncXZDVHI2dWhVd2Ewa2lB?=
 =?utf-8?B?YnBkL2VsTG1wTUxsdU5FV3UyZk05bUtreHl2d0JnWURKdFhGUjdVblBCQUlU?=
 =?utf-8?B?NVNFdjBuNVFieW02RUROUXo5NHNZbjIzcCtlYjZCWWNOTVhxelFiZ05ZaVZR?=
 =?utf-8?B?RzduaWdPYTVkeDROQ0tkZ0dKVnNhTWJJTVNpeURHcDR2MjRVSVdFa0JaaEdB?=
 =?utf-8?B?TmhJZE5BQkNmYm1qZ0t3VmZPYnRxZDFNQzN4dE9QTC9haW5ybk1qcElPRkVJ?=
 =?utf-8?B?Wnl3QVJZT3dESjc1Mzh1R25xVnNJU1Z0YjVlWFhuRXh6NmRLU2NiQW5JQmhB?=
 =?utf-8?B?TmZFL3E5cnJtVlBLczZURmEzWGtWM1kzcFM5MEpuMXFhbEU0U3lpWTF5cVNT?=
 =?utf-8?B?SWxnRVY0dXJjRUVTMkd3aFlYTDR1M1FnaHFqQm1EbkhSRk1KSDlSbnhQeU1u?=
 =?utf-8?B?dVdzRVMrWmVZeFR1eDFEa3NWZzV1M1dJTjBKMG1TZ2txYkZTSG1Nam5LeEF3?=
 =?utf-8?B?THlDQUEwOVluQzRKU2JYVG55c05CQmJXQmdIeE54YzRLUGVrOUI3UytlbHhB?=
 =?utf-8?B?Yys3akZFKzMrbFdTZUw3ZnRMWjBSM0hiWnhFUWRZdzM0OGZSR3lXaFNpMFdQ?=
 =?utf-8?B?VGxON1pxQWx2cjVvUnlDWWp3WkNxclNsTXoyT2thWFVTaXNLdGt4SkhSb3pS?=
 =?utf-8?B?RU0ybHdpM0tLTVJmNlFENmlHeHFPZ29CSkJXNVZjMUthaWx4RU00bDgvWDlh?=
 =?utf-8?B?NUZrTnlvZDdDNFFVaVZNdGErMGJWWHVicUF5YzB3bGgvRWJkK3NyQ1NxT2ty?=
 =?utf-8?B?R2FTZWRpRERXN0tCVDNBcHc1VlAxVi90THJvRDRFOEpoZFhLQnQyaGdEeEZP?=
 =?utf-8?B?V0xOTXdpMHhSa3REVmt2dVNld1V0ckwzT21WVlFWQk9OU3Q4ZnRIYlQ2aFlS?=
 =?utf-8?B?TFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1848bfaa-0cb5-4c2b-b2bc-08dcf733fad6
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6888.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 09:36:20.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVWKt3Mf4tLm1SQnAPmxeaUUSeGWoLlgUPYpUgNn6LVxN2fZmOP+pcVqBvj3Z/Xt6whiixFxQUMqE/FfN3DBkuJHRFG0d8092dFKXYlWTWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6774

Hi Neil,
    Thanks for your advice.

On 2024/10/28 17:09, neil.armstrong@linaro.org wrote:
> [ EXTERNAL EMAIL ]
> 
> On 28/10/2024 10:07, Xianwei Zhao wrote:
>> Hi Neil,
>>      Based on the current discussion results, GPIO index macro 
>> definition does not belong to bindings. If so, the pinctrl driver 
>> keeps the existing architecture, and use numbers instead in dts file.  
>> Or the pinctrl driver use bank mode acess, this may not be compatible 
>> with existing frameworks. This is done by adding of_xlate hook 
>> functions in pinctrl_chip struct.
>>
>> What is your advice that I can implement in the next version. Thanks!
> 
> Keep the driver as-is, but move the header file into 
> arch/arm64/boot/dts/amlogic like it was done for the last reset 
> controller support:
> arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h
>

I don't see examples C file applies dts header file.
C file need to be defined once, and this needs to be defined again in 
dts header file.

> Neil
> 
>>
>> On 2024/10/21 23:27, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 21/10/2024 12:38, neil.armstrong@linaro.org wrote:
>>>>>> ====><=================
>>>>>> +/* Standard port */
>>>>>> +#define GPIOB_START        0
>>>>>> +#define GPIOB_NUM  14
>>>>>> +
>>>>>> +#define GPIOD_START        (GPIOB_START + GPIOB_NUM)
>>>>>> +#define GPIOD_NUM  16
>>>>>> +
>>>>>> +#define GPIOE_START        (GPIOD_START + GPIOD_NUM)
>>>>>> +#define GPIOE_NUM  2
>>>>>> +
>>>>>> +#define GPIOT_START        (GPIOE_START + GPIOE_NUM)
>>>>>> +#define GPIOT_NUM  23
>>>>>> +
>>>>>> +#define GPIOX_START        (GPIOT_START + GPIOT_NUM)
>>>>>> +#define GPIOX_NUM  18
>>>>>> +
>>>>>> +#define PERIPHS_PIN_NUM    (GPIOX_START + GPIOX_NUM)
>>>>>> +
>>>>>> +/* Aobus port */
>>>>>> +#define GPIOAO_START       0
>>>>>> +#define GPIOAO_NUM 7
>>>>>> +
>>>>>> +/* It's a special definition, put at the end, just 1 num */
>>>>>> +#define    GPIO_TEST_N     (GPIOAO_START +  GPIOAO_NUM)
>>>>>> +#define    AOBUS_PIN_NUM   (GPIO_TEST_N + 1)
>>>>>> +
>>>>>> +#define AMLOGIC_GPIO(port, offset) (port##_START + (offset))
>>>>>> ====><=================
>>>>>>
>>>>>> is exactly what rob asked for, and you nacked it.
>>>>>
>>>>> No, this is not what was asked, at least according to my 
>>>>> understanding.
>>>>> Number of GPIOs is not an ABI. Neither is their relationship, where 
>>>>> one
>>>>> starts and other ends.
>>>>
>>>> I confirm this need some work, but it moved the per-pin define to start
>>>> and ranges, so what did rob expect ?
>>>>
>>>>>
>>>>> Maybe I missed something, but I could not find any users of these 
>>>>> in the
>>>>> DTS. Look:
>>>>>
>>>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/
>>>>
>>>> So you want consumers before the bindings ? strange argument
>>>>
>>>>>
>>>>> Where is any of above defines?
>>>>>
>>>>> Maybe they will be visible in the consumer code, but I did not imagine
>>>>> such use. You expect:
>>>>> reset-gpios = <&ctrl GPIOAO_START 1>???
>>>>
>>>> No I expect:
>>>> reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;
>>>>
>>>> but the macro should go along the dts like we did for the reset 
>>>> defines,
>>>> so perhaps this is the solution ?
>>>
>>> OK, so I said it was not a binding:
>>> https://lore.kernel.org/all/u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq/
>>>
>>> and you here confirm, if I understood you correctly, that it goes with
>>> the DTS like reset defines (I assume non-ID like defines?), so also not
>>> a binding?
>>>
>>> What are we disagreeing with?
>>>
>>> Just to recall, Jerome asked whether you have to now use arbitrary
>>> numbers in DTS and my answer was: not. It's still the same answer.
>>>
>>> Best regards,
>>> Krzysztof
>>>
> 

