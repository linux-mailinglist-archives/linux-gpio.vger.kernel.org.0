Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF10E386BED
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 23:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244725AbhEQVI2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 17:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbhEQVI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 17:08:28 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DFCAC061573;
        Mon, 17 May 2021 14:07:11 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id k15so5482043pgb.10;
        Mon, 17 May 2021 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fvwCa/ubBLzeX/7d8+9X+a0dBuajeNXm8nbSPG0mS9Y=;
        b=O3Q3aQ4Zt/9uqTWJzpagiodmvTQyqZeRLeZAZYQs8mZmL0ufroj0377BS5DxMW+0ny
         92gOHZFqXo1dUC8uaQ0b2rV2e8+CQe2yCxaBNysn6qXv/HGIHUxjq5Uwsxx9fUjRNWAu
         49XP7DhSxFl5P8S6Y1SmXTmc0lXHWQ+gE2H1WPwsjObaTdtXKGE5+wJGzKWewPoTvwEE
         K7/EcrnQlMCpXv/YhldBeW2pJefPriPKpASOWi1rQEJFyfcZJRoMEW2X8XRiKeMdWaAq
         TwSHbKI7dsO0iHfkEdTJRH4bIy7Y2O+AJNjdQ8mRsewmPehpFgTJUVoAXWv/Yx6r/Aan
         pPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fvwCa/ubBLzeX/7d8+9X+a0dBuajeNXm8nbSPG0mS9Y=;
        b=oA+Lk50D/HgHs8U0RcZqXN4Xk22YLs6lINuCdZbdFppV1hIw1APM+kTlwkAehUDlYQ
         gDcsBqxzpRK3AoV9hQnpa7PP0F5i8cT11sMQUOKj6vRMNQTmMd2fX/tARva7RDV3PD+c
         PSU4cwBxKThjoumYOoeX+Ykx+ugmctznQifm3ZvCL/oARZcnWuGJ5RD54cN5UsYW9OIb
         UpvUNw/qJPa44tvXpCN6iD2dovNUilMdYtN35GUcabtPbjhpjJ0iYdmeHa7Om/v6NzEh
         a9LQjSEgpdNEunxXf7S+aW11M8Mzc8Vj8GKPwIRIQZyZXQyytACY+8xUaRtsFjykrVgp
         MK4g==
X-Gm-Message-State: AOAM530kmBgepZK5RratVNIqBfQA9X40PWgTfV+qmjPLy5mgLXCFqm6w
        vuSWtrhhOwbR+eK5ss61DQNOuh3WBfjI7s0qWkQ=
X-Google-Smtp-Source: ABdhPJxBiIqK/bVepbLXDd4Wc17eDDEkqJr94Fm8XACxVTC+y+Enl99k/mr0wLz5QCsH4PnWoSDgchEgZ4RIBLv9JGg=
X-Received: by 2002:a63:cd11:: with SMTP id i17mr1449215pgg.74.1621285630830;
 Mon, 17 May 2021 14:07:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
In-Reply-To: <d5f294489d31a80b69169f358da89bb7f70d1328.1621279162.git.sander@svanheule.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 00:06:54 +0300
Message-ID: <CAHp75VerNfUG1=VANDgFLchCmSG=DzoKN9DxHCoi2XxvcVBJcg@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] gpio: regmap: Add configurable dir/value order
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:
>
> GPIO chips may not support setting the output value when a pin is
> configured as an input, although the current implementation assumes this
> is always possible.

But it's broken hardware.
Can it be rather marked as a quirk?

> Add support for setting pin direction before value. The order defaults
> to setting the value first, but this can be reversed by setting the
> regmap_config.no_set_on_input flag, similar to the corresponding flag in
> the gpio-mmio driver.

-- 
With Best Regards,
Andy Shevchenko
