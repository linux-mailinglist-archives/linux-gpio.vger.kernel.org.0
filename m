Return-Path: <linux-gpio+bounces-31430-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAKMCyo8g2ngjwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31430-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 13:31:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA6EE5D2E
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 13:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA130303D2EC
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 12:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95A883EDABC;
	Wed,  4 Feb 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ECr5ONsN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E41314A7A;
	Wed,  4 Feb 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208114; cv=fail; b=miOhUlNVNd6YQA9cADjvFUylDZFblyWNfyxXs++LvDtfZwt6BiARES7Cr48VayIZWgehyW1fxNxasIYyNpukVeZqmWt4vT/2FtKxwZMubP6Sl+Ezo7mChxWR9/lvDV/96ojomsQWtkooizG8rE/JD4toRWBZBc54/N4DnFr4Ifc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208114; c=relaxed/simple;
	bh=48e0RV9XSciPUjUw27+VIwFjH2cq14UniD46kwOnHP8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kDNTCG4O0cJigJ1tMTrXth8Qy9vk0pneRvobxTRcSbEw8vm5o9c3B+E3I7P0qea5UbhO3CoP9Od3e0Y+PQ2bamIPFHH2ohMg5e/MBaPLSE3QKobBmzuS+oPYZzsFOxDBpktKbZS4MuwmPt8G/4cnQgcy5JmVApgC2IcuEbNDsso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ECr5ONsN; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSbHoXWA1rwK/Q2L2KrthA/uY8+u/gY7xgcwD3kz6wfMaFSFgh5Nh4/+1BEffhfMogFN5e/+QMOqCLTCDMMXTq52+xhXv4TJjHikwbFVfxUz/SGafp9kbSRIMRiwbNbtwDReL5zUa/LZn54wjyvkchYBqz6GHhZL9Q+kaRZE22KahU2DIw2gS2Gb9ndO7S8C4eUJjjTdedOe8TBTSa/DS5BW6smPjl/YXd+b+yA7nBZEgm0TdRDygQId9jG5ZTOCFoB41Ug8X2S6xjvoCYbUOcuuQ402ulyOtEyVPCrVVDPCvxxTDeGF1MUWo2nOqCjTKMtMu7sHLIm5AsDCAKCMtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQL8eioVm4JQOoopAp35c66ByPDWxnXcGTZpSje17ZY=;
 b=f4stqJQt7VZUJ1VfmrtLkJSGfjIPs5EzrOlPEaDWqsXjJbHCPLhYunnhf+CtGwNhqwhxvyL4bSQKsMK7C7kFBKKvY8WJxQLsT4xihq2LCVx2N0lYBjCxdUSlZgTm/RNaO/3qrOlqONNUXm65OdF6QAJkjK0h858htPqh/VpP2QWibMi2Dy96CCR+wlQtvcHvnqI2i4J80p4r5eTXoiwDU3nfj8OvQiZxHNp+fQPJcuy179kcSw9+SypuZ2XgRLS5ZP7MyUTc3x4ljrEqFRkkSG8mzdEq8tt2BgaIy2gilUioofuowV3LshMUW6/Bok/rgkFj5yPmGmF8YJLo67qodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQL8eioVm4JQOoopAp35c66ByPDWxnXcGTZpSje17ZY=;
 b=ECr5ONsN6wlX5Ls8Q5t13ox7N4jeZynnTTnkvG7ZP0ySLJ665TUjq2PrE3WdaCoKbbVmvZFMYII4leQvqBcFTYWkJPIZ02ixVJanWsWC6J/PoXP1oZGSyP0BB/nD0PjPirpO8cUUyem4oRcB78BDP4So+/oNfYMy6tlZvYKy6xqpYyYLadLOcrYEM6BXkvCWSUMUu5Ue/q02XGTa8rli8Liq/7I8lT8ooUlIcOeo9WjMqyNf1DxPYzhkTM5/F8e4L6jQG/Zzy0eZ39sNXG5cdMzgEEzI6KrANl6IyqAONu8I9/oS6qz2gTjlWjBwsMtpLl6O4mNbDvj0WqrCiEcPMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by VI1PR04MB6847.eurprd04.prod.outlook.com (2603:10a6:803:134::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 12:28:25 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 12:28:25 +0000
Message-ID: <4cdba05c-f4aa-4ec1-9a73-2c0983c1aa73@oss.nxp.com>
Date: Wed, 4 Feb 2026 14:31:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
 <20260203-dev-b4-aaeon-mcu-driver-v3-3-0a19432076ac@bootlin.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-3-0a19432076ac@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0302CA0027.eurprd03.prod.outlook.com
 (2603:10a6:205:2::40) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|VI1PR04MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 173a876f-5939-4d16-41e9-08de63e8e456
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzZoZ3ZNd0R3Slh6a0xlcUN2d2xVeHE3Tkl3R0c1eVZGc0lQYVNmZ0hjMnl6?=
 =?utf-8?B?RklWRUxtTDRpci9LcU9IWVJUS0taMENFTDhVQ2tpQ0p1RUlocUNsdEQ3VXBW?=
 =?utf-8?B?WExQNGh6UFEzakZ2ZTZUMVl3M2tnNFhTWVpUUm5ZcFZDTEZQUWdJUUtKOXIv?=
 =?utf-8?B?Z1pRVHFHbUwwOTAxTkZ0VjhwYnVYZWR3bTB5QUFPV2hCY1F4bEU4Smc4Qk9x?=
 =?utf-8?B?b0lUMmo1V3YzcVJaQVU4QUs2V2VjL0pRTlZGT2dURS9ZemJxbXB1SDZNbFlh?=
 =?utf-8?B?aC93WGIwWlBSemdxMnNKQjdOTnhpMUtrMjVDYS9vakNtY2V5VkpQWk9vSUh3?=
 =?utf-8?B?dWQ1QmhJaEVJcENoUXN3ZU5PZkFsdUNkaitUdWVLUnhHT1pFQUE3d0VyTXo1?=
 =?utf-8?B?bFhtT3hmeUY1TzBvM3hQWFNxT2VEMnB2V2JvRSt6RmVsSjlCbG5NZUdnVGZB?=
 =?utf-8?B?Y095dUx4aG1xb1NCZkF4SGJMTXltc3ZTQ21VeVduT2NLMC9iYWEvajRTVE9D?=
 =?utf-8?B?QU1TK282MWJGc3E1czcrRFhOWGZ5ZENuMng4U1ZVVWtSRzFja2RBSTZVWG1k?=
 =?utf-8?B?UUV2Y2EyMy9oK24wWE5qelBHelIrQ05Ka0JNVUhrUjNVUDB0WWZ5eS9XdVVs?=
 =?utf-8?B?bTluam1mUXVGZ0JhZEpxTDJRZW9PckoreUNjS0JWVFFNSzJEQ3JxbG1mbDZE?=
 =?utf-8?B?VUYrVUpaUjVkeVFkN3UrK1d6bFFUdlYrSW8yM09ORWRZU1ZUKzlVYm45WlNo?=
 =?utf-8?B?Q0lZZkNac0tVYUZYeGxlWHlCVzZJY2xDV2hyTExUT1VCbUNEdVhaL0lsclFr?=
 =?utf-8?B?S2M4OUE1RGIyMkNwRXBBZXFTa0NyNkhIUDhZeFg4RzZYaTZhWDBRZi9zK2F4?=
 =?utf-8?B?SXZEeEVOTHBrWkIrMXM0K1NMYVZ4VUVqRUJhNjJkdjVmekF2NkdyQUhvMHkr?=
 =?utf-8?B?ZTRJTjZXM2NsOVROMlZ1WnFZK1QxODY3OXJNeGZwN001NWoySlRUaGVwWVZa?=
 =?utf-8?B?NFUvTHBBTXZxR0cwZzkxdEwyRkhGRzJOaEpyc2xNVmMvbGVxb1lSWlFFbW9I?=
 =?utf-8?B?L210YjJIazl1NDBNdHNIeVF4Mk9tb09tR3lYQkw3alhIMWIvSmp1SVB0dGcr?=
 =?utf-8?B?MDR2RFlBcnRBYlJlTWR0VVJIYUJnTjZBbUMwS3R4RU56dVpVWWR4WGUvbnB1?=
 =?utf-8?B?SWZVZHEvT20wSkJ6SjFucExLOU5ONWN2cFBlenpOam9hQ3VPVWJGUDNsbkdw?=
 =?utf-8?B?anhlamVYWWNkVTRBWDM1V3V2M1ZNc2RtTnJKOGxFOUdpS0hKWVp1Y2l3ZWRy?=
 =?utf-8?B?bTJmMWVMbUhIeTJicHBYTXZ4MnFGVlhYL21WTnNocTRZQzlNQ1BPRkZLMTdM?=
 =?utf-8?B?MTBjazFpN2JFRVNEU0JCdE5CVzg3Z2RiMWgyZHBzZ2NCc2Z6QnV1V0tZckdR?=
 =?utf-8?B?eEhacXl6QjltWmVZRFovTTduQUxyTEVrVjgxN0UxQy9OSmRHNGlmRFgyZEQ2?=
 =?utf-8?B?V3Z0aWI4MzBoaUVhcUxDNzJGWmlxTEdEWVRaT0JhQXB6ZWFUVXZOMHVSb3ds?=
 =?utf-8?B?V2JtWnNtYUdiaXJWendCdC9mOFJ0Y0V4MnVZbnhqR04rbkNjWkQyRDJZSm40?=
 =?utf-8?B?emdYN1ZjaGF2NHZlSVlicVN0MEZjeG5jdm9GTVhtMHREbytPeVpOZlFQQnls?=
 =?utf-8?B?eWRTbHorWStTQWo5d0E3QkZ2R1ZKNSszbXlVOFBZd2hXYS9YakI5VzNrQ05n?=
 =?utf-8?B?dVJlU0pucGFFTTYraTd6bENQWE1Hd2JEcWFVNnVOS1UrNm1tTElmbG52S0ZQ?=
 =?utf-8?B?QkYzK25oL2JnZnlOdE5JeE5kcDgvWDJ6NHN4bWtxZWxVMG01cE1Ha3lQaTEv?=
 =?utf-8?B?aENjb2tYVmJpcDAvcW04Z2ZqeTFXblRMaGwrQ3MwRC9vOFlMZUxjZlo0enFY?=
 =?utf-8?B?dTJVSzd2a095TlB5WFFRNng0c0Q0MVBiQ3gwaGdlN3EyNENUbkFLMVBKYk8y?=
 =?utf-8?B?SUR4SkVsakRKT1hnekhOS2lUd3lWMXQ1czlDMkJQRlViRUVhczE1dWI3K1Vp?=
 =?utf-8?B?aXAvNkZRQVdUeUlTblY2MGlVb3dIWEEreGk3S0NuSjlvb0tYOEpBSzZ4SmpC?=
 =?utf-8?B?Z01Ic2FEaDhlZ3dsMmROL2NXV1puUFgzdkluMHNMVHhnR0JnaUJTQS9tWjAx?=
 =?utf-8?B?aGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjZ6SkxsUmVlZ2RmTXhNdHhFMHJiQkVnckltVURPaElCSk42UVdjbmJubTdW?=
 =?utf-8?B?TEdJbjZHcVVXYmh0NU9IUnVUYldVeUd0ank0VG9vZGRIVWpkK2wxNmFtSGdZ?=
 =?utf-8?B?Snc5WWZGcnVuUzlUcTV3Y0h3R0FtREJ0QTBEU0ZoSURWWkVyTElDZUI3N2hp?=
 =?utf-8?B?aStHQWk2Z0Y3RHNBSE9Pb1pWMUxQaVJLWUtqTmZqcjRULzNDLzdLdExCbG9G?=
 =?utf-8?B?Z01rNmk1TmNQL0Eybm1JVFBWV1p3ZVVGTDlsNDFOL25rOFRFQjBFdUNUbTdT?=
 =?utf-8?B?K045N05hVXZuNEZ4MnpmRHY1bFlNVXhpZ1UrMDJnYm5taUFvdmN1bXhZK293?=
 =?utf-8?B?NEk1Uk1kbmNSYlBOTi9SVWNCL3paU2NDbVlJWVRIZ09DQXNpcDlBa1FncHJM?=
 =?utf-8?B?VTh4SGFjc3IvME1LTGxkQWszbFFMRzdQNnZIQ0VybEIwQlVTZGRTbm1kVU9z?=
 =?utf-8?B?d2xRNkY5SFNwYmF6NlZuLytBbjFmS2tMNDZIcVQvZjZyUTM4NUoyZkQ2dW54?=
 =?utf-8?B?MzgzOXE5RzFseFV3bzVyclVBMll6RXFUTitKdmpvSEhuY1E2ZG9TZkFmSHhN?=
 =?utf-8?B?V1VFcmF5QjdlM0xsYk9mMjd0b0ZOajRCMjVWaUE3dGlMb1hSMnVrZk9nQkIx?=
 =?utf-8?B?V0V2V3VuUk9EVWRwT3pRckVIbzl5ekxEQlBBbEdvaWY4YkgwQTdlMFRyOWo2?=
 =?utf-8?B?R1Npdm40OVhycE1XNGtDNmIraXFuN2Vuc1RoaEUxSnJaa0lBbVViVWxwMVU0?=
 =?utf-8?B?VVFtNDBnTlVhcGV0VjNWRitXYTIxYk4vbmMydm5qYSt6THZJTUUzL1JCWkRD?=
 =?utf-8?B?SHlUSm1WWGlGK1NPVktsZXc1VER3RjVpempqVmltTHVyMmdXOHY0V3prLy9L?=
 =?utf-8?B?d0RLUjYwd3gvc3EvZUF2dStSdU1yMWRxK0lOS1pQOXV3UlJheEJ2eHprWVhL?=
 =?utf-8?B?V242bWhaS0VsY3dlc0NSM0lvc2lEK0ZibzhSdzU0Wm00RE9tWFlscXV2dnkx?=
 =?utf-8?B?RGZ3WE95MUxuVDlGSUJSTXRCWEtwQlhvTE51OXJ2M3BlNjBlb1hsdE0zUUox?=
 =?utf-8?B?QzdVNndlejBhemV3MFdDZzhDTklZUDR6QWxkQUpvcnJvSGhmdUlJd0VRUzRy?=
 =?utf-8?B?OTBtNzJPa05VbHJUdlZ2VUkzblZnVEdQQkdZMjhBSy9JWU9hR1huTkdLckho?=
 =?utf-8?B?QkFYWlVxMEpuMnhuYjBNQ3pyelhEeXp2NmhoNVRqdkUrd3dOOWdobVhSUGNn?=
 =?utf-8?B?Y3FKTkk5dTlVTjRFcDhYalphLzNrRmQxWmwxTEN1WHlzeFo0NjdpampwWlMz?=
 =?utf-8?B?MTBOaEpmc3Y3VVJuYjNoZzYzNFRXZ1hCVk8xazVNckhWbXZ6eFdqdGloQlYr?=
 =?utf-8?B?UXFBcVpDcmcxWFFvM3d4bFV1SmJLVDd4S3NTSlVVZ1VZc1V0TVEvYm1zKzcy?=
 =?utf-8?B?enpORWQ0N3F4UG5hNzI2aEU0VlM3czkyYmFHR1BDcndkVjZjSmNFNGYvOEhX?=
 =?utf-8?B?VGhRTFRGcE1LaFNLWlh1ZFVxM2Z5b01jZm1RNE5MLys5Ly9KTVZnYld6NzRv?=
 =?utf-8?B?VFVuUHF5WGRDSkRFRGxvcnEySGxXREhqUlgxbU9Bd0Y2RGttV1YxMWgrMVow?=
 =?utf-8?B?NzF3OWpIbWgrL1NKYXNDS000NWF0UkRNTHNOTmhVNHZNVVRzZWEvNW9Rd3Er?=
 =?utf-8?B?WG9BdEtveHNjazVabThvc1BsMmtkeVIwSVR1MkVDeVhCaUZOdnU4ZTBncGd5?=
 =?utf-8?B?TUFndUo0Z0dWckNpS2tiODFDeHp3bjJ6Wm9qOEdTeUlQYWFjaDg4c1ppTVdC?=
 =?utf-8?B?cXlZVXVyWkg2UHp2dFFPT3Ira29wUW8vZnR5NjEzM0VBUzNwQzJlekpEajAx?=
 =?utf-8?B?aE81RVBOVW5ET0pHaXFKNjdYZ0p1K0VMNDNnYkJLUkxjalBJQzVqU1d0ekYz?=
 =?utf-8?B?Q1J4bDhiNW1EY0FtY09WZkxCNEFmMVFyUmdvSTJoY3ZiTVNyMFRZbkErZlBi?=
 =?utf-8?B?MjRWU0tOR0tsUFJoMFZ2eVpBTW94QXlWRHh1MWFNeGJUN0NMbHpxZFF0alNl?=
 =?utf-8?B?Wnd6VnlIWk1XVlpmZjVoZ0hTeVBmekJWUjRadlZDcVZNcWFlR0xoVTJaNUQ0?=
 =?utf-8?B?THRVVlZLSWNJcGJPTDF4RWEybVN5akpYUXdCY3lCT0dhZWlqUW16KzM3VlFN?=
 =?utf-8?B?RzRkc25rbEpNMUxKQnNhK2ZkTlBHVDRZZWYwRy9aRDNBWlh4VTIzZUxkNE9Q?=
 =?utf-8?B?ZW5LYi8xajlGTXJsR3RZWTREUndnbENRbHhPd1cycFY4U2xWbzk5dnlML0Zz?=
 =?utf-8?B?S09oNi8xMGZVL0YzSjlNNjZhS1Bka2YweE1RMHlKaDdhaCtvQzE4Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 173a876f-5939-4d16-41e9-08de63e8e456
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:28:24.9417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZrPhc4NnvXPqfTeGp+yKiD6k2U7IT7l2eFVy5vfJNglPqGYSq9Zgu3/UA6UyD2ZXVTgvACAIA8DMuq4v0J0ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6847
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31430-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,pengutronix.de,gmail.com,linux-watchdog.org,roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.baluta@oss.nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid]
X-Rspamd-Queue-Id: CDA6EE5D2E
X-Rspamd-Action: no action

On 2/3/26 18:21, Thomas Perrot (Schneider Electric) wrote:
> @@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
>  
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
> +
> +obj-$(CONFIG_MFD_AAEON_MCU)	+= aaeon-mcu.o

Looks like this lines are sorted and your new addition should be around:

obj-$(CONFIG_MFD_ACT8945A)»     += act8945a.o


