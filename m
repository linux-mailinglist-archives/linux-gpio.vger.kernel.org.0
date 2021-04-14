Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD4835F6E4
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Apr 2021 16:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347203AbhDNOyv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Apr 2021 10:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232236AbhDNOyW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 14 Apr 2021 10:54:22 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F785C06138C
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 07:53:49 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id u21so31857744ejo.13
        for <linux-gpio@vger.kernel.org>; Wed, 14 Apr 2021 07:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lQCWxHZnV1Gsxd6nL87+Rov9CtR0ildCnHkDFpAdqA8=;
        b=RzVgUsHI9DYU2E1aztKM+c0Ge9sIJht3Kkwujrb62Ob686bFZJ+cjSDN0f0hFQBf5u
         n1s6gr0E/Nc6KpjTljw3HBvsbKT8FnPLZjvaRDN4MQtmM3nTjFzhz8oM5iu41H3v99+c
         Dc0lFtKy2TbnBlB9D40PIVD5C/S6cf38nveM4O75XvLbcq0hx5zXzGfdetztvCIUWPQj
         GuFo5jCuK9R8JwNKV5HlRNs6rXKtpeIV/sHixMIf4KDhuWMgDm/pEKfYcr+Hl7MDyR4H
         Fegzpr6+SwZ3bzNY3BjRgBLSeTuEVT/cqztgrYsekOsXEx3mDK+V4Qh/gBGJYgJUQZp1
         5wmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lQCWxHZnV1Gsxd6nL87+Rov9CtR0ildCnHkDFpAdqA8=;
        b=FwhOceQiV87w/kvY3oeUMh1PuXa7aY0f6ZNKf4VCpEhDk28XQ0Kn3JUgQ/QFDqK6B6
         hM4AHG5A/sSD1fe9XGiSWhYG1v7eH9gmZjO38Y8c0x7IIHwjAKjpgw/CrdJOekjyhRf/
         eRmiJLUJipQG6Mgu2/0VpCjlkPqmFJ4UdE1LaDOuI7xfGgQlp1UhtAXRYpn/PlOpp21C
         RpdXeXt9ZQMwn7otaX8VhGL4syxmxqM1yArcU9J4E26OBE6jnyQZ3CAKnCkIzhHTEMZQ
         TmZ2N84IVHWY/Kmfa39AP4NbN+iO2ysgXi9vM05KhaXETNvv7aKGopq0GkFNoaZPs4Jr
         wyVA==
X-Gm-Message-State: AOAM531t6wXBmiSM6tJT781ZxI8qCSc4VXRgbGtyHLffA7NyNCo3Kdvj
        GDANbDqMZRxexHeg07mVZVBN6Q==
X-Google-Smtp-Source: ABdhPJyn9cPrILjzA9mfvJ93gUdjDRlCcFQWzEmSXjJQE7qWp4eagrpW18JkJldIvNRpFyq0HxpB1w==
X-Received: by 2002:a17:906:7fd3:: with SMTP id r19mr12751694ejs.286.1618412028371;
        Wed, 14 Apr 2021 07:53:48 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id cy5sm12288123edb.46.2021.04.14.07.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:53:47 -0700 (PDT)
Date:   Wed, 14 Apr 2021 15:53:45 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD, Clock, GPIO, Regulator
 and RTC due for the v5.13 merge window
Message-ID: <20210414145345.GO4869@dell>
References: <cover.1617616855.git.matti.vaittinen@fi.rohmeurope.com>
 <20210414131158.GN4869@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210414131158.GN4869@dell>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 14 Apr 2021, Lee Jones wrote:

> Please note that this PR will break your build unless you have the
> required Regulator API update.
> 
>  fb8fee9efdcf0 regulator: Add regmap helper for ramp-delay setting
>  e3baacf542756 regulator: helpers: Export helper voltage listing

Looks like Mark has these:

 git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator regulator-list-ramp-helpers
 
> Pull at your peril! :)
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-clk-gpio-regulator-rtc-v5.13
> 
> for you to fetch changes up to 5a8a64d9a38b9d3794f9f5e153fc0358b858cc24:
> 
>   MAINTAINERS: Add ROHM BD71815AGW (2021-04-14 10:21:43 +0100)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD, Clock, GPIO, Regulator and RTC due for the v5.13 merge window
> 
> ----------------------------------------------------------------
> Matti Vaittinen (16):
>       rtc: bd70528: Do not require parent data
>       mfd: bd718x7: simplify by cleaning unnecessary device data
>       dt_bindings: bd71828: Add clock output mode
>       dt_bindings: regulator: Add ROHM BD71815 PMIC regulators
>       dt_bindings: mfd: Add ROHM BD71815 PMIC
>       mfd: Add ROHM BD71815 ID
>       mfd: Sort ROHM chip ID list for better readability
>       mfd: Support for ROHM BD71815 PMIC core
>       gpio: Support ROHM BD71815 GPOs
>       regulator: rohm-regulator: linear voltage support
>       regulator: rohm-regulator: Support SNVS HW state.
>       regulator: bd718x7, bd71828: Use ramp-delay helper
>       regulator: Support ROHM BD71815 regulators
>       clk: bd718x7: Add support for clk gate on ROHM BD71815 PMIC
>       rtc: bd70528: Support RTC on ROHM BD71815
>       MAINTAINERS: Add ROHM BD71815AGW
> 
>  .../devicetree/bindings/mfd/rohm,bd71815-pmic.yaml | 201 +++++++
>  .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml |   6 +
>  .../bindings/regulator/rohm,bd71815-regulator.yaml | 116 ++++
>  MAINTAINERS                                        |   3 +
>  drivers/clk/clk-bd718x7.c                          |   9 +-
>  drivers/gpio/Kconfig                               |  10 +
>  drivers/gpio/Makefile                              |   1 +
>  drivers/gpio/gpio-bd71815.c                        | 185 ++++++
>  drivers/mfd/Kconfig                                |  15 +-
>  drivers/mfd/rohm-bd71828.c                         | 486 +++++++++++----
>  drivers/mfd/rohm-bd718x7.c                         |  43 +-
>  drivers/regulator/Kconfig                          |  11 +
>  drivers/regulator/Makefile                         |   1 +
>  drivers/regulator/bd71815-regulator.c              | 652 +++++++++++++++++++++
>  drivers/regulator/bd71828-regulator.c              |  51 +-
>  drivers/regulator/bd718x7-regulator.c              |  60 +-
>  drivers/regulator/rohm-regulator.c                 |  23 +-
>  drivers/rtc/Kconfig                                |   6 +-
>  drivers/rtc/rtc-bd70528.c                          | 104 ++--
>  include/linux/mfd/rohm-bd71815.h                   | 562 ++++++++++++++++++
>  include/linux/mfd/rohm-bd71828.h                   |   3 +
>  include/linux/mfd/rohm-bd718x7.h                   |  13 -
>  include/linux/mfd/rohm-generic.h                   |  15 +-
>  23 files changed, 2286 insertions(+), 290 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71815-pmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.yaml
>  create mode 100644 drivers/gpio/gpio-bd71815.c
>  create mode 100644 drivers/regulator/bd71815-regulator.c
>  create mode 100644 include/linux/mfd/rohm-bd71815.h
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
