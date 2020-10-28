Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9695629E314
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 03:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgJ2CpC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 22:45:02 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44779 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgJ1Vd7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:33:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id t9so582244wrq.11
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RwHMd9nNJDrCZQQY9z9MsksS67ghdV6lf0qJYLBuL9w=;
        b=aTm6r+eMKNxLRMIGLCcKhgs49InOA7XhLbWiAZ8Fd3GUsE1vqdKGuf8yz0Vce4w85e
         xwvYL3xfpvCD5GJNf6F6behhTYCzHKYlB0JdoR6WmZ/4UUVN18WtIsVlHVUjvxoVxi1N
         qMGyAVwbrMYiYSqCABbAHPvlSul0iqKmLv6dYMseSxFDtKXeBlK8oa9iD4/GuZ80UTjB
         HZPIMWrNANB7IoD6R5cZX6dBU6CClzRkAEUz2fOdufW7fjA9YfWado2Q9ylMy3VVyzar
         anfocd0VImDOQmW8a/1abWI2WWlK0TWl5gqRlGqPb/6SAWtx1XR/8Fbtykrrn2GnCmAD
         huvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RwHMd9nNJDrCZQQY9z9MsksS67ghdV6lf0qJYLBuL9w=;
        b=WWqIlZ10jbOMCtQksrbQAB7Vsebq2mTJsy/TWZrHnojPZmXvunyS7fkOI1KwN0L5Oi
         z7fGaBRo9RL267tPBU2+JEQjxcbmdTrKy1120Nd2eHBFRaOh5mPEWqSQAEecsbtsgCv+
         4PKfQBfJ70CA8S6ytNCsPSibHnyPIktfxiCMZ5dR4gAwAANeFRInknbzjVknlJOqVffY
         MU+8iQAx6WpxsKblv9T85Pc34zmqsS32YMYtMasq0CqLAmLKjiqmApmllWm9XkOgzGb3
         yJsMDKqbPkLipBGknWr86X2oic7FymsqEjsF6z4iTAkg9FB5VdrjyuBTlSwghypB0Hc4
         9kCA==
X-Gm-Message-State: AOAM530UQUKDqldLqjpcKblEWrFGTF81dDgmuAE0xq+LNVw36gLFxkWw
        kGMtcfhQeURQb3raiURLUGnd0qKxnUMneTW2kMd0PQoi9TBMMA==
X-Google-Smtp-Source: ABdhPJw939xH2jDNloF2M5EDl+nu2WQP9QKe67iGxQIrEdE6uS+aCV3rNRSgMKCxItJ3JdzJGWrxAgxigoGxnWREM4U=
X-Received: by 2002:a19:191:: with SMTP id 139mr2699355lfb.502.1603899685282;
 Wed, 28 Oct 2020 08:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201028060556.56038-1-tony@atomide.com>
In-Reply-To: <20201028060556.56038-1-tony@atomide.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 16:41:14 +0100
Message-ID: <CACRpkdYj_hjdA0iyOUdoyEDJ8N2v--JnEH_2CHhgVdJOFzfEkQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "Revert "gpio: omap: Fix lost edge wake-up interrupts""
To:     ext Tony Lindgren <tony@atomide.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Keerthy <j-keerthy@ti.com>,
        Ladislav Michl <ladis@linux-mips.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tero Kristo <t-kristo@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 7:06 AM Tony Lindgren <tony@atomide.com> wrote:

> This reverts commit 579ced8fdb00b8e94304a83e3cc419f6f8eab08e.
>
> Turns out I was overly optimistic about cpu_pm blocking idle being a
> solution for handling edge interrupts. While it helps in preventing
> entering idle states that potentially lose context, we can still get
> an edge interrupt triggering while entering idle. So we need to also
> add back the workaround for seeing if there are any pending edge
> interrupts when waking up.
>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Ladislav Michl <ladis@linux-mips.org>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Patch applied for fixes!

Yours,
Linus Walleij
