Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 781A03E2B60
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 15:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243383AbhHFNaQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 09:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbhHFNaP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 09:30:15 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E359C061798
        for <linux-gpio@vger.kernel.org>; Fri,  6 Aug 2021 06:30:00 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id oz16so15076351ejc.7
        for <linux-gpio@vger.kernel.org>; Fri, 06 Aug 2021 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MFrb91O6RwdmE1X03FmcX3poCpsSVZ5AJxbH3MJsyRc=;
        b=X8fH4+ne16ZmigrvRAc4gJAuV/Z7XA166Vgzvx7M9zszZVi5fitYFBa9U9AJpuBE7y
         e6VoezCc1dwLh7atnUphmyw2eoyrGhjh3McDQzS0YHx51qiwAUIFlt6zN6EoFVkDdqQP
         jpF6E50vdhy894YA25XD4a7mhDBYaDoRrVrruU0Wi9SO9l55TkUy5NxzQuVHs5VWN0yX
         0F8ZEqW1/WAMnVR6oWeO+fu2QpIb9ieErAhcY/kzNJrotFBakl5ezNZob7rFD3h2kUHZ
         OG70ZLkqjq6UTU431lAn+rRzrEViVcZHfj5bEkOfl8smGc6KCQDy1c1iWB1OrSXMuYOx
         +tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MFrb91O6RwdmE1X03FmcX3poCpsSVZ5AJxbH3MJsyRc=;
        b=rgsktnnkxw0vMiH3vcUogHNV5sQaS7c6opNfPp3JLlas5gR1YDne4d+Fx6Xvhv7JyG
         lzp4Ybrk46BmI8nKyJfXPe+5P1fZ+qetLGXlHuzZgu00+Hb8sKfDjl5s+Ts6RguRci5X
         MjfPtTXtWJkEoX+yF+kf+xiNzPDFMNbQVmCPqlqaZZg4g5jh9ITRfB0GifM1Woy1eUJw
         8fs1r3uby50IfM6m/y7D/B2uvmtChASRNSyAz/brz6+lsRLkhFSCmaVpgkbJvAsOINdb
         M1R5XxtxXO3Lp13fVAxbqdObMi4JkLhU2AOLbjHKkdlL0svRHd5VxlKOdGGuucTag/X1
         wiMw==
X-Gm-Message-State: AOAM532nA1XwWua8nvmfZHAycbEQbulcGDVhjd3wmdn2bJkpp/8I5GkI
        Ru2XG5/13PzTRnxH1c9b4shzZ8O5GOXpwFJLmFYTtw==
X-Google-Smtp-Source: ABdhPJy0toXEr7qXLKP+Jpeb7Fz1+jXFfF59ia+gscqusFR0DN/qgH+2GBnOSmEaDmQt3RfmIbX04IghVa3moqt5jm0=
X-Received: by 2002:a17:906:7b53:: with SMTP id n19mr9781328ejo.14.1628256598713;
 Fri, 06 Aug 2021 06:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210806132719.23469-1-brgl@bgdev.pl>
In-Reply-To: <20210806132719.23469-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 6 Aug 2021 15:29:48 +0200
Message-ID: <CAMRc=MdYrrb=4aoq57DYY7AiBNGKJTJVy8di2h2n_R2-ZDWEMw@mail.gmail.com>
Subject: Re: [PATCH] core: extend config objects
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        Ben Hutchings <ben.hutchings@essensium.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 3:27 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> Kent suggested that we may want to add getters for the config objects in
> his reviews under the C++ patches. Indeed when working on Python bindings
> I noticed it would be useful for implementing __str__ and __repr__
> callbacks. In C++ too we could use them for overloading stream operators.
>
> This extends the config objects with getters. They are straightforward for
> the request config but for the line config, they allow to only read
> per-offset values that would be used if the object was used in a request
> at this moment. We also add getters for the output values: both taking
> the line offset as argument as well as ones that take the index and allow
> to iterate over all configured output values.
>
> The sanitization of input for the getters has subsequently been changed
> so that we never return invalid values. The input values are verified
> immediately and if an invalid value is passed, it's silently replaced
> by the default value for given setting.
>
> This patch also adds the reset function for the line config object - it
> can be used to reset all stored configuration if - for example - the
> config has become too complex.
>
> As this patch will be squashed into the big v2 patch anyway, I allowed
> myself to include some additional changes: some variable renames and
> other minor tweaks.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---

Please disregard this one, I forgot to use the correct prefix. Sorry
for the noise.

Bart
