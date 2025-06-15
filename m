Return-Path: <linux-gpio+bounces-21599-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F06ADA076
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 03:13:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93C74173C14
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Jun 2025 01:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE0020330;
	Sun, 15 Jun 2025 01:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="Cm4H0+xr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2122.outbound.protection.outlook.com [40.107.102.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEA010942;
	Sun, 15 Jun 2025 01:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749950000; cv=fail; b=qxov6PjxyRZ4zuv/3t0aioyt8XORfM85kKE8PoqpeiymcUbsrADiHFvWC5u1H01Hul719xqq/Uu6OHUAbzzIvm6HCxF8K6te10e9+3Vmdpx99gRYLdn3eOAp/PXmumTLSrf0CvFTJ/KNyi7/mKWm+8D9lXO6U2Xbp8d8Won+AuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749950000; c=relaxed/simple;
	bh=wbJwYkxQuX4n6ye9d64Qta+ZfJLLaApkRNuSLkCEjy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CBLGYHYdseqr31QA3UPn/UiOey7kcw9tjk8O4EAqajJs0ps9d27tcSGk+w2S3Os5IE5JnDfhNXSMtAjWIWdLgk4XLlZbtrftf8Aw2IUkuMTGVEpdjXfr9h1QqNWqWgZmohJyF7wCKnT+uVD+anJT8vD3Y5FvTNFCyHEF2Iy7y3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=Cm4H0+xr; arc=fail smtp.client-ip=40.107.102.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvnNLDo4PdRnpsQ/nCI5gF/QJJuqELiEVdb47XJ0ZwuskLRy9bFcnr9WLNjRy6idSQXjLRGjm85YPREkIQ4XuK8xmKEpD0aGOGSnJejF3nzv6e+O20UOGGlTQiSZxbqKHpdjfkrrRsQMtwxA+4FtNoi8Z0aXs4O6SkRS7INsg12vB7SOTWP2NM7+VneyX9Ql+F1yiigK8CZTQSiFX/3B+BW3DZQ+d5AKDp+dAaL3+RMBDmcodeocx4olFCA+5cGcH2X5LjHkunpmaQ8SNZFa3qJSnxNatLBXQAsc83HPeDPSflMcDvSWEtWcSdsa0RwX4EddNOP2Xy1/kE9v7oCMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elwLs9ZjXxhMbUsm/5qE2cgP7Dcng+evA1SnF8RuY0s=;
 b=MF/wfLCHxEUCgSgM05IQY9++TQqtDA4HEI5iINMSj1B7TtbFgHGcaaBrSR9UACJ59OgXixDwzxQWzltSCNSZ3aRx4YNDMj18rolW7j2Fhkf1Qgd8VKrWJnnnIJFKY3g470yb2VjH8LuAdPl7gunQQFyk7vQhT6pgFgYIQAAU4xAwI8pixTYgGyhOatkXItCzhsCCLAaVVgOaFwS3htnu0LV7VzwcFg40Heuk6AicuBDSWTz6eaGA86DnQC7vvZFhECiLfx4PXU7gxqPnyHhZq2KeSwPp5f8m6LIZBKH9nKR2sSRlUu0aFxc2VhrRiOVvuc3qiMZ86jECkrB6ZbSceQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elwLs9ZjXxhMbUsm/5qE2cgP7Dcng+evA1SnF8RuY0s=;
 b=Cm4H0+xr5ooZ5g1LDcZdgxw/0iv8+4g8MkOgjYCkajmUcEz2FtbQm7FLfRxDZVTsTUeAMH1E2UrlJIZFbF+W/B7yitFXANb1Zjg0bVCEbC3h4f6H8F79T5/SVbQjll2wTy92KH+waKTf1aVGurTT3dHUOluOHYFfywhZxCMIrwFUMbL4aWkKvH18hMjrKu4Ej+LcR+OjCne29w2gp4O7MDIoNEcbz+qvtHzkVAY/aETuQqrL4wP4aPmEMxRnP7PM0rXcrkZ5mXrfKpbviyrcAAadtSndkVK0IxQvi4XYwR0BLrMCTBMGyPYBonhUmmqoencSazJI+NAZOJ4M1zq6fw==
Received: from BY3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:254::18)
 by IA2PR18MB5911.namprd18.prod.outlook.com (2603:10b6:208:4b9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Sun, 15 Jun
 2025 01:13:15 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::e) by BY3PR05CA0013.outlook.office365.com
 (2603:10b6:a03:254::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sun,
 15 Jun 2025 01:13:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sun, 15 Jun 2025 01:13:13 +0000
From: Harshit Shah <hshah@axiado.com>
Subject: [PATCH 0/6] Axiado AX3000 SoC and Evaluation Board Support
Date: Sat, 14 Jun 2025 18:12:46 -0700
Message-Id: <20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8eTmgC/x2NQQrDMAwEvxJ0rkBO09D2K6UH2VZbQbGNnYRAy
 N8jchrmMLsbNKkqDZ7dBlUWbZqTibt0EH6cvoIazaGn/kajG5BX5ZgNVyLClgNyiigL/2eeLEa
 fuUZscym5Tuj8ffQDPyJzABstVT66noev974flzekN4AAAAA=
X-Change-ID: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3067; i=hshah@axiado.com;
 h=from:subject:message-id; bh=wbJwYkxQuX4n6ye9d64Qta+ZfJLLaApkRNuSLkCEjy4=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoTh4jaJKwIz1a0YzSuc1+KtPS/iVhr4+4tgIua
 fifkHt0gE+JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE4eIwAKCRDxWHMRoTLV
 +3sxC/9OZKAUgefh42e/+MfIL3S29duR1359cxR7GGmOOSQ54EAgWjkKKpyu18C+dK+Svc4B3la
 Gepw2TBsY8eX2KB8iEYYnleBxzk0QrOhg3EFbu6xdC091bJ+A8SBCJfDHCAcKK5Jj81klLl0cFv
 +TsK7IsxOpA3rt3F7SxN7nc730XltUDW7fpguEqVbX5g31bGxLhFueE/FYLbO3D2hixXi/lZPT7
 JLT87VNl7v5h7Ju3Szgsdnudq2hkrvrcIPYMh+dawFk1Sz0Od0B4AUBWxTbqu+55joP1AIqcjOZ
 ELfFhOzAzVdXSuCSfYmENEj2afT3fHkOcmfj9+v2yMrW/F8h6irtfauqTRYe4+hmAaWUL/RDzwc
 WugjWHSHGdIlnVspXKJ0Ml6GvPdWH4gq8zldSbe9Cbq28mKXPIzOls1gzK65KeJS7KCNjWZAqfG
 AoYjCjYHR8cR6ddTz8izgsMZya9WguwFeZz8KhzEgOg385DloC7OUALee9AuQYKDiKTVE=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|IA2PR18MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 706ca5c5-c553-41c7-8d0a-08ddaba9cd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WkhsMlZBeFdRQk8wOEt5eVFCNDA0T0lUeGtaWGl1NGtqYU80cjRqY0VNc1I4?=
 =?utf-8?B?bU1FM1dDRERrTzFTLzBoci9jL1dyTENqOVFIWmFkRFMvN05RNVZBSTUxbU56?=
 =?utf-8?B?MExOa2sxYVlGREhScmpBUDdBaVQybVkxWitsSVBEQjJUSnVQNkdLSXh1Zk85?=
 =?utf-8?B?UllEak1XVnhMTXFMZnNrR2R3T0hGVE5DL1BsM012QUZ5ejZpa0VzTllNUEg5?=
 =?utf-8?B?cm9ZUDZINmQ2VE52UEgwZUlLaW05SHlQeFZYc2R3YmJSR3JMNWNReW8wbnBp?=
 =?utf-8?B?eXpUWW5adW9tRGw2ajR3V0ZON245bGVNc09RbHdnVEx4VXdPV3BLblN0bi9J?=
 =?utf-8?B?SjNWbVNpZlY4UlBuRTZTUE9lRUg5TWtJNnhWYmdnd0YwQytqRUR1ZzVZMkJU?=
 =?utf-8?B?ZVphTTNWL2NwdEtlN1IybXRlb1Awb2NhdGxodVl2MFRXVk5hUkVkU290M1hW?=
 =?utf-8?B?NXJnZkUvdEVzNEkyV1lKenplcWdIeXQ3bHVGczN0TVFaSkdXZ0pOblovU2Rj?=
 =?utf-8?B?b29STFAvNmRFSGNjWlpGNEl5SkNYRW1WMHl2aEtoWnJXRWFvNjE3cmdTWVpU?=
 =?utf-8?B?UEIzS0ExRWphYTdjbUdiZHNKUGxUUWZzQW90eWtXUzRzMjN6WGpkc0hFL2po?=
 =?utf-8?B?V2pBY2thQ09QR0lSWjI5YnpNbjF2cHF1NlFvaXhoQU44bE5pQXRiTk9LWnBw?=
 =?utf-8?B?K2FPUEpxeDF0aTk2M1JhMk9zNGFqVnFNRVdyanVHTDBMZU9qSDhNL2xKSHpE?=
 =?utf-8?B?NkRSWElmSUwvS0t2cjl0R21OOHJsbFRZNnNqbFpmTlFiWHlKZW9saUF3cDZp?=
 =?utf-8?B?SjVVMDk0NGZ0R0lGdm44ZkVPN1FYREFBaWF2SXNpVkFQd202VzBPWDZCeDls?=
 =?utf-8?B?U09nRlhkOS8yVklmVVZ2WDMxOWY5a1BYcm9vdGdoQnd3TlNwZGhuM0RPcm5Y?=
 =?utf-8?B?dEtZcUpmS1FNT2Q4K0xDMDd4ZTNCNVdsL1ZjUHNNZkhSYi9IenBzY2dSbCsx?=
 =?utf-8?B?YXMxS1M4R2FpZ3NXODdWckJxTUJPUGFVc2MvbVV0K3BOYTU3ZHNGQW1tdVl1?=
 =?utf-8?B?R3o0ZjY1U3B6eFViMTZyN0k2L2NiMEhaSHVic2JmQ2dadnVRQ2NHTnFhSm5j?=
 =?utf-8?B?Uk9sRlg1SldBNkZyMDZoOENzYjJMeVJaMnlIWWZHZ2xSZFRRTkpNQzN4dnNP?=
 =?utf-8?B?ZTlEeU5uU0JleGI1Sk14WlFFY2xqT0RoYnpKNktzeTlTOU82RFpzZHZLOGpL?=
 =?utf-8?B?N1FINE9oL3ZtcTlQRFpJc05jR1JmT2ZBMkp2Sk9ncGVBV3Nuc0w1MjRTekJ6?=
 =?utf-8?B?WVNXb1M4aHRhWnpnS3JxWWsraXRvRE1idWpaT0x6MnJ3bnkwUnE0dEdDMThK?=
 =?utf-8?B?RTdUS2NsN243eGpCNmY5WUVmbUhXZlNlR29PZWdiMkxuNzg4emtRZ2VqcDZ6?=
 =?utf-8?B?UlFhY0lMUXAyVU5QWHl4RHZaZGIwMEQ3cWFVOXVYSnlHWC8wVkhVZUFRRmhY?=
 =?utf-8?B?THp1Q0cwWitiOGlGL2dOYUd2WXRMdVJWRWhRNlhLVWJsSkRlbHFtdkVoTHk5?=
 =?utf-8?B?SUloSFh6T3RJZDNITGdwc0ppMyt4S29RL3BzR3cyTUxVYjhYQjY5cnc5NTdH?=
 =?utf-8?B?eldCbUs5QzREeXNUQk9GMFVQbE9xdHk2bGk2SXZTeFhFYUYzMkRGNUxQcUNX?=
 =?utf-8?B?Z0VDWkpxVkZzVTBQdVU3d05qb2JxVEthcEFqVEV3UHVRcHpHcHNKU1NRcXhB?=
 =?utf-8?B?UXlJSWFFYUdvbUY3QVp3MmtybTY3NlhaNFVUSG42WFY0alJ6VmxhWHFvQjJX?=
 =?utf-8?B?cjZQUFg4TlhiSzl6WkJzdWNSOU9Kd2ZpYnRFUldPeTN5TklJU1dFa2xtQzlC?=
 =?utf-8?B?SFVGcjBRVEhaQlpIQVQrVU5TckRUaFpHbjVGb09OZTVqT1QrNkZxaUg4WVpV?=
 =?utf-8?B?WFNiYUk4L0hhenhNOVhQS1hlN0o2cGFadUdlWmx5b0VUYkY3TmZqZnU0M1N2?=
 =?utf-8?B?aSsvUTh2TlFOZFpyQzVsNlJiWHd5SkUrbFVjaitjZWIwUDdmTTY0WXFDYndu?=
 =?utf-8?Q?tK4tAm?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 01:13:13.8984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 706ca5c5-c553-41c7-8d0a-08ddaba9cd8b
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR18MB5911

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
  - Patch 4 add SoC and board DTS files
  - Patch 5 enable the ARCH_AXIADO platform and defconfig support
  - Patch 6 update MAINTAINERS file

Note: A few checkpatch.pl warnings appear due to DT binding conversions and
MAINTAINERS update. The binding conversion and includes were kept together in 
patch 3/6 due to their close relationship, but we are happy to split them if 
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

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
Harshit Shah (6):
      dt-bindings: vendor-prefixes: Add Axiado Corporation
      dt-bindings: arm: axiado: add AX3000 EVK compatible strings
      dt-bindings: gpio: gpio-cdns: convert to YAML
      arm64: dts: axiado: Add initial support for AX3000 SoC and eval board
      arm64: add support for ARCH_AXIADO
      MAINTAINERS: Add entry for AXIADO

 .../devicetree/bindings/arm/axiado/axiado.yaml     |  23 +
 .../devicetree/bindings/gpio/cdns,gpio.txt         |  43 --
 .../devicetree/bindings/gpio/gpio-cdns.yaml        |  81 +++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/axiado/Makefile                |   2 +
 arch/arm64/boot/dts/axiado/ax3000.dtsi             | 584 +++++++++++++++++++++
 arch/arm64/boot/dts/axiado/ax3000_evk.dts          |  72 +++
 arch/arm64/configs/defconfig                       |   1 +
 11 files changed, 780 insertions(+), 43 deletions(-)
---
base-commit: 8c6bc74c7f8910ed4c969ccec52e98716f98700a
change-id: 20250614-axiado-ax3000-soc-and-evaluation-board-support-1b86b4a9daac

Best regards,
-- 
Harshit Shah <hshah@axiado.com>


