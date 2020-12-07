Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2D32D14F2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 16:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbgLGPmQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 10:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgLGPmQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 10:42:16 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F40DC061749;
        Mon,  7 Dec 2020 07:41:30 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id q3so9221124pgr.3;
        Mon, 07 Dec 2020 07:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6bwFpo35es8wLk5NhibYg+TeLN+z3hooUCzqmhyN1U=;
        b=epAl91DNeg6fZtFYD67aKCCsc1e45j8LLu0urPe3RtMRICJgT8yIOmqvdiT9QTpk2q
         4HqiE3YE7lbZxRjDxm5QHyb8nvpWaXBWXrBRe457xwlM23WlHLxIRzMhm3bdG9FTfps2
         ZGm6azTvbvQ/mOr5QRVdaTKljQJfxzLaiiQAdov5bt2Vj17JlMp0FvgP54bIPZIJJd6S
         h5mrxVR/c8ga3C9+mj9EZLRHJBk/zI0BDEu4IbRrJiUgZPh79OzfSMxwdxZVL0/hwflE
         0EZ0P5hDyc5NR1YJuUzPpCjXqWWLnlgBWTm5kqvFPxNOdiu57dsOBvK1HAqL5jpOo1g/
         kRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6bwFpo35es8wLk5NhibYg+TeLN+z3hooUCzqmhyN1U=;
        b=W1Cr1EpgYBlwHmOmpD53O9Sf/KZ+EBRAWfkrZHxvfN9CtfX7McRzK6+jkx36RTXcjx
         wCzdb28Mgz1nmwVbUyAB4LrGZIS0yhJbZ4zXsLiH7/4Zil6tDylqMOxtx43m7osRRI+q
         wklM+WwCTjpuahr6hCu1/u+DjkO9uM4TgH2tT8rxuFq6dfW1SttqDEej287fXzQ7crOb
         rY8c7IkwPSABsAMzpZFHHnCUMBdqfaHvMO/X7QnHSQD1LbZ3gkS1pEwjdVDBWJDtltTe
         DUQrXg67F2ZO8kfjtXGkpRMPaM59eof9jxRWs24+WFJasDwQGTPX9+tIQI/Pvcjp6/ta
         tlOw==
X-Gm-Message-State: AOAM532FZahaPkDiDKWc8Z0iTduZGLuk7NGxNKIWFi8Cyqu4mu/zmj+k
        CLIWDro2AtI8GOS7YXooGb7YuaQj08cCbaTqKAs=
X-Google-Smtp-Source: ABdhPJy0J0wMIbx/uoMm5AY9VvNc+405O1p/i7YOAoUKvbaSg//wrHj2iKkiEZQO64u8lwSzUv6UkJyDyibKFQGLj0o=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr16587022pfe.40.1607355689471; Mon, 07
 Dec 2020 07:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20201207112354.13884-1-info@metux.net>
In-Reply-To: <20201207112354.13884-1-info@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Dec 2020 17:42:18 +0200
Message-ID: <CAHp75Vd_iiqTYvgD59C7j+btx70s_Ge0UC4JU2uPa33enFW08w@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpio: put virtual gpio device into their own submenu
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 7, 2020 at 1:29 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Since we already have a few virtual GPIO drivers, and more to come,
> this category deserves its own submenu.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---

You are not a first day contributor, where is the changelog?

-- 
With Best Regards,
Andy Shevchenko
