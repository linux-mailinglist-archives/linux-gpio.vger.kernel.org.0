Return-Path: <linux-gpio+bounces-11345-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4BF99E06C
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 10:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3C7B1F21BFF
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Oct 2024 08:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006311BF804;
	Tue, 15 Oct 2024 08:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="reQFfYDs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EBE1B4F0A;
	Tue, 15 Oct 2024 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728979748; cv=fail; b=eAFmxk8O5pMpqTo5SDjJEeF5NZ0y/TId18IfJV20j2PDVgQgGPrDNKe7whdlCo62X8+EMU1ILZ8b7jR+B3UKhH8JQhDRL7ckeurS83VSPuWO+KwoenURqnm2sgkhMOaW527/reKjUkTjepC2KtWFrcGXBbL/F1VQNeHCUIp8qRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728979748; c=relaxed/simple;
	bh=5SL1Eft3CricCALJsKmSkgEGru0YKbOTOLv32+Ysh7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F3WuPGi8BCHiWGTyg9ztT39wAP3YRmkim41ZGAHGpAwI8osWnApWNxjmaEpdMwNd/GkZn5CybHwFT1yxxQaDvfCu4YKjHDhek2c8egu26n8OL7qzwu454qSPTzC/2kGyn8K6jZABqUxbs/fr9EZSFw7fRghC1g98aeaedse4BBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=reQFfYDs; arc=fail smtp.client-ip=40.107.255.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hupkc3n72pwW4ztLYoIy7laNP3q2jNBrd47GFMwZk+lTsFOLsqZGuMg6O22xD2x0D6C/ok09W47XI4F9m0hsdpy70LPFQgv6xxR6puyOlABzJ+M6KAffsfjB7iGulD6VF7oi+g3WTeGBFyAMpqnm2uZQjTIuyizdnSu8SIXotOl8nxtt2BSVx9I2YIlLBSkbDS3ntIqaPvx2rsOi12PZtF2GJgrQhe5msSySr/aLWSErvZ8G7RQaRcHwLolq0TRrMrTNL7Zo8XYiJ8WpFPiTKPHperHcLZKqKoiKdZUZQFx4YBxPB0Um2DFebj0/WaItj2CGLzkKFLY9ByFW3lO/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEvVTcZz+425QP9D+bzpcbCPzVSCa+vaMMnTTEqRpI8=;
 b=kKGUHCF8Zxthiq93NTHh+69/XdraLEDMGONQDueIYfCzeFAfDm9lLoiqfur015JeRMNeubgjqhHLmRTkJFphMpYRTvshcrdjHB4o4XVnzpF2t7Ry3RCLOCd2kQx+fbporZsUxmCx4+9NLxbu9crZ08Mcwcw0+Ex9BqG2le8X/iK9E48mhVKjLlBFJiq0oyBmEN1DrQQiH6Kg9IUGne5YNd/2AsAyKpo04FG+q9mVG9NIAePpiCAbnyDr4lWtKSzVfsPZb4HE4290hOh8vIhHlM0lWJ2fsLoICAldPeuaC69QblBgxxoVn+5/wYn/dS+d/UE6vPIxeCThd1rB9ZtmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEvVTcZz+425QP9D+bzpcbCPzVSCa+vaMMnTTEqRpI8=;
 b=reQFfYDsuQ+C8Msl53VTKhoXRN4A0Qc2X3SRks7n1pePqQ1ld4BDym/gBOM+0Tbm00yuqIzq4ZrMVHSuLmuX5uDV2+iGyAhvy1E7epLiWScNMyyufOgqv+eUhdVRRUai8cFIAxr14NEdxsV+BYlkw1ZcAJsL/okjICjJKQHxzq0bKm9nKCn724tH0YIgHZwU+BnFdMBJsIABNWO1rzCc0Dvb02TlZk6IerS0YbJKvtY0J5JZ4KnOkhwoOnm3EY9goi0OsSTvKXlVBBfr74sSy+FcJ12rr0MyX+Rd97kXgp3Ru5b7NxzyCMCJYakHtRB/igUt8UH7CacerKu3MhReCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TY0PR03MB6476.apcprd03.prod.outlook.com (2603:1096:400:1bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.24; Tue, 15 Oct
 2024 08:09:03 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 08:09:03 +0000
Message-ID: <6ef6bd97-571e-4243-951f-c6704cdb2b57@amlogic.com>
Date: Tue, 15 Oct 2024 16:08:58 +0800
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
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <9c7f0c20-aafe-45b2-aa3e-c2c21e3a5b71@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TY0PR03MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 410c0baf-b86f-4bc6-cccb-08dcecf0a1ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHF0MUVpcjVOT25sSDM2cm1KdlNqQytmY1pwZkdzSVM0WHFqbFhLbzBLcndV?=
 =?utf-8?B?bUZSdmZFUnhEczJ0T1dSMFhCQ2RFT0tTKzJkNEt0dmVQWnVHbjRZMkpkNVJs?=
 =?utf-8?B?YjYzY3pmZUFOWitocStCeStJVUpDNXQvRE93Ym9yaExUVmloTlcwS0ZFdFZG?=
 =?utf-8?B?OXZDSUk3a0hkTnBiaEpKVmVzcWg3dGhMUUs3MVVnbk1pQVYwMXh3WEJJcDhD?=
 =?utf-8?B?VlYza2d5Qkw1ekgxNVJJWGhEZDUwZzBXSTRBcXhpejN2Y3hhek5WMkpKdEdv?=
 =?utf-8?B?QnZIbXZKNitnRy9SbG1vYXNpdFdBU1hid1ErVkFKTllrWHZzNU5oam55SExk?=
 =?utf-8?B?WDZFTjRMUFFNdi9TcTZBZnNPY1V2dW5aWStONmJCemQ3NDBoYWV5RGhaWUxU?=
 =?utf-8?B?Ylc4V3ZFZjFJVUsrVzlzRG1MK08zblpWUk1wYnVXUjBnT1VsY3RUbmxmY0NV?=
 =?utf-8?B?QmcwYVdRRDEvTUhnWCsxRmJNSFNPNWw2N1FvSzRUSldRZFVvdG82ZDRTVEFT?=
 =?utf-8?B?ODVFR2cyak83dVk4ZU12TWY5VGJEZ0QzNUVxL0hDSFgyaXF4OUlvVXpTeHVC?=
 =?utf-8?B?SUNyMmJGZDlnRFBFNmNxaWVKYlIzNVp4MktOSk9jb3NLZHJFVEV6OUx3TjRY?=
 =?utf-8?B?N2hEeW9WaktsRzBZUVpMSFBjVkFBZjVtSDBaaXpDTlBjanY5bkVOazBnQmpi?=
 =?utf-8?B?L0hyLzl4aUFmWGxEekZ2N3cyam0vdG9jalBEMnFXYWZsaXVsa2FnSDl5bE9u?=
 =?utf-8?B?ZXppVWxVUDR6Z2pNdjBtdE52L2xsQU54c2U4RzZ5Y0JOWDRMSlV0ODNGalZP?=
 =?utf-8?B?amVuaERVOHd5bTJ4ZmJoZDN3a2I5SFJ5WFNvTXUvQ1IzdjBRMTdsUXBsRjVj?=
 =?utf-8?B?N3YwM0c4Znl3WGRIazYwS0lqODZXMUZ4dExYVEZiVnk2YnJSWUxSY2tSRUFU?=
 =?utf-8?B?Qk9qRW1iL0g0bDhQdHltdVNYYk1KcjEzcmdLQzR2RklsMjVBYTluQW5ZMU1i?=
 =?utf-8?B?cTljL1dtYS83VWdYRVc0THRLcCtNaCs2V3JZSXlMUEwxdXMyQmg5NlhuczQ0?=
 =?utf-8?B?eHlMNEU5QW9XdVgrUDg3Z0ZaNldsVjlMem5wWkRYN2dNeEZFNnNVai8wSGxY?=
 =?utf-8?B?c3VuVlNnVEZQeWU4SnMrYkoxYklaNXJudGJPT0krUzFQdmRvM1dzZDFJNUc0?=
 =?utf-8?B?TDFxSlBMYVNKNS9jbms3c3VXdmlnZ1VUYm5YM3A1djNBUVNNMEord2txdlNY?=
 =?utf-8?B?NmpITW15REF2T2NuaTczN3NkVm1DVXpvcVBxcS96VDBvaTV1WW5nTDZCZU9m?=
 =?utf-8?B?cmRyVWI4NGh5WWNsTEVHdWRLUjdFdHNrSlBRTWpuVVZqZVFidWZVaDBTSWRC?=
 =?utf-8?B?NDdqZjBQN0QwQ0EyYlhJK1ByeHF2YVN4M3IrUWRPenhmcFBhRnlaUkFYbnpC?=
 =?utf-8?B?ODhVZmVQR2ZzYW81WDJFMGtrV3ZhQzVkL1Rrem5HY0hjNmsreVE2c0RFMlda?=
 =?utf-8?B?WVp6aTNnVEVIYVQxREsyQVdRWHFzbzAvK2lYSXExRktLNmdaQk84c0FhTEVy?=
 =?utf-8?B?RGIwcWRRTGRxQVJvSCtjMTRGRkpUS00wSWRBNzdadGtCZks2ZDVNRUFPaVJz?=
 =?utf-8?B?UUVEK1hrb0E5QUgzN29NYmg2cVJWNVFNSVFCWk00WDRTVDFPWWNMbU9NNjhX?=
 =?utf-8?B?azNoTkt6NVpid0tQZGV0Mi9UNDVLdkhEcllJSlQycHE4eHFVczJTcTNnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0Fvdmp4ejZyRUF4V1IvM3h5eGNpRjNmMkZCcXRRSWdUemVUblRHK2greHNZ?=
 =?utf-8?B?MVJpMHFhRnBEQ0dqaEsvYURDVFUzWnhUZzVXdE9sS05IWmNjVkRzNjlNNFho?=
 =?utf-8?B?a2JLbDl2akdsQzBkUmh6KzMwZ3U2UGEvTjFxdlpYaUlQaUNPa3E2cGJWS0pq?=
 =?utf-8?B?L1k3STVqMmRqVFdsMmw1alZnOWM3QyttVUFOclh2L1ZacXltQTdtZ2I0RytL?=
 =?utf-8?B?RTZURTY1UHNNd1lPUW5vMjJ4alNRcnRYQVdOZUR0NWxrWlVkalJIQzBJQU1T?=
 =?utf-8?B?Zmo2bXRUbnNIYzFudHJ1ZnhQY0tSSnVZcEJ4ZUJCS3pSQjhGV0dPVnk1VktH?=
 =?utf-8?B?S0dYODd0ZmxGcDJZY2U1MGsyVURwOEx5Ykp1Qnpubnl1V09velR4TmEzckpE?=
 =?utf-8?B?YWU2TnZJN0FsaE1yYXh6a0ZoWkJENTJrTGFqVktVa05KZEVvZUs0RVNhNUZX?=
 =?utf-8?B?d2pGckN0UDZ0UXp0YmtpZGNyRDhmVlU1bU1sMFdjdjZnS2IwdUxyYjdXejdm?=
 =?utf-8?B?MzkzRUkwM2pDZFZkUkZlcmRoVlZBRGI0aWVvOGxCKzA1U3p4NXZ0NmkwVzRQ?=
 =?utf-8?B?Mzl3eDBFNUxPNEJjaFJIL0FQVEFSaXpRR3RXTHI1QlpMbDE1cS9uMGRaTUZY?=
 =?utf-8?B?WVNrVmNEQTBtY1lUQnJGMUcxTndEa2xEWlluRDVtTGdtR3lDSEgwblAvVktw?=
 =?utf-8?B?YzZ3RkJnN2lQb0ZibnJYUjZSNFpnbUFIR0ZIa29UeTUydWFvSElUZXJhUkVS?=
 =?utf-8?B?ZUtTbm9nc2t3S0xpeUVmb1o3L0lmNWY2aVRtOFd0YWphVjdWRWRaaEtxVHJ3?=
 =?utf-8?B?VE1VV2lyOHY5d09kcllSQWJzN2h2M29lTlU4eGVldmlaL1JEd3JzSU9MbTBW?=
 =?utf-8?B?UUFjREgxM2cxbE1nanVWaWhWcjcxMVBSWWNEQTI2bVp3VzgvSStLa2J0Q1Q3?=
 =?utf-8?B?R0lBTjBXYVFMd241cTFCNWVTTnpmZDg4MHZhcmJhNXMwQU9OeE5zeTlGRUtx?=
 =?utf-8?B?anlBMzBobzhOS2pjb1BEckFUS3dRZXdaeUhpa0wwRTJ0N2lhM2x0dzlhL1hX?=
 =?utf-8?B?Uk1leVFpL0FJN3kyTmM1Sk0reFU0K2hZYXNNdnJmYTdyaU5tZHNUR1l5d1dz?=
 =?utf-8?B?dkx4S3g1QkJvcVg4a2ZPbDdLc3JSY0ExcUJJbEI1NWkrNE04YzF1YzY2Wk9p?=
 =?utf-8?B?UGNuS2JZREMrTnpvdmZoS202My9HOHNGSkdybVJPTGx0VDFBVXk4cHRvWXVN?=
 =?utf-8?B?UWZBa3M1M25SL3JlN01heThnbWczRnNMUDVWYytleVo0YU9ERGk5Z21TN1hh?=
 =?utf-8?B?Q0x4SVdrRGZJbE43SHUwam11Y1o2YXpFalF6TWtrR3JtQTdQS3I0dkVmY2V6?=
 =?utf-8?B?YWtudmVrYnlRSzZjNVFud2xqZnU2eElUQ1RRZHRpdWFIZGN4VngrMDN5ckVi?=
 =?utf-8?B?MXlDeXVDR2FrQVZBczZqKyt0SWpwdzJPdWhHT01FQ3AwVGhOQ3hRVVdOa2ZQ?=
 =?utf-8?B?NGtXdC92UHY5WDZYeFcvb0toOFN5bmV0M245R2JxRGpLWVBLVGVUMk5JcUsr?=
 =?utf-8?B?ZEFWeGFDL3hucW9EaWxyUEYvYjNKekx0QStkaGJtVURFanNnKzRPSHMyM2tI?=
 =?utf-8?B?L0R6UHFOdnk0c0pia1pobzBTcmZTbFhmVzgrVk55NUJIRGkxM2E4Q25rNXo0?=
 =?utf-8?B?SXFLSnhtMkxTWWxMOFRmNEtLU1MwR2U0RHdJdTA2cmh2aXZkQnUyR3UvMDV2?=
 =?utf-8?B?azc5U0s1Qnk4U29PT25wWWN5L3Z2bXZSTk1vcEJOdnBHSlZpMU5RUWViOWVv?=
 =?utf-8?B?SDIyYjk5ZWI4SlVXUzJuY3U0QmJocGZMczFMU1hocUFrdXhtMThLK2lpZHJY?=
 =?utf-8?B?RFdQbS84WCtmZjJrMTk1NDVvai9KZ1BieDg5T0FoOUd1UEFVSjF6Q1FXYTJ6?=
 =?utf-8?B?c1AyODRwN00rbFZnbVJsdUI5WTFxSnpocEZpZ0dtS1VQalpuSUJSeE82eFBV?=
 =?utf-8?B?QktzOS9ZQmJCT0xDRklvdmlRVFBOQ29KdVZXYTJyT2VRWVRNUDhaYUdYWmpG?=
 =?utf-8?B?SWNmOTNucmpLZnU5cmNtUS8zTHFqSDQxRGZlaDdPZlBZSW1zUEJmd0ZQdnBp?=
 =?utf-8?B?OS9PWG5MeU9uQmhCS1VEcUxOaDJlajVUZmVROVVGRlY4M0c1L21rSi9iYjdT?=
 =?utf-8?B?Nnc9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 410c0baf-b86f-4bc6-cccb-08dcecf0a1ef
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 08:09:03.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5vxbqBu8IKQj1l086irh+uCPds3GnzNUT1JwLWkjJsGvOJLyqY458skeO1MYQk2l13wtRnSo3bf8O6GElSyUzEsAtJyY61PRpay5StxIgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6476

Hi Krzysztof,
     Thanks for your quick reply.

On 2024/10/15 15:59, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 15/10/2024 09:54, Xianwei Zhao wrote:
>> Hi Krzysztof,
>>       Thanks for your reply.
>>
>> On 2024/10/15 14:01, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Mon, Oct 14, 2024 at 05:05:52PM +0800, Xianwei Zhao wrote:
>>>> Add a new pinctrl driver for Amlogic A4 SoCs which share
>>>> the same register layout as the previous Amlogic S4.
>>>>
>>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> ---
>>>>    drivers/pinctrl/meson/Kconfig              |    6 +
>>>>    drivers/pinctrl/meson/Makefile             |    1 +
>>>>    drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1176 ++++++++++++++++++++++++++++
>>>>    3 files changed, 1183 insertions(+)
>>>>
>>>> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
>>>> index cc397896762c..3e90bb5ec442 100644
>>>> --- a/drivers/pinctrl/meson/Kconfig
>>>> +++ b/drivers/pinctrl/meson/Kconfig
>>>> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>>>>         select PINCTRL_MESON_AXG_PMX
>>>>         default y
>>>>
>>>> +config PINCTRL_AMLOGIC_A4
>>>> +     tristate "Amlogic A4 SoC pinctrl driver"
>>>> +     depends on ARM64
>>>> +     select PINCTRL_MESON_AXG_PMX
>>>> +     default y
>>>> +
>>>>    config PINCTRL_AMLOGIC_C3
>>>>         tristate "Amlogic C3 SoC pinctrl driver"
>>>>         depends on ARM64
>>>> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
>>>> index 9e538b9ffb9b..c92a65a83344 100644
>>>> --- a/drivers/pinctrl/meson/Makefile
>>>> +++ b/drivers/pinctrl/meson/Makefile
>>>> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>>>>    obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>>>>    obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>>>>    obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
>>>> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>>>>    obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>>>>    obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
>>>> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>>> new file mode 100644
>>>> index 000000000000..dee1ae43edb5
>>>> --- /dev/null
>>>> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>>>> @@ -0,0 +1,1176 @@
>>>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>>>> +/*
>>>> + * Pin controller and GPIO driver for Amlogic A4 SoC.
>>>> + *
>>>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>>>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>> + *         Huqiang Qin <huqiang.qin@amlogic.com>
>>>> + */
>>>> +
>>>> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>
>>>
>>> I do not see any usage of it.
>>>
>>
>> The header file "amlogic-a4-gpio.h"  is used by AMLOGIC_PIN and
>> GPIO_GROUP_V2, The code used  is  AMLOGIC_GPIO().
>> This is binding definition.
> 
> Then all other defines are not used. AMLOGIC_GPIO is not used by DTS, so
> how is that a binding? Don't stuff random defines into the bindings.
> 

The AMlOGIC_GPIO definition depends on other definitions to be used.
It is not currently used by DTS, but will be used by other modules in 
the future.

> Best regards,
> Krzysztof
> 

