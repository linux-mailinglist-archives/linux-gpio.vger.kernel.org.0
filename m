Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B74F165CCA
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 12:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgBTLaN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 06:30:13 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:50467 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgBTLaN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 06:30:13 -0500
Received: by mail-wm1-f48.google.com with SMTP id a5so1609767wmb.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 03:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b+wRZx4HxDGTrVX8tv8l+pZ7aBqy+ZodwSNXn/rcfps=;
        b=TBS2FZQFdHQPJBKBayU/HF0d9fN58NVtxR1uvO2bBvuGfmJHWTdzf4F8/iWhU0C/M+
         qj7GLIUhnf7C6Dt0m6c6iI+cHl3kLZYOWUmzvMAJAnyvsJDkyzv0yInsSVCtM0rXYfDy
         OSUxFfQhGUluetVlrC/qNNSWkrbj2x/zQ+L05Utnguig/Sp+sVDyx9TJpPJPZvrTjV8o
         vIW4YXD6a2TATYcQ0WVoZRgvKC2v6h5MJ5ceR/BTYuVpjLWkWwa/4weTuZaRiBvP2UT0
         P3/uoYWu7xJDl0Twd9SrPjMxNgiOAWDCTBLeZAl9EPFCZtkVWnKsJkMAqKaqX1FDutev
         sAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b+wRZx4HxDGTrVX8tv8l+pZ7aBqy+ZodwSNXn/rcfps=;
        b=AGLv3O1EHhh0T9STVTOiTRwfgWdrbHkMN7v1QEv3ui5cHF1j6dUgqOZ7F2YSyxorSS
         BD3nzShYhXSVE1y9qHbR4GImp8Wo/6SmzorF9QlfY6nHA0VE+VrR0Oi8cRwYa8GRBdJw
         8AaE37HwPo5SJGyU3GYSHuHsZPe8eOA+1aZvrSPd21A5QraNT0mr7V95FnraTYChTHQX
         Ixwyzafua8u6QbWZGHJk4ncRBE8MdfH9bQ/YsDMQhlgwon10Ukd3cDtMgYWrMpx1LHX5
         VPTf1XB3ZNnzlyamEtm48Nwls/CBvLCA1wRdnGjsCdEqnmQ0d4PD1jGIkKYW0qvfyp9S
         oYDg==
X-Gm-Message-State: APjAAAX4951oxXG+3O4n/O9Kr71zckBOoODzHODC0eVtAOkNh4psrdO0
        Hq3Vfbg+G3+VjYJ2g1SbxZEc0g==
X-Google-Smtp-Source: APXvYqy9H3lwec8NoP9aUfbOc8xjm7ISPsnPY/kONVwgoe/MCMLyW08pjlXYrLYRa2DBeQz1u+A1lw==
X-Received: by 2002:a1c:41c4:: with SMTP id o187mr3937616wma.24.1582198211821;
        Thu, 20 Feb 2020 03:30:11 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id a9sm3997907wmm.15.2020.02.20.03.30.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2020 03:30:10 -0800 (PST)
Subject: Re: [PATCH v4 1/4] nvmem: fix memory leak in error path
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200220100141.5905-1-brgl@bgdev.pl>
 <20200220100141.5905-2-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <965f715c-a714-00df-b496-a586969dd086@linaro.org>
Date:   Thu, 20 Feb 2020 11:30:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200220100141.5905-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 20/02/2020 10:01, Bartosz Golaszewski wrote:
> -	if (IS_ERR(nvmem->wp_gpio))
> +	if (IS_ERR(nvmem->wp_gpio)) {
> +		ida_simple_remove(&nvmem_ida, nvmem->id);
> +		kfree(nvmem);
>   		return ERR_CAST(nvmem->wp_gpio);
You freed nvmem just before this statement, how can nvmem->wp_gpio be 
still be valid?

Are you able to test this changes at your end?
Or
these are just compile tested?


--srini


> +	}
>   
