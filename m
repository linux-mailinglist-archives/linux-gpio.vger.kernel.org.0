Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 395C111E16B
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 11:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfLMKD3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 05:03:29 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36855 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfLMKD3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 05:03:29 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so1528042lfe.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 02:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SAZ5xBpf8lTm4/lCVHyL2DSEjJ9egOgnXbp9LvN0I1I=;
        b=RoYojENeAFVDnkTy2nj3LqjJzgXTShwwTFVMNm4M0Wgx/g8eFTYnv97yc0JCbFRuUO
         NGWwPBO7QmxaoecBOUIJTcX8QxFioQMTgSXxkR7ePpCoiBKsbxL0ZRYE8DuMov/aeWn2
         uCVJS7a6LsoyrOtrzu2LawLmibRkBCa6jTirmXhYHrDzX7pl2/KiDaw35DEsKU5YZHM3
         zAMJa5gVv7dX3fSIryn4Qtk0VmIFd/KfcJzhs1dFBhK+RRrx56pG/TB+HadYVKCYhv/B
         W/S/sMtxJVp9i2JU81BZ51hYPaDGW9iC8hkvE7Hu1aSBxEB55ecYA3ZliaSTv0JKxIVn
         iwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SAZ5xBpf8lTm4/lCVHyL2DSEjJ9egOgnXbp9LvN0I1I=;
        b=FFheqEEOUVOtlOKAzTYC7Ih7+Do9k802TSZdfwQLa9dPoLiqGaHE5K/4OfC8uajcJe
         YeNPhlFSYreH0swf4JPCVUl3WiSWr/dDuUl9DsIJdBxL0usxE2KZ9CtFw/2V4PoprRza
         Uk2rTVXqK8g8Q1J0LIsmvyW8roxc9ajCRj5rLlk7HLLSdeS9O7e+H7fk8FtjPil1xtmC
         3zcZtMyVZqCPNaLglZVU32AQZSznJI/rxTfVgoU2R81J0WkA6+AIWGiGh2/eKWCW7ixq
         meC9P0teMuV1Ypjh62ZBnEgcQkwrFRuuUOJEXDM53oBnwKP3a7jx8H3gsYJ/gy3STLB1
         5Ouw==
X-Gm-Message-State: APjAAAXVjakz3I5EiMUBwgHMGMiBJvqaOLeOelf4dxNLW0PBmto5FebK
        x+5J2mhFKkzMBSJJ5d/5jT+DibUmXxclr5Idb+HagrbM5rs=
X-Google-Smtp-Source: APXvYqzuIimldJW/MfYDObPZvi21/Kvmy8Ti/E5XfrVHfOvBzg2nuEMY1p4ZzJvh5A12zfwPs/XGSku5KuLP/zJx/V4=
X-Received: by 2002:a19:2389:: with SMTP id j131mr8094295lfj.86.1576231407058;
 Fri, 13 Dec 2019 02:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20191204194229.64251-1-andriy.shevchenko@linux.intel.com> <20191204194229.64251-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20191204194229.64251-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 11:03:15 +0100
Message-ID: <CACRpkdZOF020Ph_wpBSjvMU9T2735TS1iG7XsCziACVfXOV5qw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Make use of assign_bit() API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 4, 2019 at 8:42 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We have for some time the assign_bit() API to replace open coded
>
>         if (foo)
>                 set_bit(n, bar);
>         else
>                 clear_bit(n, bar);
>
> Use this API in GPIO library code.
>
> No functional change intended.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied to the GPIO tree!

Thanks,
Linus Walleij
