Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40954703A0
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 16:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242707AbhLJPUB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Dec 2021 10:20:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239297AbhLJPUA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Dec 2021 10:20:00 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89567C061746
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:16:25 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id r11so30427535edd.9
        for <linux-gpio@vger.kernel.org>; Fri, 10 Dec 2021 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rs5bg41j4JzTAJjWn8R9+iNkzzHWufek6oB+vt3n73E=;
        b=dPm8WeHCw+MUZH8j3p8zX5QGv8VAUQJGxCofWbwTkjH0pemujX5s0eU+dMZbjS/A2d
         lCatnOoMLL5GJXn0KNvgpBhTp+du1nSoEP8UeX7lb6bGkTwBWyXTXor5t0zVX78Mdi9Q
         D/Fqh6ybMAp6Dwb+i6ynT+eZMrhd5vgqG3mM4lf3JY4W3NR3al+7BWk4AwaKyMLupAn1
         YFOKwW/9UrmxY+oMB25znRiAD14ioDvlLkp6ohexZAcMlaWquwq3xZFLd4OJkka/Ix5N
         fc3mZ+LLiyaHm6i1Vw0iAIAbntOm/XLf/+hNvKkSw6EdcDlVUgeeZDM782jscZRU5Z/+
         Eqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rs5bg41j4JzTAJjWn8R9+iNkzzHWufek6oB+vt3n73E=;
        b=OinWtQkKyQklnvfdx2CqtIxhwGprpALqEdK/buFGWUe6sV7LtznDW8WmQb7s6zKuL9
         5gFTDwnATxPCI2UNUyc9OihyJQX4e9nwArDr2pFFBBIH++kef9l2WhBzbqNE5BTmcyog
         Xxg3HJC8zGOQV9ha7LWkmrg7W2OhyKq7jctfwMMbocd1pZt0186/layEi6/zYZYmtyWt
         Zs86Skr7MsrlksC8j5cE0ypj8BQBoM5tn3jVZ4ioxOmieoIMif07RnvZlRltFBgwwNDN
         OhQtpptnrowGHK48oBNnWR9GHw616UeAlDYjmvT7WQV53ca89e0m9ur4oGuO5+IxTujQ
         nanA==
X-Gm-Message-State: AOAM531fS5J9N13gqtfvsoOaktx2fwvuBeMahkKJSOtLS3e9sHFrkbq1
        /X+qndymAfJejKW/7NAmcrmSrUXEvz4HULWSRkqADw==
X-Google-Smtp-Source: ABdhPJz+NLsw0jfL4s/uR9uk+RJoMWfU9WpuXLY75ywELLHLGa9fOaOuORlAuqCnnbpVDNtsHgx5BDcokpq98Uzh2nA=
X-Received: by 2002:a17:907:75f0:: with SMTP id jz16mr25332620ejc.77.1639149352759;
 Fri, 10 Dec 2021 07:15:52 -0800 (PST)
MIME-Version: 1.0
References: <20211204171027.451220-1-iwona.winiarska@intel.com> <20211204171027.451220-2-iwona.winiarska@intel.com>
In-Reply-To: <20211204171027.451220-2-iwona.winiarska@intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Dec 2021 16:15:42 +0100
Message-ID: <CAMRc=MfZvtwRrY_qhO7vRwwR5=prqkORtfo8FW6YjkhB8jyxBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: aspeed-sgpio: Convert aspeed_sgpio.lock to raw_spinlock
To:     Iwona Winiarska <iwona.winiarska@intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed@lists.ozlabs.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 4, 2021 at 6:11 PM Iwona Winiarska
<iwona.winiarska@intel.com> wrote:
>
> The gpio-aspeed-sgpio driver implements an irq_chip which need to be
> invoked from hardirq context. Since spin_lock() can sleep with
> PREEMPT_RT, it is no longer legal to invoke it while interrupts are
> disabled.
> This also causes lockdep to complain about:
> [   25.919465] [ BUG: Invalid wait context ]
> because aspeed_sgpio.lock (spin_lock_t) is taken under irq_desc.lock
> (raw_spinlock_t).
> Let's use of raw_spinlock_t instead of spinlock_t.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> ---

Applied, thanks!

Bart
