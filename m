Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55AE81F1FB2
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 21:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgFHTZ3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 15:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgFHTZ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 15:25:28 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007A1C08C5C2
        for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2020 12:25:27 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l10so18693860wrr.10
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2020 12:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=mxhIGg2cqw/XPpjpdkJxjIWYKGlCg1JDkmDrxitivV0=;
        b=Wki+dDfEOx3kuXRK+0nd8CQVmYMtGONVjSJ0CpY4bqVlR6pKRBsGxFhvST7jSBd/nu
         lwCgE8jIyWk6DG440Ct3cbpaBp8xUef4NsWL1Jog+ra+Ni5Vk0HEwG911gY+gHoJkAd6
         UFjvY0Nf8yaU6dFsgNu/Iwmed1BJTj1Csr3fDu8b0dq1sgC3EspY5WgW9MEDv/R4TJ1O
         IRFnUC63VOciy7ODCbAZ9qho4x3FX4vE4rcqv+kK7HLDhRq/gfdTSmv92nLqKOV8IG3C
         FuMcKLcSHJgDP6xG3GuiZsj4Auv32h4sDbD5A0ogpKPTVd7lmh+IiTN0fBxoT5MxAanj
         EUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mxhIGg2cqw/XPpjpdkJxjIWYKGlCg1JDkmDrxitivV0=;
        b=OyRH8kmGKevnmSaEqqAJQr3a45nhoFXExoua1wb/FSRghkR6xpZU8ZBZbPp5DFmsQp
         ttYDFocE/MQpQNNuSFCHYghBlf9bxuxLtwNujEJ7FJGJzA5rkk6quyxznOwqT9R/QRWZ
         3MBoAkG96UaRmbOU0ifzHxvqagPlpBOUflxXkfKETMKmEfA5H+RODEP1ucaOInYGoSjw
         t0Vp8WwULkCZ3oVdCtHxrnAxPVxvoN9Coo8HcmwbgI4ekiSsAF3MVhkfq/srznTaNFP6
         X4BeWHWqEq66TQ5qj+Ie0Uabc8J3iVZrrhWlml3Hm4bv5y4uXxRvG8sdsGoWXWBj8iTD
         o6/Q==
X-Gm-Message-State: AOAM531GOZRUfQgMXod6O+ZeBM94IwcmkZAimnNdFPq+L6cF1RXFAqdK
        dANr6BQWZmIo0xxqDzLjJnOilA==
X-Google-Smtp-Source: ABdhPJyI9mGXeNtCefguGgkN84Z6BMGgUJsgmPkK8phVYm55kKWSXwGkpNK7uvgqjHjERUfVR7OTUg==
X-Received: by 2002:adf:a34d:: with SMTP id d13mr324885wrb.270.1591644326744;
        Mon, 08 Jun 2020 12:25:26 -0700 (PDT)
Received: from dell ([95.147.198.92])
        by smtp.gmail.com with ESMTPSA id z206sm472761wmg.30.2020.06.08.12.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 12:25:25 -0700 (PDT)
Date:   Mon, 8 Jun 2020 20:25:24 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Serge Semin <fancer.lancer@gmail.com>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v1 3/6] mfd: core: Propagate software node group to the
 sub devices
Message-ID: <20200608192524.GF4106@dell>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200608134300.76091-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200608134300.76091-4-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 08 Jun 2020, Andy Shevchenko wrote:

> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> When ever device properties are supplied for a sub device, a software node
> (fwnode) is actually created and then associated with that device. By allowing
> the drivers to supply the complete software node group instead of just the
> properties in it, the drivers can take advantage of the other features the
> software nodes have on top of supplying the device properties.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mfd/mfd-core.c   | 31 +++++++++++++++++++++++++++----
>  include/linux/mfd/core.h |  3 +++
>  2 files changed, 30 insertions(+), 4 deletions(-)

I'm not sure a change to the API is justified presently (same does go
for 'properties' really, but as it was only a couple of lines, it
didn't seem too intrusive).

My recommendation is to handle this in-house (i.e. locally in-driver)
for now.  When (if) more users adopt the practice, then we should
consider to draw down on line numbers and repetition and make it part
of the API.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
