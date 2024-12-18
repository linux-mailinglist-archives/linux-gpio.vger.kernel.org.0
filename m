Return-Path: <linux-gpio+bounces-13981-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2D89F6070
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 09:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6798916A95C
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 08:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182AD197A7A;
	Wed, 18 Dec 2024 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="OBJ6x9sn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023107.outbound.protection.outlook.com [40.107.44.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E50B176240;
	Wed, 18 Dec 2024 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734511642; cv=fail; b=jowimvCrfUigoi+f9M+4SnwpE+cMj7imvwr3f0uSAmcJ4EZHTtpSnoG7UU66AV7+hSYyQ3rccpnMhXQtYmKLBWTL4Zj/qFc8mXd9j7/KsWIayvdJD5Rx84GjE/A5XnASwgUAZFRiYtN1RtBNGsIQSvD1koxga4O4PJf9I9S5rJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734511642; c=relaxed/simple;
	bh=N5yBRbiuxTh9UQx7Mb6uJ686sjkS0rmkQfRV/7sZlFw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f+e1Y6fA9OOW76tfLguDTxETUPmEWptNEeuVDEVZXza3twAkU+HcWxBbZHK0aBrJmxtT6wdbyqKdBy+FxnlzZXpVTKOeSd4n6brT45kaX5gTFO7icSvW1oscZFhteA7cFBapODSNlOQ+3cqYkjvVb2t0imqAi6OBjb5IdGKRweY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=OBJ6x9sn; arc=fail smtp.client-ip=40.107.44.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+aMDQwEnoIkdTJIGeTDRl0yFcHU74Ydrw9Tuqaq4luy2a24CDESBCj3tDfvt1d1GxAO5tRB+kQdR+n2lgIzbbFSaT2aFh/lD4OUfyKROU61gPq5ozbYbWeZ4Lr3+J3qCw2mJkdOruRNfIFCeRyfE2MKyX39ZQ+P8+2BEb1NmNXTPQdf1PUkOkMdzgGFRUQeiuqeFKjGTBA4tX1f2opT7VkWLznKWSvI+i2QAqfEYCUkgEWPvJMkYrpgtz/CwnYhFFrHZa53Uxea0FKX4uRL7mFHR4+DgsVJZyHg7nodeE9SlsVQCX3nZi1oJ/TBFpSanT3PqrBSdK79qirjuuwbVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QExBKMybdp/DuN5g9NFL0En+ouWLCr/NncOXPryb6A8=;
 b=rwsAnhurZI0ozcb2SkEmK8TCc/JrC1V28M4Q1nuTzuy/wwJBwqf+B0YEfsWQsqw8V2Iiul/PCw3nZ5GpX0PXvHWAu5rSyC3pHgcfQ44LwUpDqNxI5gCa5+6M+dP67hgjaf3zgclmd6YhXrR0VU+rW8zpayKT1jYAw6UAeiYW35SVmX7S8aq8JNOXpjd60yuw91afBtRLM68JhAewTikBBGfPjs9Z1ETPbEy4XKQN8YuXKTgvtF7cnPnN1pVk2gcXCMRirHSBwvUpeshAL/Ze0vP3f10IgnvkfBKc0RA5XKslJfbqZw0gzBWHWkUzyeR4lwEvTlssd5I3xzmF4ZkdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QExBKMybdp/DuN5g9NFL0En+ouWLCr/NncOXPryb6A8=;
 b=OBJ6x9snuBx7lI0Rt9EuAhTMwiQBjMCo0NcC9FNqu/UnXwwEvNCQFv8PD0uCOz5Bk+RpVBidgxnCqRLnSibfhEyTZzRg7jc3JGeVVcx+rZpCmq8Gj2Aw+L750i2uKiMtAeTPHRIhLtYdo9ZeXwipYv0nxlYhrIdef6KZMFLwe+h+er6yf+7zqNjHfFmi4MvrIk48L8iZlf9GsSWqswmkgtB6m3vttLedRuU1DF1snxekfHQKNYqDouTpJMDJinARqogGiaiY7DNpl7Apsk31PEWf61zCJUMVQdT69Zr6qjaU3NCo1qA+xJLtNosFSrSRrOGTjuriJMLKM0TTsocxjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7726.apcprd03.prod.outlook.com (2603:1096:101:13b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 08:47:15 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 08:47:15 +0000
Message-ID: <6185966d-ad60-48e3-b4a2-3808f3b53b3c@amlogic.com>
Date: Wed, 18 Dec 2024 16:47:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] dt-bindings: pinctrl: Add support for Amlogic
 SoCs
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-1-410727335119@amlogic.com>
 <20241217142028.GA1441221-robh@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20241217142028.GA1441221-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d5f7974-0596-4b2f-a64c-08dd1f409258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXgzamNWVmozcGYzRFY5T2ZiWFFzaUhLNkFyK1dHVFc3V2tXa1Q0U24wakEz?=
 =?utf-8?B?YmFkZWRXQzhKVzh2aHB0Q0pZbW1yOFVVVWE3RHhYeXBTM29McUxsR0hZWUg4?=
 =?utf-8?B?TlVOUm9DTlMwa1YvWThhNlczYTBESXc5ZnRFVEFRRFdhNzY5dFZYQ0c3TFQ1?=
 =?utf-8?B?ZnVOekpqeGJuMit0TkFaNUQzelgvWjBvZElMeVJNWDBSdTZBbElNY1FYVXJz?=
 =?utf-8?B?RDZDY0VVTjcvd0RvTG9sSU1vUER1WlU0V0Z0VGhkWUU3VjFkVkFMQlVrR0Y0?=
 =?utf-8?B?SmJkcHNpT3M0QnB1T1ZBU2tPY0VVRXZwQWdHOWVlUzZQOU4zZ21oZ053Qmcw?=
 =?utf-8?B?Slk3aWlqRk5LZTNCc1lIaUZ5bTlNTE1CcVhJQTRtVzNuTi9rL2lCVzgxdVVH?=
 =?utf-8?B?ZktxK1BTdjZnRFlFOGp3em14MzVSb3N1dUhZeDdIQmFmWWtMbnpGamFHNko2?=
 =?utf-8?B?S0kzenByK0l1VVlHKzhaejBSV3I4b1FabTdVSUtSZ1JDT2drRmlackhRUzhX?=
 =?utf-8?B?ZEhnU1lCSWtJTXBJeXN1MEprR3dqK1Y4K3ZmeXNKM1hlYW1KZVZhdkN4NHVZ?=
 =?utf-8?B?dTlySzZ6ZnVvVDBUMVlrUk5Ua3QwQ25ZL0pkajVqWmdVYloxWnNpZEhmZUVE?=
 =?utf-8?B?UjQ2NVNIS3BNSTVyNUZJMnIzQWc0VjRidkhoNDlzdkVGaVdxcW90dzVuNGI2?=
 =?utf-8?B?N2ZteTBEK2pBL1dDb2F1YWpaU0Z5VGZVY1hUT21jUzlCMG9MdDhMc2w4Y0ti?=
 =?utf-8?B?UnlLSVA3ZWtvU2hid01TUWxwbHB6QzA3RUowMU0vNytyY1B1c1hjMWljeFpr?=
 =?utf-8?B?YkxyMTUraDBRSnA3WVp4RXFtNjI4eDloOHhzVlZFbkR3TTFka3g5OE44Qldj?=
 =?utf-8?B?YmQvbmxsMkVBOWF4d2NHSTE4M1RCeUJ6V25xRGlaa3BpajVqbW5RZnhOL0lu?=
 =?utf-8?B?emFHNlFEc1oyYUxhOXlnR201ZDVuNW9BeTRpTkNzdW8zaytFK0Ziam8yV1hM?=
 =?utf-8?B?THFCRW0wVk16S0YwV05oMDlyUnBpZTlURHVSNjFBRjl3WXlEbjg5cUdYZEdR?=
 =?utf-8?B?OUw4SWVvcitjcjlnWGpCMG9kZ0gwVHpCanhZcEMzZTNyL2Jud2YrWTJ3cXRJ?=
 =?utf-8?B?WnRHY1R2aWpSZVlyR0o3SFhwaGdYaVZ0M3dsM282RitvZWZ1SjJoOE9Yd1c3?=
 =?utf-8?B?enJSUnhLM2Fqand4aVdJWWxHTjRKMHhpaHdlbzUwT2VURmdKcWlBNVlMaHc4?=
 =?utf-8?B?bys3aHpFdUVOUW1oaU1zckdJV1FoeStxSTgxYzdLc2pqbWJqZmh0ZDJWVDNp?=
 =?utf-8?B?RjZNRFJsVThYZjBlS2NpZGFYMXpzb2ZSVmUrUGVuUjhzblh6b2NaVnBweG5z?=
 =?utf-8?B?c0JyYS90RWwrTUZqcTNLNW90cnRSQlJjL1RoV2R3dkVQWWtpN29ZOEwxNWVV?=
 =?utf-8?B?U2hNWTFHejVCYm9QOWZkV1BpSWhuNW43alA3QTlNcU5taFA1bys2Wm03VStk?=
 =?utf-8?B?TnlZWmZxekhIL1V6RWNMN3JreGlFYmQ3YjVoOTRRNUlzWllGZ2htd2t1K3BY?=
 =?utf-8?B?bVhORjhRN0hZNUZhSFRpbFJuNCsrRktENWdSSzJYa2tzdHIxWS9RZzBkUnF4?=
 =?utf-8?B?MTNVbXlocVpIcndTVGRTc1gxcWxrTlR3UjVMZ0pzUGlqWUUwaXRBSXdmMnVD?=
 =?utf-8?B?VlJWRUNJRSs5dVIyN0NaTDV1bWZsQk0xai9jc0NOQXh3ekNIckFjYURpMk1O?=
 =?utf-8?B?TlJJMC9nMjB1QjNOVEVzS0dsZHh6b2g1dlB2SUhiN0twamNUWTVMeEcwS3RL?=
 =?utf-8?B?SVQ3SkFZRFl5Mi9mVTF1UT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eThvelk5UlBIMEw0UDVGTTgwQVZMbitWM2JqT0s5MjYxYXRZd1pkMW9rYlRz?=
 =?utf-8?B?K0ljRk5QUkEycTFLS21EK2U3QmlabmVxRjB5aTdvWUw1d2JaQWZLZ1pEVU1h?=
 =?utf-8?B?Z3pvWlN1djBla1diRkpvSm0xNlN3RDl5WjRENmNjeGJDUHY5WndFaDFtMFIr?=
 =?utf-8?B?YXlxUE5ZYXVuNzdFM0V6SHpnWTlRZTJIWDFCdCtnMXF3QlhSbWg0Wmh6aGVF?=
 =?utf-8?B?WVlVVmdYTGJUWWVEQml2NloxaUxCcVZwbm1DemgwdnUwUnBNbmRJd293djFa?=
 =?utf-8?B?RG1KT2xlWEdNRXNIbTNmSlZoZ1cxdFVyKzdWQXlpelFqYmlJVUpVbE5JZWp3?=
 =?utf-8?B?NzZGTkZPbkVEeWw4eDhURkdNVXVKZTlmRy9WYkx6UGprK0VaOVBiVnlSY0Z0?=
 =?utf-8?B?b3VneTM5MzJOMXZTaDRiMGVMNWJUcFlBN094V0trSlJKbXYvUHlLSWNEaTRp?=
 =?utf-8?B?aStsZDVCeURaajBrZmRacEZZQXhYVTBsY042ZjdLYS94L2hmV0dYNzRiVGor?=
 =?utf-8?B?OEhtS3B2RVNLb2w5WFV0Z3FGNDFLWDcwbUEzNTBGUm5qUThna0J5K3h0K2Mz?=
 =?utf-8?B?THovc2NxUUlwRFM0c2pMTy9vTGxXWkdPVnl5NWE0L3o0ZTZOSlpYeSsvcUI1?=
 =?utf-8?B?dk5sdG5MdHBEQWpHYk9OUmtWc0FzV0lIU3NYT2FwV3F3QkRyMU9IUjNieE1h?=
 =?utf-8?B?L25qcUo0WG05TnNubThWYTNXWjdkeXVsNUVuM0NraTA1U2IwblB6SUsxNXAv?=
 =?utf-8?B?UFFQejB2S0hlZmpaS3ZZY0hwaG5GSU5HWnlKMVRoaWE1bW5CdG5YSzYyeVZE?=
 =?utf-8?B?Vzkvd2dBUHNPQTk4WkE4Z0ZKTEFJRVBCWVZUQ3ZGT1FzUHNzU3VHYU5JN25N?=
 =?utf-8?B?TklSdjVPUHBnS2RsZEJVSVlyekpUdUhOdmN0QUtTeklVOWw1MDE2RnZsK2d0?=
 =?utf-8?B?dXkzTWNMWmxyOFFOZVJmQldPa1l6OUJVTzJsSkRVTFpTcTZvUEVoSHM4a3JU?=
 =?utf-8?B?N2Q2T0RoYWx1d0xJTTlkMDRQMUFIK3Irb1RuWk81bmRYTElFR1B5SzgweDQr?=
 =?utf-8?B?K0FLQjV0T0s2SUpSUHVVTDRtcDJGeGVLOUYycWsvaEkxWFNZNE5WVVJSSWhR?=
 =?utf-8?B?NlUwbjBKQ1hSejBVcU43bVlxWUROSUtmRFhGd1Z4S2IzT2tqNktBQlEvQklK?=
 =?utf-8?B?cjJrRkF4QXM1RnFvKzFiWEZ6aW53MzlvWWNnK1BZcWJrQ1ZhOGtSUWJpNWQr?=
 =?utf-8?B?M0pvd29hUDNUVUpLcnVKdUZ0WDNPdENwV0FCNlFkdVVPc2dSTTJ5RXg2UzFV?=
 =?utf-8?B?bytjaEZ6KzNUa1Z3Z3VDMG1lMW1OUkh4TkRwY3UrdHlFRnJMNGpOY3VOWjFu?=
 =?utf-8?B?TFRDcFpoMTJVT3BzSFpiK3hRa3o2VmxhKzFCeHlXNzJpanNKMks5cS9HYjU3?=
 =?utf-8?B?YmVvcW0xWjdBMkw1aUZEdWo5ZXBIODc1WGxBcUxYNVV1YVB5YnJLdEZJQWVs?=
 =?utf-8?B?b25KakdxNUtpM29vZjJDa2ZXbW9lUVVGUVQ4dDlGUXlDUGl3WVR6ajNRRUVY?=
 =?utf-8?B?T29RdXlOcDIzMFp3RmNXbG56Mk1ETVdaZnlHa3A3aGEwNExsaEtETTJXdjdE?=
 =?utf-8?B?ZFlySnNoci9kdmpHOXB0TWg5RkhsaHFKRFhib3ExYkk0NjVJNTkzTXFwaDVS?=
 =?utf-8?B?aXU3SDdqQTBDdWJtNHlKcWh4OVRCSjRYVkRVcDdWZlN2LzJMY0NGNTI2cW9r?=
 =?utf-8?B?Y1Y2aUNBTFIwS1dpTlZEMmRZQllKQXF6ejZMYnd4R2RxY1hwbitHbnZaTy9o?=
 =?utf-8?B?ZlpldjE1eUJKK1BoWDR1KzlMYUdrN25jTlpSMlNrUjhCSDAzaWk2YnYvY3NR?=
 =?utf-8?B?VXgrRmRlb1RISU5TUzdtN2xlSnVtYTNOL0twdUNCQlBRam40dmE4MGtqcm9B?=
 =?utf-8?B?aVV1WGtrZEJyTGdMVFZ6TTFRR3dqL0pyNE50YjBSMU04bEVRdHI2V1Q0SFYx?=
 =?utf-8?B?c1ZkZkFUSHF3Q1ZMNTZNNjBNeGhNYlVUdTVIZllRVmZvQTdCa2V5S296WURj?=
 =?utf-8?B?SFBkL1dlei9YeS9Ob3JMSmxvL05OT01KTVF3RzArUy8vWEhreXRCdFYzOHRF?=
 =?utf-8?B?YlNWUzYxaEIzU1U4eVNLVHJ6R3B0ZVBQQkI5a296U3h0bUtMSk9pZnNicU1S?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d5f7974-0596-4b2f-a64c-08dd1f409258
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 08:47:15.2407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNUZ73H/X4MOo4A1T54Ys9rpqoKfCcuxgdmZCmQDxEej5aZ+6j8t2RPNbA6oeS9WUezpwlRSfCBNbZrl40WBMUbLaQdhzcYXay5TrrGxeQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7726

Hi Rob,
    Thanks for your reply.

On 2024/12/17 22:20, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Wed, Dec 11, 2024 at 02:47:49PM +0800, Xianwei Zhao wrote:
>> Add the dt-bindings for Amlogic pin controller, and add a new
>> dt-binding header file which document the GPIO bank names and
>> alternative func value of all Amlogic subsequent SoCs.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../bindings/pinctrl/amlogic,pinctrl.yaml          | 150 +++++++++++++++++++++
>>   include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  68 ++++++++++
>>   2 files changed, 218 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml
>> new file mode 100644
>> index 000000000000..b0c2ae585d7d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl.yaml
>> @@ -0,0 +1,150 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic pinmux controller
>> +
>> +maintainers:
>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,pinctrl
> 
> Only one Amlogic pinctrl block? Pretty sure there's more than 1 SoC and
> pinctrl is unlikely identical for all. This must be SoC specific.
>

Will do, "amlogic,pinctrl" -> "amlogic,pinctrl-a4".

>> +
>> +  reg:
>> +    minItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mux
>> +      - const: gpio
>> +
>> +  "#address-cells":
>> +    const: 2
>> +
>> +  "#size-cells":
>> +    const: 2
> 
> Why do you need these? You don't have any child nodes with addresses.
> But maybe you should?
> 

I will modify "reg_mux_offset" to "reg", So
#address-cells = <1>
#size-cells = <0>

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +patternProperties:
>> +  "^gpio[a-z]":
> 
> This allows "gpioanythingyouwant" for example. If there is no
> unit-address, then it should be '^gpio-[0-9]+$'.
> 

Will do.

>> +    type: object
>> +
>> +    properties:
>> +      gpio-controller: true
>> +
>> +      "#gpio-cells":
>> +        const: 2
>> +
>> +      bank-name:
>> +        $ref: /schemas/types.yaml#/definitions/string
> 
> You must define values, but why do you need this? No other GPIO
> controller needs something like this.
> 

We define the bank name(GPIOA,GPIOB) on the chip specification, so it is 
more readable to describe the source code with such a name in the 
pin(GPIOA-0,GPIOA-1).

Bank indexes are defined primarily for use in pinmux implicit queries.

Bank-name and bank-index, they both describe the characteristics of the 
Bank, they just use it differently. I can keep bank-index, I can query 
the bank-name through bank-index.

I will delete this property, keep bank-index property.

>> +
>> +      npins:
> 
> We have a standard property for this: ngpios
> 

Will do.

>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 1
>> +        maximum: 32
>> +
>> +      bank-index:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        minimum: 0
>> +        maximum: 29
> 
> Consider if 'bank' should be part of the gpio cells rather than
> separate controller nodes. That works better if each bank is not its own
> separate h/w block. If banks share a register, then that's not separate
> blocks.
>

Each bank is its own separate h/w block(With TEST_N bank exception,it 
share mux reg with AO bank).

Change the name of this property to "bank-identity" make it more 
appropriate.

>> +
>> +      reg-mux-offset:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      bit-mux-offset:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      reg-gpio-offset:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> Put these into 'reg'. We even have a way to deal with bit offsets. See
> leds/register-bit-led.yaml for example.
> 

Will do.

>  >> +
>> +    required:
>> +      - gpio-controller
>> +      - "#gpio-cells"
>> +      - npins
>> +      - bank-index
>> +      - reg-mux-offset
>> +      - reg-gpio-offset
>> +      - bank-name
>> +
>> +    additionalProperties: false
>> +    unevaluatedProperties: false
> 
> Don't need both. 'additionalProperties' is more restrictive, so drop
> unevaluatedProperties.
> 
Will drop  unevaluatedProperties.

>> +
>> +  "^func-[0-9a-z]":
> 
> "^func-[0-9a-z-]+$"
> 
Will do.

>> +    type: object
>> +    additionalProperties:
>> +      type: object
>> +      allOf:
>> +        - $ref: pincfg-node.yaml#
>> +        - $ref: pinmux-node.yaml#
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    apb {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      periphs_pinctrl: pinctrl@8e700 {
>> +        compatible = "amlogic,pinctrl";
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +        reg = <0x0 0x8e700 0x0 0x04>,
>> +              <0x0 0x8e704 0x0 0x60>;
>> +        reg-names = "mux", "gpio";
>> +
>> +        gpiob {
>> +          gpio-controller;
>> +          #gpio-cells = <2>;
>> +          npins = <10>;
>> +          bank-index = <1>;
>> +          reg-mux-offset = <0x14>;
>> +          bit-mux-offset = <0x14>;
>> +          reg-gpio-offset = <0x30>;
>> +          bank-name = "GPIOB";
>> +        };
>> +
>> +        gpioe {
>> +          gpio-controller;
>> +          #gpio-cells = <2>;
>> +          npins = <10>;
>> +          bank-index = <5>;
>> +          reg-mux-offset = <0x14>;
>> +          reg-gpio-offset = <0x30>;
>> +          bank-name = "GPIOE";
>> +        };
>> +
>> +        func-uart-b {
>> +          uart-b-default{
>> +            pinmux = <3>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +
>> +          uart-c-default{
>> +            pinmux = <4>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +        };
>> +
>> +        func-uart-c {
>> +          uart-c-default{
>> +            pinmux = <3>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +        };
>> +      };
>> +    };
>> diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
>> new file mode 100644
>> index 000000000000..03db0a730e8b
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
>> @@ -0,0 +1,68 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +/*
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
>> +#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
>> +
>> +/* define PIN modes */
>> +#define AF0  0x0
>> +#define AF1  0x1
>> +#define AF2  0x2
>> +#define AF3  0x3
>> +#define AF4  0x4
>> +#define AF5  0x5
>> +#define AF6  0x6
>> +#define AF7  0x7
>> +#define AF8  0x8
>> +#define AF9  0x9
>> +#define AF10 0xa
>> +#define AF11 0xb
>> +#define AF12 0xc
>> +#define AF13 0xd
>> +#define AF14 0xe
>> +#define AF15 0xf
>> +
>> +#define AML_PIN_ALT_FUNC_MASK        0xf
>> +
>> +/* Normal PIN bank */
>> +#define AMLOGIC_GPIO_A               0
>> +#define AMLOGIC_GPIO_B               1
>> +#define AMLOGIC_GPIO_C               2
>> +#define AMLOGIC_GPIO_D               3
>> +#define AMLOGIC_GPIO_E               4
>> +#define AMLOGIC_GPIO_F               5
>> +#define AMLOGIC_GPIO_G               6
>> +#define AMLOGIC_GPIO_H               7
>> +#define AMLOGIC_GPIO_I               8
>> +#define AMLOGIC_GPIO_J               9
>> +#define AMLOGIC_GPIO_K               10
>> +#define AMLOGIC_GPIO_L               11
>> +#define AMLOGIC_GPIO_M               12
>> +#define AMLOGIC_GPIO_N               13
>> +#define AMLOGIC_GPIO_O               14
>> +#define AMLOGIC_GPIO_P               15
>> +#define AMLOGIC_GPIO_Q               16
>> +#define AMLOGIC_GPIO_R               17
>> +#define AMLOGIC_GPIO_S               18
>> +#define AMLOGIC_GPIO_T               19
>> +#define AMLOGIC_GPIO_U               20
>> +#define AMLOGIC_GPIO_V               21
>> +#define AMLOGIC_GPIO_W               22
>> +#define AMLOGIC_GPIO_X               23
>> +#define AMLOGIC_GPIO_Y               24
>> +#define AMLOGIC_GPIO_Z               25
>> +
>> +/* Special PIN bank */
>> +#define AMLOGIC_GPIO_DV              26
>> +#define AMLOGIC_GPIO_AO              27
>> +#define AMLOGIC_GPIO_CC              28
>> +#define AMLOGIC_GPIO_TEST_N  29
>> +
>> +#define AML_PINMUX(bank, offset, mode)       (((((bank) << 8) + (offset)) << 8) | (mode))
>> +#define AML_PINMUX_TO_BANK(pinmux)   (((pinmux) >> 16) & 0xff)
>> +#define AML_PINMUX_TO_OFFSET(pinmux) (((pinmux) >> 8) & 0xff)
>> +
>> +#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */
>>
>> --
>> 2.37.1
>>

