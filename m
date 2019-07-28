Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D406B781EB
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 00:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfG1WE3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Jul 2019 18:04:29 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43886 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbfG1WE2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Jul 2019 18:04:28 -0400
Received: by mail-lj1-f196.google.com with SMTP id y17so32038382ljk.10
        for <linux-gpio@vger.kernel.org>; Sun, 28 Jul 2019 15:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kk27LH34PvQToQHwpyl6iPwl02xFmMQ5j5Bomd4bUHA=;
        b=BIE6GziPZgEJnAyvDHQ/i7eiVhYicQ+4TGYL3LIZ1FGo79J+EfngkwIAKGo7x7NlYx
         uLCC5+gAO6q9Uhtwb6RgprtR6y/kTocq0f84tH7frmUx3H0jcC2iC6oWlSoktycvoyaW
         eMGybC8RqnaYGn9Pqx68Hw5x+H4puqFM4DKTQQzAhiuLk4kz+cg0i0wqjvZ7SskX6IuN
         0IMoFuYnQyTMsQMR8cCLiWCZs7FvmyyO7tshL3za8/UCqyLiKuZHuq7WV5JLRC9FZCHK
         WwdduQZTZbvDiBPUwpWeXKqwkjLVNI5QaG2JROmFYSgod2FbizfdUHzT+jcPDK8k/f8A
         LcUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kk27LH34PvQToQHwpyl6iPwl02xFmMQ5j5Bomd4bUHA=;
        b=SMWjRiOBLeyzHIAZ5lG4wGcG8rzMqPwbIx9LEMQNKElwj6seFkJHOrLSX8eCl0VFG6
         +arElZu59DT+HaEgMvD3/d4JLc797ii0uNS5HtKoxOzJARTlosAG4LYI5zwBo1ZVZm0z
         irlx4bJ/nmHsRViRNAJ+pvkV/nPlkdpnWXMk9e7O+lCahjAjWEu/RKIgKGZIbPc+tA5B
         PM7VP2kXILDnucOsWxdtYq+yy1+W9z01y0cfTaLiLlxalBH2X23IkMBXL4Y61ZVUwUj/
         x+Aor8h5ikGKnPDNXVmcubfLAREWfg8yOeS4rOBMB8wnIHBP8or9mgNfzX1UXUQaHA/T
         jXZA==
X-Gm-Message-State: APjAAAXAbZ/rbjbZhow+X7xIgnJf5E3o+VEgT+04I3PJNpKB4mEwDxTZ
        5/9jVDuhoFI5rZRr+0H56jQrPev9Z8uOr12tFqVUGw==
X-Google-Smtp-Source: APXvYqzEhjR0PDkOZOsttahgmoIEM11iCTzzKxH0WYJApEBsjU9EY8w/dgGBwLo3VXwLXHoSfi94hrofG2r5gwj5+Ys=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr8034907ljs.54.1564351466852;
 Sun, 28 Jul 2019 15:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190703084601.9276-1-brgl@bgdev.pl>
In-Reply-To: <20190703084601.9276-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 00:04:15 +0200
Message-ID: <CACRpkdbcNAe1_cKgObDqODND6h87Jnz_jbGy-XAGDANf1D8Gvg@mail.gmail.com>
Subject: Re: [PATCH] gpio: max77650: add MODULE_ALIAS()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 10:46 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Define a MODULE_ALIAS() in the gpio sub-driver for max77650 so that
> the appropriate module gets loaded together with the core mfd driver.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Patch applied.

Yours,
Linus Walleij
