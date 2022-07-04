Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C20565A40
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234661AbiGDPo6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234563AbiGDPoq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:46 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797C5B2E;
        Mon,  4 Jul 2022 08:44:28 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id c137so7026620qkg.5;
        Mon, 04 Jul 2022 08:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rmRy9VH0mNsLUdjOG/DGJ2ghh2ZTaZ4ObLeHrdHmYUI=;
        b=q2NBPBI2mrJPzNbtE+VhWPnkCBPZhqCNn2mpJrPItHYYh/qbdLAxEIakoalvMctK0t
         IjLViicd3ydPPK1j017fedoTILhVeDZE6zPbCZmfmJmnNmw7NeqGhT18B+hJTRnu68/m
         IorX29jwm4bL10TBGC2XcIuYmCpizWy7k14MbL3P5SpXEIfHcnWF9Gb5Wo+lc5CK7aWF
         xTqacjCCnBV2zZzmc0eO4JGeEfRrrpdAt0LkX9VsXTowdiWxZkl9DVPXeWF0HItlb3XC
         M3OHt1SQRNMqPP6A+yeimh8ZdBixuCk5idaSTvP4Zqgtkw1jnvWkzDZ0nk828jigPVIF
         8fEQ==
X-Gm-Message-State: AJIora9kf7iPzL2fEpc5WtvtwZcpMFkGB9cCraHiD9zpoA2kegWHKM+/
        sCDxBRbserbH+A4HM/iQspoGN3V3NI+yy0sy
X-Google-Smtp-Source: AGRyM1scMkWxHFbpLlQ0dqPwCRgQgpTZFK5C0zVARQMTb636cDUObgqKSln8Vyy3zDJpYFgut8KXEA==
X-Received: by 2002:a05:620a:1a23:b0:6af:6ceb:2ed with SMTP id bk35-20020a05620a1a2300b006af6ceb02edmr20363166qkb.42.1656949467469;
        Mon, 04 Jul 2022 08:44:27 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id k1-20020a05620a414100b006af039ff090sm27406907qko.97.2022.07.04.08.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:44:27 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-31c89653790so34634207b3.13;
        Mon, 04 Jul 2022 08:44:27 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:31c:921c:9783 with SMTP id
 135-20020a81098d000000b0031c921c9783mr7771035ywj.316.1656949466828; Mon, 04
 Jul 2022 08:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87sfnlsj9t.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sfnlsj9t.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:44:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVHqDppY5jhoX+4Q9OWTNaQV6W1QfT2zU5O=x85=CyHpw@mail.gmail.com>
Message-ID: <CAMuHMdVHqDppY5jhoX+4Q9OWTNaQV6W1QfT2zU5O=x85=CyHpw@mail.gmail.com>
Subject: Re: [PATCH v4 17/23] pinctrl: renesas: r8a779g0: add missing CANFD5_B
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
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

On Fri, Jul 1, 2022 at 3:40 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing CANFD5_B
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
