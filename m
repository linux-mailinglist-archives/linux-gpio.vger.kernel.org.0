Return-Path: <linux-gpio+bounces-21614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F8ADA723
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 06:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F28116BB8D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 04:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB6D1A2C25;
	Mon, 16 Jun 2025 04:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="BHsKOzIi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2120.outbound.protection.outlook.com [40.107.243.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26682594;
	Mon, 16 Jun 2025 04:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750048313; cv=fail; b=f4YE/NI5MVie1n+SzR0ZVYZkNOb36RJ8ZuJAPGhEyUKJT5fb3FxIfNI1L4Up06pyHJCaZzuBqbbDXLo7buPddC/kmoGpSqXHnPIxKsNcuPFSr1Pdysy7zZE1rhQv3n2bkeJM/PvRPpNrvNHLk1Ej83nCjeuysQpx40vcEmfrios=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750048313; c=relaxed/simple;
	bh=63uOhprLCO99dNMORKm/fjf6MbwkI00FGugvDgpvIe4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PWJuwwc1hgxwA8YhjWTVN7T8f7p21pbntLcmXICU49q+XtT10QvlSrzvDPXQPDodI/bytCbB+OhvtaLTw9j26oK86jso4IyETw7XS3/EGaFewPHU39yySHryQItVQXpVXU4PfLf9/u9Ch9h4Ksu/b+FwGErhVU36i6QPzg9txsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=BHsKOzIi; arc=fail smtp.client-ip=40.107.243.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLdOzo+O3Ol6KE3kK3aNpjF1N2PdseKif2XwOsOVTVD4cdXnds6a15/IIzon2Fh69XsD12Xt642X7p13kFMslcc66721kDvTozAYBYdqGd+HTxLyprzYYfJla3sw8CiujDthMWvzs0taFfrM06PGX9B8xsqxJ7Txc5AQPyJxpMP2tJtIAo14lVWiDiFtDjW15yVLnPCbtT+eL922ZHEz8ecobGRTYdvrDpINNEazR2MOwhb+jvBmGvIrRpk7OjVgmDJLlQaro2ONJ2vicR4soeUuoikQtW82FuN50P+JFIC1HUZCxnWapKKO65oE3q6dHCFiPXY7cDEHZzzrvKzaGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Tge86kXCXQvc6Z4KaRmg8f3kAdXk/JMOgrZOXULLMA=;
 b=eVKn5yDbBupJ1i0+yd617bMawLjShRALBBUGmu0YjGeLW8wTbsnmT89mePGdxKEJcR2doB9wXrXC0JjkESI3tBrk2n9Op5TSm0Ad0tezNopG4fgz86cTsrTkUzz2kaasMcVHQ0hmE1UoaX/PoH93FvFNUrs0fYqiXz8jjmkbzDKNmRP5tVKxsUSzIm7zzvhSjL4QXB3UWlp4TBNpaa/rZElDs2baT3zkTW+Rd5MHrAmeNpUZB2kktaonuAAwF6reirqs0tVsT7TzM8lWX0tprm7tHwOhE3sNHK+R4sp31gOezNmbqBPM7AsmlzbM/DzE5SmzEHZ/mnMtl3rsHf8cRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Tge86kXCXQvc6Z4KaRmg8f3kAdXk/JMOgrZOXULLMA=;
 b=BHsKOzIiAAXbFq4pfIVrJunHJu+zQjRmCcRdxmpdEiCflxLAoYYP0DHXDVfSosteh/p2YPoVvcv2ZPOnl6yBKnx7Twx/KDpy/gBLYSvV8D9VtcheEfcwhHC33/uRnPnE37T/xJjKxJusE/Q//aOWo9M7CW/VWicuHKh3ysMdNKe2Qqa9bRtv95iS3PtAopU4JS0rt44MMeoSyRQNsdhi5jDbnGujkSONPOigvIxOHyYy/lvopjSZUHVg/JqBRgF7XTpt+bYCX15pUPwTbGc+Eazd0oy/wocLj424bndcK54oO8QNoAoFxGjAaDPREzb5JsYOLsgP9INW1f8yw0eImA==
Received: from MW4PR03CA0077.namprd03.prod.outlook.com (2603:10b6:303:b6::22)
 by SA1PR18MB5880.namprd18.prod.outlook.com (2603:10b6:806:3ef::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 04:31:47 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::95) by MW4PR03CA0077.outlook.office365.com
 (2603:10b6:303:b6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 16 Jun 2025 04:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:46 +0000
From: Harshit Shah <hshah@axiado.com>
Subject: [PATCH v2 0/6] Axiado AX3000 SoC and Evaluation Board Support
Date: Sun, 15 Jun 2025 21:31:33 -0700
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACaeT2gC/52NWw6CMBREt0L67TVtqfj4ch+Gj9uHchPlkhYaD
 GHvVtyBX5MzycxZRAqRQhKXahExZErEfQG9q4TrsH8EIF9YaKkPslEGcCb0XKKWUkJiB9h7CBm
 fE45lDJYxekjTMHAcQdlTYw2ePaIT5XSI4U7zJry1hTtKI8f35s/q2/6tygok1PqItjbGqcZff
 wd7xy/Rruv6AfGdiyHtAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3340; i=hshah@axiado.com;
 h=from:subject:message-id; bh=63uOhprLCO99dNMORKm/fjf6MbwkI00FGugvDgpvIe4=;
 b=owEB7AET/pANAwAKAfFYcxGhMtX7AcsmYgBoT54neqUDKdNI0QKVvHW8WlI1unvrM0n3vcrSR
 v+hcSJs1duJAbIEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eJwAKCRDxWHMRoTLV
 +xnUC/igZ3BwuMF9Q9x3M4gYWN3CfJ5wqtkvlqy/ad/V1x4NrbAijOMSGnN8KVIvKiB0AVoBFAs
 gtIJggm5qx+oG1IfqbjFz86D/Q+BL8MleiXYtipf5n3Pv9zLb3zA9Xuje1PM2QcLU6j3wW80fFV
 xykYXuRwaLUrwxuO2iU5+tGFue1+2eC3In/dZRlVp6jv9BG7QerZqJdWqyLekosBSxrLlMjEloj
 kzshJtq1t/F7NzEgIJz1VeEc9Ag6Yb/tINeAyljnVrNBDsIcJhgTeL59ljDs2uB218LXwWSCxU8
 n9iLCrFp6gi++8PpjCmabOK2SaB0OKb6yCI5oRmuNx6TYQ0+FDB6JUw65ieZyFqW8d2tThlTJFm
 6NEKXLgnX7RfkdlJJX0lbW5iOdjhgcVrOSRRlpQ+ug4/YFVjWwm1rQhFJ529/KYqqeHJxTXmp/Y
 2W6eDLIIOc2wbzDxzsO8UzQDZ2P1HTHdIiYUiLJZMMjBHC1aqZwmQu4N4k1qe1nyy9Hw==
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|SA1PR18MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd31a15-3a6b-43dd-91f4-08ddac8eb473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUl1blNZSGtRY1FXR3g1VmpnTVovSW1YeUNCWityMFZybDQ0V1lIYnE5SWpZ?=
 =?utf-8?B?cjlyYXhEMUVPdFY1anNzSjV6azNlbEc2VjhPWEhOVkZpejBmWFJoMUI1bWF4?=
 =?utf-8?B?SXNBZzlPY3dXMkI1M3FES2ZkQ3c5d2JJYlROMFFOVVBmeDdQTlJBSHJmNEgr?=
 =?utf-8?B?bDNyYkg3MFVvRXBmL3hXenI4VUZVbDFwRG9pL0Z5cDAyeE5BaXROdTFacGpj?=
 =?utf-8?B?aDB2QnRqK0RzMGFIbG1tVEZNVU8rNDdtdHAwVUtTRVVIUjJjTHErbEt3N0tm?=
 =?utf-8?B?dmo1Z0dGMUJ2cFFZeWFCNmR3cXlybGJRODFUc1VOaFRoQVdWdU95dXp0alhw?=
 =?utf-8?B?Uzh4aGt2TCthMC95c2QxMmU4Zll0YU1ZdnU1eHBocHQxd2lJTVllSjQvSXlr?=
 =?utf-8?B?M1dHaHk1cTBnNzR0SzdYcGY1S21zVFhHMThVUGRvRW4yMzlHYy9uaWNsblZE?=
 =?utf-8?B?Qm1wTXJZQThhTzh0eHhjbEtmb3BiQXk4cWsycHpNWmR2Yngxb0RRVDduTE01?=
 =?utf-8?B?bUM2NUwxdENSYmNPSEs5N0huYXF5aEdPbk5UVS9EYVpNRXZHMFYzRE5Gd05k?=
 =?utf-8?B?MnZWcXdvUkRkOFFqaU80NFdiMU5ydmc1cnZuaDF0Q29EemFSemQyTzA5M2ts?=
 =?utf-8?B?K2ZPTnVNdDIyU0NIQWpEM1lVQzhhSUdiYkY1amhhd2dwQ3BQNm9GZkJrWnor?=
 =?utf-8?B?NzBIWnR3MlB6ZWtBeW5XVDRTQjRPdUliZk5Pc3ZuVWZpVjRsR1ZBOWc5M2pK?=
 =?utf-8?B?ZXRuMCs1TWdLTlpxd3Myd2lMTW9YQVZadjk5bUJwNzNpWUEvdnM0WU8rWmQy?=
 =?utf-8?B?MjB3cDVXRURUeWlVbjJCN0V3WlZHSUdkSFZmQ1NWMlV6cG0rUGhsdzZLMEg2?=
 =?utf-8?B?ZFlOTzR6bTNsK3pYLy9lR2JQanZoc3pjQ0ZtZWFyQXBvTFVteDlsY2hpZzVm?=
 =?utf-8?B?b2lxcXgydFVENjhNM0FuYmVFT1Nnek1JVEJBS3lFb0lGUnJORU1taGJLRWMy?=
 =?utf-8?B?YjY1MXI3Ykt0cmRKWDVGRERKR0VWWVQzd090ZHZKa1BNMkZqSWZHZG96cmtG?=
 =?utf-8?B?TDN3NFdVcUdxR1pCWEtDR2hVSEhVNUxRRHJDNHV0OUV3YVJyRlp4U1hGWVBU?=
 =?utf-8?B?UDZabGZRN1lNN0phZ2tQWDlSeXFpRVhrNzNjaDlRYXY4NjVLN0orNFk4Z1dO?=
 =?utf-8?B?cnFybkxCY0kyd0JPMkF2Rkx0U2hBdURwMHZtOGFHcE5URm53T1ovQS9uZTdM?=
 =?utf-8?B?UHZvd2h4WC9ReVVyN1JOUlhLNmlFN25MOGhKSXl5MWJiZUtLcFFnd1NtWUJv?=
 =?utf-8?B?aXZKcWw0dmpEbkNnYXo4TG1Ld3ZRZ1RnT3FSYVVwbDdHWHBTTVNTbityc25V?=
 =?utf-8?B?dEpNNmMzUkVMb2U3U1VKTVl5WFJud0NVUGwxaDU4MCtwcGlRYmNLelpobnpZ?=
 =?utf-8?B?eS9tR1RKMUtYeXNOMWN2RGlmalIwRk52eEY5ZTBJMzN0MjFsbzdVRldDLzZj?=
 =?utf-8?B?ZVVTc3U4UDBCM25TMUl2S09ld1BSTVc1SmRXOVNkMHBsaVV6cWJSQ2dDRGw1?=
 =?utf-8?B?Y1dWdGoraFVTWkhMTkJsMHNNNVh3K2pKbVBhenplSUw0Ni9IbG5Id3dSbTJz?=
 =?utf-8?B?UlRkUGNMUmYzME1kZk8vdjRDbU1QSDRoMDFwRlN4SEJaWWpHWjRJY2hyYWk2?=
 =?utf-8?B?WHBzTXUyTm5ZRjRmYUlLWG9RWk1oZlpkVlVyazhiOUpNVXljQmN0VWN4OWNF?=
 =?utf-8?B?QTZGQ3IxNGdOVUgvNzBsb0MvS01mTFkxeEpXN29HOU95QmQ5R1RnUzB2cWNi?=
 =?utf-8?B?cCs0eXFKZ0xDd0dJMXd6Sk03dUZ3cWZOcEh4S2RkZ0tvUThvV250dFFKWEd4?=
 =?utf-8?B?M0VSdXhVaStIQzlza29DaVFaZ3hTQkM3RHJuaVdUL2JVaVgvbnZQRjVHNEZL?=
 =?utf-8?B?Sk1vWXNFYURhcDJPVkJzZVp0emUxcDVFczREZytVV0tCQzVhRGRycFNhY2lt?=
 =?utf-8?B?M1pUMTNmdTNwelZpWm8ydlVxWDB0YTRvaWNWbVJpTUJOWjFSVEMrVGpwd0Ix?=
 =?utf-8?Q?P8NqMx?=
X-Forefront-Antispam-Report:
	CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:46.8641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd31a15-3a6b-43dd-91f4-08ddac8eb473
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB5880

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
Changes in v2:
- update patch#2 to fix the yamlint,dt_binding_check error
- update patch#6 to update path mentioned by kernel test robot
- Link to v1: https://lore.kernel.org/r/20250614-axiado-ax3000-soc-and-evaluation-board-support-v1-0-327ab344c16d@axiado.com

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


