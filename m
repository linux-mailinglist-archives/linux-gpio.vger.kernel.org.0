Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E6841642C0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 11:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgBSK5k (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 05:57:40 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43218 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbgBSK5k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 05:57:40 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so27622786wrq.10
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 02:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XbVzBlTzmMUb2Tui5d1tff0RCyFoEaGMTP5xbXMfFog=;
        b=zzsVtrNanulY/mngUlst4INjYwfO7oe6NjEiCEOQ2DdCeylsbEXEfNxjrB32+F74cw
         FnNXVYE+P46yRQocLtm+bg4/BtasFaxagt4BPpDPIWNYNFuldCG7zE3qzcKHAw2OMTQ2
         ach3BEo29K06KggpiW17sffaCPd/dfhKZSFsCxQHpG4YdwUeYCOtcb/T8DDDP3gYj24l
         /jF3//Lgb6Em0kT7GEiy51/mb/pjxV1JJ55mSfF0ZUNYntSNvhuUrGQ8nYVpsv6wRy3r
         0Q0nWdnoIabKpitT+KwKXFGaNmsW3KUEGIcmt1ocL7fHq1Z8c/KQBHcctSbwcjHte1Id
         mYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XbVzBlTzmMUb2Tui5d1tff0RCyFoEaGMTP5xbXMfFog=;
        b=RzNEjOKRtxi3DFGUjKZzzAGJnYc/ACHe9cxAkY32sPA1G+eyhkBrFs/9jdvJM4VLRX
         trB2MaRVjDqG/D9AybL5azs6874sIh7OsG0aSqHB5beUeywAX199hOuZOEMa1mGxnidA
         Dyo2gVeso9TPifV83fPwz7k3rzQg5WINClfAPdD8+AMPVN+AmuF64kjU65WyV0qLIr34
         8BT7YylRUl8NNYp0Z+j0Zkj3mMutnWj5eDfgCFCz0CoI5gOZ3ZOpKuArmfrL2ct+MERR
         8NUjo4zbY8GrBtRlzbKpIzcTPF+GC3Kod/fDVT8ZjjJG8m9CN4JN8hDpFor6BQ3KVR48
         YnXA==
X-Gm-Message-State: APjAAAWM41OJiMl6+Wzw/Wr4oRPs8zevuz8ZlhyLY+Kta/qQC/so3/KN
        T7h2ebkuwYgG+qg2rp+yLFV4jA==
X-Google-Smtp-Source: APXvYqwg9YyFLCEoecAsCJ8HXP+2fq8Io/qWMo1OmnwtGkM9ljAYSw/lwW8zQy81/NLD9oy1vhYbXg==
X-Received: by 2002:adf:9c8d:: with SMTP id d13mr37236416wre.392.1582109858386;
        Wed, 19 Feb 2020 02:57:38 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id y185sm2617910wmg.2.2020.02.19.02.57.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Feb 2020 02:57:37 -0800 (PST)
Subject: Re: [PATCH v3 7/7] nvmem: add a comment about resource management
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200219092218.18143-1-brgl@bgdev.pl>
 <20200219092218.18143-8-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <56f38e71-7572-55ac-d5ae-dfbe5c2345f7@linaro.org>
Date:   Wed, 19 Feb 2020 10:57:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200219092218.18143-8-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 19/02/2020 09:22, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The fact that part of the resources associated with the nvmem resources
> is freed by the release() callback in device_type caused me some
> confusion. Add a comment explaining that to nvmem_register().

I see this patch totally unnecessary!

I expect people creating patch in this area to understand what exactly 
they are doing. This is not going to help them in anyway, other than 
misleading and re-documenting device_add which is already available at

https://www.kernel.org/doc/html/v5.5/driver-api/infrastructure.html


thanks,
srini


> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   drivers/nvmem/core.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 40fe5913c264..6e28f3fddf53 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -397,6 +397,11 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   
>   	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
>   
> +	/*
> +	 * After calling device_add() we can stop freeing previously
> +	 * allocated resources - they'll be freed from nvmem_release()
> +	 * when the device's reference count drops to 0.
> +	 */
>   	rval = device_add(&nvmem->dev);
>   	if (rval)
>   		goto err_put_device;
> 
