Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0D265BCA6
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Jan 2023 10:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233088AbjACJCB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Jan 2023 04:02:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237120AbjACJB7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Jan 2023 04:01:59 -0500
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF60C63F9;
        Tue,  3 Jan 2023 01:01:58 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-4a263c4ddbaso90149077b3.0;
        Tue, 03 Jan 2023 01:01:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y5URYrqeQS8qtruXH5AsYpmalrkXEUl+UgZRcXAkcEE=;
        b=vyAMAnt8gRki9CI1ARcv8zLOeGnyjbpXI9uoOlB4N5gpDdfi3HQMf3M8vtfC6ec9xp
         JXU1D7VjR1qntVcS2z4RcAz7VrgBcKouca1smd6/7kpAUcX216nWF++ZT/AP9H43+nQf
         Dsp3sqvfJHwuGF3oYghA2xEtGWm4+T0s+MGqXr6i/RTi0fVrQOqjH+Z3+UU7lxtifU3o
         1HLvkSNYXcm5VYSX8dzNMA2ch5GtprEFZiGAoyeBsYlhWwDsjhXOOpulRDql+8cl8Qey
         4TFOCbdqUYqFkVVW7OpysQ+aJWS6Sh6fi03vytku+gYCKQpcLlCcslic//62oNRuhpDr
         ORMA==
X-Gm-Message-State: AFqh2kqIvEQJ4zkhJ+vOPI2qzWQCYLk3/6dyAjVL+H5aQG5VmPpJ0PuT
        Z8p6SwYxPFUzVkJQwwExQfhLEwjLX2OAxA==
X-Google-Smtp-Source: AMrXdXsDK5p3WZY5e4n2SgPxle006DIZNmmRSNaUcdPVtdkBLwtZRzVCw8iqAildmM8relcnd4xj0w==
X-Received: by 2002:a81:5706:0:b0:485:470f:c39c with SMTP id l6-20020a815706000000b00485470fc39cmr20383600ywb.37.1672736517562;
        Tue, 03 Jan 2023 01:01:57 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006e07228ed53sm21772827qki.18.2023.01.03.01.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 01:01:57 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id n78so32336127yba.12;
        Tue, 03 Jan 2023 01:01:57 -0800 (PST)
X-Received: by 2002:a25:ab49:0:b0:6de:6183:c5c3 with SMTP id
 u67-20020a25ab49000000b006de6183c5c3mr4872308ybi.89.1672736516822; Tue, 03
 Jan 2023 01:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20221215213206.56666-1-biju.das.jz@bp.renesas.com> <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
In-Reply-To: <CACRpkdZCEvpLAWvH7pCLH7KwbDMzz0EN+4HbxVGfFPi_C1b8+g@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Jan 2023 10:01:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
Message-ID: <CAMuHMdU1J46KSzqqCQc-1ZrgvfWh8J2aa6NzRTK_A_ZJs+zRVQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add RZ/G2L POEG support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Drew Fustini <dfustini@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Thu, Dec 29, 2022 at 2:17 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Dec 15, 2022 at 10:32 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > This patch series add support for controlling output disable function using sysfs.
>
> What's wrong with using the debugfs approach Drew implemented in
> commit 6199f6becc869d30ca9394ca0f7a484bf9d598eb
> "pinctrl: pinmux: Add pinmux-select debugfs file"
> ?

I think the main difference is that debugfs is meant for debugging
and development features, while this feature is to be configured on
production systems.  There's just no existing API for it.

> Something driver specific seems like a bit of a hack, does it not?
>
> If this should go into sysfs we should probably create something
> generic, such as a list of stuff to be exported as sysfs switches.
>
> It generally also looks really dangerous, which is another reason
> for keeping it in debugfs. It's the big hammer to hurt yourself with,
> more or less.

Yes, generic would be nice.  Anyone familiar with other hardware
that could make use of this?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
