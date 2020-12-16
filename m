Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FD52DC070
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 13:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgLPMmh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 07:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgLPMmg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 07:42:36 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67373C06179C
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 04:41:56 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 23so47941623lfg.10
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JdWZ2Pk1OFPUwPBsoB678Mi8MqbdY4ggPgKtXlI/SK4=;
        b=tmT2NwDjj8bfQbdMkIGY2YjDPKm0YLTfWJZk10f+bQMuSILDTxEAVs0VdfmbkUqMHC
         Tjd1yn1ZkdF2HBjgzVPs1dz6rd4Aygot+krES5typbxrzS4egI/+z08allpO3l3TOeb+
         RQLxJoPUyVfnJeoG7i3Q0r7saNMLmY5bPb3WqJ54uiBdCytn1MzufdJ0DLscPiHqKmAg
         FJ4K+AYpxPJ3Hke98FrPCPIhGxC0fMCwko8Q0qlKApJP3bDLlGmtYhM/onpb95d6K9Mc
         f3BUudJp4PQrUDe6crxuDhyR7vw7xiAk/j15gqvx57gDdNaGVMpKqBfrbgrIv6AKVrLm
         NUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JdWZ2Pk1OFPUwPBsoB678Mi8MqbdY4ggPgKtXlI/SK4=;
        b=rhPK41KPhrqGH6IHNfmCX+MMngGrbrCY8Mnd1Rdg8HQTNfbsv9jTYPYGHXt+gt2X3G
         ScfPaui6FN05qF3GOvjUyuk1dDBMB+vJTNrGtAiNLn097r3yt/p8nr9kqMEz+i4Nfi3A
         ddOy3X4S0Ahv12aluMq9doZHO64iSOAzEZjs88QpGaLCs435sHExIOPl7Qze/t97Qq4u
         xwtbAiHkBsRRKw9iQoJ+MqsvPY8ZMYJgM+m0g1bKme+i4/1XTTvZoflJ0zUZPLaTgMXI
         tHCbuHDapAjILeeyPZNH7NnQsWqy1GYh+nzHmQt7vDfRrm3UM05VH08i3EwNvuPKkZNK
         W9xg==
X-Gm-Message-State: AOAM532/ablpgSz0c+NW3fZPLH/XRFnRzs6LcRdX4owiYeIWM/QQpyVp
        qDffhi57Hoa2i0x0rPaRQUqQ6Op14CRj5fzWVwXtkQ==
X-Google-Smtp-Source: ABdhPJyZMYbSapCUAF75EOCuZAjdXjhZ+BEiBYaZzhIBzbUzf7PgwgU03PMTn0yH5XnqH4CgTnhtc/1VsDlALIWtp7Q=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr9572843ljl.467.1608122514851;
 Wed, 16 Dec 2020 04:41:54 -0800 (PST)
MIME-Version: 1.0
References: <5fd76cf2.1c69fb81.6f19b.b16a@mx.google.com> <483b08f2-09c3-e753-d2ce-4e34fee627f3@collabora.com>
 <CACRpkdbozXM3FHQB9+GcPJZdNT+Vi1223m2uEqqJ21ukY1A4Gw@mail.gmail.com> <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
In-Reply-To: <8e5e0251-9450-5c93-cd2e-c44779a72b0c@collabora.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Dec 2020 13:41:43 +0100
Message-ID: <CACRpkdb8Bgie3dJME5qQwu_33b6zVYzAayJnHJUCzrkntpNNXw@mail.gmail.com>
Subject: Re: linusw/devel bisection: baseline.bootrr.mediatek-mt8173-pinctrl-probed
 on mt8173-elm-hana
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "kernelci-results@groups.io" <kernelci-results@groups.io>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Johan Hovold <johan@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        Sean Wang <sean.wang@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 16, 2020 at 11:10 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:

> > It seems we need to teach the core to ignore the name (empty string).
>
> OK great, I see you've sent a patch for that.  I'll check if we
> can confirm it fixes the issue (something I'd like to also
> automate...).

Yups would love to hear if this solves it, it should be in today's
-next.

Yours,
Linus Walleij
