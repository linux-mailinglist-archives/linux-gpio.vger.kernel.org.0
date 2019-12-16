Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A06A1208DA
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 15:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbfLPOqD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 09:46:03 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40870 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728055AbfLPOqD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 09:46:03 -0500
Received: by mail-lf1-f65.google.com with SMTP id i23so4409982lfo.7;
        Mon, 16 Dec 2019 06:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8hrwNb+62xlSS4630TGqVTgZpEq9XuNM/h7RXL5PTp4=;
        b=JeX9P7d5K86kD8jxLP0OqYX0Xo7tQt3V7bahsEzimx4TzCVwClPFlR1qlAegLRv9r3
         p8si4pZeC0qzILFh9hYvpL75xyt2EuEUHmYq40odgPYB7fFdVDDRc7/E0Y9prfl5ZKSX
         ZAzBRUWj4mgKGDR60sKFlX5R5yuStVbhL5mwyjaAvTs+KxHi81GdWr0JtXqnbEq/oPxg
         W95/lZ8Uf2WuFbM25WYjm9l3PABEQOoX1Hbb5u7vzgLpx54F1dlY9qKrNXb2bE6WBlFr
         VOUYhlxkep9Ckt8hE950xvXYsYhSgMr2Pypq0rp6B4/fxv8QlzH9KyO9FRoh5IccS695
         +GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8hrwNb+62xlSS4630TGqVTgZpEq9XuNM/h7RXL5PTp4=;
        b=LNidchNzoHgItrXeplriLMvErObnG/Hs4HgkJ6nCxNASlcTmaFKuvAMQbggKtLpB4H
         BeNOCKd+XL4g22AgRPynGf11ydfv0vzsp3VcdAHtd0kSb6L3cUr/eRcBSYNHADcLUoa3
         d3QRJxjjI1v5hoSpHw7TaKRrNcxKwMuV8bKqyeedBzQ211nOp2A6SXcSFC132GFBNM81
         YRbbvTiIcivVZ7WomOs8I3QbxKEtDbhgl4H/wwLw9RVH/FpeCdeYEQTID5b6ibSZ1em3
         Xp4BnZM0Izx3N35TuG5OijNxeB4YDsbMY08NJWEJPovHcDdtTs7tag8UH2SrZKoWI4mz
         4Kfg==
X-Gm-Message-State: APjAAAXVahNZ99c1p5/5tl3LFoa35ZO3A5hC/7gzz2xB0iQVOSwTKyMr
        LQyJIJe4tDuAVfm0dAgIclA71bgr
X-Google-Smtp-Source: APXvYqxpUiYf76+8+R/J8+oxqzt6bKaYvjoUEm+LQ9lETcooxx3UqoSOQ5rP7pNrP6GB6JavMqdwKw==
X-Received: by 2002:a19:8a41:: with SMTP id m62mr16906210lfd.5.1576507560617;
        Mon, 16 Dec 2019 06:46:00 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id n23sm9158442lfa.41.2019.12.16.06.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2019 06:45:59 -0800 (PST)
Subject: Re: [PATCH v1 0/3] Tegra GPIO: Minor code clean up
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20191215183047.9414-1-digetx@gmail.com>
Message-ID: <b108c394-cdbc-e6c7-1688-69e05eea2279@gmail.com>
Date:   Mon, 16 Dec 2019 17:45:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

15.12.2019 21:30, Dmitry Osipenko пишет:
> Hello,
> 
> I was investigating why CPU hangs during of GPIO driver suspend and in
> the end it turned out that it is a Broadcom WiFi driver problem because
> it keeps OOB wake-interrupt enabled while WLAN interface is DOWN and this
> may cause a bit weird CPU hang on writing to INT_ENB register during of
> GPIO driver suspend. Meanwhile I also noticed that a few things could be
> improved in the driver, that's what this small series addresses.
> 
> Dmitry Osipenko (3):
>   gpio: tegra: Use generic readl_relaxed/writel_relaxed accessors
>   gpio: tegra: Properly handle irq_set_irq_wake() error
>   gpio: tegra: Use NOIRQ phase for suspend/resume
> 
>  drivers/gpio/gpio-tegra.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
> 

For the reference, here is the WiFi driver fix:

https://patchwork.ozlabs.org/patch/1209997/
