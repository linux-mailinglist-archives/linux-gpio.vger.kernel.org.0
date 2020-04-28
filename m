Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90BD81BBA8A
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 12:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgD1KBZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 06:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726598AbgD1KBZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 06:01:25 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F54C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 03:01:25 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u6so20784329ljl.6
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vLmsZ8FzUvZ2qyUD84j1b22i18dHEE70Jtvscxhc09k=;
        b=YuSW84MJxGm4qTrO7x6FDa0tNZ2DwTGnBZcdLuuUJwmIySl3NXFo5FIxgcdvSWhhHw
         w8f3SVhylLAGIenBWpXFofh7SIqxoYqGlwz7LQm+YJ51a177fjUJO5Xr8wTKk7PLE9Ow
         sq0njirZjcIVJgrpYtz0SI1Xkqde9Fx+gJzIVvtihqPzC8b+RubH3I+eAsZH3kyRJCaT
         TGV1gQgqGK9ntlhlHxoERIFjvIwg0mp1TnG9kPacdcpTqghNObPflJ8OxLxmk7azsenJ
         5pB5uU4FilL+JAVfPKMCSGlURLIKRawxY2bwR16A3geOEdTBD8NnehNPWlwNekdReDCw
         g9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLmsZ8FzUvZ2qyUD84j1b22i18dHEE70Jtvscxhc09k=;
        b=OKAJPuOWPdib+AEbxSTb30WySOUWLLD3ZlfmiWB++RsbgVL8oB4Aev8f9h+1g0A8go
         N3Wxqerc0FJnwKDNPTIZbnHZf8ImHi/6/Z+6jDvJLdXEBTzIgDtE4iG5J+CU3FItEFot
         CNEKvyktJnQPbjQB5yV7XEW7uFaxEObkNuB+eyPSpN4J1XeKAckgy9/07xpnXY/2B7Z9
         dQ9wG6zgBaZU7fT9Pe6ei2GbZAAp6pknGbkCjhpMbR26cdS1XJRngMcRXIzbalKtE5GF
         cAwOa6HrPLB01eb9AWwFFIGx55EvecrRxUJvdcCAtweiIZOVABShOp9a0Tbd7SKhBzTt
         bgjA==
X-Gm-Message-State: AGi0Pua1cY1kBBS+sMUrMNOmCnQUVws69n7oxlI2pP4t5qhKCkdKspyf
        XY5eXP341pNs2+mzRD0DzYVurqQkGQwBYUxbcIRe6Q==
X-Google-Smtp-Source: APiQypILX45Ac1tiqnMnI+HFKCHUmn1qsryssGy+UbF1Sz2zs9tEQxqIByqukAumdnDai62XdgrEeXgjb4HSD+iqAwQ=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr8308858ljq.125.1588068083674;
 Tue, 28 Apr 2020 03:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200417183349.1283092-1-martin.blumenstingl@googlemail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 12:01:12 +0200
Message-ID: <CACRpkdZ82tjcBc_kF29zUMiLLH==0zKbOd=fTRGq5-4FOiez5w@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 0/2] pinctrl-meson: two small improvements
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 8:34 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> While playing with audio output on Meson8b I found out that the
> vendor kernel uses a custom version of the GPIO_PULL_UP flag. I
> suspect that we will need this for audio support on Meson8b and/or
> Meson8m2 but I don't see it hurt other platforms.
>
> Also while comparing the register bits with the GPIO direction (of
> GPIOs exported to sysfs) I sometimes had a mismatch. This also wires
> up gpio_chip.get_direction to have sysfs and the actual registers in
> sync.

Patches applied.

Yours,
Linus Walleij
