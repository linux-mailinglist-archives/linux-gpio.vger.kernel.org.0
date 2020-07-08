Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607522192D6
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 23:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgGHVuA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 17:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgGHVuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 17:50:00 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB394C061A0B;
        Wed,  8 Jul 2020 14:49:59 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id k17so14962673lfg.3;
        Wed, 08 Jul 2020 14:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kr0uY34MA2mU+mS/f5yLCH/4lLR9Q4Z3ZgnSHFjUcx4=;
        b=LBEUkXUeI+61J5vvXQ+EenX7NsSU1l5OPZOPHBgpWqew6/jnVAUTUhNNtTErgxoaWS
         6wqQLbhM+/wlgwVd9ne+F90HccjQ2xSKYatYsC/+Bd4EnNrFdE7n3MLfRYmVqXrn6WLy
         S85IyYQwW6ThUMbUvvmhpxpX/azJ7KYuhjdhHzYTy1ZWvZqVI5zIQeKSvGbGvECPwoZn
         cV/97Hj2sZiuX5tXXlCPZB8rxR4ZaZZbAnrWdIk31knlEeFRd2xSkuTSQCE/fSevVY3u
         BCJJFG7K9bfOX0kl1zRVr8NdVHl6olBbis2B/AAFTetpq39pOsFe1VlCbMGOSGZJWwWx
         9lpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kr0uY34MA2mU+mS/f5yLCH/4lLR9Q4Z3ZgnSHFjUcx4=;
        b=jgpEyqx+Hh/pUbLXQ5gssmYturF/IZm7+6leynP2zCNlqLt07hjKlidWfTbe3UCzJO
         YSZ+8vtY5tgBBVCmIO0ZLEQcA93fDyMyzj1cYHaVyAnSQDdSthsWmNjYRMfhJwYZyI6H
         c6LA8z0jOv2tZxJ1pAkhvl4u+DVCLVBgzu4XtU1vmZF4nOwgxivarBJlWRkRfKQynjLn
         vW/beDfl6UWz/4VMa8QAM+ZgPLyqRC9Ve3MQ2uo9R0NRv/ya+e/3+ICFdNXvFSBoRuzf
         oPlWTGefOT1YchZSNzG6IcEJvwaezeZg+aAeMXOulzncMJzJw7DWbBce99w/4r38NgNS
         lmng==
X-Gm-Message-State: AOAM533/ysIn1buK0aaY0D41OR55H+7607c7QwDiMKT8abk5+JV7Vf4/
        4gnTrQpiCz21VtFRB0M4o4D6BRLU
X-Google-Smtp-Source: ABdhPJwFsl/ec0lVG8I+JQ7DImhTtBUD3KiZvK1iWZVMvoOkMtHKvfLdeJuCRMpspXgoTac8KKUrJQ==
X-Received: by 2002:a19:8c09:: with SMTP id o9mr38410780lfd.160.1594244998024;
        Wed, 08 Jul 2020 14:49:58 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id o201sm310201lff.8.2020.07.08.14.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2020 14:49:57 -0700 (PDT)
Subject: Re: [PATCH v1 0/5] Improvements for MAX77620 GPIO driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20200708202355.28507-1-digetx@gmail.com>
 <CAHp75VcNao84UajMYDJRH2gX7t8n=uo_Th8VVgcxJj3YkiA+pA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5cfa2209-2d54-c347-cd95-08554213d392@gmail.com>
Date:   Thu, 9 Jul 2020 00:49:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcNao84UajMYDJRH2gX7t8n=uo_Th8VVgcxJj3YkiA+pA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

09.07.2020 00:00, Andy Shevchenko пишет:
> 
> 
> On Wednesday, July 8, 2020, Dmitry Osipenko <digetx@gmail.com
> <mailto:digetx@gmail.com>> wrote:
> 
>     Hello!
> 
>     This series addresses a problem that I discovered on Nexus 7 device
>     where
>     GPIO interrupts may be left enabled after bootloader and the driver
>     isn't
>     prepared to this. It also makes a small improvements to the code,
>     fixes the
>     non-released interrupt bug and converts driver to use irqchip template.
> 
> 
> Thanks! I commented on one patch, the rest looks good and you may add my
> Rb tag.

Thank you! :)

