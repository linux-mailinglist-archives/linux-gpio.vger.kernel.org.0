Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92AC520524F
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2020 14:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729534AbgFWMWo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Jun 2020 08:22:44 -0400
Received: from mout-p-202.mailbox.org ([80.241.56.172]:54972 "EHLO
        mout-p-202.mailbox.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727913AbgFWMWo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jun 2020 08:22:44 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 49rlm25JhGzQlHl;
        Tue, 23 Jun 2020 14:22:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001;
        t=1592914960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RYHSllEovlG/ggKWbzjoHZNr+XGOCzS41sbjd+LaIDQ=;
        b=k8rKfaM2yGBcX5Lh+/hvSyBCgDekndra36mbf6smBWLAmcq8PwBdQI7KwTFjsB8+lI5gQM
        4YodSwxtrdz22nviYR5io9boV6+kdaJYkYj8nz1kxFYSuQlZy7ETvynx4dIsA4LSBBK1dS
        mrQEJVTfxs+zwbzbs6mg0LLO54CGRu2r9/ZA9iE1dB1ZVVc0RPQz28Vo3XMWwSJCMpZ8Wh
        NJZXBZj2zf9TFP1tWbSDtMv0TODPKXzAE7gXRzerQifc/iOkvwkWUICwOqCE5AthJ3gySC
        m8xLcd6xKlZzAl7x9JOFVUxi8FXvO0qnQnUzz9gAc3/UJa1yB2ez+Gomp8ytxA==
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de [80.241.56.123]) (amavisd-new, port 10030)
        with ESMTP id tkqN7V3qW95u; Tue, 23 Jun 2020 14:22:39 +0200 (CEST)
Subject: Re: [PATCH] gpio: add GPO driver for PCA9570
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20200623060526.29922-1-mans0n@gorani.run>
 <80bbca9a625b2a0feb9b816906549b7c@walle.cc>
From:   Sungbo Eo <mans0n@gorani.run>
Message-ID: <2291c01d-30df-518e-a952-644bd955f1f3@gorani.run>
Date:   Tue, 23 Jun 2020 21:22:32 +0900
MIME-Version: 1.0
In-Reply-To: <80bbca9a625b2a0feb9b816906549b7c@walle.cc>
Content-Type: text/plain; charset=euc-kr; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 0
X-Rspamd-Score: -2.22 / 15.00 / 15.00
X-Rspamd-Queue-Id: 5F9161754
X-Rspamd-UID: 0b831e
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

On 2020-06-23 17:31, Michael Walle wrote:
> Hi Sungbo,
> 
> Am 2020-06-23 08:05, schrieb Sungbo Eo:
>> This patch adds support for the PCA9570 I2C GPO expander.
>>
>> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
>> ---
>> Tested in kernel 5.4 on an ipq40xx platform.
>>
>> This is my first time submitting a whole driver patch, and I'm not
>> really familiar with this PCA expander series.
>> Please let me know how I can improve this patch further. (Do I also
>> need to document the DT compatible string?)
> 
> Did you have a look at drivers/gpio/gpio-regmap.c ? Your driver seems
> to be simple enough to be easily integrated with that. If you need a
> blueprint; because at the moment there is no driver in the kernel
> using that, you could have a look at:
> https://lore.kernel.org/linux-gpio/20200604211039.12689-7-michael@walle.cc/

Thanks for your advice. I didn't really know what regmap is for...
It seems gpio-regmap is for gpio controllers having val/dir registers. 
But pca9570 does not use port registers. The master only sends a data 
byte without reg address. I'm not sure how to apply gpio-regmap or 
regmap-i2c here.
I'll try to investigate if setting reg_size or reg_bits to zero is possible.

Please correct me if I'm in the wrong direction.

Thanks.

> 
> -michael
