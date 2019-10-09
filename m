Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12AF5D0926
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2019 10:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729664AbfJIIHd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Oct 2019 04:07:33 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46926 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfJIIHd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Oct 2019 04:07:33 -0400
Received: by mail-lj1-f195.google.com with SMTP id d1so1459232ljl.13
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2019 01:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z0LNDSpFSctbTJTf0zAvXYKetHW153zqZU28HUuc6aw=;
        b=al6Ibeoh+WLVyhfBLsOSWTkDu5aVd8ZnfivuhHFSq+6OfHR5fCwI9BJRWh+2ywdwB2
         7RaFw6L3+jC4LIu0k784taSAmRoksY9qso+BLF3wsBDjqjeHutXwg+yonzAACVOBlxTa
         1fNvJCQtMiqEtPNT3EZM0P8KkEskNiBFXuJFwkx/ILoWNWs2Ba0ay4Aend4cvBbhRNu2
         cL4ZPccP2qxcFEQ28q97/D+wFYD5utOrvGIJyEBDEiAPnBVoodPnydqRBv8hxZ+R+KEx
         KBazv/AW6mcNv02KdyGRKqRnCw0wBmVQOr0XgE5VO5y6U82uY/UYmxLRHh4nSQybiiaF
         BEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z0LNDSpFSctbTJTf0zAvXYKetHW153zqZU28HUuc6aw=;
        b=IUNDRW/jHjHq0dnmtl4sDpgT0a4u0ZGUGDaQJtjtVi/FobbgNIx6MWmldUwkGdnGbj
         /XupN0qkCg+MlTsOH6T+2laicn0tzrsJdAK2JRqtrZlLIRuQDzs758WQX0yMumVex7kk
         zY0U4EWfr3QL3+3UU4J6RK757GInVKSbTAnZz6fYngwnFQwH2n6ByoVj0AUr8RufdLww
         PUlyNE2chzkQdNQEOFsrkuUFeq1j3IihAUfOI/SxAJSHHCRcC8ANpGHxojO4UhMB5lzn
         Ojbn/OswBX4KPAfx+vI+K/ok2k9/swiYx37d/iQIfIXMWzv1Um7xNkgvqWI4QZ1c02Ws
         Ct2A==
X-Gm-Message-State: APjAAAUBEZXNmscZTYgY1yMX74sF4kPjNlveci7vZ+0Cw6/0QbjMFtAp
        6dAUiwKdbdXc59yYKVwYjENTVj3Tdm3eDm2nSOrfNg==
X-Google-Smtp-Source: APXvYqw8WgwcmY17xXOAsdHSJSmkcYeQFlwgx89ruHbyb51KBUE6h+72k3lbA4aB1aUnh5XUgrNWfwyOfGRut6XOGxI=
X-Received: by 2002:a2e:9e0a:: with SMTP id e10mr1513190ljk.35.1570608451497;
 Wed, 09 Oct 2019 01:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <6c5d22c8-6e27-3314-9c46-701d932b11a6@infradead.org>
In-Reply-To: <6c5d22c8-6e27-3314-9c46-701d932b11a6@infradead.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Oct 2019 10:07:20 +0200
Message-ID: <CACRpkdbtRan_7nwPZNGLWE3xWiB54aF0fv6poFvbJpeGOz_TJg@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix kernel-doc for of_gpio_need_valid_mask()
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 8, 2019 at 10:40 PM Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix kernel-doc for of_gpio_need_valid_mask().
> Fixes this warning and uses correct Return: format.
>
> ../drivers/gpio/gpiolib-of.c:92: warning: Excess function parameter 'dev' description in 'of_gpio_need_valid_mask'
>
> Fixes: f626d6dfb709 ("gpio: of: Break out OF-only code")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org

Patch applied.

Yours,
Linus Walleij
