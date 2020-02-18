Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C4B16260B
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 13:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbgBRMY3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 07:24:29 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45022 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgBRMY3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 07:24:29 -0500
Received: by mail-wr1-f66.google.com with SMTP id m16so23646671wrx.11
        for <linux-gpio@vger.kernel.org>; Tue, 18 Feb 2020 04:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Re/qzEfuGmEmN6RxPFcJneNfN0qHMlxoSuOmrZrkTeU=;
        b=mj6hBil2iLdz+cczgouO2gaCmIfyVkInRXsS63E0gqDl4B2rgB7eJKkKlAn8UrA8Jz
         QA3NnNBnww3tlN+SGg3J8S88XZ0Nd2Ml46qTBv0yo3TIpxY4JK6ECGA5OHEWbJf3Yhec
         MoTVuiHP9ApF3jvvn4kX8uFX6DsrUc5dVHlhfTtnbtLlqmNmzpumdbSv2NZeD2Sc6p4n
         Re8n+947kCLJwb2+BMP54W84BLvP0rIzA+tAdgbOc7LL5wt+5YK86cnL6Rro373s7kNC
         PFQe3zFVnUcKl6s2yl5iEQw328dgKRlFcB/ZBSyB/Y32AbUHBeMhojH1kjSFnUTVlcBg
         gTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Re/qzEfuGmEmN6RxPFcJneNfN0qHMlxoSuOmrZrkTeU=;
        b=p9siW9a7uKjoj5BIlPDtfkFhFBMVytuQeOmB9iXbY1MSbsSPFVpZJSXf+qkdHfRpID
         rBdb96zdZAUBur0ckHhOSryN0ipAagB3bIx90+S1rbTNnHblxlDqoxS86YBXobskJA2H
         v/3c/P6FBiDUsnzDuOZ6wtiqLe9o6nJVNXISsy8jbG/3OW3eJZqnAUDOcgnml4338qxb
         3maHUhBewvqRvfY5JfcTcXnSG0xsNEK5pZYYS73RRkXsXigP0mWrudtTZJdC1E7OL3aU
         4Zlr+REBIPbesxbBj3pQBv2lvKrpaByefbu7ix+9pMCgG1vF95X+q0lvT2EwwC1ZGrs1
         CgCw==
X-Gm-Message-State: APjAAAX006sOkYvCM6iq3X4Bon1b4E+alvdHW0cCw1Q7vq2gyfpa+CYC
        fFRYPb8yDUlnPnAxJEFCTEnw4g==
X-Google-Smtp-Source: APXvYqxgTkUABQWZa4GKXpopxZNVDbhQPp/JsI03dbyF6i111bHEcaXHg9yi9TELKiIAhD0Vn4SAOA==
X-Received: by 2002:adf:a381:: with SMTP id l1mr28798603wrb.102.1582028667675;
        Tue, 18 Feb 2020 04:24:27 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id y6sm5890329wrl.17.2020.02.18.04.24.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Feb 2020 04:24:26 -0800 (PST)
Subject: Re: [PATCH v2 5/7] nvmem: release the write-protect pin
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <20200218094234.23896-1-brgl@bgdev.pl>
 <20200218094234.23896-6-brgl@bgdev.pl>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d2232172-f503-b7e4-a117-691ab2c480f4@linaro.org>
Date:   Tue, 18 Feb 2020 12:24:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200218094234.23896-6-brgl@bgdev.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 18/02/2020 09:42, Bartosz Golaszewski wrote:
> @@ -428,6 +429,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
>   	device_del(&nvmem->dev);
>   err_put_device:
>   	put_device(&nvmem->dev);
> +	gpiod_put(nvmem->wp_gpio);
>   err_ida_remove:
>   	ida_simple_remove(&nvmem_ida, nvmem->id);
>   err_free_nvmem:

This is also redundant as explained in my previous comments about release()

--srini


> -- 
