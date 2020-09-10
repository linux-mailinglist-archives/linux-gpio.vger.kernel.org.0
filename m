Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055592639DB
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Sep 2020 04:08:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIJCIK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Sep 2020 22:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730359AbgIJCDq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Sep 2020 22:03:46 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC7DC0617A4;
        Wed,  9 Sep 2020 19:02:40 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b12so4641229edz.11;
        Wed, 09 Sep 2020 19:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=142NeoCcx3wHhBUQEiqLvgYqCFhcu9mCRWA11xQEdVg=;
        b=nBsz6061VcS6cYSgt5yHM+R707WWE5ZZd412JS1mVQWo22/CqWZA4jbCYWRRKRySc5
         LstyfExbNbtK4mWp/VqaQIk0dnYfPY8Gyv2JmR7CDjI6X5l81dgMIb40FSENPz8VrftB
         erSBKmbxWGVQJ3/4S7wPVYfmwN/IPSDi5dyvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=142NeoCcx3wHhBUQEiqLvgYqCFhcu9mCRWA11xQEdVg=;
        b=LK4y8pH3Yg9eFgjT1zJnjVW0rWdZi82nddP8HNFktXMVPU2mRPIVqa8o1BiL8Zy/kC
         ApM+9XEL2+BUG5XoPtAOEB+kRZ57TfdvzbTkgWMW27oewpPMAHoOYjFjjWfz//ZErcUW
         y1NrCoYaOWyI/AYOmEw1sjmdwj4dDdoAx42oNffUmaJtqzmZMolG3JOptnW8OSchDAkR
         vUVN4IHj4woCdqMmMezhreYLyQWEpQkuu0t0ZB/3mSG07gRf9jF3PbLv6+K6R+p4P90+
         QtXqNxFh/AH8bhbAzsDI4/GML/BZQO7I9JZVs89Iuk7xdSMwEK88hmhYFE+Qd4BikfSO
         JP5Q==
X-Gm-Message-State: AOAM530wIHwRt7/CxuqQXpsb6WAMQ+4zqeTHoNClUxfzjccwMoxmp0Ki
        sHtUaH+e07YwzJ6+EUZT4DnI3Wg70yt0J9UNb3A=
X-Google-Smtp-Source: ABdhPJyp05MBzEqBviRTff7yzhFYD8zxQ47BHJ7qdCVuj6D4R7LJpyBwxAt5/LL+KaXatY3R5CwSh2ltSkkRFgzQfeI=
X-Received: by 2002:aa7:de03:: with SMTP id h3mr7240898edv.232.1599703358638;
 Wed, 09 Sep 2020 19:02:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200909114312.2863675-1-andrew@aj.id.au> <20200909114312.2863675-4-andrew@aj.id.au>
In-Reply-To: <20200909114312.2863675-4-andrew@aj.id.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Thu, 10 Sep 2020 02:02:26 +0000
Message-ID: <CACPK8Xd5rE_s680Y0wdktoP4RwDzACCaetUxBrbWSTGnwBMWVQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: aspeed-g6: Add bias controls for 1.8V GPIO banks
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        johnny_huang@aspeedtech.com,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 9 Sep 2020 at 11:43, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> These were skipped in the original patches adding pinconf support for
> the AST2600.
>
> Cc: Johnny Huang <johnny_huang@aspeedtech.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> index 7efe6dbe4398..34803a6c7664 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
> @@ -19,6 +19,7 @@
>
>  #define SCU400         0x400 /* Multi-function Pin Control #1  */
>  #define SCU404         0x404 /* Multi-function Pin Control #2  */
> +#define SCU40C         0x40C /* Multi-function Pin Control #3  */
>  #define SCU410         0x410 /* Multi-function Pin Control #4  */
>  #define SCU414         0x414 /* Multi-function Pin Control #5  */
>  #define SCU418         0x418 /* Multi-function Pin Control #6  */
> @@ -2591,6 +2592,22 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
>         /* MAC4 */
>         { PIN_CONFIG_POWER_SOURCE,   { F24, B24 }, SCU458, BIT_MASK(5)},
>         { PIN_CONFIG_DRIVE_STRENGTH, { F24, B24 }, SCU458, GENMASK(3, 2)},
> +
> +       /* GPIO18E */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, Y1, Y4, SCU40C, 4),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   Y1, Y4, SCU40C, 4),
> +       /* GPIO18D */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, AB4, AC5, SCU40C, 3),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   AB4, AC5, SCU40C, 3),
> +       /* GPIO18C */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, E4, E1, SCU40C, 2),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   E4, E1, SCU40C, 2),
> +       /* GPIO18B */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, B2, D3, SCU40C, 1),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   B2, D3, SCU40C, 1),
> +       /* GPIO18A */
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, C6, A2, SCU40C, 0),
> +       ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   C6, A2, SCU40C, 0),
>  };
>
>  /**
> --
> 2.25.1
>
