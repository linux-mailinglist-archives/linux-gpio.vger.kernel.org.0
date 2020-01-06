Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A37A131C68
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 00:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgAFXe1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jan 2020 18:34:27 -0500
Received: from mail-yb1-f194.google.com ([209.85.219.194]:41972 "EHLO
        mail-yb1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbgAFXe1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jan 2020 18:34:27 -0500
Received: by mail-yb1-f194.google.com with SMTP id k5so3355030ybf.8;
        Mon, 06 Jan 2020 15:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i6ZQqWmrwDKkPcxO1fNBNQLxpWN7at6dkaHoHLXG/FE=;
        b=geKfekg2AYkPFwoL+zkcFP37gYi4SN66aSFdlWKKNHEPXoD0/xLQQbz2QkFjewBfte
         6WQxlawaDfZcNzBSfghgIYEs6r6QmPiACFlTLJxs0OrOAH3XgOXltQQ/HsyccKeAbufR
         4AAzq4DEPdIvfmzxhdMQHAffyHHBmXNsBeeg9RlcAJRyooskO5KqvkKaDUqD9HGuCcNQ
         kHOnLZ+Wwq5Ls8LHCFUXcOlLVIQfvuaB41L7foU5+rBWIiSVBiYCEySpgkfyXLVs6G4K
         kWWe67zN1rYORIG8yEW0t/tzJsKUVXcYefFRGDUCjT2fxAZzMukLLopmifc2Z1KKAJOh
         tpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i6ZQqWmrwDKkPcxO1fNBNQLxpWN7at6dkaHoHLXG/FE=;
        b=I9Yq6Jwl1UN5HeeL1AlaUOgYaH7PxbGPmZfydSQqoGCfAnoSXwDIrWzo6WjKBnYrvV
         k/rioB+CnoUkXomsvUaXR52fA6lnJgAziowotGNxcXI8fWd63FGHA5YpdElZxFcts6lV
         1Z4lp0dAHkFWKmX2cZZUzO2QLuGGlaOnDQ3axrsogSm94W8aOqfFCUTcxnzOwbQqNz8m
         DeYG0hu2lrtXAr+s+YnhFHiUWEudiYc+O+pzAgNXpmfsRoGhT+ktY8GvtGdVQ41KgPJ4
         nUmU3JZ8kHccUuALz/eQ/Y3Xufn8B7akPnwmsLnsSoJvoN5ZbfJo61zrhHqYsA1tFSud
         B18w==
X-Gm-Message-State: APjAAAXSv7S4W0nn/YZKrAG7iTbloRqZPR4RfpFGee2Eg0GytEB3BoHm
        8bPySU9IWBALxU8QWbC2gjA=
X-Google-Smtp-Source: APXvYqwMHCl1lzCPjwlP+ar3Pt7LLTuKABAPFh+LqxXL5zpHjj5nPlxbMKHogGRZzQfhkXPQAOxDPw==
X-Received: by 2002:a25:414a:: with SMTP id o71mr76395590yba.141.1578353666256;
        Mon, 06 Jan 2020 15:34:26 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id j11sm28215683ywg.37.2020.01.06.15.34.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 15:34:25 -0800 (PST)
Subject: Re: [PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191230133852.5890-1-geert+renesas@glider.be>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <db13664e-f01a-5492-942b-f021f1bbe4e2@gmail.com>
Date:   Mon, 6 Jan 2020 17:34:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191230133852.5890-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/30/19 7:38 AM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> As GPIO hogs are configured at GPIO controller initialization time,
> adding/removing GPIO hogs in Device Tree overlays currently does not
> work.  Hence this patch series adds support for that, by registering an
> of_reconfig notifier, as is already done for platform, i2c, and SPI
> devices.
> 
> Perhaps this would be better served through a pinctrl-gpio driver?
> Pinctrl is already working fine with DT overlays, as the pinctrl-*
> properties are part of the slave device node, and thus looked up at
> slave device node attachment time, not at pin controller initialization
> time.
> 
> In my particular use case (talking to SPI devices connected to a PMOD
> connector on the RSK+RZA1 development board), the GPIO performs board
> level muxing of a.o. the SPI MOSI/MISO/SCK signals.  Hence the hog
> really needs to be active only while talking to the SPI device, so the
> muxing could (in theory) be done upon demand.
> But how to describe that in DT, and implement it (using Runtime PM?)?

I'm trying to understand the use case.  I can easily imagine two cases:

  (1) want to configure the GPIO to be able to use the SPI bus sometimes,
      but configure the GPIO differently when not using the SPI bus

  (2) want to describe a device on the SPI bus in an overlay, thus
      also needing to describe the associate gpio hog node in the
      same overlay

For use case (2), the proposed patch seems to be a good solution.

For use case (1), this is a case of trying to use devicetree as a
way to control configuration instead of describing the hardware.
In this case, Bartosz' reply may indicate the way forward.

I'll assume use case (2) for patch comments.

> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (2):
>   gpio: of: Extract of_gpiochip_add_hog()
>   gpio: of: Add DT overlay support for GPIO hogs
> 
>  drivers/gpio/gpiolib-of.c | 133 +++++++++++++++++++++++++++++++++-----
>  drivers/gpio/gpiolib-of.h |   2 +
>  drivers/gpio/gpiolib.c    |  14 +++-
>  drivers/gpio/gpiolib.h    |   3 +
>  4 files changed, 133 insertions(+), 19 deletions(-)
> 

