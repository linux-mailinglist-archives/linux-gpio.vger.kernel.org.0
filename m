Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FC52D7EF6
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 20:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgLKS7W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 13:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732084AbgLKS7L (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 13:59:11 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07A9C0613CF;
        Fri, 11 Dec 2020 10:58:31 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id c79so7550017pfc.2;
        Fri, 11 Dec 2020 10:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=320RebTR8RNqiiBYn8ZtKuZFxrkRlPQWBrl9GpDvUvM=;
        b=LKJt41PIAvjRtKddIbd2BmReM4x7NmVbbEQ2eAMRf7f07yw0fYlUf1748jdc/SAVAK
         TpXdkvk8yekQjxPzQJnkVouWqv0c+ChuAA41eeLgyoiiFWLjOv+n3d9FTQjjAKUW6uvH
         0X/ZMuckLfEjo3m+X6S3H8/wDjSYAy8y5YbR3ifxdAkW24iQHeCUL8A3JAQHzcbNgvtm
         S5al5sx0D1BNPeNDozCOOCno+ltgZBlUw6HiRpdQfTQl1gjSOLpU/kYp7Zi8YU6+Qucv
         ipwAvtyusSgjihMaEcMB9LZVQnAJEbpj1iAThLWROg1hXGlQNwExfsH14KRRLCES3CG1
         GCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=320RebTR8RNqiiBYn8ZtKuZFxrkRlPQWBrl9GpDvUvM=;
        b=tDLbHv4a59nYtF2MHioqm5rn6f4xsf8RU4X6fmScmCs0AtHQS9Mqnx+wMmcqLGWlR3
         wlzSaHw3Z6Spxqh1e2StEIMWOkKly3jXcNLuPeSDVJ6Ko6t2tQjo3hmP/CjfDVonFyE/
         3s4QIBVhjKzOaiZy31yISWai1cQwVnTW1FHIlk1HgxTIRnLQTUNuvLm8/qP6yUNkUUca
         1qQ7L9h6Fyre88GlmsgFcPi8972HIZH9w1c1tr8UlkxzZyyR+4TpNAPGUPZyjEA0IYXQ
         EoLf31Kv+P8fOm53LjRtLnj1kSTwmUDuVoiXhBjlB6LcAT8zjUHzQQfUsDeME2KCyS9X
         fxnQ==
X-Gm-Message-State: AOAM5310IK2fr7SgbLitl2KoV4uiUhMhcqUGSROv9OIbqFOksz4clsLl
        jQZZdjyESVAvq/oByUQaOzBUg+R8Lt5xse+Fxfk=
X-Google-Smtp-Source: ABdhPJzCwaH9RtljsVUgVllZ8IxAE73P9W7PrK5XYEhFoEd6uPSxaOLS8UXO/eps772X8J4EBsfcIjtMm5H0Z3jQYws=
X-Received: by 2002:a63:c04b:: with SMTP id z11mr12389891pgi.74.1607713111220;
 Fri, 11 Dec 2020 10:58:31 -0800 (PST)
MIME-Version: 1.0
References: <1607659581-15764-1-git-send-email-lennychen@tencent.com>
In-Reply-To: <1607659581-15764-1-git-send-email-lennychen@tencent.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 11 Dec 2020 20:58:15 +0200
Message-ID: <CAHp75VdmC2QyVYz_QcbgpdMwkJ5VndUwp=rmk=b0KSZcwZrqkg@mail.gmail.com>
Subject: Re: [PATCH] driver: pinctrl: fix unused variable warning
To:     chenlei0x@gmail.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lei Chen <lennychen@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Dec 11, 2020 at 1:46 PM <chenlei0x@gmail.com> wrote:
>
> From: Lei Chen <lennychen@tencent.com>
>
> In pinctrl_pins_show, range, gpio_num and chip variables are not used if
> CONFIG_GPIOLIB is not defined. Use this macro to wrap them.
>

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/drivers/pinctrl/core.c?h=for-next&id=b507cb92477ad85902783a183c5ce01d16296687

Rule of thumb: base your patches on the latest subsystem tree snapshot.

-- 
With Best Regards,
Andy Shevchenko
