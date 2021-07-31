Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842FE3DC375
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 07:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhGaFNl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 31 Jul 2021 01:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbhGaFNl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Jul 2021 01:13:41 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE3BC06175F;
        Fri, 30 Jul 2021 22:13:35 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso17363581pjo.1;
        Fri, 30 Jul 2021 22:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cQkct7+MQbZOt6wGLdVq4ubYRizvB/PleDCKxiuSLAQ=;
        b=JY6uE7OmqZLx2DeOIDrlQAN4yuqjul4ka8dSWZ3z4TY2V/X57XBR2/CaHPYLP9ONXH
         euq0O8IcXR/G3X7v2iW/2/YxMZTLkcyQ+mcwXSNaa0+Njfzex3Cdxfkv1wVGpzWTZ7H1
         f1IDjpRgk+V5qcuHh/bEr33QmUk+TB68VXLfHHUp7GDNpSq0MCkFgx1mlpWTbiylDfjb
         j7Gtad7kuh7JwJoW6CcpnXm6P5uCW+iHgvq3XljIpaSzTwQoL1opEu5pUntvNZ+hVS1Z
         +x/LZlzqLx3KvyO30YsFNMudDKqSh0Mj5FahZ25BAPbQDq5DxyLWK7rKR/NGM9UIiPa0
         2uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cQkct7+MQbZOt6wGLdVq4ubYRizvB/PleDCKxiuSLAQ=;
        b=e0i9IGcXaTKdWs00jJOStoVFrSWL9CmWMxy/1dqtRKVxKjiCAJyeF5JYklmatDLV9k
         ZVWqZYGYVhdI5rsXGUoDA6xmMCUaZ75FmKmvAoDreo8c4OjEekWnTtkcH7Nl/ccD11st
         MAGZ7TJ3mheGAv710PEZ3Ek2O5Q9dB2NqFZiilaiPVG9UQUF111SVWkUyBBF3xCgDEw9
         ffaHnDzwYGcJ9TUsg84p/3l7XjAt/FTQAu/yr+etGwGaZ+FQEp7xkLKM3RuDaoxQDwJw
         DNqLdzaDbgJ9JsBL4lM6Br7Inq4HpCVfQWgxpPzwckhVizm/dE85mjYI/2F4SKVwEiTT
         FZmQ==
X-Gm-Message-State: AOAM533P/EUfHGZs4Nor05pXjYUTD35ibvVFOnmdKYMf9PBiDH2zlirn
        cAgBJhoAELL5uNHM8NTwu60=
X-Google-Smtp-Source: ABdhPJxt1L+HVos1Ge3CONswo2aMEin8MnpEQfdMTyH2pCFRj8kfN3wQ1R/oazB0xt8c7vMZEj1Y3A==
X-Received: by 2002:a63:e14c:: with SMTP id h12mr2054727pgk.431.1627708415365;
        Fri, 30 Jul 2021 22:13:35 -0700 (PDT)
Received: from sol (106-69-176-40.dyn.iinet.net.au. [106.69.176.40])
        by smtp.gmail.com with ESMTPSA id z2sm2483144pgz.43.2021.07.30.22.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 22:13:34 -0700 (PDT)
Date:   Sat, 31 Jul 2021 13:13:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [RFC 06/11] gpiolib: Add HTE support
Message-ID: <20210731051328.GA10526@sol>
References: <20210625235532.19575-1-dipenp@nvidia.com>
 <20210625235532.19575-7-dipenp@nvidia.com>
 <20210701142414.GB34285@sol>
 <5ed6ca9e-ee1e-23dd-5f2c-d674c74b3ea3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ed6ca9e-ee1e-23dd-5f2c-d674c74b3ea3@nvidia.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 29, 2021 at 07:25:36PM -0700, Dipen Patel wrote:
> 
> On 7/1/21 7:24 AM, Kent Gibson wrote:
> > On Fri, Jun 25, 2021 at 04:55:27PM -0700, Dipen Patel wrote:
> >> Some GPIO chip can provide hardware timestamp support on its GPIO lines
> >> , in order to support that additional functions needs to be added which
> >> can talk to both GPIO chip and HTE (hardware timestamping engine)
> >> subsystem. This patch introduces functions which gpio consumer can use
> >> to request hardware assisted timestamping. Below is the list of the APIs
> >> that are added in gpiolib subsystem.
> >>
> >> - gpiod_hw_timestamp_control - to enable/disable HTE on specified GPIO
> >> line. This API will return HTE specific descriptor for the specified
> >> GPIO line during the enable call, it will be stored as pointer in the
> >> gpio_desc structure as hw_ts_data.
> >> - gpiod_is_hw_timestamp_enabled - to query if HTE is enabled on
> >> specified GPIO line.
> >> - gpiod_get_hw_timestamp - to retrieve hardware timestamps.
> >>
> >> Signed-off-by: Dipen Patel <dipenp@nvidia.com>
> >> ---
> >>  drivers/gpio/gpiolib.c        | 92 +++++++++++++++++++++++++++++++++++
> >>  drivers/gpio/gpiolib.h        | 11 +++++
> >>  include/linux/gpio/consumer.h | 21 +++++++-
> >>  include/linux/gpio/driver.h   | 13 +++++
> >>  4 files changed, 135 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> >> index 220a9d8dd4e3..335eaddfde98 100644
> >> --- a/drivers/gpio/gpiolib.c
> >> +++ b/drivers/gpio/gpiolib.c
> >> @@ -2361,6 +2361,98 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
> >>  }
> >>  EXPORT_SYMBOL_GPL(gpiod_direction_output);
> >>  
> >> +/**
> >> + * gpiod_hw_timestamp_control - set the hardware assisted timestamp control.
> >> + * @desc:	GPIO to set
> >> + * @enable:	Set true to enable the hardware timestamp, false otherwise.
> >> + *
> >> + * Certain GPIO chip can rely on hardware assisted timestamp engines which can
> >> + * record timestamp at the occurance of the configured events on selected GPIO
> >> + * lines. This is helper API to control such engine.
> >> + *
> >> + * Return 0 in case of success, else an error code.
> >> + */
> >> +int gpiod_hw_timestamp_control(struct gpio_desc *desc, bool enable)
> >> +{
> >> +	struct gpio_chip	*gc;
> >> +	int			ret = 0;
> >> +
> >> +	VALIDATE_DESC(desc);
> >> +	gc = desc->gdev->chip;
> >> +
> >> +	if (!gc->timestamp_control) {
> >> +		gpiod_warn(desc,
> >> +			   "%s: Hardware assisted ts not supported\n",
> >> +			   __func__);
> >> +		return -ENOTSUPP;
> >> +	}
> >> +
> >> +	ret = gc->timestamp_control(gc, gpio_chip_hwgpio(desc),
> >> +				    &desc->hdesc, enable);
> >> +
> >> +	if (ret) {
> >> +		gpiod_warn(desc,
> >> +			   "%s: ts control operation failed\n", __func__);
> >> +		return ret;
> >> +	}
> >> +
> >> +	if (!enable)
> >> +		desc->hdesc = NULL;
> >> +
> >> +	return ret;
> >> +}
> > Last I checked, pointer accesses are not guaranteed atomic, so how is
> > hdesc protected from concurrent access?
> > Here is it modified unprotected.
> > Below it is read unprotected.
> 
> The assumption I made here was, gpiod_hw_timestamp_control will be
> 
> called after client has made at least gpdio_request call. With that assumption,
> 
> how two or more client/consumers call gpiod_hw_timestamp_control API
> 
> with the same gpio_desc? I believe its not allowed as gpiod_request call will
> 
> fail for the looser if there is a race and hence there will not be any race here
> 
> in this API. Let me know your thoughts.
> 

My assumptions are that the userspace client is multi-threaded and that
there is nothing preventing concurrent uAPI calls, including closing the
line request fd.

The specific case I had in mind is one thread closing the req fd while
another is using set_config to switch to the hardware event clock.
In that race, the close be calling linereq_free() at the same time the
linereq_set_config_unlocked() is being called.  Both of those functions
make calls to the functions here that read and write the hdesc.

There may be others, e.g. line_event_timestamp() running in the
irq_thread at the same time a set_config call switches the event clock
away from the hardware clock.

So assume concurrent access unless you can prove otherwise.

Cheers,
Kent.
