Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9A6399BE
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2019 01:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbfFGXdK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 Jun 2019 19:33:10 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41278 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730389AbfFGXdJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Jun 2019 19:33:09 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so2790979lfa.8
        for <linux-gpio@vger.kernel.org>; Fri, 07 Jun 2019 16:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b84e26eYaKgGCT6K1FjZ9jXnFTuxlUg7JfvW+0XdYtc=;
        b=l3jz+3Ek8s0CZvnWEPDNeCfepaK2+5mKU1CCkn6P12a7vmIsN31sFpahBIi8kf9N6U
         b6M6+ezCfd0mVfoKnj47oS9psfl3AYh+WvkryghgekPpS9i1Ok4xhjaaDeyw1C6zItxt
         onAc/Vl1RhQdwg4IVbQ7wj+yXPvpi/foqsaAVG+Xrk77X+MVi//MlvAuWf2zP2PXHhs5
         4aJMEnbPcp79QKjeWNxdXY4I4OaPTzYOuRtpB37NqJTt1nWThZAPbsswJI7DRbYPVjwD
         OHUMdFeqGGe5xZVj6gfvUYjPngmcbaUkKyjQ3D46zbKS4rzGuN0tVtThnGq4bdQooOWv
         NHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b84e26eYaKgGCT6K1FjZ9jXnFTuxlUg7JfvW+0XdYtc=;
        b=j3JgMSJxWdqcc+fm9EfjsWXmQhMkolcsOHQfGuU8fHjrKJyrRdQLBvo/T94yyhk2kj
         d1S//r/a7oWW4S9y5qgy5PmeECbducM09UB30oOhdw9+OVBX0Y5KfsRuEypVUiFfi9hj
         aV0Yw6P6t6Kgk8waMHWU+RwWbpm63bj7sRQS6oECUcC9E9PaEmMvgPdpCXQROqs9693O
         MBetIdZGzCkZESYEvoL1J7v7kgvk2x/ZG7c1JbzyOhart7R1kB0d1YOVzQOPgXfEKUz6
         x7GreQpenjTYWNZTq0TeOh/bAUhZ9kRpSpTrXjAxtomSAa3w43bAGJYCc/O3hHBai1Kp
         AMPw==
X-Gm-Message-State: APjAAAXiJ6FZOpDFRlUzAflce6LpOdgX4csGGYqjQ5QaNgpbTjmCSqqg
        ITkyUNZm9YrehEF27IS6alcFhrmZZ8iJ6JTsbFvkucO5
X-Google-Smtp-Source: APXvYqzZLdmSsLlcph+VEzMPX3mWCaT3njpPwLqplLMNQBLXG9T9Pgz/fKfOhRBQRz5dDTEtP7/e6ZX73GUIjGYu02Y=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr27044811lfn.165.1559950388186;
 Fri, 07 Jun 2019 16:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190607072433.17253-1-geert+renesas@glider.be>
In-Reply-To: <20190607072433.17253-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 8 Jun 2019 01:33:00 +0200
Message-ID: <CACRpkdb1Qn+jN0AmJ7dn3PCBHfhGjZ-49Sqe=qdzZw3H071=GQ@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v5.3
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 7, 2019 at 9:24 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.3-tag1
>
> for you to fetch changes up to 992968d78626031a264d847e25f8f9810b9a1b50:
>
>   pinctrl: sh-pfc: Remove obsolete SH_PFC_PIN_NAMED*() macros (2019-06-04 11:19:25 +0200)

Pulled to my "devel" branch as usual.

Thanks for the great work!

Yours,
Linus Walleij
