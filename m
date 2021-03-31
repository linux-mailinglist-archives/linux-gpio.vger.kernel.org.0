Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CE435005B
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Mar 2021 14:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235520AbhCaM3s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Mar 2021 08:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235548AbhCaM3S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Mar 2021 08:29:18 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94802C061574;
        Wed, 31 Mar 2021 05:29:18 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id y2so7816701plg.5;
        Wed, 31 Mar 2021 05:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HACgQ7+uQvos15VetYD4qmdIFhQdRVG33GPC4mVBVS0=;
        b=IfqlyvP54yTw2OlVFRylgxEpFgL+L8LrIw5rlZXKRU83aGH5FGJlorjQLzQ5xIZyWP
         j3KXc/9Tc/jJ2sUAzonq23qxH0+4iaRoZpgFe/qsxTKR79f5Y2PxVShmMNJu/22dwR4l
         wJWOp469MSPshA+HMWhH3+fP03gL+inqglXgmUebdB0abja252P0SXXjBqF5TXkIxmQE
         VWCTam7yiPjxxWUdLOj8BUq9zM64yiWO0V9p38tMqiXaErHNGMYxluvEr4hyaP3g0tf+
         4FQI70PVSFNN3gAyY+3Ezg46/Twb2ArBmtjLf9VfKgoiA0nvhyqKmgfBHPrz/VOI/917
         6sSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HACgQ7+uQvos15VetYD4qmdIFhQdRVG33GPC4mVBVS0=;
        b=V7TgmGZn9z2nfsU2j2SsDSwrBrShUmmqQ41SlRkFckMsQbiRtMsdk/d7ewnJLuWykN
         b4sHMWcrZLA7vLzTdLWvxOXF0saTP7UP6+HGkCxFkiVMFRrcxTZ4qWggrr0kx15ZFbnv
         qCO0ocMSgu92UgEy3gz0yQSW1CnB15uPhOoeZm3Iw73pl+XuXlZ2dmqa1bXnjgc4SSI4
         Lclh8vJcWZp/Kc/0p2dWHh/aXZtk+mgiiWTawEwNrx5HzFCBBucBA4JH59VDLk6Z5GsL
         vbcu8JBq7XT1iX60n1WxKm7K4xZunADQsDN7a2Bgp1RC84zE6hv0pHSZ6vBU8B7X8sbH
         TLSg==
X-Gm-Message-State: AOAM533MkrhAbUxUn2H7CD9ItCEuPV8Tvco3GKcGUimpkmkRnJWizdKF
        DusML7l3dbgIEU2tVdak7nY5tVv7Pw7vwE5nWYA=
X-Google-Smtp-Source: ABdhPJwsu2EQFUdHQ08bv01tA8IbeGHZIRhilMUe6dtRL2BO2xScVQbk/UgICxWHc4hlrxZaLNs03lAbI2D7geFDELY=
X-Received: by 2002:a17:90a:e454:: with SMTP id jp20mr3381496pjb.129.1617193758181;
 Wed, 31 Mar 2021 05:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com> <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
In-Reply-To: <11a8323c249ae6ea7584402ab0fb74551b6a4b7d.1617189926.git.matthias.schiffer@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 31 Mar 2021 15:29:02 +0300
Message-ID: <CAHp75Vcc3CNXguMK-ZhRfvfjVBQBbcGEYK_+WQAmb_Sw5-Derw@mail.gmail.com>
Subject: Re: [PATCH 1/3] gpio: tqmx86: really make IRQ optional
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 31, 2021 at 2:37 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> The tqmx86 MFD driver was passing IRQ 0 for "no IRQ" in the past. This
> causes warnings with newer kernels.
>
> Prepare the gpio-tqmx86 driver for the fixed MFD driver by handling a
> missing IRQ properly.

...

> -       irq = platform_get_irq(pdev, 0);
> -       if (irq < 0)
> +       irq = platform_get_irq_optional(pdev, 0);

> +       if (irq < 0 && irq != -ENXIO)
>                 return irq;

This is a dead code now. I suggest you to do the opposite, i.e.
if (irq < 0)
  irq = 0;

In such a case below change is not required.

...

> -       if (irq) {
> +       if (irq > 0) {
>                 struct irq_chip *irq_chip = &gpio->irq_chip;
>                 u8 irq_status;


-- 
With Best Regards,
Andy Shevchenko
