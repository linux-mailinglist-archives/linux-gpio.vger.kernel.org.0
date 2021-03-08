Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BECE331063
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 15:08:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhCHOID (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 09:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCHOHs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Mar 2021 09:07:48 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DDDC06175F
        for <linux-gpio@vger.kernel.org>; Mon,  8 Mar 2021 06:07:48 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id u14so11613168wri.3
        for <linux-gpio@vger.kernel.org>; Mon, 08 Mar 2021 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=67p4kVEdQcLqsqeRNFk9Be2uM7oDzD/JRQWZyk0AvmY=;
        b=kncpZpypUCLKk3aF15ZYEnmqI/KTHACwNEMW6S5FT9TYje5pJ/VXRcHoaA5Rag0KmT
         +II1YZIE1PH12BMWDXGlqKqSclkTnnVehfrO7HSrzSPty+cySja4pzqRwSxM1heE7hQi
         gEdU66nlyTc571ouyggnGeOo4Ztb+puOYZ+OaseXrwMAsUK2nAICNgqPhrhpt2O62LOI
         XuyZPvSJ/i2Y3IpSAVRSPLpZzxb5ZHc1p+/C+uH7wVtPMV3FSDIvIHwsWVAVk4BrNRCz
         2a4Ud4kI4lGjNEDACBvEHnNaKvN4QyIbvUbADhQUWSjgU2+kRBXeiG9fqJijnuCn9yyz
         GVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=67p4kVEdQcLqsqeRNFk9Be2uM7oDzD/JRQWZyk0AvmY=;
        b=eAwErsT+rAm5Aml7ncvQUAVQzlqtmEgkSipbycJ5B/9IdlkkoJaAikFuG1C4T8g8pM
         MFZ/NK2813a+hPsVbTz5Nxu8XShNIXeH/usMQiMeKZej0wQAQc/4C1qbng4ePoEJxtuU
         cc//HKcjyBPA/VWm0oxdE7UBtJT3YrXm8AWYwkxMQxvXH+5rUwTIBHB2MAvKVSFoSFHn
         YqYqvvO+cT2bkSIXudzDg7Todc0/i2d6tcEdG7OD6WqJD7D+pKz+lC8xWVm0VySfXxEM
         5SHcSaxcUdKzoHApj9ZyF2jAKbfhPKhJDl52O6GbNfllokkxkkQ1w8kTVZasWlP0MGJz
         kn1Q==
X-Gm-Message-State: AOAM531MuEnz1QrUD9kw7ZcsDqdEwZcgn/Uy9/bY4k4uwOXZ7kRT47LL
        7Lw7srFhfX6xzYicGxNbaK8ekg==
X-Google-Smtp-Source: ABdhPJyrNSEKao0oh/Ds9oN0i3eOUKR+2NZcXAzKeV9pu6rKMUFDYYkK0htjHP+3MbpphcEVt5pn3A==
X-Received: by 2002:adf:ec46:: with SMTP id w6mr22706119wrn.213.1615212466860;
        Mon, 08 Mar 2021 06:07:46 -0800 (PST)
Received: from dell ([91.110.221.130])
        by smtp.gmail.com with ESMTPSA id b131sm19226315wmb.34.2021.03.08.06.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 06:07:46 -0800 (PST)
Date:   Mon, 8 Mar 2021 14:07:44 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] mfd: lp87565: move LP87565_regulator_id to .c file
Message-ID: <20210308140744.GJ4931@dell>
References: <20210219223910.1831-1-luca@lucaceresoli.net>
 <20210219223910.1831-3-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219223910.1831-3-luca@lucaceresoli.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Feb 2021, Luca Ceresoli wrote:

> This enum is used only internally to the regulator driver for buck indexes.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  drivers/regulator/lp87565-regulator.c | 11 +++++++++++
>  include/linux/mfd/lp87565.h           | 11 -----------
>  2 files changed, 11 insertions(+), 11 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
