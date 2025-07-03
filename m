Return-Path: <linux-gpio+bounces-22747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEC5AF7FB2
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1112188F79D
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 18:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFA728EA62;
	Thu,  3 Jul 2025 18:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="PH59I4fw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2097.outbound.protection.outlook.com [40.107.237.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874CD28D8F2;
	Thu,  3 Jul 2025 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751566857; cv=fail; b=rPNPjIJ4YXernSJGpoqS41xOpSBt5gcPND/gGHwz1UdEj0+SxXR55MAqFpTua+b68wEVhIykZPn25g09uzsIuzXCMHjBMb6BzSOCz2CDve5qPi6oCuAIC8L3IUZa8iPHSUrBxs6SzXw4P9lz2yRc98pxcZ5B9TqjWS9C9TLuIog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751566857; c=relaxed/simple;
	bh=NcDqMoh23r1KFI79Xbm6yJXGGabLmDZmovDvsYLVxdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=E3FZgvrYbc+CwhdGs3o/+bSiVUNEo3pQuK0MxPKk0+1IMoBnwhaT78jeX0Jqqc+5g0mtDpninXdXZGmJwjc7BnHcbc/235fXzo18qthTIjbxAnn9cTbOKUMRXF+hqc4fsxh20EmAokYikP2dRuV3/ZVbjaqMbD1n5I6KjP/zdLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=PH59I4fw; arc=fail smtp.client-ip=40.107.237.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7N4KTY7JV87qfDjdrOtIujY+hbeG6RU5Wf9mIhpf+PkfOxls8loOcLf0RDmz5ObzdTM37uDTGE7heGYnGXZ5ipm3e/51GoLKB81+GgCTPDSRO0HkZKBzUpK11YBpU8/JDV/ih07bM/nppRcNYMeX2Zxp9DyJxNezdanGRWwLleJ4er3yk2T7zRZkz1Wdvi8qGEV8byQ9FINsxPLAz0p8tA3bfM3JySnSA0DJfEB/5HNonYGNMzWIo3+WgePWR1JpDl3wd0P83QK5oKkeGHIpf2ZOGvps4h0qYREimwE0RLhkFNDVFxBWKQWQ8zOzuXYd04a9vh3dF/BUdGxadZBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1hbTtGPCCd8VwVXyUrapht8lKy5BhXgNEhGGyj4yAk=;
 b=p5nwdc8MFAKK/XZK2PsarUUf0MAmdfr0PnUPYtUPM3196c8b0y7BjYWSjGCiWfBt9aCWCjXaA9Jx5356SFBJr1GH9t7i6ZJzhRhLEoR6k25D6dkWvfhzLdu/BOfDB/1mggGLbccaJXtaS68CRc9TXuf/Vt32axBoXqhGHBbxtxlg63L2kIjMcJEMdSDGC7T2+ukBZ5hB7V66yVQalgrUaCFzQOMMvAFxNMpvbYtvay77ILISv5sGCx04qJLIgm0iIP3iTft/alnxaIWUJvVyAf76Ih+FphYc1nyrh+g45eFICpOYNPpXS0ZCqz8F8ThXSjeACMUcHkDTtWAYP5AxmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1hbTtGPCCd8VwVXyUrapht8lKy5BhXgNEhGGyj4yAk=;
 b=PH59I4fwW95THjU9xBDiW3O1pMXzjhshtCIxbaDYnTubPiDhxDQL2NxOzC2FOL4baq5zFkWYChRWHpEgykGceOsMK8V3EgLfqVLflTJyuLQ3Oz4yn0bhuQyEYhj5NdU6nTaHb79Il6MKcqi3FzfMWt8IN0ODLv0ZQtltWubZJ3Ns+Q8mMK5OhF0UN4B67JKjKyV92Hw5eJ7VSOca0YC8zWOedGSmsslz3lzL5xwRZBjKnAuV7IYWaPXvalTr+pg/s1tzNfr7t2TV1A0a+ED03XKAA345GQ4HRAwXecrDijAkKFGb7jYKE9NdORoIfNjqGfnWayzQLw8VfkS/9moB/w==
Received: from BL1PR13CA0302.namprd13.prod.outlook.com (2603:10b6:208:2c1::7)
 by PH0PR18MB4427.namprd18.prod.outlook.com (2603:10b6:510:d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 18:20:51 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::85) by BL1PR13CA0302.outlook.office365.com
 (2603:10b6:208:2c1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Thu,
 3 Jul 2025 18:20:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:20:49 +0000
From: Harshit Shah <hshah@axiado.com>
Subject: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Date: Thu, 03 Jul 2025 11:20:42 -0700
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPrJZmgC/53NTW7DIBCG4atErEvF8DN2suo9qiwGgxuk1ljgo
 ESR716cLurKK3eFPqR53gfLPgWf2enwYMmXkEMc6sCXA+suNHx4HlzdTAppBILmdAvkYn2UEIL
 n2HEaHPeFPq801WNuIyXH83UcY5o42BatpqMj6lhFx+T7cHsG3891X0KeYro/+wWW33+nCnDBl
 WzIKq07QPf2A7x28YstrSLXvtnty8XXYIR0qkVoN75a+VLt9lX1rfKI1Ogj9Gbj61+/EbDb19U
 HsIQ9Stu3uPHN2pe7fVN9JOcBhSep7B9/nudvoRoHGW0CAAA=
X-Change-ID: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6034; i=hshah@axiado.com;
 h=from:subject:message-id; bh=NcDqMoh23r1KFI79Xbm6yJXGGabLmDZmovDvsYLVxdw=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsn+wMiKYdSqRD+ZJVhVZSKIpXmlMX4IWs8/L
 TFmaeEDATaJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbJ/gAKCRDxWHMRoTLV
 +7qcC/9TBZ5AXvsPiCzp3v6yROHh1ieKhSL3i4qnHbuxo68js3soNv0I2Pya7EJDfNP6wlx/Ms2
 gxjeduEcE1YhaVSTlQwnHPvLaWBBdcgX+08JCGDCzIXMvz7M7E4aZeOJomkRD8gC5mg6OdW7tZk
 kacFShY1iZ5mhv24PeIAckoq4egvL3MsAJpgigPU4a5WvwSG0B0Uex2gSTNXwngOCE9zBJmagWr
 VO1+dDnG545SssqzehdfnWqh7Q17PmyxM08WMhRueo48g/0zke09TVi+CIq9XjnpWsilfluGqtr
 JxJgUNVQH8H/1kQFezi283cNznvO0+zt7WphQfy4dMT2bgg8taqEhBA1VhlLHqCBUzZrGnMhRVO
 TeHA6Dxe6jBiweOC7q3DTl1p9rnjvxdkq1RzgS3ro4h2uR8dTq9yfiS6yf1fkDMqZGIZqmk5zZM
 +ghS0Ww/MMGKXSdknh6j7KrQ6st0sLDQLo9wr7TrteCpAsqC+SnbX/ABvMVdh2ZeeK1vI=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|PH0PR18MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 37cacef3-1a86-4b29-e6e9-08ddba5e5778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2tlYVAycnBISmNCalIrcWRVdC8vRmZIeUJ3cVNDbExwSEN1OXF6ei9JZDNo?=
 =?utf-8?B?c0FVcDlvS1ZiWUYzOHdpMXRQbWx6Lzl2bDN1NGozZ09WczQzeldYN0dzZ080?=
 =?utf-8?B?YjBGcmdFb3lmWEFDRUVNSmVvNW5ZQ1R1U3U0ckNFcEdIeEpnS1d4c2dGMCtI?=
 =?utf-8?B?empWU2JUd2lla1pHRTNqYVBwZjdFYjRySU85bGJsRGdnWVlPN2o1SGRVbW9u?=
 =?utf-8?B?dWZSeERtQUVSRGpEbCtNYjl1WWZMUFdBdGhaNjZMbHR1TkFZTVJTMzZ5Nm9j?=
 =?utf-8?B?MGFJVjRVMVZ2N1dvb01LUVBvVUc0b3diV240RHdUakxrQlEwZ3dFeG1iaDF0?=
 =?utf-8?B?Vzd3TFFkWmlOSjl2NkttSEFRYWVlN1JTUXNKMHpyR25ZRXExemJJemg2Y1U3?=
 =?utf-8?B?SmtYeWY2SHFLcHpJQU1EZVdzUXY3bU52dlVrdDlmOG5WOWhkbzFSRUJ1Ykgw?=
 =?utf-8?B?SWc5NzFOaVZDSlE4aFhUL0MwY08xL1lZWkx3V21NeW8zR29LSjI1cnNHaDd4?=
 =?utf-8?B?L1A4RGdUVHNWN3dtc2E3RUl4U3hoQnFMUVVPUzB3Sk81M2FhQ29yOTlXeFpj?=
 =?utf-8?B?WnJLYnpaSlpxb3p5KzhwVENYQmdWSHloTE92NVRRQ292emtkVlQ0YVlsYVE4?=
 =?utf-8?B?bWhpSjNLK0lUamNERzBNclE1OWQ0c0I3cHNtQkhoU2RmRGdHZGYwVHVOaXV4?=
 =?utf-8?B?U0h3YVRHOU1QVGY2bm95NUZYYXNYMFZab0Urdk1sc1lyOU1BdTRPWFprcmxN?=
 =?utf-8?B?b2RtNUtLS2NGWE54blM4MnEyTmpRZzNDR2w5TU1DTWFmREs5U1NSM2RHN2xO?=
 =?utf-8?B?WW9BbElYWUZFVHhzTDZNYzl2NEx3Zno0NTNzemxWMnZ2amkvUVltdXNXbjdw?=
 =?utf-8?B?SXBHa0ViNFFueWIrZUVHU0RlU0M0dDhCMnVkcFRCMmszOWNUd1pCNUhoL2NS?=
 =?utf-8?B?Z2JsdjdNbHlGU2VMaUVlQ0d5cC84blgzN0JyVjg1Nmw5dFd6VzJzSk5GbjA3?=
 =?utf-8?B?RklmUklCTkxpVCtTM25nNHoyWDlPKzh3WGNzb1FkRmhHd00rbDdwQWpnMENo?=
 =?utf-8?B?NnB5dFlzakpFaFBlVzRuaStFRXZUdkRZWGtEdTIwZFBJZWVleFlSZGNtTUl3?=
 =?utf-8?B?N3NudkVLekQwV21RVEF5am1UNGxGOWR4VWwyTWpzN25qR0xyS0FXU2wxbENI?=
 =?utf-8?B?elNPekRQQm9Rd3I3eFZTZUROVzJHOXc5VHhDaWJSaXN1emkrKzdLaGZqVUcw?=
 =?utf-8?B?V3pVb1BGS0JkY0hvcDR0U3YvRHRrTTdVcWJwYmtHaFQzWWw3VHpwSzdoOEtX?=
 =?utf-8?B?TmxmY2FpcCsycXcvMTd2L0Z3Ti8vRDd6RUV0eGZOQkJCVG02OXJkU1A3ZWdi?=
 =?utf-8?B?UmFxTXkrYkhQVnBsNU5TWXBVcGdvTlMyYnZuMU5BaVllZGdJcGdUWXU1MXMx?=
 =?utf-8?B?eWh4bXN5ZUZRNEZ6R0NNdEM0b3JMeVhGdlRrOW5LNGsyYkEyV0xITitsd3Az?=
 =?utf-8?B?VkdHTmpBWVRyaElEdXhDRTZxNlVmQVlXRVd5elYxaUZYTXdqYlZZalhYb0hl?=
 =?utf-8?B?TmtPV1RXMkdOeG9UOEhoajd5MFZMSng5c2Q3Zm03cUlCVFp0OUVrZVZuSzVx?=
 =?utf-8?B?MUtiRVNiMFdWR29SU1g2dm05ZXQxZmpCVHdvNXQxa3gxVWlYWFlwKzRqT0h4?=
 =?utf-8?B?cWl6VytFVGM1Tk5Nc3lPRytNK1BUZXNreEVlSjJ1Y28zZXZxK1VVM2lYazNU?=
 =?utf-8?B?MHNudmpPNUx3MTQwYTFhbzJVNGUwbjFBdGpGUEF6M2JBancwYUNrdlZ2Z2Fr?=
 =?utf-8?B?bWhtMmhSNFNKdzZyQzFLS0ZUSCtTOWNGaSttZGhsS0I2S2FseFhKZFREaFlE?=
 =?utf-8?B?ZjBVbVRaeVN4Q0VEMFA4V0ZtQ0V3SlVTYkZlcWczaFNkdXlYTzNvUStpTFYy?=
 =?utf-8?B?VmFYYW83VFlpd0lkaWN3TkMwNVczcVNQd3kwWlFjZThzOEFId0JFWGxwU3Nu?=
 =?utf-8?B?QlExRmlsYmd2dTRISW5kU3Btc1FXN29TZjJ4ajBXUkRtYXpqRWdseGhGbDlF?=
 =?utf-8?B?N0JlenZmNVVyZUVGdXRSWE9iOGVUSjB1dFJCdz09?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014)(921020)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:20:49.5355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37cacef3-1a86-4b29-e6e9-08ddba5e5778
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4427

This patch series adds initial support for the Axiado AX3000 SoC and its
evaluation board.

The AX3000 is a multi-core system-on-chip featuring four ARM Cortex-A53
cores, secure vault, hardware firewall, and AI acceleration engines. This
initial support enables basic bring-up of the SoC and evaluation platform
with CPU, timer, UART, and I3C functionality.

The series begins by adding the "axiado" vendor prefix and compatible
strings for the SoC and board. It then introduces the device tree files
and minimal ARCH_AXIADO platform support in arm64.

Patch breakdown:
  - Patch 1 add the vendor prefix entry
  - Patch 2 document the SoC and board bindings
  - Patch 3 convert cdns,gpio.txt to gpio-cdns.yaml
  - Patch 4 add binding for ax3000 gpio controller
  - Patch 5 add binding for ax3000 uart controller
  - Patch 6 add binding for ax3000 i3c controller
  - Patch 7 add Axiado SoC family
  - Patch 8 add device tree for the ax3000 & ax3000-evk
  - Patch 9 add ARCH_AXIADO in defconfig
  - Patch 10 update MAINTAINERS file

Note: A few checkpatch.pl warnings appear due to DT binding conversions and
MAINTAINERS update. The binding conversion and includes were kept together in 
patch 3/10 due to their close relationship, but we are happy to split them if 
preferred.

Feedback and suggestions are welcome.

Signed-off-by: Harshit Shah <hshah@axiado.com>

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
To: Arnd Bergmann <arnd@arndb.de>
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: soc@lists.linux.dev
Cc: Jan Kotas <jank@cadence.com>

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
Changes in v6:
* patch#4
 - added missing blank line (Krzysztof)
* patch#5
 - add reviewed-by Krzysztof
* patch#6
 - moved enum of axiado,ax3000-uart along with xlnx  (Krzysztof)
 - removed description (Krzysztof)

- Link to v5: https://lore.kernel.org/r/20250702-axiado-ax3000-soc-and-evaluation-board-support-v5-0-6ade160ea23b@axiado.com

Changes in v5:
* patch#4
 - remove description, add enum (Krzysztof)
* patch#5
 - removed description, add enum (Krzysztof)
 - moved to the first entry (Krzysztof)
* patch#6
 - removed description, add enum (Krzysztof)
* patch#8
 - add reviewed-by Krzysztof

- Link to v4: https://lore.kernel.org/r/20250701-axiado-ax3000-soc-and-evaluation-board-support-v4-0-11ba6f62bf86@axiado.com

Changes in v4:
* patch#1
 - add acked-by Rob
* patch#2
 - add reviewed-by Krzysztof
* patch#3 
 - remove description in "ngpio" (Krzysztof)
 - add reviewed-by Krzysztof
* patch#4 (new)
 - add binding for ax3000 gpio controller
 - backward compatible with original binding
* patch#5 (new)
 - add binding for ax3000 uart controller
 - backward compatible with original binding
* patch#6 (new)
 - add binding for ax3000 i3c controller
 - backward compatible with original binding
* patch#7
 - add reviewed-by Krzysztof
* patch#8
 - update compatibles uart -> axiado,ax3000-uart, i3c -> axiado,ax3000-i3c, gpio -> axiado,ax3000-gpio (Krzysztof)
 - add space between nodes (Krzysztof)
* patch#9-10
 - add reviewed-by Krzysztof
 
- Link to v3: https://lore.kernel.org/r/20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com

Changes in v3:
- patch#3 
 - Update with the original filename (Krzysztof)
 - maitainer and property name updates (Krzysztof)
- patch#4
  - removed defconfig (Krzysztof)
- patch#5 
  - update nodes to alphabetical order, remove redudant nodes (Krzysztof)
  - add fix clock nodes (Krzysztof)
- patch#6 
  - enable ARCH_AXIADO in defconfig (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com

Changes in v2:
- update patch#2 to fix the yamlint,dt_binding_check error
- update patch#6 to update path mentioned by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com

---
Harshit Shah (10):
      dt-bindings: vendor-prefixes: Add Axiado Corporation
      dt-bindings: arm: axiado: add AX3000 EVK compatible strings
      dt-bindings: gpio: cdns: convert to YAML
      dt-bindings: gpio: cdns: add Axiado AX3000 GPIO variant
      dt-bindings: serial: cdns: add Axiado AX3000 UART controller
      dt-bindings: i3c: cdns: add Axiado AX3000 I3C controller
      arm64: add Axiado SoC family
      arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
      arm64: defconfig: enable the Axiado family
      MAINTAINERS: Add entry for Axiado

 Documentation/devicetree/bindings/arm/axiado.yaml  |  23 +
 .../devicetree/bindings/gpio/cdns,gpio.txt         |  43 --
 .../devicetree/bindings/gpio/cdns,gpio.yaml        |  84 ++++
 .../devicetree/bindings/i3c/cdns,i3c-master.yaml   |   7 +-
 .../devicetree/bindings/serial/cdns,uart.yaml      |   7 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axiado/Makefile                |   2 +
 arch/arm64/boot/dts/axiado/ax3000-evk.dts          |  79 ++++
 arch/arm64/boot/dts/axiado/ax3000.dtsi             | 520 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 13 files changed, 736 insertions(+), 47 deletions(-)
---
base-commit: 8c6bc74c7f8910ed4c969ccec52e98716f98700a
change-id: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


