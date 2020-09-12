Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7997326791E
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Sep 2020 11:26:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgILJ05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 12 Sep 2020 05:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgILJ0w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 12 Sep 2020 05:26:52 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5611C061573
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:26:51 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w11so8312457lfn.2
        for <linux-gpio@vger.kernel.org>; Sat, 12 Sep 2020 02:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+48eoB8+wThondXw2toHob0ZQwe3LgTU2CE7AlUBMM=;
        b=OuRWaG40whjIBcB91iNEvAaHGH0XDNk5AXjxsFd+lICwB8++pB5UsygLg6jwo/lL2A
         qd53HqFUUnm3cDfBUscBkRR1u9VdxLP7qcflg9bAFk0JXmup6OrDzfQpQsCOhL9SY7XW
         vR0VT+2T1bqV19wiKfCyC3E9Nx/TcZ88mR8/c8gXF0yduk3xdoC/Ir50d7AIkuzKUjUy
         4F0dMDAIYUEth89uoIqHYVdc8C+bdXJyz5JmcupsoZY0mzUstYXOqCoD/nN76FZS7ImA
         lJD8JSIjMf3V+xJpzWOjcQptKuobR+0USHm2aAa9OpznGdsOHeTJ6ZJVdmq+wn0U96tO
         N3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+48eoB8+wThondXw2toHob0ZQwe3LgTU2CE7AlUBMM=;
        b=YMMCxmCVQE2i+u1BPR0s+rNZAZ3R7jXV0m+5jCoBaoQ3D903qfIddb+hs9cpaXo6G/
         Z2HR6IQVP65IkU/Ya5RQKCyQpq1jgba2muLi/VN2fx66fFSDdYt9U1mxxKgHwj5FH5CI
         XOijD1A4xlKwBKEVU4qJnL3x77Kd50lU9F18to8JLxxvJqjfHNNOAj3apxC41o0hz3Zl
         UuAXIzhlPOusBnbqMCAhg3m0Gw/SPWaai9ryWGkd4U0rvCpOJMwX8G1PIKl3vuXcSXy3
         1r4YQUJIN+bLeZdGSNw4F8wjLfNLK3ZLGNXYD28X4HPbNWhCYsdmByMJwB4+zZ1epOX2
         /6GA==
X-Gm-Message-State: AOAM530KU4h/t7AlmQtqwh8/7ZRZAxq8YT46xAPgxfACvpLZ9r3yXq4y
        E3/u7u0HtJ/N5MProZ7pqCWJ3SBPV/3PhO8xIU7rQQ==
X-Google-Smtp-Source: ABdhPJxdoNVDkt5k0KwL4T1WSSnHEJDy+mY/l76Bcz8T6aGaxXWR//LA/bThMnertfCCTg+IRPpUIcuvCtcRsJJk2dk=
X-Received: by 2002:a19:520b:: with SMTP id m11mr1331733lfb.502.1599902810277;
 Sat, 12 Sep 2020 02:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200827200827.26462-1-krzk@kernel.org> <20200827200827.26462-6-krzk@kernel.org>
In-Reply-To: <20200827200827.26462-6-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Sep 2020 11:26:39 +0200
Message-ID: <CACRpkdZJ78LBANGOdE6+kokfJV5hUYWaXhdhG+9cFUyj6YjVpw@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: zynq: Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Keerthy <j-keerthy@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 27, 2020 at 10:08 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

All six patches applied!

Thanks!
Yours,
Linus Walleij
