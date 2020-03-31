Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AB691996F8
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Mar 2020 15:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbgCaNFz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 31 Mar 2020 09:05:55 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43660 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730473AbgCaNFz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Mar 2020 09:05:55 -0400
Received: by mail-ot1-f66.google.com with SMTP id a6so21866240otb.10;
        Tue, 31 Mar 2020 06:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2lL3cc0+MLMUVgNxutwV4nelpkfVoe9QC8B4R4mxIaY=;
        b=hVzgIplCZND9HdgX5wfEz4cfSLChljNDSYtWHuDeJ94Iv7+Lw1v0S9whlRP7CClmJK
         2fycJj7UlQXEJ0FFTQjr/yeZPZIWOeuUxxphcXWKOuwhw23l5uUBFo/Ta4g6kwMPk/rW
         8DoQJ0F30Dq8SNq0KEm80gAC9vSamurhs4eZFR84anBK6BhVfnMpKASeGo2M4MeWB4Fi
         jctII3gfrNjWTMDw1EMkJmzs90C/5+WcVzPr3mXvaxZO9j5c8r2Y+0AlDVdPv7siGVBr
         ScrClouoIKLPvEqdMJ9Yl9HTBr/kwxUbooBmDblNVvBhu3WjK4jNlKmFITF6Uy5sRB13
         /7bw==
X-Gm-Message-State: ANhLgQ1E34xNVXikYakmR4cqu3rvhJ6CZjX77r/2mui4By7ptOWmlPBs
        NryrSwL7c92h8g3UPgp0jAGH1bQiXAIW/ON4PaE=
X-Google-Smtp-Source: ADFU+vvDqnuQ/DJt2n59x2spJjEJqGsVW0X1eFZ0rsGDSujIauwzGg83pehLslULQgKjkVWIbuVCHg9KB6/4G2QjJsI=
X-Received: by 2002:a9d:76c7:: with SMTP id p7mr1737406otl.145.1585659954586;
 Tue, 31 Mar 2020 06:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200330090257.2332864-1-thierry.reding@gmail.com>
In-Reply-To: <20200330090257.2332864-1-thierry.reding@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 31 Mar 2020 15:05:43 +0200
Message-ID: <CAMuHMdXiK3KLU1=s4ykxmUVSsgwbnnc476w=Nnj-HsVytK2Lqg@mail.gmail.com>
Subject: Re: [PATCH] gpio: Avoid using pin ranges with !PINCTRL
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Thierry,

Thanks for your patch!

On Mon, Mar 30, 2020 at 11:03 AM Thierry Reding
<thierry.reding@gmail.com> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Do not use the struct gpio_device's .pin_ranges field if the PINCTRL
> Kconfig symbol is not selected to avoid build failures.
>
> Fixes: d2fbe53a806e ("gpio: Support GPIO controllers without pin-ranges")

WARNING: Unknown commit id 'd2fbe53a806e', maybe rebased or not pulled?

Fixes: 2ab73c6d8323fa1e ("gpio: Support GPIO controllers without pin-ranges")

> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

This fixes the build (and boot) for rbtx4927, so:
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
