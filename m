Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7836E2414B6
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Aug 2020 03:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727989AbgHKB5G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 21:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727985AbgHKB5F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 21:57:05 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B893C06174A;
        Mon, 10 Aug 2020 18:57:05 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t6so5955075pgq.1;
        Mon, 10 Aug 2020 18:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8TNdl+C8uye8Ja5jd+YiNm9s++KEtit0cbi0OQRWSFY=;
        b=PijYJW8UUZ4ppYLApZYvd5T3IzVvKdIZrU/doMYicvI2K1gt96P+DHyvD0/PT3zT9g
         7ECqjPg/Y6nAmxapa4QURVDrnERrKz80gO6ghlrjgEAzcqRimMTvnw1XR38ajO0ih8CY
         BRKQUF6f3ou95MP8jW78OvNhE1rsDVqqcYvkS6Os4afu5Q6+7lH+U2hsniG8VlzXKMbJ
         ul/wplryuiyNWkDHYss8NOlVGmowDyHCVxtkrS2yKQjVqmxCV6ux53pD/6tvyyFmxVAJ
         10zsmaV7zObAE4M+MJy0NJfGSJOuIMf8ZD0gl+Ejbc6/o8UfjWhXAQcRWWHqHLPeZmjN
         LWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8TNdl+C8uye8Ja5jd+YiNm9s++KEtit0cbi0OQRWSFY=;
        b=ksJTxLDGbfT1ZD63XTnOEeHtZYZywMkqSt/lDri3UQKL3XpZlRTMkaEAxi7EGhWqPo
         9QeWcZjiNyvEuMLjghZvM39Yz/WW4UWG0SdcvYePGHSBTMjkfbXAoJvm4i70irF5Z7RY
         LUc4CkQB7XW0pO1gCNH9G6KWBgyssIB8iG2dCN4YsdhX6MHAX1swRgfWPILaPOxZ9TaL
         CffCdbKdtznboEsd1aWBPC0iSq5h5CCx00EgjNjWNs0UFBUj0cUvHl/8rWc6bKnkcchs
         MYGx9yF+PLJwx8y+ClC55d0NY6IrkvnBEIZNfJzUmJbh29ds2LczbUGX4p+PTL7+2Pw0
         yr9w==
X-Gm-Message-State: AOAM5301G2EaQR2T20f7dTLm/QqQcz2cRuDSANBHKGlpumZ4E8dE946y
        LFQ+ngNVS4Na21aGEye2XVf0auy0
X-Google-Smtp-Source: ABdhPJzB+chc/PeTX5RV7BhujvSJA/PNj8ppEtLCvpPemnsswkVm/20b/HN5CTjcL7f/qjFDhzKlyg==
X-Received: by 2002:a63:5213:: with SMTP id g19mr12981742pgb.44.1597111024494;
        Mon, 10 Aug 2020 18:57:04 -0700 (PDT)
Received: from sol (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id b15sm19781452pgk.14.2020.08.10.18.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 18:57:03 -0700 (PDT)
Date:   Tue, 11 Aug 2020 09:56:59 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Subject: Re: [PATCH v3 05/18] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
Message-ID: <20200811015659.GB25507@sol>
References: <20200809132529.264312-1-warthog618@gmail.com>
 <20200809132529.264312-6-warthog618@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200809132529.264312-6-warthog618@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 09, 2020 at 09:25:16PM +0800, Kent Gibson wrote:
> Add support for requesting lines using the GPIO_V2_GET_LINE_IOCTL, and
> returning their current values using GPIO_V2_LINE_GET_VALUES_IOCTL.
> 
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> 
[snip]

> +static long line_get_values(struct line *line, void __user *ip)
> +{
> +	struct gpio_v2_line_values lv;
> +	DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> +	DECLARE_BITMAP(mask, GPIO_V2_LINES_MAX);
> +	struct gpio_desc **descs;
> +	int ret, i, didx, num_get = 0;
> +
> +	/* NOTE: It's ok to read values of output lines. */
> +	if (copy_from_user(&lv, ip, sizeof(lv)))
> +		return -EFAULT;
> +
> +	if (lv.mask == 0)
> +		return -EINVAL;
> +
> +	bitmap_from_u64(mask, lv.mask);
> +	num_get = bitmap_weight(mask, line->num_descs);

Nuts, that doesn't do what I intend, and is part of a failed experiment
that I thought I had reverted.

Assume that in the next version the mask handling will be similar to
line_set_values_locked in patch 09.

i.e. 
	for (i = 0; i < line->num_descs; i++)
		if (lv.mask & BIT_ULL(i))
			num_get++;

and the subsequent mask tests will be against lv.mask instead of the
mask bitmap declared above (which will be gone).

I won't do a v4 just yet though - there is sure to be other things
to go in there.

Cheers,
Kent.
