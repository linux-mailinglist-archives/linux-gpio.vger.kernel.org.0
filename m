Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E51652DE736
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Dec 2020 17:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbgLRQHt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Dec 2020 11:07:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726209AbgLRQHt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Dec 2020 11:07:49 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B24FC0617B0
        for <linux-gpio@vger.kernel.org>; Fri, 18 Dec 2020 08:07:09 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id q4so1629226plr.7
        for <linux-gpio@vger.kernel.org>; Fri, 18 Dec 2020 08:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2B5AdFldYqUoksetHPNU5Otzzp3+fqLWvdjGm0Jpin8=;
        b=fvdeiP0qHClm1ugh3SVLvPTxQY57TzALa5eztNlFGJakbwKGLbnPcn4p+CXbOeSPeX
         O0hiPRDaPOfFysLex1D40p6Fgl4I81//tiMTvL0lGfNYogjwKnzE4zO2LZ2w9ncKr7CW
         AJVFx6MsXg9bkw6Mm0iMsHthrSjcoDs48Ql8flJdnM/x0pl7GcscD0Gat0vV5eLA9dK9
         6YRbTqv3J6dLBYUOcLT3pVKVeJy55wldF+aEB4QLs+cV8OjoqIByqI1VVAPGUo8CuxKZ
         Gtv/7yj6fTGGtc1HekfnCZMljoQMYj8tAgzBhEwKHHXTYsIW1dPVL8S5Xv964p16hPTN
         U7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2B5AdFldYqUoksetHPNU5Otzzp3+fqLWvdjGm0Jpin8=;
        b=Wmp20WrXvuqsXshWO1zRMIRpwdfleH5FHetq4vNLe7DemGpL+Y7K/VN/aapa+wQnpt
         1U5wl8AYZbTMkYb0Gq9S8J5bFAKXF8UIhQi4UYj2t9AV3E00HuJJnmpZ4BY0jGyEqhpY
         /6wUzOe2zJOmSZza+buQEs5MG/3bKIR/7oLTDN+SscoUwwnRfasVNDrOACpgAjFFqRMS
         HnJc1cPPcQti3r0i1V9vZxLdwcpVoIx4R3ek74/fvBPH73ilSD9amrVbXAVTghlKaLoT
         F2ib8xxwFW/OcrYnnXkVS/pGXTXPspRLU8FJ5+8aNqmPQqvpxCw+0R7fmM2nPwB4nelv
         TYlQ==
X-Gm-Message-State: AOAM533o6FmDvCUy50QSRnQpFOAON+JGPaQkb1tFK3oaq6x1j8P9SDee
        UNi11DjGy/VDXkDZT1u0YKVU+rise9CzH4fGM+da2VvyNMe6Bg==
X-Google-Smtp-Source: ABdhPJxrLjlfVwrOO68BiolaycSulOQ/9z53S6kNB862ZYSwCKWmPUzU8Wp/3B9saI3EvMmIYjEmw/xL6f5ifyNv/eg=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr5099904plb.17.1608307629028; Fri, 18
 Dec 2020 08:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20201215123755.438369-1-linus.walleij@linaro.org> <CAHp75VdhVk_6VcYDWpx1tabafPENQcrPc_4KGE_yT1JmDG0cjQ@mail.gmail.com>
In-Reply-To: <CAHp75VdhVk_6VcYDWpx1tabafPENQcrPc_4KGE_yT1JmDG0cjQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 18 Dec 2020 18:06:52 +0200
Message-ID: <CAHp75Ve+VZc249QGfyjteyDX=cxDGXahP_+MUM8BjqCtfs-F5Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: Skip over NULL and (empty string) line names
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 18, 2020 at 6:05 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Dec 15, 2020 at 2:41 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > The core will warn if we try to assign the name ''
> > (empty string) to two lines. Actively ignore NULL
> > and empty string in the name assignment loop.
>
> > +               if (!gc->names[i] || !strlen(gc->names[i]))
>
> > +               if (!gc->names[i] || !strlen(gc->names[i]))
>
> > +               if (!names[i] || !strlen(names[i]))
>
> Can we replace strlen() calls by a simple check of the first byte?
>
> names[i][0]

Unfinished example...

        if (!names[i] || names[i][0] == '\0')


-- 
With Best Regards,
Andy Shevchenko
