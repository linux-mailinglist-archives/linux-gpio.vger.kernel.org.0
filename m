Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2941ECFA1
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jun 2020 14:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgFCMRo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jun 2020 08:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgFCMRn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jun 2020 08:17:43 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D746EC08C5C2
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jun 2020 05:17:41 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id m18so2422368ljo.5
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jun 2020 05:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D41G1t3TtndFsp3Fk5xdy8Udf6eOJ1N1fW5sl9opBC4=;
        b=yo8aKusFH8rjFRbst7Pd2XRO5OM0uzRQkbHZ/REysSt9JSXHyjarMKg82fb2fZueI4
         Z6uU6ik1Rmgp6EzdDMlfumXvHOZzogk0BRn+cCt/EXdVKlybK1MJsj7dfXCgIcJNdw5e
         uchM2b4rb4v09XFMhxn9alZQilyh6w/79e9HBFCgj15Di6/OqD5GRdhwneCO9SKflWb5
         7PzvnUPscIJpoV87H0jipvwdMBb5k+NZG0JtHsl/YMxDbDh8qiiKDTzaGa8VxchlwGH/
         fVkdhjK+sVIpM3Ho2VmmHLERJKhRfsYPBhTQg+sc+oXWusQdFDiToZ61BvLaLBlfZnYD
         Kj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D41G1t3TtndFsp3Fk5xdy8Udf6eOJ1N1fW5sl9opBC4=;
        b=jD710TZ18MyQtJWP9vLa2pHgtp507V/Q0EM9VYXq5MljkGiwsxB8yWDGtDgxrs0SVr
         REojvSUKO4mG/Bp8AxXOw5f94fkdrZOPhw4rihY/Dbv0dbtdOuQ+29+wr8J6piPYFTQr
         OCf6vi1vQ3EbahV02ZNH5mjqzXlVDyjZNg1Kc1XJ2yDyzx/I8PHmwFjlh9smIWHhXCj7
         KmrPyvlWskH8LMtMXCx41e6/eDp+MvB80z1vJ1GA77UJWDEAg+heA1BvvRWdUw0p7jj6
         8fsFSR7+IQPXvsOjm76fxyTR7oiEO1R9InsJ66BuzVaMxgk+8OqzCmdWa9cNW7EnDiMj
         87Xg==
X-Gm-Message-State: AOAM532qA/Yiyr+8m1+9mYcIl7oxIJ2kXJL2P8zHgzCbvA6hm75qybPS
        I+wi9ijlsL7zYDgOoK/CX3XJYGju2jCeiU57nc6reg==
X-Google-Smtp-Source: ABdhPJyoeZrNepeqk+9jgqLKZrt7i+C1qWTwwmCR1qtAPIbZRcMnPhJXEc9R2F8Y1mjnsppMks/wRXFQe154ZzFwVB8=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr1143186ljn.286.1591186660293;
 Wed, 03 Jun 2020 05:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200531001101.24945-1-f.fainelli@gmail.com>
In-Reply-To: <20200531001101.24945-1-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jun 2020 14:17:29 +0200
Message-ID: <CACRpkdad8K-uDpYWOwxOW33YM3yWsKOS-Fr4OjkXhNoVxJv1jg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: bcm2835: Add support for wake-up interrupts
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 31, 2020 at 2:11 AM Florian Fainelli <f.fainelli@gmail.com> wrote:

> This patch series updates the bcm2835 pinctrl driver to support
> the BCM7211 SoC which is quite similar to 2711 (Raspberry Pi 4)
> except that it also supports wake-up interrupts.
>
> Thanks!
>
> Changes in v3:
>
> - added Rob's Acked-by for the binding patches (#1 and #2)
> - correct check on the number of GPIOs in irq_set_irq_wake (Stefan)

Applied this v3 version right in time for the merge window.

Yours,
Linus Walleij
