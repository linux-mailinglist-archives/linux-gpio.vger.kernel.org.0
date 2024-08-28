Return-Path: <linux-gpio+bounces-9283-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CBE962D55
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 18:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05A9C1C20E19
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 16:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563861A3BDE;
	Wed, 28 Aug 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OmFhCKcD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EDA1A38CE;
	Wed, 28 Aug 2024 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724861480; cv=none; b=WaqPQ2ZkwQp+QnmxRbCw3vd5pD/bYBklaCHRxrme1eDXSynJr6dcq+/1gtPvnZLVnr/8j8HkdcgOF9+sjtQIMdnhlUtF4QuL0E1GPOrfyyJxZNgxTCLlsgd5dwQiPdY1nX1IiStIoHyEkzcl9UEgnN1iWzcn8BLJbIBf8AV9p1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724861480; c=relaxed/simple;
	bh=Zbmal+2mF51IQI1fwlMilHXGLGrm5KE6MZAEPnc2M7s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYSi5yT47ojkm0WLduoAOVnHp68Sv4/JOdp5H/JysHTYBThnitiXYW1tPkgOFQMykSiE17ZMo0hCrfGnrQXoCfmxRy2qR6MtwwxCgh0rgWnjCUEbJpBFQgEZxSWt0FtkP4O+ucNhEI+EtXcozdSpxpiOAjFwJkM2zLSbKbVA6A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OmFhCKcD; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SEIXHD003698;
	Wed, 28 Aug 2024 11:11:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=tgSo/BhDlyBHAY9S7i
	VFFPRb0AmymEAZuiIy2mOqR7w=; b=OmFhCKcDWwMqTue+kH/aAd0oDFB241vfu7
	UkZ+Yx+Qs37nW/1YGN1xeYHfUDYZCAxNrM0t4WuydzMuJMNRwUKbzvoFZzR0cjeR
	0hhsoGrccuk8Mv3slVxoJ20PRfZJlB6WXa2o96V3eJ4lvelSsDtPOIP36cj1rF2F
	E4/RJzuuFVko8xFoTsSK1XJSuMNSZmK56CvDGF1BvUXAD3maYxfEDtPdkIUeZtL+
	7b3SM8SbAOz6V2DQGXCMQ8qHy1BoOhOQ6/l5dU59oC6cVQUhBJVG7v3ITTIdPQ3J
	qPhvvxnthDGThVV8fkfc6KEbScU2F8NqAoepjj5GDAAaPQiJ7CBA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 419puw10qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 11:11:13 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 17:11:12 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 28 Aug 2024 17:11:12 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id EA5E3820244;
	Wed, 28 Aug 2024 16:11:11 +0000 (UTC)
Date: Wed, 28 Aug 2024 17:11:10 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Yan Zhen <yanzhen@vivo.com>,
        <linus.walleij@linaro.org>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <opensource.kernel@vivo.com>
Subject: Re: [PATCH v1] cirrus: Simplify with dev_err_probe()
Message-ID: <Zs9MHv+ljZUMfTqj@opensource.cirrus.com>
References: <20240828120118.1284420-1-yanzhen@vivo.com>
 <Zs8XlyXw421hHjM/@opensource.cirrus.com>
 <8734mod7qi.ffs@tglx>
 <9b5a3025-3e78-44b9-98f5-c945a6ac48d7@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <9b5a3025-3e78-44b9-98f5-c945a6ac48d7@opensource.cirrus.com>
X-Proofpoint-GUID: mrkUOa25MLT7NtseVb9IZkBapcu6plf3
X-Proofpoint-ORIG-GUID: mrkUOa25MLT7NtseVb9IZkBapcu6plf3
X-Proofpoint-Spam-Reason: safe

On Wed, Aug 28, 2024 at 03:59:50PM +0100, Richard Fitzgerald wrote:
> On 28/08/2024 15:47, Thomas Gleixner wrote:
> > On Wed, Aug 28 2024 at 13:27, Charles Keepax wrote:
> > > On Wed, Aug 28, 2024 at 08:01:18PM +0800, Yan Zhen wrote:
> > > > @@ -1064,10 +1064,9 @@ static int madera_pin_probe(struct platform_device *pdev)
> > > >   		ret = pinctrl_register_mappings(pdata->gpio_configs,
> > > >   						pdata->n_gpio_configs);
> > > >   		if (ret) {
> > > > -			dev_err(priv->dev,
> > > > -				"Failed to register pdata mappings (%d)\n",
> > > > -				ret);
> > > > -			return ret;
> > > > +			return dev_err_probe(priv->dev, ret,
> > > > +						"Failed to register pdata mappings (%d)\n",
> > > > +						ret);
> > > >   		}
> > > 
> > > Since we are doing a respin anyway also the brackets on the if
> > > should be dropped on both of these as well.
> > 
> > No. https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules
> > 
> 
> https://www.kernel.org/doc/html/latest/process/coding-style.html#codingstyle
> 
> does not say that. It says:
> 
> "Do not unnecessarily use braces where a single statement will do."
> 
> Note: single statement, not single line.
> 
> coding-style.rst is the coding style. If you disagree with the coding
> style, send a patch to change coding-style.rst.
> 

I mean certainly having two documents with apparently conflicting
guidelines for the coding style is not a helpful situation at
all. I would definitely second the call for patching the
coding-style doc to be more explicit there.

And to be clear I really don't care if we keep the brackets or
not, was just trying to follow what I thought was the coding style
guidance.

Thanks,
Charles

