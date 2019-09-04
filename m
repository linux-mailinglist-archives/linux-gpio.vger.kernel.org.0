Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C100A8464
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2019 15:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728878AbfIDNVA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Sep 2019 09:21:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38445 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbfIDNVA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2019 09:21:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id h3so12754621ljb.5
        for <linux-gpio@vger.kernel.org>; Wed, 04 Sep 2019 06:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H/McqjCJwAceSRkY4OhVruox/1oDcb1iEk95KrzZ0uM=;
        b=kOu9/J4oiwzQUs+JWQhch0uDUfTZFjc7xHXiPEiAmOvmP2h6dCCptcuFiW+oHsaIq1
         KlXB1yt0loRXNB4Ow+61skHlH+XdAg7Jmv++lwL6wLe9JhZKCkofxqYwgbCYqfgSdzhb
         mpEsyIwvzZ0iwJhKiqL1HcBCx1NnLGwAlfH6Dlm80YJAvBe80O8hCxCvnmO10Gf3ihAR
         oPiV+4iyEAt1paL5KZ2SopKpLCYNw2nRg8JgpF93s4HWh1nqHjy1DUIxQdJHuhUOfxWh
         6DUUUYAp7oWWf4xg846nocTiGn7RyPoMfhzaswVSdz3vtKoDS+cypViBGpce4/4NBTZo
         UxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H/McqjCJwAceSRkY4OhVruox/1oDcb1iEk95KrzZ0uM=;
        b=Ey6odzupoLrNHBnI1D3CNi8288Gf9E0+ajhd7VW2oAGRfbHHbDIeIJjtGyNBve+Yq3
         toMXRGspgoI4LrDzmI+XRsNLT/HJyh8cojT2WUSjDOjO2GdeBxIA4ne7fLnMGkS7ZPep
         0tpXxwyPu7ItOgVycV8vBlv10Oxbqm3B0aPZzIU1Xiyczt+d/I0BK3V3SpVMqk3mEjVM
         CMbTWYSqVIuFH6mWxKiTBmNdz6u9BbXTu4MvfUsEd3OFvLRyrm6q37KsUFVoqyh9oFuD
         4iE+ORT6prH7WXushIZnkY6c4bXnVLjyaP1sgK4RmeB4y52G/ypdk7majYD5DaFzp20E
         aARA==
X-Gm-Message-State: APjAAAUBdEYrH3XgdG5ZYb9gliDFkloohuIHDHpds/z6t3UEhlHvglMo
        A3XM6REIYuVd+H7RPPZmpTj9MvKDjV133sWROamuwg==
X-Google-Smtp-Source: APXvYqzGTkq9u717QNZGpj93H4Rf1yfAcIH7h5WDM8Xifk8kBItvQoTYBizWwmFWkVNn388LuV8H1F9CKd2U9lMtH3c=
X-Received: by 2002:a05:651c:28c:: with SMTP id b12mr23225191ljo.69.1567603258542;
 Wed, 04 Sep 2019 06:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <201909041904.FgFKdAf7%lkp@intel.com> <CAMuHMdWLR-2Wd7M+KAmk7mKaCw=pUTY4DCehFwbrg_griPrGoA@mail.gmail.com>
In-Reply-To: <CAMuHMdWLR-2Wd7M+KAmk7mKaCw=pUTY4DCehFwbrg_griPrGoA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 4 Sep 2019 15:20:47 +0200
Message-ID: <CACRpkdYkcR8MAzoQBEOvKQvNwut=uteNaDEs0JZCs5VrOkd9AA@mail.gmail.com>
Subject: Re: [pinctrl:for-next 16/77] drivers/pinctrl/bcm/pinctrl-bcm2835.c:995:10:
 error: incompatible types when assigning to type 'volatile struct SHIFTER'
 from type 'unsigned int'
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kbuild test robot <lkp@intel.com>,
        Stefan Wahren <wahrenst@gmx.net>, kbuild-all@01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 4, 2019 at 1:44 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> >    drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function 'bcm2711_pull_config_set':
> > >> arch/m68k/include/asm/atarihw.h:190:22: error: expected identifier or '(' before 'volatile'
>
> https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git/commit/?h=for-v5.4&id=053b514295694f3336e97f56d5f41c0d4972c109

What people sometimes do to shut up the automatic checks is to merge
the patch into both trees and let git sort it out. I'd rather not, though.

Yours,
Linus Walleij
