Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0805420A1
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 11:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731636AbfFLJXY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 05:23:24 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35996 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727276AbfFLJXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 05:23:21 -0400
Received: by mail-lf1-f67.google.com with SMTP id q26so11527536lfc.3
        for <linux-gpio@vger.kernel.org>; Wed, 12 Jun 2019 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9xB4K2RyPS/R57/JJTkF3nS6D2VfQstRM6okCDkUpXk=;
        b=pFDYhglDOvHhgTlm4JT6bDT8ASm+PtdFkhZg52zUouEDk4o0E4X4ZtbAOdJMAZ6iWl
         O+uvDV5hgYuwyTXQoE+Kr9oMbpfQ7hmyJKMyhaN3GCM2N7mvAWId00sc1wDMtV3ao05I
         8X9urtEYd+jcPPH620hZWB5B93f2ud+j35c0VpVa8kJ7OBsx2pB2J8LdcE0eRZYr4J/e
         st1c3reb9iREpMlFnS01buN5ERtdWBLiYD8vBcbAQem7rXk8INOS+KUI7jDv37tnRw8n
         BVl92fzUvYBE3g1WF4PDDj3kp5Uk0uS7Vs2bdThWC/PljF0RjE1nP2ntysaLq1oy0ZEU
         BPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9xB4K2RyPS/R57/JJTkF3nS6D2VfQstRM6okCDkUpXk=;
        b=CiFsSe9tudqMSr9PHteU91u86IcSt99MNMfcvvbkl+ZPvkW9klARNT8km6hbj+mVZd
         82+jR/+Yb1noTSUjZX/FFY2suc2tHegZnPUOvMaRIO8Y3nVx2Y1BO+q/VK08hbtCB/Sn
         ow+abDNTX83Aa4zZq3KRJSLnE5UkYdcPO3hJ9OMQkUXTAkJI73whsWDwHQt9BX8dFgvC
         9ReWhdg+tIfnh6Uz0ve3nSWxdZVg0lHOhuTqCSskqNorJljPPqxjnmrI8szon2DYEe7N
         cUNPWvHQABM7dkjLQhalomx/iYIQoiCIf1WUiFNcVXmUjJHFiCO72qn8kw/YNnH0Dn5z
         nIXQ==
X-Gm-Message-State: APjAAAUHobOEGKm44iq8bQalygBHfHu5douqakq2RXcfd7d1w6La/5An
        A6z+NjYfcMNvYugqMd9k1SXZiBIBT9+HWpbGEwQqfg==
X-Google-Smtp-Source: APXvYqzpG6R8CuOm+a9rEIDx5UCqguZdACqHC7MEghETAfPC2KWCVJSCTTbd3ssSHHSl0L4f+vvy9uBtO7bg9b6ZZYA=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr5356875lfc.60.1560331399558;
 Wed, 12 Jun 2019 02:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190610171103.30903-1-grygorii.strashko@ti.com>
In-Reply-To: <20190610171103.30903-1-grygorii.strashko@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 12 Jun 2019 11:23:07 +0200
Message-ID: <CACRpkdamKFMrvfi4+L95KqJzPkX69er=CBC3ShUwj0VWArnQRg@mail.gmail.com>
Subject: Re: [PATCH-next 00/20] gpio: gpio-omap: set of fixes and big clean-up
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Russell King <rmk@arm.linux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:11 PM Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> This series contains set of patches from Russell King which were circulated
> internally for quite some time already and I fill it's reasonable to move
> future discussion upstream (and also avoid rebasing).
> Fisrt two patches are fixes and the rest are big, great clean up
> from Russell King.
>
> Personally, I like this clean up and refactoring very much and don't want
> it to be lost.

I share your view, it is very nice to have Russell's attention to detail
shaping up this driver.

I vaguely remember at some point wondering why we were
not using gpio-mmio.c at least partially
for this driver, as it share this characteristic of keeping a shadow
copy of the registers around and seem to have offsets from 0..n
in the registers, but I guess there is some specific
good reason for not using the library?

Yours,
Linus Walleij
