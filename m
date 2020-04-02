Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB8B19CB07
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 22:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389613AbgDBUXl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 16:23:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39762 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389589AbgDBUXl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 16:23:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id k18so1776506pll.6;
        Thu, 02 Apr 2020 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TyQdsQSbBekp4Tdk1LegDdgAtaR9xk0x84j7nnBO4Kw=;
        b=XgwsxnStrGVZljq9SxBCE9sZD3SzpuVDfCZcZGyeTerRmyBZ7Ye3fIj1J6qq1DnDme
         cKLLxHm5g/RCFeHqs1PZ7aFVrG+CqT2Hbi2w4hB68Xhmb09P3zzs1FQuNOqOpaBbZ48X
         xm4BhkUdu1MNzujbKWsFIUUjyGEBgYA+jlt6tOxXV32nisrkGJmkaWTYM0ZQbMwzuJng
         BzZyTcY/SQgBojOF259ApOWdN1W0gaRfieuvMOaAy/XLrIk4sJZoOmhypzdHDhsXCWek
         1jhxQVYy8pcGGNBvdXjmdJXSSRbXxSxGy3uG1+XLINRjnSOV7wZyJikpJ9T9Cp33gEm0
         +59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TyQdsQSbBekp4Tdk1LegDdgAtaR9xk0x84j7nnBO4Kw=;
        b=YIolSg5gzClcunkUoxKIdddVQOVIFzsIwdgZmOtpzF1rvad5DVsr9LdF5Sm1BERqGO
         QOT1q3cPT2y2rpjeEJM+S75Bo1QRjmcswMn7InU1cBJUkR9SrbLn9CGJNt85J8v/0NFW
         hTQDUelpz/rNGkeeh4sl05TO2X5QwKUsINbk8WzFXjHJ+08WXa1VHSohhStcCNsomJQc
         82snOG0Amk4maT7YsrmSwgoFJoG2/WxSggveb/Gy4y3/sDgsGV/55DGA+oeMGu0Y2qLw
         yBsJGUH8eRlx56NI0fqI3NzcyLEvz6mRQ0j34u2qoox/wWnewHNsyC960A2bx5akxnPM
         Eu1w==
X-Gm-Message-State: AGi0PuZ/3BvyH1eNRNCWyt9uY8R/NSP4HIg3jx0x5k6tW3AwMYQoUrfy
        zrUmKeWKubetqI38AkPo5rh04kTnGv+Fme7mX2w=
X-Google-Smtp-Source: APiQypLfuJPn0GImSHOwLx7gpgYSjhE+LbCob9VHH6QqhJQ7dg98xJ/CCAB4Et4B3KkzbJe4j6qJiJLdtfvDYUAbfP4=
X-Received: by 2002:a17:902:5acb:: with SMTP id g11mr4727427plm.18.1585859019364;
 Thu, 02 Apr 2020 13:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VcYSaAYx5qy7S0ppb77afgz=Ma=7=opfgSMCBnnjmoWfw@mail.gmail.com>
 <20200402201605.GA74927@google.com>
In-Reply-To: <20200402201605.GA74927@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Apr 2020 23:23:27 +0300
Message-ID: <CAHp75Vfpj+ENMe9u-SMKfvCsyFtOucUT9bD3qfWX+QjccZ9ZyQ@mail.gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] gpio: ml: ioh: Convert to dev_pm_ops
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        Shuah Khan <skhan@linuxfoundation.org>, bjorn@helgaas.com,
        andy@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 2, 2020 at 11:16 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Thu, Apr 02, 2020 at 09:33:46PM +0300, Andy Shevchenko wrote:
> > On Thu, Apr 2, 2020 at 6:52 PM Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:
> > >
> > > Convert the legacy callback .suspend() and .resume()
> > > to the generic ones.
> >
> > Thank you for the patch.
> >
> > Rather then doing this I think  the best approach is to unify gpio-pch
> > and gpio-ml-ioh together.
> > Under umbrella of the task, the clean ups like above are highly appreciated.
>
> I'd be all in favor of that, but what Vaibhav is working toward is
> eliminating use of legacy PM in PCI drivers.  I think unifying drivers
> is really out of scope for that project.
>
> If you'd rather leave gpio-ml-ioh.c alone for now, I suggest that
> Vaibhav move on to other PCI drivers that use legacy PM.  If we
> convert all the others away from legacy PM and gpio-ml-ioh.c is the
> only one remaining, then I guess we can revisit this :)

Then skip this driver for good.

> Or, maybe converting gpio-ml-ioh.c now, along the lines of
> 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), would be one small
> step towards the eventual unification, by making gpio-pch and
> gpio-ml-ioh a little more similar.

I think it will delay the real work here (very old code motivates
better to get rid of it then semi-fixed one).
Thank you for your understanding.

-- 
With Best Regards,
Andy Shevchenko
