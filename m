Return-Path: <linux-gpio+bounces-22832-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ABEAFA9E0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 04:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C57B1777D6
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 02:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924DB1BE871;
	Mon,  7 Jul 2025 02:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="drnsn+he"
X-Original-To: linux-gpio@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023131.outbound.protection.outlook.com [40.107.44.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A571B425C;
	Mon,  7 Jul 2025 02:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856524; cv=fail; b=UCt56CqxY5Qu1SK+Nvht7e9iYA/FiVAOpBhdHlQXbBCJFmuUJZ10qZofU2blxuLzkMdFrsC1w37I4sDndyzxC/OzQxN40YYfA/gMzJZMR5Jvh/SWSkUpMm91rnUDecUqMMV1UhqrYYJa9PSisYC8Hu2UsmF/PJ7EqFKGLSVtgwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856524; c=relaxed/simple;
	bh=Q2I1cQihOGkuGjvAZ9HQb5o7Neex5DqOhNncg1IWMtA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TugjTLbQl1R/UOhTsvM1CLuf+jMrWzcY3P8IaTZNTttO5BjeqAg++p48ylCEX8DhGvuNeNISe9MmriCemeY8yIJLaJQ6I7hXGMpHsKN9p5UWDqKyQadPQCgGa+YLr1Jrjf73vKHH8Y5uKnkoPJwBGQGNeKEDbkJFCIxwaU+bkFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=drnsn+he; arc=fail smtp.client-ip=40.107.44.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vstk/UDkAJJba+UjwwR3QPJGUsNKPIBOy9utPM5flMaY25GOt8Q+NTscGg6EmpA95m/0iz+96Og8bLv5Nr/Qh51ZVNjdiBGgtFil4DehVOPNz9wO9MKR2s/be4VhXwFNgtao+7gxoDqYcuQGtuh0Bd4t8S9qti9OvzKey0bKnoqgWX+JJq000YwnUPRWR7Zyqg2xOXqrS/pwjr24Rd0HWQRuMyR/q1WQZ0UANuMn8TCC+jvZEgNuySEK2KH4vIzl/wYmTPLpKCGw35kgHYPlOQYI3MgjufVUtJqDSWMx+Z4WZZUJoPB5pI+4uksmi5+EnOPOcjhLl+f7cfL2W4l4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Kqn+TsRAXhRxebgtS1JnqdJc8XvITynikfdGgm2anw=;
 b=pcE/zqFbXfkilSq3XbH6Y2NQ93ocMS7jQiTDVG3ZSw+aix3ZARp4KpBcdEADY7w8qgti9z7AIxS0RFe8c82oEFJTCGReMBd4KcY1c80XOHcsiiUH/hCNzdYKnD0ZaPLw13Dy8js+C7tefmPTVp5F26lAguh0jXyBXOe8jV8FODBwPSV7860qA4+BnfLk+5YqPefbemaktWxhGDYM4+nYMXyVk1A+fVZ3x8GRRNIXeB7vepRbCRdyn+uqnTxGt1gvLFqNoNxWJglKdS4KstrDeLEqpUc6JJx9Z7f5Q65vPxClDo34krEellEcXbM2VHTS4BT66qr1qGWXGPQiTDHfMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Kqn+TsRAXhRxebgtS1JnqdJc8XvITynikfdGgm2anw=;
 b=drnsn+heLKFcOz9Rq1keQfrUSdTv4jtoJsgMeLFNZM1ivWGjKp2yYE5gyT8LtyJKU6L1tb6CGlJxCxDwvaWe5c35nlEULyZ+K6l4q9PePFt58q2X4xKQMAZ2YeL8U/+24M6cdiCykUW/7acrlqpzlpl+/GHDnnv91alxEWAVQXSFSXSeTpq9tV6GIiOg3biQPSLaoKk8TZ2WnWlkP6Dl2OL+S9p6qQ2D2uWJB/m40WZDe7cCPf6V0MqtOAopCHgbZ+GvtJ4huuv4VwRR7vfA7Bj57xvviW7riVqH4M6VXvIcjNP6FDNXzd4dB/+G8c3LzFO1PglmF1pCB5XV1najvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYZPR03MB7026.apcprd03.prod.outlook.com (2603:1096:400:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:48:38 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%2]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 02:48:37 +0000
Message-ID: <e5bd5f01-c1b9-46b9-a39c-08eb86f77786@amlogic.com>
Date: Mon, 7 Jul 2025 10:48:31 +0800
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
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYZPR03MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: da4e7747-c9f4-4a8a-f02c-08ddbd00c5e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZHpod2dFMTlBVGhlaUlOSGpOY3F0aTluM3hnRXdKV28zMWZscTFOUThiWHJR?=
 =?utf-8?B?S0luN1c0TWw3eWtvVGl1cDQ0RGtFbjh3TXgxdmlGcXBQS01Qa2s4VzNxNVIy?=
 =?utf-8?B?YXhTVHNnc2FVNVY2M0M1WVZweHMxeFlBQjZXMUdiUEs3TklyTk4vdWZYMkQ5?=
 =?utf-8?B?b0drNEtjbjZTcXRHdTVOTkdQYmxrREpHZ2FLRWZmZjhoZitjSGQ5VDErOGt5?=
 =?utf-8?B?bk5TTU9yMXFIZ2loMk5GRW0rb1lxd2ljNDdZSHdhandzZytPSTNabG1hc0g3?=
 =?utf-8?B?N01DTHlSa1NXNzVXWkRPZkVKUE9HcFlXVGRtWVprbFdxa2F5RFJMVmFheHNn?=
 =?utf-8?B?bm1tY0pPVTdkUWwySmhJWW9UbmdCWXR3eVRaS3NjTjJKcEJFcE84Y1Y5Y1pv?=
 =?utf-8?B?ZUl2WjdWeWxYY0dsNys3cHpjUkkzSTRGOTNXSTB1cTY5V21BVWc2UDNLS0Vk?=
 =?utf-8?B?RnRRRnBYM3NpdE9XVExUM1k3YWhQNjdUVllzbzB3VXUxc25nYy9XSUd1TTZH?=
 =?utf-8?B?RFBPZHRLRDlOM3RsVklUYTRVRm11eGpFYUtBMWVUbTFoN2p4UU1aa3VkZktx?=
 =?utf-8?B?cElsVzhLMEpTa29nUFFvODhGZnpsQkoyUWtMS1FvRTJvWks5VWROd1VEWURZ?=
 =?utf-8?B?TmtRTHFFK3RHSDdmUTR4OGxyTkhYTEVRLzVQZVlvMVdjdGFzcEhmUTlEeDBM?=
 =?utf-8?B?dXIrNlJjZU4rdDZ1YTlPalFQT3ZWb1V4andmaDRGamJYaEVrNjEzL3VDNTFo?=
 =?utf-8?B?RUYrM3VTOVIwM2pzdzc5ZjB0Z2RWNG5aUG1mWG12MnRMQWkranFxd1lDWFFz?=
 =?utf-8?B?TXhwcDkxeTRDYVlLY0prdzQvaS9nK1JCU0xWVUY2aDZtN05rQ2ZLVW9IWHp4?=
 =?utf-8?B?UW1iRHppNVpIaTJrQUhxbWhUVWVZS2c3UWJEaGlTWTIzMlkxZnNiSWZZSVRR?=
 =?utf-8?B?aEx1S1RwSzRTVjJSamdTQVNwYlBWcmNybFJpOFhCVFN4b2Q4YWFZR0RoZ1Q2?=
 =?utf-8?B?SWJxeHhTN3oyeHlBaEFQQ2tpODBqbVYzMVZYVUZrOWl0cm1xN29WWmhIOXpP?=
 =?utf-8?B?QmJ1MDJUUE1VWXpnczBpMUZ6UzBoTGdJc2RsSkRjazFGVDZyNkFlSnQ5SnpM?=
 =?utf-8?B?QmwrdXY4cHBnK3FFblFPeXBwRXQ0ZFlZRHh1TWx0eWh4bVFPWnRrN3YrNWYr?=
 =?utf-8?B?b2ZUZEUrZWRwaVo5K08ydC93NGtrY2JRME1ZaHZQSEEyWVlVWWRNUVMrYWxU?=
 =?utf-8?B?d1RzZFZveFpnQk03U3NXOG43SGFXMWpZL0MvaXljS2ZDMThZemtaeW9vaWZs?=
 =?utf-8?B?TkpZbDJjQ0tDYitCVC9TZ2RCNmNzMEJXbjIxUnRqMENqSWk5Nm5mZmljV0Nl?=
 =?utf-8?B?d3ZaWjFUbzZIbXZ4blJXUG5ud01WREo4NzhTNGRselZJZE0xMlNteUVZOE9u?=
 =?utf-8?B?Q1hDc0lVMmYvbWExcGFPa1dkQ2UrZ1RVSURVZ0tTaHJFa2RVMnp6SEQxdDFQ?=
 =?utf-8?B?eThXdWw2WWJBUmJlZGU5dUpnV2NrV0hiN3VMYm9DVDdsc09mM3Rvc2lSb2RL?=
 =?utf-8?B?bGxQSFF0RDNJR3FCVjhSeGlIS2ozWXlDdFdwdUpnSVpwUXNFSS8vekJiZmJm?=
 =?utf-8?B?dFNudFBaS3EvQmdud3BONjRGb1dYKzhCSzNHTmJJSjRtOHRQajZYZHo1dEdw?=
 =?utf-8?B?Q1ErUXRRMFo4bnkvblJpOEdsWjVBOG9NNnR1ZGdmcWY0UUwzVk12S2tIdlZT?=
 =?utf-8?B?N2FnYWZibnh1VmIyUEpVcU83aFBMREthVm1LeHpSWlFzYnlsN1dkSytWQVBI?=
 =?utf-8?B?QXMyVEJtNzBieitHallEUGhQemVDeEcwRUpkM3BsUXgrYUYrb1MyNXFza0w2?=
 =?utf-8?B?NHRJZllUSEpDUnhHdG1PNldrN3hIZjBZRmFmUG95YjVHUDVKZk93WHhyV09P?=
 =?utf-8?Q?Bh/Ye6l7frg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3VPQVdNQXBKcEkwSUN6TDdGSVc0VzR5RCtyWkpIVjN5Z292TStrTi9RL3dS?=
 =?utf-8?B?S2JYUXM4d2gza0c3d2xhTkZCelNrVGFqODM5b2lkdmx2b0MyTUY5eHkyTmFm?=
 =?utf-8?B?Yy9LZERnY2FRZEpudWtsZWtyYUlraHNLdWttL1B5dGVUN1JpWVlkOEYyREJs?=
 =?utf-8?B?bGpMdFlGRjdOYXJSNWpiL3JjSDZnTW1GQWpyYU5BaXltYlk5d1Qrc3VxSHJz?=
 =?utf-8?B?aXJIUmZ0NVlHYnoxdURLV2J0RXJZV2JVWTNsSlZRckdNVTRIUmNjeDJLenpO?=
 =?utf-8?B?Z1lscnpMQSswZnROZEM4MjVVd09FYzRhQVZzWGF2cCs0cHJsWWI0Rzc0UWtp?=
 =?utf-8?B?enBtcnBWMWpCWjlKcjcvei84TmRsUzB0bXlSSTA3NzNQOXJETmZiMmdjek9l?=
 =?utf-8?B?eGdmeitKcWI4bDFmMXBxeFdJUFc3ZjBiNXR5TGVZaGo4N2xKL3lEa1Vodk1z?=
 =?utf-8?B?eW1wVDhuVlVJdDVaME5IaTJFUEh6cVp4d3l2aGxDTnRadDhoRFB1enp0RHlD?=
 =?utf-8?B?SUhjdzRVcUhaSGNLYmZ2bzdwSFFLaEliYlU4NHZUTUFoalNPOVFxU3BURjl3?=
 =?utf-8?B?ZFN1YVZLWlVnRmlhVWswWFJvY3dhOVhjY1kzT2sxcUFqODg2ZkkrU1Zkazlo?=
 =?utf-8?B?amQxLzNYVlF0UkI5NFBhWjlVRFc2enpXcmV0QlZIbnBSaTJBT0E5N2xicWJQ?=
 =?utf-8?B?QXdOSkw0RmwxT1J4eVBFd2F3dkVQOXQzOC9DdEpqNnVGWnlzMW1Ybm9pQXE5?=
 =?utf-8?B?NnJ0czdTc3J5M09RMXlEWG8xY0p2QjJzMVFjYytNV2kwNjIrTWJtNUNLRE1r?=
 =?utf-8?B?ZGlRSWJEbTdBeUdVK1RCeWFuRzY4S1RReE0xbk83SUdISk9aNEdhcUp3Uzll?=
 =?utf-8?B?WkE3RU91K1JTT25EdnMxYlNLYXVBQ2FLUHc1RDh3S01HNFU5TzJQOEdoUWxr?=
 =?utf-8?B?Qll0MkduVm5wSlZHbjYyd0diTjNIQk8xaFYycUluSHl3bUxmUmpLYWwzaUt5?=
 =?utf-8?B?ODg0NDlmZEJtYWJlUm9TL2JxVURubVVTaUczMDI4V3VnV3FxV1ZMQUtNRUwz?=
 =?utf-8?B?cHd1czhhNWJjNjJxbFlicXZ2ejEwdUZGaHpjVzlLWW9CNkJ1a0ZBU3pUSVhy?=
 =?utf-8?B?THlKMGwrR0s1eG1TRjlna3IrWWsrdEcvdGFuZ1lRVEQvUmluY0JHWTZCYlRk?=
 =?utf-8?B?aVV1RTF6WDFlOWdOdUhrRXEvT0dBckJISy9KT2pDWG5YN01mZmVlRVJzQlFp?=
 =?utf-8?B?SFk1cEZ6enFFN000VzZuRjhrdldIQzUxTEVTRUFiK2hqK3BVVk5zSFhRSjdP?=
 =?utf-8?B?TTJ4YlE4YnhNMzhGUlNTTWFNL1g2VFNzSUJzYmRmcys2WUh4SnZqNXAvWEJo?=
 =?utf-8?B?azNwNXB3YkEvY3JDOGxYV2psbWtLbDRkUlpEUVY2Vy9vV0FzblBWQVJ6bmFO?=
 =?utf-8?B?dVhZR3lxZW9xbFJPQjJPa0o4RVBWaTVJWjRkMHkvdmZld3NCSldES21pTkhC?=
 =?utf-8?B?ejRpdUdRcDNoZDNncWxnRkpiQldEK0RkdEhIMENjSmR6VE9GeWJNUHBPSytB?=
 =?utf-8?B?V3Y1SFBqYmZxYksra1pIREwzZEtjT0ZxNlNSbVNacmdQRnlIMEZlNFpGVHpz?=
 =?utf-8?B?NU9BQTlZbHVsbnRJT0t1TTlodUpEK3JjblhBT2hhdUxUeDFvOGtXODNyU1FG?=
 =?utf-8?B?QzAwY3hwaFdkY3BLNlJCclIxUGxHR2JSZVVQZ1B0bjRwNElVSXJUZGZsQ1dy?=
 =?utf-8?B?S0ROV2JBc1Z5bFZsc3Jsd2RnNlI5VWdvNnVvQS9SSkUyNHRRQ3dHS2lGRkdN?=
 =?utf-8?B?NTdhcVhtZDF3Y0UzRWtEc1FUbnc3QVgyUDAydmgwbjZ0OWkyMFVDUmpGMytn?=
 =?utf-8?B?RzdFRTZvQkZjeXliaVc5TVo1UENEZEFLWXRqQkpCNk9UVUxYaDZ4cGRBK2FC?=
 =?utf-8?B?VjhaMGdvRnhJVVZBTmJFOUl5c2o1UDlkMjJqa0NTRWdTakRGZ0wxalFKL2FD?=
 =?utf-8?B?b0NwZ1B3MThjVDRzOVFBa0xFcXE5SDA4cDVxZnZnaDlvSis4WWJsS0MyK3Fq?=
 =?utf-8?B?bjFUVDZDeDVDNmZhRU8zOGkrd2pTcERudW9Lb1UzN1RlRytPUUtTS0JaSXdI?=
 =?utf-8?B?SzJ2UUp4dXZsSzZyUHUzTFRXRjVoL21nZEdURzdGYVRTaWJqRFEyUlVTWklN?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4e7747-c9f4-4a8a-f02c-08ddbd00c5e0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:48:37.5886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fllTRkmOWjYP3dxJW5yIQKvG54ki9To0nsKa/LNe0aSf2f59clqbi+8xIg7lqu8VRdxf0Rbudh5EGiHXkpRK8ebw03ITzLa0qmffTv1kE+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7026

Hi Neil,
     Do you have any suggestions for improvement?

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

