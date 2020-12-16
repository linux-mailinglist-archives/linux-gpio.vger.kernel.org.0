Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860092DC2C2
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 16:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725905AbgLPPJe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 10:09:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgLPPJd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 10:09:33 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A40C0617A6
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 07:08:53 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i9so23531356wrc.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=x22bCBMzRAxFz6sSBgolhRVuawQUHRVdIXtYqh/jdUI=;
        b=XXoR12nJ/51Cdim76vK0ddjmXjI2P2QPShPNZJAD1L68GyLqMQ+x5KY7Z4ZiUGR4Eh
         63fwF6dD1wegZWqANU6Q4TY36xZPy/+NsCxL99Wwj9TmX+W9HuK1eLXMQUBp8QsSj3Z5
         mmBKV2NdOQ4ODcsojdjTNR+GmuJARx3mWE6r42cO/+aC9KK14D7Hlr4IN5LnALmkqmjP
         6wuvgC+dzwzxjcll5T8pYAZRaEhnq4LOxr6snOHVzfRGFhPOmGuJCCtH7F8NNRE4J+Eo
         rxd9Vb33IxAcqrTroVKqzpNN9Cpmel7w4fRS+42axL58mjVr3yinPEP9J9JhmvyZ2a2I
         GuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=x22bCBMzRAxFz6sSBgolhRVuawQUHRVdIXtYqh/jdUI=;
        b=YKAEbz5nUDrsf8EgNkx3yu4o7Tp2EVG8bbn4l4F9nes1ljvTjFl8Gq+TZp4jvRF7l7
         QsPrmmSCDp57EurLXTM+gVD7gikvBB3HbgCpFl4B4NDWE8zOohBwap0M/xAksOJNvCBq
         GucVjWtr4Gk1CCmEWSmuTzXSa+FBWqQoHdxz2KFoqPatVqdMqNsYCHbZslw466DuomdE
         2UHcNNTtDNybxko/Kq6WJpe31tvFszS+daHP5WcW/1vbVzQd2+mChcDozZwz6rBqkxQw
         MufMAGkZ+axSck+Ia8WpRNEG8cUWwbyFaPx/GS7z6JvzQEnQbAlvKQOku0KTRO9307gJ
         8HTw==
X-Gm-Message-State: AOAM532tvXijdNZeaxTWGEVA3yCipPm7eYC8+H7xlvEkVhJfdbifLVRv
        OTlIzIyE2mXEcFnu+8M8zbeo8Q==
X-Google-Smtp-Source: ABdhPJyiTo068uJu57j2aTnPUqS3Rd6f/mMiS8boAbDC3unxQbp0sz3qKJbUoHZr6Tip0sLgPwYC8w==
X-Received: by 2002:a5d:6a4f:: with SMTP id t15mr7763158wrw.62.1608131331785;
        Wed, 16 Dec 2020 07:08:51 -0800 (PST)
Received: from dell ([91.110.221.200])
        by smtp.gmail.com with ESMTPSA id u7sm1846111wmu.47.2020.12.16.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 07:08:50 -0800 (PST)
Date:   Wed, 16 Dec 2020 15:08:49 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     marek.vasut+renesas@gmail.com, matti.vaittinen@fi.rohmeurope.com,
        lgirdwood@gmail.com, broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, khiem.nguyen.xt@renesas.com,
        linux-power@fi.rohmeurope.com, linux-gpio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/12] mfd: bd9571mwv: Use devm_mfd_add_devices()
Message-ID: <20201216150849.GI207743@dell>
References: <1608104275-13174-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1608104275-13174-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1608104275-13174-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 16 Dec 2020, Yoshihiro Shimoda wrote:

> To remove mfd devices when unload this driver, should use
> devm_mfd_add_devices() instead.
> 
> Fixes: d3ea21272094 ("mfd: Add ROHM BD9571MWV-M MFD PMIC driver")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mfd/bd9571mwv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
