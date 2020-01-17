Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96D271407F9
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2020 11:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgAQK3x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jan 2020 05:29:53 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36496 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgAQK3t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jan 2020 05:29:49 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so22179459wru.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2020 02:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DOIA++XmF6OyZ+xJ0lY66rXDIlkVTtzTfAaf0LOOQ1o=;
        b=Xb7jsAG4oxcPA6iqvvPHBejNoZD3ixcE1P7FFfAWMOFCYOecir8AoZxadglct5QZzz
         +kYIkbIdbrLP+kbIoh4Jmded4VwWeRIJUti3YFU99iBNV2kFsk8vqTmfBtF62LtkXcQL
         /AlK2k6GG1W6LNcGZB0aDRL2bgjv6GLc72xXScbAk+WwiUe813irDjP7P1IIcEiZVVGO
         lntkdPynhRqUjeelMlTt3QeLMf5hV/3RN9LgmC364p0qgCbqS8u8JKhAHeXK32EbDCcq
         wSG0tep/eGptdF43TSgp3Z9kpenvo5ZHoqxYI9rkTKyA8ONccfFtZo899CCEiZhXh50j
         ZbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DOIA++XmF6OyZ+xJ0lY66rXDIlkVTtzTfAaf0LOOQ1o=;
        b=CtGjax5GzcfhgBSEkNCWTQsDwbZUewWebXaEQH+pVsQ5S+nXP6DHZgt0Y5xjM/2xF3
         ABzzhyJT4fEmmSO+9+utqQNdcQAa8hvFu2Pyx2JsOjoiT0BY/qUhvwZ2YhxJyOjZa6Xl
         nLkIzJ6KG+UFS7lrR1pZMXthMjCqXBlsJR8NvMzjZMZIxiqNtLRQc7w4y/F4KpzYgb51
         0M1YFk5u2HUraoKxaFTLn5EDUSKxVhlWFBtU6aCfgsm+lHpy0+/HWx/v2Mg6U0np+L74
         G2iBQ/OSlSIYu0sdma6jIIR3ntkTOM/viYCp0cPjlOusDc9osZxtOtHcUimL4rTSwaAD
         1Xjg==
X-Gm-Message-State: APjAAAUTchgUGYMyhW/xaBvGFttvJ5wMRuCK5ffOIiRGTYzqSqcmFe6A
        5peDwLTYgK1rga6wERpxj0ov+A==
X-Google-Smtp-Source: APXvYqyysOghdjks2ZZq2mPn4v8bkghYktQBOMyUrmyJQgRrwylds4oDKajBTuXW95Oob9msRS+enA==
X-Received: by 2002:adf:f288:: with SMTP id k8mr2385882wro.301.1579256987204;
        Fri, 17 Jan 2020 02:29:47 -0800 (PST)
Received: from dell ([2.27.35.221])
        by smtp.gmail.com with ESMTPSA id k13sm33250982wrx.59.2020.01.17.02.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 02:29:46 -0800 (PST)
Date:   Fri, 17 Jan 2020 10:30:00 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v10 00/13] Support ROHM BD71828 PMIC
Message-ID: <20200117103000.GG15507@dell>
References: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1579249511.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 17 Jan 2020, Matti Vaittinen wrote:

> Patch series introducing support for ROHM BD71828 PMIC
> 
> ROHM BD71828 is a power management IC containing 7 bucks and 7 LDOs. All
> regulators can be controlled individually via I2C. Bucks 1,2,6 and
> 7 can also be assigned to a "regulator group" controlled by run-levels.
> Eg. Run level specific voltages and enable/disable statuses for each of
> these bucks can be set via register interface. The buck run-level group
> assignment (selection if buck is to be controlled individually or via
> run-levels) can be changed at run-time via I2C.
> 
> This patch series brings only the basic support for controlling
> regulators individually via I2C.
> 
> In addition to the bucks and LDOs there are:
> 
> - The usual clk gate
> - 4 IO pins (mostly usable as GPO or tied to specific purpose)
> - power button support
> - RTC
> - two LEDs
> - battery charger
> - HALL sensor input
> 
> This patch series adds support to regulators, clk, RTC, GPIOs and LEDs.
> 
> Power-supply driver for charger is not included in this series.
> 
> The series also adds LED DT-node lookup based on node name or given
> property name/value pair in LED core. It also adds generic default-state
> and default-trigger property handling to LED core. Follow-up patches
> simplifying few other LED drivers should follow.
> 
> Changelog v10:
>   - Split RTC patch to a BD70528 fix (which hopefully goes to 5.4) and to
>     BD71828 support

Still missing LED Acks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
