Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5433762E576
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Nov 2022 20:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240450AbiKQTuH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Nov 2022 14:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234380AbiKQTuH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Nov 2022 14:50:07 -0500
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C78514081;
        Thu, 17 Nov 2022 11:50:06 -0800 (PST)
Received: by mail-qv1-f51.google.com with SMTP id c8so1913206qvn.10;
        Thu, 17 Nov 2022 11:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3DVt7K8FCdZao17Ost/ZvhNE/+x5EaYr3nwQwiMqDw=;
        b=tT9WcomXQmDQaU2X8wEgXwJRxy0leYVESfMjJGT4j1GORxYbX+gemBQT7vc0KmrgBR
         +IU+DsKfjLaWIqfAIkffK6dyPrL7U9rWb7fdRc9Y4GjP+JLbjDOWut87wz/c8JXqUurP
         A483hoKHFQg0VgO6ST/hGCyDaU7Nj7pbzRjS1zN5dOHjYCfDN2xa65wqnEOPm4/Vgmtz
         fWDLBWGEO7VFgPTqp3QLKSVmDPcW8+qNfBNIANCYAJw3wMc0PKzm17MZwL2jkl3drACh
         rHDNjFJmNf+DcBlrhb8i8/6otigTe4SazJ3VAeUE0a1mR2OIEgIj1jUjoxRezcc5XrmY
         5U6A==
X-Gm-Message-State: ANoB5pnRAkINHi5Kb3vahFfNoOhLnM4S15+oWzuh6OgykNt9N93PQzqA
        WL4TJZF/B6Tq6kZgoFz0t7om+dOxiH71cQ==
X-Google-Smtp-Source: AA0mqf6iJ0vBgmoSO1Owlpa/CCpxzK3bbO+UsHDLEoevWQBkguDh08b6ofVhZQZ8ZQjg8cVDBazKmw==
X-Received: by 2002:a0c:ea4d:0:b0:4b1:b7ee:98d8 with SMTP id u13-20020a0cea4d000000b004b1b7ee98d8mr4081809qvp.19.1668714604965;
        Thu, 17 Nov 2022 11:50:04 -0800 (PST)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id i18-20020a05620a405200b006fbaf9c1b70sm1042461qko.133.2022.11.17.11.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 11:50:04 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-37063f855e5so29481427b3.3;
        Thu, 17 Nov 2022 11:50:04 -0800 (PST)
X-Received: by 2002:a05:690c:b81:b0:37e:6806:a5f9 with SMTP id
 ck1-20020a05690c0b8100b0037e6806a5f9mr3525707ywb.47.1668714604002; Thu, 17
 Nov 2022 11:50:04 -0800 (PST)
MIME-Version: 1.0
References: <df2cf30ac4c3cbee726799f32b727c1ebe62819c.1668000684.git.geert+renesas@glider.be>
In-Reply-To: <df2cf30ac4c3cbee726799f32b727c1ebe62819c.1668000684.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Nov 2022 20:49:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWczT_G7MKULUKZfZxkrB9Hk-SNam-qZqqsmb+sz1sQHg@mail.gmail.com>
Message-ID: <CAMuHMdWczT_G7MKULUKZfZxkrB9Hk-SNam-qZqqsmb+sz1sQHg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: gpio: Use dynamic GPIO base if no
 function GPIOs
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 9, 2022 at 2:38 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using
> static gpiobase allocation") in gpio/for-next, one or more warnings are
> printed during boot on systems where the pin controller also provides
> GPIO functionality:
>
>     gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
>
> Fix this for ARM-based SH/R-Mobile SoCs by:
>   1. Taking into account a non-zero GPIO base in the various GPIO chip
>      callbacks,
>   2. Switching to dynamic allocation of the GPIO base when support for
>      legacy function GPIOs is not enabled.
>
> On SuperH SoCs using legacy function GPIOs, the GPIO bases of the GPIO
> controller and the GPIO function controller must not be changed, as all
> board files rely on the fixed GPIO_* and GPIO_FN_* definitions provided
> by the various <cpu/sh*.h> header files.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, queued in renesas-pinctrl-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
