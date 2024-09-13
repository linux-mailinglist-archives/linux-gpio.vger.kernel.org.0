Return-Path: <linux-gpio+bounces-10052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E348C977B13
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 10:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 225221C217AA
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Sep 2024 08:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24A31D7E32;
	Fri, 13 Sep 2024 08:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wApw0FDv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3E1D79A8;
	Fri, 13 Sep 2024 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216243; cv=fail; b=W79jiAaQq2we9AfPMlfqqf9KDT6BBnEZRp4QEaai3N2UjEecAj5RA7d8699J20+VrethTSnc44sFv9foBnD/te37aI4+49BKjwwo3tWnLrbfDifkv+Wn7wRXUgbbZ+FVnMFo3l8Ey0bkHUrfaxC/88HDmkcqdaH97M96FOKdJ+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216243; c=relaxed/simple;
	bh=7cn+2MieRYiKh4YRXkyXyV9HQNytc64vZ/RQY5VQT0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kr1ysXQrzg8dN1qK7wddqFVp/uUpNiS4LBC9IcWlNQbW1EqfvPA3a+UkTQSoyZ7HVrjQpLA7AqOEFHHI5RS9xSyghyMsrVEAPqalVyCOVz8+R9tsbh4qPcWGYhcxUCJ3X6aPzn/jDnRjBATWno4rnPjDnpLNHl2BTpYPPksNDJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wApw0FDv; arc=fail smtp.client-ip=40.107.21.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVflI63bHIcvsVSs1Jg303Mz4liab3xcNnw2UpXEjqzMXvpMFpBCDwmLd97WsvleUvMFyVzDCOXjYC4orn3UPK93VrOCo9C2YhVF8TAZNYcepRRtzgts3pTlfEd0v9z6vuW88GQytu8awoa1VcCOtwLMDewX6cojN/WteF1pRx7fh98C2cxzgtKwvCl/vPdZqjxYvirEgb7/qdluf0Qr26bd54LuwdxqLCPxxIGrVuLZ7/kwvAnR6sA2hTAiX63KuU7It4oPModqrDECqsZN/ZnLrIhFFO/noCQQQM0QJ2NcvgDIaQZERqHl1S2IN9UAaHDp+ortTUSW/wLDMq0ZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjCSUOOZVM71QFpr7noHcDioZNtuSHZqJ2aVZ5bo8cg=;
 b=AUOiXG13TK27GS38DS8XW3r3YrYyb4WcmyHJ3iTBNHtUf0YmMxug/giXjpZJhoz1oKHh1+4ZflHe56cYm1modO7k/IH+5uk/etopiiPL7PhY3PLlTSqU1rH7kk5UAjw6lekVAuhVsWASGu0xWHolAo5L+3KedxbNqJp8PqLsIZlYjb8TjzDS2Rd/dYhtflSYD2AtwIDRWcI2O+anjRfXQLCvLv/HMFPzive46awObfsaJaln74qACtUwbXRaA5YHbYYY2dPV7eBKof4uKzvg/BrDpSM/i8kviIOF+KqpGYcj1b58mnXr2tuBK1x98exwuAaBIqMpeZJBsD77rzj4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjCSUOOZVM71QFpr7noHcDioZNtuSHZqJ2aVZ5bo8cg=;
 b=wApw0FDv3bVW270zogDJmQfC+jPO/EiJS56AcFpxGxIbc/wJS5daDWO8R8ehEXkxkru6n8ddtcuPA0EzWddXJVftZ60rFCRx3upmwzDHBUVe4hxdbMD3CGZ9xOwQv8AKeEHe8g/P6alxz4l1wtxCEEFIfd1LJkFlKVfkR7SAeUi78Gat4impnBOlNpAqLgWy/BWRY5w6EbrYzsGNnZZqHl7dka2SIDW0LUd5iLzJb2rO6g13TarzgxC5q90Nbw2ActHrFtWPvTzpqYKwJUN57O+bHK10EBamApFFL/xFPlqOW8+r5AEPBBQyfc1O8g2Gc+HD0t6BXTo/yCr9pqOdeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com (2603:10a6:20b:41a::6)
 by AS8PR04MB8403.eurprd04.prod.outlook.com (2603:10a6:20b:3f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 08:30:39 +0000
Received: from AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455]) by AM9PR04MB8487.eurprd04.prod.outlook.com
 ([fe80::6d7a:8d2:f020:455%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 08:30:39 +0000
From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Subject: [PATCH v2 4/4] MAINTAINERS: add MAINTAINER for S32G2 SIUL2 GPIO driver
Date: Fri, 13 Sep 2024 11:29:35 +0300
Message-ID: <20240913082937.444367-5-andrei.stefanescu@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
References: <20240913082937.444367-1-andrei.stefanescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0134.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::31) To AM9PR04MB8487.eurprd04.prod.outlook.com
 (2603:10a6:20b:41a::6)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8487:EE_|AS8PR04MB8403:EE_
X-MS-Office365-Filtering-Correlation-Id: 2857b8fc-9a75-4aec-16f4-08dcd3ce58d6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlQ4dkg1Zjc0blJQZm5zMVU2cE5ud0hTbmpMRXlhSEI4bTBmdTZkVlN6QW9U?=
 =?utf-8?B?U3dmN3FNSUNSdjlZU3BJcVdCdGI0VkJjdWg2NXRoVkF0N2pKRU1OUVY3bnlX?=
 =?utf-8?B?Q2k2S2Vhckx5Z0V3QUFmR0V1SmZ6Nk11NVM3d3cxbzlOZ2N5Vk0rTHN1UjJT?=
 =?utf-8?B?VklQWDBocGgvb1ZuSm5yZkZienlORGRIU0dDaG54TTl6YmowZDYwSXRWMVVM?=
 =?utf-8?B?NHNoUXVoWHVSUWx5SHZ5eG5aWHc5c1JNRGxMZkw1RGUvY05rYlVLcjhndzVn?=
 =?utf-8?B?UmVta1FlMjVGb09LdllSNCtaTkNvbWZXUERLVWdJYWxqbTBmcVVxSUxyYnNF?=
 =?utf-8?B?dExGQkVUV3F3OGtBL0labm1meWdYRVVBWFJaRGQvc0FuNTRPWmVhKzVQVHRH?=
 =?utf-8?B?VVJTejh4eUJyRWFIV1FUU2p5YTFvQndHVFFjRkRaZGdlcEJzVFR3TmtTbFUv?=
 =?utf-8?B?bmsva3FONUdCODRGZ0pWcGRtcFpXempqMmw2NklFb0lRV1pEaW42Z1R1VGp4?=
 =?utf-8?B?anpvWGlPRXZQdVJMUjlnVkRyQ2U2dmhxSVpEbWpNeEx2L2ZhWktIamZiNkY0?=
 =?utf-8?B?cW93MXAvRmd0aWc1REUyZ0E1NWM4Ynl2VXdKNEJjMWNpdG9UTEtBdkRpUE84?=
 =?utf-8?B?NThaMDFNVXpEbk1XZk4wcHFyYmJCeXl3QWZwRmQwaTMyWklLbnhjaDUvRnph?=
 =?utf-8?B?YXZra1FZNDl5ZU5jRmpMRk1yaFBza2NVUU1pZmpZL1g3bmZod1dtNWhHTVJF?=
 =?utf-8?B?eGVBT2ZnREsrNEZoUXVUcXNVRVRGV1hoMFFiakU1OXRQWkV6aFNCcmM5VzYz?=
 =?utf-8?B?cWltcVNadHF1WjQ1NGFsRFRPVldhdUJmcG40V2NOTi9sRXdVRmY5RFBEdU5K?=
 =?utf-8?B?Wnp4UFUvR0xrMStnK0VXaWVsVEp4NmNnbTB5ckc5WnRHNGx4b0F3blBIVCs2?=
 =?utf-8?B?OFA1TTBKeTFwOVdCZHR6K0RjMVB4cmpFVTFFc05DNjU3aVo5R2R0Z3BTbVNX?=
 =?utf-8?B?ZnltazVDUU5NYUdLeXZCZURzUEFxaUgycnB5SFpuaDhKQmlNNlZvdXVGVkZH?=
 =?utf-8?B?RnFwdFpxakVBNkNYV05WaGIyNjJiSUtTTXFyUm1nVHFhYVdYRVRFSnQwYTNm?=
 =?utf-8?B?bUVuV2ZBdHY2aWZaVlNTbGdMQ2ZxVzQ2bUsxUGg0SHVlc0xVSWxZYU1OS05v?=
 =?utf-8?B?WG95YmJWRllGeGUzNDhoZFhINGZNT2haOU4vYUxUTDFySEg1RGRGT1RjUFlw?=
 =?utf-8?B?QXAyVWVsYm1CYU1QMjI2Qk9sUUJ5UU1ET3VnOE8yTytGTit4eEhLMmZUYkR5?=
 =?utf-8?B?NzBuVWhQYXY5NGlqYUlaemxMNkRKMUl4bWRpWDFhVExNNW9mZjM5bzJ3czJF?=
 =?utf-8?B?Y0pWMWFOVU5XeExGVVhoN0cvbVdaanFjS0dlUW5mUjIxT1ZKbFFSR0VlOG5M?=
 =?utf-8?B?N2dvL0NvSkcxOW5peXE0SkdpZ20xNVR1YzFuMVN6NkM3M0prWDdtQVNWT3U3?=
 =?utf-8?B?MXdFL0xtM1B4VzRsMGpXVkZTck9WZ3hIajBaNEMrdDhXUTFGSFlJaDhoUUlP?=
 =?utf-8?B?bUsxUTRUNFpNNzFhTG9ESDJQVzFhalVNQTVXTHdpWG8vcHNiWGJoSXlLMUV1?=
 =?utf-8?B?dlMyUkdLVTg0SExHcWVYcmMyNmJ6NUs3cHNoWWVDQmlCK1ZCVERhUUFHRDY3?=
 =?utf-8?B?Q1RucXU5eXRwaHJtakJuSHdYQXA1MlhsNzJrOFNwV2Q4dU9SUkR5UnpXaVZr?=
 =?utf-8?B?OHQvaExERkpWdExUcjE3Ym1WRVlmenIzNVVmMG8wV1hiZnR1TUw3VWdJb2ps?=
 =?utf-8?B?OEgyWU9vOThCVDdlYk5jZytTa0lRUDg3YWRXQnQvUUYvajZyTHl5dXhiL1Qy?=
 =?utf-8?B?YmNidXRUUzBxTVRDZWc5RlB1YTJwdGdDRURMWlN2YnZja2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8487.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXd6UFBoYXhNZDNNSk9hTmlSWm9nTWFQMGowWVZKdzEvSlk2bFVSTE40YXlO?=
 =?utf-8?B?L3FxOTVlclBObW1kWFpYRVk5WFNwNWxFRG0yUG9NQXBXVUQ5bVRRb0hmcVoz?=
 =?utf-8?B?TWlUWjF1Qk9wOW1jNHJYK1dWdTZoNGdRY1hjaXU5d2ZiSHkwaDZPelR6WDZZ?=
 =?utf-8?B?UERsNk1tVGhhSy9lbUtoQ0JzMGt3SXk5M2RDQnJjdUxaYnlpM1JIQk1tU053?=
 =?utf-8?B?Ylpmd2J6R2EwbHB2MUZOOEFHNXRpREIyN0RSaFc1d2YrdWZrd1pzQmR6aXlR?=
 =?utf-8?B?ZHYreVBFV0RNLzh5U2YwQ0tCaW5WUWxrQWxaWXN1UXRtc1hISE4xRHFJbzBi?=
 =?utf-8?B?Z1BJN0xrbUFaZjRIODVjRHk0cTNTWjRaTW9UcTRwMHBQR280QXcrQk15OWp2?=
 =?utf-8?B?Q3AzQnByWU5hRnNkRVNBNUQ1NWtQSXJZaWVZY1NyS1NGbmFJRU9KcnRZdDlw?=
 =?utf-8?B?d1VLNkhqWThDUHNKOFVEREpwOXR0QzUwQ0RYcWo1MjIvcGduRVlNTURUdHhV?=
 =?utf-8?B?WmhYbG9BRWxDSU5ZUGVvL2VybFVQM0RNR0pSV0pxU2dWZ2tiMVhVejhVckRs?=
 =?utf-8?B?bEZjUTBheDdWRWFFVG9pTU1DY2djK0JtQ2hvMFRVTWtxSzZVVGU5MFQ4d2pt?=
 =?utf-8?B?YmQ3ZnR6aGtJdURyUHVtYUluaEcrSWg1NTdPamd4RktvUjUrZGExUy9VR2ln?=
 =?utf-8?B?MEVIbTZDZkJNVlFVYlJyczhYbEcwQnlMcG9pSzVmbjJNTmt0UWdVREZ3WjQr?=
 =?utf-8?B?ek1hSkYrb3JOTGVMNWlSS0JuQmtIcHNDTmh0eGRmSnhqMk1yZW5RZDRrcnk4?=
 =?utf-8?B?OWNyWjR0RnhBL1dtRHU2RUIyL0F5MnJhMGIxOGZoZ2RDR1JGelowS2xOYU5S?=
 =?utf-8?B?Y210dnJjS0E1QkRhSUY3Wk5BZzE0cVZ2MWtMNVVIUURadmM1NXlkWW51dHZT?=
 =?utf-8?B?N1lPUCtXWktjajZCQ2N4NmdNOTVxRXBHdjEwQVIwUXNvKzQ4bjNoeFQxTkNR?=
 =?utf-8?B?aGdUUDRIZllZRWNQdzRqMGNDUS8ramN0dHUwVk1yQmUyVDRHUEZKYzVQbi9W?=
 =?utf-8?B?enJqZkVDS0l2UGZSb285aXM2Z0hvTXRWYVgzV21GTDE1NUlVVVpMZHpNVXRo?=
 =?utf-8?B?S1dwVEFEOEtiU1QwRXFNcnpmYkh2MnhFc1NvSjJMb29GN0JKWStDOGNxYTE5?=
 =?utf-8?B?RFBUTm9kT1FNYXpFV0RYTW10bklHbjJsM1dWR1FiU2VObDFxbEg0ejJOTVhB?=
 =?utf-8?B?Q0pVWmcvSE1kUnMwTHgzcEprWllCY3J3cFFUYnBKUngyZ1lZSVY1Mk1NamZQ?=
 =?utf-8?B?dnhaVTRBZmc5MUdVS213cGRUbWNPdFRDRmtkYndSYThvUFhpcUdCdlo3dHJP?=
 =?utf-8?B?ZWdmNDdoUUxjeXVGVHRORlpQWG5RNUl6cnFQbGxuNjNFRzNMOTlKOVR2QUpU?=
 =?utf-8?B?V21jMldVQU51SmdVSG1zd3RZdm5SV1hnL29PR0F3NUljMmNZMjdBd0VLQ01l?=
 =?utf-8?B?ZEl4SUdFZUJzNkhZaTNUVXN3YW9HZmJaWVFOOXNyVXlpZ01lR2FKenQzNnBW?=
 =?utf-8?B?MXNhaXNKa1RMbW10K2hQcHduTEdra1oza3kzaUVFUlVNOXNqN2dsdVNvcDFi?=
 =?utf-8?B?QUVsSGpmd015VzlJak5zWWZUSWhKWG5LMnk0eXlNTWowS0hXRHllNVJ3cXBv?=
 =?utf-8?B?YXBVYmJhNk8yZEFQYVBkL3doeGxlengvS29EWVAyZDlaMytURTh3ditabFph?=
 =?utf-8?B?OXBPejdrWUIvRGlOK01FaFFiNGk5SEM3RjNUQ0Y3ZWFNRDdKQmJuaVhRVytr?=
 =?utf-8?B?ZTZleW1MU2ZSd2E0S3VNUG1oZllpdWcycXpWMHhIRGl2T0RBa2ZiNCs0SWx6?=
 =?utf-8?B?NVFRYm5xR2p2VDR0dDJ1eG5Wb0xjdWxJbUd2SUYwWGtMS1JKUjRlMnRSRkkw?=
 =?utf-8?B?STJ6bEhBbUMrSEpCNGxVUVF0Z3ZLbFJVMG9HUXh2L1lFR2pkNnVRTUtRN3Jw?=
 =?utf-8?B?Q1Fmc0t0V01FL2w1b3g5elU5LzZkYngvZUorS0krdHhrOG5DL1pIbTUxYjdl?=
 =?utf-8?B?Y1lkYXBHMG9Ja3cvUFYxTm93bGs5RnBrY3lvNHpuSHJIRUtJb2hleWtqTEI4?=
 =?utf-8?B?Vk8zcGNGTGVVR3ZoQkFGclJKNmhDUzhFUFpVbHQrVTdLQkd1L1ZCTlR5em9v?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2857b8fc-9a75-4aec-16f4-08dcd3ce58d6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8487.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 08:30:39.1276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gei5Cdu9Q30NR/HquIN3C67VYjWM55ayCJFajOfReBwj6M71hfWeDOCaUKuOr0+5NlOuLK+2XVwCCqd51ddzAJm6pFY+AibmwcLi61nU194=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8403

Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 10430778c998..e23c4369b6e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2689,10 +2689,12 @@ ARM/NXP S32G ARCHITECTURE
 R:	Chester Lin <chester62515@gmail.com>
 R:	Matthias Brugger <mbrugger@suse.com>
 R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
+R: 	Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
 L:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
+F: 	drivers/gpio/gpio-siul2-s32g2.c
 F:	drivers/pinctrl/nxp/
 
 ARM/Orion SoC/Technologic Systems TS-78xx platform support
-- 
2.45.2


