Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8381372A38
	for <lists+linux-gpio@lfdr.de>; Tue,  4 May 2021 14:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhEDMil (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 May 2021 08:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhEDMik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 May 2021 08:38:40 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F36C061574
        for <linux-gpio@vger.kernel.org>; Tue,  4 May 2021 05:37:45 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id s82so5299238wmf.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 May 2021 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U/1QZkjCa6GEMRpkcMFrkvrLHl4v/PomLIYkWqIeTAs=;
        b=TqYkiLVlXI/bIWFhowy6E9sOGmUVKlfBqkwysvODQaMNUpkhc+SoT8+9qgtIoimnrR
         d5xhm8pwPbEkxznLnZ8lAZ5a1Xrkk7yBA5YQBFIV5ERIxxzZwbynhPiB9wOBsEVUTvV2
         6KNHnGhYFS7QLlbO8khbY8+wHQgouTK7HdO8r0TM3p763UA7MruNdrD7HHu+IxOmdtWT
         glMk07+Uio+vgD6Bi/Oi6q0lzZwfjPJ61aCJ+VEyo27dLUWD14ZfEYV0zaXTv5glzmez
         FCYrmHGt+D8x40FHxo7axTSNyLAavBFm/YAxkvPNL2lNITITmGCcTso3f9wgF7KT39hY
         zZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U/1QZkjCa6GEMRpkcMFrkvrLHl4v/PomLIYkWqIeTAs=;
        b=b9Wg3myCBY45kc9wWybMrYxhFMRN1h2rA99QAW+Wx8bmwLfbmmasg90trhN7nWdots
         ugQujl3ouc7n8+xeqMMYljz1/mVtxvdyCsBg3MbS28bXYilaBm3CqEg0odXUuGfrWldm
         tKwbTN3N5iJyBm59TXgtEMSIznNGKz2+ZTv16bNxPU3CFbuPPiI0JVipT49ki/HOcrI/
         Igyai89O/ArGo7aDicFh1SK8wVzLmMzt6UYxB0ZapU9b+K87t2DaUB7XhQcEOx3sejYw
         Y9eLPaHhssFQYQ/HLel4ipjHGOF8CjajSRME31w1W2DBQ0Tsl7wJ2Ozd2/KL0Naijafu
         IvXA==
X-Gm-Message-State: AOAM5313khImAfDKxc2DCiAFaSVp8bwJLnx05RPPIPcoskadDypRRa74
        7ilOowZZdCt+XzAFX9tUJ4ODlLkqoweYvsZk
X-Google-Smtp-Source: ABdhPJxSBCtracM3c/QjXmodwPmpj8YwcedpIhPP/J6KH7G76lB5iWf7sKectCb0m7MrLuzjaXs2jg==
X-Received: by 2002:a05:600c:4f56:: with SMTP id m22mr25860248wmq.19.1620131864531;
        Tue, 04 May 2021 05:37:44 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id s5sm2572279wmh.37.2021.05.04.05.37.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 May 2021 05:37:43 -0700 (PDT)
Subject: Re: [PATCH v2] gpio: wcd934x: Fix shift-out-of-bounds error
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, john.stultz@linaro.org,
        amit.pundir@linaro.org, bjorn.andersson@linaro.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210310174304.22176-1-srinivas.kandagatla@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e50f575c-9726-d8e3-4762-c25813cb76c3@linaro.org>
Date:   Tue, 4 May 2021 13:37:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210310174304.22176-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On 10/03/2021 17:43, Srinivas Kandagatla wrote:
> bit-mask for pins 0 to 4 is BIT(0) to BIT(4) however we ended up with BIT(n - 1)
> which is not right, and this was caught by below usban check
> 
> UBSAN: shift-out-of-bounds in drivers/gpio/gpio-wcd934x.c:34:14
> 
> Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---

Looks like this patch was missed. Without this audio on DragonBoard 
DB845c is broken once rc1 is out, as the corresponding dts changes are 
already in next.

Any chance to get this in .. maybe after rc1?


--srini

> changes since v1:
> 	- removed unnecessary dump stack from log
> 
>   drivers/gpio/gpio-wcd934x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
> index 1cbce5990855..97e6caedf1f3 100644
> --- a/drivers/gpio/gpio-wcd934x.c
> +++ b/drivers/gpio/gpio-wcd934x.c
> @@ -7,7 +7,7 @@
>   #include <linux/slab.h>
>   #include <linux/of_device.h>
>   
> -#define WCD_PIN_MASK(p) BIT(p - 1)
> +#define WCD_PIN_MASK(p) BIT(p)
>   #define WCD_REG_DIR_CTL_OFFSET 0x42
>   #define WCD_REG_VAL_CTL_OFFSET 0x43
>   #define WCD934X_NPINS		5
> 
