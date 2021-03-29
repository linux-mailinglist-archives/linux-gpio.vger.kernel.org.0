Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D502534CF8A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 14:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhC2L7n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 07:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbhC2L7S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 07:59:18 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E8CC061574;
        Mon, 29 Mar 2021 04:59:18 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id w10so4930872pgh.5;
        Mon, 29 Mar 2021 04:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S1q6FN0be2nNgkxLhQ/5xPXLSDRhRJotDmWVTEUn70Q=;
        b=qJ8ZgwY67pQO889tRUpKdSwyP2wHUMHml2juMaxM8RoQgssdUTSTIkvXXFWIMqJCnJ
         ZRjSVg57gYYto/+XSTexZlAVod6elP8RXDAWz9u5lj5xlqc4iv0hyQJgwNU0M6PWqERQ
         5y0G0M3EsstmvUWUrcA5RA9cLde3sFOzmwHYHeXfE9BKVymp84AwzD6yKrddSf362opN
         0ol3L9Hy8tq180eAYdTERHZov6hyvbyIK2KE0YZ5ObBTeEaX88+ZiEIhc+2d7YSpbpVJ
         tD8vJ+NY9ZgDOpm8g8/o0/LYCtig5Kp4uNtLgpw0ffW4nQUaOO8WAdWJdIei7SoCMNGT
         Jejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S1q6FN0be2nNgkxLhQ/5xPXLSDRhRJotDmWVTEUn70Q=;
        b=DdtRqNhGRMqQnS58pfNRsCeX8ddWfg/tSiUM9TrfGDEOfx5uNwrN7E0uixpRhY2Mus
         f8espE5XlMfRc5as2CeX0zCR4psohiyhcK2qoydWmchxlCiPHS0bo8cYaytwwq7vv0st
         Dj6GVjvhKlb0GeYX8huBqdx4qly6wlBJeU6E8JKN6CG/ZqmSLb7mdu6TLeIZ4sVq/aHj
         61Ze8P+OeZHA4nxINnQE/vRNqaTNMI5Q3n+NQuWtqAHAazQuzhGnvB+ejsqdtxRHECRU
         73qjzitjCmPCNUi5kBqmZLuXwNvNdYiEddzyGirkI+STkeVhgxlwso0ipzvSUWNCm55e
         AvRA==
X-Gm-Message-State: AOAM530528RTdJOGzbd2+HX4ofMlaop20b3yDOa1j3auGJdnUD6Alpdh
        HXtZDWQWxFov6Y/4vqLul/nF4m59BCaN2sDvLbM=
X-Google-Smtp-Source: ABdhPJx2aMWqnSdKxJ6nPeD7uZWyqNOKOyM8uxiOe9McLOMNGKyJKX3sv5uI+EKLH2FTISuzffJpiT92vaL/V5hMC6c=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr1025033pgi.4.1617019158130;
 Mon, 29 Mar 2021 04:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617017060.git.matti.vaittinen@fi.rohmeurope.com> <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
In-Reply-To: <d2c8b7f9a3b420c2764f645da531a57db16905f3.1617017060.git.matti.vaittinen@fi.rohmeurope.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 29 Mar 2021 14:59:02 +0300
Message-ID: <CAHp75VdXa2bkJ+ej+HNYstLeK4TF+L5H3wTgm0CgJ9hYQeU+ZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: Allow drivers to return EOPNOTSUPP from config
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Joe Perches <joe@perches.com>
Cc:     Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 2:43 PM Matti Vaittinen
<matti.vaittinen@fi.rohmeurope.com> wrote:
>
> The checkpacth instructs to switch from ENOSUPP to EOPNOTSUPP.
> > WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
>
> Make the gpiolib allow drivers to return both so driver developers
> can avoid one of the checkpatch complaints.

Internally we are fine to use the ENOTSUPP.
Checkpatch false positives there.

I doubt we need this change. Rather checkpatch should rephrase this to
point out that this is only applicable to _user-visible_ error path.
Cc'ed Joe.

-- 
With Best Regards,
Andy Shevchenko
