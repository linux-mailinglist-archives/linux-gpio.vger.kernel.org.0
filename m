Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D26EC3BA206
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 16:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhGBORK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 10:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232704AbhGBORK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 10:17:10 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E33C061762;
        Fri,  2 Jul 2021 07:14:38 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id x16so9007676pfa.13;
        Fri, 02 Jul 2021 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s0s4DqDIqzRLbSlLCSU+dL2ttfDuziZyFULjeH0OEQo=;
        b=fE3q75o1U1ThnTjqKfSQFsMQW7Ml5hc+MRpqGHAB4lG4I14PnSpL/LTE4ui7iEEivO
         tlJCigHBWFWMWGGx96iXKltou+BK6q465zvYNJmqmfweTql1sEKJpS8LDsTssf497JKI
         O+wXqCumWYqrk0NhKYNhFO5qQje2QVpwW7u/NnJEVxv3rz6ooU0cXhicz8GHyqzOXk/+
         59erDdV/a5l3JKE7Tks4E6am9MTWhWi2iDSdIa7ScI1JoV7FNe4blxSG75gUB6AWm+m6
         bJXlqPOL6j66LUlas5Ctai2i3xTkW0tHxVVlXxEhTdEWxzU20MygMSdSCaqXn26TzTNf
         B7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s0s4DqDIqzRLbSlLCSU+dL2ttfDuziZyFULjeH0OEQo=;
        b=HSP9yKOeaH3psj2A237sDXPaDSC2qwtE8NPkgguz8Y5yBokULgV8bQpbmi29cNVerw
         u/Q13096VOtcU03txz03YXKrgh1MQlc0UPeUgZq2hBTPVXGE5LLtbRUQc94pndgKBdBa
         h2+LRdwNyfNUiXQJB40MtqMd2vqoFi3xKX2Pqn+77mejYINjAYTe+e4yCp+0SvoiJDxp
         nPoVP6k01b+rwyzo3+MCOxeeBq0fim0VcXZ4DcqI+BBGIOqmNmAeKCPuqe08VcxTWTEj
         KdTCxwnQMwoCUDweVGofPQXHSbBLG7LXUTb/R+RbLSfj6rOCSrecfoXcP0jVKUwOJv+b
         NxYw==
X-Gm-Message-State: AOAM530/ujTcZ98wchKeDkxJeBMch9PeabAyetLaPoZSKUYthWKDzboa
        SP9k50+7b2Gm/9XkgfId7ON1zW7Pct6wEKerLBc=
X-Google-Smtp-Source: ABdhPJzs6ov+12xCkAxqf71F1QaHpyvsZMGyiPKdXz7TDsCqFIIPznNalBSCsmktIWat1cicU5qFCxdLzAJhTGz5vtg=
X-Received: by 2002:a63:f609:: with SMTP id m9mr289975pgh.74.1625235277913;
 Fri, 02 Jul 2021 07:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <aee1d5a46b75fcaf4c231ddaf221f9ac2538440d.1625227382.git.matthias.schiffer@ew.tq-group.com>
 <YN8YfTHFDc1a9z0d@lunn.ch>
In-Reply-To: <YN8YfTHFDc1a9z0d@lunn.ch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Jul 2021 17:14:00 +0300
Message-ID: <CAHp75VeD4Ph_276jNQROkymTmcEXZECBY+Ci8xdGySv0fQYMXg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] gpio: tqmx86: really make IRQ optional
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 2, 2021 at 4:45 PM Andrew Lunn <andrew@lunn.ch> wrote:
> On Fri, Jul 02, 2021 at 02:23:47PM +0200, Matthias Schiffer wrote:
> > The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
> > causes warnings with newer kernels.
> >
> > Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
> > missing IRQ properly.

...

> It is a shame platform_get_irq_optional() does something different to
> all the other _optional() calls :-(

Exactly my point when I proposed the change to it!

-- 
With Best Regards,
Andy Shevchenko
