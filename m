Return-Path: <linux-gpio+bounces-23621-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD76BB0D87E
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 13:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA505167129
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Jul 2025 11:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749882E3373;
	Tue, 22 Jul 2025 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="yJCQTldV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023120.outbound.protection.outlook.com [40.107.44.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77D023A98E;
	Tue, 22 Jul 2025 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184605; cv=fail; b=OGw/U++QEPS2iKJk4ArJ4rymGtMrm7apR1pcP8sB3celUNdy7xrlc/7Cl3ROo4GY+QTvwRCga9ITCQkWMUQDf+n0q73/Q+t/XBD1u0riNyOXjSZFElqgtRwGr3z1WgfmL3CK3kWnuyBxXaS8s0gMe3rEWxmzIk3Pc3S2bSz0VrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184605; c=relaxed/simple;
	bh=UENHWCVEf3dVjvmW7y3E3/ISONA9HXFvBZe1KZtYFa0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j+M7g7LVOajkV0qcelPWDBu/ejOVys2NJ0Sun2VZxHp+QgjtL1gmPo1QmiB20Lw4gBRZzT9FbRZUWl+M2y+43JuSC7v74L3TQj/3oxoREzlpP7NXgWuZlliqZ4wkzWV4ILxza3QVe5K6/cw1uE0r+rKUzLpo7is6cl17PlyHJ+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=yJCQTldV; arc=fail smtp.client-ip=40.107.44.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+nM+XDZD08jKx9iWv54WTpeKQBjN4DnaEcUMBzTQOL4UjxWsEBg/lWcMeqM7j6pIe0s6clzdIsNEd4g0dcFPhMCqIhFia0ydYNr+fKrTZQOAJtQjXZ3iCJGfbeTVsl5+pYvcTLifh3ELRtT8UEyUJ+iGdqicj5tnGxWl5IY8qzvnavp5kC9JtzlXW/KRKcmQTvoaekBrXWH/9dpuIBnrmZaBNKN5SwO2vFrZbnf7CIiGexZUJ5Gy2xZBspqIsA+gIqXpYYxiXPvi8NK3+TkWLZgzMB55AOW9NKLENz+iAU+C+GTD7JjYh+nYSG/XtUFaEjTMDIhNV6ze9iMLpi0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dAUWyS4lro8AIdcdftogGOhGeqcsx9nGBgkxLGLykMg=;
 b=WiypanyAYwSdKL2d5nPVrXnTQcUYvtB48s/eC/YxDENN4SJG7KlXxqFnGmaNcPgXcNGRwqgRAuD7nppM5expV6zrC6q4m9p8Qfbw0zPTLwSdXzGb08ityR6iOoz1WZM+UTqm2lh1s3tMnFrI45JDfcza1J0b0aklb8no67GVKRDcHZms27OvDd8GdP6zj/7/tA1mvXPRLNOGM53i5sLqUxtuL+SsFGFaZ9dMliuZm5Xn9YS6DEubfRdPc8ey109Kiyx10e1VqAXKUO4xx6HvmG19i4fkBMcipLThSLLVuia8/4TKOZlJ9+ZZs2sM+VU+HRJLKYtrzQElZglqE1F5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dAUWyS4lro8AIdcdftogGOhGeqcsx9nGBgkxLGLykMg=;
 b=yJCQTldVSjBc05GaQTDsQzThaO1ENtSmEFRL4d4JyzOWnJ1hGTVS3mx5pKdQUyT/fOy1+u67YAiMbRCbLkRzww1XN3IzQt54B7wRaFsqTnjQcKgFWoLMPuZlJTv/yjx0+MYW4MMoVBITrLcdcW5BfXmdrS9Az/MI8PSdktsdE5Xb/DUJOMgBtaj0ndZkFpMKsBwqYOkM43fuyhD+Ndhqz/OW3KW33q62RHcMq63ofw0w1xefZEn1yL8xHd9xEyvtwlQm4IqioQNt3/60dw79wPUVFIkqMmrRbSaCgSAIUPVGCcXJiiKPmZAcgc87c9WBrYaobLIg321xN9oP971L9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEZPR03MB8608.apcprd03.prod.outlook.com (2603:1096:101:228::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 11:43:15 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%2]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 11:43:14 +0000
Message-ID: <84fc40eb-6911-4aaf-96b7-73604b1b71ed@amlogic.com>
Date: Tue, 22 Jul 2025 19:43:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dts: arm64: amlogic: add a5 pinctrl node
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250403-a5-pinctrl-v3-0-a8c067e22295@amlogic.com>
 <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250403-a5-pinctrl-v3-2-a8c067e22295@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::23) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEZPR03MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 839b0b05-a9b8-40a1-9b79-08ddc914f188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEt3Z2ViSzBJM1crVWFuTTlWcXo0Zy9RaFRNSWlxNCtrRHc5WXhhaUFLUCti?=
 =?utf-8?B?QWRaMVkvZUNoUnRuTHdmeExYeEFxMllNOXBIcEFKUTUycURUMDdhOENWSEV6?=
 =?utf-8?B?MkZGN3hpZWNUMFEwUUlrMnluSXBleHFTV1IxVDV2bExVMUJLdXBObDJUUmJ5?=
 =?utf-8?B?STlVZjJQYjJxSWlrd2pBQXdMeSthRElCQUtZYzZFTlkrYW9obk5Db1FYZFZP?=
 =?utf-8?B?VlRFWHE1SWJXaEhVcG5QZldlb0ZFQTFvcTRSUlR0WXlzbi9QTkFoSG9LUy83?=
 =?utf-8?B?dVQ5QmM2ZVpFK1dLOCs5eUEzSkVIS045WnhrL3NHYWxLNEhTUzQzNkhQRW1C?=
 =?utf-8?B?RGxleHFHQUJFMURUTUlwTENVSWhCQ3htSFJwTGlBbmt6TmtXTUFmYStpcVZt?=
 =?utf-8?B?bDU2b1pid3d6dEVGYVlaenUrSVVmczdiSTR3VTlEWFRxQ1M3K2taazkwTU1M?=
 =?utf-8?B?YWF2aU9meE5WaEVFdDlaSHdjVW0vK2FhbkhOa1pPbVhJNlZqbmtyamlOR2Vl?=
 =?utf-8?B?cHRaWE42ZjVCL3BtUmppUzRvNG5peDJjZStneDhUbUhOY0tGQlhZZXBNcFhN?=
 =?utf-8?B?RXVLbDlTUVdqdmdVNWhhc3NTZml1VTV6SWVteVNTWkdXUkxTckFMa1M2TThW?=
 =?utf-8?B?c1c0a2g5bFcxSmFUQ0pXQVRDWXNrS0FrLzJjNlpJK2dqT25QYzV5Y0ZTei81?=
 =?utf-8?B?dnJMODVybjh0WWMyQ3pHQlhBYmdlOW1UZVRrNnVYTWtVOEtvOXFnekhuOUhI?=
 =?utf-8?B?K0VyOHJXSmh6VFJlZ2FLbUdlL1RlQkFsd1MyMGlrNlliZlZDblBpQjJINlhj?=
 =?utf-8?B?bTRHWE4ycHdxcFR3NXRlWjRpeEZGVjNOSVNmbFFWQ3p0czg5VkJydUxqNVFG?=
 =?utf-8?B?N0xGbjlMKzdDS1ArcXlwdnNhYmZpOHA3cjZFQkNWZSt5aGRJNFgxUW5RNyt1?=
 =?utf-8?B?NG5xeVNYK1pMS2wxUTRLc0NKdkZMcHJLdVMvQTgzM3dybk52ME44bVdoYlZx?=
 =?utf-8?B?WXFLNk9BMU9zbEdOeG84TlVVYkxTQ0NCc044RXBWczdXYi91dGtvb0lud1lR?=
 =?utf-8?B?QWFkWWhxUkJ6aTd3dEl0VDNrS0xJZTVaNnJkQis3TUlsYVRsQ0txaFpNajlw?=
 =?utf-8?B?NDZsR2hjOG1OODBRb2dvbmRFdVY3L1c4dmJSRVlTOGRIbXFZVEhqSjlDYm5U?=
 =?utf-8?B?cHZXYmZzNFpOckw5YU9nVW5DTzBEcXdRdnlMMUlhTHFiamdiWTRXKy9GNTRY?=
 =?utf-8?B?SWJqM1hKYzBZVis4cWJIbWMrcmNiczhQRWVFcUFKWG82ZTM5dzNoYmJDUkNZ?=
 =?utf-8?B?bmQzeDg1aElkMHZSbld4UjNhQStsRlBBWEtjaVdxYVY1cmlwVVpoYjZNZGVS?=
 =?utf-8?B?WThyajF4Y1c0YS80UEoySGExeXVwQXdiNEJOUnN6M0Y4blZ2Vklkb1V2RzJJ?=
 =?utf-8?B?ejU5ZnREQ1dyV29iYUNOSkx5ckNsQVAxalg2VmdaS1pRWGJkclNrL2dGek5M?=
 =?utf-8?B?K24xbnVpNVB3dXN0Y2ZnRU5xSlA3UVlTRzRzQWZUdERNTmUvZUtKVytPaEF5?=
 =?utf-8?B?NjhIZnF4bEhWZk5CdUpVL0FEbjRkUGNoZGVnRHh1dytiRmpmTUVNVXMxaE5j?=
 =?utf-8?B?ZkNTVzkyWlc1U2FRN3ZXQXQ3VUtrcHpSRmk4V3JGY216a0crSVB4MnBTL3RQ?=
 =?utf-8?B?ODYxZmZZUzh0SW5CS3JYbEhuT25nWmdEQzBidDNnTXJud1hqUFVPMk9oTnJz?=
 =?utf-8?B?eUdsQ2NHblRmQTFVMTBlUERmNnZrT2FqY1Z3U1ZPTDhFU0dHYW5PN3NzUE1R?=
 =?utf-8?B?Z09jQXpaOVpzcGFCOVIxVVgwc2lDYmpwRmNBRGE5UldKbHJIMURrcVRlcTdM?=
 =?utf-8?B?dXRDSDIyUW9IRWE5cmhGejdGb0lEUXZUbUtFRkgrdEk2V3ZMRFVDc1Y3T1dB?=
 =?utf-8?Q?/B5CWO/3UeQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RocmhEOW91WTNhbXM3SllxUSt6NXhUTC9KNHVuUkFER0Q4OEkrbDB1YWlz?=
 =?utf-8?B?N2trYmNmaXhaK1hhZE03QTM2ZzIwOTQxMzRUVEsvZ0FWeXh1MUhCWUpRM05a?=
 =?utf-8?B?WEZaelg5K01YVkQ4djRmS3pMUExnWGo5RnVUWU80K2J4RGwwbmorZ2FNUFNJ?=
 =?utf-8?B?M2ZSNkFLYU5BcEFGTUVseC93VE5IbHRJMGExWVA1TCtSNG9UTUg3MzJrdUxm?=
 =?utf-8?B?a3R6MVhFZzZTTmpPSldSY1djaXowSHBtWDFNSmFqU0JFQURra255ZUUxVWZp?=
 =?utf-8?B?dTVRMUhsYlA4WXE1NURvU0RqWlR2T3FadlIrNjZYNSs1Z2tBRXZISkVFaWo5?=
 =?utf-8?B?OEozK05JcHdpYjZRQWxpenE5T1Jsa01IaTRHKzAxY08yQWI1NmNLYkJMV2wz?=
 =?utf-8?B?UnZXREV0TTlWYmxzNitJQ2tWdmxTd2pENVVKQ2RtK0tUYXRhaFdTeGVsVnV0?=
 =?utf-8?B?bkw2RVhJWUY4WXFSVkRUTktuZmVqV0xXVUk5T0t2M2ttazVoL01QOStCSjA4?=
 =?utf-8?B?cmVVTnBoME1lTEVFcmFxV0ZaQlpMS1VLK2JmS2V1YjBrTVl0WENzalpUam5x?=
 =?utf-8?B?WEFBUVVRbWhGNnlXTVdDUFpzT2VIZExQVngvMWdHTnJ4cmx6bkdYYk5PVTlV?=
 =?utf-8?B?azVHSXgzeW9lZzB5Mi9vVlUvaEhKUW81clV0VmhXT2UrMUdPL0dkNDh0N1FI?=
 =?utf-8?B?UHdtR0EzSFp0REE4S2FnOU1saTZwWGVCSHhkTHJoODhNNzA5VysrOGRGcmZ4?=
 =?utf-8?B?Vk9aYWZ1UmI4Qmp0dWkxREY3TnVyWU5TY29CVkswS2JIMGI5bW42d1JzSHht?=
 =?utf-8?B?QXZRVXlCa2FxWTJSbnFLOWFxQVg3bnh1YjNMdnlvRG1lVENQRVEzUlBadWNG?=
 =?utf-8?B?Ri9wbEpWeFRGS0RIT1djVzAwQWhvYjh6ekE1UUlMZ0FoWnpNZFd3aDRvNEVj?=
 =?utf-8?B?THU4OS9Eck9JSnlxSVErWVZleXRoRGhsWjY4ek9CUm9LMWNiNjdkK0N5WWRM?=
 =?utf-8?B?UzFBa1ltNktaa1pwdDZBZnN2T0lKVlRaL2czSGh2WG11amFodmNEK0Jtc1hX?=
 =?utf-8?B?dk9SRmZYTXY3K0VhUE5pRVMxNDlaUSszeFNlM1BQbnMxUk13ODVGbThoT0tq?=
 =?utf-8?B?QXdtaGtzc1BWSTRIT1ZLc2I4Q0k4WnJwQWpmYnN1SjJ0RXF0Nmh5ZDBzblZB?=
 =?utf-8?B?czQzRHlUVld5ekJDOUhjRS9ZdXIyVGxrUTc1aWFIWGQ5T2VqQ2w1YTVSRnkw?=
 =?utf-8?B?YnQ3NDYxdHRjbktQczF3SGVqUGVQMnhNTGUwL0M0WHdLajVaWmlWb0xwR0Ry?=
 =?utf-8?B?WjI3QW1OcGNsanlXaStjbkFQRFMvVzBwQStFK1hPb0h5SXVRRnMralNZQXNh?=
 =?utf-8?B?TXJYd09XcEpnbjYveExSTndDRlNTR1NUNUliSitUbFVpaDV4Y3hGRk9JNENn?=
 =?utf-8?B?b281VGIwT0tyZVBNT3VuYUNzcVZMdGhLbTJRRVYvekFwcDZWNmpGT0dEYm5n?=
 =?utf-8?B?MExPSTBZV0prZEVWdFZVMzFpSEpTbVJVYldiS3RMTGZXbmsvS2ZoSGg3Q0tw?=
 =?utf-8?B?L3drc3NiL0J5emFMYnB3VHUrMG5NVUsxU2MvRm1LcE93QmltMU1hVzBETUY4?=
 =?utf-8?B?aGVmWVV3VDhTSjNuMHdKQ1VZMDZIWmNsbGRTSHl1QnBPYjU1MkpORFo1SUly?=
 =?utf-8?B?RVFONU56UU5ZbkJjTjRkRWpHZmFYT1dnVVZMQjhvQWh2bVZuVzFJNUw4T0ZM?=
 =?utf-8?B?NXFwSE9IdVE4MWZFa214WFNJWlBkWjJrVHpCNHRxTFFxUDc4ZnhJRHZLZGdY?=
 =?utf-8?B?c0J5SXV3SU0xZnBSSHFidTEyWERJQldLY2doTThDNVo3bmtaTE54RkRYMkJJ?=
 =?utf-8?B?QlMzZW9lckk0RjBDcmFtcGthMHE1a01lbVdwazdEVGZLeTJmMU1vTVgzL1ph?=
 =?utf-8?B?ZTlDMTU3R3pMWHBqYUthSm1GQ1VjTjV4WXZIQk1XMW8vQk9lNHE3MDJKOFpQ?=
 =?utf-8?B?N01QOHJZWWFFUW9FNmRJWEFvWmNoWTlTdG1HYjRNNng1MkFQN1hFR3p0Q09U?=
 =?utf-8?B?NTltTi84V0M5WHAvVkdhcmdBUWhFaGVzZnpuZ3MvUjUxanNhbENDZG5ZbHJW?=
 =?utf-8?B?b0N0NzdwRHlnSVVKblJmd1RtV3hWM0w4VFZLemd1VmZlZ2NGSW9UWWtZQnc0?=
 =?utf-8?B?dnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839b0b05-a9b8-40a1-9b79-08ddc914f188
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 11:43:14.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xETtI6lduAZCO3lYKbDzXpt5xyAvTf5kIRdn9hemKxbcRsGmZZ6ZD2XpvtXqTcsrUYjXGzUGRQ8PSE31UwvaEj9uJIeeE4YVELCdE3chZr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8608

Hi Neil,
    Do you have time to help check if there is anything else that needs 
improvement in this submission.

On 2025/4/3 16:33, Xianwei Zhao via B4 Relay wrote:
> [ EXTERNAL EMAIL ]
> 
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add pinctrl device to support Amlogic A5.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi | 90 +++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> index 32ed1776891b..844302db2133 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi
> @@ -4,6 +4,7 @@
>    */
> 
>   #include "amlogic-a4-common.dtsi"
> +#include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>   #include <dt-bindings/power/amlogic,a5-pwrc.h>
>   / {
>          cpus {
> @@ -50,6 +51,95 @@ pwrc: power-controller {
>   };
> 
>   &apb {
> +       periphs_pinctrl: pinctrl@4000 {
> +               compatible = "amlogic,pinctrl-a5",
> +                            "amlogic,pinctrl-a4";
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges = <0x0 0x0 0x0 0x4000 0x0 0x300>;
> +
> +               gpioz: gpio@c0 {
> +                       reg = <0x0 0xc0 0x0 0x40>,
> +                             <0x0 0x18 0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_Z<<8) 16>;
> +               };
> +
> +               gpiox: gpio@100 {
> +                       reg = <0x0 0x100 0x0 0x40>,
> +                             <0x0 0xc   0x0 0xc>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_X<<8) 20>;
> +               };
> +
> +               gpiot: gpio@140 {
> +                       reg = <0x0 0x140 0x0 0x40>,
> +                             <0x0 0x2c  0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_T<<8) 14>;
> +               };
> +
> +               gpiod: gpio@180 {
> +                       reg = <0x0 0x180 0x0 0x40>,
> +                             <0x0 0x40  0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_D<<8) 16>;
> +               };
> +
> +               gpioe: gpio@1c0 {
> +                       reg = <0x0 0x1c0 0x0 0x40>,
> +                             <0x0 0x48  0x0 0x4>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_E<<8) 2>;
> +               };
> +
> +               gpioc: gpio@200 {
> +                       reg = <0x0 0x200 0x0 0x40>,
> +                             <0x0 0x24  0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_C<<8) 11>;
> +               };
> +
> +               gpiob: gpio@240 {
> +                       reg = <0x0 0x240 0x0 0x40>,
> +                             <0x0 0x0   0x0 0x8>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_B<<8) 14>;
> +               };
> +
> +               gpioh: gpio@280 {
> +                       reg = <0x0 0x280 0x0 0x40>,
> +                             <0x0 0x4c  0x0 0x4>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_H<<8) 5>;
> +               };
> +
> +               gpio_test_n: gpio@2c0 {
> +                       reg = <0x0 0x2c0 0x0 0x40>,
> +                             <0x0 0x3c  0x0 0x4>;
> +                       reg-names = "gpio", "mux";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
> +               };
> +       };
> +
>          gpio_intc: interrupt-controller@4080 {
>                  compatible = "amlogic,a5-gpio-intc",
>                               "amlogic,meson-gpio-intc";
> 
> --
> 2.37.1
> 
> 

