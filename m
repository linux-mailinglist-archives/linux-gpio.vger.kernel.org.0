Return-Path: <linux-gpio+bounces-9274-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2480F962AAE
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 16:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5732E1C20E65
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Aug 2024 14:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36675199FCE;
	Wed, 28 Aug 2024 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3FRPVQzZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G0t9IWOb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5526D175D28;
	Wed, 28 Aug 2024 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724856474; cv=none; b=qKwusHKkEdbXmYQMp9QjgKy7z3f0OSyZkJhTkjIEpU7/UUERDkTJWZ4xB5mhGueAkffAiNl3GSaqwNY5RmdHEQKkuFRoSD5IbS+KR84EqlmAQ32aa4+NwPpe39FPlEE0aI1+C1gjhkWNfNKesXcwDMSpI0ZEBjy63KEHpkdmhvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724856474; c=relaxed/simple;
	bh=2tMUqOqrrEkwzVmxxpJ+Dmek/jkAMerD513EhspTF2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gI+DIJf9zzIZugbJ0+KFq2hSVK63Epn+IbKQ2/E3eIz+LfDh1+0gMSXmj6dNvH6BH48dkOGB9km9jI7P3HBTf+mqPbSVef8FnjIH/zzW/NPTzfwxHVSzB53y8RXoKM0gU/s0FpuLqRBSUzqP/f9Vfy1dZ6tlnIG0CgA7veiYD4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3FRPVQzZ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G0t9IWOb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724856470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9uP0I5vD20Gj8As4in+QMNQnjRL6lX4vM3MMuR8AoU=;
	b=3FRPVQzZ1OYImu76RYi7QYL6vC1x8PBroQtvbnObpfIOm0qM7WVpCKBTaB2FInD9TJtMNW
	7DBDk5HcGal+rEfrV+uN7YVzVJK7zSNWt32HnjD/Ovq3pfJ4txF40DM/O6ixnAwPJ9qhyh
	BoA/vOBCH1Kwxh4bnt2U3g0gtpCb04VcaSOxOQuzNikfhDT64cm5UYt6vpGjDvqnwNSrBW
	FcCPhoDKpu4qjpKpi8CtvFMGXc4TXnXtQFgTTaKgD78m9mx289mRb6hzgopOKUx2za8Sgn
	eJjXXihH2c/nNBYvl9reaeIt+gVWcHKKcRm25qRGV+X5ifM7F4YpKHrrIQL/IQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724856470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/9uP0I5vD20Gj8As4in+QMNQnjRL6lX4vM3MMuR8AoU=;
	b=G0t9IWOb5iKouBEHcNkMY90KGfNpVdYNKghzsC/atjsRAw3UFd1oHOIzTook5b+jU3pNrf
	HUb2Ig2seXUeHCDw==
To: Charles Keepax <ckeepax@opensource.cirrus.com>, Yan Zhen <yanzhen@vivo.com>
Cc: rf@opensource.cirrus.com, linus.walleij@linaro.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [PATCH v1] cirrus: Simplify with dev_err_probe()
In-Reply-To: <Zs8XlyXw421hHjM/@opensource.cirrus.com>
References: <20240828120118.1284420-1-yanzhen@vivo.com>
 <Zs8XlyXw421hHjM/@opensource.cirrus.com>
Date: Wed, 28 Aug 2024 16:47:49 +0200
Message-ID: <8734mod7qi.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Aug 28 2024 at 13:27, Charles Keepax wrote:
> On Wed, Aug 28, 2024 at 08:01:18PM +0800, Yan Zhen wrote:
>> @@ -1064,10 +1064,9 @@ static int madera_pin_probe(struct platform_device *pdev)
>>  		ret = pinctrl_register_mappings(pdata->gpio_configs,
>>  						pdata->n_gpio_configs);
>>  		if (ret) {
>> -			dev_err(priv->dev,
>> -				"Failed to register pdata mappings (%d)\n",
>> -				ret);
>> -			return ret;
>> +			return dev_err_probe(priv->dev, ret,
>> +						"Failed to register pdata mappings (%d)\n",
>> +						ret);
>>  		}
>
> Since we are doing a respin anyway also the brackets on the if
> should be dropped on both of these as well.

No. https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules

Thanks,

        tglx

