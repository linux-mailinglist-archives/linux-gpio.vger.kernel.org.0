Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4FD4369677
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 17:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhDWP5R (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 11:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhDWP5Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 11:57:16 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FEF6C061574;
        Fri, 23 Apr 2021 08:56:40 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u11so19681213pjr.0;
        Fri, 23 Apr 2021 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A1RCdKgo3V5D8bsYpiTQwFWuR57ot4dlHoGKXLmviXw=;
        b=joZEtGxYUhnOAGDIfq1sCuYw76LMZF+ApjqlONqUasRZcvRpnwbdLeRlrdHaDzRPBn
         hIA6V53qh9GI3n2XypfV+HQt1EH5in33s9BueB6MYUomYUMMn2ZT3vyMi6TAMroGuOSM
         24rRr79mcjf0eQ1O/nANfjO8nszM8uxZz0evyroxT5FHWQ5ZAEl0Xh7uAx+UcwAK1Wah
         dbP7w/v0RU9RdN8FHpYPD4WT9utkaVcBLjay6SPU3VkDo1W5hAyu0ZQTBxxgnFQpPBXc
         byJgmrUq+HGhxpZO43tXZ7WysMJ0x1P7zPx/pR4mYcNLq8GsG7HJ4lyWHu/n06iwLcBC
         MP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A1RCdKgo3V5D8bsYpiTQwFWuR57ot4dlHoGKXLmviXw=;
        b=JDDrWmGbVz7Dp17glgIGwGgkFubsD/RikPDM9c+w5Ub60qfjFUX5iz27CKDdwV8AMZ
         0CqUX8pz/oE36peXMsOIYUu481UR04TajuMQBXsziuClfTDByhiE/JQgaehouZgtjPjt
         HPhS9SFkS9OXYcsvM/iZjVVl6+ZKkUSO5HkNeOHAHnAAYp0lFkxtGEFksVH0meGXsXj1
         jt2CVgHNdnTDTH/lRChCU3TA0QkzEVW1+51zeBEQVEnfnXktZ0vSuL6ograTWwpz4xEv
         kE5cn8JDaTX0576rBFdw6RXUMNOs/hXnjS5L+1HM7s+HtknsPcwKGqJ549NxRR6oxULF
         rFKA==
X-Gm-Message-State: AOAM532Q1TtAkWYCUdFykMNghJgbC8IOCqHUXSR0y2c8m+dn8s2DqZaq
        8UoWiqDEWPgxx8tKnvmhJpgVrvhHq5ldtJk7/kkOTDCKzdA=
X-Google-Smtp-Source: ABdhPJyK3aomL5Z3p4nKV+DieHvRhoYj0FOyKuvW4PexW3+aQn56v09lH+FfnbWDHVMz0vRHMuXCqrmzc+P20juhzt4=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr6805497pjr.181.1619193399948;
 Fri, 23 Apr 2021 08:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210422152055.85544-1-tsbogend@alpha.franken.de>
In-Reply-To: <20210422152055.85544-1-tsbogend@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Apr 2021 18:56:23 +0300
Message-ID: <CAHp75VdToRrxxLSAnNPtN4sSoVfJ1yHQffUAuVL+SpsxkmYu5Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 22, 2021 at 6:21 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> IDT 79RC3243x SoCs integrated a gpio controller, which handles up
> to 32 gpios. All gpios could be used as interrupt source.

One missed question: No I/O serialization in the entire driver? Is it
taken care of by bgpio wrapper or ...?

-- 
With Best Regards,
Andy Shevchenko
