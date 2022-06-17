Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF61454F79A
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jun 2022 14:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236617AbiFQMaQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jun 2022 08:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236539AbiFQMaQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jun 2022 08:30:16 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455EA4BFDA;
        Fri, 17 Jun 2022 05:30:15 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id d23so3038649qke.0;
        Fri, 17 Jun 2022 05:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6pLOiLBK3afupV8xE7NcjLGwoNH+e6P9P3CPrIurXIc=;
        b=t56RzQd7doU8pHh3I+TWrx59oRENhRn9fdW7wmYq8GM0ENOAf3hqN02p4c5DJDg0+z
         oVYsWg4QVoLcbWlXetOUS1V3qV2Byk3KEyVYlwLa8aCeO3//sPxO8qrZAYoscCYzPz/a
         MKKBgZVQb01p+TRByeiHmY1sbVSPjoRc7SCkg/YXN1iM5jVOFk9DmEWmmRDELMDZ5PFS
         +OVBDkFLHt7p6r8nCBWURmpI9ykFkrHrfmPsbBClLmcvYTOJ7W2cUvNPk/WoHVzRzf/k
         6zrRbhzER2j5ZZL3SQXBXY7FSboIycoY4ZlTE6YN/QQN35RLYEdPKqXut7sXnAQm3kUQ
         H1EA==
X-Gm-Message-State: AJIora9eZvEusZqSsE0+DptzKyFYy+7tKosH/9ju67Zmugpq7PIfUkvy
        UMQgUxvxoEjx0/6o1C9BxWaXDnEIKtBcoA==
X-Google-Smtp-Source: AGRyM1sezzRpvPvYuQibtLWzoyX+Zgof6xfx97mM79RbTzcHjj1scZc1sq6ZD47yqvHWKh2v+MJO7g==
X-Received: by 2002:a05:620a:bc9:b0:6a6:5d5a:4306 with SMTP id s9-20020a05620a0bc900b006a65d5a4306mr6892387qki.391.1655469014289;
        Fri, 17 Jun 2022 05:30:14 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a408900b006a740bb8578sm4544950qko.83.2022.06.17.05.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 05:30:13 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id l11so6995280ybu.13;
        Fri, 17 Jun 2022 05:30:13 -0700 (PDT)
X-Received: by 2002:a25:d146:0:b0:668:aa24:c321 with SMTP id
 i67-20020a25d146000000b00668aa24c321mr6377378ybg.89.1655469012945; Fri, 17
 Jun 2022 05:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com> <8735g7lrb6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8735g7lrb6.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jun 2022 14:30:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYKRQN7+RdA0SaChN1OHL5DvsM-ReZB2PoSjmHNWaPtg@mail.gmail.com>
Message-ID: <CAMuHMdUYKRQN7+RdA0SaChN1OHL5DvsM-ReZB2PoSjmHNWaPtg@mail.gmail.com>
Subject: Re: [PATCH v3 01/21] dt-bindings: pinctrl: renesas,pfc: Document
 r8a779g0 support
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

On Tue, Jun 14, 2022 at 7:58 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Document Pin Function Controller (PFC) support for the Renesas
> R-Car V4H (R8A779G0) SoC.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
