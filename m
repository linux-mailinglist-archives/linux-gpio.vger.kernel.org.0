Return-Path: <linux-gpio+bounces-22861-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF5AFAEDD
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 10:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B790E3AA993
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 08:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4773D286885;
	Mon,  7 Jul 2025 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="B/TzbIf9";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="qBxI6JBt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC9D2E3712;
	Mon,  7 Jul 2025 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878039; cv=fail; b=iKoGMPrmNHkWqIigFolFiKHMZmywSJpDPIySZ9uG9/qCsBUUbP1QjVo18LL6CKXPHWypeGZ9mSHlsBWi+3MeB15NhA/Z53gQ6xz1Ve/wZau7clxoyTF1sKIOTw1q4PXwij4RuVNDp3RKSMXuFPlA4BIA5mrCKT/ZnYZIn9dlzPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878039; c=relaxed/simple;
	bh=RIHp19mSES6I1Gm/jrsRwS2dSOltLIrmH2F9Px8UWHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UaHi3cm1CREbAhvCmLau5nE/ncV2NMrJxWBTgbIaxUixE1FOrei4oB1AnCWDw6fZMYdqR2kGbwITfATq7Dq4Nu8gZrBPfvCL9C2DAsejtaKBxolrYdh9Q1j2gOiVr0idGVpA3UUnvOnEWIdJM2azq86KIn36Ref8Qu/5ncjcqcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=B/TzbIf9; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=qBxI6JBt; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675NILK006550;
	Mon, 7 Jul 2025 03:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=nvGXyV16Jp1S08o1ZQ
	yNDUhQmLPnDXHmmtUWkgicaP4=; b=B/TzbIf9esTZCs+wB2joYDdYmItlYWjqwu
	7DkMvQyJwjnXp/8J1vOCUqd1L3TQpbWvpxmsIOTGyxNQt7216X7/xyi/NJNhskas
	rhSW8QTKpvu+caZJyzlUBkLj1grs4LsZINfLJtqpYZU4KvE/4DIe7iCBLsXNOMJb
	si2k0PS0IeFoMAYgZBJTZauIeZuzViVe/DMfqOcjGilsZHjpy82u41mh7IDOaHkW
	4uY89y72A1K1cYZAdRHMbCAv8+koopIP+m6Fk9dJi0ZkGeCBnnv+kfNXeMHMxC0v
	80oITLD03czFueB0uV/lOnXCu6HGJ9Km11jOm65flV017xxqYbiA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2127.outbound.protection.outlook.com [40.107.94.127])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 47q1f3hy8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 03:47:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1EAOfDSRe158Ek3ceh+p6NF+Eb2Ssm+pTy79VHsi8Zm2Id86ZtconTBaC3xGNRQrxhOEhrPF20iPu89lDLOcmfBcEf4vs7V4v3Q7A9yJvhrKdmh9EcbNmRwKRJ/brqvVj/YFOei94Z1pPnV1rpNFgojLWAldTOlOQX5H70hMbDv+m3N+akPhDk/boQF5dDOJ0flx0Cgr2d+F+DLn7BGfqmNqhvERimWxeBGy6Q3uZ2wSmxvjRNVKmZ3UNpqSd3HDGGL9+nS37TdS4du+FMk571rFW94ChZmUJE7z2WvPRPIwa4I+oPtL2VGHcXmMCSwXnaJQVTfJFF/jSNf79wftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvGXyV16Jp1S08o1ZQyNDUhQmLPnDXHmmtUWkgicaP4=;
 b=AxSrcZDEj/7oKVL0BUeCqUhLfATu0xcsRB/pV9bnlMHmJEeE5jIQCR3ejAOlkqOWAQXT/PVuDIMBUFvBgNsMo+aTiB9xK+pXh+sLBhWiwyQ5W8izDi60Ll8bZWuLIbYU4YxfpKxzzczyK2mIuv3FE5Wr1FhTwEyiGJqj4piZSbf7bWpZWIPBkE7Mtj7G3fNg+QrZ7etCy2l/Vh8Cjoh9p4qCPl2rL4qpZL4B0YftVxVs6Pxe+l3JdadrHPKlNrFhcCQYFUyGgDTgSDRTMB/cScm9T/cJAEzraVECKCMmtDEcdrxzmC9myCZu77FjkZ+83Kl1bDujhy1zCsrS1FrNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvGXyV16Jp1S08o1ZQyNDUhQmLPnDXHmmtUWkgicaP4=;
 b=qBxI6JBt/xjTElnD0JjsGmDL63OmSMceXSQ/VtDSF0+lS2NBICzK612VItleHJZmIR6N+NCZK5hZOiZHAs3wQv0A8+1is82TH7YxXIwEPDVcRtOOVxHSd1gOfqfAO31Vae1Uk06mCvlTylGTJUfiJ6xNuOIW9hb+nLaDAgoi3JI=
Received: from MN2PR07CA0026.namprd07.prod.outlook.com (2603:10b6:208:1a0::36)
 by SJ4PPF8338AE8D8.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.15; Mon, 7 Jul
 2025 08:47:03 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:208:1a0:cafe::cd) by MN2PR07CA0026.outlook.office365.com
 (2603:10b6:208:1a0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.24 via Frontend Transport; Mon,
 7 Jul 2025 08:47:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20
 via Frontend Transport; Mon, 7 Jul 2025 08:47:01 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A235406541;
	Mon,  7 Jul 2025 08:46:59 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 7D904820249;
	Mon,  7 Jul 2025 08:46:59 +0000 (UTC)
Date: Mon, 7 Jul 2025 09:46:53 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/80] gpio: arizona: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <aGuJfSPcDn3NEwMk@opensource.cirrus.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075408.3217690-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704075408.3217690-1-sakari.ailus@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|SJ4PPF8338AE8D8:EE_
X-MS-Office365-Filtering-Correlation-Id: f6bf4977-ea74-439e-0cdb-08ddbd32d730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2UsIg3zOl2dzqhITR0rlGlFVHKVtdWkF9pCEhFuvODDHVepbbthLKrqNIZXq?=
 =?us-ascii?Q?iYsNTZAZVYm0AotnmZVGWVwa1l5OmhoHNE7rJUIRVCORqSx+Px7DBdLZzLBY?=
 =?us-ascii?Q?PgyT15W362RMof/SOqEXOkGfsmEXcpgNrQIdEr50pTwrU/cYAFb+ESLDiHfk?=
 =?us-ascii?Q?QtJo5+LCPkkJw5DEtPTayGfMlt20K1mr+jeYGfPJqQAOHxFpukr7AKoYah1g?=
 =?us-ascii?Q?M7wy7nBaHKeC5UOwOAEuhYg4W4qbk5NfJM1YdvRCW27FaIpVbpHjKL+uUUKG?=
 =?us-ascii?Q?UEiRelD1T+SWD1XhNujuaRG2sQIURBfhezx/dc6T098senPduXGZ/l7bcmQH?=
 =?us-ascii?Q?eOdl4T8ryvlQM3TLdUPg7WjfhG+ZyuO2EDULYdJq0sAgpoEWv+mjiSpnpKeV?=
 =?us-ascii?Q?YcHHEaRpQzk1O/pW7fglth7tryaYAbXN1Kcs0j6N+K6elMvzd/G+5nIP4wpm?=
 =?us-ascii?Q?DqNom6jslF3DaA3xyPyIRKBpyXh/ncCs//K20BImFhdtHbrDUWtLtitNSx8Z?=
 =?us-ascii?Q?4CBDK9dvPHJEFTJAoHpzzKvw/9OMjz6Hgn7jfU6WdDvxVGUNxMdr35T+L18n?=
 =?us-ascii?Q?v2Uxrri0yYDKBTsgS7sJsJ6lBeUaXwo/E1HGw1l4ldmff2oWxaA+FLV8N6NU?=
 =?us-ascii?Q?cgHwYCbhinLJ4kAUk5cbD3/gx1De8dUDgookcf4+sNKphw0XQWLRVCTCiegI?=
 =?us-ascii?Q?JZ7nE8tXz4Ad/4IQbNWA6Vdi6qMXKDWBBVgqGvp1xzD7ZvSHQX9lPGcKYn5U?=
 =?us-ascii?Q?SNHiGcupvH1x1a3CJ1jaNvQf2g7mJNohdif+sPWc5dPyBsf5c0E369d02xmy?=
 =?us-ascii?Q?hC++y6DsDQiZ1Z2XAWZ9/VmKm5kJf1ZE+eOEXZJp11Q2HQHBxjtlfpC8kIuA?=
 =?us-ascii?Q?BPvkjMVf9S6eNjwMmH8emBbaHQEDFdssmALte3WbE+HmqcYU6TCtfF7+v975?=
 =?us-ascii?Q?kGjF6Joi17RCCPO3Rddzw86yNHSkG2wYfpbQdWFnKxLpBtlEIbJwY3FZhN+f?=
 =?us-ascii?Q?pEAFXMqZJUiZi9t8kd6c5ok//jc/c6mlLJ/mfY0csttQMdXc5m6Y5hGSN8bL?=
 =?us-ascii?Q?M6jM3fsq8329InpNRBBJkCMM3sBuVTT9dg/NCjpqAZxhJbLiPJcPfkBQX6ym?=
 =?us-ascii?Q?4TvD511L+4xxU2Uibmv/DOcLaVG0E3aeerStoU/1WtAg6A4lfJmgTbh7RQZ7?=
 =?us-ascii?Q?FiqvtSdxDyrCcmgywVJY0pUvkfFG2nEE/pxyW0wept6ZmBxWUYHuFPBAI3C9?=
 =?us-ascii?Q?w+HKmLuBAjdiksY91/pwNpTgvx7WNBIGAO3jp84nxeBy0pobUXspYGhS+CG9?=
 =?us-ascii?Q?iTpHexJ2cQLomlf30+rISKuW8SK2ecZu0JudNMEyjWkiMBlOGg4lBKFwcjoA?=
 =?us-ascii?Q?ABABf39nKIlbezcW0bKMk07RLSOSIiKTqk9d4UugCe7kP5cTy/Ek2PQQl315?=
 =?us-ascii?Q?WLkuhN9vMgC1mnws/n9JwAPVGs3vdN/xBUTBLbYZoA2nIvWYbjORe/TlBbkv?=
 =?us-ascii?Q?pA9dBfSH+ADbO7uKeI7F+zNRuZrWu7jJZSfS?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 08:47:01.0589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bf4977-ea74-439e-0cdb-08ddbd32d730
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF8338AE8D8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MCBTYWx0ZWRfX1TpJwMnamtZO WcT5xRe1Ct1Az9w91iIbcgSMsGOripQucPWMFrLcOpRcD+MVL9CGx9mOrXWEg9soTx9mbM/Dq7Z tucE/P5btiU+FLAFjUwQCtqcybX8+0rb2zu0ITWHzocsau3cqK606ie4jHw+ZRL0AndDJAoVoSR
 Pf0pGJfGED9/MLnXEZp8mR3pwqr1YRobWS9Uhy8HIAFeSnOsxrdRGT/t3LWyLO5dy7FhB/vF0Zl zJMLcsqeQmpRSpqfXEYib3sTfiSLVS0y5yn2PA27VE8+Zy5SmcnHQPmHFQRC5Bn0kHp4PHumk3a pG/YjIhGsQju/50pmAcm27bI/KQGWvnxyR8YFmA/Jc+gFT7bDMWxTAb99Zb9yBe9KOFxdYuxfzi
 l9lhfchMXxBL9yr9iJSGxmXeJ4Za39AqMFXcEYLL+ZDpfD8fL9kvLoD7OkUYM3hBBnRhI1w6
X-Proofpoint-GUID: n8sYSffAm-JEW56SLF2VPJHzkMnJSGBU
X-Proofpoint-ORIG-GUID: n8sYSffAm-JEW56SLF2VPJHzkMnJSGBU
X-Authority-Analysis: v=2.4 cv=YNafyQGx c=1 sm=1 tr=0 ts=686b898b cx=c_pps a=Cg167on8DXnp+5xx4O92Xg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=QXuSEnVgnoAJZhOi9yIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Fri, Jul 04, 2025 at 10:54:08AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

