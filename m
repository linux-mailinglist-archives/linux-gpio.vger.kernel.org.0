Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B9F510BA0
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Apr 2022 23:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355463AbiDZWCp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Apr 2022 18:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355615AbiDZWCo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Apr 2022 18:02:44 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2321818CDA9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 14:59:35 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id r189so128214ybr.6
        for <linux-gpio@vger.kernel.org>; Tue, 26 Apr 2022 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bpxs3BwsRsNVGR8rV+H1S/A34takD9t6PW/tK7Nuns=;
        b=rQrWMCWuHFbF3fA9np1al/NM6sLB/JVBaqI3xHXuG6+nPXC8BDAdkBeT6D19OTXrq0
         NSc/OxVS+gT1SCyw5YAOZDlwIrOtbf+Q78CkXJB7hF2B/2A4eFvhie2pcoQPpLxVW4ib
         mhKgvVfOJ+UgrJcHisKxEQPTZ9v0Lwt3NB6/N4O9I1U+0rQiESSjJaGx5Iu+TKa2E1Fg
         9VCX+hWONIn782AUxluTfo/LPp+PeiLA3NSBA6uCSNzwyvaVLuTV3BMHNjzqpcBAi1nn
         rB0cH1p4qIaWAd7LAyMJhfbKrmYqRx6e4wgzQgHXqFrN5zibWycWzHr0OFUsWplKJ7zh
         4bpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bpxs3BwsRsNVGR8rV+H1S/A34takD9t6PW/tK7Nuns=;
        b=e+s2nmHl/rhmaMWlqrIxxN+zJnlwqutHfMyPSdVJkEs0HWypuE3QjFoMUxc54oDIWs
         9Q4xwxhK32x7PYPwAIIKKme8x9X/+3YGFvdEoz3n/Hp5KOVK7HPlzP9TMYgrcohLo4Sg
         ucFRiC5L/oQX8ehcTa9+k99vNnNXSyLf2ppq6vs+GF0cRdvssKosPmX60vjtpal5dGCY
         60QZdb/ry0/61BtzUKTOFrk6PADalTBYbGVlvCBvWqi+9Bnh8Kaw6jWsfYUjciydVGG9
         oLcdJXkC8I7y6mCQ7NCor2QHB2YkTgveJor6fF6f1ssn/LXEO/DZGFkfz3J250a7ibSd
         sZLg==
X-Gm-Message-State: AOAM532DC23UN66ChLBXTf9GsZmEzxIrSom8TT0MV92x4NUQVhbXF4Uv
        nZhqGgDrzOnIJ/9jZKNw/9Vg+sOzGrhE+vTnbo3tug==
X-Google-Smtp-Source: ABdhPJxmNWf2WAOTBOGYlwqgY2kNnoEeFKfKMFvD28pKOaD0KFUI3oAtcgVaqXsBmJf+wSb/F3TYdyLteg2ZEsK/pP4=
X-Received: by 2002:a25:a12a:0:b0:644:e94e:5844 with SMTP id
 z39-20020a25a12a000000b00644e94e5844mr22727605ybh.492.1651010374328; Tue, 26
 Apr 2022 14:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220419141846.598305-1-maz@kernel.org> <CACRpkda3L_itpqcnPq6xDoJtNHt8NuvE1MZk1bCNR+u2KKUpBA@mail.gmail.com>
 <874k2kccse.wl-maz@kernel.org> <CAHp75VcKNurETpNtrZM7SN2XEtLM6ZYFrS-gKr6r55Lc37gKQQ@mail.gmail.com>
In-Reply-To: <CAHp75VcKNurETpNtrZM7SN2XEtLM6ZYFrS-gKr6r55Lc37gKQQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Apr 2022 23:59:22 +0200
Message-ID: <CACRpkdaO+KTb+jJQ0qY59TP8f7gyY2mTUtNEt5+KUHNQAYU1bA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] gpiolib: Handle immutable irq_chip structures
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Joey Gouly <joey.gouly@arm.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm@vger.kernel.org,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 26, 2022 at 12:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sat, Apr 23, 2022 at 12:30 PM Marc Zyngier <maz@kernel.org> wrote:

> > You can pick it up from:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/log/?h=irq/gpio-immutable
> >
> > but I can also drop it from the irqchip tree.
> >
> > Just let me know.

Pulling that looks good to me.

If Bartosz pulls this to the GPIO tree I will also pull it to pin control,
I just want him to decide, because the impact is biggest on GPIO.

> I would prefer it if it goes as is now and every stakeholder can just
> pull it. As far as my drivers are concerned I also want to convert
> them sooner than later, meaning I want to pull this into my little
> tree as well. Bart, Linus, would it be also preferable for you?

I'd say let's all three pull this branch, Bart?

Yours,
Linus Walleij
