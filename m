Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B99F4F4080
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Apr 2022 23:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242986AbiDEUTy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Apr 2022 16:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355285AbiDEOmM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2022 10:42:12 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460F52250A
        for <linux-gpio@vger.kernel.org>; Tue,  5 Apr 2022 06:19:55 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id r13so26646253ejd.5
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2022 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DX7l2sM9QqiFOKXhsLfPsQIRCmsC3YYcfigAqtbzngw=;
        b=MIIuNLWwZ8KZnliB5S7EokleWD/rLB9gDpC+rSIhM934CcyyANhIJZVpIts8INYuek
         43DojUsQl8/+1hmzew/jJYwNv8GRFitnp9+IE0TFrNQi4fHz3+SNNGBYRZFbuhM38tT4
         +sEeCg+J4oLLfaLMQkcSiF4bGHcFq//+pDz+lx1omRM4p0/lP+xCgOyzBqUvMguk2Al7
         SB2Savh02L/DSVDCdV1o5z0vgKttGVjH5G6g7bJQgZNH9xfrdeNU8914hipmWyEvqoDN
         87GaAGwit9a/glHMnbyJTwSw+pY+vsu8JlHJqcZKU+T97MidDgCvsfn2RRFbTXobbBDt
         OgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DX7l2sM9QqiFOKXhsLfPsQIRCmsC3YYcfigAqtbzngw=;
        b=0QA+yLzdkzdvSMZdtngmMkKgbsCX3NTvXY/gS8DwlFgSBFDAn6cKup2N/2ymrhptae
         pPCPc+HYknRRLPU2pmTJzJXj1aChbKxSyrfXSLkCa4+bxBbI7/LMeidtnErEkdex4h+O
         YjbOsbj1PmiAji0BEylx93iUIpRN/6vGONsQygj7Lqk3A5lXq2uYfNudL8D2A1Zi5dLe
         qWHLEBsH2PzkPO0/htc1UWLsLClGizEygl8a1/vGZpU/2PZXbNSHaFJmrC6UlkbrIwfn
         nfQoelsoMpdtY8CsON9LFD5ZOKIGOI+lwE69Y2Awu+0Aem1Z7qwUaEX6JKUkykmfDp6F
         UYdA==
X-Gm-Message-State: AOAM531iBfX+2seXn+dLXO34WKJ94gMgXt0dW/HJDRm33vCoEWCjbMrY
        Z4F33x4K5BTXbGHnDt/691cyHPMPTbhTRSBjp8cysw==
X-Google-Smtp-Source: ABdhPJxdkpcqywi0Dnnv3TZA7cMfATjjPrQEcps7eS+U2c2eZK6FJLlYj9QgffOiSwol2BYhsCWYsZ1FW7SXEGnJj+g=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr3580349ejc.636.1649164793827; Tue, 05
 Apr 2022 06:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1649085875.git.geert+renesas@glider.be>
In-Reply-To: <cover.1649085875.git.geert+renesas@glider.be>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 5 Apr 2022 15:19:43 +0200
Message-ID: <CAMRc=MdapT5rWfijUDQYj-GDvJ8ZrrpnZ6dwScev0WirCsuAyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpio: rcar: Add-R-Car S4-8 GPIO support
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 4, 2022 at 5:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
>         Hi Linus, Bartosz,
>
> This patch series adds support for the Renesas R-Car S4-8 Soc to the
> R-Car GPIO DT bindings and driver.  It has been tested with i2c-gpio,
> by reading the contents from the I2C EEPROMs on the Spider development
> board.
>
> Changes compared to v1:
>   - Drop RFC,
>   - Split series in DT bindings+driver and DTS series.
>
> Thanks!
>
> Geert Uytterhoeven (2):
>   dt-bindings: gpio: renesas,rcar-gpio: Add r8a779f0 support
>   gpio: rcar: Add R-Car Gen4 support
>
>  .../devicetree/bindings/gpio/renesas,rcar-gpio.yaml        | 5 +++++
>  drivers/gpio/gpio-rcar.c                                   | 7 +++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds

Applied, thanks!

Bart
