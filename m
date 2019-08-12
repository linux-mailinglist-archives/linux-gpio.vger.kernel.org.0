Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E180897E3
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Aug 2019 09:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfHLHbR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Aug 2019 03:31:17 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46019 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbfHLHbR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Aug 2019 03:31:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id m24so2510007otp.12
        for <linux-gpio@vger.kernel.org>; Mon, 12 Aug 2019 00:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kOV+GIDelXqXKHXX2uf4vLKGJ/0tn4K9zVaIZzoQhtk=;
        b=CO/4SFuFj2g3wA5gGwP0RdFMGd9zRhVBnMw3wQ4FQ3kfX80loRwuEMOgClAtCKddYR
         EGq37mDhZ3AutQ2EOkhvf74T8jQBM7+NSFah9RmWtLr7ALP82PD8T/c9wda0oli0cnYe
         uHi36VHPI0lMIvhmEwPxxB7gkdOIsfn7R7PZs385vDIqwPk78YBcyy02rbacxs09OtGC
         cGlJ7qNYagD4xt0zH0gFSYLyAi56FHIwsj1g9o5NavANG6TPFDtrk/YD1JMgDQrI9Utx
         zMiBxsd/A3cRN3jtFP3ImK33f1uKdWAUGrQiaTQyrbe+wY5XY4NNy8E7DLt8c0C1noSE
         hhnA==
X-Gm-Message-State: APjAAAXIQuxNoyKk9uASUO1HRQkmenVPrlGtaHnkAZ1sAqIyLBK/g5pk
        GOZ3dj1XBI+T5jx07H9AURJ4XXDO3FsIpuk+MZQ=
X-Google-Smtp-Source: APXvYqykGrieUfjC/JaXrc+tbukazqZCKneVvarC6LaquXLVSJXaD/APzWjpCim7PEzGLolc+CO/PxGoKOT3ewYRBEI=
X-Received: by 2002:a05:6808:3c5:: with SMTP id o5mr5958425oie.102.1565595076498;
 Mon, 12 Aug 2019 00:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <201908061021.pQY2TnEK%lkp@intel.com> <CAMuHMdU1djc8-c1LvNLFyFa0eH9C3k8nxjN_6F40S43mYZH7Hw@mail.gmail.com>
 <848e57bf-41a6-3e3e-6e72-3c15acd76902@gmail.com> <0ef2d73b-c815-e3e7-a037-db7672bbb413@gmx.net>
 <f1032537-aba1-7db2-2651-b9c6f27445ce@gmail.com>
In-Reply-To: <f1032537-aba1-7db2-2651-b9c6f27445ce@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Aug 2019 09:31:05 +0200
Message-ID: <CAMuHMdX_c3+FF0WF6mtgOcrf-UO2mNbJ3NCLMTm2C3gkSSpFBw@mail.gmail.com>
Subject: Re: [pinctrl:devel 16/46] drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10:
 error: incompatible types when assigning to type 'volatile struct SHIFTER'
 from type 'unsigned int'
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Stefan Wahren <wahrenst@gmx.net>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

On Sun, Aug 11, 2019 at 11:13 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Leaves the matter of who prepares a patch to atarihw.h and users of that
> definition ...

At your service...

> Am 12.08.19 um 09:01 schrieb Stefan Wahren:
> > Am 07.08.19 um 00:41 schrieb Michael Schmitz:
> >> could be renamed shifter_st, I suppose. Only used in
> >> arch/m68k/atari/config.c and drivers/video/fbdev/atafb.c.
> > looks like you've come to a solution. Is there any action required from
> > my side?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
