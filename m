Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0165610BBF4
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 22:17:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733175AbfK0VRU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Wed, 27 Nov 2019 16:17:20 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33656 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732942AbfK0VMw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 16:12:52 -0500
Received: by mail-ot1-f67.google.com with SMTP id q23so14553812otn.0;
        Wed, 27 Nov 2019 13:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cImB892YXUVPGGhFezh816WamO3nmCEALpwjUr8+dkg=;
        b=RbKyDyUvhoYEyGwnd4XwOAQk91C3qXm5+tXlUAkZ++aa7hlj0RbkYAUoEI3q0TtOFl
         Fq7aIi7retxQwbC1yQBEbsro9vwRZ4xG2IymiU+sQ+xlqTmcNeF4ijIO+2jPcX1ZXQOj
         sEMsJEkIyCWVgrEUcBiSNSYdc9hTzOD/23/2n2HiWEyYMxmoOq7hI7A8ZDNMfOfzjsvs
         kHgys8t+Wp1yim9DQ9x1lK5w8w3ySJCs1Pi7YgWQGN0/axtp7XkscD4oDKYPRPV4cxeL
         yp7a1jEhw9zvplzZXCL1EskiZtPDzUeUnUvbwWikE73VFfLoFESc1zhB+Mk14VKJPCEk
         sLaA==
X-Gm-Message-State: APjAAAVkP6xci/9VL1L5vjfKvYlbddXt1zIGrb1aoB21UbyJzi//TvF1
        6VYU6a24oNQ0zJQb3jwKJD0wK8EsJNRdHnscZtc=
X-Google-Smtp-Source: APXvYqxh3g09zK8yoW4/yyNAk1QlyeyoV8wcshHdQWMv3ezyM47GygheulvdavD9PmPbPqN6RamYKOqEfquQDCZNc+o=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr5270571otj.250.1574889171373;
 Wed, 27 Nov 2019 13:12:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com> <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
 <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
 <9bacc7d9-6bd9-0b7c-18cd-d614796397dd@suse.de> <ae40eb808f420f5de4a140b8757dfbc426a8cf90.camel@perches.com>
In-Reply-To: <ae40eb808f420f5de4a140b8757dfbc426a8cf90.camel@perches.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Nov 2019 22:12:39 +0100
Message-ID: <CAMuHMdUSSHvQ74c156tuhWShp05TQuSmXa-kY3HNbYj0VL_d4g@mail.gmail.com>
Subject: Re: [PATCH 4/5] pinctrl: sh-pfc: Use the correct style for SPDX
 License Identifier
To:     Joe Perches <joe@perches.com>
Cc:     =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mediatek@lists.infradead.org,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 27, 2019 at 9:59 PM Joe Perches <joe@perches.com> wrote:
> On Wed, 2019-11-27 at 21:55 +0100, Andreas Färber wrote:
> > However, if we're touching these lines anyway, shouldn't we be updating
> > the SPDX Identifier to GPL-2.0-only while at it?
>
> Probably better to do that with a treewide script one day.

Yeah... But it's already more than one year after

> https://lkml.org/lkml/2018/8/16/487

and Documentation/process/license-rules.rst (which is the authoritive
rule?) still hasn't been updated...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
