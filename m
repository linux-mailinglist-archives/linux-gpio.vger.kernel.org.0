Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0852A7A17
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 10:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgKEJJ6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 04:09:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbgKEJJ5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Nov 2020 04:09:57 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E2B9C0613CF
        for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2020 01:09:57 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 126so1206513lfi.8
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2020 01:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9FrWvCfEx0fgNoGTJY2C8+/GPZpBWAF7MF2RrTEBwyY=;
        b=QIIKZbpfYCvwo/SrHQCx2wyaY/eN0XtnsywgLdK7jWXijzGnUiZFyUG4uQCYpRogDy
         KxXClTFipbEIT7zk2DH1h5nnE7lpDB0SrCLJIbfrSroXKSGPJYnImvSbwG0YgxmvCcPY
         4/TkrWinNGato3nlI5/1I4c0s26GrRSTIWkFnvaOcJCkIZXKlkC9U67ENNLbZogTr8nf
         kYd9Xv+HbRmrh4QiaUM/kimjTYo+Z8+k+3zkBEWzFV3SrAHJGns/OWgABTtnesssFgSJ
         0VLVIVTdQnExZUKRGe13yXxOomc8o3RBmnsg8vDa3moGXtz1gsOWOnwKQxI5Agao/XMq
         KTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9FrWvCfEx0fgNoGTJY2C8+/GPZpBWAF7MF2RrTEBwyY=;
        b=UoAFu/lyPQtyHTupyKk2fGc5d/pHzzU3XRSIkZ1qKgD72w4x9Zp0JatwhMOOo9Vlhn
         GAx+th/PQiQiO1yjXG5O/w1AkCgIC1/v0Rr01684f4se5zBBbOdGUnNqAktl8VP67++N
         0CTSgt+l/4mTOsyza2fnC0RLueks6vkO02Mk5cZpUvgEoywHpKa8jglC/kXap9SlyQgw
         Vct/9SFr8UR1b29Ch9bra4/5M7a8F2RB8UmgK2fLqo+fhUGj+qPQBJcMgoFWhumcJ+EX
         MVvg4hT7N3AqbJAU5aQoFNdMcBbO0Y+t4it7Ke6pQgcciAmePznFFQmeUonjXXbhsyx6
         j+Lw==
X-Gm-Message-State: AOAM531i3zDg3nSdxUU0mN/yKQsLFBH+m/Ceg8kmdxvhtHKnnfUg3XP/
        Dwg+AIZJ+3NkfdNLSWz4asd3DRQiWTleLeWxk9ZsS5x25ogNBw==
X-Google-Smtp-Source: ABdhPJyv8eYxvsawpVw0jeCSMvMnujpQ7XwVA5W1XIDFLBHmG8xy9I7hFIujFM/LKoEoRPGrdfw4on1oOf4mzkH6r8Y=
X-Received: by 2002:a19:5e0b:: with SMTP id s11mr545101lfb.502.1604567395983;
 Thu, 05 Nov 2020 01:09:55 -0800 (PST)
MIME-Version: 1.0
References: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201014104638.84043-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 5 Nov 2020 10:09:45 +0100
Message-ID: <CACRpkdb_zWU0a3th4XAiZn65iO=8mAt6mpAEOjz-q32kYKpLZQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] pinctrl: intel: Fix 2 kOhm bias which is 833 Ohm
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jamie McClymont <jamie@kwiius.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 14, 2020 at 12:46 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> 2 kOhm bias was never an option in Intel GPIO hardware, the available
> matrix is:
>
>         000     none
>         001     1 kOhm (if available)
>         010     5 kOhm
>         100     20 kOhm
>
> As easy to get the 3 resistors are gated separately and according to
> parallel circuits calculations we may get combinations of the above where
> the result is always strictly less than minimal resistance. Hence,
> additional values can be:
>
>         011     ~833.3 Ohm
>         101     ~952.4 Ohm
>         110     ~4 kOhm
>         111     ~800 Ohm
>
> That said, convert TERM definitions to be the bit masks to reflect the above.
>
> While at it, enable the same setting for pull down case.
>
> Fixes: 7981c0015af2 ("pinctrl: intel: Add Intel Sunrisepoint pin controller and GPIO support")
> Cc: Jamie McClymont <jamie@kwiius.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Good research!

I expect this as part of a pull request for fixes or devel.

Yours,
Linus Walleij
