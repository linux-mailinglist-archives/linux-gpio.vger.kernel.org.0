Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA64528961
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2019 21:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390399AbfEWTfn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 May 2019 15:35:43 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38681 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390771AbfEWT0e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 May 2019 15:26:34 -0400
Received: by mail-lj1-f194.google.com with SMTP id 14so6556527ljj.5
        for <linux-gpio@vger.kernel.org>; Thu, 23 May 2019 12:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4oPHJ791QDhQXaDhiV5z4nPMfZPUmYNBT531vwDg+48=;
        b=zeVJvESMaCyb/o40lHgrHQaR0wxSc/HnzXDVChS7CIkoyKGjuK9jSN5lY5+wkWP/8U
         BiunktJcKY/63y/25SK4wIix5sjdUMoD7qWL4KhsDhmWYtUaUR4H8a1ruGfIx3I9qkjh
         Q3qwEuDphbV7b5jU6ySDVNLEi6ctlkImQTLisW/XTfvt5PfFd4AQ0Ld0UOjoe46VD2GG
         KpOEhQPppu8xbPyd1n2awy5ttv7sLzYdgP4xgcEgSaZvyjs/TKv8PeHpX2ccaMw4DKfy
         p86y4//xMNjZMskJm2NsQUNu8ueqe3JmChrs1H2C24CrUO8wSLZsLj+08IJtDFIUbuy1
         EY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4oPHJ791QDhQXaDhiV5z4nPMfZPUmYNBT531vwDg+48=;
        b=q+xEjTvHOM1F9AIHTNO6ctZ/tbmZ1PAZ8XVj/91IvzUROMbIgDaik9Mm/c26BI817g
         rAFfx3VBix5aIwmMDLY/DySE1KkqPVAsbjEx7wAwIPt1QREDfXLfE2NrDn72oDo2LiGp
         la55SlvZJdZPuhDVnkqyPwRNMDTM8/2vscjtLeigRIXsuKL3fDHBhMXUZBBp9uES10gy
         SFl8NfiRuT8YKsyNzNCtpla4gV/HMXl0JAXhvY5+S0G8C5MzG7LIB+52odP6j9Xmt0h5
         +A7AVyqoZU8hNEqGyg8lc6NN5YVHMTq7vAF6JfDguzQ0kLjGevaXe61GdN0HjlfqJswp
         Fblg==
X-Gm-Message-State: APjAAAVZOL/c7civ+bri0t2ANf3G9o+ycCueqpOJI5YH9FU6nXRsjHui
        48SBFHz/DxLHyt0ffFwDEe3YbnvaI+etKE1w0yx/gA==
X-Google-Smtp-Source: APXvYqw1/NENPB+wYuJbCaWzvbL6Q6fSr1KQwaAmsfMTd9ZqJ6Yzw8D8osZ71U+Vfdl6V/MOWyoc3/ahcxiWU+5OoEE=
X-Received: by 2002:a2e:9cd1:: with SMTP id g17mr9897354ljj.191.1558639591978;
 Thu, 23 May 2019 12:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190523080654.19155-1-linus.walleij@linaro.org> <5ce6dddf.1c69fb81.8efac.03cf@mx.google.com>
In-Reply-To: <5ce6dddf.1c69fb81.8efac.03cf@mx.google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 May 2019 21:26:20 +0200
Message-ID: <CACRpkdZ95Np43+mbGAmWBTN1b=sE0Tos9h3_xNhEM5yZ_EMJgA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Enable device links to consumers
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Evan Green <evgreen@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 23, 2019 at 7:52 PM Stephen Boyd <swboyd@chromium.org> wrote:

> Also, what is the usecase for device links in pinctrl?

Most prominent is a device (such as a GPIO block or I2C
block or something) that need to suspend before the pin
controller itself suspend()s.

> Doesn't the
> driver core reorder the suspend list when probing devices so that
> devices that probe defer get moved later in list and thus suspended
> first?

AFAIK it does not, the device links however can do this so that
the probe order does not have to use deferral at all. But the
links can also be added later at runtime (like when pin control
states are requested by drivers) and that is what this patch
does.

By way of the chicken-and-egg problem we cannot really use
these device links much for probe ordering, but they can
readily be used to control suspend/resume sequencing
like this.

>I can understand that runtime suspend may be important because
> order of suspend isn't fixed, but system suspend should be unaffected,
> right?

AFAIK both runtime PM and system suspend use the device
links, this was implemented especially for system suspend/resume
and tested with the STMFX driver on STM32.

> >         pctrl->desc.npins = pctrl->soc->npins;
> > +       pctrl->desc.link_consumers = true;
>
> Why is it an opt-in flag instead of a mandated feature for all pinctrl
> providers?

I am afraid of breaking stuff. (OK maybe I am chicken...)

We slammed in device links in the DRM core and it exploded in
our face. Because of fear of causing a similar debacle and
having to back out all drivers that definately need this,
I am making it opt-in for the moment.

Once we have a feeling that this is not breaking (on e.g.
qcom) we might just make it default to link all devices
getting pinctrl states to their pin controllers.

Yours,
Linus Walleij
