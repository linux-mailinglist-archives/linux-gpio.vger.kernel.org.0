Return-Path: <linux-gpio+bounces-18483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FFA8070F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:34:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65891B860E1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 12:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C8A26A088;
	Tue,  8 Apr 2025 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cysniewU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bKh6j+bh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3A26A08F;
	Tue,  8 Apr 2025 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115171; cv=fail; b=b4GifnE70HuSiQyoq6r3OOfV5NupovOfwKFsdW5BeLNl4Hl9zxvGEOk1z6awg/ecSvi/v5snXFSFkHMu/wnSP6gMkxxkOzOmzF+gPjpO3EN3vyh+4kX3Oy0ARBjjXVXF5e5FDodc+9s5IqntCF26AXbPqIYUsVfdYrX9FJ5A+aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115171; c=relaxed/simple;
	bh=koyR13TU+2XblTorDCuqV7QBxne33OHl3WEto25vbbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJB87307nWWEFWi88xiqHmlILdXLKDRFY+ftQSeNimj4+dMZuSyPHMe+OD9MRUuQ68alw99KYZGF1cCJf5uzJLg7ZFqTTJYcNUDkkFefYl4osc392JfnuO3DsU04WB551GV8MAhBrVzbxn7un04hixy1i95HdgzzwxZvbZS9aVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cysniewU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bKh6j+bh; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5385drL1029480;
	Tue, 8 Apr 2025 07:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=2IyWEB8cxeOM21NSKZ
	ME5NJNkudhKkfQxMIv0pt4zVU=; b=cysniewUxjgAVldH18tU0YQ4StSyOWQkmH
	S6GyQ1vOpr172zeBVy1ItDIdRV/eum4BKYYukayGyOmeNjrXqNGWHiPYzBZytymE
	qN+aLf3K7yUfd/+FIoDNF541Vd4WD151Xm5ph8qWjUzIZzN3AIku+leZQ34Lve16
	ry1MCaeLHf7CEUTIvRbMWlWa3+RlfaKR2Fd/0NZ9rXUyp/VgwmO7/ib41QuMHDOQ
	dTZOt4jcAkLoiTQYoCuwbcFqBO0b2YrR3zjH/fmfdwfWKnWn6GZ4dqNrmwb9r0P4
	jRwy/2OoQlkwjBS+zAGDxuzdp4cvbCRc+Kcp60LdO0LrzAxCKATA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 45vemwj0kg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 07:25:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOzIeW90Dqp2901oGjN/0x+CN7ahrxJ0Kf6/6IgKz+eDAK5nCOyjNUk93FIXERftKjeSqv58lYBiMY8UfDpr4Q9nBnKSLRHQbXzsoVava35itsInA2H91In4lzFQpz5ggHgg3MqmhLReLuS7rvraGybxGnUgqgK0FJ68UDBv8HeOEk9ZQBm0HtSNDf0H10BARYfyPc7M65HYpb4F06rErV0Jau2Xi1Vo3EivR5Gl3BVLbnfWJB8vuzG5sjlokciYWMvAgTcPM/iL94QA1uLYvwtfzm1pxym0mbGopEor1A5PvclB1dZysqdrv4/v55yHTAN6chIOdIK2bh5eQLLcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IyWEB8cxeOM21NSKZME5NJNkudhKkfQxMIv0pt4zVU=;
 b=ycX3AJ2ZQ3BFIhLthytMLc70pBjel58pEzRjqnJtAxzMwVrz3cvLK1icrrGIBq5Y5F9Ny965tLAyJ9z+d/wVmBRrQO08wRxhmUQasf+uBvSIAnfBBo8XZeCD5bLd/UtuJfgrfD7/nYPn/hA4YwfXnzodBI1vAKNY2UDB8snvw3/UBB5AozC+V5pjTRSZX+7132QtdM81+7T2JKVz7GkXEuHvyVcixiIoMwajv0NR5UyvJcgWHPIiWMNkz4BAMfoDcJiDxqlS7eOAVq8CVtZ1kxtc57rR/TjMv7RENn+hXwPbMRrguOcwf1pnTb65dKb67okTSD/VIuuZb1n/SJwCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=cirrus.com; dmarc=fail
 (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IyWEB8cxeOM21NSKZME5NJNkudhKkfQxMIv0pt4zVU=;
 b=bKh6j+bhpbLwJnyGoIxr9WdU4+KbifwafLDvMheo9XB7a/m6wORqYRQlwOJdFlepeOZfxm3m636YqLzL0bMjB4WpTmqKwHlkuL8qVMD32FNGCSFi9kER8C2vWL+lFuKOqXl6yLBtQ/3Z3QjAS/xahXct5DuJ610MHixgRNy2Stg=
Received: from BYAPR08CA0039.namprd08.prod.outlook.com (2603:10b6:a03:117::16)
 by DM4PR19MB5953.namprd19.prod.outlook.com (2603:10b6:8:69::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 12:25:31 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::d3) by BYAPR08CA0039.outlook.office365.com
 (2603:10b6:a03:117::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Tue,
 8 Apr 2025 12:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of cirrus.com does not
 designate 84.19.233.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=84.19.233.75; helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13
 via Frontend Transport; Tue, 8 Apr 2025 12:25:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 64170406544;
	Tue,  8 Apr 2025 12:25:28 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 456A3820259;
	Tue,  8 Apr 2025 12:25:28 +0000 (UTC)
Date: Tue, 8 Apr 2025 13:25:27 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Herve Codina <herve.codina@bootlin.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 00/12] ASoC: convert GPIO chips to using new value setters
Message-ID: <Z/UVt3Eju3RtrOu3@opensource.cirrus.com>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|DM4PR19MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bede2e-9653-4753-d382-08dd769873bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?luatVNp+wN12stlGRKW1J2VpmGZFR/lV94SExazIA4LuKudtyQ5h8/DUup7a?=
 =?us-ascii?Q?eS/O32/OrdXGtCDFaocyHojpIA7EXbuNe0IZDEEAhqEjgn+0gPkFaF4IVqX1?=
 =?us-ascii?Q?e64o8+Q64//DOBe/+62M445Y/C+wCwLKwsleS1Mh+EVZBgT/z6klgtWKcFOv?=
 =?us-ascii?Q?W8gtCTuAXZtxR8J5icUtvdSwjtuhXrWL7CLbr/SE7Ni/332U7dv0coqk80lM?=
 =?us-ascii?Q?5McoLl1N2Uxn/T9AWlVGokbEatepLjdVukjO0CFzWHez780a3PKZm7acN2/+?=
 =?us-ascii?Q?jNKub/RRyiPY4S9MJ6XVlflwKnZ1yO6OjX/yoQeANp1meNhcE1zY3lrCA+mD?=
 =?us-ascii?Q?OVMQZjWGDnRh8Z/Uj8D2qWhm733woYlLzCLI5h485sEL5duIEG/4+Qf0NryH?=
 =?us-ascii?Q?d6VuiktV2KAj0/fDkuX6jZVQsQ7shtMsuI4WPfNSc4sWjjouZ/4XP41KuLEJ?=
 =?us-ascii?Q?RVanVOUSbi4CBCRcoWzYHpfadNm40qocIM0FgcPntws+7mDGnEjtR7tKk8rk?=
 =?us-ascii?Q?1wmuqWL0BU0rz1aQphUngAUipSao5JGcDfa5yP90XZJsPvvDXqAfRdP56m+z?=
 =?us-ascii?Q?TegNrSZiCzVeLfqXRfyOavLA7ZIdEC4/J4d8A6m3blENLkDsud/3380yAgez?=
 =?us-ascii?Q?bsy5vntaUGWA50BFGApmWGmIQZ+xylFEbblTJiQyllAipUmlqZ20AsHoiKbk?=
 =?us-ascii?Q?AT70Iri2ZoRMcglGSGT+IC81Qt5tn9opWszA/SLi8CEUyR7GSguKo9jE3Zdc?=
 =?us-ascii?Q?8dNh+qqZFBvA2j6Y6F0vXKApvkQeEC7GaHQLzTPsY/XcNfvLN3eOGOgF2K+I?=
 =?us-ascii?Q?M+VN9JDNFososukcVcoIBcmXr+UUDLBBhJHsySfyYgK+GYWg4NcNInYfQ83e?=
 =?us-ascii?Q?dCiyPUU/elTaf9Kj0xZn/SZqrpnqf9lXJWYyUj8Pd+yAmAavr094zkVGLEzQ?=
 =?us-ascii?Q?6E4lTWxvn5gZPJpiXfz9zC9a3ZEwGA+byEZn9ZEc845WG3Bxy9eYgnCoYO3k?=
 =?us-ascii?Q?vq5FJwcAfjyoKpKGTeDcsNEb+UoZJZez7U6oJxkYRSQvskbwjSV5jR2Jdij9?=
 =?us-ascii?Q?Gh3PqotMIpzCNQAJk3TMiRH3DGV5q+Rbgq0fJDyQYl8TrBPPihhxF/oaoxJb?=
 =?us-ascii?Q?45O55hiB5eoCzw0MqdDarSJ+BcFXPCOT5twQIns+ZZ+yTHJMmz2gx2zzCV0n?=
 =?us-ascii?Q?2ozde08lulsUUrv3sGGQIIDyL9GJSoi2BaQGG44KaNlVFY1bq3hmepzZoqkc?=
 =?us-ascii?Q?Idp6WDyxXeNWCk1dseWGlI9D0N0IkoY4+ZjxQlI+fue/BKzENwiFSDm2fTx2?=
 =?us-ascii?Q?GytyhjFWOkFicaLCv8V+gmYWYnoqCfEh/g7Wgr6Qp+tiEAvpPZIbg8fL8kQS?=
 =?us-ascii?Q?ok/1bYiYzsIThXsd3JH7UvDiH2VKCJrZG85ri+SzPTsUky6JFGd6Sz6ZrZgI?=
 =?us-ascii?Q?wzCx/F69tXd9kISeES1O/9ghv1/44n2XEEAR9orp7rFuOIyN6adRjhWAhUrS?=
 =?us-ascii?Q?S6VAVjyG81zlhQg=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 12:25:30.1902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bede2e-9653-4753-d382-08dd769873bc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5953
X-Proofpoint-GUID: JZMS5AkOHeargSsFnSKluKozHZt8omIx
X-Proofpoint-ORIG-GUID: JZMS5AkOHeargSsFnSKluKozHZt8omIx
X-Authority-Analysis: v=2.4 cv=bYprUPPB c=1 sm=1 tr=0 ts=67f515c1 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=VFRLNnRi-L73absxi0MA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=BGLuxUZjE2igh1l4FkT-:22
X-Proofpoint-Spam-Reason: safe

On Tue, Apr 08, 2025 at 09:38:18AM +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ASoC GPIO controllers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

For the Wolfson/Cirrus bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

