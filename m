Return-Path: <linux-gpio+bounces-23098-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3BDB0051D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 16:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 801F7542DCA
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F64274FDB;
	Thu, 10 Jul 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l0QES/Vu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012040.outbound.protection.outlook.com [52.101.66.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2A274FC8;
	Thu, 10 Jul 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752157349; cv=fail; b=GUQhwTbcrtmC/SBhaLrh5jOR2DuvwaxIPQyDQjuTUnGC/8eLHjhayLogXEzA+oSP/IpQ21TaQdX/jDLXGFUHmUvZJ6Ci7gvnQydQUxItsFXMbVqrapp3vV6qlEuUdVpk50afy19L/t0CO+ajaOKB6+ksx5OaN+7rnLxzsdCiMP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752157349; c=relaxed/simple;
	bh=oCPWJ5IoDs8SGk/M/GFLx4XlSokL9zzzShTH37fKs1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cAfF1KoRFuNfeXMS4slPN5zs4TCtUZSX3LDKmBuAt/TfXNsJ8fNA695spM1BhuabGm9skXWkHfj7Yi2dlxebjBuDn6kna+q0xPBWIEQZAqVGPOPSIB45IAlH+KrKNRAJf4Er7Kozy+yU12QN+9YHkPIVwa17WtOwuo0C11ryWoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l0QES/Vu; arc=fail smtp.client-ip=52.101.66.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ywCSJQJC9GXHDxAa5xbtJPxKAwljbA4OHTwkrA/cD7nBVb3P4rJCLHStCubXSJzIHzYVeS5vPFL08AGIBQBljkKUSsQ1UbSfLacGfu6ODy+eVSAVLEKGXw97oGof9Vd4l809AZxXJCMSgycbC8Fd/YeFrStZr2nHC8j0pswZRGq/RhM4V5fLTl74X/tbQlQlZJStyZ0awoTrqfXr958t+Fr/lcj+zy0k5E7jl3Tc1Rp6nStLxLtPu4uKCz2ZNj0l9wYqwXlPJgpLEgPyIDplyxtbLdmZqJS6qI6/5eJHBaXitxBqxjFgxrOJYXI8rjgL/kB+bfAum2dLfGHHmtP8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jigo68/SH8/GVA/l9+c9NjeTK6252zBgk9JZs3BkyZw=;
 b=UQThmE2HzQ9z/t2TN30E+vI7BXMzFyYBY8jkUc1HySqKgCj0NVkUC31Ee1A3uDKZn6wvPdQzadoSuOdjF2tt3e25W0KkYPtGQcvA/EsqUBmgMH9gSVvdBa+4x7RKMvF9BKleqwDQ7pcYh4nVma1IGWRJ5eu2+Ls8Tk5Rg8dXTHPeUaYj9Rpy1HCGOljqk0d/3Hp2UO97IAkOWZ2ZXhR14Ot1WoNB3lFGW/LkR2bAK2g/ag3zimOY0w/KRuy3FDgSqRbBnxTQf1DUSX0qSO800m+WdtrbVLo3yG+PB/HC4bBq1GVVeEAL8TXvGBSqR7lPVfUHcDBCRirC3HPSl62YBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jigo68/SH8/GVA/l9+c9NjeTK6252zBgk9JZs3BkyZw=;
 b=l0QES/Vu1Mv7MrTOnkv4LXjDZkDzTpylunJ6nYhKZfgwt06CZpppHJ23yQJFccQLv4u5S3Cq4gIMzw4n5HqlG7uLJIkdBANQAnezSlot/uHhN4r9lddfjRS9Fj14sgBWE+AAy18kB+xu2xGifQMjGtGLBsXfLqZHu0ZYZYKnRGBDGN6oyJwc82MbIS4Hq539MlHwNsg87ZNDnRH8fl8Pa2WC+CnQVO4Bk9k/usyemcYeh7PkfQTn2xl+4jhaK94QsL2xGFlwNH4h/IXMCuRQHZNKqLAhUN4/XfIkw0XJth5wbbxTMq3vJemaMYM1uetmtga09aMYbxqyhwjImQUTOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by DU2PR04MB8952.eurprd04.prod.outlook.com (2603:10a6:10:2e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 14:22:22 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 14:22:22 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chester62515@gmail.com,
	mbrugger@suse.com,
	Ghennadi.Procopciuc@nxp.com,
	larisa.grigore@nxp.com,
	lee@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	aisheng.dong@nxp.com,
	ping.bai@nxp.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	srini@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	s32@nxp.com,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	vincent.guittot@linaro.org,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v7 09/12] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
Date: Thu, 10 Jul 2025 17:20:32 +0300
Message-ID: <20250710142038.1986052-10-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|DU2PR04MB8952:EE_
X-MS-Office365-Filtering-Correlation-Id: c304e9d4-9703-463d-60b8-08ddbfbd2f3b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1UwL093SGlYNUZJYzd4eW8xWlRkT2UyVWNleVFobXdMR2RyTFMycjFPNE95?=
 =?utf-8?B?ZWxQN0NtbW9JMi96WWtzU2dvYUc5enduY1BXNFhENS9HRkg3MEM5WFlVRmZ5?=
 =?utf-8?B?eWwyZWJnMXlRUXRTbzBhb1JGZE5oVzFVdSthViszZzF3ZDh1eXlGbVl6dm16?=
 =?utf-8?B?R0Q5ZGw3S3JoaFd5Y2FCbE1RenNtNVRHSUxDY2hMWHVMS3M0aXVzbjVseW5x?=
 =?utf-8?B?QWQ2VkdyWUlCaGM4NWFVSU1JYjVoVHFKMXpCd0FtZ25KdHNWS1N0OVRLYXU5?=
 =?utf-8?B?MHYrMUllaFpiaEhFVXZlcFc2cDE0ZDFRQVJ1L3VaV21sVExMOVNqVHd2U3FU?=
 =?utf-8?B?UVJtbEhsMUYwbXIrTHcwS3JSMjBkVGlCQkZMemt0TjRCZTRJL01mTC9zeVll?=
 =?utf-8?B?Rnh2d25keW9yeStZQUhoWS8rdFFOMTVBMjV1TVAxR2JML1J0WTN5cVEzcHpr?=
 =?utf-8?B?ODRhTEphZENDV3Q3OTV5VmZ1ZzJjdmRLenhMVjRBTGMyZ2JDaDhHb0hXUVZx?=
 =?utf-8?B?LzY1YzhjdFlFVng4N1FxSTZ4RG9WUk5tcWY4allQY1ZIR3h0Kyt2TW82eVdr?=
 =?utf-8?B?VE9WSlR3OEtHQWZ0WnhNUlRKcjVNYnFHV3VzaG5rNGZ5dzlhTmhqYVpHYkh0?=
 =?utf-8?B?VXprSEo2aTZJdWNuTUNVeEVWZmJsc09odEZNMTdwU1pncm9aRjdPY2FxTGVr?=
 =?utf-8?B?RXFIQVBxMWdobkR4dktyL2ZoTDBJNUNFbi9Uc1VTT1ZRZkFhbXl6cjhwakRa?=
 =?utf-8?B?TUpxcUlZQ0s3TElTcTV1ZDhFSU13UkswZzd2TkMrOHI2dDF6UWkrZ1pxQWxv?=
 =?utf-8?B?VXZTT1ZlOVM0Y0Exd2dkQTRLbCtUdk5yMW1mVGFDUVBOK1l3ZzRLVGlzZ3Fv?=
 =?utf-8?B?bHBTTXlNWWNRblp2QzdjbTBlU3FrTllJVmszYklBVVhWUzhJdlViUHBubHc3?=
 =?utf-8?B?d096b1ZDL21aUzBmM1M5dU1QNkRiQ1RHMndiaEdMOGJuNGhIOVl4aXpFaGha?=
 =?utf-8?B?MGlucFJYYkJ1Q093OGNNbmFFTDkvcnVsNWRWbUxidytFSTE4R0hRemduVVNh?=
 =?utf-8?B?aFlDRmxlaU9tb0Z1RFFYU2diQ3hiYWRERU9mcXIwdHFicDlsNWp6dTlNNUxy?=
 =?utf-8?B?MkhPcnU4VHpmZmhOL1ZkOHNZeTVyZXFIVDRVZ0FkcTVtQzJNNDZUZzNRY0xJ?=
 =?utf-8?B?NUI4b0dQMTBobFdhY2tudmp5NlAyNEZ1RlZkQmR1RjFvZElZaEE2SllRR1Q1?=
 =?utf-8?B?R29zMDlKN0JTWnhIOUoxRnpCcU43T2FRczVFbXdSUmNIcFhKSmlPekMwdXQ1?=
 =?utf-8?B?Si9GRTRGV3BWTHFrRk1yVXJJd0lrV3pFeXlBdnRrRW5MSDkzMVNZK3ZrSCtq?=
 =?utf-8?B?L2R1SThrUjd5L2RCNnlZa2ZDY1BQaTlWY2hpUy90Qk0zdmJEczRJOHR6bEI0?=
 =?utf-8?B?aEVsTk93MnhFODZrSnZ5SlZYbC96cVl2NHU2T0dqSGNnS1M5U1dRNWRrdndB?=
 =?utf-8?B?VWN6UTNSRlJRN0J3a0JiN21NcGtET0dUK044SzEvdEtaeWRKN0hEQ2IySHZv?=
 =?utf-8?B?ekE0WFgyUFcwTyt4YU5wTGdPRjhpb29jTllBZ2ovRUNkc3FkdXNlbW9xcitr?=
 =?utf-8?B?SVh6OG15UW9HWk5aVlZNeFNOdDJjci9hc1creHQ2cG1vSjBWU3JTL1dPcERY?=
 =?utf-8?B?RnJIOC9OdXI1N1RnRTN0YWgrQ1A2YUNGdTZaTTBIelprSUo4OXVEazVybVZP?=
 =?utf-8?B?bnczc0RycVFqRjNoQjN6cDA0ZVJkSGlrV293RDA2ZEU1bk5mUWpONVdyaWFH?=
 =?utf-8?B?RkRMNzdPNkVBdEtkMzRiaHZWY1JqQ2tETzFhVkdJakJVN01GdkFPYW51dUM5?=
 =?utf-8?B?cFcvcDRBVWswWS9BejJseUx6Y3R1S0theHZjdzZHY3M5NUc1TlQyalJYWCtS?=
 =?utf-8?B?cXZYZWd0Tnc4SGZqRUtkek5RdDVRMG1YY3ducUpEc0pWUSthWG04N2lBdWpm?=
 =?utf-8?Q?aVjgMcK5ULDtcaF4xDmAS0/4UyahaY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzdvT1V6U1oxTW5lVnNrbXhlN3NaMm44TjNnMjZwSXQ4a09xdEtzeFdkT3Zl?=
 =?utf-8?B?R2F4OTBBdmRWVW9vRXhlb1NvdlpIL25xM2RyaDlyWUhTTjhqUXJ0MmtkTHJE?=
 =?utf-8?B?aCtnRmxQL1NtZE80Q3ZCWVJiVFloU3Uvckd4SHdwZ0kydUdxd0lHL3JLV01k?=
 =?utf-8?B?Q0V3TW5HSGFJSWU1SDBRUlVQdTJNUkptTkZmRXFvaGVNU0oxVmNjbEZzeDBX?=
 =?utf-8?B?dUpXeElEcmlWajlkc1NnZW14Wm84bGxBcmdzUGhYUEZHcVpiSEZsR09MQUpC?=
 =?utf-8?B?d1YxQ28ySlVZZ3oxNjdseXRvSzFUWXRCeHkveHVKdklQZkZERTZiNnhWSjR2?=
 =?utf-8?B?WHltaHNjZndZZ2s3cE5jak0vUURNWXo1VEN1SjUwc1laVUM0ZWpRaTJJYmlt?=
 =?utf-8?B?TUI1YVREZWdWb3FMMjRjZ1ByMmZJSXV2Q2crbWRNT2E0dTZ3WDBUVW5pZ3pJ?=
 =?utf-8?B?aU1CUXVRVHdhbElMVDdhQlRXaC96SDNLVXJBcDY2Y21oNGhQd3dmS0loZVBW?=
 =?utf-8?B?RzZ6ei8vYk5PUVZBRXBpK0xqNk1LaENHd1BEMUxUa3Zpak5YUUc3cEQrQmNW?=
 =?utf-8?B?MGcxQzV4dzdhSnVCbWZiTXlFUjkrYktJWDVCWnpMb3hFRFQ4Y040TmtjcVdZ?=
 =?utf-8?B?V283cFRNQjE3akprOVViM1UzdGJZdXVTMDZVdTJFUk9vMkt4dXBmMXR2dHU4?=
 =?utf-8?B?akYwYmJrYXkyckFTeGVQcjRRb3lpZGtGS3R2T3g0SkJ4S1pFeFIySnRZWDF5?=
 =?utf-8?B?QWxJbXlucUc1VnhRZUN3QUJER0lnZFE5NWhYazhHNFUzM29JV3pJTkhZSjdG?=
 =?utf-8?B?eVFySGRrdGtlWVlZTkExK0ViNnVnMWxDdEdFR3dFYWRhMko1bkxuSmpyYjcv?=
 =?utf-8?B?OFRSTWw1K1RlZnEwWlkreTlucHhkVzREejY2R2l6QmtXREJpSG9JM3N6WElD?=
 =?utf-8?B?eHhhZGlNeWtSL01lMGxSQVBIOWtaZW03bWg1dWxCbDhqTzZKTzZTbUFJNkFw?=
 =?utf-8?B?dzV6dmg0ZFZDTHhPYS83S0pNWEdkVDlVN3hGWkVwZkE3b1JJenduYkhVdHF4?=
 =?utf-8?B?YSt1RjJYb0RITzcyWGpabU5XNUE3VGxxWlhvcGxLaHBrUFk4SVBobnh3Nm5X?=
 =?utf-8?B?bzVGY01tYVdOY296K1dsakpmS2RqWkhmTnIxSEx0MmxhUFhwd28ydFdkU3VS?=
 =?utf-8?B?eHJNZ1lYcUE4T09VdHVXTDRMa1dFNXVQRVdOWmFxL3ZJYUt4dThWY2E5YTV1?=
 =?utf-8?B?eTlJbXBhRDgzUlAyaHhRaFIxSTF6T0QxT0lYRXZ4aUk1ZjZ1R0tvemJ0R2FY?=
 =?utf-8?B?cS9xK2pPb2d4MkI1Y3VqUjdTQy9uU2tLNGl3d2ZFbVdIdTRkQkNzTEdsYnlZ?=
 =?utf-8?B?bUYwSmx5NVcxa2sxTVRiLys1cUtzaUR3Z2ZKd2xkWTU5MjRHTkFOUHBuTzJr?=
 =?utf-8?B?cys2UG54Y0hyRFhNaEV3aUt5eTAvU1pON01mdnZIdW8vczFnY3ljWTlEazI4?=
 =?utf-8?B?NmErSGw2ZWNhMWZSREs4NUpUMUk5RVFHcjdDdWhWNWNPaWw0SnBWeFhZTU9H?=
 =?utf-8?B?SU94QVRac2lIL2JnRzJIdGFtM3I2K3hCMytJS0ZxKzlBMGsvc2t5QmdVai9B?=
 =?utf-8?B?dnoxMS9odHpVcDFMR1hocGVGM0c1NG5SamNMMHVKOGJCRXp0VDVRSUprV0Uy?=
 =?utf-8?B?YVlaUlU4ZHJIOWYvdnV1Si81b01MWXZseVdTdnFUMzVxcUlTdXpSYnpGOW5K?=
 =?utf-8?B?eU9qcGovVkdHZGhSWW1raWxCd1JYRTBEQVdHeEc5bnoyQ0M3ZStwU1kyNmJr?=
 =?utf-8?B?NzVXNkxaeW1kRDRES1NBbXpzYjRMZ3Roc2FvdW9Pc3J2ZTlFRmxSQXc5WHlL?=
 =?utf-8?B?QWpVUVVLd0RVN3dPQ3VSZ2U4MTcwWi96TUYxRldGb2l3UmFHSEZvcUc3SkhH?=
 =?utf-8?B?dk1IZzFERjlBcE91M2dPbUxURGdzaTJMRDBpMWc3MGdETUhhNk5oOExjcjJ0?=
 =?utf-8?B?VXZVVUgxWUpBcEs0SnBMWGhPSzdrdGVFcXhRcCttOEZzeVdkenNoZkZmOTNG?=
 =?utf-8?B?blpEWUhzN0dxdGMrdEVFd2syZUVxUTFxa0pCSFRxR01EU0VIZlZiWXBCT3V3?=
 =?utf-8?B?cWdQaEdhQ0p0YndhKy9BWG5hWlpXUVZXc25xR0hFdEwrcnliVm1kNVF6Zkcy?=
 =?utf-8?B?amc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c304e9d4-9703-463d-60b8-08ddbfbd2f3b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 14:22:22.1357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xp/dD6IQMcaWN3vc601TiRG2fELKfihTNwtkAFzSxq1PiompneTUVzDys68TijgEMWZ1tUhXSiMDPlewC1ZfGEG+NI6QjAyX8kmgW1lrbKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8952

Add the new MFD driver for the SIUL2 module under the NXP S32G existing
entry. This MFD driver currently has one cell for a combined pinctrl&GPIO
driver and will, in the future, contain another cell for an NVMEM driver.

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efb51ee92683..3e9b54bbcdb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3000,7 +3000,9 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F:	drivers/mfd/nxp-siul2.c
 F:	drivers/pinctrl/nxp/
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
-- 
2.45.2


