Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D87C440835
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Oct 2021 11:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhJ3JZ1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 Oct 2021 05:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231685AbhJ3JZ0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 Oct 2021 05:25:26 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2F7C061570
        for <linux-gpio@vger.kernel.org>; Sat, 30 Oct 2021 02:22:56 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id j21so23944004edt.11
        for <linux-gpio@vger.kernel.org>; Sat, 30 Oct 2021 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Psy9UUsgDMQIAe07LW7iWSQ2yT8pLhnvw8P2y5aXnxw=;
        b=GWRmgsNh1EIZROlnilCawgxwOE61yarRmN1eVIOunz6iylExwBE5hAFNpWjgW+aic3
         BG/c1i+WfRnGkVPoGsdEkuTMLAez8N4MrWH7usgB4BPwtYXDbd0Dlqw5M1yEsKoCVMJQ
         NGHlaaBcxoTPW8bf6H3eZGaawL6Xml6xp+ejurZCaQN5S0C3a+O8h3JKpnzVi7XASqKr
         nEdhjIGK5OcqQEuITPFi6zwXaiN97wy9pXNcJZiz87SjLoU4EvuXc+V0l96APlPugul1
         yNQMNVSQ5uJjmNmcKg9T89rtzeS9i796A1ezygqS9lnJpoubhSQ4mwETAEYuamsUDVib
         RJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Psy9UUsgDMQIAe07LW7iWSQ2yT8pLhnvw8P2y5aXnxw=;
        b=F81c+KklQrcJNgi0AapIUYe+zbazqUVPwa/WWWZuSWDhzqCeuHaHJhmhytCelTwht7
         c939fR1Fi8fvhCIPWyBmbf9cGupMKOAGSd9WqRySB5qU2xFbDyHhc7N/GJK5DTr9Q2is
         RHAaFkdQwBl5gW67cqvN4Z6V6TsxKg7fs8M2+s/GRFHhiPwRvIJNRPzRJ9xaZPLRYGDE
         AQen8ZGn38mCnCEV0MTwneIrK3LlWOspsTQrMunPTJimKh914BLSFepZ2uN6tnF+yZ9l
         9616AEbfc/z3+8utRNJB0LYDedF4bkeJccBjofoHLYzWtzsI/RZ0avGNQBjvaE2UPLR8
         EVyA==
X-Gm-Message-State: AOAM531427xzNEfILrdrIm5PrIgdbCPzAWdrYhg4yAM7S/xa9NWGO1Ba
        jFZBatb8WGoipCQKIIqLJ8yW5G/9IpCvgOkHlRL7O0YUo+w=
X-Google-Smtp-Source: ABdhPJy+ZBCvqCuJX8LKz4Lwt6kopiehkPl3QSDLZ4BUaYiokRbBroTAQ915BNPcHvuo3SWnYE/I+I+gooIRJoDL9Lw=
X-Received: by 2002:a17:906:4786:: with SMTP id cw6mr19976791ejc.189.1635585775412;
 Sat, 30 Oct 2021 02:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211024060058.6719-1-rdunlap@infradead.org>
In-Reply-To: <20211024060058.6719-1-rdunlap@infradead.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 30 Oct 2021 11:22:44 +0200
Message-ID: <CAMRc=MeWBFM5pUesAimFcbwhA_Wzms5yJ5S4N4a7GTkC2ZJc7g@mail.gmail.com>
Subject: Re: [PATCH] gpio: clean up Kconfig file
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sean Young <sean@mess.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 24, 2021 at 8:01 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix multiple problems in punctuation, capitalization, grammar,
> wording, and typos in the GPIO Kconfig file.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: linux-gpio@vger.kernel.org
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Sean Young <sean@mess.org>
> Cc: Bamvor Jian Zhang <bamv2005@gmail.com>
> Cc: Michael Walle <michael@walle.cc>
> ---

Applied for next, thanks.

Bart
