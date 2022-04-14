Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD731501121
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Apr 2022 16:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbiDNOfh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Apr 2022 10:35:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348013AbiDNOCC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2022 10:02:02 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4792CC94;
        Thu, 14 Apr 2022 06:57:36 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id ay4so3537636qtb.11;
        Thu, 14 Apr 2022 06:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=lN0U24O7GQEePSLIhlC3MYeJd10ydIu4wu7Inmy1OV8=;
        b=ad3jdsbyWRQuTd5b4uMZCEkC3HvbUsz19H0MbxjveBmDa8eV5oNRSF3tn26urO5BP1
         wVUEaaO8TUyfjrqX0D2Kc59oT40iLmi5GWqnPcsk+vkus+fPjBZZds6uJqvNA1xlaJgE
         xk0pcGw1LPDCL4QStnA18f3BUv6Z+DZcCK7OiWUdPKyhk343/nEtNCDFi2gJ3HMZez7O
         CuRNyrQPRRIp/09Ct1cXQY/xjqc03xzuqc+v9YrE/l37whQa3B2KxNuPiBXWcZyOOQ+y
         z/N4KjRdqrWCgpBVhE7N8PsV1WdkjvxdURG9gyIseUpIvtZw6UXTomKVoMryMRGFnuVF
         4SQQ==
X-Gm-Message-State: AOAM531qdh4pqf/vRTFHVRywVg1zhBCfo6SL8a3q20LeSdHJkaeyrUvO
        usO6oavEVLhx8Lb4Rgl1HVzBsN8hMWAxUQ==
X-Google-Smtp-Source: ABdhPJy/FtnS5VfengaK5Rx2F3b8/7cFjjxFZRvAweFw1BSuIHgIneZ/EFug4MfExOZqGOm0OWzIEQ==
X-Received: by 2002:ac8:4501:0:b0:2ed:b5a:536 with SMTP id q1-20020ac84501000000b002ed0b5a0536mr1788784qtn.463.1649944654932;
        Thu, 14 Apr 2022 06:57:34 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id i7-20020ac85e47000000b002e22bad4717sm1221008qtx.1.2022.04.14.06.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Apr 2022 06:57:34 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id m132so9567656ybm.4;
        Thu, 14 Apr 2022 06:57:34 -0700 (PDT)
X-Received: by 2002:a5b:24e:0:b0:63d:cba0:3d55 with SMTP id
 g14-20020a5b024e000000b0063dcba03d55mr1696393ybp.613.1649944654265; Thu, 14
 Apr 2022 06:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <e44426a99b20e5f5681ede894d08e36870bcb47f.1649865163.git.geert+renesas@glider.be>
 <Yle0vODAp89idGxl@shikoro>
In-Reply-To: <Yle0vODAp89idGxl@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 14 Apr 2022 15:57:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV4ch6Da0jyuAOn9T+Z8ZOAqeJ70Y5EDZw3-TOgONW6jQ@mail.gmail.com>
Message-ID: <CAMuHMdV4ch6Da0jyuAOn9T+Z8ZOAqeJ70Y5EDZw3-TOgONW6jQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: checker: Fix for drive reg field increase
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Wolfram,

On Thu, Apr 14, 2022 at 7:44 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > This happens because the checker still uses the old number of fields.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > To be folded into commit d5c9688095d29a6c ("pinctrl: renesas: Allow up
> > to 10 fields for drive_regs") in renesas-pinctrl-for-v5.19.
> >
> > Ideally, some iterator or index helper should be introduced.
>
> What about a #define instead of a hard-coded value until then?

That would be an option. But I bit the bullet, and introduced a few
helpers in v2 instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
