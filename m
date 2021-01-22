Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E02A3000B6
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 11:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbhAVKv3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 05:51:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbhAVKtq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:49:46 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A82DC0617A7
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:47:31 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id g24so5976796edw.9
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 02:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TZSYs+h9t6X1gUGOCfKoXkOJOQBI+D5KFaDkn2QhJco=;
        b=pO89Z0kDwzHmhoqyiQj4RB46LO0yiFxh/NLrfzszr7mnlYdTbR+l12JrUjjHmHK/or
         3CCA/O5nY6Z0w2IbeUX21Hp7HWeud5lowDsvuz9WYfMUxXo/nAYoNomDtVQifk/T7D+9
         i7f6OWOdFz3NqpBPFd1cJtXUHSHE+Kwvki5L4T/LpkwvZ2ouvZ+J4IGFKGh27XslJLhK
         S31EEgNt5rLHqqY6JFKag2kolbGxMzQToU1jJehhPmAPGVvKyJvSEiux8SBg+k3kOQYi
         uP/y91ldijn2BCGI03zPj6Nu09G8FzLCW1yY4NO7mxTlb3VR2uyzln4VqmrCCl1tQQbD
         Fdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZSYs+h9t6X1gUGOCfKoXkOJOQBI+D5KFaDkn2QhJco=;
        b=f5hnRmssZxv6Lsl5LJ8o/tuIC7Rc9XqrDRKwLWbhTgioWIQQbkN2kJcajI8yZZsJ4x
         ++XwoWkGSOjBE3V35SsZ58QgsiAVTZonGAuoap3PhXd8lA4D/CpTYsEoaA+q6O588ILL
         GDAfPQSg/2EtiCCTUk4Gv1yHI86MRwWnBgF7pCSaY54JGFi6/s9vI6tJ6yN8BpCNzyJk
         RkHN9fk5DffkuuFxS582d6ZxWENv9hOThKgbunRDpNWbS+v8QX2PxdIQiB282SZ3MDLA
         EfNC2LVLHt4Xw4xgO8gxzyniZCtpJMP0crPwrbWll7XD9vhqsBJzEMsKVwalHp7ZPRK1
         uNGg==
X-Gm-Message-State: AOAM53179vHfz7hst5yPlU4h5Pgfldqtsg1z+Wg7M0X5gvRQjJ3tIfF8
        0dYORon6DK/8024AUDvJnXHz8WYc0ol9FYTv3hbhbg==
X-Google-Smtp-Source: ABdhPJxnSPHUfuv8hnzdGXlNIbZJckBcZnTS3WiRyhxqr0kXUvXg+frwN5HatVivOZYZn5O6Regxy0LM8NltBBf4uTI=
X-Received: by 2002:aa7:ca13:: with SMTP id y19mr2653170eds.59.1611312450134;
 Fri, 22 Jan 2021 02:47:30 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com> <20210120214547.89770-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-4-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 11:47:19 +0100
Message-ID: <CAMpxmJVEYtqwAApmAcDKS6fhxiUD5buYcT=qNSqM9Z_7FGUUrg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] gpio: aggregator: Replace isrange() by using get_options()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> We already have a nice helper called get_options() which can be used
> to validate the input format. Replace isrange() by using it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
