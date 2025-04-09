Return-Path: <linux-gpio+bounces-18525-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9FA81ABD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 03:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65F444489D8
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Apr 2025 01:56:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42086156C40;
	Wed,  9 Apr 2025 01:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="nKu0A00d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021076.outbound.protection.outlook.com [52.101.129.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EAE41C64;
	Wed,  9 Apr 2025 01:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744163790; cv=fail; b=NcdjHK06frgtIAhNWEhHneGPbFP/WqtlZ06aFobD0of7NCH1JSGmrLDzoKH2Ja5G+oFKJOClBIMxydRnTeCdswaVCLNrOlEURSpQgQ/gsxAicK4ZaTuqINRuULWkk5oqzhjYOaB0dT1BOTIPzd4tt4If/OI6GBiaU5XWHqkl7gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744163790; c=relaxed/simple;
	bh=EKmsVvG6iMevMGzRoiHTlP53Gp5tjQ06pRcYNqqAYwM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nChwz8oDAaz4agoeKzZSFVBtVLveSdWEoMV9Bl/8Dy8Y2oWocxFZly4HbUxu5AUsepObERQcCJQkUjCiq/pp7FpJxRwH7FcCbcAJPv+Mu44un5W2kBwA6FZLY+nc+ZMiV0lZSG2UFnymLf95nhR4jDNuqmmTzrbHhgms/pI/Ho8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=nKu0A00d; arc=fail smtp.client-ip=52.101.129.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsJRvDVnwhDvshpHuZlght814Tjx3yFzFNsKqo/mG+FJj6gAYwU950nNOZr4nOCnDMqz7If5iau85KOCc0ghOpwQ75ED1LwvEsHTUgX/k7D8i17ps/guOys8r/8pjBXvliR1Hf5evQ+pRgkFEJo6nFK7Q4wc8394ztF8w//Qa0yta6e+dejKPu+oMZNxb14e0EDeYQEB1WMN91Lu1/vEoGg4YKKg8hZyTA91IcVojyoSil3YF4RzZnmCcU3DYEYq6237SBV7WvRvp6U73qT+I+7+XhDajzvmm/TUEIDAMhpqspVI2HsjgZ3HAWhxY1Xc1zHv3FLnHQY38HZInu3HsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fv1lKwEP7uv8AXaS1ZzJKuqtXYDmMv7I4d0/PdJE4Y=;
 b=ucn976GyZY9q2HuMRhqn5i3Kolx4s0amLeOW1SGN+gjMnRIposmbt81QxK4Dh4lvmxmiWumuT07Q9jk5z4eR/ttLCGdaFwpDloThgQL3AkOEDh1mWwnsBjAnr91z0bk+XnIopA+KhILMQLy5zvYRev38OtexhcOznLohfKMHdhBJfxFUJqFlT4S/pGIhYV1m+n2VHWnuO5FmNwlIi+0p1zpE+AZfSFZFM+h6OHNpaFFbgg/PJvOM79GhFvLBDmhG2Gx2Is7LhHU15iNWd5j/wE/fCDy/KAmIuMSA878Z19OH0p5v7zbih21ypQW+VCPhfcbjPFgLMemqYFtOEOUWIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fv1lKwEP7uv8AXaS1ZzJKuqtXYDmMv7I4d0/PdJE4Y=;
 b=nKu0A00dsVpjqHZLINsYBO8DnspcjTu1GX/DWGNiqBp7hOocjvBNIU/C7PvseRDtr4O+pBhK6Y4vnKV8ilZC1yrdQVneEm9hbYe1Cf2GIAfrYQpxBU2q7wwCsKyrj8YkorEP9ovBJZ82qotytODizGxTHSVAm25LBv30he7k6Ht0M//eJF6+9Y4v5XnCiN326mHxzg4YzpwOGqqIMrmoLaJ2KtXjwFN1Wh8jtQShyqDrC8e2e6jFohPDXwPopWArhtnTBCTuIqZLK3++UwyZDaDuJYvplkOY+fOkZdGrixQfOz9lQ34PwuUe8zrsW8IDol/ZYy0twzflZziKlQormg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB8228.apcprd03.prod.outlook.com (2603:1096:101:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 01:56:22 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%5]) with mapi id 15.20.8606.027; Wed, 9 Apr 2025
 01:56:22 +0000
Message-ID: <6db52910-00c9-45b1-8212-eb826f406750@amlogic.com>
Date: Wed, 9 Apr 2025 09:56:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter
 callbacks
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b9ce0e-4895-422c-5a42-08dd7709ba6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3JKd001R0NyeEdGUHNsT2Q4cGJWZWpDcGlrZXlDRXdqekdEckFKTTIwdDI1?=
 =?utf-8?B?ZE5QUk5TQm1QTktsZWJWVkFJb3VqTXBSYm9oRy9xekVXUUIwNW5tUU1mdXJK?=
 =?utf-8?B?eDZkKzB6OWM5cTQ5aENEbFhPUitTaUdSWmNsOHc3YVFBNW9YODNsWGw0U3Mr?=
 =?utf-8?B?UlBXeG9hbGhQOWJtcjI2UEx0N3lXVXNwTTZzTFZ1cGhoU0JqL3JqRC9ycGpW?=
 =?utf-8?B?eVhubDZ5UEE4Mm5FQktDZTF1empvdjVOTFRDQTdyclJ6cTMwU0dJWXlkQ2VE?=
 =?utf-8?B?bERqK3BKYnI1YXkzejhrZnpncjN2N3Z1MUEvVm9wd3NiTjdEUlZUdGhUVnNN?=
 =?utf-8?B?TTJxams3dWI1SmdhWTV0MW1TSVN2aC84UVlTMHBneVI4T3ZHQ2VLZHlhTUlx?=
 =?utf-8?B?bXBsbXFVRFpLRG16dzdURG43Zm5vK3lnZTg0aW9qdGR0eTFOYUxLTlNGNWNM?=
 =?utf-8?B?ZkRKTmR6bWJoQlZJdWh6aHdyTXZQRzRKdFlNNHdXdXRLMS84NUt6cEFveWVF?=
 =?utf-8?B?WXR4d3ovTEt2QWdKbU9aeGNmVU54VkxObnVaN0FIMFlpQTdWUC9zV1JKalNn?=
 =?utf-8?B?L3QwRVprRzl1SEQrT2RSajdWWThlcXIzbDgzbXM1QnU2T3RTODEwS0VWYWlz?=
 =?utf-8?B?TzAyelh2RERaM0Zua01DZHppVERFMGRXRnFjMmFvWm1DRjFPZjF5TzdZMHBZ?=
 =?utf-8?B?ZGxwQWNHYkRDZ0l5RGNFTVo3TWRQNG5oMWZ5dHNSUHNjVVVmb2VFNXk0Wmhs?=
 =?utf-8?B?anZYR1Ztc1F5MlBEQnk4MHlDZ0ZvdlFPRHQxMjJmNkhzNGF0K1pPRjhwUEJY?=
 =?utf-8?B?aDRiYlJaT29CdlRyYTg5cGJzMjZjVXJZUE5IWVpzY1RHS3NCMnJodFp1eFJU?=
 =?utf-8?B?ZmxoS0Z0TmIzbHRGdndTbmhidGttSVZVNUROSnp6dmpaMGNlbm10dk8rb0tE?=
 =?utf-8?B?TDRmQnpEeFNQeVArTEJLTHRhQWd0a2ZpMjI4RUxNOGtzRjc1eFZYd0JEVTB3?=
 =?utf-8?B?WnlaQXROQ1BHcUJXU1NzYkdKdTJJQ0s3OTV0dlZ3dVMwcjZiZ2J3czBNbk5y?=
 =?utf-8?B?NWR6UWFZcVVZZ1RzMU5jUCtVazV1UW53MG5JcFk0WlNubkFheWJkamdVYUQv?=
 =?utf-8?B?RU9xQnlCcUZZOGQ3RlN6WnhDVUFqV0hITEV0aHc0ckJGOGpHdWduVHpGTm8v?=
 =?utf-8?B?bWd0S25zL0ZnVDBobGtjcEdCd1p1QTBrbU1Ic2N2R3F5d1EvQVhQUXJ1b09H?=
 =?utf-8?B?QXFWWU5kL0g0KzdOaXZsK29oUUhYRVRNMkZrVitINWhITzhvb2hhb1RuVVpt?=
 =?utf-8?B?VmdkbDRiclBpNUQxa1NsUVdUeXpOTDk0THpPbVREK3ZRZURDaUZ4dzczY0xW?=
 =?utf-8?B?bStraG0xekJlNENIa3hJd2podlVyejUrbDNxeGJ6eitpSEY0VmhsMGZGTFFs?=
 =?utf-8?B?N0pOaVdLZ2k5SlJ1Q2F3b2dqWWtRRmRZdWxMN3dtNUlNc0J4N3NkSjl2aUJZ?=
 =?utf-8?B?dTUrL0E1Ykc5Y2VsRHVHNnJ3L0NYNzZESnhsQW85dlVJclNWLzlObVBwekNq?=
 =?utf-8?B?Z2pidGJ3U2RNK1BUYU5WcGRISldBbVRKODk1ckVmOGE5K2hkY2g5SExzNWVR?=
 =?utf-8?B?NENETWFzWHBDeUJTZVYyeUgzY0U0a2kybGVXbS85d1R4Q0JFWFdXbVlCUERs?=
 =?utf-8?B?ZzhJNzE5ejZ1b3AzNmRsU0VmcGdjcDNwMjZxRWZBcUNrcURkUnJQZjFoRXVt?=
 =?utf-8?B?ejBmZnRvNDNCTGVWaHJCUndnMERWVThibjlsNWNhZS9yWjQvTUpPQUwvZUJW?=
 =?utf-8?B?STZGSzlEcTNFbmdhZkJHVVVnaXRYdjZoc1BOOWVFU2ZkL2llR2lPOUhSaC9E?=
 =?utf-8?B?Y01qUjVuamV4Rm9zcUR5dGJpUWJLeGoxNDJ4RVVpL3J2aENDb0ZZQXFXV2ps?=
 =?utf-8?B?dEZkb0FKMW9Eb2VuZ2p2VGcwQUppN0tSVjc5bFRicU14a0xMVmJ6aS82WWdx?=
 =?utf-8?B?R1N5ZTVvL3BRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFY2V2pNbFpBNC80YjBicjRIaE04aHZJTzBpakc3cXlwWVJ3MGdLVm9STGpI?=
 =?utf-8?B?UXRDSFp5eUFJVm5hNUJ4Nk9QMzRWakp6RDRVcXN2aUZGR21NM0xOZURPUlVq?=
 =?utf-8?B?YjZmOXpUdnQ3MytKcHBub2hxOUVVVCt5YkFFZnlJbjJvWGlGVGlrcEdtTjh5?=
 =?utf-8?B?MDJxR0pBM0ZwY2lHNGdTM1hWZVBxaXphc2NLa1ZYTlQ4SGZKTDRwYjdQQlg5?=
 =?utf-8?B?K3FxQXJqak81U2U2dFBxZVltb1lqN3RhVXdGUlk2QmlDWEpzcy9obFJNL09M?=
 =?utf-8?B?ODNaWDE4Q1gvRmRNRzdvenJuRHM4bXVYVTVWRDVVdEV2QnZLNDJ4VDhTSU5K?=
 =?utf-8?B?MXFSWjRMVzdXcG1sOEYzN1NscStFZjJNWUlFUHVXOFhVZiswQlh6eFA4VTFG?=
 =?utf-8?B?R1lieUM0UWhsRTFLeHFTNERVZVhNbktyWDNuY2NSVTM4SHR1aFRqeDlQdllQ?=
 =?utf-8?B?TkJXZ1NnaUtET0xQeS9Od2tFT1pHZVg5T3dPb2JNM1lWUElmYVRBTHhsTWJ3?=
 =?utf-8?B?WDIzY0dSVzNyUEtqZXI0Q0pnM0ZkQndOVUFlWWRkb2wvTkFhekREZ0YxVngw?=
 =?utf-8?B?WlVYQTU1aEpCVzJodUd1eGUzdGU3SENOZVArVHVVc3VlaVpTeDBtVS9GdzFt?=
 =?utf-8?B?bXNJbnlMRnNDK3JrUWdnRUZxUXZIWVU0Vlg5eU1oMWEwWXJaejZlTU9qN3Zm?=
 =?utf-8?B?cFZOa28zbTJLOGpjdjVSbC9xSzFWdC9ya25GU0RMa3crWitYQTNnNFdvamJt?=
 =?utf-8?B?dkc1aU95RFJwb3dHU2ZtM0d4dUJ6Lzl3d0JZMjRhRXhsVWR4UkZTcE9FZ2g3?=
 =?utf-8?B?YjhOVHoxMWRBNlg0UTcrT1NQZU82REROb3lYWnR4SVdaOTBtQWlTbDBXSUg5?=
 =?utf-8?B?SmN5ZS9vQXNMdmNXRThDZURnYUcrNWZWVzAxeEIrVlJEZkhPZVJBUmREZ1JV?=
 =?utf-8?B?RlF1NWh1NUx1amNrL1RIcG9KRVoxNFl3Y05VRVMvNmM0bm42K2x5TzlxSFZE?=
 =?utf-8?B?aGR3RUJMUFRTWS8vdk9IQlg1NFpDSEJvbGhlM1ZTREpXbGUwdUJlMnFQRWtl?=
 =?utf-8?B?NmlISWhiSVkzSk9aMlY2aFFBajJSK0VwNGJPN0tJcXhrOXNVLy9RbXJ0bTlL?=
 =?utf-8?B?TWZ2VkZ0TGp5dXN6MjRyaktaUVN0dnZ0elVqN3U4U016SDFPM3BEWkNnZ0Rp?=
 =?utf-8?B?NEMyUERtZ3N0cTFPdFFwdzNjUFMwQk1kS0U3U1RrZEhKcFROK2hYTDcwV0tS?=
 =?utf-8?B?QXF2L3NRSVdIY2pGczhqYy9OREdta1BQdTdIWHlNMmZtakl4b0s5aUdvdVBV?=
 =?utf-8?B?OWxmNzBEWGg2ajg1R2FoRjZXOFRKdUZTWWh0TnhSZllpWTNLYjhxQ0NMbFFz?=
 =?utf-8?B?RFo5UHdrRzVOSG40KzdPVFVaYytnZ0p1eHhEdzNKMi9Qb052M3lzeFIrWnFs?=
 =?utf-8?B?bmZRSThVUFAyckFhRmZJS1MxTjNMd3FZdXI5aFRaVHAvYk0vVEVMcS9KVG1E?=
 =?utf-8?B?bnc3THEwaGovK3kvQjFuSmp2QjBaeW94cGhYbVIxWWYwYjZZNXZiNDVQR3hF?=
 =?utf-8?B?dFJIdHVGQk9SODIvNlJoWEhRd2FReGY4R2kxVmRjL01oaGM0eHFBMWM2akd0?=
 =?utf-8?B?S3hMMHdIWDFWRHNmT054QkZHR3pic0FCaDMxcU90ZHdHQ0luYWdDY2NoZWNK?=
 =?utf-8?B?ajF3d3dCeW9rZXlvNGxuKzJIU1RYRWFkYUNIelFwbnlyZDZBa054czE5a2wr?=
 =?utf-8?B?aThIQ0duMU55Ui9teW1COEVSYkEyUVljaUpGZ2JrZDVNbmdyeWQrOWlDaC9s?=
 =?utf-8?B?eXlPNDc5SWFIc1ljR0ZQdTFFbWdybFBGTTFMaXpDNWdxZHEzSHFIa1RIOTNV?=
 =?utf-8?B?QmhlUmxSWUh0eGdJbWszRCswTDhEK0VFTnRzY1hMemMyZ1hwZnFPbjhhUU1m?=
 =?utf-8?B?UHZHOUZzVTZmTTI5OU1Ed0VNdVh2UitPcW5WOGNocElqcUgyY1JiZDFGNTg1?=
 =?utf-8?B?VTcwWnd0a2JzWWlNVHcyTzNVRzlZc2c4cDdOb0ZCdXR2T0ZYSVVMSkhZSktE?=
 =?utf-8?B?RWZ5b1NIVjgzOVZ5amFDTXFId1lEM3pYZlJWdTJhR1ZzbDJJL1g3a1BJc1Ex?=
 =?utf-8?B?MWs1ckcrU1dUcWlWT2xra0hpTTljb1E2WU9ITUZYRU5kTVlzY3BjWHI0cnMw?=
 =?utf-8?B?RFE9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b9ce0e-4895-422c-5a42-08dd7709ba6d
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 01:56:22.4757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0W+1Xw6aI0sDoDzpB3VFJprbU6JjNRcEJDt8q+nT9KE6vwtn4QvIzOZ/EGp8lK7oD7Sy/SRQDMvB8G+nVJ9g4Wm8LR/OuO9PSG8XRsYgEO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8228



On 2025/4/8 15:17, Bartosz Golaszewski wrote:
> [ EXTERNAL EMAIL ]
> 
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> index ee7bbc72f9b3..a76f266b4b94 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -806,15 +806,15 @@ static int aml_gpio_direction_output(struct gpio_chip *chip, unsigned int gpio,
>                                    value ? BIT(bit) : 0);
>   }
> 
> -static void aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
> +static int aml_gpio_set(struct gpio_chip *chip, unsigned int gpio, int value)
>   {
>          struct aml_gpio_bank *bank = gpiochip_get_data(chip);
>          unsigned int bit, reg;
> 
>          aml_gpio_calc_reg_and_bit(bank, AML_REG_OUT, gpio, &reg, &bit);
> 
> -       regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> -                          value ? BIT(bit) : 0);
> +       return regmap_update_bits(bank->reg_gpio, reg, BIT(bit),
> +                                 value ? BIT(bit) : 0);
>   }
> 
>   static int aml_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> @@ -832,7 +832,7 @@ static const struct gpio_chip aml_gpio_template = {
>          .request                = gpiochip_generic_request,
>          .free                   = gpiochip_generic_free,
>          .set_config             = gpiochip_generic_config,
> -       .set                    = aml_gpio_set,
> +       .set_rv                 = aml_gpio_set,
>          .get                    = aml_gpio_get,
>          .direction_input        = aml_gpio_direction_input,
>          .direction_output       = aml_gpio_direction_output,
> 
> --
> 2.45.2
> 
Reviewed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

