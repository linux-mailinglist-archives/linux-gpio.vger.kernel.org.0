Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC9AC32AD2E
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383844AbhCBV2R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:28:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1835141AbhCBSWm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Mar 2021 13:22:42 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E74C061221;
        Tue,  2 Mar 2021 10:22:02 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id h98so20896623wrh.11;
        Tue, 02 Mar 2021 10:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AQZcXfo9G8LYSteYT7WgoA4705B6+cwG5ceOPpfI2d4=;
        b=XIV83jFogb46lKfrgPuVxB/tFK0vWOCkKWI13X9lyiPtf8qEEBZWiTabOC9JOa3a7R
         qnBXcLYuM2xPstI1EcIVEvB6Fy6PiTw7alSXwFlPQdvIGLupwPXHwA5sUW1mpGGia3MH
         Se3qfIFC18lNh3Xk/UbrUnuEoc5R3iy07GGN7iSz4ue0IRBEt63iu8UtfGfMmWX4dw7Q
         tEuQuewux4gLQGBVstMpSd+zxg1mgo+3P4pqBjpcvG63V75KoP+0BhaBnqN99eKY7zZl
         jXm5ifxaKbY83wouO0baO1zyNtFtAaa+zCC9JNgwevOnJF3iRLxz2Px0nOXr8OB9M0wv
         qiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AQZcXfo9G8LYSteYT7WgoA4705B6+cwG5ceOPpfI2d4=;
        b=gPCTHe0dP4RRWaEMipJFGpwKhBNC40rCyKeqyY452pqAjPsD9J3PKHYL/t4QVGuoHB
         pV40tJkq8J3NHnQHQUpfh+xxnumA/qT/i1ySKmGn19pvehh7hfXQiGa88AkfmVH0ztn0
         FHC/ewHh/y+ivj72pMxj/mqRg1oKpJBSVSnnEHWZNhnxWQGwtV3Z4O8aBmWjWKKdA/P/
         bXr8okrELFvBZQLx+YSZrhQEcKDzpvWrlN3R866JX0l0j+Sn07XShlqkddrFbrRsYGaB
         J6JnzqoczSugRXKhm6KnMLa4yvvnIEVrDiQ5/p1plEXtClZJaThADC9v0d/LSXRcPgit
         6W3w==
X-Gm-Message-State: AOAM532Eo53g2U918qo4bNsKWD3AfvhB09v0Yh2ICgHW4oNCvOvAJNUi
        A1em6XOicFI4z1fKQbUeKuJZiteqGfMuzQ==
X-Google-Smtp-Source: ABdhPJzGv6nlyivrup6XRDHj9bD9muewR9tZMzPIZYbK67oH8JrdLMi+RfLEOQvPJhPoOPYtms6HHg==
X-Received: by 2002:adf:f3c2:: with SMTP id g2mr17115509wrp.300.1614709320670;
        Tue, 02 Mar 2021 10:22:00 -0800 (PST)
Received: from [192.168.1.10] (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id h2sm35071052wrq.81.2021.03.02.10.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Mar 2021 10:22:00 -0800 (PST)
Subject: Re: [PATCH] gpio: regmap: fix direction register check
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210302180621.12301-1-noltari@gmail.com>
 <c05bf9228206786a09f4f17160a2edf9@walle.cc>
From:   =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Message-ID: <bb5b8af1-6f7e-e2a0-0fcb-0de44447c1e6@gmail.com>
Date:   Tue, 2 Mar 2021 19:21:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c05bf9228206786a09f4f17160a2edf9@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

El 02/03/2021 a las 19:16, Michael Walle escribió:
> Am 2021-03-02 19:06, schrieb Álvaro Fernández Rojas:
>> If there's a direction register, we should also have dat or set 
>> registers.
>> However, we only need one of them, not both.
> 
> Can you give some more context or an example? If there is a direction
> register, we'd need to set and get the value, no?

I've just realized that I need to set reg_set_base to the same value as 
reg_dat_base in my case.
Please, ignore this patch and excuse me :$.

> 
> -michael
> 
>> Fixes: ebe363197e52 ("gpio: add a reusable generic gpio_chip using 
>> regmap")
>> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
>> ---
>>  drivers/gpio/gpio-regmap.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
>> index 23b0a8572f53..5a9fca00b5e8 100644
>> --- a/drivers/gpio/gpio-regmap.c
>> +++ b/drivers/gpio/gpio-regmap.c
>> @@ -194,7 +194,7 @@ struct gpio_regmap *gpio_regmap_register(const
>> struct gpio_regmap_config *config
>>
>>      /* if we have a direction register we need both input and output */
>>      if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
>> -        (!config->reg_dat_base || !config->reg_set_base))
>> +        (!config->reg_dat_base && !config->reg_set_base))
>>          return ERR_PTR(-EINVAL);
>>
>>      /* we don't support having both registers simultaneously for now */
