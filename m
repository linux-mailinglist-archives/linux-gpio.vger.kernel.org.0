Return-Path: <linux-gpio+bounces-21440-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E667CAD708D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 930DE3A16E4
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B2B18C91F;
	Thu, 12 Jun 2025 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qeOcnpaI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QU5JMSyq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B372F432A;
	Thu, 12 Jun 2025 12:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731805; cv=fail; b=UXujrCeu+2t65eddUBQbgjbNfW9MOXi5Ib/MPHUESqbzLKy6wlNDuviZlCKocXMFXl6TYfTN7YRx0Qwk1juO2JnFOefUSaCswhl6Id9DOktz5f9EOzYz10hfRf5KrYxxgRE70E++DVBgFd4e41BO3vXzBMEpTiFVqnlfF1vlJcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731805; c=relaxed/simple;
	bh=reujuBj5SMOqbpdGeClTXfv3hpyrMlX8AFZ6o72R5wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cY9ZFdgOK2gWTefkiZR/E+TgMa4tI/oIzEMLk+sGNjUyrCFIHMvWYrVW26WVMWgraSHZ3j9lkn1v/FPs1pzvbH9YpZa5wXHHwhuykccsFyeKAXv0roecTS3wGZyJmJ9fZ4S92CmOgmLu5UyER+TrZU8MbK0z1L1jFG7mQKCbs4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qeOcnpaI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QU5JMSyq; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4KW0o023474;
	Thu, 12 Jun 2025 07:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=5uX8ZQQCrFCyngnxvk
	vG7nzq/4H/36rEgPRdujBXbAk=; b=qeOcnpaI8ZdXdJ4aT6f5kYRnnvb02lJxEl
	vQ7WK3BTTdv1p/3k2Z9SBJnVZBJBWS+XMyZPWr09iXNyuxCKzrreMR1hhUxCuFJa
	1dnjjATcokNkFIhmNd0nQ1G9FkJZhBvaYPn8wCJTeAnYlvXpt2397t6Y3fUz7311
	uPDfYub8Wl/sTv3KdatB1TVJRAD5Wk++ZxYA5bmiBmqLKsWsuWLXwc80C8m/7AXn
	/qAOvzeoHpLnxCDlp3Mj/IJQQST4rIMC2Mz4FgGVDg494vQGkspXn0SxZT+MkiMM
	tqkbgU5vVNXRx6b+VPwP7O6LodF0ojOk2wXrtwImlDzIp3/ivKkw==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2111.outbound.protection.outlook.com [40.107.212.111])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdbtcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:36:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtCVYzJSBDBtpvE6cgduLrKyLg3RVfWAUfZueTNuHPRDvL2WqkCsco4nhcXiciUW0YGuHHWOP0wVF7F2G/qnsl9dGJo58BPf3CrCCj32rdGIu1HxvAJXjdz6nSUzFkdQ5rhLdkDclaUZtavYAGfhhXpixIwuvsNGeOaMPt8vf95azEb3wcw/1wsOg0c8xDVrLnntebwB3zmsl6MiGrCvNBW0mkCJyT5ausN/L3fjjH/Yly539K+ouuMIeVOJG87HT26/qpYLWb4o249hFCfHgGBpQOm63gsSHESh7v/LoQFK6YE5BGDSg6vC04ue0xmIqUpeYUnsn6tfccny8DtvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uX8ZQQCrFCyngnxvkvG7nzq/4H/36rEgPRdujBXbAk=;
 b=yY+pie4XfWjI+KmphceiCgyhAAHXdD5gPfHm6tyDqq7a2lhoZiYhVbfbKemR234aybP4YYMm2baQDBZEs+ku9qusexIwcN7ue/fq/VX6okZ8IHj9iKuTB13/Y+86MOv10KND9bBOdPBezngbxrDpERN86+caKhKS5Kc5F3lXNFLvs4qmx0fNFx9ve3BoeDzTRIWRGVm9WVvW00WCf9VQ+9l/vr4aa79oaH9Yl096px9QLbsA3eCFH4NL9hs28/6JhgyUWqjjbJyYNv/AveFU4FoEiffBH3a2Lv/4Waw8NpYb4WCTdY4HHjXeXgeF6kKyzTjTEuN7sH09hjJApNmPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uX8ZQQCrFCyngnxvkvG7nzq/4H/36rEgPRdujBXbAk=;
 b=QU5JMSyqjSZ05AboJy89n8L1PuvLYxPlnV29qiHcO2tPMxVwk0QAmS9Q3GAnKnIIKZakS7kHe4c4l8FWtH03knyDHdf1VKyx7v7T57BJCV31Tz3L1ECdnuuhhw4o3k8iVpdCsKs46kEMOoWJpSGeRTO6HV5+p538ezJeGDu4Azs=
Received: from SJ0PR03CA0287.namprd03.prod.outlook.com (2603:10b6:a03:39e::22)
 by DM4PR19MB6511.namprd19.prod.outlook.com (2603:10b6:8:8a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.16; Thu, 12 Jun
 2025 12:36:35 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::ca) by SJ0PR03CA0287.outlook.office365.com
 (2603:10b6:a03:39e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Thu,
 12 Jun 2025 12:36:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.0
 via Frontend Transport; Thu, 12 Jun 2025 12:36:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ABC3F406541;
	Thu, 12 Jun 2025 12:36:32 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9379F82024A;
	Thu, 12 Jun 2025 12:36:32 +0000 (UTC)
Date: Thu, 12 Jun 2025 13:36:31 +0100
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
Message-ID: <aErJz7C7f1iC4Aqm@opensource.cirrus.com>
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-2-2d45c1f92557@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-2-2d45c1f92557@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|DM4PR19MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: d3de17d9-d86c-4e79-e2af-08dda9adc47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|34020700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l5IoSBDBNVRf3TtZL56nupt53tT1sg+L1zwfpLlyrTY2baezBUuX++mFpice?=
 =?us-ascii?Q?11F44bEEunz3Ym1n1B9exFdj39QoZmXXxW+PFTQN9jgkbM0uwhZdZYzx4apY?=
 =?us-ascii?Q?vTEUyvMw1uKcRjG1Q0Emali61zKKi0PzthuTgZ+9aOcG5yw20gwRpXndnqkY?=
 =?us-ascii?Q?8H+vxh3VTIJm9v3xBeOLRRlYKKvN16SBzHkr0I2iesqr8lqnhrcYP15FNdS+?=
 =?us-ascii?Q?GDH69+vtq4Z8VuR/Ykatc6s6Ievm8x/tY4amGxyQLnL9f6miBs/RUlhBdyHV?=
 =?us-ascii?Q?aDI4zXmWhoIEYcNZPTdwhe4IuCPVzXyJohu3JR2/AN31kPA/lssOrm4schrv?=
 =?us-ascii?Q?Cus/r2LhCYujNVEf9JTCTFcKMDeWL+XumaNE1akVAm8am0W71jZ3vF9lJvLS?=
 =?us-ascii?Q?Ypa6MacmZFZN7fQYDoKkrxs7W2AWMaiGv3l4Bxfu0XAkJJeAUPd880FE+s3R?=
 =?us-ascii?Q?8jrfyoEEY6Ne2ktiDYKX7NlsudGlDl8ThuQkkHnJnIUlkf34zjZPLnIsLrtS?=
 =?us-ascii?Q?JaxoO0jgvQy1gfSwIjeh6vs1HWWp/W7OFMRQ5/BS65qH2Duvd9bht8DbfpKQ?=
 =?us-ascii?Q?kYmHCjN9vvplAGNgTaClbqJ4DeWo3To6XcAbaGo2KNjtBs/O65Fq8xq6Tkjg?=
 =?us-ascii?Q?JLsZKRdSCpQGyQqXAUDrkp/zwzCDtgw1Vw8oQD6ytZ3Dk9eI15jnWGw6/mcp?=
 =?us-ascii?Q?W9SorGTPfI44Z6QgE5YON8VMitxefiT+W9w5VZYIrjC8fd5miOcA0TfKKZUT?=
 =?us-ascii?Q?te9LhAP34/ieIIuGMRZZlLPVc6PKQzdNWF7K9GGot0BLHeZrdD4osRTeKQAE?=
 =?us-ascii?Q?lVUIGmBML19aUlLgtMWHXy4hBZ1jR31QIu2+DPkPkam4jDDfKVRXoGOhZHaJ?=
 =?us-ascii?Q?FxWbYV724CNIVrK36Ou+cvOnvmE0GBDMtLlVIAv9RuMdWaAANq32BnKAK9Kd?=
 =?us-ascii?Q?n8z4IgZCEqhktX+G16C23ALeKeobGTLoewrnIfrKsYhH1JSfcgyKxC93cEGz?=
 =?us-ascii?Q?n/2UKM//WcqXORx++qtnGHPoi5kxB8s+iRc1cW9lcga3b3tHvaAdGNzmM9xb?=
 =?us-ascii?Q?MVe+WRzYYGJfbqCBYBlPw4BSBdOzi/WWIw90IkOB5p7rjtzYQ9HpG9ut3hHj?=
 =?us-ascii?Q?wYKWpYTM3+l+12AkBzzrEziYNo2ETw2DYHDQ4xVKAzRR/lSzBxgTUm2MO4aF?=
 =?us-ascii?Q?XkSD/5ZcHHNPUgxwEl6ZNGyaUAkJen8ag0Yn5jZiVYy/ciUEgRdbTAzZgpXV?=
 =?us-ascii?Q?H8RbW0ukpN1lYUQdYu8AI/dFgX03/b5lDRduuSEo3X07onKfKmoD8aNkSuY/?=
 =?us-ascii?Q?KqRidV4TPG/jXOi35RqWV9QEVoZuZZMgrZSQODGV/rXAjrr7OPT9SL8e2940?=
 =?us-ascii?Q?fhvliBp1IBsHdCwh+N3ULEUULB2t0opJ1/KjpmBNCwvj5vKqkC7oFgD2U1a3?=
 =?us-ascii?Q?F2M8DdUXoKU3Gkaxm78LECya4qUruRXTDsWoQUlnZEOJ18OEDqwnZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(34020700016)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:36:34.4111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3de17d9-d86c-4e79-e2af-08dda9adc47c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6511
X-Proofpoint-GUID: AfXnyhrWuwys0kcOS2B2_N2q0L5vco3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5NiBTYWx0ZWRfX822w/7cn+Zv2 QCi0Hq6unC6y2zRoxe3rjzhbEVS7vmVJSAYtzzS51/AzVoRCwUM0s0QCvqYvrANDX3dzHfzANHg F6EZCe7G78cxCCaE21rvBABmDQsUessOLBDOexYuls1P/tS0cLmkgBGpm+zY8zxZINS+YuL3AuY
 lX4tpRRyWaaWLbqVnfnbwDpKn4F1w3VZCEv2JRQU0LYdCLkm1kuJKeWlqDFZ6DcfSh+kJPgEWVq A8m7H8Rxhr7pGziAKa6dh3ihkTh6iP+k4f0Gbx1cfYipcOMvPzTN8RQdokLNiWvMUaMHHWZ3Suv sc3/oY3JhPA0QnOEnLKcCzRD0IMnC1JJ/zCEdND/39kty/LrpXIsSui/iA40CCwFwuThWKY/iF6
 QdbRq4RA+NpEHCt6X5T5zazoyIKbx599GCz2ZKULE4l+qAG+15GxgO5fQDm/5mRA5cWqJaBt
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684ac9d7 cx=c_pps a=DUefcnIPdq0KHlc9UOEoeA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=aChJ_wylqbG-PFo4NTEA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AfXnyhrWuwys0kcOS2B2_N2q0L5vco3L
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 12, 2025 at 02:19:54PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> +static int cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset,
> +			    int value)
>  {
>  	struct cs42l43_pin *priv = gpiochip_get_data(chip);
>  	unsigned int shift = offset + CS42L43_GPIO1_LVL_SHIFT;
> @@ -493,23 +494,27 @@ static void cs42l43_gpio_set(struct gpio_chip *chip, unsigned int offset, int va
>  		offset + 1, str_high_low(value));
>  
>  	ret = pm_runtime_resume_and_get(priv->dev);
> -	if (ret) {
> -		dev_err(priv->dev, "Failed to resume for set: %d\n", ret);
> -		return;
> -	}
> +	if (ret)
> +		return ret;

Is there a reason to lose the error message here? Always nice to
know which of the two paths failed when things go bad.

Thanks,
Charles
>  
>  	ret = regmap_update_bits(priv->regmap, CS42L43_GPIO_CTRL1,
>  				 BIT(shift), value << shift);
>  	if (ret)
> -		dev_err(priv->dev, "Failed to set gpio%d: %d\n", offset + 1, ret);
> +		return ret;
>  
>  	pm_runtime_put(priv->dev);
> +
> +	return 0;
>  }

