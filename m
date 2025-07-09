Return-Path: <linux-gpio+bounces-22974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2CAAFE471
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 11:43:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE530176E1A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 09:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A8F828642C;
	Wed,  9 Jul 2025 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="rDzxu0ZO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Lf8Vn7H3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0E722331C;
	Wed,  9 Jul 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752054199; cv=fail; b=OjXuNdllFMTR77vbJs1aA5SvDW/BQkIP2HWtR0hSHipD5vXx6qhw79IeeNCSNgir6j2va6cWtQgeMLdlc5ad6zGW7Zhyxav9gPO3HP2jhttOKzbCWDo8c/hw3MhDn5eyezY1bdzTHZCseFeQXdhrWKwigKqXHxC/7URTq+TRyN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752054199; c=relaxed/simple;
	bh=X//aruiJs5tYV87W+uC4S7KEJ2hc/YBlY0kf+MD01tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8L0uGkCkhN2+HfaGej49epfnC/tQejCW8/Xrk/76qJ5HyO9fsqVBRL4SYA6w1ggNCCjua2ptOgMyqO9aU1iQxWPsRxKolnaWiEs3YSl+9dD/X5rDT1vqWw2nAdtx6+tdXoKiQ6kIlJkURSd7YrHkPFEjNmrg3YpaWcsrC7Cub0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=rDzxu0ZO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Lf8Vn7H3; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5693uJCc009098;
	Wed, 9 Jul 2025 04:42:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Ebddkevwaywsf/r+wY
	v6AsCFCvwfqh3lFph1jXWCaeo=; b=rDzxu0ZOprDpHZZ0LmDhPye9sUTyIl3jeb
	xdbDjI/9Xu0mA6qyyGPIaCIWPNdOo4h3A85ZZw2B6Quz0l4PwUGylMI7giQb3DkG
	tQsX90voBjn71LveQyHr7Lk9JODioyKnsAsVELx/n8nTKcBTC4Hcgvxd0Cet1P/s
	u5E9SPQ6K5GaGFA79m+tDbFEWvnbuEYSgQU6zwq3jSGk+SoaK6nDN9sxxu3+6XFH
	E9KC2gf2upu1nAq3gQi94CuShMjFOzYJmoflPZodT38kb65GebAanpd1Mpf9VlFO
	QDHSY3tzMX/H/Iec1peDWAYwSV8oBSyt3guGfUpyrZLht0dlx6wQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2096.outbound.protection.outlook.com [40.107.223.96])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47sev68hmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 04:42:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kc9wFH00YmOdkQ57GQPYg7gy91urh4uecOSsvabGuMUHV6yWbkMDmJC8Eqjv8uTsozg56LIRulvmJW1C1YrSIlbkrDOTH3hWHkqJKcGsHdxYPREInthS4AsILjuqMsUeuYHnZJbv3eOnNITbbRUZSQbNopzv+SN1L7d7llLE5YTkOTfHq+CXuqspMkXZwdmOXeZDxeMu2r0DA06kIDOdiFa7foM+a5/81FlMaTL0bzYxYNX6mLwb0z/+85cZY4GkObSVxY3HS+8CWMnjS6fIj4l78Kzt2ZwjJMw6NiFxwC/41SQKf0NqVbz6I6E+VROEegK85Fk+gzx0dQ+n9kYFrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ebddkevwaywsf/r+wYv6AsCFCvwfqh3lFph1jXWCaeo=;
 b=JPXKHz3eC47Qfgu74Wkwo3AvbPpVTd0hjNA9zGNWI37Bm24PEWtd1ChTfDwr4lw+65YtZxOwO5KYeZ+aoXvEmvRTWWj1as+LF2k3IbdeaUA2oH7dpuToFosbo99p3K5GgRksgrw9NqnzwTmiC90f2qIqY0qxLeO4zWC/D8FHrUsztbPZKq+PXGl9muECUmVh5ypXxOIe+nEpiMZaWgtdzT/9tUw1JlbFvQ9xmOL2jSjk079lftSVDYc6OP/IBI6m2w9L6oQUh6gv1a0JO3BH1I2a+edgnX1M5b1T3yDo5ZUt3vP0tvwbb7imQb5GecXPx7F2ajMDOOoev/kKMnrOig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ebddkevwaywsf/r+wYv6AsCFCvwfqh3lFph1jXWCaeo=;
 b=Lf8Vn7H3YIglTDznKjOCR5g6O+MFo9MToY/55m66gP2kpWthSuTdQ9nB5tqpZEAsMwTJ7465DKzcTdFPTXkOHLfKNwrTL7Wzof1leM1Ew8b5x66QO2NelBkr/M83Qvo1K5m1E6oG/+GdEHXeawCTZfWWK4v99fIN3iyIhAd9MvA=
Received: from SJ0PR13CA0140.namprd13.prod.outlook.com (2603:10b6:a03:2c6::25)
 by PH7PR19MB5658.namprd19.prod.outlook.com (2603:10b6:510:13e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 09:42:49 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::65) by SJ0PR13CA0140.outlook.office365.com
 (2603:10b6:a03:2c6::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.6 via Frontend Transport; Wed, 9
 Jul 2025 09:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Wed, 9 Jul 2025 09:42:48 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 503D1406545;
	Wed,  9 Jul 2025 09:42:47 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3DCF782024D;
	Wed,  9 Jul 2025 09:42:47 +0000 (UTC)
Date: Wed, 9 Jul 2025 10:42:46 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 07/19] gpio: wm8350: use new GPIO line value setter
 callbacks
Message-ID: <aG45ls857V0+xB1l@opensource.cirrus.com>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-7-b8950f69618d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-7-b8950f69618d@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|PH7PR19MB5658:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a0b7119-12df-44a7-38bd-08ddbeccf773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e5V0eWJ3McSAPYwXvDmXpQLzRMB4/6LakE+lraGOcD/az/dOlK/XmVxqP9q5?=
 =?us-ascii?Q?J7KFJE9vNbDdFtxJnYmIGNupWB3mO7o9lUTlFh/uTgDHmR90+S53yvP5s71M?=
 =?us-ascii?Q?Ke4PS60bWfzD6US6c0cPlaj3Fp0pVYIDaYabUaA3QRanZ0kh8QRHQaJR71+j?=
 =?us-ascii?Q?S7Tj5rFGOKWXVh0A/d78aTT4tNHy3ULDyb+tGfLSdawtV1Bw9o8Yu0Okg9zG?=
 =?us-ascii?Q?Az091yNkyqzqwcIAz45C4gskzH7bPaPnadyIg/SFFjx3Du5mInbRqsnPhYXI?=
 =?us-ascii?Q?5II45q/Iu2kRI0akk63dytcu4360e5WxkBDPGG3j8geGqBwBShgkaPd3XnwU?=
 =?us-ascii?Q?KssgfD0pJGgoV3Cn7UNA7EY7pqxF/nEv2vgAyiD88EJOugS14CMTFcuWWKg0?=
 =?us-ascii?Q?hH40asSU6BYhiV0BfDy4v83bb0P2WoDdkRkieEd6aM+CO20fpUPFGFzMfb+X?=
 =?us-ascii?Q?L6LsHhB/5Kq9Y3Bmi2sIKatl5zACq1c3pt2CqvThhgLXObXN1W/EUO/1EXGI?=
 =?us-ascii?Q?s+s/ZxUOPuDc/dhy1t1vfWK5vAP1HDQkRMx3s6uiKcpdpXrt+2f9n0jGclIr?=
 =?us-ascii?Q?Aa4Yf4jGGsyS+5MOeEVzyj5xeUIsdk8UW0wEnqvlBxXMUrm6m4n+oEm0OI1p?=
 =?us-ascii?Q?a7aUNtez06dibmCjhNmX+iZcnZ66Gkur9AHeaJo1DBdDrX4dA4qr2qbUwHE2?=
 =?us-ascii?Q?7EmznIwA0/LNItjJMfO1rZzhqkV7HH1cShO140MvEDeE2jr7ysacPB7tN3N7?=
 =?us-ascii?Q?25gcYP5S8BRY2C5knpkfeqsEcPnxeRl+IEIDzBPTekP1NZ2M74wLiMpCq3HM?=
 =?us-ascii?Q?4125yjwFH/rTPVYGZQlXMGFe1PTpvMB8PozB6pDpspxkaJXlA6nPD4gEpgs1?=
 =?us-ascii?Q?2kXLZL1nv4QSuaozNyPWxDbFj9Wcc4UPb+AR72bMRlNZNichGzVahSOUwmes?=
 =?us-ascii?Q?fHYD3Qk91fxROHJsIC+cA8pscdUorBSuh9XkfEj14AkC8jUclEyu8OWkchoi?=
 =?us-ascii?Q?3JRkUnp9gRSnwaWON+mvDHs2zuExuqlxgeULRkGZGvJxmnehzAkvMltNYrlY?=
 =?us-ascii?Q?YTXgfT510FlVrgG1QhRnJ67UdGRmEDn2Ixc6rs7QFBCANm7h4+zKkR7orQzL?=
 =?us-ascii?Q?ODufVOvRhV9mETL17haqaJ3sQhghnQiplVyJ+glr/zYgohtWqP0nc41QcSzj?=
 =?us-ascii?Q?DBHriyxWuEURehkSmJWFCVXjZzrKo3eeqQAsRiVw1190OhGZt5np5eiLsjj+?=
 =?us-ascii?Q?OmLmFIXymLn3pil3zo+PYT6l85ye74cuW4tc/eVYIjzxWEMTYYi00RyvZelL?=
 =?us-ascii?Q?YvqPUpj7tJYJbez9NjUqrZtwce7awOOYeGhP3VpbuB9Kf3iNdCo9Af43lbwy?=
 =?us-ascii?Q?Ok9kN6H6G31bFhDXb+IeMS8yooj7IwYhiVqPq9fU6EGDsb94hscw1ibAimXy?=
 =?us-ascii?Q?VnWyiYe+graZ6rz8Re8of/5YOgME7JeugeNNz45duAzQRY/CWWqRWQ+oijbW?=
 =?us-ascii?Q?vdCn64dT5txWL5XyO0Z9Ls701bp+z/MbzP7x?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:42:48.7336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0b7119-12df-44a7-38bd-08ddbeccf773
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5658
X-Authority-Analysis: v=2.4 cv=Zb8dNtVA c=1 sm=1 tr=0 ts=686e399d cx=c_pps a=GDZr2dl6+9TGnY0VEvXriA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=rmY48xm4B3rYoUPvh5YA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NiBTYWx0ZWRfXyCgwaBVRlgR7 qnuSVuln8D6NsJWS6vhfXS+8jFB5NC+pqp6Qcvbh1Dh8HNsllUuiIV0NuqeNZsdW8caUrF1u73c txkNU7/QqBdsrdV3Qyer1/aKPwQfnsgm1gWJZVFar6GNFIf5Tll04LD4RyRYC4m40Yim3PZ1H0P
 wgww3rU36eQWLVlLI0kNE9KZts7hMg0EHXZXhKVtbYwNzPwdkQoKpynssVDrvzbzAgp6fwh7F1Z OUMn9QZWxQ1F27nD0vR9LIjv7tHmcOrsRoFysnCW6/8cc8TrDz7m77j+GF+l17fmhuu825E+/3G KZHMkYJ4mClkUFUxDZr+d819seXmMJzs1IWYgDBF6xn3dw0fI2B28d55YUClIIkasVue+CH5wE8
 V8gYRjv0Sien8x629Skhohtetx/LbomLI1494PU8SHCQnTB/67VcUmIgxmyQ7s2JM8o3Nwz0
X-Proofpoint-ORIG-GUID: UDrxEjOItx3HV_pi8s-AvGgJ6f8VUlsQ
X-Proofpoint-GUID: UDrxEjOItx3HV_pi8s-AvGgJ6f8VUlsQ
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 09, 2025 at 08:41:44AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

