Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E787F399F7B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jun 2021 13:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhFCLHy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Jun 2021 07:07:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbhFCLHy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Jun 2021 07:07:54 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8361C06174A;
        Thu,  3 Jun 2021 04:06:09 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id l10-20020a17090a150ab0290162974722f2so3650915pja.2;
        Thu, 03 Jun 2021 04:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ENLbFd+69Y0nrnJCUItoGXO9C5A4sDHjRpfSagYL0Ko=;
        b=F5QtRXmZFb7NwQQkmFmgGvzp2WWX1Ixug6Zeg+t2AH9OnAcH+cl6GizbK1s3CMBlMD
         chxLoJM2z32lx0/iKvl5XTK/wS6JXauqD0bAh8+Mj7YO6kZGpa9VHS3PvhQfPcJLCe2F
         3S9szbHfuhTmTGaeJPHUQ+6xcQmEiKE6GAP/tzZm49HSSBzA17XM7F75jKYEBFgLI8p9
         mvXEdonE89fUt4FBkUZHApLur+tBGpzL5MLUvpiZH90iv3QpFg/4OeP1M7kzsikHl1d5
         Qgc3R4OWZvKBuPJT6OO/Li4zTeWcBpYqDqT5Lqxe5QJk/E3+yb5JnQIl7BACwXPXslNk
         ovSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ENLbFd+69Y0nrnJCUItoGXO9C5A4sDHjRpfSagYL0Ko=;
        b=qcMYfdYSwAEc2Z1oERxV0LIwuwVo2ue/7sUcdLfrpgKHACtasNQWNvM5s/g1QZPEn8
         jxO2TwnZ6VdLlsFZ4fVv23RD6JEljuCWbaEYm4fV828QLF4KjkyX+9YT9Deg8YGPiovC
         tfOLFFn1kTAvTcV/iXEdjNrrburgkOQM4pThfV0uQ+VQddbmUlrl4dwePG0TQmOkitQC
         6kKRnaAHkugoIxKJC9CMpEvj88sgnDnsFYrxgUN/SVnim7fooCO5u37ivdzHaTwSvEPa
         gEZDLG2c9blxEaO+QR2cVzv4CfmSfT5Ojx8JJHxjcOCKHsx0wP62U6DQVxMjdjOVZUeV
         c1MQ==
X-Gm-Message-State: AOAM531OJ7WNa8UF+3jVVGlgzKOAytXOQjZt2feH88tDarwmypd6BqhY
        tolOl0AUPP+GqMhaULkb4paKqJCMg9SvnkFx6LA=
X-Google-Smtp-Source: ABdhPJwdBL2z4L2+Wc/ypiCeWfr+P8eVqMmubLXTKRDec5XtGid3Q4+2xbH79lJMAgSDdFdV0ALw46qnoA/yXj0GJ4E=
X-Received: by 2002:a17:902:b205:b029:105:cb55:3a7a with SMTP id
 t5-20020a170902b205b0290105cb553a7amr17392850plr.17.1622718369356; Thu, 03
 Jun 2021 04:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210603101822.9645-1-steven_lee@aspeedtech.com> <20210603101822.9645-4-steven_lee@aspeedtech.com>
In-Reply-To: <20210603101822.9645-4-steven_lee@aspeedtech.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 3 Jun 2021 14:05:53 +0300
Message-ID: <CAHp75Vef0HDXAHzSNL-LtA0Sra6Zpivt513_+aFR_um0JeFkog@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] gpio: gpio-aspeed-sgpio: Add AST2600 sgpio support
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>, Hongweiz@ami.com,
        ryan_chen@aspeedtech.com, Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 3, 2021 at 1:19 PM Steven Lee <steven_lee@aspeedtech.com> wrote:
>
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins.
> In the current driver, the maximum number of gpio pins of SoC is hardcoded
> as 80 and the gpio pin count mask for GPIO Configuration register is
> hardcode as GENMASK(9,6). In addition, some functions uses the hardcoded

use

> value to calculate the gpio offset.
> The patch adds ast2600 compatibles and platform data that includes the
> max number of gpio pins supported by ast2600 and gpio pin count mask for
> GPIO Configuration register.
> The patch also modifies some functions to pass aspeed_sgpio struct for
> calculating gpio offset wihtout using the hardcoded value.

without

...

> +#include <linux/of_device.h>

Why?

...

> +#define GPIO_OFFSET(x)        ((x) & 0x1f)

GENMASK()

...

> +       pdata = of_device_get_match_data(&pdev->dev);

device_get_match_data()

I guess you may replace all those of_*() to the corresponding
device_*() or fwnode_*() calls.

-- 
With Best Regards,
Andy Shevchenko
