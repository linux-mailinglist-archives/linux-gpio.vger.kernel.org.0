Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2648B2070F9
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 12:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388570AbgFXKSV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 06:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388551AbgFXKSU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 06:18:20 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F3AC061755
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 03:18:20 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id e13so1293499qkg.5
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 03:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8jgfU2E0apwMh6wsaejptHHCTw5UgOkwm0wLww38xJk=;
        b=Zs0iesBVSboLL0pPa3SmzoU3GGAhIWocMZKNz/qHAInfUbsED3WVXRTwdFNtSOLfoA
         s3NnIhn6Oy8edwR99FVaom1dOVGIg6yLJ0AXEU/8fe2BoOdUH2ZUJ8W5FMIGNbj0PaJZ
         xS4h/W3uokUCTPMzUX4LCrPvcTeGV/W/7ODHCVYPXG17R7e3e88iU6uDKjdZEfYLz1DO
         SoX8Lk8wfKkLDOI9SyR675ieJCNw9l8sgtRMM7d0eXQJWapYbBR6pTCz0YOycsvICdEz
         IwHHiKIaeCjowv8l5AzigbdoDUqnCb02xVESinUoiM5inJrLXcxnuxOQh6nw5+DIeg63
         u9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8jgfU2E0apwMh6wsaejptHHCTw5UgOkwm0wLww38xJk=;
        b=FjIAsyhaKcK5v2H9IOo/MF0RKnOzkGLqu62QCvwVN0eDgnr/ZV3gEOeI8ircxfiTZ2
         y7zZVB4wuOzQWkvfGlu6GSPGVP+Id6j24naw2O2YOXxqksO5H70PIt0m2oJrzG1KQhe7
         vRntlC6ZmNOO8JDDkSZ6sEClD3ivKbOWYZfXqwOo7lEiBJ87B51vKQeecfrK/gTU9z5P
         SXoNPAUOwlWbGll2VPhD6aI5gChYt/WOVIBgoOFqtPrEOcMjAdH11IZ9MoXIpG7jcg5j
         u5QEaEXnvspuf8jPHOCpZ9N+OF7BQkpEQlLMBwgJNEwl3AMdtai/j5mkVeghc6POfx6u
         OAyQ==
X-Gm-Message-State: AOAM532sTw/A3IQqOE4djcJ3xod6BPUByx+IyNukM6Kz94cwZtEUoF9M
        zmzFK1sdWmQlO7ckXTwMhku0cKvnGov163zlAkmLUQ==
X-Google-Smtp-Source: ABdhPJxNRfFJkbDxdLxofIwKZguLERV2rujyL4vJHjYoiDq6+3W5IMkv5upBRlgurYdNM8aGw0dOWaZAKREOcHxHBpQ=
X-Received: by 2002:a37:aac4:: with SMTP id t187mr22208491qke.263.1592993899699;
 Wed, 24 Jun 2020 03:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 12:18:08 +0200
Message-ID: <CAMpxmJX1YQWEiY-Oa-UvniHJcX=sM2uCVG8q+p=3Or3ZCt_kbg@mail.gmail.com>
Subject: Re: [PATCH V4 0/7] gpio: zynq: Update on gpio-zynq driver
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 17 cze 2020 o 13:37 Srinivas Neeli <srinivas.neeli@xilinx.com> na=
pisa=C5=82(a):
>
> This patch series does the following:
> -protect direction in/out with a spinlock
> -Add binding for Versal gpio
> -Add binding for pmc gpio node
> -Add Versal support
> -Disable the irq if it is not a wakeup source
> -Add pmc gpio support
> -Remove error prints in EPROBE_DEFER
>
> ---
> Changes in V2:
> - In previous series [PATCH 1/8] already applied on "linux-next".
> - Fixed checkpatch warning for spinlock description.
> - Added description for Versal PS_GPIO and PMC_GPIO.
> Changes in V3:
> - Updated commit description for PATCH 4 and 6.
> Changes in V4:
> - Updated commit description for PATCH 2 and 3.
> ---
>
> Glenn Langedock (1):
>   gpio: zynq: protect direction in/out with a spinlock
>
> Shubhrajyoti Datta (6):
>   dt-bindings: gpio: Add binding for Versal gpio
>   devicetree-binding: Add pmc gpio node
>   gpio: zynq: Add Versal support
>   gpio: zynq: Disable the irq if it is not a wakeup source
>   gpio: zynq: Add pmc gpio support
>   gpio: zynq: Remove error prints in EPROBE_DEFER
>
>  .../devicetree/bindings/gpio/gpio-zynq.txt         |  4 +-
>  drivers/gpio/gpio-zynq.c                           | 66 ++++++++++++++++=
+++++-
>  2 files changed, 67 insertions(+), 3 deletions(-)
>
> --
> 2.7.4
>

Series applied to for-next.

Bart
