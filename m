Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3D8165D37
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 13:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbgBTMFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 07:05:55 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40852 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbgBTMFx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 07:05:53 -0500
Received: by mail-wr1-f65.google.com with SMTP id t3so4312823wru.7
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 04:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z0vvlPPE+vtUh7ARyCdvaIb9a1HOM3y7M504uXCh/wc=;
        b=x63miHRikl8gYWEUkXxSkAwph1c9LntSaX7SnxaRAWsno52GtGklGstN18OM8xPQWs
         lYueTvr3Dzz87f+dW2+FqRwnFFLzFc+wqP3wSr0rzhThXZBqshbtHsgKCAvZIQ05ok/n
         6IjcQbtM2uCd9/nBUu/v1DHfGLIpjgb7l8cZi5BgzU6NXF+ZNuzIGdfHImVXm3Ud1LXN
         mAaqjrKFx7tpIUieP0R5STbF/SlwocIr9iBl5pNdBLEFZPDH7Z/FsJssZmVBBQlEy0Ob
         eKJKhWEFYR8GLgB4LPkBeYNQIT+tDsbXY/90sel+i3OWViAIZm+IGCDsiyV4AJy+bsvx
         3Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z0vvlPPE+vtUh7ARyCdvaIb9a1HOM3y7M504uXCh/wc=;
        b=BphWawpVShn5siqqbABBsyL+u+YWTVKA8dvFvT9M549i2tphxzj+DF/ltGAScrskPC
         PUQSMJdbFLBvazHTL9NiAEXYMqeSpC8UkEieiZ45B+v0ksNzNlLSuCVS8PG59KafCZp9
         xGJMROEKMoPWrt6uvkXM0PySH7eBfXeNKTgHT75egg69uGMo9ZUaeo99z+CyWDrcUe1t
         Z6gg2en8AwAgN7DjjI2bgDP3GYCbGi3whSbD/jP5d6pOoYop53dJWAs3bKw1zbHdGmEX
         Mjuj3Tvqik7bAciCvOoSjDv3die8oHZZoHXAWn4jc1KnhZPMvvNVufkyA6a2NGi5ILQ7
         G5fw==
X-Gm-Message-State: APjAAAWgRuUR3WQCSJp9AKHgvz06+lM77Ji5DtslRJC0ue9JdaCqRDrm
        KBXQ1HdxChoFe6NrxSIpjebRlg==
X-Google-Smtp-Source: APXvYqyB+oY/ge35t24bXWV6fvPSUKYqtt6iPcklGzSbb5LpcwrwIDdwymH2LuyKdlA9YKxVNh/WsQ==
X-Received: by 2002:adf:ec0d:: with SMTP id x13mr41779387wrn.400.1582200350410;
        Thu, 20 Feb 2020 04:05:50 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id v16sm4084878wml.11.2020.02.20.04.05.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2020 04:05:49 -0800 (PST)
Subject: Re: [PATCH v4 2/4] gpiolib: use kref in gpio_desc
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200220100141.5905-1-brgl@bgdev.pl>
 <20200220100141.5905-3-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5970b17a-b29b-154f-033e-6da007d6a289@linaro.org>
Date:   Thu, 20 Feb 2020 12:05:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200220100141.5905-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 20/02/2020 10:01, Bartosz Golaszewski wrote:
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -2798,6 +2798,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
>   		goto done;
>   	}
>   
> +	kref_init(&desc->ref);
> +

Should we not decrement refcount on the error path of this function?

--srini

>   	if (chip->request) {
>   		/* chip->request may sleep */
>   		spin_unlock_irqrestore(&gpio_lock, flags);
> @@ -2933,6 +2935,13 @@ void gpiod_free(struct gpio_desc *desc)
>   	}
>   }
