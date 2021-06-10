Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1B23A260C
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jun 2021 10:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbhFJIEH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Jun 2021 04:04:07 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:33483 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhFJIDv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Jun 2021 04:03:51 -0400
Received: by mail-ua1-f46.google.com with SMTP id l12so987197uai.0;
        Thu, 10 Jun 2021 01:01:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ivptTvFqsGgv3Qpbq3w6D+6jEW1CoeV1H1Uh7PcLfwQ=;
        b=gsG0hicAD3+g3oXtGZpQ0GX7L6mYk71kjRQablYA0L0vFaXXGxCtbsrMnwiMiq0Kbs
         YUSw1rAAUkX7dLApuCSA3828hWKyasqB9sNNEQaahQutyfeIbJhD6cHIOHGTsM+JyngE
         rFNU8pQPg1kGvVXNsrxIfNO2eSjfmV3wgxDdRKSaHPOuAYaxWL8xRtA1IQ+STlG9H4jt
         ZvIWnOUVtO8/FGsUJYv5Uk6EmX73Bh5NbPUbSKbG87XuMDUwFEOREHvEroIIbdR6I0uz
         cqelXRrGLe81+jb8q4HX+7KWSw3JZj4PzqmsHEJkY0jeiTC4U8j8nRJCPzOWLscXPsN2
         vsHQ==
X-Gm-Message-State: AOAM531lyeZ1iRjh5z9zn/Lkz9nn4RDRiExhnJeGkvCzWsot/dd7QhlI
        Ui0nGcF2NeTuzWoJLe8DJ6VMZhKD7Rz0O84wotU4un1pAwc=
X-Google-Smtp-Source: ABdhPJzotoLpVM39K0bOjJ2XYffSMcHlm2zUiy03JPPBOPdQt4B0/4Dn2C8vlGyCaTGiFC9VQ4kTgbMl5iuUI3vSqk8=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr3202139uad.100.1623312101666;
 Thu, 10 Jun 2021 01:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619785375.git.geert+renesas@glider.be> <b4c9cd68f9728eb9ebc8526ee238013ddf1e1407.1619785375.git.geert+renesas@glider.be>
In-Reply-To: <b4c9cd68f9728eb9ebc8526ee238013ddf1e1407.1619785375.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 10:01:30 +0200
Message-ID: <CAMuHMdUg23z7w3ZkqiMgq67r+0d7Bfm1PM+jwKyWEFtWDv+koA@mail.gmail.com>
Subject: Re: [PATCH 12/12] pinctrl: renesas: r8a77995: Add bias pinconf support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 30, 2021 at 2:31 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Implement support for pull-up (most pins, excl. DU_DOTCLKIN0) and
> pull-down (most pins, excl. JTAG) handling for the R-Car D3 SoC, using
> the common R-Car bias handling.
>
> Note that the documentation of the LSI pin pull-up/down control Register
> 2 (PUD2) in the R-Car Gen3 Hardware User's Manual Rev. 2.20 seems to
> have mixed up the bits for the NFRE# and NFWE# pins: their definition is
> inconsistent with the documentation of the corresponding bits in the LSI
> pin pull-enable register 2(PUEN2), and the bit order in Rev. 0.7 of the
> R-Car D3 pinfunction spreadsheet, so I have used the latter.

It was confirmed that the documentation is correct. Will fix in v2...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
