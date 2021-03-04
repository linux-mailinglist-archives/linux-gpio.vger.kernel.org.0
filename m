Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8692932CEEA
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 09:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236904AbhCDIyx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 03:54:53 -0500
Received: from mail-vs1-f44.google.com ([209.85.217.44]:46687 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236951AbhCDIyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 03:54:20 -0500
Received: by mail-vs1-f44.google.com with SMTP id p24so5095864vsj.13;
        Thu, 04 Mar 2021 00:54:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZMzfpcgnAf1v5noz08od6WWvHqXT4tMEOZFaz8gH2UQ=;
        b=OY2tWuJgWxEJevemLQXspnoTA0BDe56Mrjm7pkSZTv4/JPXEWjRMDUqSLSdFPd9nUn
         S+ipqXDw5EXSqWn8vHJoddnAs++yUgqTmTilDL1yoMBGHfdXGCwbp6DtyWHnq9EZjIHx
         6w11gRJkCw4uoxCPf2Zjsb1FfoMTBpye8d7w1xqTfQRub0cA+ENoUSr9kv0tJKZ0+3sa
         hWG16ZdAoklmQx6ZxMp8NiaACsINeL4jB3bFSpUgCZPJ359IjVORXt/DV6+KHGjEzjgQ
         mlZ0Y7PVIRP0vrvOrxjmthJseUM3LA9yF+iJ9Aod8x2iAWzv5CJjqS3wiQClnrxg7MC8
         bMJg==
X-Gm-Message-State: AOAM531DgbIDK/pQRTtVPLb+EFs59q0xiAWls8benEc9CtzDSfNIfcAY
        eE5F1Q3fcVqbqFMG7FwEB/x59s/NsGur1IqPhXzVazZd
X-Google-Smtp-Source: ABdhPJwEDmvFg7CA1x1rQSdt6DxibKl0quceRtqHICWqSr74fL77b6TCSK4R0J+dVCNQNI4jdn5sJfbi27Sf1OaIxRE=
X-Received: by 2002:a67:f7c6:: with SMTP id a6mr1833414vsp.42.1614848019967;
 Thu, 04 Mar 2021 00:53:39 -0800 (PST)
MIME-Version: 1.0
References: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210301165932.62352-1-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 4 Mar 2021 09:53:28 +0100
Message-ID: <CAMuHMdWLCE=qrpzDpZQAxCeCc6nxq74g_Q5hNs8ZG+_0p89kMw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] lib/cmdline: Export next_arg() for being used in modules
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 1, 2021 at 6:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> At least one module will benefit from using next_arg() helper.
> Let's export it for that module and others if they consider it
> helpful.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
