Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83269295DF2
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503669AbgJVMDv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:03:51 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38707 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503634AbgJVMDv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:03:51 -0400
Received: by mail-ot1-f65.google.com with SMTP id i12so1246265ota.5;
        Thu, 22 Oct 2020 05:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T+wBteT9uCZDWtiNvkvfA2P5NqnNbQ/aqNuQXzNvRJ0=;
        b=B4xQDCXxFPfxAKKc8Gp1gFOo+qNMSL/cYNO9RfjC0tzj3O1n2rlICzmKOblhJleVnI
         qu76uQQNIKB32M6IMLmg68GRSzEoGtiLF0QPaRii22nx1R/nYZmArZy4dTDTS1cVCgOC
         a9ZURgNXdqfwafRzkIN1i4AS4xxpzC86zf531AbIMCVrOXwJ1i58vPOdqWDsG1/PN6kG
         K7cEu6/lO0NbjIGXCOotHBlHE54XdpAOngjcls+c4tkC5gmR+qM1xNmdE2jayntFcyOP
         qXQiXeAPCAuBCXOo9bFrJ/u83wqLxoG2tri9wZM/NaUtbiwP0TpQ0e0OxcEh1uf/RoZD
         rxvw==
X-Gm-Message-State: AOAM530gQCxIfbb1Yo+wm2VdY9TMl4OxxUahdTaNwXb84BReNFz0eVWV
        zmcdnlEMipLSiejlUaXedvQ+Uz57YBBBfEW9pek=
X-Google-Smtp-Source: ABdhPJywa0iB1O64YYDmSpIydwdoCi/JqJ5+3bfV2rhOzWRPhw8rRDLr+msdISqcHwxGxYcuJuTYpaJKVw7mccDui3A=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr1688690otb.250.1603368230486;
 Thu, 22 Oct 2020 05:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com> <20201019124258.4574-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201019124258.4574-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 14:03:39 +0200
Message-ID: <CAMuHMdUvaevRPVXkbQqy54zNrMExMQzO6WHJKoJcJhOtDwZTCg@mail.gmail.com>
Subject: Re: [PATCH 3/6] pinctrl: renesas: r8a77965: Optimize pinctrl image
 size for R8A774B1
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 19, 2020 at 2:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This driver supports both RZ/G2N and R-Car M3-N(R8A77965) SoC's.
> Optimize pinctrl image size for RZ/G2N, when R-Car M3-N(R8A77965) SoC is
> disabled in the defconfig.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl-for-v5.11, with comments added to
the #endifs where appropriate.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
