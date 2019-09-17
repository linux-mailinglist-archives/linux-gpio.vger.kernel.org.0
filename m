Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42618B48B5
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2019 10:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404599AbfIQIB3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Sep 2019 04:01:29 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35849 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbfIQIB3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Sep 2019 04:01:29 -0400
Received: by mail-pf1-f194.google.com with SMTP id y22so1678663pfr.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Sep 2019 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dkEUIvmS8tr/QojssxHkjdXtwoJNpWyyknG08OPZInc=;
        b=xVBQtHvuHdP1/wq9BxPRYvPf7kgQg+WyQDDSbVqDjHMp2VZugwIwKW4fIZKR7PC2CU
         M/Tl4qoBXc46wzxw4X61CWs5Ss81y44l8AC+RME49uGzRFZKtddBPLfWxXBr76KZyf+h
         Xm8DJJuBhYN7X93Yd78jgbKPTsAfGNebkCNFN8Tta1wT13hBIy7J/afwOJLaxw5stA1V
         AARgGLkr+2YePp/ZNCjc3gest6wjc8Q0cUvEMshF6iYnXnypfGmz5pue9fUkTwsQpawE
         ntMLB11Cr/tNqG5gHT2Xiel57mbjf0Vpvk6PXOdTCQlVGLCZmH1Kt3VyJdoApeSLOExE
         7S/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dkEUIvmS8tr/QojssxHkjdXtwoJNpWyyknG08OPZInc=;
        b=ViR3GjQu4ao9ZcI4sRwyRvXBQ43YJMMJyBKpaX4iGaL+Dhgid5uKdNKTJeKavcvpej
         ha1asL0gcB6HXHgyAuQ+iS7TYdYfcuj7u2aApyNTQ6FWSNIDBUAypeiWbaMJf6GiT+IV
         6AYmbr00p7IaNM8+gcGXrtWbU5AawlMUhkTaFJNUxaVTpDRrlH2d2q81XLm8KVWue2j2
         P/KLSzn8etyRiojRo/VVBEH4dIigrcebsnXMRhQQn0v5qfbelWWLuznqwBFFWK1sLp3M
         og2si7DCV8YJqLenZeq+jrTuB09a+AvJork2V2PiAaz646UvbDic3nSECIKQm7Azw+fa
         2vlg==
X-Gm-Message-State: APjAAAWJTIiRC9dN6ITaIde3oghE2wI2Vv13yfNuSEAVD9OyLrp5pznM
        Yonuai7aIVJFxHM7yUfoFv8FQw==
X-Google-Smtp-Source: APXvYqy9BpSstau/ISYVY+XZnmuF6RFpG3Q0pouMw3u8iYn2Du2QyJi/zsa8bBgAv1Ma9DBrJSSucA==
X-Received: by 2002:a63:b954:: with SMTP id v20mr2159509pgo.140.1568707288628;
        Tue, 17 Sep 2019 01:01:28 -0700 (PDT)
Received: from localhost ([122.172.73.172])
        by smtp.gmail.com with ESMTPSA id d14sm3787864pfh.36.2019.09.17.01.01.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 01:01:27 -0700 (PDT)
Date:   Tue, 17 Sep 2019 09:01:25 +0100
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 3/6] pinctrl: spear/plgpio: Pass irqchip when adding
 gpiochip
Message-ID: <20190917080125.cetmoif7vszyrjnm@vireshk-mac-ubuntu>
References: <20190913113530.5536-1-linus.walleij@linaro.org>
 <20190913113530.5536-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913113530.5536-3-linus.walleij@linaro.org>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 13-09-19, 13:35, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
> 
> For chained irqchips this is a pretty straight-forward
> conversion.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/spear/pinctrl-plgpio.c | 47 ++++++++++++--------------
>  1 file changed, 21 insertions(+), 26 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
