Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68283565A3E
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jul 2022 17:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234528AbiGDPox (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jul 2022 11:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233796AbiGDPol (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 11:44:41 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA1011A3A;
        Mon,  4 Jul 2022 08:43:56 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id q16so10322876qtn.5;
        Mon, 04 Jul 2022 08:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8umnx1YRxt24zlwt2ZTujxLs9cAmAkjsvKGoM9RrW3s=;
        b=HG3IOy+X2fb9VVLXpELrZ65QMhYKuKtLTdIrRqcFyf0wr6P4ew5+BjlsuKHzEG9Btw
         vYAiaYdb90/0x8NK8tvw/4/gopURZiQVHwGU8eDaYo4xL39WAEw7ATTFOsnyKKZBUBnx
         msc571hpLS6imdEtz9+BxmZG+AgFhKAxpiJfkIkKD7MtZILGsbrnw0fC8TNhmatJvehp
         9K6Pu+WWY344WBIP5ISSwsLkdMmsGjsFW417e31L9kzlZdi44v/s/O9nY9PbUGIZOcPi
         CeaKyqlO3455S8Mbo9ozNkmLZ3ssI7aiqXxaZbbwvEKogyVkQyeXiFzpqdSSaZv0EQ8Q
         Uadg==
X-Gm-Message-State: AJIora/XEXD/qwHMO77fHMheSOM034ZXeaFc/cEiovvOGk2skq/nZDlR
        c57LVjxwT3tkRP4EwJjwSJmemgXiB1S760zu
X-Google-Smtp-Source: AGRyM1shL7cBoo3fBQ1V/II4DV2jb8cxDoG14OG6l66i0QO0MsK7/L+IWhQnCrPilX4n1J93hL8nxQ==
X-Received: by 2002:a05:622a:512:b0:31d:3a0a:7e27 with SMTP id l18-20020a05622a051200b0031d3a0a7e27mr13778400qtx.243.1656949435002;
        Mon, 04 Jul 2022 08:43:55 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id u12-20020ac8050c000000b003051ea4e7f6sm19881025qtg.48.2022.07.04.08.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 08:43:54 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 76so1912973ybd.0;
        Mon, 04 Jul 2022 08:43:54 -0700 (PDT)
X-Received: by 2002:a05:6902:a:b0:65c:b38e:6d9f with SMTP id
 l10-20020a056902000a00b0065cb38e6d9fmr33813567ybh.36.1656949434293; Mon, 04
 Jul 2022 08:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com> <87zghtsjb4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zghtsjb4.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 4 Jul 2022 17:43:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-g+ZaSmFDfiYjkWvm8i2DuOAtnnYzyjn6vb3ETHcdQQ@mail.gmail.com>
Message-ID: <CAMuHMdU-g+ZaSmFDfiYjkWvm8i2DuOAtnnYzyjn6vb3ETHcdQQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/23] pinctrl: renesas: r8a779g0: add missing IRQx_A/IRQx_B
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

On Fri, Jul 1, 2022 at 3:39 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds missing IRQx_A/IRQx_B, and tidyup existing IRQs.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-pinctrl-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
