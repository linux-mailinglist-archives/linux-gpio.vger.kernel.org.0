Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE30A295DF8
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Oct 2020 14:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897833AbgJVMF2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 22 Oct 2020 08:05:28 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36421 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503373AbgJVMF1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Oct 2020 08:05:27 -0400
Received: by mail-ot1-f67.google.com with SMTP id 32so1252610otm.3;
        Thu, 22 Oct 2020 05:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Aw9svvfYcue3aKVkE3MHGWBr/KB7sEqHl2Ge/50Qks4=;
        b=B+qtLenbTBXbUHDNbyjvjVbt94iDvqNOw41VOe1oXdwKP/UYdqGFxrlvYs3Bq45Uat
         ZO6Y4jLWT6yySAOp/OzvpBSFg3DKv6kJOUiGdVnumGR58CraFHOvKFmaHrU+fUpHMKB8
         qLNNsvmukaByA3gt73MGRQRp/I2XrrkTos+z3EAafdxcpvYnyonZTXPJBLu17SjCXYHG
         Ip7GzAK6BizndZWOgqWv4kfWlX6VscpxwivmZSmnKn9fRZdAsmwA+CUJdaM1qyrkvO9C
         tN8ad2gIp4+7/380L9eU7CXsMZwYNl0nJjulruYq1IEZ+YZtZeYuzR1fV+HS6Dhu8tO0
         I27Q==
X-Gm-Message-State: AOAM532aePDcK4mKID1KpI7y/onDqA6hVkF24uqm3L8hYikEtaw/waTg
        b3VmHB9mQy75cmQfQMf3UGzILbzaSyWQydv5SDK8aC8u
X-Google-Smtp-Source: ABdhPJzfDjCACQIXaBB7HY3OjzcwzsHPTUn4GqZL8gbOXcStsr4RNfDdorfdB3bu1FZR/tBtwqRlss2OQ00c+eibLGY=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr1695082otb.250.1603368326819;
 Thu, 22 Oct 2020 05:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20201019124258.4574-1-biju.das.jz@bp.renesas.com>
 <20201019124258.4574-5-biju.das.jz@bp.renesas.com> <CAMuHMdXJ3TxDdge8juLMS7ZmWm9f8Z-dxt-CSAD-GjEvFjNE-w@mail.gmail.com>
In-Reply-To: <CAMuHMdXJ3TxDdge8juLMS7ZmWm9f8Z-dxt-CSAD-GjEvFjNE-w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 14:05:13 +0200
Message-ID: <CAMuHMdW4O4+NTC3KkPhb2uFwPOFhdzgpWRXF8zAAMXZFU_ndjA@mail.gmail.com>
Subject: Re: [PATCH 4/6] pinctrl: renesas: r8a77990: Optimize pinctrl image
 size for R8A774C0
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

On Thu, Oct 22, 2020 at 2:04 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Oct 19, 2020 at 2:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > This driver supports both RZ/G2E and R-Car E3(R8A774C0) SoC's.
> > Optimize pinctrl image size for RZ/G2E, when R-Car E3(R8A774C0) SoC is

Ooops, R8A77990, twice. Will fix while applying.

> > disabled in the defconfig.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
