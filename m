Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF5532E1A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 12:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbfFCK6R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 06:58:17 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38614 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbfFCK6Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jun 2019 06:58:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id o13so15722061lji.5
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2019 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Hkb6ZGh0otQQtsG7EyeKc0XPVB1qeyVKCVz7z7GAK4=;
        b=MNMZwokibxUU6+0ryf7ELuQ9C9y6uLdFUZOlzwg8shXKvhfYvV5rRTTzeh41/lQAZ0
         1LQYdLODDWtYRXLksN6sfVGsFKWNE/4H3RgIXGAVjS1WA+aSNz/WyaO88z1qtMbacZYi
         uQLRyzQiUXprUBV1rwhQdLbRxTqLq5tncp1K/DcF5kuGm15RXfZlVbfkTKQSq2t+AA7A
         huj8SnqIzDRgQgjB36zFWJgjWu+yJQIQhFigor+UBthANFKjAT+aJXi3GcdwzFWW10EI
         eRIotdz3v5wpob/mQOhREKzUz3fvttn9KQVGTI0T/TaHwb3rwmpTMjPzsCjP0iPCVqn7
         OlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Hkb6ZGh0otQQtsG7EyeKc0XPVB1qeyVKCVz7z7GAK4=;
        b=fbxW51EmkZqGJCE4ryoRbj5IoxwRIeptFiBrFzXisWl+/EI0BoRgzE69jQB3t7/zkR
         1UVUj+ksX/Lx2IkzuKBFAYfK6mxm7feDS/6OYdzdiJx/IXQgAhwVEzLUEP40BBXkC7HO
         bLX5FgmxA0Pbw4zlPRG2E+JDaxAUDYtBHJXr4LHyHOl9tLE8aeIro/7i7i0tWO5t2Hsw
         +YwexvudfOqCHFjb3yf+z09G2Dfnd7YhntVuTzQYc3Xro/MpFUSZR5O7EluQRcIRfK4J
         0otT636G4zRdNKy/fNnreF1AxhjeMuLVNmZJul28vfjuoqiEguyQDQ/kaLfHhmXjQ+R4
         AQ6A==
X-Gm-Message-State: APjAAAVY5kfSA91SOQO/Q89cfvm48gAopQxRSuVLtNhkhzkSzj2z8UFd
        fkzx56JQfe2ovfpDIIwuH7hMrA16Apy4LgRoVqer7Q==
X-Google-Smtp-Source: APXvYqxo/ADke86oscEtkWdOZe3GDp/cLqsLQ6zE2mLLJbDnU81g0eCO5QoeN9mSyfQkx4QxgcHARZqrEYTDhPchXJA=
X-Received: by 2002:a2e:9018:: with SMTP id h24mr6376615ljg.165.1559559494919;
 Mon, 03 Jun 2019 03:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190529145322.20630-1-thierry.reding@gmail.com>
 <20190529145322.20630-2-thierry.reding@gmail.com> <CACRpkdb5vB6OwcAxtjsKLzHt9V27juEOEEDqqQczKT-3r+7X-g@mail.gmail.com>
 <20190603075324.GA27753@ulmo>
In-Reply-To: <20190603075324.GA27753@ulmo>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Jun 2019 12:58:02 +0200
Message-ID: <CACRpkda47EX981Dw=jLrU=PHn50+AQhJmpVRWJ9uJEQdcAsrTw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for hierarchical IRQ domains
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Lina Iyer <ilina@codeaurora.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Bitan Biswas <bbiswas@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 3, 2019 at 9:53 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> Me

> > Please drop this. The default .to_irq() should be good for everyone.
> > Also patch 2/2 now contains a identical copy of the gpiolib
> > .to_irq() which I suspect you indended to drop, actually.
>
> It's not actually identical to the gpiolib implementation. There's still
> the conversion to the non-linear DT representation for GPIO specifiers
> from the linear GPIO number space, which is not taken care of by the
> gpiolib variant. That's precisely the point why this patch makes it
> possible to let the driver override things.

OK something is off here, because the purpose of the irqdomain
is exactly to translate between different number spaces, so it should
not happen in the .to_irq() function at all.

Irqdomain uses .map() in the old variant and .translate() in the
hierarchical variant to do this, so something is skewed.

All .to_irq() should ever do is just call the irqdomain to do the
translation, no other logic (unless I am mistaken) so we should
be able to keep the simple .to_irq() logic inside gpiolib.

Yours,
Linus Walleij
