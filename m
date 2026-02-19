Return-Path: <linux-gpio+bounces-31916-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDyLE6aNl2lv0QIAu9opvQ
	(envelope-from <linux-gpio+bounces-31916-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:38 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B9516328F
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 23:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22DF305309D
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Feb 2026 22:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBAB32BF41;
	Thu, 19 Feb 2026 22:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BulgruD+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28AD325710;
	Thu, 19 Feb 2026 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771539845; cv=fail; b=ah68pAemQBjIu+FumikXuCPC3gFUNzXbJ+8UrKluaMGWzJijBirYYaTiqrRJs/RMwu7c+6vdE0vPYkgyFiwBPYhJU0Ab2R6favFQbbxMVCFJc084IOdVKECGxy3vMZCOeKoV3DYU4X4MWyx+UB24bb63RZGclMq0MSPCc6KYy4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771539845; c=relaxed/simple;
	bh=Y8GUE9F9ST1FbBTx4WNJsmsAfuYMN2404FDADTZ+1Tw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=K+GySdTyGuEmdKiI5Nrnnh1wROQInxRxueW9fLOJAS1R4M9fTyFCj7y5s7LYDSaV2jodOO0gn+U9MrpEuXrCqFh6VtajOqzgxMOmSghEduOsyDb0SX7JMnVW1gC8nZ6cQiCfrudeTcT+wo6X9uemkTp0N+uciE48pxPxyzVatcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BulgruD+; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BaPqYyZ1iD79ScGS23NXNYu7fAuMuRjjLfSKn6GF1taMVnocM1WucawGNIJ0x/3r34mga+9D9RiHjhoKsq4Jqw8lNysMXgkIDl2spe0iVaLvA31Ydp7AEtqqrby6Ma6NbM8NGd6eMxRbKHG4WB4r/6S04nfeYvqAZ7s5cEJuWgKrqCO4ULyJfxOtoROue+mfbWfzCJ0pK6PvlhqC8wHAwYHMKmkf9GVGFjazyMhf97Wczanm+wLjucfpj1OGNkvSFaSVr1duaiGjiTOY++Lqsvj2C7W04NZ77tqsOMNrVOBGe1gn/qU4vckBQX34RL64biiqh3D4jCHW/+R0EIiM6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h26NtlskPsrD0vUQqIgefzRXVEcA8uejl4Rlif/etfk=;
 b=BwxwuyRer21JG+LdBKjx7ppIvzbffIXYdRlySPFvibHZdA4jMSPUi5ETLNSW1rlJ3PlhyGbrHr3sfTsppcd2SWaGA2y/Y2zDU7rcyWzQvHyW//R0lRuaMp2TXZp2vhqbX+3Ztuo4YsglovrsYVgdB9hjSv3XRVli4LTX3ueCgXM3zmaGNB72xpXgyolKSpkj3knWftdQ8Usme/U63zmM5PJWd1aKpBm7BvfoF+9SGKmTDyH+Eyvk5LROjJYpEQ3bdhr31ZNmwlWMnSncT+yj453u8JT3/7WHOBArXvkfUrzVq6WCxkCQ38j9dVq+nGd+lxvnktQy6NRgWUhQ3WCU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h26NtlskPsrD0vUQqIgefzRXVEcA8uejl4Rlif/etfk=;
 b=BulgruD+eDbSE9gGNcq732owfSyHixxvuYB7OV+RnX1hNMAKsYIK0cSSxjw8kHAwveWRC2X5bIy0CH8UjWn2bpQKV5/KO8Hd/2kDztP/TC2b5EEC9Yq3T8sI9XoIdXoIMLXjrQuj6Tfw4p2Y9BU83uHyHVW3Wcci4epbex/HdJaVYlTvaoPpsJrelzm8EpqEicy4VQLDPBPfIXrH4jdGfCl2BzolKwh0DclY8z1FoWxtkY+CxAoV0d1VzI2HrBGInBcXkFdo3jDJmXTjE0ZDDU0AjUpaVoqreYD5wxv/uedFI1Q187j2sjddWfUIXPeuZ9MInWXx1yAjr6e9On4xuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by FRWPR04MB11281.eurprd04.prod.outlook.com (2603:10a6:d10:19e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 22:24:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 22:24:00 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 19 Feb 2026 17:23:42 -0500
Subject: [PATCH 2/5] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260219-pinctrl-mux-v1-2-678d21637788@nxp.com>
References: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
In-Reply-To: <20260219-pinctrl-mux-v1-0-678d21637788@nxp.com>
To: Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771539829; l=4196;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Y8GUE9F9ST1FbBTx4WNJsmsAfuYMN2404FDADTZ+1Tw=;
 b=koH5wPVRery4H8altJRSjL/CwiTEh7bFzmKPwyhRcEppm+yEM52AKAhLVQguvQvkkk2RPXout
 28FDdeLACD2BLHUiAR9/eOFCHuAHbnTuNpFvyfHARfd/PsRGDLqUX3J
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH3PEPF0000409D.namprd05.prod.outlook.com
 (2603:10b6:518:1::50) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|FRWPR04MB11281:EE_
X-MS-Office365-Filtering-Correlation-Id: 499b5a4b-79ef-407b-68db-08de70059448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bk9VSVJzNWI1RVZISk5RakZ5cXhVdjRNUlN4QXJ1UEJXZWNvRFJvcGluVCsv?=
 =?utf-8?B?QkhpNEFrVldSSktDNmNWcFdPTE90dEsyS1hnS0Q3WUFHMG1zMDB1a2VHaG9p?=
 =?utf-8?B?OXZCL01QNnE3QzUzUUhyZTFVK2RjOVZlRUt4Zi9CZGtZckNUZ3QxaGR0eEY0?=
 =?utf-8?B?NFEvY3d4WmVTTEwvT05HUHBjZ29sc1p0TkFpaGZZWU1abkFQTGtwRG0rU3BR?=
 =?utf-8?B?VW5XRXViTk5aYUdyZzY1QktYclhlSTNob0JMWVNwM2tVZnBXdElpYTY2UUMv?=
 =?utf-8?B?R1FRL0FFT3lWdmp4TTBnbWNDbVhaaWRwQWRMTFpNRXo4ZlVVVkNGbXoyVlBL?=
 =?utf-8?B?bUhNM2NnbFhQQ2lzQTdxQXcvNW5xUFRPbnpRTE95Q0ttaTE4MnJUdzEvVG8y?=
 =?utf-8?B?MzFnK0k5R3htUnBtNzBnK1N4eFN2V1RDQUVFMVNnTVZiNmEvRXFNcjZFcUJx?=
 =?utf-8?B?MFBYMVM5MVphUk9ERitUZWl6aW9sUkppclNkVkdSVXVJYnhEd1FDZ04vbVpF?=
 =?utf-8?B?R1JTbWRXWU5hRFllWHYzZUxMUnBlYUhjRGJFUHdLck43OUowOUdvNDRmN0ZR?=
 =?utf-8?B?bEJMYXRxMDdOdHJBeklaTEtyZzFjeENZWFVpS2JlWmd0QlJhYk5qT05CVUJ5?=
 =?utf-8?B?a1I1MFpRVUlZbHFIWUNmR2oyekxva0RreEhDUGRJRCt2MkltM0F1bWc4OE5l?=
 =?utf-8?B?MklPUlJYRnNmaklTTFp1cUhoeDAxaE1zRWhjMkZDdGpMWjcwY3I4RXR3Q3NO?=
 =?utf-8?B?TXk3aWRaL0tvejNQNHFIWkpCOXJISGRTQVdSbnpyaVI5T0craS9DeGxBaGYz?=
 =?utf-8?B?N0FsVjd4TUF0MmdaakRZUSs4UHluWW9JQVhUNDc2ZTV2UVVabjBzQm81T2Rw?=
 =?utf-8?B?V0VVb1dBZDlVUVMzRy9adlZGT21hako2RC9FTWgzTDZITEN1TzlQMjM5UlAz?=
 =?utf-8?B?ekc3R3ZJWjN0WnAvU3hXQi9OVkxFeTZpZzFsRmQrbno4QUFvaFkrejllcnZ2?=
 =?utf-8?B?MjhhQXpUTEVScFNqS2lPb1V5VHdEM2pVNktDQWxhV3RIZkFHMEh3V1VzUHAw?=
 =?utf-8?B?a3RCQVUvUVVyb3pEY3AvT212SUUzZkxmcU5LSTU2azFjMi9kczJSckZUVSs4?=
 =?utf-8?B?STU5QzZtMkRMYlR6eFFMdHJ6ZjZGbjZCL1AzS0xSMzNTNFdaZ29MSE0wU1RG?=
 =?utf-8?B?a1JxNXNMOUlnTTdBcXAreGpBRHZRTmtrMDAwOEJUWWp2ZytBeGx3NnAyQWY0?=
 =?utf-8?B?T3FEcmpwWndWa2g5SHJJRHltSUJGbXMwZ0QyYVB4WXZXRkVvOXZmSlc3TE5t?=
 =?utf-8?B?YXkyVTBrSEJVMXhlN2pQMmRsRGluUTBaMVJqMmpFbUVOQlR6QWVDNWlCT0xj?=
 =?utf-8?B?Q3pWdEhyN24yUXowQXB1S2dPbFNYYnExSHVhTnNxcXRQZWt5QVNGODhXeExw?=
 =?utf-8?B?YWxDVUpvaU81eVJ2UE9LMCt5S3Fna1dVNDZWUVJkczFhdEtvTTkyUkFlbnBU?=
 =?utf-8?B?WHVYUy9PZnBZemlWVHVkY0hsdTNVdEN0dUVDM2dQQ0NVVG5IVFRZUzZ5MVZy?=
 =?utf-8?B?OUZVa2xLS2UyV0FjMy94TkxZN1lWb1ROS21qMHBRSVluUUVaUVlnTFN5dDVJ?=
 =?utf-8?B?RzYvalBmQXptandvQWxhMFhqbklDSC84dWtTbnorL3YzVEVrd2llc1JESmZy?=
 =?utf-8?B?M0JiV3RqNkpuRFRjQzgrUWNvUkx5NUlKUE5hOTNaSTZiWFkyb2lSNWc1bGgx?=
 =?utf-8?B?c2p1QzlTd20vRFpRWExnOUQ5QWxnYXg4c1Y1NFZOMW9rR2VtVE1jZVJoOW1i?=
 =?utf-8?B?VzNsYVNxVjZ1eC9DVVhPQlBuRjkrTHBjaFZNNFBXckhoSFpMbHRpaGJsWk9T?=
 =?utf-8?B?VjkwY1AvSWhBbFZSdVQ2cmVBQjNMWTRuWWRHVCtqdVpqZ1NlTStyWmJpQmd4?=
 =?utf-8?B?eXVVVUp1dlRqWG5KV1paeitmenFhT1EyQ2xMZjJkWFlNRyt4czkxU0lDajc1?=
 =?utf-8?B?WFhuYXJxaE9GOHdyeHJ4L3o5RWRha1NtbWN5V3dmVGlXdzZWR2laWGR6aXhu?=
 =?utf-8?B?RlRCWHdOR0xKd2drVkkzQ2F5UWhtNmY2NDJGYThjdTA1bmx0SjZDTFBjbHZ3?=
 =?utf-8?B?MmVpd2hESVVRN2oranRzTHZ6MElpK3RUV1RyekhRTGJxUjRsUndGbkJiSHh3?=
 =?utf-8?Q?vsoRetG4RTc5V5n5fFndizA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFBCQTgxNkpPWUdXRWFMWFRud3dCdlVrSytKWkZvdHZQUTNzaUMrYUozVXZS?=
 =?utf-8?B?akRpMVVwcGJ0anFVTHdJamVEV0ZCWHAzQjJQSW9CTThFYzRKc2kyb2ZuSXpC?=
 =?utf-8?B?bWZjOFFVUysvR0x0R2pVRHZVNFlINUMzZE5MUi9ESDRTWUZPOGFPL1ViU1BB?=
 =?utf-8?B?ZStTL2c0empNNTN5VlQ5YXl0a1VSTWEvb2hzUU5Yemg0TFRubU5VR20zTXJC?=
 =?utf-8?B?bjgxVUZSa0REMm1pUU5GQk9rQVE3ZUc5S3dHaTQyL1NFN0hRWkRBcXk1MnZB?=
 =?utf-8?B?MkZmdHdOMG1mWEhsNHlEVlZUWlhreTQzNG0rNEpYOGl2elhMNjVxNFlINUl2?=
 =?utf-8?B?aXRORHBwZTlLYkg2OTJqc2hBaDNSZ253TmFvdFpDWDZNY0Q0MW00SXMrLzhP?=
 =?utf-8?B?YVU5bnM4bXQrS1JJZXJlejZwTEhZdTNVc3ZpRFQ0TjJYM055c2ZZM1dFQmMz?=
 =?utf-8?B?VWJ0MXJWeVZlU3NhczExNnpPZEhmbVNPZmY3WmpZWFZoNE02RWpHNXlzYXEx?=
 =?utf-8?B?dTBSUEowclc1dFpyUXJvcmtTZFpmT2JHSWNteUNTRUpGOExnOFN5RVRKZWZ0?=
 =?utf-8?B?WVNwUkxoMGZ2c0tReHRWUWlVbG8xdVhOMjUyTTBibmZVbCtGVXpQWFAyK0J3?=
 =?utf-8?B?M3VvYmhRNTRQZ2wxdEVOWVcvRmQ1aStBdWFWcW0rRE1VUGhsVmRKZnJGNkhj?=
 =?utf-8?B?MjFwMnVBMWtKOFBGdEx5eVFsVmVhcDd6enFJYzljbVZlV1l0cWQ0UHQvRXcr?=
 =?utf-8?B?U0o2UTBpMDl3VzNQZ3BVNzBqMTFuNTY1dzdnckJIOFlPWU5jSVZqWGtCRWFn?=
 =?utf-8?B?UDNlNXpzTHRyM3F4M09wTFgvdER5YllnTEtRaSsrWXA4akVLR2ZRb24rWXdM?=
 =?utf-8?B?dEYvelhNOFQ3MGl1VGxlRUdSanpjMk0xdlVURFQzK2xMdFZnd3Zaam9XYUds?=
 =?utf-8?B?VDFjNlNuRXVaYzVnM2xMdmpPUjNmNkRyMkYrWFk1ZTBkZ1FvN0EzOFc4WFRq?=
 =?utf-8?B?YWRmaktvTjNZaDJzRTJMSmlkVXBjSmlMc09tSi9GZ3FVL3hjZ2hDdGpoQTlI?=
 =?utf-8?B?ajMxbVRhTVpXS0lhZHJmYTlEdTNrd0U1eDFHRWlubHYzVW1yN0VoK3A1OGw0?=
 =?utf-8?B?NUs0MmNhOWhCdXQ2eXQ2L05DZDV3TUR0WEZreTd1bk92QkhsUURPUVlGeVZ4?=
 =?utf-8?B?T0ZyT3VoYUtza3E1dDZzODV0dzZnV0ptN1NuNmFlMHg0b2lzYjVFWGJlRExG?=
 =?utf-8?B?dEFjOFhkRlMreUJOdTlzcU5OZ0l4elFvRnBnUzUwVWN0Tk1CanJ3SWdoS2Jv?=
 =?utf-8?B?OHUxRjRTQndBZzFnNHZaQ21rY3NmTDhRZE5yUHNabUdHcVhrVkVKS0ZCVXlY?=
 =?utf-8?B?bjMzTjNrZEhnajBkTnhFMVFXaVhLay9Ga0d1YnlocWJnL0F5dXVuSVpub0N4?=
 =?utf-8?B?NStlbEYvWDJFb2J6S0tGV2l5TWNLKzFzT1Vxb2tkQitCSkNqd0t0MWpWRXZv?=
 =?utf-8?B?ejZkR0xWZnU0b2paRGhEaUFGSFFuQWdnSDdWY2p6NTFYTG11d29qQU15bExL?=
 =?utf-8?B?S3VKSzJIbE9RZ1BTdURuR2F5NzQrMmZKdUtpZWRVQjVRRFNxSmh2Njl5eUhX?=
 =?utf-8?B?bGROUHlXdVcwTzlaSU1PelRFU1g1dkliZkY2VjZsVzNoZVE0QjJTcnZSdGoy?=
 =?utf-8?B?RDY1YnZoZ09Lc3Jndk50RSttTVRaYVJXRmVkTWFVeGFIU01wUkwrRGFEVmVE?=
 =?utf-8?B?Z3YwOVExOUtERVprZjdnZVBQQjhvT0FjNFQ0NFRleUZvZktQR256U01HaXRL?=
 =?utf-8?B?WjJBVXcvUS8veGl0RDhxMjZqd2RhbGxjQW5zRm9GZlZZMy94UHUxbDA1OWR4?=
 =?utf-8?B?eEE0U1Y5dTE5Q1J0TzhySTdWeXVqMmFSUlM2dXRSMUFoU05nS25PN0dQTVNm?=
 =?utf-8?B?cWJLRVYrQkQxNTFHdG9jdWQyMzNZTG80YkZObVA5dXFYUUloamdER1dNUU5o?=
 =?utf-8?B?ck9rQzlBRVJIeWxGWHBmSWgzd25DSFZqOTJvdVQ4R29TVFk3UjZqbUJ5aFp5?=
 =?utf-8?B?NEE1TTllM1VBQ2dzVzJ6a0lQeVBZd2dkaEFKeEd5V0RjWEY2K1RuMTV6RDl5?=
 =?utf-8?B?M0pXckl1Vy94TDFuZUN2NmxJejFDdERqYWpmRzFESndUQ3Bhb1ExSGtWN0Mz?=
 =?utf-8?B?ZVE2eHhkT3d0ckFBUkRhUFZoZW9MS1A3bHg3aTY0ZE1oT2pnZjRQZ1gvTzcr?=
 =?utf-8?B?SGQ2ZzE0MlFSc1k3MzV3UmV4bVFXK0FBUFU0cTByQ3dHSVhuYUFRQ3VoaHJh?=
 =?utf-8?Q?RLFAcLUyz8LHkZaxka?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499b5a4b-79ef-407b-68db-08de70059448
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 22:23:59.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHL/zbmvFuPRbdgs4qWUdOJg1aMRmXiVTCwe/tSxDqLUNpKbFrei8qXM+cVMkjzWDvRnnAAemlULawjGUZpUsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11281
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31916-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3B9516328F
X-Rspamd-Action: no action

Add a generic pinctrl binding for board-level pinmux chips that are
controlled through the multiplexer subsystem.

On some boards, especially development boards, external mux chips are used
to switch SoC signals between different peripherals (e.g. MMC and UART).
The mux select lines are often driven by a GPIO expander over I2C,
as illustrated below:

	┌──────┐      ┌─────┐
	│ SOC  │      │     │    ┌───────┐
	│      │      │     │───►│ MMC   │
	│      │      │ MUX │    └───────┘
	│      ├─────►│     │    ┌───────┐
	│      │      │     │───►│ UART  │
	│      │      └─────┘    └───────┘
	│      │         ▲
	│      │    ┌────┴──────────────┐
	│ I2C  ├───►│ GPIO Expander     │
	└──────┘    └───────────────────┘

Traditionally, gpio-hog is used to configure the onboard mux at boot.
However, the GPIO expander may probe later than consumer devices such as
MMC. As a result, the MUX might not be configured when the peripheral
driver probes, leading to initialization failures or data transfer errors.

Introduce a generic pinctrl binding that models the board-level MUX as a
pin control provider and builds proper device links between the MUX, its
GPIO controller, and peripheral devices. This ensures correct probe
ordering and reliable mux configuration.

The implementation leverages the standard multiplexer subsystem, which
provides broad support for onboard mux controllers and avoids the need for
per-driver custom MUX handling.

Allow pinctrl-* pattern as node name because this pinctrl device have not
reg property.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 54 ++++++++++++++++++++++
 .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
 2 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..31efffb3167cba724b1afe0d403a0dcae65582ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-multiplexer.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/pinctrl-multiplexer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Pin Control Driver for Board-Level Mux Chips
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  This binding describes a generic pinctrl driver that controls on-board
+  pinmux chips using the multiplexer subsystem.
+
+properties:
+  compatible:
+    const: pinctrl-multiplexer
+
+patternProperties:
+  '-grp$':
+    type: object
+    properties:
+      mux-states:
+        maxItems: 1
+
+    required:
+      - mux-states
+
+required:
+  - compatible
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pinctrl-mux {
+        compatible = "pinctrl-multiplexer";
+
+        uart-grp {
+            mux-states = <&mux 0>;
+        };
+
+        spi-grp {
+            mux-states = <&mux 1>;
+        };
+
+        i2c-grp {
+            mux-states = <&mux 2>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
index 290438826c507ec6725f486d18cf686aa7c35e67..20176bf3074757de30f208e69b968a6bd6125273 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl.yaml
@@ -27,7 +27,7 @@ description: |
 
 properties:
   $nodename:
-    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+)?$"
+    pattern: "^(pinctrl|pinmux)(@[0-9a-f]+|-[a-z0-9]+)?$"
 
   "#pinctrl-cells":
     description: >

-- 
2.43.0


