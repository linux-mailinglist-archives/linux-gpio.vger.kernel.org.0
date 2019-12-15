Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC1111F77C
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Dec 2019 12:50:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbfLOLup convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Sun, 15 Dec 2019 06:50:45 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44794 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfLOLup (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Dec 2019 06:50:45 -0500
Received: by mail-ed1-f67.google.com with SMTP id cm12so2711030edb.11;
        Sun, 15 Dec 2019 03:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=VQb8AJk5LNTjc5T1l/6wnDNHTC2CJyoRZWm9i8TCC6Y=;
        b=A0fe0YlK4Q7tH8msv7qbStmlJAgSVHaLyA5wWmFY4wDDzdrHTFZSOkJOjQaad8TbGK
         JHaqHb3o+P1UFdJWfDWdT9Dp3jdOEk1wUu678ZLU55u0vM/Tx298fLBtvInjD9UbggAD
         lWly1+sWanLAamCIdCwhlyF575Dgt+GugbEihslNuNIn+5pNwuHkWgBTXsJIvMjUYn7P
         hTW3028KguKQKFiwQqhVsAQ+HPI4wTIL90feHseKR+g0UPlPeRMyT2bAQ3zN9xUA4sBn
         TV9yzuQJhATJMMfgCzdzMpQE4kJPk/2Z5vNvitYGXhRYxupLZCX7NJ9J42X66gPSXlA4
         65cg==
X-Gm-Message-State: APjAAAUxWhQJEZPHI9s7cmUuoQEVpt3wrpy/K6ee6WYmaRI5HXPCt8C/
        1VYd2eHkL1azlZP8AqXU70A=
X-Google-Smtp-Source: APXvYqySGZN88GuNZI3q/4jIa46RYAeOm8r3e/4RoLEa9a1DPs6w4iZdHpCADlYueTiK1rOSy2zyGw==
X-Received: by 2002:a17:906:229b:: with SMTP id p27mr27526719eja.21.1576410643077;
        Sun, 15 Dec 2019 03:50:43 -0800 (PST)
Received: from kozik-lap ([194.230.155.234])
        by smtp.googlemail.com with ESMTPSA id bo13sm1007730ejb.5.2019.12.15.03.50.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2019 03:50:41 -0800 (PST)
Date:   Sun, 15 Dec 2019 12:50:39 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Chen Zhou <chenzhou10@huawei.com>
Subject: Re: [PATCH] pinctrl: samsung: Fix missing OF and GPIOLIB dependency
 on S3C24xx and S3C64xx
Message-ID: <20191215115039.GA30973@kozik-lap>
References: <1576221873-28738-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1576221873-28738-1-git-send-email-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 13, 2019 at 08:24:33AM +0100, Krzysztof Kozlowski wrote:
> All Samsung pinctrl drivers select common part - PINCTRL_SAMSUNG which uses
> both OF and GPIOLIB inside.  However only Exynos drivers depend on these,
> therefore after enabling COMPILE_TEST, on x86_64 build of S3C64xx driver
> failed:
> 
>     drivers/pinctrl/samsung/pinctrl-samsung.c: In function ‘samsung_gpiolib_register’:
>     drivers/pinctrl/samsung/pinctrl-samsung.c:969:5: error: ‘struct gpio_chip’ has no member named ‘of_node’
>        gc->of_node = bank->of_node;
>          ^
> 
> Rework the dependencies so all Samsung drivers and common
> PINCTRL_SAMSUNG part depend on OF_GPIO (which is default yes if GPIOLIB
> and OF are enabled).
> 
> Reported-by: Chen Zhou <chenzhou10@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/pinctrl/samsung/Kconfig | 6 ++++--

Applied.

Best regards,
Krzysztof

