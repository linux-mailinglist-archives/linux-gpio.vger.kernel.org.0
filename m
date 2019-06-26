Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DA0056808
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2019 13:54:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfFZLyc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 07:54:32 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46991 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbfFZLyc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Jun 2019 07:54:32 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so1852535ljg.13
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2019 04:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O68+gWYy+AAHpHVbze86ikYo+1+/Ck9AaofTpRQedkU=;
        b=auXDGfbyfXKdkslrXQ3vyDA6Do1xehiwmgcsq+apkyS6KFRp4gvGgxSNpUggbe7lGP
         +OjWq/S6lK4gUEcRir7c1ieo9YSoSK6X7kqb7A+Rsvk7DtVq7d+M9a0OfLgequxAuw0R
         J18f9O34hClg3SQNfGBUPiAN4Q4RkNTEPeU0nTBRQo3rRtoy9n9NrWsaXXaveSl784KT
         rf0/2ZrmA5rLeUMoUrHQhfKp1AA7z7TrR34tU9B+8WpY3QE9afY8/NybnGsIghwZuUad
         jcIFnEjyahkVTsKkjYtGI5/YO9bNH+/yR5F71SY2fQzAJt1IMwSejwdjs3lJ3IlAhOTY
         zeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O68+gWYy+AAHpHVbze86ikYo+1+/Ck9AaofTpRQedkU=;
        b=OK7Z86bJKLav89dlZXaxZvgQCbstlTR9ZithySMjsDTyurZlyceOep0BgXg5GZVNsP
         dWIfjPBUUA9U5e5isrmhDshDuCAcUgeIb6rkc0soVTVosX4QzEgvxFhtxstmuhabTPNF
         s3ZZwDBNQ6t0B2veFcZu8+JJg+kiWNi1xXeIhrBl0GHWIU+lEU3UWP50/y6V7cdShSjU
         w6FAYREdNY+cvme7TJYAg1pJQhEFtQi+I83qF4liiZ6lEbqdJnptDEAOzcuvg/xmq/WE
         vIVTcbvJ/Lyt29yeGnOFEFRzLY8qV8DRWc/g4htFTnJF6YEZJuOqvj/EVMFoQt5HvgHf
         A7dg==
X-Gm-Message-State: APjAAAXVrf7MuqKePfSL/LAwVyW4fcXNJUag27fRaa9PlMWWY9tXpkfQ
        oQQHVqWGnXKffPgCZ+FEiVCjx5/Gv3Gp6g9iNUh+eQ==
X-Google-Smtp-Source: APXvYqyUysv3OBilFHl0NElzx3G/IF+JCRwcIQ/ctFIklfhsx8tecZrt6RY8uuYINYKFtanN3OMzdtNH5QKw7QHsogU=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr2665141ljs.54.1561550070403;
 Wed, 26 Jun 2019 04:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190626084557.11847-1-brgl@bgdev.pl>
In-Reply-To: <20190626084557.11847-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 26 Jun 2019 13:54:19 +0200
Message-ID: <CACRpkdZXtFUimMATgKA6Qdo4-mTLW5xV3XvdcBShpO9c32_gbQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mockup: no need to check return value of
 debugfs_create functions
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bamvor Jian Zhang <bamv2005@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 26, 2019 at 10:46 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.
>
> Cc: Bamvor Jian Zhang <bamv2005@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> [Bartosz: removed one more check for debugfs return value]
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - fix build warning found by kbuild
> - fix build error found by kbuild
>
> v2 -> v3:
> - remove one more unnecessary ifdef

Looks good
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Will you send me this in a pull request with the rest of
the stuff you have queued?

Yours,
Linus Walleij
