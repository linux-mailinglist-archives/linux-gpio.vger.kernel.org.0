Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A734FBD03
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Apr 2022 15:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbiDKN2a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Apr 2022 09:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbiDKN23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Apr 2022 09:28:29 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7AC63BA42;
        Mon, 11 Apr 2022 06:26:15 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id c1so3750803qvl.3;
        Mon, 11 Apr 2022 06:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NtHbCZm85sZWf1fOgb4C7izU98B/hqE6cBJHhExY5kk=;
        b=fqT9PSxyCklfIhZaKUlKwYy2hg75aDTBGgihVnWECO+FyI0DIwWrgFotLAfat1kLp1
         u7r3LYF+dUxTHUUbXF2a+oHahwh0DO8TdtBUeUYn5++vFnn28CjHXgOc31UWR3rc9856
         QGq7oTQo/IAo+ND1mlCFuaGUiE7aQu0C6YYeOC0umx7kt640zPkqLULwCeWFimPLghR1
         h5Xf1NFml9cTIjkDDZCrb3t2zo804X+4JRAAMzasT1Y135qJ8nezT4ipxmIRI84gWYKV
         L4kAsp690iV4jKV6k8gjq+I8Eqz2N2XpgrROEd4pcyhgu03oHmK5NYK0aEDv7+z+SMaf
         8Dsg==
X-Gm-Message-State: AOAM5302gJ2cHDw3jW08ErAqIiezsjBJ8zOJKvUeUUDAV6BURxkChnHu
        LJWHt2Nwu0uqNYjk823aowK7Q8Iky8qjQg==
X-Google-Smtp-Source: ABdhPJzQc9Xam3pmGxtHHOQKYKM+HMO0qqf7ARp7eevzC+iuQpdgqSeBUqV/tORaY2abbeo4FVkH9w==
X-Received: by 2002:a05:6214:20a1:b0:42d:6f51:46e2 with SMTP id 1-20020a05621420a100b0042d6f5146e2mr27272739qvd.67.1649683574678;
        Mon, 11 Apr 2022 06:26:14 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id i65-20020a379f44000000b0069a0d9eed43sm8043850qke.33.2022.04.11.06.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:26:14 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-2ebd70a4cf5so106256347b3.3;
        Mon, 11 Apr 2022 06:26:14 -0700 (PDT)
X-Received: by 2002:a81:4f0d:0:b0:2ec:1556:815 with SMTP id
 d13-20020a814f0d000000b002ec15560815mr4677453ywb.256.1649683573836; Mon, 11
 Apr 2022 06:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220406075318.14385-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVgxWMTXBp-3kZrHx4A74_k5N1QxGqum_7FiRUcLgnLtg@mail.gmail.com>
In-Reply-To: <CAMuHMdVgxWMTXBp-3kZrHx4A74_k5N1QxGqum_7FiRUcLgnLtg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 11 Apr 2022 15:26:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWh6meiY5v045Y92MRD92pO=zm8YJuF1=81Mz1aQLsAfg@mail.gmail.com>
Message-ID: <CAMuHMdWh6meiY5v045Y92MRD92pO=zm8YJuF1=81Mz1aQLsAfg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: Kconfig: Select PINCTRL_RZG2L if
 ARCH_RZG2L is enabled
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

On Mon, Apr 11, 2022 at 3:24 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Apr 6, 2022 at 9:53 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > GPIO (PINCTRL) block is identical on Renesas RZ/G2L, RZ/G2UL and RZ/V2L
> > SoC's, so instead of selecting PINCTRL_RZG2L config for each SoC select
> > PINCTRL_RZG2L config option if ARCH_RZG2L is enabled. The ARCH_RZG2L
> > config option is already selected by ARCH_R9A07G043, ARCH_R9A07G044 and
> > ARCH_R9A07G054.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

i.e. will queue in renesas-pinctrl-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
