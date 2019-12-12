Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 430F911CEB5
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2019 14:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbfLLNsL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Dec 2019 08:48:11 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45739 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729425AbfLLNsL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Dec 2019 08:48:11 -0500
Received: by mail-vs1-f68.google.com with SMTP id l24so1543685vsr.12
        for <linux-gpio@vger.kernel.org>; Thu, 12 Dec 2019 05:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zo3etf55ZK8i+nDVHSL8iWr0+17jxAC7hMv1W2s3xTU=;
        b=NTqWYjXjMzf+64jyvU+tTN1k4UPJ7S1RZvVlW7+jBMXglwGY+OyS4Yqp4XIs82n8yh
         0WFfXJfACQCLnuK2hZ2/5IkQcdBq+1LjpFu1PBwSRhS29ghjKJFXktqin/IheooX0yD7
         SsGpiM4hY92EZC37/Bk+eO5sqmXX0+8wjv4d/u766AL4ke3ONNQPUcgdmku89UWsrkkq
         9W4p7xz82WMC46Q5ZboiOPvuIt4Tm2EXrpuobnK3Fd1KKydtOVOayJiS+3yQKOixzrSF
         NqNCPaSs34agX9g9Osnb6pRycCc2uto+8pjqLuwgYYNRr8YJukPRfskS/YpJAAdJzTkQ
         NrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zo3etf55ZK8i+nDVHSL8iWr0+17jxAC7hMv1W2s3xTU=;
        b=PmCJ9B3JqjeILdDCdF5v5fBoEjOLZViOmkLRhg1tlAnjTxfgWoTLDK9bNVnkXsnFnj
         a9AygdJA0ZUMSMrEY9WAAIfcVy0ZV5QbIl77LA9qknCT9doHUMfjVW+XIPpvxFPYpdpT
         UcH9XyhKpI4WIoZigRSdlOu1DJRiqLfdhtDG8nXpI2hXH+xYOlMMikSSbna8fxo14Ko7
         EQEtIhNIRdvehrN5D5Lq8Rl9Yf6ot70c04xxdNrE82bKMxPfwlPVu1pdslsYUqnK1uC5
         hw9v1leymXT3xAxAytNw1MOr7uTrOls2yYnS6KPMXWySKJjUsiBt/h8Qdgi7iUTAeHue
         xFkw==
X-Gm-Message-State: APjAAAWeKgeX2uRavn8c9wntgeM5MZcu9WzYWkTQ3VyrmFHRVReGTpou
        G/dBFrAGQoPQSToaqHPvDcjERI5KuJABqTZxGy0H4g==
X-Google-Smtp-Source: APXvYqxd7CisWIesKasM7Eyqe0o1be+iBtKBllPmkvakRY3gyXkCbF+vvWr0vvA0fRzjYav6QhMkvQ1ACodwGjIPTOY=
X-Received: by 2002:a67:f499:: with SMTP id o25mr6800896vsn.165.1576158489583;
 Thu, 12 Dec 2019 05:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20191212101134.42420-1-linus.walleij@linaro.org>
 <CAPDyKFrGECTVnP+qWgA2n-TKxW2AcyLCr1hqyEOp83XcK=1OpA@mail.gmail.com> <5483ee2d-9c31-66c2-1008-fcd6551523fb@st.com>
In-Reply-To: <5483ee2d-9c31-66c2-1008-fcd6551523fb@st.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 12 Dec 2019 14:47:33 +0100
Message-ID: <CAPDyKFoVQCnxXufBdTp3atAJdkHR=EY7Rze1RSUZyUxiwcgGgQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Enforce device links
To:     Benjamin GAIGNARD <benjamin.gaignard@st.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 12 Dec 2019 at 14:19, Benjamin GAIGNARD
<benjamin.gaignard@st.com> wrote:
>
>
> On 12/12/19 11:56 AM, Ulf Hansson wrote:
> > + Benjamin
> >
> > On Thu, 12 Dec 2019 at 11:11, Linus Walleij <linus.walleij@linaro.org> wrote:
> >> Instead of opt-in device links, enforce it across the board.
> >> Everyone probably needs this anyway, lest runtime[_pm] suspend
> >> order will be haphazard.
> >>
> >> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >> As there is no progress on opting in drivers for this we can just
> >> enforce it.
> >>
> >> I am a bit concerned that with every pin control state change the
> >> link reference count will just go up, but does it really matter?
> >> ---
> >>   drivers/pinctrl/core.c                | 25 ++++++++++++++-----------
> >>   drivers/pinctrl/pinctrl-stmfx.c       |  1 -
> >>   drivers/pinctrl/stm32/pinctrl-stm32.c |  1 -
> >>   include/linux/pinctrl/pinctrl.h       |  5 -----
> >>   4 files changed, 14 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
> >> index 2bbd8ee93507..1d2cdeebb316 100644
> >> --- a/drivers/pinctrl/core.c
> >> +++ b/drivers/pinctrl/core.c
> >> @@ -1220,15 +1220,6 @@ struct pinctrl_state *pinctrl_lookup_state(struct pinctrl *p,
> >>   }
> >>   EXPORT_SYMBOL_GPL(pinctrl_lookup_state);
> >>
> >> -static void pinctrl_link_add(struct pinctrl_dev *pctldev,
> >> -                            struct device *consumer)
> >> -{
> >> -       if (pctldev->desc->link_consumers)
> >> -               device_link_add(consumer, pctldev->dev,
> >> -                               DL_FLAG_PM_RUNTIME |
> >> -                               DL_FLAG_AUTOREMOVE_CONSUMER);
> >> -}
> >> -
> >>   /**
> >>    * pinctrl_commit_state() - select/activate/program a pinctrl state to HW
> >>    * @p: the pinctrl handle for the device that requests configuration
> >> @@ -1276,8 +1267,20 @@ static int pinctrl_commit_state(struct pinctrl *p, struct pinctrl_state *state)
> >>                  }
> >>
> >>                  /* Do not link hogs (circular dependency) */
> >> -               if (p != setting->pctldev->p)
> >> -                       pinctrl_link_add(setting->pctldev, p->dev);
> >> +               if (p != setting->pctldev->p) {
> >> +                       /*
> >> +                        * Create a device link to the consumer such that
> >> +                        * it will enforce that runtime PM suspend/resume
> >> +                        * is done first on consumers before we get to
> >> +                        * the pin controller itself. As some devices get
> >> +                        * their pin control state even before probe() it is
> >> +                        * important to use DL_FLAG_AUTOREMOVE_CONSUMER.
> >> +                        */
> >> +                       device_link_add(p->dev,
> >> +                                       setting->pctldev->dev,
> >> +                                       DL_FLAG_PM_RUNTIME |
> >> +                                       DL_FLAG_AUTOREMOVE_CONSUMER);
> > I understand DL_FLAG_PM_RUNTIME is used even prior $subject patch, but
> > could you please explain some of the reasons behind that?

Can you please clarify on this part as well?

> >
> > In regards to adding a new link every time you commit/select a new
> > state, that sounds wrong to me. Why are we doing this?
>
> If a link already exists it will not add new one so it safe for me.

Right, but it seems silly to walk the list of links to find out that
it already exist and then bail out.

The point is, it adds unnecessary overhead, every time there is a new
state being selected. Don't you think?

>
> >
> > Instead, don't you want to add a link when the consumer looks up the
> > pinctrl cookie/handle (devm_pinctrl_get()), thus when create_pinctrl()
> > is called?
> Because it was the only place I add found where I get a the same
> time pointers on the consumer and the producer devices.

At least create_pinctrl() have the consumer device, but I am pretty
sure we can lookup the producer device from there, in some way. Linus?

>
> >
> > Additionally, I didn't find any place where the link is removed. I
> > looks like that should happen when the consumer drops the reference
> > for the pinctrl cookie, no?
>
> The link is automatically removed when the consumer device is deleted
>
> thanks to DL_FLAG_AUTOREMOVE_CONSUMER flag.

Ahh, I see. That should be fine, I guess.

[...]

Kind regards
Uffe
