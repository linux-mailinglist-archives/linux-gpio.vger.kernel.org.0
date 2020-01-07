Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B23A1322E8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 10:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbgAGJtZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Tue, 7 Jan 2020 04:49:25 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36590 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgAGJtZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 04:49:25 -0500
Received: by mail-ot1-f68.google.com with SMTP id 19so63185839otz.3;
        Tue, 07 Jan 2020 01:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yTkMq4Kgxs+bgJ12u344a0U4C5wtaNMcJkHchqqiJ6c=;
        b=srQbJmpIlH1buQSSPgC8kwZNd+mRlIlYdQ11ItsE6OL73wfPvPT636aaA7Qdg2+/Cm
         CBFFjkaghUPwc0M1l+jyX1DlE70n3/BrTiAbiDlwxPsLLKEosT+mls2OF4S87fOe1Fpq
         pWTu2v/PL5gIf9TZlRuFl9zTXMlra9mXx+ySOyETQ1bPvWNbDIyHI6+0gbK+iPVF1zvD
         lNh41i2ykDSQZAlupAotYoNJDUemdb8+HgRaQGNhf6W/kqKI4X2lUDDuavWTwNaxa7SR
         rpBEY0zmc6sb+hdjF9KrWnJROsMyghzSk89e88hWeNrR635iVFw5ggAZED4dBUx/FQ+M
         zsvg==
X-Gm-Message-State: APjAAAXsUH2jrxElBgIc4sr9DAxc7t8CGZc84pYFaYP33TYbq/C+V4jL
        WYl2OVoTlDujHi594uY+691RCgcO6s1GfNRYsVY=
X-Google-Smtp-Source: APXvYqzRVR1QAO55iw2NC5cGRGVkVKTwPXP9+cfKieV2+EpwkfBXjfsqLNWDsvanUJXDoTlmdwv0shF10XBiHgmiOD0=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr113370808otf.107.1578390564626;
 Tue, 07 Jan 2020 01:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20191230133852.5890-1-geert+renesas@glider.be>
 <CAMpxmJVN3f5vWZoUpgsM0kocmBYSO=T0OeoG--5rQi9=jk2t2g@mail.gmail.com>
 <CAMuHMdVo7bvCKjn2-SD4j7EPwDPeTWn2Sh2e-Moj+RkqudZGuQ@mail.gmail.com> <CAMRc=Mf6CpsMpqwXjzC7jF0rxchSop+q7GQ2xgooKVRuC52VPQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mf6CpsMpqwXjzC7jF0rxchSop+q7GQ2xgooKVRuC52VPQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Jan 2020 10:49:13 +0100
Message-ID: <CAMuHMdU6pF6bB4gWZhJyBVTVRG59ucinW0K6nrjrYZSWvLXYew@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Tue, Jan 7, 2020 at 10:03 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> wt., 7 sty 2020 o 08:46 Geert Uytterhoeven <geert@linux-m68k.org> napisał(a):
> > I'm happy with a (static) GPIO hog.
> >
> > BTW, what exactly do you mean with "mux framework"? Pinctrl/pinmux?
>
> No, I meant the multiplexer subsystem under drivers/mux. I thought we
> could call mux_control_select() from pm_runtime_get_*() or something
> similar. This is just an idea though, and I see Frank already did an
> in-depth analysis so never mind my comment.

Thanks, I wasn't aware of drivers/mux/...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
