Return-Path: <linux-gpio+bounces-14611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC45A06B20
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 03:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E268A1887EE7
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jan 2025 02:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1756113C9C4;
	Thu,  9 Jan 2025 02:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="jhfmprFi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2113.outbound.protection.outlook.com [40.107.255.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAB81732;
	Thu,  9 Jan 2025 02:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736389983; cv=fail; b=W8wHyyCM5/dTwc86LPT32RRBoNULAyiUKNjJQFKtjAJxBX6cTcBS3e7dgbZ74nrFbINiQKE3RYaXg2L1ngxYiC8MHxFYtAvv1FRalzGokQXs9PrL7x4xoSD9n2jJ1NTK4PIq4WbqVdBkeFsdCejrnDCxFzDoZx3xMcdEZQi2HHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736389983; c=relaxed/simple;
	bh=79haj9UGCHs/uoxGzRErU7Wv5GiZaeFvZ62KMg3VDPE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b8woo6nRMlMxY+92TuTILVye/UeOIJ/Dp6XgWL6IKtDTBZ6iSbJUt4KAELK2tCgONo7e+grdSTCZN/nIG+56nSBwpVIpA9ljM189qOLZhroTPbio20+gsmI/YiYu7lybmUNxNs94EzPca/B6mXWAJnQGObBjo4Az319H4noJL4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=jhfmprFi; arc=fail smtp.client-ip=40.107.255.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFQRRjJ/xOllgtJCsjOejhXX6GxM7R5z/poEIpcEcscL7eFem1tiZGeFEPy+vzpDTikkjUdNZOGsMzIhIKhba/xh7WWBhmZJ19wfL7rTeTET/RysILh/KzQUX6MD6SO5cXYxnkAQqbRVGICn72NOB25wqzDHouY4pGtfY3nUux+yVz3Z8Bm0f2iD1okJaenJj3pPZFTDy5K6QV6aDQbWZ9fQEPosM5jdbnFBv9H86onpZled+a1zNkJ+tvenTSwwP5B3/WhJ1+Egc+tcZXGexnzB+hZVTL5zFcw0ENEVniAyTiVjn7qhpE50Y04nTMU3NzLdvhFHiX7+9sOKSPmkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rGMzp78C09ETjvzu/jCvVd+/cb/9tclMNdfhak5fr0M=;
 b=m02uZBs6LXZwgcoYMhglEd6frLsQNDiMdhFWY4WIpDYxRQqa/vJIFvl8SEfnZNBrfcE+YOV8ARFnOQhuvUyP4Dsjo/TsFWduuLBGRWXeB2WV9+ROeKoEGRcfmK3ZNLieyHP9D4o5bnenJ7TAeqdyjjoyEi0aOrY74I2Q6wEmPlQQhmLv/htW3u/JlFrJkxsn1Et+uo661+ytMpTO1nuv1tfp6RRICyVuAmmOe2MId6mnDNPjKE6GHuZauAODnvx92sgc3YD7IdS01SB/gf/tUFvhYFB0f3PH+RWZ7fa7dNzlfJXDZ2rkkN1cJq5uzhZETCzbiHbd7aBTMmSu+DPflQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGMzp78C09ETjvzu/jCvVd+/cb/9tclMNdfhak5fr0M=;
 b=jhfmprFi6FdolWYvF5H1nDVFebpQsIHeepKskY+1lWl358rmAJk2rzLniQgA+cYKAjtgjNpCujG9Kf0u7zK1riNz9GchSPhuS1GioD0GKR4m4SFVBLkOvOqg14G9eBWsTOh90Ay05yvoZBfkpoc+PjV2smEcaokvc94fLxWKxHPAe2/j3UyfqEBE+gEJAfQcWXoZP5cqdCqF5WOkAjec1aURiB/PePsN8Z2xjoBZw8VEWyAs7Isfbo/22DGp6gfI2Vh9t7cJq9662poFKmZURFwS97AYDX2D+4JUnv7hFE2htEcS/Q3gIKcXyUxhK2UDPsALXBCbEWLBdjMQBnEsrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7814.apcprd03.prod.outlook.com (2603:1096:101:178::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Thu, 9 Jan
 2025 02:32:57 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 02:32:57 +0000
Message-ID: <8ae1ee73-d710-40d2-bc70-605680421fb8@amlogic.com>
Date: Thu, 9 Jan 2025 10:32:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
 <20241226-amlogic-pinctrl-v2-1-cdae42a67b76@amlogic.com>
 <20250102212422.GA554486-robh@kernel.org>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250102212422.GA554486-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:4:195::17) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b328bd-b87f-41be-d63a-08dd3055ed6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUVWQ1BGMDIrY0FxUTBrNFBlSGREUmRsQjgwdG1DNTBOOXNxeU1GOGxkTTVi?=
 =?utf-8?B?Q3FwVmVsWngydk5mcDBoTzViUzQ0emU3Yyt2aFAxNXdjUmk5UUlyUVhBaGUz?=
 =?utf-8?B?R2oxekRINTZBU0FPdzVxVzQ4SFAyS05rNTdKRGc3Z2lSdUIwMkRDak5IS0NB?=
 =?utf-8?B?ZFdZcFcvTHJaNzJRSXNqUVREV3hKeVZtTk1nbVVGWnhJa3hlSCt5VHpyWVVu?=
 =?utf-8?B?VWx5Q2EwWWJZUmliKzJuYzFiM1R1bUFBUC8vOXpjUTRZMElkQkFYMU80Q25Z?=
 =?utf-8?B?VUw4V1htQnVQYmJuRW9RbXc1Z3oyWXdGRmVJRHA2SG1Xck1nTUdxak10c3g5?=
 =?utf-8?B?MTYrcGhnc21jT3JBRkZ3ZjAydmhJZlk0bjFNVHlNaVlMbjMxdmdoR3hMUU1J?=
 =?utf-8?B?MGwzQVpmT2QzT0dLTVFYOUNtSHlaclZ3WUZOWjhPRDZ4SE4zS3VnTUJRTFlZ?=
 =?utf-8?B?blUwQ2dTZGFrOFBMSmM4NEZWS1dkSHFuVXljd2c4eTM3ZUtkeWhtalFrSWhp?=
 =?utf-8?B?SExPdHZzTTM1WXZBTCt1b3FJNGVMMkc4clp6M043MUc3UmUwd1QwRHF2RitN?=
 =?utf-8?B?cDQ5ZG9VcmZQdXJIQ0w2R2VQeUFBRTJ1YURmb3lLQlk1MmdpcTlsK3p4WENX?=
 =?utf-8?B?SDNvcUtRSUhDOXBLQkpBNWRHLzYwOWlGbHpKeVM1RVFJeUpiRFFQbDZSNTY4?=
 =?utf-8?B?UUczNFNFZGVMUTQ0RXRmVytkRnhTRUtYVDZJTXFjK0NoMTN0RmZCbC84NG9W?=
 =?utf-8?B?OURXOU5VQ3pmWi9VMWpzV3MyeXBJWWQ0SWM2MHFtSzJIRFdmdWN5NnhhT0Zv?=
 =?utf-8?B?ck81eEplZ0FXVkxSUUpxT1dJNlduV0RVUFVrSVI5NnBZRmg2VUFJUTdkeStQ?=
 =?utf-8?B?RjVkK01LSGNuZGd2NzNzM1oxaUxDejJOVjkxcjlpck9pbk9McDMwN1pnOGZ6?=
 =?utf-8?B?bWs3UmJnTzJnRGJ6RjRodEdjRUplL0Uwd05TUE1wVlZ2NEtjWmZUSEEySzhx?=
 =?utf-8?B?ZDY5Zysvd2JxWFduek9MVlhGTmkxd0gvMWN0UWZjeFNoMEtNRjJ1Qjg4cDFl?=
 =?utf-8?B?MTI2blNqK2Q0NXlWWUJOZjhLeUFNN1JMVGVpVDRPdFpDdFBITk1BWVh3Qnls?=
 =?utf-8?B?T2FiQkcwZ1dMek8wSkw5blVpVTRLSmZnTThiT2l2SXlHK2REanNSdncxYjFQ?=
 =?utf-8?B?bFF2b01ndEdNMEdVeThsR00rODhMdXF3R0Q5UHU5Yy9mUUp3ektSSWo4SklJ?=
 =?utf-8?B?Ty85UDhBTVZTQnI3RWZ2NS90a2NCKytOM3VMVG1xeFpDYUZwMGV5cDNMcG1u?=
 =?utf-8?B?NjE1bEhXZDVaTFBVR05zbUFoSHlwajc3cG5VbzE0UjRkM29pZ1k4eHdwS3hx?=
 =?utf-8?B?VG1SYzJuUkZCdVcvTzFRRERVdVZyc2x4YWdJb1NtVGZDUzhkVUM3UHp6dmFo?=
 =?utf-8?B?cHluVGd3a1dnNHdhS3Y3L0MyZUtCTFZCajJFWWFTUXV2VHpndWs5TFZJR1ds?=
 =?utf-8?B?Q3ArWi9OcFgzRmJMeUN2YjN1WExCQzhTems2eHFFR0x6Q1dOVWdtMm1tTlFK?=
 =?utf-8?B?NURSeHNWdVdtRm5qeGJONUlkdHFUcXFDZStCY0JPQmMxYmdkaXVyRlhBb3Bu?=
 =?utf-8?B?YVVKWEdLZnk0cUhmYnA1Nk9iNlQ5VWRMRUR4Q010TFV6UzNlbnd3dmJQc3Zs?=
 =?utf-8?B?QjkyeTdIcXlFTFJBNURKSkxQUWFNbXZ5aWN3aWlycG1oOUEvaHhOemdzTm9i?=
 =?utf-8?B?dWZTMmZtVFlGeTU1ZlZ3emJkSDRGZlpSbE15aUxXUDE4M0pQSXBkdWErYnpH?=
 =?utf-8?B?WkV3dUd1N0t3Q0JjNU5tZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0gvekUvRnl3MjdYY1NSMUlMc2dLMWc1Um95bE9nbm9aVkp5REtsbnlGeUtF?=
 =?utf-8?B?Z3A1ZmdvcjVLck5Ia2NpRFJ0Sm42YUNvMjRiZ294T2gvamJzc2VwSUdwWWpI?=
 =?utf-8?B?MWRnVnh4d3lxeGdsUzVPVkxFanB1OUJPS3lVdHBLeUk2U1BhbDgxTlBJK1d6?=
 =?utf-8?B?bkNqQ3J0Tkh4VHBCdm9RYUU0KzBieCtMeC9qemtkZU4vMHcva0Z2R0VDcGF3?=
 =?utf-8?B?Zkg1SmpDSEdBMDA3eEFacFBIUnZtaHJHKzBpbVJwemRPcmJ2QkwvWStJaXRM?=
 =?utf-8?B?NWE2RUE3TWxGZjBuR2hjMWsydzFDZ0JFT2lzczlKaENhUWdraVdtMmlEUVJM?=
 =?utf-8?B?bXF0akMyZXpBWjZCRC9NbWN1NFd4TTU4anpBeEdYZklCQmxOYzl4Q1RuUUVw?=
 =?utf-8?B?a1RxaW9xU2E4L1kyTzBCYjBKVEx6Y29IR2QvRWY5aHd0Vk1mQjhQMER6UjFU?=
 =?utf-8?B?cjZ4T0dxZlZxUm9GcWs2MURYYlJ0YTRjUGpsK0JlV0d2eGNnTzR4am5FbU9w?=
 =?utf-8?B?cjBRY3JlWlFsRm5DN1BBWWp4aHlWaE1jZFpneWVuZjdWb0lLRGdFdWR4N3Ni?=
 =?utf-8?B?NW41TzNPM05Cc3gzTU4rTU1PV0ZTcDMrTzd1Z0hnUi9telhIZXYrSC9TVTVV?=
 =?utf-8?B?d2ZMWWN3VmFIbHVUZHRDVC9rYWtxV1U3cVNBeEZQSkNibDFvRUt2cUl1MmpX?=
 =?utf-8?B?SUI5OXZtZm5mQ3VQY0hxcTVjVzYvV3c4MnN6cVU2MHRwaEFaY0o2SlVpampV?=
 =?utf-8?B?d2srdW1EcDRROWRBc2t3SFQ2VURXWmFNME1lbDRVQmZ0c2xSWkJraCtIMHEz?=
 =?utf-8?B?blpiMnR3MFUxRzhFRy9PbUtzRTZpUlVOWmpYR3psQXFzMWdCTFVTNDBPYjhs?=
 =?utf-8?B?aFUwTklRZ2NMZHFyL1FDN0kxM0JFMXBXdGRVTXg4b2tBMjZMSTVnSzVUWTBD?=
 =?utf-8?B?ZjN4U0NKUkExbjJ4MUdmVkNiZ2o2Qy82YmdJZDJUM3RoSldJem5ZRWhOREJF?=
 =?utf-8?B?VVhlQjJtUWZhU3dGYUErQndEQ0pWTmlsSXliaFRsaUpDd29FWmpHcVloUitw?=
 =?utf-8?B?ZWw4bjMyTVlaMmJWcmErYXVaS1hMZWExT2dSVFhaU2RLcXdBZFlEVzlteW9F?=
 =?utf-8?B?dCsrVjh4NXZ0UFdWMmJ3Z1JHRTh2blBiaSswcjk4bVkybUhxR1V4ZWNLdFVB?=
 =?utf-8?B?K3B5cUo0d0p1MDJWSUFaK1BrZlhtdkdEd0V1UWozZjE0K0lMQVE3MzdKMDVY?=
 =?utf-8?B?UFpVMVhMN3BEaVZPRHNubS95bmJLNVhmaHJjcFFndU5oQ0NYZXpLU2QzdDQx?=
 =?utf-8?B?eFd2LzZuT3dia2h4S002YkxNWXF1YUxnSDZUVkRsRHg3ak1NU3Ftb05uM0VZ?=
 =?utf-8?B?T0d0Q3p2QldzcVFFVEZhOVpXb0ZUR29FZkRFbFRQcFVucGFJWlNaMk92MEpx?=
 =?utf-8?B?WlV3bWtjcVhWRTZpSTB4MjlNNVBkdHo3OGtaR1htUDlHR0oyN3ZjUXJTY29P?=
 =?utf-8?B?YXlUbDV0R0RPZnFhRjhGaWl0M2laSUozZnhkSHVJNFh3RTBoME1lYnpibUs4?=
 =?utf-8?B?TzRuVGFQWlA1Vnl5VE05VTVHM3ExU3BqMkt5Mk5JZFV0ZnBGLzN2enRWbVZh?=
 =?utf-8?B?L0tUSTJDUDJmUktsZFBGK2pONWdLanFCMXZuT2VWMlJ6MFB1a2xHLzlrUTJy?=
 =?utf-8?B?Qlp6aWtPdW1IZ0lXemFOTTVtMmpHNjJoeGo4QnFhVlBLTDdDV1l0bHZscitR?=
 =?utf-8?B?Z1pxZ2R2WVVTZmNGaGYyeEYxMHk1U0VWamp1RU0wQTY2K1FSbTVZQ2V5MmMr?=
 =?utf-8?B?dGZKK21mMXR6MnhKVmVyTE94STNTWS9qNmZVMGhjdDZYYm9YbjJyZmNkVncy?=
 =?utf-8?B?OUpQRGhWSVFSRldaWjVQTy9KMFNhblVIbS9BWEgxUkxXMWtRcENLRzNFMWtB?=
 =?utf-8?B?TEFhQ1RTMXA1L2NTN0poQy85K1ozR2x3bTJWbFpiQk93K2xSVmRHYm5VOVkw?=
 =?utf-8?B?bWc4RVhVekhlWlZGdDI3REhUVnk3QVgySlV5SjBDWTZ1aFRodGR5dUJvbG9a?=
 =?utf-8?B?WGdkbEFDZ3RNU0NDRkRZK1huSXVxcytqY0dkU0M3Um5mQVRkUGM2NUVodUIw?=
 =?utf-8?B?N1p1N2dZQ2g5OHM5ajVDQTNlRW85THVFNmcxSnNjdlRvWXRyWWVuTCsvaFBK?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b328bd-b87f-41be-d63a-08dd3055ed6a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 02:32:57.1821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKhFscyFUYPlJ6xuKqguTZgHD1jWTd5KIqliS17fVsGI3+f3nbXPvOzAIrrsB2elay/q0U9noR+cKNKe8jbtpat7VodDxUzJlixomW0KUOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7814

Hi Rob,
    Thanks for your reply.

On 2025/1/3 05:24, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Thu, Dec 26, 2024 at 03:57:41PM +0800, Xianwei Zhao wrote:
>> Add the dt-bindings for Amlogic pin controller, and add a new
>> dt-binding header file which document the GPIO bank names and
>> alternative func value of all Amlogic subsequent SoCs.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 155 +++++++++++++++++++++
>>   include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  68 +++++++++
>>   2 files changed, 223 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> new file mode 100644
>> index 000000000000..75863d179933
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
>> @@ -0,0 +1,155 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-a4.yaml#
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
>> +    const: amlogic,pinctrl-a4
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
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
> 
> The addresses in 'reg' below are MMIO, right? If so, #size-cells can't
> be 0 and you also need 'ranges' here.
> 

Will add ranges here, reg and reg-names move into gpio object.

>> +
>> +required:
> 
> Move after 'patternProperties'.
> 
Will do.
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +
>> +patternProperties:
>> +  "^gpio@[0-9a-f]+$":
>> +    type: object
>> +
>> +    properties:
>> +      reg:
>> +        minItems: 2
> 
> You need to describe what each entry is:
> 
> items:
>    - description: foo
>    - description: bar
> 
Will add description in next version
>> +
>> +      mask:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +      gpio-controller: true
>> +
>> +      "#gpio-cells":
>> +        const: 2
>> +
>> +      ngpios:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
> 
> Don't need a type here.
> 

Will drop ngpios, use gpio_rangs instead.

>> +        minimum: 1
>> +        maximum: 32
>> +
>> +      identity:
> 
> Needs a better name. This is the bank number?
> 

named 'bank-number'.

> But shouldn't you be able to use gpio-ranges here:
> 
> gpio-ranges = <&periphs_pinctrl 0 (bank# << 8) (value of npgios)>;
> 
> And do you really need ngpios if you have the value here?
> 
>> +        description: |
>> +          identifier are provided by the pin controller header file at:
>> +          <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
>> +
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +    required:
>> +      - reg
>> +      - gpio-controller
>> +      - "#gpio-cells"
>> +      - ngpios
>> +      - identity
>> +
>> +    additionalProperties: false
>> +
>> +  "^func-[0-9a-z-]+$":
>> +    type: object
>> +    additionalProperties:
> 
> Define a pattern for the node names instead. We only allow anything for
> existing bindings.
>

Will use patternProperies

>> +      type: object
>> +      allOf:
>> +        - $ref: pincfg-node.yaml#
>> +        - $ref: pinmux-node.yaml#
>> +
>> +      description:
>> +        A pin multiplexing sub-node describes how to configure a set of (or a
>> +        single) pin in some desired alternate function mode.
>> +        A single sub-node may define several pin configurations.
>> +
>> +      properties:
>> +        pinmux:
>> +          description: |
>> +            Integer array representing pin number and pin multiplexing
>> +            configuration.
>> +            When a pin has to be configured in alternate function mode, use
>> +            this property to identify the pin by its global index, and provide
>> +            its alternate function configuration number along with it.
>> +            bank identifier are provided by the pin controller header file at:
>> +            <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
>> +            Integers values in "pinmux" argument list are assembled as:
>> +            (((BANK << 8) + PIN) << 8)  | MUX_FUNC))
>> +
>> +      required:
>> +        - pinmux
>> +
>> +      additionalProperties: true
> 
> No, not allowed to be true except on common schemas.
> 

This object  I will only save
      allOf:
        - $ref: pincfg-node.yaml#
        - $ref: pinmux-node.yaml#
others(description, properties,required,  additionalProperties) will be 
dropped.

>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
>> +    apb {
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      periphs_pinctrl: pinctrl@8e700 {
>> +        compatible = "amlogic,pinctrl-a4";
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        reg = <0x0 0x8e700 0x0 0x04>,
>> +              <0x0 0x8e704 0x0 0x60>;
>> +        reg-names = "mux", "gpio";
>> +
>> +        gpio@14 {
>> +          reg = <0x14>,<0x30>;
>> +          gpio-controller;
>> +          #gpio-cells = <2>;
>> +          ngpios = <10>;
>> +          identity = <AMLOGIC_GPIO_B>;
>> +        };
>> +
>> +        func-uart-b {
>> +          uart-b-default {
>> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 1, AF4)>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +
>> +          uart-b-pins1 {
>> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 5, AF2)>;
>> +            bias-pull-up;
>> +            drive-strength-microamp = <4000>;
>> +          };
>> +        };
>> +
>> +        func-uart-c {
>> +          uart-c-default {
>> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 3, AF1)>,
>> +                     <AML_PINMUX(AMLOGIC_GPIO_B, 2, AF1)>;
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
> 
> There's no need for defines in the form "FOOn n".
> 

Will do.

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

