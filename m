Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 384D27B5F5
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 00:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbfG3W6C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jul 2019 18:58:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37245 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726516AbfG3W6C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jul 2019 18:58:02 -0400
Received: by mail-lf1-f66.google.com with SMTP id c9so45893378lfh.4
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jul 2019 15:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yOa/eOdf8nGVianCf7QdDXN00Pv7cigGpgKKYde9+74=;
        b=azFlaHoj2pnGJQTSpeaxBoinHQBeFIZ2FvXvaION9nXWkwMXA2oNzk+eyR97IT18yk
         nyap42nFYXbUMLK20A8LXm+bGk4DZkFd8U5LN1CkSiJxKxvnW9O4Fvw10fA1Y4MG+3tU
         tWC/MstUroCJ83KKchgf1ll4xxr1qF9OOWHfTsSmQPgl9rFm4UsETKzl5bu0hF8zw1OH
         uaS+ryPlQLmL3uq7AQtcDXexLvcehy5XYmOj2xXsX8lk5LgKcF2HO9feIfJbU9dX0hWp
         ksfAGA8DaJI4EbmXtT1ZkUiHkxjQq2iLk1gw/x8SBjb4ObsJEXteWXH9BaDRgCqezihQ
         bc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yOa/eOdf8nGVianCf7QdDXN00Pv7cigGpgKKYde9+74=;
        b=rOHDDR3vQ6k1TYQiOQ5vyE1zZjac0yuYtTe250DZGNLhiUVT+cPZyeXrQGZaADr+03
         T4113JXg8VDHcAUYsPYpYzXu9LZzXW1qijDXGY3AQHScXsauldvcn3bho5Yhd9fNNrtf
         qhpHTSEVSwnLYIHtdXC7jG2nOFdr2XDOxHGgXeqiPDR+Pb9qjkAF6H1D2dnL1Q8avr+e
         1clUr8A0g3PWvKr/+FKEfe1Ki7IRWyo+jehatBtXyJ90QIxx2HhYp5jX2n1b21rPZ65u
         vk6wrp9+XIo1ZvKVk7fmdx9FrmktNyq8rOsKFnJ8u0WEAJ0bhgxjLDMB508lwBb9VSIo
         Tjiw==
X-Gm-Message-State: APjAAAWQpY6uXqohHGwi6dIRsl8ENmQtQIWatzmKATLNzDZ/d/IWJnui
        1IzIvqiDvIUPA/JgXWnFp+lsu1H5muHUm6Y2lcMu+Q==
X-Google-Smtp-Source: APXvYqyyaioH5ibhGa0A9YuOGsu2iiA9QyUZjoRMMmH+vmXo09C9Rg+meEIGopvuvfiXrdyRL2XRdreSHa+rhC6OW4A=
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr45567407lfp.61.1564527480182;
 Tue, 30 Jul 2019 15:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190730104337.21235-1-andriy.shevchenko@linux.intel.com> <20190730104337.21235-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20190730104337.21235-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 31 Jul 2019 00:57:48 +0200
Message-ID: <CACRpkdbbxiP_Me8S_9ajEvRQ4OL8vGuT8n2H-Fv=BrEcAV=GGQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpiolib: acpi: Split ACPI stuff to gpiolib-acpi.h
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 12:43 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is a follow up to the commit
>
>   f626d6dfb709 ("gpio: of: Break out OF-only code")
>
> which broke down OF parts of GPIO library. Here we do the similar to ACPI.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: Cc to ACPI people

Patch applied.

Yours,
Linus Walleij
