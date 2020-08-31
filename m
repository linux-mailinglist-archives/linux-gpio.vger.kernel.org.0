Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9D40257AA8
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Aug 2020 15:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgHaNok (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 Aug 2020 09:44:40 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41360 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgHaNoj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 Aug 2020 09:44:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id a65so5312403otc.8;
        Mon, 31 Aug 2020 06:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=daEPM3HIxKXOlKRsZNODgFDALFBRX+kZ5NF01noQiw4=;
        b=UCplCfhDxJgBPchKjmMtFFny+rsydPohZ7VhMKHMf/q3KpYVnFRv/4AcqHKHRQEM0p
         KIo9//XXlqKAJRKWkzYHdp+uM5YVKscWcLMkBA6tJyXHE+99i1e55bJovMebb0jDgJYC
         kceolQzk7v/9AjF06ohKSPUmpBRz7ZuQD6+VTejR9B0ijveRUIE0p/X8A8OnqapRGE29
         FEHcCVo0Gt45oHP+b6aiAPces3GscFl4W0fAdj/zgvF22Q5CwQA76t4f0Ef6/+lGKFAN
         upM0grx+MX+Lz8mCT8LPnLS3XhohQb0RBE6bPeLIILnIO322mf516IKfmAoraYHQdhnO
         jTXQ==
X-Gm-Message-State: AOAM533UZHlmVq5A358ufGBM20WO9mV59vMznyJpMLFZO47cCHMPMQrq
        nSJn2OgGVFLYmOFGtEaxKQ45cIihB1uGdSfz4CnxzDAo
X-Google-Smtp-Source: ABdhPJwLSSH1oMRCIwiENsv75kHUs2oF0y8XCPUDWcLH76uaqfKesVuKA44TYXz5OiDmaSLi2zcjtOKCLFAbpUZMy3M=
X-Received: by 2002:a9d:162:: with SMTP id 89mr1052204otu.250.1598881478859;
 Mon, 31 Aug 2020 06:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <87mu2ky4rz.wl-kuninori.morimoto.gx@renesas.com> <87lfi4y4re.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfi4y4re.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 15:44:27 +0200
Message-ID: <CAMuHMdU4sXyj+AA8-Vq0A4Ke+Y6=FU7ATpP8PB5O2G4=e7zxbg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] pinctrl: sh-pfc: tidyup Emma Mobile EV2
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 24, 2020 at 7:49 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> It is "Emma Mobile EV2" not "AV2".
> This patch tidyup it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
