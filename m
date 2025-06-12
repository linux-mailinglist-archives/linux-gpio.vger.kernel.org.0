Return-Path: <linux-gpio+bounces-21439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A62AD7086
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BDE93A531E
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 12:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FBA2F430C;
	Thu, 12 Jun 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XJ2lS4uF";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="DzR26ixm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4698D2F432A;
	Thu, 12 Jun 2025 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731688; cv=fail; b=llDxB91nB25UVHDqFQJr9kdkZ94HOaYLBacMgPYulnVu27xuIEzNyQiwZHmKw5IypuyqFFARVoasAu7Ay31GmircmEGnW6IgnsEwkjOmJq6JqeQNjio1W1HNgNRnDuYCEbi84GepHSr9dKAXMcYpEyNo3foYW3d2OX6Y33wb6VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731688; c=relaxed/simple;
	bh=k75MGWlpYuMQf3I/CW0r6dKXnL7VRnt9fCUr8D/sNnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUl0AAdds/wRI9Q6ZtSF1Mp4TZimLhHkst5biTRfc/kstzU3+0sJS1jAaVz0qVYiAqJOD154BAhFQLCYyHBdD/8NWa9xCCEh5LeLHPGkLcBTk0gxed+5OQVPCb0mzz4/oTd+ZBeT+0VIZb4VjmPbmZ152y4vxQYEyVqvx/o/w6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XJ2lS4uF; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=DzR26ixm; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C4KW0g023474;
	Thu, 12 Jun 2025 07:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=H6xeK7zy9e02QkEoLC
	aUIAvt0EmADmU+Tt4tMINzLiA=; b=XJ2lS4uFH5xibr15LBs2AZiFHXn8XcXA7q
	TuFr1zYdKHqE4zgXZOtyI2XIVlRYS8ybWd4lWvqyKZEe3IbB0BTECKDmUEkDYlmx
	Gm4oLIsEO0j7uvHVcfDeFTVG2WkajrVtUrp5K2lvKOhXFFFW0UM+9iRAht9JdtCh
	PAnuqSHk5Rp5GV6He1/uKuNpaOWmjVsm51fS7jdWsPtbE7XYmel4F8prSQ1YSgfq
	e3UzuTc1DBGfyojubGz2SLrPrixTE75bhQ2DR+XrglVhcBQC1nXTHK9277ZLv0rJ
	pIv+FkeDRR1GR6PUx2OgvSzNbY5MG1WrX4+0sFfGQay5/AMpMVrQ==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2119.outbound.protection.outlook.com [40.107.95.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdbtaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 07:34:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CL74T8425fP4cZxDpL7Trvfpel8fo3fzVx2RAsgz12RxiG0U5+5xeHYNKtniBj1WVJTLmzmaUxkIE3TAcBLEZGLcBA6y4bNAPSgpi3D31ycQPwCK9mAGJsTORhSmio4cbU122RwCQdwrT2xhBKBsOeFKvUlwN3Vjxwp+50w0RxsXogS2gFpWsRCHCl2ePZF6znpIOVdk/fXkx11l9SbsRcN8UMAfX1pZYsPw8gzXwtuiI0eiyjTcKhrCMw7TVhH4Cp97hQcMtpIpHnrlKV8jWgtaVxxge/M0TdUHWELzfTrRd5gxye0nJkQCG7/hZg7qFkk37mEA0Sqnq9gHaYIzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6xeK7zy9e02QkEoLCaUIAvt0EmADmU+Tt4tMINzLiA=;
 b=ZjvxVVgxhGJDwminBn2ObwMFfK/U5eeOp/RFMBkyS75MkQGiEnlbrtqe42cX0ExQD9n7fgcXaMvcWsdjFgUR5/DVUx77CJM52Ccf23cckoiiUgoTICWz3QP3T/qSjUt8Lottb+Xz9EKWJkR06hfGvdXk7hgwrm5CDc7N+Qe8uV62RFZyTVlZneX8cQprGkqRMVEsqd4/VUdGF3k8qJE+FGFd11GJQP7E0CCJ2FWLDETKGKoyOHme8L/eCzPukyoX0jz72DNHPVjqjI3FLimzLnFdb6RWRiixt7+5Zv/CZUvhivm6pLTNIK7Xfbx7iB+xAk2x1hKPfFS6mhSTKBuTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=bgdev.pl smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6xeK7zy9e02QkEoLCaUIAvt0EmADmU+Tt4tMINzLiA=;
 b=DzR26ixmORQ3R7YnZRuaLbhTb3UPP8X8n2WR8Zgspg2GWuvC6HzlFJyPs3xzDh1r6D5UhMLbyO4ZcTwcJzQGymNLxB32uW65gtEnRxoLpqXxNq7+aSowdXq7mLTO1DHab7XnvTulmd+qii6Zm182OpYVQjI0QcHDlMNQZ2hVYis=
Received: from BN9PR03CA0687.namprd03.prod.outlook.com (2603:10b6:408:10e::32)
 by CO1PR19MB4839.namprd19.prod.outlook.com (2603:10b6:303:f4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.17; Thu, 12 Jun
 2025 12:34:40 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:10e:cafe::54) by BN9PR03CA0687.outlook.office365.com
 (2603:10b6:408:10e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Thu,
 12 Jun 2025 12:34:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.0
 via Frontend Transport; Thu, 12 Jun 2025 12:34:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 88D04406541;
	Thu, 12 Jun 2025 12:34:38 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6FB4D82024A;
	Thu, 12 Jun 2025 12:34:38 +0000 (UTC)
Date: Thu, 12 Jun 2025 13:34:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: cirrus: lochnagar: use new GPIO line value
 setter callbacks
Message-ID: <aErJXcDTEytpRY6z@opensource.cirrus.com>
References: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-0-2d45c1f92557@linaro.org>
 <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-1-2d45c1f92557@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-cirrus-v1-1-2d45c1f92557@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|CO1PR19MB4839:EE_
X-MS-Office365-Filtering-Correlation-Id: f314da91-85a6-425d-6ae7-08dda9ad7fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|34020700016|36860700013|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JuAK3+yp6tCAasnnl6UPvgoaMNKTcqgfy4R7EC7d534nMdJZJogzlvqqEXR1?=
 =?us-ascii?Q?6SVjBW6vQs/xiTci0BUrXyN23KKmL98ananA94MEc/wfDcbcprIFlqVKcK+M?=
 =?us-ascii?Q?coE5IQFx4GsBySGr32V9j89gO2XBnNTGLsAT//Ob8eFe8Bwhe8n9VmI521sv?=
 =?us-ascii?Q?o8HsdegvbguZw//GOHmJUx3GGA1Zx2hrWhLBL5OIXlIpgnndWZuZMk5yt310?=
 =?us-ascii?Q?2qvZi89B8dPvGo7t7ghY+TmkE2Eq0twajom9W85zYU/Ip8mO/B8B/TsE2GxJ?=
 =?us-ascii?Q?rB37nW3PYZNq7dBjmCH5l1JrkoWgoFAPjOemS5E7rTUazct0sUUxMGTNJI1/?=
 =?us-ascii?Q?m6o7Ht8dm761Zu+/rl4NcwoGgsWxxKttNwSrnBwX1NAAG2pPFV/EnjQ6aVwK?=
 =?us-ascii?Q?4UzFJANfxMpTHGI/JsUE0H9mN1jCWlLEYtL2VKRrAtJ4YjaQy9R7PqCu1Zlm?=
 =?us-ascii?Q?CJOS0ZDUgnQUDRvFkdTsFjXV+aqNEk+PHMpDsiZDIq93LfVpT1CR6896RHLx?=
 =?us-ascii?Q?Si6COCImy1U8ETQrT7alAiCVZ8MCtrHRJfyAK2zPtMcv1RnFq9u1q4zHXbwz?=
 =?us-ascii?Q?YZb8Zda6cEnyUzoagh/jPZkvSgww3LlTHerAaa2qjhauiYf9F77eakepOSgX?=
 =?us-ascii?Q?D5Q8vKj+vNYY2l3G8KpkCn8SZWkmpCpP57zi7vLPqLDSjQkNeOaZbzf955nq?=
 =?us-ascii?Q?b3PfDOi8p5zHS+9ltVSKnliaQWYj8Pw2yBZ0kpaGEmkRAn+b9E26bRr2XY1/?=
 =?us-ascii?Q?JmW0ErXeRNCu1tynb+ZPUAulPc2PbMjJz2u/6v1CLdkwmjqkxUoNW9+d1DpB?=
 =?us-ascii?Q?XUES9bAvrb7nvMbIRPiJmnOdN4kPBsVNpbOsB2k929dpa0VNZyZZfNtCLeMn?=
 =?us-ascii?Q?3uOqtcactopPME5h81rAgosKfiepPnVDhZylm0US1lJ0h5cGCzy0o4DAPfg4?=
 =?us-ascii?Q?ddDQIjPpbW8J9H7NUs9vuAKWzQl5+rVMjbFTRYn1dBsrI7ntxr1ysQybbrdR?=
 =?us-ascii?Q?6iNkPOCena4CryKiyUQghMe2aQ0JS0HkMzz1AtskcLTHqoT7bEc2gCF63DXl?=
 =?us-ascii?Q?u6mCzqLYz1PcRBF7kmOnihgPMgqZc+5DZ+vusYR32GJwvzkqouHKMLTALGop?=
 =?us-ascii?Q?gdBgdJy6BLTU27zKPy/MwEi/SkALWrVsJh4yCvQKyJge6Qw1lYec73Lo2lWH?=
 =?us-ascii?Q?qwqqb9ReHmLMa8nIqFYZmauocCaj39suJPZ1DZzv7hfg3vmA9itnKNr3OA5Y?=
 =?us-ascii?Q?JTYPbtwnSnnF9igmPfhT4+mb8g/9z1Gd+2/cLggFwy2rbeDRr+Xp0m1aBDas?=
 =?us-ascii?Q?M5/hm2O9RH0i/79kP5w4pGzRNwNbVzMHaWoGi9vHvfzjmi645kEJOHDQEofz?=
 =?us-ascii?Q?taKhWENGIBAzQQBn9q7qA6SHyqaPIIhAuged9yNGoCdkkMmNvxL0lSrd9TXv?=
 =?us-ascii?Q?RmDMvNSDmbiyK+BNSZ5//CCE80ByiJVCLgcQPD71GzglPUaqDDCSkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(36860700013)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:34:39.3653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f314da91-85a6-425d-6ae7-08dda9ad7fd8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR19MB4839
X-Proofpoint-GUID: FfH2jYNrtTde5-ijfBdnH7uzA9SPfPkb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA5NiBTYWx0ZWRfX4qVQc7zIQYpE A6TnOtCduWzC+Vtdg7yI1LgO7RRxNez07l/1MAHniDBsQR5MXZ1Rfh2I20iOpmrPlhQjqv+Zs5/ Hw7K90KitaBV6UdRBhQzpNuTemxOy+8bXAp9nJNcPTHnJ9wuZooj8jJ0/12COK0wuP49CxwYOCd
 A387XNgTffB4dvG+EtHoGC2BYkJgmFXoydz6cwZ6vCfsjiLqF8gvQwrCj6mqCg7ZPENI11ZUgbO a90BhfgzWQDvDPz+tJIl7IwS+kHS2oQqj2G89ybd+Hwb968shROv28c7HWht3IO8OLgQraJoRWr T9sPvposjRo0tAZpHUQ5mnMVAQ5v9rvKOxJkVvYXejZU6OdM1izYdxjZ70y6zRwoH/nerZjoUag
 zuxIw/Zqhm4Yy0lnHfakeno4U9fXsYCWxnfsSUFfgAWHxhA7nnL1fyA5p+yXXd9C12FzNCeN
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684ac963 cx=c_pps a=mzhS+1dRqcORwe6tWL/UdA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=IHiEukr3ZQpEQQ-4GLUA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FfH2jYNrtTde5-ijfBdnH7uzA9SPfPkb
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 12, 2025 at 02:19:53PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> @@ -1075,29 +1074,31 @@ static void lochnagar_gpio_set(struct gpio_chip *chip,
>  	case LN_PTYPE_MUX:
>  		value |= LN2_OP_GPIO;
>  
> -		ret = lochnagar_pin_set_mux(priv, pin, value);
> +		return lochnagar_pin_set_mux(priv, pin, value);
>  		break;
>  	case LN_PTYPE_GPIO:
>  		if (pin->invert)
>  			value = !value;
>  
> -		ret = regmap_update_bits(lochnagar->regmap, pin->reg,
> -					 BIT(pin->shift), value << pin->shift);
> +		return regmap_update_bits(lochnagar->regmap, pin->reg,
> +					  BIT(pin->shift),
> +					  value << pin->shift);
>  		break;
>  	default:
> -		ret = -EINVAL;
>  		break;
>  	}
>  
> -	if (ret < 0)
> -		dev_err(chip->parent, "Failed to set %s value: %d\n",
> -			pin->name, ret);
> +	return -EINVAL;

Nit: I would be tempted just to move this return up into the
default case, the other two cases return so its slightly more
symmetical that way. But I don't feel super strongly:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

