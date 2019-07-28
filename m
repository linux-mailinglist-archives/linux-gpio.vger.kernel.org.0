Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 898D9781F8
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfG1WLy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:11:54 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:32919 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbfG1WLy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:11:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id h10so56632724ljg.0
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/UUoIRi1saO6ICrZirvERC3tkUx/Rrg9Uu5W/WNhiI=;
        b=fYfSEu0NfzDyjpxjq/ysAcfDfZY2Yjdv2Ql2GucgXtjPYlngCS87l9KxOWAW9WqMsG
         7YQnuBTDQi5lzkUsX7ju8ANwHjvY9RUH9p8uqm7fuSwta6Dlt3zwJ2m7C99onbm2WOlO
         5kQIlhiEAqqZbf+UX43YuSJRk4k/V7goItgDwki5TllMdkb/aJYwH7SA5dBL/xuSuWDW
         Jq2AC0UUkcz96HnCyDSY+VjSrm3G0lf77JURZyw8jThfrM1MQ+H496xoacb3imKl/1Ie
         Nwjrrj+N5WFI4HRChmgn3C8YEOlQy+2sFGBTBwZ6HxhsL2++jWO2ibkrrJXXfDzkk+OZ
         grUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/UUoIRi1saO6ICrZirvERC3tkUx/Rrg9Uu5W/WNhiI=;
        b=r90LpvfTxtPjCQwNUqJLuHqLdBsuYHCPYzRKiMpdptt+/w41HXH6HP0E8y/JX5rGjM
         X1U4mSXZBubbUsfrTQNNfASERwzkJ/Y4gaW6SwIV71v3Y2XFNjYXc4ScbOirNaX9Tk8f
         1JdFSpy3TMYk/ZdzyDwXoo02N/ORBlvadqTW+u+C9uXxMG5Rl39TR4IAHtZT1i/uGjBb
         qgm4HdF2+Rcmfeb9VVv2IxCPMorNqe5sIy1qN7FWwCH6mPecWN9rPtecLGTvI65U7si6
         sOYqeacugXkfX/JbWMkGnXVqqK+Jhgpay7HgG4OHFhFKc29ykka66hFjqWCQTamCqNe+
         8/cg==
X-Gm-Message-State: APjAAAWm+tT8YOGgVhx94YXs5k+U8E6jlt9zqd950VN1zf3hpATUlmqd
        zMKy/0Mlqb1yN+zTPTD5Zr1YwXLyEB4QaSDXEMvMjw==
X-Google-Smtp-Source: APXvYqxyPrbflvR8n7bEZTuQzLrXMs+cK8AFTQaEbNF0iOHog8ehTxf2NGg3ABVcU7uIcSaEND69PlsoNKKHH90DCGU=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr34303871ljm.180.1564351912427;
 Sun, 28 Jul 2019 15:11:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190713075259.243565-1-dmitry.torokhov@gmail.com> <20190713075259.243565-2-dmitry.torokhov@gmail.com>
In-Reply-To: <20190713075259.243565-2-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:11:41 +0200
Message-ID: <CACRpkdZxJZyQD4WZ68hSNGXtGS23hHDv=rrnu9oFmMN0oRNb2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] drivers: base: swnode: link devices to software nodes
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Input <linux-input@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 13, 2019 at 9:53 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> It is helpful to know what device, if any, a software node is tied to, so
> let's store a pointer to the device in software node structure. Note that
> children software nodes will inherit their parent's device pointer, so we
> do not have to traverse hierarchy to see what device the [sub]tree belongs
> to.
>
> We will be using the device pointer to locate GPIO lookup tables for
> devices with static properties.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

If some device core person like Rafael and/or Greg can ACK it I can
apply this patch to the GPIO tree.

Yours,
Linus Walleij
