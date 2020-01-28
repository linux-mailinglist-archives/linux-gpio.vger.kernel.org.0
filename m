Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA6B14BE9B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2020 18:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgA1Rb6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jan 2020 12:31:58 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44670 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbgA1Rb6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jan 2020 12:31:58 -0500
Received: by mail-oi1-f194.google.com with SMTP id d62so11058466oia.11
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jan 2020 09:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VSfDTSEm+H+4Pg0k7vb8ON7kDpWb9AFq3yti6hpGphw=;
        b=nCLusG01fDnEN+0DQqipdtIzTFqGHOYP7NHeNPGIbUAv1DpCkamTzi6NVTQZMHN7Me
         iiyGEiCRdKtxYj6p/XV0v3LrJyq3haEwwOb2BDjWqM1DKhcUErEla1v/yh4EBhSxRFP8
         pArEzkdzekORs1meHMO+n7TLxxsBiRgEUc36UvNxDp9y2BbRjBczEHUc319ElQ1qauld
         7NK2Um1WzPxBF9p6M3LeUk/OShyhU+JWHBaXw93QjOT0sdItTdM9sjwAhoVGt9aSueAb
         K4icnZlRIevKB+CJhkx3wwovSumLCWexrUxeMQ3lTZu7nLu4QjPHUACtmlhS3tzigdbo
         z9RA==
X-Gm-Message-State: APjAAAUtB9JioYMsL2h11Sph7IwDYBmU3V6oynVJqPxAvM/5dTFkI8f3
        ZYT/PH4pAIr/KzWC9HyKDQIN0uquiOuF5EE9pdU=
X-Google-Smtp-Source: APXvYqzBjYff7ahmr5iot6x5tsg16r4dSKEj7LesuRNQIx9uWyORQ7Xc+YJzpgfbELxYZo9Kd0e5jud6spqWI2Neork=
X-Received: by 2002:aca:b4c3:: with SMTP id d186mr3446070oif.131.1580232717886;
 Tue, 28 Jan 2020 09:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20200128154949.66521-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200128154949.66521-1-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Jan 2020 18:31:46 +0100
Message-ID: <CAMuHMdXwJp+L22Eg6AG_v6++FWjNxW_EBUne3ZnQ6LynykNh6g@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: Sort entries in database for PIN CONTROLLER
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 28, 2020 at 4:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Run parse-maintainers.pl and choose PIN CONTROLLER records.
> Fix them accordingly.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For the Renesas entry:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
