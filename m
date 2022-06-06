Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC33E53E770
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jun 2022 19:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbiFFJRX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jun 2022 05:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232695AbiFFJRW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jun 2022 05:17:22 -0400
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8743C12A96;
        Mon,  6 Jun 2022 02:17:21 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id l1so9861425qvh.1;
        Mon, 06 Jun 2022 02:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJHWxHnDKgIhX0rwBiuI6695ZQef+BlZS52k2wJ8PRc=;
        b=3fWxgnkGOqJulCp7CzPBdFMH0s6PacR7vf3eZakKC3hl/v6ZJ3YbcI0FbSyvalIcU7
         +K1E5FEWBsrrLJFbRengucfdidRcLt4Dw0S6m802X/TVmSSSGaO76T1DE7Jw5p+1w9ST
         ym/Mvcmwx+7q18AtUnMq6ERY2sxqORlSaEoIix5jXPVmuOLs2dO3A+MQr4lSek7UZ8m4
         RXuKb6tw6SpfqXUGbiLbBftbupSmjJr04EqPBnLN+YUmXoMiB3Koo6TBegznJwp2cwlg
         rz+JXYOOMjiGzZZ36lGUGgYYjXT6oU7Yg5d4LnjfkFG+HntlC3a43qv94tXIWA34qnw/
         Le8Q==
X-Gm-Message-State: AOAM530sljvE8tk394DtfQk7YHoLpwmJbx74fzud9rdqtxEDUnv44jtJ
        s1IQjIPiYfSgOI8loLS6Jos6qEAsNXWyeQ==
X-Google-Smtp-Source: ABdhPJwsa91OH/UYLgn9JnWHVt2t2WYxK7TnZ9+B4NXfMluEpyqA3297pMgjTOR8ShS9r1+6BLS/gg==
X-Received: by 2002:ad4:4ae9:0:b0:46a:5726:58c2 with SMTP id cp9-20020ad44ae9000000b0046a572658c2mr8369235qvb.36.1654507040145;
        Mon, 06 Jun 2022 02:17:20 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id l22-20020a05620a28d600b006a5bc8e956esm11721519qkp.133.2022.06.06.02.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 02:17:19 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-30c2f288f13so136695097b3.7;
        Mon, 06 Jun 2022 02:17:19 -0700 (PDT)
X-Received: by 2002:a81:1dd2:0:b0:30f:a4fc:315e with SMTP id
 d201-20020a811dd2000000b0030fa4fc315emr26233628ywd.383.1654507039397; Mon, 06
 Jun 2022 02:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdUWCjFRnjVDzrjDh4ODDyh5hV5zdM9o4i20c4mLXhNpHg@mail.gmail.com>
 <87r1423co4.wl-kuninori.morimoto.gx@renesas.com> <87leua38nb.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87leua38nb.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jun 2022 11:17:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVmX9-zfN5gs4Mc2bx5=pq=vv6j6dOJUgnZ57KJZK_3ZA@mail.gmail.com>
Message-ID: <CAMuHMdVmX9-zfN5gs4Mc2bx5=pq=vv6j6dOJUgnZ57KJZK_3ZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
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

Hi Morimoto-san,

On Mon, Jun 6, 2022 at 3:04 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > >   [1/3] pinctrl: renesas: Add PORT_GP_CFG_13 macros
> > > >   [2/3] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
> > > >   [3/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
> > >
> > > Thanks for your series!
> > >
> > > Here's a first set of quick comments. More will follow later.
> >
> > Thanks.
> > I will fixup all, and will post v2 patch.
>
> Which git tree/branch should I base ?
> I can find many pfc related branches on renesas-drivers.

Please base it on renesas-pinctrl.

I have just rebased renesas-pinctrl-for-v5.20 to v5.19-rc1, and
have fast-forwarded renesas-pinctrl to the latter.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
