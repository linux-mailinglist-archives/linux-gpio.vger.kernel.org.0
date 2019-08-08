Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2AE085CE1
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Aug 2019 10:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731936AbfHHI3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Aug 2019 04:29:36 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35460 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731677AbfHHI3g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Aug 2019 04:29:36 -0400
Received: by mail-ot1-f66.google.com with SMTP id j19so38718585otq.2;
        Thu, 08 Aug 2019 01:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+u/3qT61Q2/OcDjZCUn2YfBk48IfIziysA/L4R6VDgE=;
        b=Eb9cqxbGq1SXBCK1bVosRO2Tm/ExSHzvrhMlkkVWMXZXSXJKPgkNso6uEvQWHWXI+K
         eI2socyjIDJQDaGd8QpkhGTUk5zpPWwjhKKp+s7eox1Fl9DvNSMu5LVp3sK53nYUZdU1
         nN93j9RyNdlG5uGRKGsdzPEc572JPJ/2MOpgAuhx1ahHk7YSa637vuLU3E4CktRliacM
         o+46y7aUcx24/Zg/+qoqfvaZA9AjlqQlwzsu1UUM2VFYRW82tbcaTDLJ+i13DeRHHj1D
         gHKT124+OPMjeRdUa4kjdBQIOqjE73FY68P8ZgHbVzSU/PKhY5NaFFnYSRjJaivGDJoT
         LuWg==
X-Gm-Message-State: APjAAAVtCs6uHAMPOjwZBQHdxMsep0GRZ6xiNMkXmL6WT7up9/mQ4B/l
        AtPaKSHGmsn5hDPeesU83wW1ojxUtkVLZpsTbzE=
X-Google-Smtp-Source: APXvYqzcUNVB4t/U9lHIue/3Y61jRYncB0pQRFcKk+KuQLUQ3wfKH9JQKE6/uCxXKIpRhsfc7L8P6yxiJ84IMpkla8k=
X-Received: by 2002:a05:6830:210f:: with SMTP id i15mr12288585otc.250.1565252975601;
 Thu, 08 Aug 2019 01:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <1565245143-15018-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1565245143-15018-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1565245143-15018-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 8 Aug 2019 10:29:24 +0200
Message-ID: <CAMuHMdW32TRw3Awf-5C2eJiZ1iys-vK7YihFwqPxOP66Eh9+Lg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pinctrl: sh-pfc: Rollback to mux if requires when
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

On Thu, Aug 8, 2019 at 8:20 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car PWM controller requires the gpio to output zero duty,
> this patch allows to roll it back from gpio to mux when the gpio
> is freed.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
