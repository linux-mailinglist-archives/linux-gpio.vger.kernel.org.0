Return-Path: <linux-gpio+bounces-21443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7FAD70CE
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327BC3A19F5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD262367BC;
	Thu, 12 Jun 2025 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="je1AkhE4";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="plwOtIQj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4013229B12;
	Thu, 12 Jun 2025 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732700; cv=fail; b=NDUESItrQUh0dml3ktHE6tEpSFOyjH5L18syAOEv5TS/dCUR3nJH2Z54ZbnQB49ywqGTH7BJ+KEZa9qHAliq5ZEUGHZ2dPg6f6rjEgeaep/r9WO6BZpmly5JVgafR1gF0UM4e3xi0RUHGU9JDZYOL3KU+oR6VALA+5Y/Ar/IRJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732700; c=relaxed/simple;
	bh=5kS7u7O39guar0oeZudhA8euYa5k14M1V/7PPxRly/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nfr3nK35E1D9ZAYeRsi+pJKvH2nS0ikbzD5Huv+g0+nVS/UxSEvj7lnSjYD+pDUKJdwW1SWm+19ZC2gynmxUAXDosW2ujTP+gWJrSWwKd8XKObxOLbUb6gI0nTRteayHeHkDEz9Hcwbm/TXGQ4laMBF9GT1zFNgGaFdELYsZZj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=je1AkhE4; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=plwOtIQj; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3whce028151;
	Thu, 12 Jun 2025 07:51:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=nGiEfMtUdUKmoJPEz04nwioGLxRl7EgYpLmDBslWZp0=; b=
	je1AkhE47WtXAc2Zorlgq56NjIlOCE89ZntRIFFzvHom/iGEIXcM7WKhn/b096rH
	DEalL+tWtXZtN43vNGOepVoDoAwk/eSAZj5yhHSWfai98KBwIc2BxccJVv7m15DW
	HgW7WIVexMFndlMsm86OxInimIC4RikLVlafaFyDY2Wzh2IQEYH8f+8Vb4Dmh0IY
	mkloGo8M67SdyZvthB8KPmmolqLVEN5ja6TKzOsKljPnqFFr5A4eqBN2fpfkzi2J
	eGfFEo6DPeYM9zQ8HXsgB/FSoi7JVsHK2aqNxiwim2l/pu3HJxvxpXSYfNwKbCb7
	IWJ0mLztCVF7x0SLbxZc/w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2120.outbound.protection.outlook.com [40.107.244.120])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4760mww1y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:51:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyfE3jllUFs0PI+t/Z/ISFtL4+zWlE6VRBcPjd52gUOchoARZkDBr7Rdn8u2eIGz+q/ndxyfHahVjMFDbee4O0+3lrd06EGP6418d23ZLWkEYNUquAVqlCQDiw+1xuucrK+qzLqrQwPUqjXlc6okL2dfBSDfYSTRLi9x2J5mIwEpcg9TvX77Se8Vr2y/fH+n9FyoOS2qflWtnYxUOUM+HeybGTFV/s7MMgWu+tBGHXYDmig42D0YsosOFK4HjdTM69c/uBYIVhk9BtAdJJxApb5rhLZ//pnd25jXsTGWuubkWpjVvdOqlZ62ZmluceOklVJJDv1LozPHAr58QOTQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGiEfMtUdUKmoJPEz04nwioGLxRl7EgYpLmDBslWZp0=;
 b=OKiFpU77BTKPC2bGp/x1Hmqkdtfxdfaa32m0VNu0H4UzYj98KNhULNTXweKiGvpTbXBFlc8jHbY/cDWE0PM3Ek/IGP1nMk/1us/kZokXPfWj1EZuqYtFrNdRcyuzC3LYM4h0o/MXC/Sh6hc0rkU/E5szfEqAWTwglDiY1aSn2ONstsPrAjgLzhm+0cHLHqRXdiiGgoGztPIVl5Cpv8qCTq//nUlPyKl4GYgbepff1GelW9oY1baQPxAL/5Jg7895InBsqxpb8BQHsMv8UW588m/g5ksbYD42azOCpNQm91ztnKlo+yY+dBmGtJ/jTvPtEun4LGUW/py+JGdidQI2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGiEfMtUdUKmoJPEz04nwioGLxRl7EgYpLmDBslWZp0=;
 b=plwOtIQjZAbxzjerZh7yqpUdonjxhq7zc6caRlBPGpo0+TSNB7JkZ3xFbClHbQmZEzB+21fOdoId0ULdjodxWQZGAHzvwHv7xOaw4TFt0uShcoV0AO6U/IvMSgUCcAIsWiDK6LqC50aWr/K24UnsCfgtGhChXQQC2qjnTlKz2RI=
Received: from PH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:34b::14)
 by SA3PR19MB7796.namprd19.prod.outlook.com (2603:10b6:806:2fb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Thu, 12 Jun
 2025 12:51:31 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:34b:cafe::d8) by PH5P222CA0009.outlook.office365.com
 (2603:10b6:510:34b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Thu,
 12 Jun 2025 12:51:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 12:51:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B4F1F406541;
	Thu, 12 Jun 2025 12:51:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9C53E82024A;
	Thu, 12 Jun 2025 12:51:28 +0000 (UTC)
Date: Thu, 12 Jun 2025 13:51:27 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: cirrus: cs42l43: use new GPIO line value
 setter callbacks
Message-ID: <aErNT620V2K7lrKX@opensource.cirrus.com>
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-2-2d45c1f92557@linaro.org>
 <aErJz7C7f1iC4Aqm@opensource.cirrus.com>
 <CAMRc=MeSTN51Zjn5Ou9+bbSwS6skPvHh-eGC4Zs9j0uCu=B9Bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeSTN51Zjn5Ou9+bbSwS6skPvHh-eGC4Zs9j0uCu=B9Bg@mail.gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SA3PR19MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e6cc80-b651-4276-0888-08dda9afda56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckVHa1BFSnJaYzhodGo4VDNRZG10UVM0M1ZOMWVMTW5FVHNER1ZlVDNQQ2Y1?=
 =?utf-8?B?TGZldHNEcHF4N1NWeWNpYjhROFhIUGxaVnpIRjh5dDRWaTY2WGN5QVlINmR4?=
 =?utf-8?B?RXc0OFV5Ti94ZzRvMG4zV25jSEJRWVk1emM2NjBtd25lemwyYmJiUExUVGEv?=
 =?utf-8?B?WWRPeWhhZXlsOEVmMCtkMXRsT00zYmdkYSsxL1F5UVBmV085MnJBcDBsUmNw?=
 =?utf-8?B?bHhid3IrQkpxcVM2Vnd4Y3hNREN0clg2ZXVNZnN1OUhaQUlWNmdCTEJjSU81?=
 =?utf-8?B?TjdldEIxK1o5ZWVESXozL2I2KzNBUk4yaEgvOEE1YjdGeUZ5UWZneFNvUWJ0?=
 =?utf-8?B?aXhSRzVrZzNRVlZpZEdkNkw0eWd6VEFYSkN5bE1uWjQzWUJTY0NEY0d2aXRj?=
 =?utf-8?B?eXBrZ0ZrUFFBR1ZPUldwZ1FhdnpVY1JhNmJiR0EwK0ExODd0eTFiT3BVOUw2?=
 =?utf-8?B?YTRsN0FGcTJScitlbSs1QytnVHk1bmEvUDN5ZlM4MGFiUHpQSjlrbWRXdVZn?=
 =?utf-8?B?blJTWlBMU0xuWXF0cU9xOHFpWmR4cGJ2MkxuMXFlS21JbWlkc242YzVGdU5n?=
 =?utf-8?B?alJNNTNRaXJ1WHlXL2QvN2NwTWpSaXVENW1iLzZvRjZYRU8yL3lEbjZtVTFH?=
 =?utf-8?B?c09BMlJ2L0xuaG83aWMwbTR0dDVUQndWRjR3SnhEV1h0dXUxSWdxMlBSaVMw?=
 =?utf-8?B?bEZ6TG11ZS9tM2M1b000ZXUxVWVWT0tpemVERnlLSGowV1ZXNVpCS0JIR0Nk?=
 =?utf-8?B?aHIzWmhEUDN6YldaS2xQNmNXdmJkWWt6Z3RiUnlCT1ZxeXNIRVFrV3NIY2k2?=
 =?utf-8?B?S1owaEJDaDZiNmgyek1iUFFmSGZzNDFtc3NSQVNsajVxV0c2aHVrdlk0R3NZ?=
 =?utf-8?B?ejBFWGgwbXZzTWFtZmRpTTNUdmpQK243YytCTjRHaEhzSzI4bWdYTmQraHgz?=
 =?utf-8?B?YXN0QklsbjVjcVczZHY3OHAxY1dDRzBESXUxdzd2RFJYV3FZbXFpRnhtZS9w?=
 =?utf-8?B?RFJrczBoY1RYYUlSclJIYmpxTTJ2N25sWkpkbDJwSlRUUy9iNnlnZXNET2Nz?=
 =?utf-8?B?M3dLR3VVWWl5R1NQdXRPSWF1L2cvZkZmVTIvNmJoTEFUS3RCUkhjSit0ZG56?=
 =?utf-8?B?MjdBc2ZtNS96WmJiVUlpTXpBYVBEVEdDKytIdHJ1UWlrekpKemlHeWNoTTMx?=
 =?utf-8?B?Y3IxcmE3MmhGSmVqWGhNdk94TUswSjYzb2ZLd1VubStFSWlFWTZIVHpuK1Rn?=
 =?utf-8?B?OFZmeG1iMzFSVGVpMjJERndZZXFIcnVDTFAvV2oyN0VDU053RVlTenZySVV0?=
 =?utf-8?B?ZThlVzFZYmtISkNDOVZDTHd0T3hhOTdIcWxvZjkyUWN5ZmJBYmpCU243VE14?=
 =?utf-8?B?RFZzeUpsZFpQYlljbzltUkhsR2s4M1NTSyszYzBVZGs5cVNZR2tVZmtUNkJs?=
 =?utf-8?B?WVY5NGFpZnp0MjRIU1lzSTZTQWZPaHcvZWJQZGdqYUVHM3FIVUw3dThZUXVV?=
 =?utf-8?B?V3pXMWVPaFhwL3E4NDZ6SFZ6Vitpbi9YZWJhc0NScVE3Ly91U25KSTkvTm1k?=
 =?utf-8?B?NVVPRHZwWk5XamlyOU50Ynh3djE1WDZUaW96WGM3eUNSU0tCY1VMaGF2eGRM?=
 =?utf-8?B?djRMUlBNREI2aDZwb0VCamxmMEIzUE5CNGJXSEs2WWMzejM4ckd1Zy9EcGtW?=
 =?utf-8?B?ZEd1N2FIM3A0RUZqZmdVRmFYdDZ2UDZZeDV6ZXFuRFpOZEVmOXE1alRlSkxr?=
 =?utf-8?B?Vllka3BNTG9iZzRScTE5eEVwSTVkRC9uUTBFQ2wzMGhXV2w2aFFJTFIxWEJY?=
 =?utf-8?B?cG9QbHBaSno5a3ptNG54bnM3R3BDNzRCdVB4VXIyVEdLWW84MXlVQUUvc0pG?=
 =?utf-8?B?MnVqR0IxTzZDeHM3aVEyR3JZSkg4dEE3Wk5ucXRHVkloaVRmZmxVQ0hkNllj?=
 =?utf-8?B?K3NwN0dkOVdkZnVmL2pUWFZ0REEwMXBqY0NkWkRodkpvakZGM3hlYWFiUW5N?=
 =?utf-8?B?RnRYcTcyeUhqZEhpZmIrWkpqYlVyZFNMd0hRelRYVmphRUcyWmM1aWFFREVC?=
 =?utf-8?Q?HA0kNd?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:51:30.0947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e6cc80-b651-4276-0888-08dda9afda56
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB7796
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5OSBTYWx0ZWRfX3gVXfONMM5+Y XYcqjnkIjyjj9Tur68GZkcSB82BzaeHeHC39DIIPj8yD2uso2LtrN3s4pUKFjSUzkJrX/pByike 7/A39NHuIxxNFeEG8wnDHPhfWCxdwDp/+i7R+2JQiYzOC2brOtNwInU86BhVHEI1/lYKmt87Rj0
 kMW/wFAQrytIUW+rvMg2gUCHbpyrO5cUjDAreY0JC1PI34QUVZQRgTcnG0qqaPN902q5ZTHB9Oa T2nFRT0akeGJd4bqCt+0GrX2T+uTVE62IpFK4ETT3ahpnvcBjR8hUEACmTmrovN3wyqpb4Au+mA 4Q8hNSDrJkfebJE5RvSGTmOX5nkBSzclg3sYxQQ+L9e6eG5eyb+CyZEy0D5dgMDtsrfrnn/kvgf
 bq6Afu46p4L8jCX8DJOSmDrioqW2vp1r7HOsMd+dmixlCKDK61J6EYodwlHz08Y6PZZuVg/s
X-Authority-Analysis: v=2.4 cv=coCbk04i c=1 sm=1 tr=0 ts=684acd57 cx=c_pps a=oJZzu41BLi2InHaLLYpDkQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=w1d2syhTAAAA:8 a=KKAkSRfTAAAA:8 a=I-6xNbWw1z2qPDK7naUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5HB9PkKcADb9Em2rOM9tZs4qDuIyIj18
X-Proofpoint-GUID: 5HB9PkKcADb9Em2rOM9tZs4qDuIyIj18
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 12, 2025 at 02:45:45PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jun 12, 2025 at 2:36 PM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > On Thu, Jun 12, 2025 at 02:19:54PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > struct gpio_chip now has callbacks for setting line values that return
> > > an integer, allowing to indicate failures. Convert the driver to using
> > > them.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > > +static int cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset,
> > > +                         int value)
> > >  {
> > >       struct cs42l43_pin *priv = gpiochip_get_data(chip);
> > >       unsigned int shift = offset + CS42L43_GPIO1_LVL_SHIFT;
> > > @@ -493,23 +494,27 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
> > >               offset + 1, str_high_low(value));
> > >
> > >       ret = pm_runtime_resume_and_get(priv->dev);
> > > -     if (ret) {
> > > -             dev_err(priv->dev, "Failed to resume for set: %d\n", ret);
> > > -             return;
> > > -     }
> > > +     if (ret)
> > > +             return ret;
> >
> > Is there a reason to lose the error message here? Always nice to
> > know which of the two paths failed when things go bad.
> >
> 
> No reason other than being in line with most other drivers which
> typically just return a value without a message. I don't care much, we
> can restore it.
> 

I guess it doesn't generally fail, but I am probably more
comfortable leaving it. So lets go with that if you are easy
either way. With that:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

