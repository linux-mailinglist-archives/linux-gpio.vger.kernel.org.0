Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 579E454FA02
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 17:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236822AbiFQPRa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 11:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbiFQPRZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 11:17:25 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5A73CA56;
        Fri, 17 Jun 2022 08:17:24 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id 15so3363593qki.6;
        Fri, 17 Jun 2022 08:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1uJzxvid+qyxeef1eA0qefqialTJIm34ZbXUlrmDwrI=;
        b=0VZ9xGtBnTEvTwgKU7lKFJAub2S3PRTRQH3I0i27Qob8Y3c4NVEalyaXVbofO77Ykk
         f+tEjabiHx+9IxRZGq85NySaz+6V0y5RRdBbR8fgBW/M3GlIpNO1EPwQE+IF7QQl/Ory
         StjZCIm/96NAYaCUvLp4qWDKqQ0T4Bd49V+3RzIE5EzilFKI5zbhzUyxrlvUPVBt3irl
         DGEkRmsO1b7g8xHNAr+Y6IPXzn0gPMRlC5y81YyIBdWcL7kDToE+DbgCzJft5qR6/vrY
         NU0IzbA5p0AApFNtNCNOWJ7B2oIN7WfW3B41wvyunICNJ7Su8kxpccw7hcvRwmMamKfl
         hbNA==
X-Gm-Message-State: AJIora9ljVgNI1DtUt54TMA79vmrz/+dZbQH+WfOYGpPkQnKmGrcseqQ
        7P2owl9WfehLHDXyQaH5Diz+2iUGyAoeNQ==
X-Google-Smtp-Source: AGRyM1v8J3uX4ynYCFx7DbgbGAJ71Fw/TzN0XTfcrnX1GKhVOnBmjiIGK8iTcOJ4wowMXVjBvZlvwQ==
X-Received: by 2002:a05:620a:12da:b0:6a6:b06b:2ee3 with SMTP id e26-20020a05620a12da00b006a6b06b2ee3mr7311753qkl.725.1655479043633;
        Fri, 17 Jun 2022 08:17:23 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id l5-20020a37f505000000b006a73654c19bsm4462701qkk.23.2022.06.17.08.17.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 08:17:23 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id w6so7781138ybl.4;
        Fri, 17 Jun 2022 08:17:23 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr10571053ybr.380.1655479042787; Fri, 17
 Jun 2022 08:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <87v8t3kcpe.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8t3kcpe.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 17:17:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWf7yM+R1sdhA6P8KV8B4EOQkqnfU__VdvNhOwiBN_sbQ@mail.gmail.com>
Message-ID: <CAMuHMdWf7yM+R1sdhA6P8KV8B4EOQkqnfU__VdvNhOwiBN_sbQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/21] pinctrl: renesas: r8a779g0: remove not used
 IPxSRx definitions
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

On Tue, Jun 14, 2022 at 7:59 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current V4H PFC code has many IPxSRx definitions with all 0.
> But these have no meaning. This patch removes these.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

As the only net impact of this patch is the removal of several enums,
and a shift in the numbering of later (internal) enums, I think
it is safe to fold this into "[PATCH v3 03/21] pinctrl: renesas:
Initial R8A779G0 (V4H) PFC support".

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
