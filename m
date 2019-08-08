Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8261385CEA
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 10:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732060AbfHHIbU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 04:31:20 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43957 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731677AbfHHIbU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 04:31:20 -0400
Received: by mail-ot1-f68.google.com with SMTP id j11so14981948otp.10;
        Thu, 08 Aug 2019 01:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iXMOZAOPp/kxW4HPboOr7lbxbkktN0hF/10EUasUADA=;
        b=UpDnH8BfjGWVvs2gXm2tD1lyaMjyYbjo3gvKB+nK+FTWK8gpoYKdYZdZhD6dM7TP+f
         og1SsrW70+WAY6UoX8cfxrgQHHEhO/pEpf2LRUoLPp8IW8Z0SjriiZwVOv+AgZDq6Nyc
         Z4JXZ3qP0WSXsed6JrfdDf+K4ZbCePm5k9egFre45afmd5WjV00HlrymuGL28itJoToa
         fdwB9xPHK62rvdEOk0rBBNPS8ury375mzdfWiv9CTtgpheMFRbL4bN6OBAw3mRLvGFoC
         RER03UpRoIYE2LoFTtCcBTaJCK3H9OCnVhvoGFsH7luapy3AcELovv+H9RYP43NwGQR2
         PB/g==
X-Gm-Message-State: APjAAAXG+KwNQUAerQx/31IcRfcOlxVaUvPB5h86bL3AKFVwH8S/6KPs
        Qbm1xd4VOj1UPm3cpTSiROSQkBYo2f2KbhNMKsCSjw==
X-Google-Smtp-Source: APXvYqwWQTKCvDXI8JtC//JpwD5zdx7xFJiSgt8gwS3WjOg7D0hIsS5E65xe7EsHk/PpTDE96Qj72N7KBxF1JiIWWs0=
X-Received: by 2002:aca:3bc6:: with SMTP id i189mr1658775oia.153.1565253079486;
 Thu, 08 Aug 2019 01:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 10:31:08 +0200
Message-ID: <CAMuHMdXx7ger66b8H5cxeEJTkZmVsTcdPE2mnsFsZ3s6EQJ8Lg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: sh-pfc: Rollback to mux if requires when
 the gpio is freed
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Shimoda-san,

On Thu, Aug 8, 2019 at 8:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch series is based on renesas-drivers.git /
> renesas-drivers-2019-07-30-v5.3-rc2 tag.
>
> About R-Car PWM driver modification, it seems to need more time to achieve
> output duty zero about suitable gpio vs pinctrl handling. But, I believe
> this pinctrl patches could be applied into the mainline regardless
> the R-Car PWM modification.

Thank you! I plan to apply this next week, after I've sent a first sh-pfc pull
request for v5.4, and let it soak in renesas-drivers.

> Changes from v1:
>  - Spin-off the pinctrl patches (from 1/7 to 3/7).
>  - Add Geert-san's Reviewed-by on 1/3 and 2/3.
>  - Add Fixes tag on 2/3.
> https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=143129
>
> Yoshihiro Shimoda (3):
>   pinctrl: sh-pfc: add new flags into struct sh_pfc_pin_config
>   pinctrl: sh-pfc: remove incomplete flag "cfg->type"
>   pinctrl: sh-pfc: Rollback to mux if requires when the gpio is freed
>
>  drivers/pinctrl/sh-pfc/pinctrl.c | 45 ++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 22 deletions(-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
