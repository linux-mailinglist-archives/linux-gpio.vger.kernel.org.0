Return-Path: <linux-gpio+bounces-29022-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAE0C804ED
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 12:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 74CEF3A8C12
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 11:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D4030277A;
	Mon, 24 Nov 2025 11:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="VehaOqX8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="v6cBMakY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E282FFF89;
	Mon, 24 Nov 2025 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763985386; cv=fail; b=QI6Ey3W2brvlYf7Pwo2eH2U/H9qXMuIR0zzisMiUVQKL/EupNv1bJlsFMB99HsQz6w7hiH60FMAbDLgB+jJixsVtPuwGlZjkuH1L2bhVi7mXxUhBuCvLYCrqb9V/+m0e8eazKVr26oADL24CLVPoaCU0uoirysvy++PXaL+6X+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763985386; c=relaxed/simple;
	bh=oxtLnNvfnE6v10UMhYHp5JIOgiXNrkdC+dAB2YTA3q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9F5+hZSVs0x0T7yL75MpzzG8Ff78la4njEdReEYqOc0b7UZNdLyWiFBmIS9BFpV/XfTthTed2d1X2dI+PNGYfNXL9MhsuqQg1UX/jFGRehvYgFIPu75CUdP25DkLTSx/kXtZKWL8zgXZty3+DAge4HyOvzEApAiPz5iA6jTzoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=VehaOqX8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=v6cBMakY; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO6OX2v1210193;
	Mon, 24 Nov 2025 05:56:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=JzrANnLFisvgxe/emw
	O349CySP3dmpMeIOwuCvm5GXk=; b=VehaOqX8e/pN7JAbWDIdGBE9wg/Yo40nE/
	eGbO9siWHdZacmtnqEENUoA+sfczewiJwNmULof5UmPRV1KFJup2ET+zFt9g82U/
	1x5g4YPg7n8HlowRb5sSJpFd2e3BEpTKEm1Y/eNoFsbs3HQFP/PcU4wP+tpmT0Cw
	EugA8lYfDPMSVmMbTObNoNDZ0Su4ixNzVfYjxO8jhd3DsiQzrL3CiNW5OVHckFv1
	+KHua98hUBaNkkvr+Xmk18O5Mwj5FgMUHun0lkXg604KB3f6dCZx0seHUnAANeU4
	oFFRch8eCr/e3VWv/TODf1Bs1KJXrSMnvgSCIfTvK6noanYZTicA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022110.outbound.protection.outlook.com [40.107.200.110])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf19mvu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 05:56:13 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAKfQH8NBELT4/eFuA0V23sTSlcyinODDE1oqwzSqc+j0qgT9rITCpSLebvw8Ca42Otcn+1db475mWfGbLQ4TsaNi0eodLC0nGGDLZqk4QJgzDeKEShoI+yKPLGBccaD42h7Luhlv9IXEAT5Txl+1ByGtAAXdT9hNgZU3Whd9iznbwRKoGPAadjxTcSA2LT1Spua9Ax3ILlE8OzfygfNB7hSIWkOndH/MqkZTZbQCFB7jLMQxJ9oJrEu0uqF16rfYc4eRCg2RIqulaRYACOYeVkBVEOS2XMs0Dwqv4JMvCB2H2h5uTA/UDimSp0tHVLYN9ujvmSdVQZGe3A5Eve1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzrANnLFisvgxe/emwO349CySP3dmpMeIOwuCvm5GXk=;
 b=kOLUqs23pcDwTU+6zhLo+cUjH0hi7Jjl+MjAWSdQhE3d2nP78pG7xSnZPd1IekeJ4EkSGsK39/+OW3SY7bOnNOIMOaqMy5Dx0yhkscRUThaX80FG51xHkdbCpfhl174dfYc2iHVcO117Vo2w475mepcmjL347+q0xWKxwC27AnLq0ZeUbmzThWWJGAtEnQ+y6oqLv/U8+DvFMern5JizRA65UppcO585jWR3psWMiFiG48SKaUCvNQsbCe/P1GifU/n5R6wOcuBD5msXY6Fc/Wd+IlMqiN0hv9rPyrNqEd8yLkMfYmbgcbT42woU8nl/2fjQRtvvpt1sS1UhFH1zVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzrANnLFisvgxe/emwO349CySP3dmpMeIOwuCvm5GXk=;
 b=v6cBMakYurx1TzPxCAvxRTk+4Ics0/r1Um2hB1WpOnmvQRZ9MFAY/zD5FFRkYnoB4gDhrjhgtz1bUi4WWHcpKmL4Ei5Be6mrWWE7Bl8PAxprxAaYNBou3LJ11apzbNR3yKXTmlIwEcn+wFWLR4AmEHJLJ2MpT6Y80LQC0HGNZZM=
Received: from LV3P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::20)
 by BY5PR19MB4036.namprd19.prod.outlook.com (2603:10b6:a03:228::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 11:56:08 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::a0) by LV3P220CA0024.outlook.office365.com
 (2603:10b6:408:234::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 11:56:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 24 Nov 2025 11:56:07 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 26C80406540;
	Mon, 24 Nov 2025 11:56:06 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0C546820247;
	Mon, 24 Nov 2025 11:56:06 +0000 (UTC)
Date: Mon, 24 Nov 2025 11:56:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: rf@opensource.cirrus.com, david.rhodes@cirrus.com,
        linus.walleij@linaro.org, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cirrus: cs42l43: Handle
 devm_pm_runtime_enable() errors
Message-ID: <aSRH1FydR9VXB/Fb@opensource.cirrus.com>
References: <20251124014933.898-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124014933.898-1-vulab@iscas.ac.cn>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|BY5PR19MB4036:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2e142a-e3a1-4f45-fb28-08de2b5073d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|61400799027|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F7rtB1Zt4E09fdwGQ9rVS23SM2H+Tnrsv1sjZoN1WJ25TgikoXW4BKhUS1AW?=
 =?us-ascii?Q?Iur0UI/iWC+FY4h0UpHKOPHv+ID+vB8cpt3mQwwY4p89UYpdr+0zwrGBBGXY?=
 =?us-ascii?Q?LDrpPegb0P3q1kzQQRoenfAce/fPoNbYTis9odHmx2rTE4fWG4xdE1tfZ5Va?=
 =?us-ascii?Q?mHqw/ghXHrqFJo/v1eNRX8Axggxc/hSwPOd48neuTmouYpsMVcTJycHvaLtB?=
 =?us-ascii?Q?nIf/tP09TRuwVGMF/eChrETMVL/S6IGnJlFw1z29HDdt8gKnzd0jwNGW11j7?=
 =?us-ascii?Q?w2vU28CJHYooUdMJEqpHGYIfB+n406DhfIgnF9m9rT/1oO1MC9BKsy/1SNo7?=
 =?us-ascii?Q?l+WTj7FOS1DcNUGF6almig1gv3Kp86E9dP16R5bNJEvRDUVlGSBqz16Bz/dQ?=
 =?us-ascii?Q?5qsrkP9myZ6b+dmYS/vfYxdLVrH57ol+y2UR2nXin/hzTQdNncgPonINadDI?=
 =?us-ascii?Q?O9QmmJuwxyfQZ5L+Xca0fta1mM25+PSD1KMqadmPcT3oEvau+sxC4mBTDdXB?=
 =?us-ascii?Q?8c52oYvC8hZrFnxYEP8jWMZjfDZBSs8g5SUJePHXgErv/haf5pxyCpf+EjAJ?=
 =?us-ascii?Q?+DNlbEeXtl5pdULm4BmN2Rc+JuaBeFLRlXzyjt1kHITluzJHxidQqpcaQtz7?=
 =?us-ascii?Q?wDjR8A0dC9DCql06CZzzbwYUWX4uNlOTS5PM+aSeUxlqIm7JDwzrJbNdpO8r?=
 =?us-ascii?Q?kUozAvoU9eRIuXwemFaheqRBuyjBpnEb7ykb5GeRXGyCc3Feoa8YepywbrHU?=
 =?us-ascii?Q?JlO/cM2McoKYi8hNu3tgqwzTH5A2O1XTbKlH7D5sPzt2zBdyl6Yx0apXFxyi?=
 =?us-ascii?Q?vlNeyDBuOYnrMO3R1YjehiwV+Hn8aqI0fJ6LM5CLITdOO9fAvIlIPxv7zZQV?=
 =?us-ascii?Q?WVbaCbTSEOIZqOus629OCIUzLUmslOynizayd0oO+2VhdYGRGSeX4tSJjNsO?=
 =?us-ascii?Q?3yOBCNQUA/YGVCZMrg4kvK0Kyi7IwsThq33t1pJwXGbxsfB8eDSYBzgD3XhV?=
 =?us-ascii?Q?MJMgPbG8pbfarxCYxddbMVxyLfl/9hJnhuAHNRCtH/h00VPNpVE9roRSCJvQ?=
 =?us-ascii?Q?ahvXzvDmU8+qnNDxfXJiOVImQW+uHCm6Mr5b70Cdyb3+OA6ICG4BQ66rCMGp?=
 =?us-ascii?Q?OPLC8w6s+geml8ntD0aEkLibKtQKXTWfPXv+u19B/NoLAYpAaFzccH0JwQ4p?=
 =?us-ascii?Q?Wx0l12OH0hhqJ/7Gf9AO2ORbGoyBx50wCBIPOL+KyZspwF5UntJLVnovaGmB?=
 =?us-ascii?Q?POzGfWb85rqKO1IGdvgkOTQ3Bg4WhSMHkH3H41ahcmUO+LjB5pfF0/8pFR67?=
 =?us-ascii?Q?uA8BNGOB4AFwrVvLNrMVX6C/ExwOYOXRybEZesqwOHOuS9Rxu9wkKvY0H/Qs?=
 =?us-ascii?Q?f2ovn3BLbkxh1J9pUASQBsBBV5mLfwiVXa82CyLKzJ/xArRyeRSnNxvsHcqS?=
 =?us-ascii?Q?FBkOGqIp1FObKZTQGWl3y2pfsVc+MnRNJW0PzgvWzuSBdcit7AMTRknN/jL9?=
 =?us-ascii?Q?+lyvEle3Ba0KgVV7ATvLDbNFSKJrj9MH3ByQll4o4OmUdAKm4gL4GqQfFDAa?=
 =?us-ascii?Q?23y/oEKX9aQqNA6ZP9I=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(61400799027)(36860700013)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 11:56:07.1912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2e142a-e3a1-4f45-fb28-08de2b5073d7
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB4036
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=692447dd cx=c_pps
 a=ZQ5czZ6yTY4ZD+V8z0ndCg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=BFg5sdzra2plRMfZhU4A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEwNSBTYWx0ZWRfX93NC8W1xc1uw
 wWTBW/aPk9RcmIg0qzUVDi8KNsOVQMbctKVXgJwOiZ+v601nch4iHZcgAuMtgccdqJv9it3xRfs
 Uq44AIyKYL/4E7n43EKLp8Ou/x+U5C5nwPknOHj0pIyTNcw8Cf9IkBVc1gKq3pZ8lTj4hgu22dX
 Hwcp4Bvn/kt5vosFy3iA/GCkhV4vC6DTjKPzveajHoZpHeBVvmacV2gjLIJCSP+jRGTkz6k6I2b
 FsSy6qpocNWdav3oGeWb8YZ+/PwtHQFYNsAjGpJL6z6x06hWCs4mzbj2uu/lR+7jtQI5Aqlr37J
 aedNqo83S4QaEypZw79EDkk+UIXeAN1vtp57ZiwVvwhH+5uJ1mtAxEjaAThx/LcMmWmmjOmG0nk
 /0SUoPwSlDJFLJ3Noyk0SKNTeM8R/g==
X-Proofpoint-GUID: 28b-yfIMF5vY_aRfp98sDev9rNbOc6GS
X-Proofpoint-ORIG-GUID: 28b-yfIMF5vY_aRfp98sDev9rNbOc6GS
X-Proofpoint-Spam-Reason: safe

On Mon, Nov 24, 2025 at 09:49:33AM +0800, Haotian Zhang wrote:
> devm_pm_runtime_enable() can fail due to memory allocation. The current
> code ignores its return value, potentially causing pm_runtime_idle() to
> operate on uninitialized runtime PM state.
> 
> Check the return value of devm_pm_runtime_enable() and return on failure.
> 
> Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

