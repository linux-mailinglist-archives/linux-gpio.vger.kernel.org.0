Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE7C1FA9D6
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 09:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbgFPHSm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 03:18:42 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:38163 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFPHSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 03:18:41 -0400
Received: by mail-ej1-f66.google.com with SMTP id w16so19813543ejj.5;
        Tue, 16 Jun 2020 00:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tT4lPCOqC8m2jN6E8L7uFkNVDR9AvY5WZewZRGKHN3k=;
        b=eNMAtj8JqGE+DAXcm+nxXOPyOQyvAunnTk1brzsxBrcw6NGuj/z6a0yUiPsqJqH3lC
         xXdA2CmfxIxH0iDGAUSUWk1lM32F23unbpltsKO6aIuhcjnsUvgO6hUbNJlGeUyy+8gE
         FkPn6UmP1KIqSnlAk/NI26Zfg5GQr4S4xJ6LTqbX0dmLIKfilBoEDYUdlcIDGnWO/irF
         oFPIz/4Sl9Yx5TDtG+jGsS644lbWNEcti8Sg5Jx9SqYKYZkbyyAj0OV++yZpBqQxnguP
         Y0vHOZAnna7biuE2ewRTN8JQa8E1eOQfkI3W8oCvuT8rtcBdh0IGVx4ON5nBLSAjUnRQ
         046Q==
X-Gm-Message-State: AOAM5339TTOStu08Fatz5a3of2/oWo897okS6EInSS4NSEEtCUw8zG6F
        PbrHxthZ8jKGhojCqELha/E=
X-Google-Smtp-Source: ABdhPJxDifyRwf13/EjaihQm5vJnlZB+OKK9ORGdXYCRlY5yhWD2VfzUsTFNIEnVJ1d/pJH4EtKjtQ==
X-Received: by 2002:a17:906:fcae:: with SMTP id qw14mr1563379ejb.166.1592291919788;
        Tue, 16 Jun 2020 00:18:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
        by smtp.googlemail.com with ESMTPSA id js3sm10651179ejb.65.2020.06.16.00.18.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 00:18:39 -0700 (PDT)
Date:   Tue, 16 Jun 2020 09:18:37 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3] pinctrl: samsung: Use bank name as irqchip name
Message-ID: <20200616071837.GB20282@kozik-lap>
References: <CGME20200610194107eucas1p1b22f0c8e3e13551940efd6093df505a3@eucas1p1.samsung.com>
 <20200610194052.6434-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200610194052.6434-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 10, 2020 at 09:40:52PM +0200, Marek Szyprowski wrote:
> Use the bank name as the irqchip name. This name is later visible in
> /proc/interrupts, what makes it possible to easily identify each
> GPIO interrupt.
> 
> /proc/interrupts before this patch:
> 143:    0     exynos4210_wkup_irq_chip   7 Edge      hdmi
> 144:    0     exynos4210_wkup_irq_chip   6 Level     wm8994
> 145:    1     exynos4210_wkup_irq_chip   7 Edge      max77686-pmic, max77686-rtc
> 146:    1     exynos_gpio_irq_chip   3 Edge      3-0048
> 
> /proc/interrupts after this patch:
> 143:    0     gpx3   7 Edge      hdmi
> 144:    0     gpx3   6 Level     wm8994
> 145:    1     gpx0   7 Edge      max77686-pmic, max77686-rtc
> 146:    1     gpm2   3 Edge      3-0048
> 
> Handling of the eint_wake_mask_value has been reworked, because each bank
> has now its own exynos_irq_chip structure allocated.
> 

Thanks, applied.

Best regards,
Krzysztof

