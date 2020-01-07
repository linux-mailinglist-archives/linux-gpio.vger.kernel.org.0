Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A55D5132320
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 11:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgAGKCm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 05:02:42 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45937 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgAGKCm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:02:42 -0500
Received: by mail-lj1-f195.google.com with SMTP id j26so54034577ljc.12
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k1lyd87NrA9wszev9LfhXNOVXGOHKaNTISJStitwmE0=;
        b=RcsLpyzf4vpkgl1YtDBbxw7DrhqxljVZKHJNIgnY8WFsI2xhW5/VFY0y8i5JxrIFrm
         3dU+a+DRhxfuWJ1ObJ0YpoCu9EBMTH1+IKm/cguRoFxw9mYmPu4n2w0F79QtpSVE7Amk
         PP8fkpLmQ0QzYVgVbSuL14THdjjfsiP3LGB6PfJxROcaGxyt5zst8dFMS9hCj//ef0D/
         os4TMr+b1aTgvV5YmNOsZuip+7FgeyjxkLVXFT2xSj8QnjA8nu+sC8J8hwtKSyv796/j
         2MTvm27KcqviD+LI28aFCQvIESoYTzBCgKEOPBMPhoghKuuL6J/BPq7lwaq5QIs6y3hK
         GFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k1lyd87NrA9wszev9LfhXNOVXGOHKaNTISJStitwmE0=;
        b=hAlWpKuZ2nxU4126Ft3tUsQse8LCKseBZjR30rc3hbuSHfZPWBsAwG/cqmsh1kWK6Z
         dZSW5TH6iLj/LU/LV55JNudTTf0x1fAmHGDN4tW1niwMdS0+6Msp9E+LTfxhtKsZNPEm
         3EvO1ybrDWXs9jP1xUNdxiCDBuNAYFTX1+hJOJm9ZtISul8yh8ovP7mGG9uSMusjqY22
         bK/hx4t0Ito09k7vFfdRr4/hlxTEG6lwNMPLDmy1+s0aihoFVwgUk/tcy2scl0mzzdbL
         hU1VihDzam7+WIS7G1vi5KnrGBID/CmvJOauU5jlGTo0tBcOqzVZbAw8S8wvtp33D0Y2
         xikQ==
X-Gm-Message-State: APjAAAV+BApaBvNwcF3yKJBNCkKlwCLYzZb1lox40LaJzyYvNNat1Xue
        W/bcwtBLdJyMytnVeE9VChe5y3SdOVldEiL5O67NkA==
X-Google-Smtp-Source: APXvYqxkz1mhDzGYtgHjh5ZxouFmO30ufEvf3Z8mCja4QVI64JVX3+/i+d51yrkb+Nl35bdRTF5XQbnV9kiF4kzwGDs=
X-Received: by 2002:a2e:86d6:: with SMTP id n22mr51896201ljj.77.1578391360561;
 Tue, 07 Jan 2020 02:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20191224120709.18247-1-brgl@bgdev.pl> <20191224120709.18247-2-brgl@bgdev.pl>
In-Reply-To: <20191224120709.18247-2-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:02:29 +0100
Message-ID: <CACRpkdb96Atm7=N-Ku3Xvuz0ZC-KYKJ5p9sn4L31fE_a6tkPwA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] gpiolib: use 'unsigned int' instead of
 'unsigned' in gpio_set_config()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 24, 2019 at 1:07 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Checkpatch complains about using 'unsigned' instead of 'unsigned int'.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
