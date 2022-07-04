Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56949565A4A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbiGDPpd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbiGDPpV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:45:21 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F0DF0E;
        Mon,  4 Jul 2022 08:45:18 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id k20so7041314qkj.1;
        Mon, 04 Jul 2022 08:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WfaB+WTTR0D5LSJTqKBrUwLxe+Bk9Eb2FffHbCM61KU=;
        b=rPNUW3KhWCTU6Tb/pIUdEiJf5O/Xg62JIod9PnbGKlHq09WWmgOXVPwRLHVIwZcwbe
         YTnKy5L4AAtqGoUsQm3sAry90fRFmJ3pvKYyi9Z9H9jmTeG1Y8l2sjEQlS/pHqk4fNDO
         qMNvpAPh+MHO/imU7FiZE+IWFwv8pQOEfuvoVWroEgNXaHZOaTZVA4qeifFPXVGmFA6t
         0w403EZZNz3Of4QgHNwTJRbYU8Lj9tb7BKm8U37XDlYAk6tH3N47zCyUCAyCOz1B5WF9
         PK77CTrNnNRDq+Lzznr4vrA+WVCeiQMVgOChZCIl6fA/LmeAozQoZUxJzir62vA3Wfld
         1CYw==
X-Gm-Message-State: AJIora+b/0AmPCiHRKO8RL9/jllmfoZdL+NWIL0v1iCJba8Vn1uJ++58
        9nA6WHgJtwPCPYOKLLrE5rewP8JwlamajgRM
X-Google-Smtp-Source: AGRyM1srSFoggZyJV5mXMhQEzK1zH9gAg6Tb5aWHkrgc0NqBqS21DkhsQPALjRf39KBZAdUgZQyDRA==
X-Received: by 2002:a05:620a:4093:b0:6b1:4b58:f4af with SMTP id f19-20020a05620a409300b006b14b58f4afmr20209605qko.735.1656949517227;
        Mon, 04 Jul 2022 08:45:17 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id bk32-20020a05620a1a2000b006af1d3e8080sm20856022qkb.85.2022.07.04.08.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:45:17 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id b85so4277878yba.8;
        Mon, 04 Jul 2022 08:45:16 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr33820388ybh.36.1656949516633; Mon, 04
 Jul 2022 08:45:16 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87mtdtsj8m.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mtdtsj8m.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:45:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFM0K=x7JUhmXY9wcBeFb8_nmzwpCPLgFBTZ3XgEBQOA@mail.gmail.com>
Message-ID: <CAMuHMdXFM0K=x7JUhmXY9wcBeFb8_nmzwpCPLgFBTZ3XgEBQOA@mail.gmail.com>
Subject: Re: [PATCH v4 21/23] pinctrl: renesas: r8a779g0: add missing ERROROUTC_A
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
> This patch add missing ERROROUTC_A settings.
> Current existing ERROROUTC should be _B, this patch tidyup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
