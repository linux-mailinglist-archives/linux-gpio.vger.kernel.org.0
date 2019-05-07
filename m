Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D54C16718
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2019 17:45:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbfEGPpE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 May 2019 11:45:04 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43976 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbfEGPpE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 May 2019 11:45:04 -0400
Received: by mail-wr1-f66.google.com with SMTP id r4so7733114wro.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 May 2019 08:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2V0KRw1X58VA1zYEdAPk5xBLtGjEZfqDlI4myBarUq4=;
        b=Yy5jMJ2ZIGJeG404RpP9WoYgNRTgrT7VYEhcrexMSkT2UlStHDAKro9YhHqIU9PMMQ
         Gj0SWTbwWOp4k85nkWe7AQCbG958G/t1/tkf7FGVNOnmc6lx6fmKUSQ725yVo6vlNQQr
         JUc02nMsvq2nbCmnvR0IpehTOl51duBRK4067ahnaSB7cu524DKutjAnFW6aOK0m1+2P
         joCLhf5ig8b2ig9oPswIWq/l35IWziGT4chI8F6xifOvS6ZmGwrZoxGQdqufYa+sluUY
         UbG4F25wQqcAbHbdKrTjr1aXfJYhXqcdlRPdNUnV3/MqAC+xOw5aW1Te1jyHXl/tNDh7
         CpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2V0KRw1X58VA1zYEdAPk5xBLtGjEZfqDlI4myBarUq4=;
        b=Wow2iy+xuH7gwVRxpT8R1DLcWh6wEIZUcfzqL8DEgU3JyeGd4E5H5F6+aPtZETv/Zx
         Eko9BGolQxpwxfzrhe8oWlmnCsR4aaBuIjB36e6HU2ddSA9/MZ9wHuriWFWysTn00u4f
         maevWjN932BcqfXNbGtcOx/nXCnWowEMESZ7yJXBYNKO09fAkYeLVwrS7MSe2y6wr2tM
         RLGB+FT9O5/bF4UEru2Jm1rHhrJPIi1Y3qfW0E+mFKKVGmIin6cmA7t7dF3CQjd6/hK6
         YOPYGy2c8BaL0fCHHq+/f0QzflqFHsSfm0xE/UvGU7L7yAPp38Ou6wVw0xWHvv3rxH48
         eReQ==
X-Gm-Message-State: APjAAAUa2nGMyh6YrNWomH5tQs9rjlmrpuxsbd0K7PFxU4JrKe0XcPSl
        moDLhgBoOamCook7rw49xN5hJA==
X-Google-Smtp-Source: APXvYqx1ZgBnmf0Vh3kreTWGa5/FxgkWxJQ/j0gdArM5OEkyd7Azus61oAFXyJvB3HAhrbHjJgvz7Q==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr18766060wrv.79.1557243902842;
        Tue, 07 May 2019 08:45:02 -0700 (PDT)
Received: from boomer.baylibre.com (uluru.liltaz.com. [163.172.81.188])
        by smtp.gmail.com with ESMTPSA id j71sm14285280wmj.44.2019.05.07.08.45.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 07 May 2019 08:45:02 -0700 (PDT)
Message-ID: <8c4776976c1803d4cd944d88dd73e2b414fe1201.camel@baylibre.com>
Subject: Re: [PATCH v3 0/6]  Add drive-strength in Meson pinctrl driver
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Guillaume La Roque <glaroque@baylibre.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
        khilman@baylibre.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 07 May 2019 17:45:00 +0200
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 2019-05-07 at 13:57 +0200, Guillaume La Roque wrote:
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
> 
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.
> 
> Cheers
> Guillaume
> 
> Changes since v2:
> - update driver-strength-uA property to be compliant with DT documentation
> - rework patch series for better understanding
> - rework set_bias function
> 
> Changes since v1:
> - fix missing break
> - implement new pinctrl generic property "drive-strength-uA"
> 
> [1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
> 
> 
> Guillaume La Roque (6):
>   dt-bindings: pinctrl: add a 'drive-strength-microamp' property
>   pinctrl: generic: add new 'drive-strength-microamp' property support
>   dt-bindings: pinctrl: meson: Add drive-strength-microamp property
>   pinctrl: meson: Rework enable/disable bias part
>   pinctrl: meson: add support of drive-strength-microamp
>   pinctrl: meson: g12a: add DS bank value
> 
>  .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
>  .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 177 +++++++++++++++---
>  drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
>  drivers/pinctrl/pinconf-generic.c             |   2 +
>  include/linux/pinctrl/pinconf-generic.h       |   3 +
>  7 files changed, 195 insertions(+), 48 deletions(-)
> 

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

