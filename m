Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48CA12050D
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 13:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727467AbfLPMJh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 07:09:37 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45527 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbfLPMJh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Dec 2019 07:09:37 -0500
Received: by mail-vs1-f65.google.com with SMTP id l24so3908318vsr.12
        for <linux-gpio@vger.kernel.org>; Mon, 16 Dec 2019 04:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6A9SmGG2+bj/pD1xuwTAZLvQwqgF83kKhw0ox6vXN3k=;
        b=jXT0lsCmRjPWBk1LGcpwql6bN+AbiN/lB+TY+O8wUE+pb1tql/TyWIpWSF+vqslejo
         eR+ps1L7Mq8pvKmT52XDBnWGXcLw9eqJ/p3NhY/CFYbuaVDQferDt/vJ2rexIYb6hKuO
         x0wPI6PEh96ejB2U9AzGcdP5SxpASQXQHBXIHCmxuiFyJqPGBp0ozDIz3B8pkSLHEo0l
         Y7BHqC5etKHr970u+ZS+vL8HZcvj5/88LDJH1lIdIa0TrM+Zv2ZWiEchTa3g6l50BJXB
         XCLNUPErLHUsn7jsv40n9fvbiq/MtGlk2h3dxFg2JJSPwHVQlyM2CqaLjd0LYYgnLt9z
         840w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6A9SmGG2+bj/pD1xuwTAZLvQwqgF83kKhw0ox6vXN3k=;
        b=st9a2FqRVXWtcJQCbtkKhYiF4CyXB33qCvGpdklx3scox+RjymYyvoDi8k6sfZgppm
         dWvfciGCNEUF4vXLxsXeaoc4u+q70QDyXk8/D4nTegBaIoANMKm5g4L63gfTjbpeRQ7p
         V/Gp7BJGzas36HftoqCElNJp6j5w2RFSBiTYQB+ix2lkj7+Sfngh8FAqjzlW4V+c8VUN
         twE8mXrMbh8PvrPQjv5IxAWV8GlqpZC1ssbEgYPxzdySJxtfOKn3RSpoga23bb/khxKh
         D4cS7S7EJjkNoQkKfiWc4c00uD7eicFNkSOc3xBktmLeU2y8U+BqQW59oYBiG4LtcYTL
         mLoQ==
X-Gm-Message-State: APjAAAUzDxXlfZ+XuxCW+t1mZYdMI5nvoQk1wdSDhd6TCxXJTVJmj0GZ
        +aAquQY4mknR0JUCYtKOZIR1gHe76EKR8EPXpQqi5A==
X-Google-Smtp-Source: APXvYqzXtD2dx+U34J2BlasQ73Om+g2qJaDU3dKObl0ufgdGzbHbhXxROItuw34IjZX3c1dnx1+spYkCWWPl4hbvSfE=
X-Received: by 2002:a67:db8f:: with SMTP id f15mr6614165vsk.191.1576498176274;
 Mon, 16 Dec 2019 04:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20191206170821.29711-1-ulf.hansson@linaro.org>
 <20191206170821.29711-2-ulf.hansson@linaro.org> <CACRpkdZmuvRbLrud86Jd-8w4pBx5u8L+TvNpWAOtyAvNw6OFnA@mail.gmail.com>
In-Reply-To: <CACRpkdZmuvRbLrud86Jd-8w4pBx5u8L+TvNpWAOtyAvNw6OFnA@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 16 Dec 2019 13:09:00 +0100
Message-ID: <CAPDyKFp978kmfmadwPEUg1+hQON7u5=1et=OEBsykE=MRBZERw@mail.gmail.com>
Subject: Re: [PATCH 1/9] pinctrl: core: Add pinctrl_select_default_state() and
 export it
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 16 Dec 2019 at 09:02, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Dec 6, 2019 at 6:08 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> > It has turned out that some mmc host drivers, but perhaps also others
> > drivers, needs to reset the pinctrl into the default state
> > (PINCTRL_STATE_DEFAULT). However, they can't use the existing
> > pinctrl_pm_select_default_state(), as that requires CONFIG_PM to be set.
> > This leads to open coding, as they need to look up the default state
> > themselves and then select it.
> >
> > To avoid the open coding, let's introduce pinctrl_select_default_state()
> > and make it available independently of CONFIG_PM. As a matter of fact, this
> > makes it more consistent with the behaviour of the driver core, as it
> > already tries to looks up the default state during probe.
> >
> > Going forward, users of pinctrl_pm_select_default_state() are encouraged to
> > move to pinctrl_select_default_state(), so the old API can be removed.
> >
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> I have put this patch on an immutable branch so that you can pull it into your
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-pinctrl-default-state
>
> I also pulled this immutable branch into my "devel" branch for v5.6.
>
> I think other subsystems may need the same kind of stuff and I might need
> to change code around here so I need to apply it to my tree.

Thanks!

I have pulled in the branch into my tree - and applied the mmc patches
with your ack on top.

Kind regards
Uffe
