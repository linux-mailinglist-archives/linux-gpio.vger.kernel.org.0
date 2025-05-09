Return-Path: <linux-gpio+bounces-19812-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEEAAB095B
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 06:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA6421BC32FB
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 04:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C663265CB9;
	Fri,  9 May 2025 04:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DcGstUTI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2044.outbound.protection.outlook.com [40.107.249.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9444265CA2;
	Fri,  9 May 2025 04:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766042; cv=fail; b=rAZIJyEdYsx7yl7y32Vm1yCb3E0uki8qoChTXE0h2ciiLYT+vKD3vqVIGdKfHTyu3+zumUtEJLWCndj5++sUeMEjT9z452/e2yb+C0NmXnCFbawhhDUrFbUaf5+3X6BDIejA6sU21UiE6Bj4XqB7sZX9VlopsnfvK6tbN8IUkZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766042; c=relaxed/simple;
	bh=htc4J7OFd9hkd/s33p771hBb5XhU1E3w+Jd5L6vdTkQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hBsfy/VcqbyHenpdcBl/5mO32+duyY2CmokFkG7RSTjJWzRmnSKGrKhUeJArcrsbXfXCZJklrqLx4+Bc4pEW5q7p9DktAqTuiWR4Y/oYIx2RNciXodKKT9Rb8YMd4EJVpXmzxklBSnw/+7sor+xb+4x6XRCeW1ZtIQoK+eqcTV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DcGstUTI; arc=fail smtp.client-ip=40.107.249.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cn6KSUvdFFdly9YClKtKXR4cKO9USzkHlnIZXxyGarVWkjNhkjXGRgAbnbp0HOdlVqBFqBJiY+6vEuv5Xmjf5t0ahge/NBJ9rsze3t0RplWhy+KeuR0TfDLBC/FABs2sAsUEogRMLVeyzpAX03wy+KHdsxpWQk6gTvg2RYKsY2NKhRmULpS1qisCAagwoQB+1heUxqleVB8qVgDnnpKeAYGbIfKdFBR2YnCd8OIRyWNvFcz6v/h0t7ZZzZVCCfUeo8ODnAdQWRDXMVbh1ZE70hiXdFGcTIriK8TelXpGXomOPr6BNDZ+wJX1gFBbZ634LCus7ClvhP/brFu56uRrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cY4WlWNQKHmiP+fJwOu0OlAPAHncJ/4xYG/UJMm6RbY=;
 b=QkTeQhf2vHWlellejuLIMei+nEafgNwBa+wWPuUHS7/Mu0+X6ciYN3uUeA8wvAyhxwj3Hyh2lgcUC7sV4PGalf7nUEVLRmV+I2lKq0bwuSmT2+MR93bv5EwBxGzpUSMmCATziMEh49/4XCzEOFsP8OHgDWHsDSsYNMFBaY5scC7PwH0r9BHWe0fvmlOEvSKZDazCaBQvtR7j+4xALTDEqPGLYC+0/yNvM0C9zWe+ImqCssLUWYC2I4Gh80jP3RjdWIEidoqb2gw9Lg6vs7byqbswOqz5IVzXwiirtlExYxfgR/82EP4axKQ1Ssh42Jmh0YMHsgNr0uNaUFso1qxdXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY4WlWNQKHmiP+fJwOu0OlAPAHncJ/4xYG/UJMm6RbY=;
 b=DcGstUTI7eadfAw8nvHTTcxAb1DTphbLiO2TgzzYpQUOWkYBgPyMtY7FwDRb4mZyeWwYE3wy1t9BVprKBQHTPU6NOITLYT6D5qzCn6YfI2Lc0+ePCD7TAZClseVMWCAjNuZzv5nho7FqKFIy3NqXmJ7cTGI2Q/5a/SX/xekSGKjfcc+bs47y9EG9yG+rtuTrQWUFZCdfVyOV99W3dbN1Oy7NRKdg2cr5+vovm2m6ULip9MpolPbTGhhZvlcFaKucM8SOFUTmEG9VN1TEa/aWfoV2X77/0eH2d4lYtdY4bZq+ZVqGajQOYrtZRzHorOukFvUN3xBJeCT1v8oZRVX4cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8736.eurprd04.prod.outlook.com (2603:10a6:102:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 04:47:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 04:47:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 09 May 2025 12:45:35 +0800
Subject: [PATCH RFC 4/9] gpio: mpc8xxx: Make irq_chip immutable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-gpio-v1-4-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Keerthy <j-keerthy@ti.com>, Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746765944; l=1982;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4j9oSA0KByfIsCZAcLkqiclcrvnGC5RjquiLsBcg7yw=;
 b=m9EsFFtZVTSarBcHpAVUTna9caoXkUuE6kcPFnDzD7oDVAqVZzjlCrONBHcp3MN4mVnAA657u
 EjE4+OfWcejAsKuYBm/gW5dkjwMAgwcs4GGWrIJqWBAUotWKUog9ImG
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c18f505-fe80-4c30-9dae-08dd8eb49470
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3V4OU5sS2ZUVGNtREF0QmpLVU9nWS9rS1BHbXcyamIreS9laDZ2SGsveFI0?=
 =?utf-8?B?d1N2K2Q0cjhJMXhnL2dXVGd1OUhMNDBZUjJkOVY0K1kzM2hFTXd2amcveVhY?=
 =?utf-8?B?OTVacTRvanI3Yk9oZWZVcC90eHJubWwrUDM5WG9JM1RaK2R1NC9jdmhDQ0Fx?=
 =?utf-8?B?YmlLZXkvUk1sQzR4N3FoZ1lCZWlLamJtOUkxUGJWVjJwSFU2NjZCdWVmV2tu?=
 =?utf-8?B?d1ZId2V6SW8xektiNHRkUnZ6ODNJQnZwRmthTXFaZHozcnJVWkdxMkJBMHdt?=
 =?utf-8?B?RVR3eWNGdWVSUG4raFU3ZVUyWE16TmU1UGxKb2tRQnplL0l4ZWg2dlhvQi9z?=
 =?utf-8?B?Wm11MXhVRDRFUERjbHh6QWpwb2ZoNlFKUk5ya1E5bGtLcDUzQzd1aE5xODc5?=
 =?utf-8?B?ZnU5a0JwRzAveXpyVmJqcnlLbmlMbXF2T3daRy84RHphb2dPTHNGVzdGZnZa?=
 =?utf-8?B?aDRtam82NDdZaUE2MWwwdytRQ1dycm1ndGVZWjdwV09VMG1WSEIyc0lvN1BD?=
 =?utf-8?B?RXhxb0lMOFFVbW85Qmg4cVNHOUJoaGFURGw3UE9tM3I2bGhWdHZXRFhvZXo3?=
 =?utf-8?B?eExlQ3NUb1krM2k2bWJMZUc4T3hJMXIrTW5UenkzaHhSQTlReWNrUHY4eU9v?=
 =?utf-8?B?ZnNzOG5LSlhIckRBWnZLMVZrSTdhQjJBZS9tc2psRVVpcUg4aHA3VnFaaHhs?=
 =?utf-8?B?NEZjQWZUQm9LVTd0MlZHcnVodGJyQ3NUbFJPWlJhelQxUk5FQUlMNmZmaE1J?=
 =?utf-8?B?d1JlWEFES1owTmZhUG9yUXgrZjZjR2kyUHhGN1d3c205NFVWRjRxMzVhenZR?=
 =?utf-8?B?Mk9rTW5EK00xUUFvdVpuWi85eHJabGV5cG8wMkFHWnhCWjlQZ1lPU3NaaVMw?=
 =?utf-8?B?Tm5RS0FodkpjcVpHaWtyNEdxUXBlTXIrWFN2Z1dUajBoSmphZ3p6SUJoaE4v?=
 =?utf-8?B?WXB1TWRRSnVMU3VOUDZxNE9jYWp3MzN3bVl4Zkgyb2NUdTN1eEFaWE5OTThR?=
 =?utf-8?B?eXk2N1YyNkhpb0ZNa1gwTE1oVlZyN0Zkd1VBNlNtTGd6d3g5NnZjQ1F2dW5U?=
 =?utf-8?B?OHgrY1pwQ3BJSWRrQ3g2U2tWWHU5MTVQQksyN1RUcmVoMDhlTXYwUzRqNGow?=
 =?utf-8?B?VG9uQkZVSGU1RjJUTXViSkVOaEFGVU9nb2xHUWg4VzN1VG9ITDlsVkVJUDFn?=
 =?utf-8?B?elFYNWg2WDU2SENKMFAxcjRrbE5LSWNGb0VjZFA0NnNBT3BNNkxXSUI1ZFNl?=
 =?utf-8?B?U2VoNS9RMVdiY3N5NlRZYVpBdE8vZGpnaDM2b0tmUXdYWDNCOG1pYUdSclNl?=
 =?utf-8?B?T1JUa1lOZHdzWWdWMUI3K2RNYUZvZHVxYTNyZFR3dlM0OHBjS2k0WHYyZmZp?=
 =?utf-8?B?Q0lzdTRPbGg3OVdKTW1sUk56QURxSUlkbTNjV2NJb2F1Smw0a3Z5V0pKcklm?=
 =?utf-8?B?S3lDK0ZxdklSNVd1Nks5bTRRUC9SdERCbk0xRmZiYUNSdWhCMFhMQlZBcEp0?=
 =?utf-8?B?K3g2TDlJckg2aVhTUHNGV1Vtck1pU0o3a0VrQU1sRStrdUs4TlJNeVZ2elBB?=
 =?utf-8?B?bVdheDN0b0ZIZ2gzc3ZSaGJQM2lJZ0ViM3RlUm5RRytlWHphWVlkb0ZHeDFY?=
 =?utf-8?B?L1N2azV5a1dHTHpWSm9qd0ZxMU5SWDdVUTlKcUdkb1BtSGI0Mzh5SDV1dHpC?=
 =?utf-8?B?YURadldvcG1zMVZ2TTN2OTZSNjNHaXJlYU85cDI3M3AvVks1MHcwR2l4Zm9I?=
 =?utf-8?B?STZIZ0lSbmVOY0xFSDlsaEI2eGdmc2JPNTE4dDJCT1NRNjN0ZkhYQUhPTkMr?=
 =?utf-8?B?NHNRN3RhVkxibnY5eUFtd0lpMHo5ZnNGNm1sWnZkNjVOQVV4RVhxbUFoYnBY?=
 =?utf-8?B?TWhnVFM3eUZLTmtJc1ZBUmc3alIyQThZVllyWkxFcjlGNjRsaWV3RG1neDRC?=
 =?utf-8?B?a2hMZG1iU0h0eWl1ay94ZHJFeU1iVzdlMHE0eVR3c0NnK1plWEVPSUY4RzdM?=
 =?utf-8?B?MGpOTnZEMU9ETDhoazJkbjdZc2duOU0xMUVmdDBwQ1M0SmNHdUxGZHdxUDI1?=
 =?utf-8?Q?rnp6ZK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXIrSHBwYzFMVm5OSC9HNFRWbWdQeXExNFI4KzFmbUQ3Y2IvaHpQSGM4alZo?=
 =?utf-8?B?OTVaRDRsQ25OUkRiWlJjQkp4YTRNdUFXeG5OQVBzWU1OaWJEbDF3VnNxa3o2?=
 =?utf-8?B?U1MzUlBZcFNBRzJYb1hvUGI1WHBGQzJiM1RZRU8zMUlRcXZpOWZzbGIreWZz?=
 =?utf-8?B?MFdwZmd5SVZIWDFYeHhUVk95SUZxK244eGNpUTBkYk8wcndpVkoxN0kvRW42?=
 =?utf-8?B?TjFQVkhBY0UydnROS2IxaDNiSHRVdjQ2djIwbE8wK0xya1UzS3pkdDdOTkhD?=
 =?utf-8?B?Z001blZYTWFKVy9iSG5aSzlRRVRVUXk5cEs2SEo4VGd1TnZBTGJYZEsrMndE?=
 =?utf-8?B?N2k1OGZZa1Q4T0ZRQUcyc2E4cmQ3bDlYWmtrYzlYcUk0cEJYSG5KZ2VmZ3JY?=
 =?utf-8?B?ZXlxMVJDWHA2UU5OdVdJN1VNN1R5ejN4ZkhaU3RBU2xLeHhOWDZjSFl1ekhR?=
 =?utf-8?B?bjZWTVcrZ3ZGT2x4aEdJK1RGV0VxclFiWUlIbmMrcWVZNU1wUEFrTEtxQkxn?=
 =?utf-8?B?OHRFSWpxWDlXYUJVY1ltQ0prcUdZWkR0RzgyTFIrQ0Q0SVg2MGFPN015LzNn?=
 =?utf-8?B?R2djbUt4ODF5QSs1Y2NFb2dDb0NiMHQ4cTAxNThrQjQ4Q1NaRzRsVXBXY3FM?=
 =?utf-8?B?TElyY2VXMWFGTWQ3S2tYZkw1OFlQQWViQ05qckVMR0pBcy91WnQ1cm9rMjVG?=
 =?utf-8?B?aFRBcVg2TWdySGtIWFVPSVYwK0ZjWC9PeTg5U09lRVc2dnBZejhVNTZVVEsx?=
 =?utf-8?B?dGx3WTM2LzArMzdvdnB3a2lJV0Q4VjBiNW5YVWExcnd0aHlzend2L1FHbjU0?=
 =?utf-8?B?cUQ0QllHbUE4RlJmUjVpcTEvMzUvTlpRTVBTYWZGRG1sRXd4ekVjejg2Rldp?=
 =?utf-8?B?WTVJUzR5OU9HaFJQNGx0RHgxOThFcnlIYmhLR3pQMFhKYzdPMEtLcy96VThE?=
 =?utf-8?B?VEc2cHRQNEc1U0FGMGtlejlUbmJYVVhLdEJQZHcwN0JTbnU3c0NkUjNsQTBI?=
 =?utf-8?B?S2FURVprSC9xWFpwNzhIbWhGalc2SE1wVGMzNzhNeFlEZXpKOTQ3aThmOHpl?=
 =?utf-8?B?ekw3bjhCcE9JbzBjRTJLMW1HUjJzZGJXcG9wZ05oUDhHNmVLWXFUYUEwWVI2?=
 =?utf-8?B?OStxN2Myc2xQNUhscXBDVjM0eThUT3d3RHRSUWQ4WXhZVERlU0I5LzB3ME80?=
 =?utf-8?B?aDFtMkJ5TklNR2dtSGpDV2lhb2M1alQ2MVlFbDV1Qkh2QjJhQjVsQTJobjRW?=
 =?utf-8?B?cDdnWE5HQXBhQzFYQXBtcXY3RFYzbjNxSmRiMVA2Szd6S09qNEdyOUwvNGg0?=
 =?utf-8?B?ZExWRWtNRkZHbXQ4VjhGSFJNaGs4S1dNT25QdTRBWTA5ZzZHcTBkSnFZUDVJ?=
 =?utf-8?B?Mzk5K1J5akVQcCtRVDlZS2owZWhtd3p6RCtJYlp5WUpPblNGRE51WExkSEQx?=
 =?utf-8?B?NXdMZ2NqWEFjemdQQjZ5MmdISWYzWGZrdWRVUllDNDYvR0twSFlSUkR4VlJk?=
 =?utf-8?B?Ykt3QlY2cy9XNkJlYldVWTV2QVZBQ25aNEp4WE5Qa1ZFY2JtYVY4THZTbWox?=
 =?utf-8?B?b2hxRTFINzFHUEJSeG96WDkvTTQwRDFwaG1CSEVoaHVkKys5YjgyUHdUWUEz?=
 =?utf-8?B?TURHTnF5UHBoWDlCRnJldDJ4Y0lvSVhrYnIrenRpdE14UFA3ZkZKZ3B5TXhh?=
 =?utf-8?B?c09Ic1JFSXJFeEJaL3FWbmR5ZXNQWmNLQk9OVWpaU0NwbFN5Y1hmRWNIRVVs?=
 =?utf-8?B?R3Q3WWwvMUE1NCt6Q3JKdHozNTY1bWJGdWxrQmZLVDZSblV6WEZGc2Q4Njh5?=
 =?utf-8?B?aWVhMmxlRmNidUVqRDM4N3VKTFFkS3RVeituYzQyZGcyV2hzNVljYlRCOEZy?=
 =?utf-8?B?aHpXZjJ5QmU4YWNDaDlLa2w0WkppcFV6bXZYY0FlTGUyOUF6NlNHMVZXb01j?=
 =?utf-8?B?M3NNZWJNbTU0c0lwR0I2NE5xbXBxelFwK0UrMXNkNlhreHpHL0IyMkg1SlJs?=
 =?utf-8?B?UHJiVTQzVFhnRVhneHhWRTNQVFhJdFBBcE1yd3NrMithNUJOWnU5ZDBwRkNV?=
 =?utf-8?B?TmZXUzVmbVFOaFk5U0pzVE9VV2lMeGJ2Titha21xT0t1eU96bzF2SnZHSllU?=
 =?utf-8?Q?38MpnmX5UmfIKiqPXxLKk1y/T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c18f505-fe80-4c30-9dae-08dd8eb49470
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 04:47:19.3452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IIJjHMUSZEQbwNQBgNbWAHlEJmpE0MK7WgmqzCHRBA2PbGNyvRqNrMHKvGDXSdwAJTmIez72zzc4FrxZAjV26Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8736

From: Peng Fan <peng.fan@nxp.com>

Kernel warns about mutable irq_chips:
"not an immutable chip, please consider fixing!"

Flag the irq_chip as IRQCHIP_IMMUTABLE, add the new helper functions,
and call the appropriate gpiolib functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index 5415175364899ef621fab83748f4cea34f430556..121efdd71e451d4f992fa195b0d56d7146a6f3dd 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -123,9 +123,12 @@ static irqreturn_t mpc8xxx_gpio_irq_cascade(int irq, void *data)
 static void mpc8xxx_irq_unmask(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long flags;
 
+	gpiochip_enable_irq(gc, hwirq);
+
 	raw_spin_lock_irqsave(&mpc8xxx_gc->lock, flags);
 
 	gc->write_reg(mpc8xxx_gc->regs + GPIO_IMR,
@@ -138,6 +141,7 @@ static void mpc8xxx_irq_unmask(struct irq_data *d)
 static void mpc8xxx_irq_mask(struct irq_data *d)
 {
 	struct mpc8xxx_gpio_chip *mpc8xxx_gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	struct gpio_chip *gc = &mpc8xxx_gc->gc;
 	unsigned long flags;
 
@@ -148,6 +152,8 @@ static void mpc8xxx_irq_mask(struct irq_data *d)
 		& ~mpc_pin2mask(irqd_to_hwirq(d)));
 
 	raw_spin_unlock_irqrestore(&mpc8xxx_gc->lock, flags);
+
+	gpiochip_disable_irq(gc, hwirq);
 }
 
 static void mpc8xxx_irq_ack(struct irq_data *d)
@@ -244,6 +250,8 @@ static struct irq_chip mpc8xxx_irq_chip = {
 	.irq_ack	= mpc8xxx_irq_ack,
 	/* this might get overwritten in mpc8xxx_probe() */
 	.irq_set_type	= mpc8xxx_irq_set_type,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int mpc8xxx_gpio_irq_map(struct irq_domain *h, unsigned int irq,

-- 
2.37.1


