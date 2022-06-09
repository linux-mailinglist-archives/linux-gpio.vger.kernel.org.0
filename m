Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B383254481E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jun 2022 11:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233789AbiFIJ62 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jun 2022 05:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234924AbiFIJ62 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2022 05:58:28 -0400
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201213E48C6;
        Thu,  9 Jun 2022 02:58:27 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id 15so12157110qki.6;
        Thu, 09 Jun 2022 02:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t4z1KqwXzprFCMlgSC2zUcKgcFcn2kVvaKgCgZpKQF8=;
        b=K3xFfim454mlFHsVOLMMySgho+1xnQxu0Y9CpFTrMNQJqx3tfD29L0v1WgZk6jbgvZ
         2EFqo620FYWOVPN40One+tLZVzrv5Ms17HdKhBBiJxEjXDxwvqqSKKuSuiFknZqzI7gG
         uzgVn3nPvcqTPBxcjh5+Ty7AJ/PiC1g47g50ybPjNhJhGZ0jpFB03eSuuAg8lpeLTCGO
         wBEMkYAEs4IYgASOivjJY+36Mm6pwZfEw7fpj9c9nDQHRt5EW8/wmOSW4xOztsUuhzCg
         pCpbOqzLaas6TGP1a92jF5GNKFk5U6Avv6ueBomQ5WH0cenh21ssEnWK9F6YunmAQHJ7
         qwqA==
X-Gm-Message-State: AOAM530mCxr0/1sAgQVdiiAMlu0MAIbySt6U+rj32lX35XA7WJZzmTaL
        3SbZFQCXqEFy5bbNjeZ0UqRb99tOoSlvXQ==
X-Google-Smtp-Source: ABdhPJwQPKThRayvmqfmhe2bHz4snWFHvuQ2m+Q/G9z62PH+NANC7u6ZfArE/Hww8nqXmDJYmbQntA==
X-Received: by 2002:a37:bd06:0:b0:6a3:4346:fc23 with SMTP id n6-20020a37bd06000000b006a34346fc23mr26451105qkf.348.1654768706129;
        Thu, 09 Jun 2022 02:58:26 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id i187-20020a3786c4000000b0069fc13ce1fesm17962650qkd.47.2022.06.09.02.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jun 2022 02:58:25 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31332df12a6so87442207b3.4;
        Thu, 09 Jun 2022 02:58:25 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr41954176ywg.316.1654768705496; Thu, 09
 Jun 2022 02:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <87zgipgu3s.wl-kuninori.morimoto.gx@renesas.com> <87y1y9gu30.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y1y9gu30.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 9 Jun 2022 11:58:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=W7MH1iXHiDgDjckO1gKq6EEW0VsZ1Ed8OPnQ1Zgx_w@mail.gmail.com>
Message-ID: <CAMuHMdW=W7MH1iXHiDgDjckO1gKq6EEW0VsZ1Ed8OPnQ1Zgx_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: renesas,pfc: Document
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

On Tue, Jun 7, 2022 at 3:07 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Document Pin Function Controller (PFC) support for the Renesas
> R-Car V4H (R8A779G0) SoC.
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
