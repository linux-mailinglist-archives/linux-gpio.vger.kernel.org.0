Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4734144793B
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Nov 2021 05:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237385AbhKHESb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 7 Nov 2021 23:18:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237387AbhKHES3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 7 Nov 2021 23:18:29 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87DEAC061570
        for <linux-gpio@vger.kernel.org>; Sun,  7 Nov 2021 20:15:45 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id j9so14032390pgh.1
        for <linux-gpio@vger.kernel.org>; Sun, 07 Nov 2021 20:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ow3kGxYLNyC9HLIHc8ZxwibYPx3dM7u/6WgOPxoycOY=;
        b=hHMIXEwywC4KIIcQTyM84LrwKvo0ZqVFVCZyZ3zsYzUh8HbqDoMcVOpiienrfq12D8
         xi0CV1k9a4sv5Q5WEj3X8+uC2l0CdHdSipai3N4MZ04/hGZKDyuIXNzCIciAOnJH17GP
         wWUqQrLxozORex1MMIfW4QO9UL4Wj2vRuSWb7jQ1OkcOwMC2YKZFg6deH2OALV1Jcmvv
         NktFVMtu6Ag4ALAeGCqLhZgl+b8yytLE8FfIfaKYbN7ham6klAxxbVDVF8Jic+75yHbM
         c4A92SQLr6n749h08SAh91JLDGPwTi8gIf7rpf65FwTM1tUK6nxS4tRP+LYsE09ZGIT+
         1LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ow3kGxYLNyC9HLIHc8ZxwibYPx3dM7u/6WgOPxoycOY=;
        b=4jdEuW9iEWHKumioQ4z2c10EaLX24KONCF2phmnYTwqkxa8sgSnzDJ6snNXsST2uxX
         3KEnDpgmythhKIYnt/ZBoLtbMGgyhVJk4vr3rr8T7hB4TYwQOM8ILq19uphTmBZdwjRj
         EQiu9C0YTYasRWi/YirMEWjD4RHxtmZE2JcYVihOQES3lAOLeKc6EkTNPaVeQfUlFrI6
         /cyFvvjQFjb1VpVNoceFOx6AHB7zhzyVB2TFlL90rKW72Wq7CGeG0nE4KsUgfFQ3DXPv
         R6xf9ptkjT1tieqHcYZ2Ozcd9RI0d2q/EXfDJkJzPCHwf61COdMjf2qvwqLnDhVzevDK
         kdeA==
X-Gm-Message-State: AOAM530zbQF7OvXaCliKH5MIhmHr9V8zsANSWIJPECj+gwyqiOK0t2BC
        +d3FoFF+nrZcTpoNcT3JIjEJgQ==
X-Google-Smtp-Source: ABdhPJw03Vh40n48feQuJ7VhZZRb8hZlAw4Q421T71CKIYSr2dlumNMItyAlVZWpDNqfvuu93XJpTQ==
X-Received: by 2002:aa7:80c5:0:b0:480:4fc5:a531 with SMTP id a5-20020aa780c5000000b004804fc5a531mr64855837pfn.52.1636344945089;
        Sun, 07 Nov 2021 20:15:45 -0800 (PST)
Received: from localhost ([223.226.77.81])
        by smtp.gmail.com with ESMTPSA id e14sm4521443pfv.18.2021.11.07.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 20:15:44 -0800 (PST)
Date:   Mon, 8 Nov 2021 09:45:42 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     info@metux.net, vireshk@kernel.org, linus.walleij@linaro.org,
        brgl@bgdev.pl, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] gpio: virtio: remove unneeded semicolon
Message-ID: <20211108041542.vhznujep4qgm7hv3@vireshk-i7>
References: <1636344232-56537-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1636344232-56537-1-git-send-email-yang.lee@linux.alibaba.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 08-11-21, 12:03, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpio/gpio-virtio.c:437:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpio/gpio-virtio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> index aeec4bf..84f96b7 100644
> --- a/drivers/gpio/gpio-virtio.c
> +++ b/drivers/gpio/gpio-virtio.c
> @@ -434,7 +434,7 @@ static void virtio_gpio_event_vq(struct virtqueue *vq)
>  		ret = generic_handle_domain_irq(vgpio->gc.irq.domain, gpio);
>  		if (ret)
>  			dev_err(dev, "failed to handle interrupt: %d\n", ret);
> -	};
> +	}
>  }
>  
>  static void virtio_gpio_request_vq(struct virtqueue *vq)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
