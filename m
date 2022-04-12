Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08024FDCD0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Apr 2022 13:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244344AbiDLKmF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Apr 2022 06:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354646AbiDLKdm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Apr 2022 06:33:42 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277C85BD03;
        Tue, 12 Apr 2022 02:33:53 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id d71so5104722qkg.12;
        Tue, 12 Apr 2022 02:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3nnLePtPQXcraZo9xuBzZJTepa7ubGhqT6Zw37Swgqs=;
        b=Cnc4wr/lKqtygyZkVkW65KzNmQSNokhV+ifnFjacSOinmFqUnQWmGB9Wj8ba3MVqQB
         cEYGnOTTsiuw99/ixOpdjo4ouPlBJ7g+GN2f7znZcFq8xYBKgTQfeb7i06gH2/8zQfDO
         XuGuDgeYO3dQGoguWyXEecuKPlihz9grzfi4CX0GEx9RpL5MhRsj/tr90xphIT85/sL0
         cotsvIAL+Uh3BAbJCtQGRq1XzM7rpVLtnJqns1HfHzFo8qJZH/iWSNy1VGy2+9+wSZnm
         Jl9YqvpGOtArRxVuaMxOXzXnJtHk5UfClCUzj3SYM3Tho1NoaNI7YqS/UKs6NfmPO7An
         WlNQ==
X-Gm-Message-State: AOAM533sSxkvPsvucMDzY5xSyvYxLGlTspnDl31Zt66A3G1Xt+YxyGt6
        H7hFJK/K6BXLdgLUvXljkfL2zTP6w2fkmTq3
X-Google-Smtp-Source: ABdhPJwsQp+bUZ+kZJh9+u7xwD2SRxHnFhML+LvOxJvLF9QCdbJp0mNTBv+HZYOiSz1SqY5omQ+uPQ==
X-Received: by 2002:a37:a554:0:b0:69b:e220:bc17 with SMTP id o81-20020a37a554000000b0069be220bc17mr2337582qke.740.1649756032053;
        Tue, 12 Apr 2022 02:33:52 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id f15-20020a379c0f000000b0069bf3430cc4sm6794892qke.100.2022.04.12.02.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 02:33:51 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-2ec42eae76bso44828487b3.10;
        Tue, 12 Apr 2022 02:33:51 -0700 (PDT)
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr30276252ywe.512.1649756031507; Tue, 12
 Apr 2022 02:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220401180230.19950-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220401180230.19950-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Apr 2022 11:33:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXxDKKnt_L8EgruCDSZjQJvpSx30RGXysV-TMZHN94=Gw@mail.gmail.com>
Message-ID: <CAMuHMdXxDKKnt_L8EgruCDSZjQJvpSx30RGXysV-TMZHN94=Gw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: renesas: rzg2l: Add RZ/G2UL support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 1, 2022 at 8:02 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2UL SoC has fewer pins compared to RZ/G2L and the port pin
> definitions are different compared to RZ/G2L.
>
> This patch adds a new compatible to take care of this differences
> by adding r9a07g043_data with r9a07g043_gpio_configs and
> rzg2l_dedicated_pins.common.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Moved QSPI_INT# pin from common to rzg2l_pins
>  * Added Rb tag from Geert.

Thanks for the update! Will queue in renesas-pinctrl-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
