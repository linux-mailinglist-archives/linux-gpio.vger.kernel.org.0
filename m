Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA67240350
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 10:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgHJISw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 04:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725846AbgHJISv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2020 04:18:51 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B839C061756;
        Mon, 10 Aug 2020 01:18:51 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id d4so4552301pjx.5;
        Mon, 10 Aug 2020 01:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LH83fC2QSW9BmGZJWVNgK9jSjlX920xKB+0fV1urXpk=;
        b=quHIMtbYBxFa38rabT9vCFkkcLuP/DlPjyJCkU1ofUH7NzXyAE+bGxdOm1dDllQcH2
         tFICdDt/rbyYes6dZHptp5xbaLefiiqmBXaiK68EDIkPmpNfu0LNqC8aBRoM9ARuYGi2
         NA7sr7YSquX09FOfVaixuaT7ULFjF2j/rqb3IDIS5P+aVJBULCqx+j2E/3yDXIMH05Vd
         6vsV9jiC+DdcUj76KtiBendkTDSYAU62GnQaq4AoAEhQ+NabseKkrASRR37SIxuxuSTl
         5q4h7d3XsDgOqpn8pPOIuDVCshWjWqNOIGPQMNllDyooPdWUN8fbpL+C23HDW8nkH/Yh
         Pl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LH83fC2QSW9BmGZJWVNgK9jSjlX920xKB+0fV1urXpk=;
        b=TSnfyBgO0Hpb2sOj7BRhQgcY+AKHKY59wENniB9FqChxn7gGjQ2tiphghV+JJ9jpD1
         eHlIaiB0yVPMamOGNgtdBUpIGodVJpYoBRq9cALAv7OGIHSxKyfCO00fjAsSUqnBaBIZ
         JmI4W2t/mre7oZCxcWhUwBmFTcfsSKfh/milpdWvidWIgy5DW2vzsHkxYU2OIKVUk3BK
         iFVvf9114ibtwsPglNMdFABOh46dqZuMXBPPcaUln1T1NbvtyHDvbNax9UpMQRuq030p
         6vlTbYmwgoNf6iFPuSpHElNEpFNhNqBmdFe2lAQodqTTJ5x7oZjp47sil52IUyVKEvO5
         396Q==
X-Gm-Message-State: AOAM530P5InD5VuKo6whKEhOYvuPvWjOUUgJedWFgykeWoQhi5HYPV/6
        EC5156J9j747FMiFgzz2nvXHnZQfdOaJGyOmEXPPs5JENlk=
X-Google-Smtp-Source: ABdhPJzcVsVarA5dLS3rUiRWPnvwUIZlS/1VcZ0ukG7XGFKvXNjQmLGIaPZ0oyQQkNiVJZXW+jvbttQfUEWVREcJveQ=
X-Received: by 2002:a17:902:4b:: with SMTP id 69mr23793584pla.18.1597047530767;
 Mon, 10 Aug 2020 01:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZyVM32opVPtgPonC0Gqg7YVyCCXryvA66FQbQUELdHjg@mail.gmail.com>
In-Reply-To: <CACRpkdZyVM32opVPtgPonC0Gqg7YVyCCXryvA66FQbQUELdHjg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 10 Aug 2020 11:18:35 +0300
Message-ID: <CAHp75VfhMpUW0GpzPMq=1GufAT+kZtO8AXCpyqip26W=vWNhRA@mail.gmail.com>
Subject: Re: [GIT PULL] pin control changes for the v5.9 kernel cycle
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Aug 9, 2020 at 4:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Linus,
>
> here is the big bulk of pin control changes for the v5.9
> kernel cycle, nothing is particularly interesting.
>
> I expect you to see two conflicts:
>
> drivers/pinctrl/intel/pinctrl-baytrail.c - no idea what this
> is about as both HEAD and mine look the same to human
> eyes, I suppose whitespace. Take whichever version you
> like.

I have also stumbled over this when back merging to one of our internal trees...

-- 
With Best Regards,
Andy Shevchenko
