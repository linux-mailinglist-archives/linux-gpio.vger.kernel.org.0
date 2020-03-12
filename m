Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9291833B3
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2020 15:50:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbgCLOuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Mar 2020 10:50:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37339 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727072AbgCLOuO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Mar 2020 10:50:14 -0400
Received: by mail-wm1-f65.google.com with SMTP id a141so6648451wme.2;
        Thu, 12 Mar 2020 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=KgwBqCxOm5fc5xla7xbmlCmYs3pKxXy84zAoeYrTSMU=;
        b=KtbM0CsJqfnKD030oJhnT388atdN3aNDbHoLcz4WqWK8yHvZh+SzK3p7I+NzMlzm1G
         cKCFf0LzgOPaheQPbCEjA88+BC9E049T3aPmVe7mJ16aV8xmMIE0eSMn0xDxVlprTw1x
         7EAuTXr8+YJXZlchUU5gnThMbTWFBr8elzbij9eQzFuXhHveH3mi2S39H5BTo6hEJQ9x
         /xWCCyKYhzxT4idQ6LKWyC6GrUVnjaCzSCUmFqE0HNQfliwYVDQlRqbrVN0F2oxrzUi/
         nqr4H/v2C4DYAMc373ezPuOFkMF92ehlp1NvrvoEjIFER6JtAdwuYNkO7mCIEcqhcMVw
         TSvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=KgwBqCxOm5fc5xla7xbmlCmYs3pKxXy84zAoeYrTSMU=;
        b=p8Ge8bQ5m0NVsFywzcJxSPbr8Gi/GQQVykwUy0FAmmsZlTcpt9P2+u0rkjLcQfslcB
         EtKfpxeUwNuyzbbmdt+CL7vWbo7RSy+pZtdzISaMber0amVWw09fGyn0LYpZsR7YsJGq
         +wxLJ6h99Y2cCb48gDV1+VbyAHc1W7xG2dg9Tw4I50sTV4yOK09S0mSb3FthZdtAItAz
         Vz2REtAoKi59mJl5+I9qmgHksDunmJ7czYdGixDvQxxY+VNmwvJCW0n/fJzIauoqSlau
         f/0RDpLcDX02uHV12181isOOW3zOE9trcH71H8zD4mKlrdXTps7PxFhV6NZN8aJXqedP
         twIw==
X-Gm-Message-State: ANhLgQ3tdOFok33oTLdJ49nRiGlcPXFPKW+rWFaVzhyBSzp457DK+wkl
        C9TAt+ODgPBO23NsizDfv6827C/1QC5Tlg==
X-Google-Smtp-Source: ADFU+vueEc6glpOHQAsUEr+s9w9p1qUpl2mh6k7ue+hbfGO87gIaY3N/ZhtWyrsPrAe6gdxWlSKZfQ==
X-Received: by 2002:a05:600c:2214:: with SMTP id z20mr4995006wml.57.1584024611731;
        Thu, 12 Mar 2020 07:50:11 -0700 (PDT)
Received: from [10.7.1.8] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id a5sm12376623wmb.37.2020.03.12.07.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 07:50:11 -0700 (PDT)
Subject: Re: [PATCH v2] gpio-hammer: Avoid potential overflow in main
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200312144015.1848245-1-gabravier@gmail.com>
From:   Gabriel Ravier <gabravier@gmail.com>
Message-ID: <0e3a171e-fd85-4832-d4af-15abf4c1f5fe@gmail.com>
Date:   Thu, 12 Mar 2020 15:50:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312144015.1848245-1-gabravier@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 3/12/20 3:40 PM, Gabriel Ravier wrote:
> If '-o' was used more than 64 times in a single invocation of gpio-hammer,
> this could lead to an overflow of the 'lines' array. This commit fixes
> this by avoiding the overflow and giving a proper diagnostic back to the
> user
>
> Signed-off-by: Gabriel Ravier <gabravier@gmail.com>
> ---
>   tools/gpio/gpio-hammer.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> index 0e0060a6e..d0be21af1 100644
> --- a/tools/gpio/gpio-hammer.c
> +++ b/tools/gpio/gpio-hammer.c
> @@ -135,7 +135,14 @@ int main(int argc, char **argv)
>   			device_name = optarg;
>   			break;
>   		case 'o':
> -			lines[i] = strtoul(optarg, NULL, 10);
> +			/*
> +			 * Avoid overflow. Do not immediately error, we want to
> +			 * be able to accurately report on the amount of times
> +			 *'-o' was given to give an accurate error message
> +			 */
> +			if (i < GPIOHANDLES_MAX)
> +				lines[i] = strtoul(optarg, NULL, 10);
> +
>   			i++;
>   			break;
>   		case '?':
> @@ -143,6 +150,14 @@ int main(int argc, char **argv)
>   			return -1;
>   		}
>   	}
> +
> +	if (i >= GPIOHANDLES_MAX) {
> +		fprintf(stderr,
> +			"Only %d occurences of '-o' are allowed, %d were found\n",
> +			GPIOHANDLES_MAX, i + 1);
> +		return -1;
> +	}
> +
>   	nlines = i;
>   
>   	if (!device_name || !nlines) {

Just noticed that there isn't a space before the "'-o'" in the third 
line of the explanatory comment in the first part of the patch, will 
send a third version of the patch with a space before the "'-o'"

