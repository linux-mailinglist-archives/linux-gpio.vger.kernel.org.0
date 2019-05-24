Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7475629721
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390879AbfEXL01 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 07:26:27 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:34994 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390772AbfEXL00 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 07:26:26 -0400
Received: by mail-qk1-f193.google.com with SMTP id c15so6936004qkl.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 May 2019 04:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AQbzxXz1q7eupENIwZaibprKRQQ1QGdGQzKNp6w4Rig=;
        b=qno0DZOafF73RT0ZDcC5fDnleaIYN1r7Spg2AtrRPoNELpOm+eVBquKf6qMKWbrZll
         vML+ySumfkUfEYJsRHL24yaWH5pJ2yNZvk+QsCm9PHbbqB9FvVUNPlDWi7czSYwW62gh
         LZl2c3bZ6CtXghWBQfFf+LQJRDn3nM+w6HyXoPhLlkwZ26YXO2dC2zAUmr3wKfwVhcjz
         zJb7JHfyzcbGDJkHpUPYxU8vDenHtUxsi88gK56wAcnT1O7pEsALLubqM2Jv9hNu4Krf
         /OvG8Q/kHdAMj8+NFilB1sUaRV8xwnSu+MqeNgwFaIq7JTUC/dBUgN7YcA3F3ADeOT4k
         vaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AQbzxXz1q7eupENIwZaibprKRQQ1QGdGQzKNp6w4Rig=;
        b=itVP7kDQBGXyHG5BhMLJIGhTUTDRvyjp4IVLP1uR+/OL2nJM4fJunVnqnPvw5OtgmA
         uFGxErm10J30FpWeWQGav4cZtvoe/STLikP7VkNt38hsal9zzck7m8KbUgZ5TPUwyfa3
         FZ30DlObQalJazURPBfPzxw8vKbB8NLyPtPuPLVBbQVjlRy92HlblwGI6V+CXmm1ZaDL
         /5MVeui6e8aglVrd5qoWZCUrqBy3qEq7stCoqW37sDhRPwb5DA0+qsGfGs+fyhbge5H+
         lUnVE/N3lNdAs9787jFd6JJBJbTtp3C7E1PG0wu1gXmbP6fmd9QlA5ZczZOk8Xauf5+P
         jfHQ==
X-Gm-Message-State: APjAAAVbqUIDW0+U/3WkMKvRTNf0z1KcCrxEzwimzUk10dSp5zgTfzGy
        rzT5FDILRNfkdTgN2+dk9W/IXqgmIUTcMx0TbbaQ8Q==
X-Google-Smtp-Source: APXvYqwjkUQ0RLpOGJmq7DNe4leRPE5WFR5Q2/qSAXC1a4jjesdy4O9Mkrsk1p39MJVgfwXgFcwsHDCr+h35uS+jHwU=
X-Received: by 2002:a05:620a:1648:: with SMTP id c8mr73380286qko.186.1558697186148;
 Fri, 24 May 2019 04:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
In-Reply-To: <1557474183-19719-1-git-send-email-alexandre.torgue@st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 May 2019 13:26:14 +0200
Message-ID: <CACRpkdZ4P=PSCu86p48nBPeVk-h5T0Ytc1CYV3XZGd4fLuJLGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: add lock mechanism for irqmux selection
To:     Alexandre Torgue <alexandre.torgue@st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 10, 2019 at 9:43 AM Alexandre Torgue
<alexandre.torgue@st.com> wrote:

> GPIOs are split between several banks (A, B, ...) and each bank can have
> up to 16 lines. Those GPIOs could be used as interrupt lines thanks to
> exti lines. As there are only 16 exti lines, a mux is used to select which
> gpio line is connected to which exti line. Mapping is done as follow:
>
> -A0, B0, C0.. -->exti_line_0 (X0 selected by mux_0)
> -A1, B1, C1.. -->exti_line_1 (X1 selected by mux_1)
> ...
>
> This patch adds a protection to avoid overriding on mux_n for exti_line_n.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

Patch applied, can't say I fully understand it but you know what
you're doing!

Yours,
Linus Walleij
