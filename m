Return-Path: <linux-gpio+bounces-38317-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m3gPImx7KmrBqgMAu9opvQ
	(envelope-from <linux-gpio+bounces-38317-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:10:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE9E6703F3
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 11:10:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=RZkZPo9H;
	dkim=pass header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=zWSkIUE7;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38317-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38317-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=cirrus.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C777032D511C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 09:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFFB391826;
	Thu, 11 Jun 2026 09:03:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B205435DA6E;
	Thu, 11 Jun 2026 09:03:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168626; cv=fail; b=ci/+GFfAIwQWXcAPJ3fR9onmuL8gDx9WVxBnnbiaNIiGjTldNRZ2aagBsaJJUbpbfoEGSpj8sSeu1ChGrvUl6BvPMnO/yzeFyloIHZr23HrvANUu5RHYcN4OsBnKJbGuiENuI8gSydth/aZu7G1jDiQgm6D/nDkT0hOa1PGuaJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168626; c=relaxed/simple;
	bh=uMZLR3NKvjDyEaU6ltjp7Y5ZjZFeav/zts9dMzcXrGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gCx7TCCl4c6q6AkWugauKgfrHTXbXQ5LiEkoTJ1Y2YZaG/OfKI+Vk7WrpbB2efndFsGywL04OFytxUtAQBngT/hU5X+TbY+2Qd6qQ0i6RRSZBxRc68XaHtyYIwfaUbQjWipWkm9wJqYQWJuPU4l17VDCEx+oam7oeI64q4/AZLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RZkZPo9H; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=zWSkIUE7; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B4R3gC755499;
	Thu, 11 Jun 2026 04:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Hbl2Pyha24aTRNCqnd
	LtdgNLr4qXph5Y0OcR27kxhl8=; b=RZkZPo9Hk8GKg2ARlKfYBARpkgOcQGi0dZ
	+rhW41JxcPN8bz7a4D6t95nZcwbvq6or4H1GBqe8LGJhMR/IkyShm4hk1z8gCQ+k
	yFOyg79MoF/Z2l3L7Fam7jP8vfPiyi4uLUsmZE1Sew5CvVI/IxbxdZ0RryYXIjT/
	bJaFlHFvAT5/j3o4p3D2mWJovR76M55tKSH8WxLTt6isupJ9qyfmVP6tUgkwAplQ
	A57eyOtJ0zpVDmXoYhUiZ1V8ueVxl6auu/Rj8YGfWm1+okQSHc2RLDrlozyzAwPa
	EliyRGjbyowx8vjZy+CtvAo9tc37J6AD+EVxXJLdWMYsvTwEJg5g==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020113.outbound.protection.outlook.com [40.93.198.113])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4eqe6e0tne-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Jun 2026 04:03:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2F9vnT/OVMHZ9BAKR/Cdqs57um7JTeHBN7tj9oYHXTQ7ebisEvlzsPjh0QGBLewgDBndrdPVYVK+xgWQyxPIw9FhNLUfJMcggD2Xr+lCaQ6wI+3Y9NyHX6XiMmrSopltbiVkscg+NvUFqJF4Xt2ySFeTVdfrgWEC8am6+0f9JQzfpoY2DE1niBcBJvh4YF9kRX//b7ifzXgH0O7aeGPamtr81nsKRCKUL79vdCI/WkLHqbx7Pex3/+pzYSvTFrzVtKq1ieF24bqJCUG7HTz8GCejeqBNwKE/ZvjS2YC7c85fzVBNknxNXXvqBcC6TiSlNqMSsB4EQJVp6VKRLcvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbl2Pyha24aTRNCqndLtdgNLr4qXph5Y0OcR27kxhl8=;
 b=e17R6BJmcgwoZ7SP5KE3sl0toXpuEgLb2mJgs8c/WqbV5Aj01rzQtSB4rJFYZt55ITKXz/4+sVqpcdgPAzu3rKwYOyYRznq0Lrye/08YsFGuIeqRhMHHCx3IlPpS/imB161NZ5sZAcRirSnekHCad5e1wgWpbmJSn7IBzYdzS8yLMM1aGPGx78+IYpK6fmXzPgXjsoUAszCerbOARPCuN5Y821VWriPV0AquNGH2V66os5NjGLp2ls0cLW4OkQCYifvI8Cx75AW0OZuXblpDxNWyEQXw+JqI1fyqO61Y+Ic9K540pi1mazquY1tT6VPZd4w70CUlVDYCozci/zwBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbl2Pyha24aTRNCqndLtdgNLr4qXph5Y0OcR27kxhl8=;
 b=zWSkIUE7qXDu9KKrM5ctshAl4omx97bYmPX5QxYeGgJU4l+fzdO91xRHlviPZVReYUOHwbieS7RJd4D1BGUHlcmmq6Z599iJfPyTqKNOJOUojU/x8ppzczu5aNScQzBFLQ1KutnjVzzQcJhAoNWfPJiqTSieGWT5CmFml2VJoAc=
Received: from BYAPR21CA0024.namprd21.prod.outlook.com (2603:10b6:a03:114::34)
 by DS7PR19MB8295.namprd19.prod.outlook.com (2603:10b6:8:9d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.17; Thu, 11 Jun 2026 09:03:23 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::7c) by BYAPR21CA0024.outlook.office365.com
 (2603:10b6:a03:114::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.4 via Frontend Transport; Thu, 11
 Jun 2026 09:03:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 09:03:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9B5DB406544;
	Thu, 11 Jun 2026 09:03:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 834B682024A;
	Thu, 11 Jun 2026 09:03:21 +0000 (UTC)
Date: Thu, 11 Jun 2026 10:03:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Message-ID: <aip52HIwSIWBoE1d@opensource.cirrus.com>
References: <20260527-mfd-arizona-irq-v5-0-ebeda2e925da@kernel.org>
 <20260527-mfd-arizona-irq-v5-2-ebeda2e925da@kernel.org>
 <20260611082000.GL4151951@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611082000.GL4151951@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|DS7PR19MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d050cb6-6a58-4327-d673-08dec7984a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|7416014|23010399003|376014|36860700016|82310400026|16102099003|18002099003|22082099003|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	AgH1FJONV36h6y6AiUEze1siiTCvn/xbNmZA9UtXJl2MjIQaH3hQzY6L2UDpqivdv04RlwqIk2AKLl8z2vLUJNJJHFcuftzaseYTOJPoHtPdcKcQQS5vsu9LHO2FzFCQE3PBUCD+0sLGDS194P2UbmRz+tXSZgISfcXpAf5nsAFHko76g2A/8TEaTdt+VQcsNO9gtH1NZ2NTSD5Xv4NB3cSl2Zk7buslvTp0KF9mgSqWMsvbNv8/+NdiyXesOvxe2GtqJvOAn3/5/V7X28AcCWi7aBuJB62GV+pkeEtvDuqHGG0SE6TAYFMprjjVIm/3i9u9vdZ5zXvg2UITNiN5qtetBc7IbmVhbM4lW29/euDJV1K35d4sgiKm4DYKfuahQLO23aZ7O+1f992XAztyh8RHoXHmPqcS3Awt9qJ4HrAYbFBlJXD2zInWTozjh8xK20lwlzcoGKQBJqrUp9Yc2NQzoZeAzl8A6/WnAj06nNIoTKucX5wqhtUVRD4HnSYK3i2RRy4uInV/ND/FAyL0bjimriqft2z3a0bbIxHX3gYcOJqYMF6UXHpTe3+HB5ZAFE/9BzL20vPhuzT6IE17z19RGITFAbY/f7hkmjNJCV8Fxc03LzrVrCiN8kaUU0pvOA0UJDb0zlcJ/e2g2vdbsoFEWs6R1GjO17pJmWsNK+Si/ZPWUmUiuAYd3GGBp9dVGZ5ui09H8ooO8SjWTO7OhWPXudR1fuc7s455HIhA3ig=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(7416014)(23010399003)(376014)(36860700016)(82310400026)(16102099003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cgYIKgQGbiOOBzbO/VUPl4rmdK3SsXEbj+CCPg4Bz1zmVOfbNkEu5wQzmzXhFWsGygHSZ835XJON6a60v9vKw8bRpuxcP6dJiHx39CROfkZM+yfyIuJ5KMGM8k2Gh2oagPC05Fmcu/A2v/yXChrJsisbo19BOHCupbqhULZsqYkOUmYV+tQDLnMjZggRHb9xvpLj85xEQNSfsPUEAGmFdeWt4KX7nQjAgyuVe26adXSOp7ZjjHimRgg+gCi0AGmjXiU8787WQkvJ1IolmGsfnlW+lauSgXs2PWASrlnJQLftDA9wGp0Zmlh0tkqEsjhONXAiNbgh3JngZCb6joHoRu/E+Iv47Ie7edBqL30EN8xSajcoBALp4ESdtsT7CuD0VGXR7L5qf/ILZwgixECJwAYdSll1mrvcEc8g9c6Qi0bISoBGFCtrI1tGxjWAwYid
X-Exchange-RoutingPolicyChecked:
	q5rMNfTQ1TJZat4tYP1ZcwmSUo0iNu+ZPpISQrlZ1aAX2y59VM7z/FG9Sd/ILhuylWzqNItyRXzfwtPkxqxkPCMlkFyABDxwLJg5eiTOGn9mSsF6b9xFzMCRbuJG6mwVNzDMayv+6qaOTxrJPa12BiQu57VYTWPowgE9Qo/L7Mn+MjgdwBpVxGUYPVJGxS98Wh9Y/Id3A+fELMT7PUwo7wyRPquLBWvqkWE7Wt42XQ4rDJVkZ7ceCXLAKxnqFupbLA3ObxnV0xEGrLHDL7MKxbtgRT0C8qVclGtj+/XtDEMKIa6tDfHHRRw3yhUQyjVEz5JheutnMj5qAOY/J+D/rQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:03:23.0062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d050cb6-6a58-4327-d673-08dec7984a92
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB8295
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OCBTYWx0ZWRfX6Ed6jU9CYWtM
 lyHJJOUpq/1dnRgfU/ddO0aLkfQof3QR+cOmRqR8Qf3AXtQtjygFnaDDJJ69vqU9DwsCgSJV0u/
 tPH6MpeRz80bUuwajVrn9A6rmtLNZ0Y=
X-Authority-Analysis: v=2.4 cv=UL7t2ify c=1 sm=1 tr=0 ts=6a2a79df cx=c_pps
 a=H30LXO4bGSsCHJ4yv39IxA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VtmKk1exx5SmULSdvo0A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OCBTYWx0ZWRfX58nuq5Wf30pV
 aAjz07Y1UmsChX6pk4qrAEqGFwGPeDkyhWxHzpnQrFji2dfMvmhni2Xl4KYZuCwTgJeXzAoC+u8
 oVtT3hor8juLneCbDS9EHg2BIpDu4CDSk75zcA5RJc4dzXmT9nzVuPMT+0iRYkEcqpbY08ooFIX
 dcY0hoSMMgMhStLbRZ9KO6PtEFx6APM0nL/NQ86RCDIi9nH52uhgPCtGxl0cuFtF6Wbh/J++SBA
 /GMpa0GxW/C59qtwLxGD2+mRMb3xhURUsmEtMD4oZj43ITNej/phK0hg32Ur5l+PneSBv1H4OfF
 srjy2tQEgmboNohEsfAnJ9TBtxvtvu03SIhm//0VxEIlE8/dJtArKfdgWbLqNnGjm5q0fAlMfB8
 xZ1Rm7oisPLlOn97hiJguli4l9q8CA1ekPIS03A5uTNvAQ/ymj+b9+CP/QYS3HzJOMI/0VkVX6k
 e78we52hIlMRBonY10w==
X-Proofpoint-GUID: m23NUIbY1cJE2dmGVsHqVle_3ZcJ1g15
X-Proofpoint-ORIG-GUID: m23NUIbY1cJE2dmGVsHqVle_3ZcJ1g15
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38317-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,cirrus.com:dkim,vger.kernel.org:from_smtp,cirrus4.onmicrosoft.com:dkim,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:patches@opensource.cirrus.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFE9E6703F3

On Thu, Jun 11, 2026 at 09:20:00AM +0100, Lee Jones wrote:
> On Wed, 27 May 2026, Linus Walleij wrote:
> > -			   gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
> > +			   gpiod_get_value_cansleep(arizona->irq_gpiod)) {
> 
> [Severity: High]
> Does this incorrectly check the logical value of the GPIO instead of the raw
> physical state?
> 
> The legacy gpio_get_value_cansleep() returned the raw physical state of the
> pin. The new gpiod_get_value_cansleep() returns the logical state, which
> incorporates the ACTIVE_LOW flag from the devicetree or software node.
> 
> Because the IRQ trigger flags describe physical voltage transitions, comparing
> these physical flags against a logical value might be incorrect. For example,
> if a user defines irq-gpios with GPIO_ACTIVE_LOW for a falling edge interrupt,
> a physically low line becomes logically 1, causing the polling condition
> !gpiod_get_value_cansleep() to evaluate to 0, which fails to poll when the
> interrupt is active.
> 
> Conversely, when the line is idle, it evaluates to 1, causing the IRQ handler
> to poll infinitely.
> 
> Should this use gpiod_get_raw_value_cansleep() to preserve the original
> physical semantics?

Hmm.. yeah that is a good spot we should probably use the
raw_value version here as we presumably can't trust that the
device trees specify the ACTIVE_LOW/HIGH flags correctly.

> [Severity: High]
> This is a pre-existing issue, but can this loop forever if the GPIO read
> returns a negative error code?
> 
> gpiod_get_value_cansleep() (and its legacy predecessor) can return a negative
> error code (e.g., -EIO) if reading the GPIO state fails over the bus. Since
> negative values are non-zero, this evaluates to true for IRQF_TRIGGER_RISING,
> setting poll = true and causing an infinite loop in the IRQ handler thread if
> the read continues to fail.
> 
> Conversely, for IRQF_TRIGGER_FALLING, !(-EIO) evaluates to false, which
> immediately aborts the poll.
> 
> Could the return value be stored in an integer and explicitly checked for
> negative errors before evaluating it as a boolean?

This is also fair, although given this feature is only really
supporting some quite old things that have been doing this for
ages I would be inclined to not stress too much about this.

Thanks,
Charles

