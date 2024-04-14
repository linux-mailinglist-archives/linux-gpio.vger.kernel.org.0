Return-Path: <linux-gpio+bounces-5478-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D68A41D6
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Apr 2024 12:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 606CA281B78
	for <lists+linux-gpio@lfdr.de>; Sun, 14 Apr 2024 10:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5C62BCF9;
	Sun, 14 Apr 2024 10:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TbVAWPZW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01BB1BF37
	for <linux-gpio@vger.kernel.org>; Sun, 14 Apr 2024 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713090900; cv=none; b=YsHd4we4T7hnSTq1D1Nybg8vhUmMZ7eys8Y6uRwxTRWcRcOTlhjlFyttDl95w5RNMjp8H7ozigA7DxpgW+/kNWaBKH+1dMHDimFP53Hy6alforRkXza2tPkHlMH3ho8Q5GOXfxeCokgRjPh3aSFa5X0xkSJG3xYDl7bFuro2gc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713090900; c=relaxed/simple;
	bh=ZN/2Rkys9GxS+NsmV9Oq0Mou1cdT+ldCxQlnc+6y1vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GREboflD4fxWBG2o+ukbpJk20bvF5xt7xaUDTeyy3yC4xFGmpyUNqQHD6lL3NvMxtZp3kPYJ5r0UX09PtiG4SHBQ+6f+SoMkimHvjNEBIW4Rk0LdEBfCCzk2DXnqYDmaWfTFPZoEgkch8OuehGjJpIAX1SzRy8roQnynQcC5PXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TbVAWPZW; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso1637690e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 14 Apr 2024 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713090897; x=1713695697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3UQ++gxwD9lwMiCPaVI4itHAEaPjf5P2ziIdw7YNOfg=;
        b=TbVAWPZW99jP3BcNiP677lo1DMX1oAodpK5mNVpNgxzWVzIUrMLna3n4c6jHBjNjRU
         Q8M1errvEFlQHPBG4TBwM/aFv0uElPUC50G1OqrIOnWy74ueKkquWYSgHtqFi7EGi0m8
         Ju4nTuWqKjVgPu3FCFOl4QoHxL0qLt4rYferqAtydtyc+0i+ztZwklrstSOcG910W2x0
         CDbkxRhtIbVNNxhcX5XbXndb/VZkAJtqChDA+3yltDkGtSrEZB+rq2WGW9VHvd5LBIpA
         Vj4E7wQBUqERVFfqTLgbJHUpwnVh5MDk8XCSyK4jTClY9sA1xQo3GeRqFxNAZ6Lken/r
         w/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713090897; x=1713695697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UQ++gxwD9lwMiCPaVI4itHAEaPjf5P2ziIdw7YNOfg=;
        b=DQ7leyYjOmDOsruFde85zOSMzEgg5J9UeoCLQRGs98/69UaUJZE8OSpWFuWpJKZfQx
         WLaTiW5u+52equsnMhOsSUaeFPQ7j7tedJt6s1fkbqD1Eb0ZzyQ1AoQwpSScL4/IWOlj
         tv/JNw9g042IXvvtR8tKyt6pW3Xt5BLF3jVwRNu8RuFZBotf2mkA+itlH/GWqZzDutyr
         B/pkuF9/pNVUdfHwghd9qNwSgn4kRv6ETdRiM2yJKPn37EHKRtwzIk9pBcVpJaBKKacu
         DkYhYCdq4lIyuolHVseiNF2QTW9P68j2xzhosdv8fDjz2xpzcR7bqchgAmvlf2siSXQn
         F2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXZu7mxWNW1SMjE29fhf5kFifvW5Wc/DTFNOuXRCGLksI7d+QmXtoZKUiMmBC69orkOa4n4ceioRdEryp2TvKc1LhaCx4FYGFVSBw==
X-Gm-Message-State: AOJu0YwBUSFJgJgWt5EtLCnuvOaqu7UWEfdtiyzOqly8LRLsixuu+RcE
	Owvk19hqXTJPa5E994rVJPlekx0vE1J54FTNhkOcDiCwJ8p6g4fG0TrEsIrIz9k=
X-Google-Smtp-Source: AGHT+IHRRIhsXhtPQpbnXWRN/evFQ9xpq1CsTuwyuPbVM1PmrjssVucapgd3lt6ANs4aSbJrf6z1aQ==
X-Received: by 2002:ac2:53b3:0:b0:518:c2a5:5a3b with SMTP id j19-20020ac253b3000000b00518c2a55a3bmr1372919lfh.46.1713090896785;
        Sun, 14 Apr 2024 03:34:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ne33-20020a1709077ba100b00a51b26ba6c5sm4032596ejc.219.2024.04.14.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 03:34:56 -0700 (PDT)
Date: Sun, 14 Apr 2024 13:34:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Robert Marko <robimarko@gmail.com>
Cc: Hanna Hawa <hhhawa@amazon.com>, andriy.shevchenko@linux.intel.com,
	wsa@kernel.org, linus.walleij@linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
	talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
	farbere@amazon.com, itamark@amazon.com
Subject: Re: [PATCH v5 2/2] i2c: Set i2c pinctrl recovery info from it's
 device pinctrl
Message-ID: <ac51854b-09a6-4b79-b409-b950929655cb@moroto.mountain>
References: <20221228164813.67964-1-hhhawa@amazon.com>
 <20221228164813.67964-3-hhhawa@amazon.com>
 <416340b6-33a9-4b9e-bdc5-c5a9cffb3055@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <416340b6-33a9-4b9e-bdc5-c5a9cffb3055@gmail.com>

On Thu, Apr 11, 2024 at 07:08:56PM +0200, Robert Marko wrote:
> 
> On 28. 12. 2022. 17:48, Hanna Hawa wrote:
> > Currently the i2c subsystem rely on the controller device tree to
> > initialize the pinctrl recovery information, part of the drivers does
> > not set this field (rinfo->pinctrl), for example i2c DesignWare driver.
> > 
> > The pins information is saved part of the device structure before probe
> > and it's done on pinctrl_bind_pins().
> > 
> > Make the i2c init recovery to get the device pins if it's not
> > initialized by the driver from the device pins.
> > 
> > Signed-off-by: Hanna Hawa <hhhawa@amazon.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >   drivers/i2c/i2c-core-base.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index 7539b0740351..fb5644457452 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -34,6 +34,7 @@
> >   #include <linux/of.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/pinctrl/consumer.h>
> > +#include <linux/pinctrl/devinfo.h>
> >   #include <linux/pm_domain.h>
> >   #include <linux/pm_runtime.h>
> >   #include <linux/pm_wakeirq.h>
> > @@ -282,7 +283,9 @@ static void i2c_gpio_init_pinctrl_recovery(struct i2c_adapter *adap)
> >   {
> >   	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> >   	struct device *dev = &adap->dev;
> > -	struct pinctrl *p = bri->pinctrl;
> > +	struct pinctrl *p = bri->pinctrl ?: dev_pinctrl(dev->parent);
> > +
> > +	bri->pinctrl = p;
> 
> Hi Hanna,
> I know this has already been merged, but setting bri->pinctrl breaks PXA
> recovery.

This is patch is a year and half old so it's a bit late to just revert
it...

What does "breaks" mean in this context?  Is there a NULL dereference?
Do you have a stack trace?  It's really hard to get inspired to look at
the code when the bug report is so vague...

regards,
dan carpenter

