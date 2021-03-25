Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40DD8348E0E
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Mar 2021 11:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbhCYKcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 06:32:17 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:34455 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbhCYKcN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 06:32:13 -0400
Received: by mail-lj1-f176.google.com with SMTP id f16so2481863ljm.1;
        Thu, 25 Mar 2021 03:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=faLPl7dFJfBc9wUMKlika3avN8VfJYiGHtpkcOchfg4=;
        b=EaNSFVkM5bnjFgnu1+AE0QvqIq3rlgy3R05hOiUiKJgyAW4WdTe4vPgOceOG5qSGi/
         oidAa40y/FZHfzvfqAsED04ynUlx+AWRxs2R0WYzH5k2hBiNo3+GGIWQnqLmReAc/KxD
         D1V5uDCkKV2luRxIpDUx0p2cHi1QhYYEQY4qsDfB8XKt+YNpLG6UYY0YkXVemk1ixoms
         XUN2p5iqn1oAaOSm/7rowm73oLdPvS/IEkW+RrfKT7RPEpBXF6FMnbs52rIhLZJ9uzCd
         1Mp5Xhe7aTbitZQxQAlqwG88qsd8yCzYcPG363sz9G04HUdB6urUdg+rI7ziym0xKh5b
         acZg==
X-Gm-Message-State: AOAM531sfnIrN1ZmTHdRu7jZJKYq9YiqByMgx5jk17FkCgMfdwYZly0t
        utq8+ohqkGnH9pyGyCwZTzQ=
X-Google-Smtp-Source: ABdhPJzLlwtpNHVd/GL3u2kyRHuWUfHkpqqpTtdCWSkei4+bFaw0r1J/K2urn0pBPteK1WSfjLlNyQ==
X-Received: by 2002:a2e:8e33:: with SMTP id r19mr5091616ljk.40.1616668331621;
        Thu, 25 Mar 2021 03:32:11 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id p10sm727834ljg.99.2021.03.25.03.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 03:32:11 -0700 (PDT)
Message-ID: <c5a4ef7341b5b0b56d1ad950867828463cfdb7fc.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 09/16] gpio: support ROHM BD71815 GPOs
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-power@fi.rohmeurope.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
In-Reply-To: <CACRpkdZnrkiYGaOTZLvCnp72WYiV0+YhCe+TbMjN_3CLyJHvgA@mail.gmail.com>
References: <cover.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <b2164e5965218f270e17bf29e00ad5c5a0b54bcf.1616566395.git.matti.vaittinen@fi.rohmeurope.com>
         <CACRpkdZnrkiYGaOTZLvCnp72WYiV0+YhCe+TbMjN_3CLyJHvgA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 25 Mar 2021 12:32:04 +0200
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus,

On Thu, 2021-03-25 at 10:35 +0100, Linus Walleij wrote:
> On Wed, Mar 24, 2021 at 8:29 AM Matti Vaittinen
> <matti.vaittinen@fi.rohmeurope.com> wrote:
> 
> > Support GPO(s) found from ROHM BD71815 power management IC. The IC
> > has two
> > GPO pins but only one is properly documented in data-sheet. The
> > driver
> > exposes by default only the documented GPO. The second GPO is
> > connected to
> > E5 pin and is marked as GND in data-sheet. Control for this
> > undocumented
> > pin can be enabled using a special DT property.
> > 
> > This driver is derived from work by Peter Yang <
> > yanglsh@embest-tech.com>
> > although not so much of original is left.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> > Changes since v3:
> >   - No changes
> 
> This looks OK to me:
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> It could potentially (like the other Rohm GPIO MFD PMIC drivers)
> make some use of the gpio regmap library, but we have some
> pending changes for that so look into it after the next merge
> window.
> 
> I.e. for your TODO: look at the GPIO_REGMAP helper.

I just took a quick peek at gpio_regmap and it looks pretty good to me!

Any particular reason why gpio_regmap is not just part of gpio_chip? I
guess providing the 'gpio_regmap_direction_*()', 'gpio_regmap_get()',
'gpio_regmap_set()' as exported helpers and leaving calling the
(devm_)gpiochip_add_data() to IC driver would have allowed more
flexibility. Drivers could then use the gpio_regamap features which fit
the IC (by providing pointers to helper functions in gpio_chip) - and
handle potential oddball-features by using pointers to some customized
functions in gpio_chip.

Anyways, definitely worth getting familiar with! Thanks for the pointer
:]

Best Regards,
	Matti Vaittinen


