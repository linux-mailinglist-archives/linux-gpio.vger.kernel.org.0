Return-Path: <linux-gpio+bounces-4756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E5788FD1B
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 11:32:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C21731C2B2AE
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Mar 2024 10:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45AF7D088;
	Thu, 28 Mar 2024 10:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gS2ORqsJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0987BB01
	for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 10:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711621961; cv=none; b=agrtXDm0r4JcWVLTd+CMl+KsfythzDj16Sen7zsDEE+bSsELnRaoOHKEQkRQbHqHdfrt/2ql9JSMcaPuHbQufMYUNvZL3fVpVb4jzhDfsoXPjiullLxHozvJBBby/Sa4EZ5eWMeeD9J5s3NDxvAb8vdhH6rgPfXkyqb2wNqQNzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711621961; c=relaxed/simple;
	bh=EZ3n+V0QBAi/57I3TL1yZtFThV8d9Nr5Duuzt9FivF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAh8BqT0jzldUw9uKNPKKgwXBHexpALeIQKzxtA+GhfozNgW69ZHPXljc2PTysiOCoGj2DgMDhjwKYo5SPA84S54SAIOFHc1vfxGSDvwTjwOC7SXl+MREwH6fZ2a/8KV3vOwuXVa0l8/bt/31WjyqOh2bKL91MCCOd8MZEIJ7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gS2ORqsJ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4749eecff7so83751266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Mar 2024 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711621958; x=1712226758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7ncvUdpMRSKqWXW0WZYpoDYWoHmMZgWCq1hd7UA6vM=;
        b=gS2ORqsJdLObdZn08vhuwt1UGTAjU+oaoKANmbJaXvAgFKYVXv8AToS0R3EySCEVJ/
         0iABG/JoySg64LGZC3V0+S2KpbCRuGe0ICLbBoVUH5N4eRNOXmxiUim6PPVnPwAdbQWM
         9bbKRehLcjEQsDKSOheF0OOXS3d80dOjWeO7lNxtoFktAG2CgBpIxsbcZXAhH5oJ2HSj
         HsMyuVbj4hIVNt2+kxzFzPakQ6nfSb9S6B2UUQADKUZJ/I80n4PJmljCLCMGwkCr4uPq
         sr0XRUk6LTxXjTcXX9bh7RAuJg7hc6Sx5WHeEeO21dYVR+BdVTogmAAmLR9fdxE5wFJF
         R7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711621958; x=1712226758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7ncvUdpMRSKqWXW0WZYpoDYWoHmMZgWCq1hd7UA6vM=;
        b=Nzfne1Pjta32//uSFuOY+06XJ2b6mSjj0/PHrKYzZuGFNKtFwHqFVIx7m3IhsILUFb
         hkiqjuwSLLHk24+oSUQ91c/4VTOSvGYLCVoAdCo6bAC9EIqgNc+5l/swVal4MW2q6lL0
         BMjOG6unt1qMqOl6890Dg/wf2ziMu8fK93KWg+ISUNWf2edA73OTVLUY0jeb65L+Sood
         EvXyzkeJPFLNJTfuk9Hnad3BgtkMyuCcspatzpFuPNpwHUQCP5eMzU8xx+5/BMIIUY22
         WMasFt98JgNTTS4CfemfNGYcGuyPv7Aw9w9UaTHVNPoGYUUqx7VRRtqmiUZSdfarGajx
         oONQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdPLgZXHK/QSLqvlYL2qCXhAuZRW6aNQfkIa02YL04a0Tyl/GM2vzQ7GnGxvB/YNnhQLaogfZWeeYdFB90ZxmRQzIqIiyM7FwT6g==
X-Gm-Message-State: AOJu0Ywuo3Wu1IvYooll6GCfEraK9do3POKXUxfgADoKcw/Ual+xmwx4
	rE2cATE72SK1jzXSZ4i8Xps7B0vRHqE37Zr+z7CTZ963BK1m+C12Zs7k+bzJ17NG2xvUgh7mvQ4
	C
X-Google-Smtp-Source: AGHT+IHEizdX+YVTFuwat4TDpSt3i7BuuxSRo5U8WSM4vSBPrlRdExLtV+/exHiPQv3bY2iIn3YEPw==
X-Received: by 2002:a17:906:c147:b0:a4e:2349:ef0f with SMTP id dp7-20020a170906c14700b00a4e2349ef0fmr984300ejc.65.1711621957973;
        Thu, 28 Mar 2024 03:32:37 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bn25-20020a170906c0d900b00a4e23400982sm444122ejb.95.2024.03.28.03.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 03:32:37 -0700 (PDT)
Date: Thu, 28 Mar 2024 13:32:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Keerthy <j-keerthy@ti.com>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, "Andrew F. Davis" <afd@ti.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] gpio: davinci: Fix potential buffer overflow
Message-ID: <014637ee-6d5e-41f9-abb6-d9c56ac5bf32@moroto.mountain>
References: <20240328091021.18027-1-amishin@t-argos.ru>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328091021.18027-1-amishin@t-argos.ru>

On Thu, Mar 28, 2024 at 12:10:21PM +0300, Aleksandr Mishin wrote:
> In davinci_gpio_probe() accessing an element of array 'chips->regs' of size 5 and
> array 'offset_array' of size 5 can lead to a buffer overflow, since the index
> 'bank' can have an out of range value 63.
                                        ^^

Where does this 63 come from?  SVACE is a static analysis tool.  I would
have thought a static checker would say that 'bank' goes up to
UINT_MAX / 32.

This stuff comes from device tree though, so it looks fine to me.

Documentation/devicetree/bindings/gpio/gpio-davinci.yaml:      ti,ngpio = <144>;
Documentation/devicetree/bindings/gpio/gpio-davinci.yaml:      ti,ngpio = <32>;
Documentation/devicetree/bindings/gpio/gpio-davinci.yaml:      ti,ngpio = <56>;
arch/arm/boot/dts/ti/davinci/da850.dtsi:                        ti,ngpio = <144>;

So it's fine.

I'm not the maintainer of this file so I don't know if adding a sanity
check makes sense but if we wanted to do that we'd have to add it to
davinci_gpio_get_pdata().  Otherwise it would have already had a buffer
overflow earlier in the probe function when we do:

drivers/gpio/gpio-davinci.c
   223          if (pdata->gpio_unbanked)
   224                  nirq = pdata->gpio_unbanked;
   225          else
   226                  nirq = DIV_ROUND_UP(ngpio, 16);
   227  
   228          chips = devm_kzalloc(dev, sizeof(*chips), GFP_KERNEL);
   229          if (!chips)
   230                  return -ENOMEM;
   231  
   232          gpio_base = devm_platform_ioremap_resource(pdev, 0);
   233          if (IS_ERR(gpio_base))
   234                  return PTR_ERR(gpio_base);
   235  
   236          for (i = 0; i < nirq; i++) {
   237                  chips->irqs[i] = platform_get_irq(pdev, i);
                                   ^^^

   238                  if (chips->irqs[i] < 0)
   239                          return chips->irqs[i];
   240          }

regards,
dan carpenter


