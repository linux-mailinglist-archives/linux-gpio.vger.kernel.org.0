Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D943527B1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 11:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728823AbfFYJNA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 05:13:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34699 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729925AbfFYJM5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 05:12:57 -0400
Received: by mail-lj1-f196.google.com with SMTP id p17so15508956ljg.1
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 02:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wwnVDgu7cxDgh+7o1y+6rFPyKnwN8aXJSKEBzNlYRcQ=;
        b=ZpWrOyNQCqP49tiHyPuuCPEgUimdp9Xdbj6ODVd6x+t8ZnEYlMSuoMtV4DL3glA8k0
         WEAJKctXijVfP69IryTxkOrjVhvTkEm5X1a8bYWgqM7EyR6a/VkHWe0DV4Eb++DYf3Jl
         5L4oujBhgcCnN2X1PGv7+IWpgsXlDiazxZ++BXX4b8zyut6KsyEGkkEiIEyyhZwtZ87D
         SZ2ZvpxUjvH5GnKN56+m2zq4Fj4UlFZtJ+oMfI0brEIvScS53jBeShOCNOIeps2wIMuf
         RJrWv0R0+H1ZCrNREZQ7ZTANHp/q+mbld98tmDQUyVTfFiWOlUOBy/Bhs/t0wfo6e9LF
         4mBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wwnVDgu7cxDgh+7o1y+6rFPyKnwN8aXJSKEBzNlYRcQ=;
        b=StioLMZC08BRejWQqvfPzk9ezlzc3vLfm3ico0JceExiMZlM0D7CMU/rbVDWIe1RNK
         +x6KQyzoIb1PJpjsBqIvXUgZe5Eqn0CMCufw3CdxiUQE6v7hbfpVdKgHuP2jez44rfDr
         p1ljb0vKJ1d8Lviv1SpPkh9hKR99h9y/P0+yAy+41aujt18OoHhpBUsSpApCdAV5DY3G
         bi5F6kbrV3mfZmePAJksR+KQvRGTYMJN3XaXNsKZ2XjGms+vCxv4vOl93vkttp0yDuaD
         SKeh6n+RgALuAJqsKjFu5X4TzY4nKb9htGec0vnzdPwjcrcfcXJRwvd8LLj3DTJ2MCO4
         JjZg==
X-Gm-Message-State: APjAAAWtQ5YK2yDmYHjKEGtXuiOmrNzAAfP5e1/6IUPWNlbPb+GDlkyz
        tEliLqn3Y1RpLNKeYh0wyCaw4D3LhJWjVQOuHdtwz0wt
X-Google-Smtp-Source: APXvYqxbOkGclXqNTDfoJhNi3bCl/YUQljV/FA4qbEQSOtH0TEx8A89uKABkZtrdtTW9HQvDgYnj5AHhdffx8NZz/fA=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr15201086ljs.54.1561453975476;
 Tue, 25 Jun 2019 02:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <1560790160-3372-1-git-send-email-info@metux.net> <1560790160-3372-3-git-send-email-info@metux.net>
In-Reply-To: <1560790160-3372-3-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 11:12:43 +0200
Message-ID: <CACRpkdZ1KRd2XkDSjc4h-55MN1q9fvk6KPCfxE2dT3vjZaX_3w@mail.gmail.com>
Subject: Re: [PATCH 3/7] drivers: gpio: eic-sprd: use devm_platform_ioremap_resource()
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 17, 2019 at 6:49 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Patch applied with Baolin's review tag.

Yours,
Linus Walleij
