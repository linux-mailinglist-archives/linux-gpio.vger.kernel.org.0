Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2762D3F8A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 11:08:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727719AbgLIKIO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 05:08:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728613AbgLIKIO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 05:08:14 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF138C0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 02:07:33 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id m13so1555664ljo.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 02:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQw/E7SwLxGnKdveYQzaJAGWbUgeNhUngqh8BqbjHgo=;
        b=PxiTSi+VHS6HsquV4chyDTHa325yshyCidRqBh4Mg2S2G4FdtihU5ZjQTyG+CWLkrN
         bRY+0YLtzi5SqzDzAFSdW/6WFgJNVu48cwTjm+oN/HaQp43Cxf4YjzZKzNIQ09Xfmfv8
         m2iLc5tWmjtfmMO7dEH+M8AGaer7WyBvOPjFL5ixEyU1S25COE3ASTUBjb9D8j0kWkGC
         C/wwrt8hiUVoSmRDWIZUnyUjVTDlY41dfTJbe+5dwdin9eOkGWkNLoUYEFfv3zGFC+fO
         EjObTQh/dj5BJulEOzK2G4FgBJYMukDeAEXfuX9i5AsM2vFkFNxea8x0JvIOvoBfb5J9
         c8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQw/E7SwLxGnKdveYQzaJAGWbUgeNhUngqh8BqbjHgo=;
        b=EIFF0vZqGaXQmSYRQH744VEu/K6LiT+S6l0sobuHVbER5Eqn8N19Y4yC+WWEjecBcW
         KxbVlqqGFjzWDW17GDC78ItfLtorVgH0zGUOfRuEa+u4qqinlgQlsBafjf0+ex59hGg+
         tiNsShkqU/eg2tEMown3nS/MW/koY/0pmufEFblYqVRCI3Kfk1YLuej4ZtZgi7vYZxou
         0DNoF50tyCCtk6C9L7qFfUSnB2qyZVZj+mH1CjIMgRCQcJTfMpd69SC5Y2z0wwFk7S9a
         rkyChWESmDiprGNYV3K2odC6Yzkj73wgOvgEU5BnsNhAtjkzdb4tJUNeRP4+Ma/rDNwV
         FkfQ==
X-Gm-Message-State: AOAM531rm4N4mAsXKHGoohoPNmwgecoKsFhTMHFS7uKmdaoSayPSQwXP
        CiEB3XHo9keZgJh8tCkZLjCw71LCyGmCOiEaMEjm1h9TM/6hpyXt
X-Google-Smtp-Source: ABdhPJycK6YNWBpHh2Hxpyg+AwLAB/Rgt7dKHvFh9JnrpCqKQeDfRNAiU1ffe9fY/h1O10FkehROsO0gvqp6SnJjVQ0=
X-Received: by 2002:a2e:586:: with SMTP id 128mr779666ljf.273.1607508451957;
 Wed, 09 Dec 2020 02:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20201209095248.22408-1-brgl@bgdev.pl>
In-Reply-To: <20201209095248.22408-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Dec 2020 11:07:21 +0100
Message-ID: <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.11-rc1
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Bartosz,

On Wed, Dec 9, 2020 at 10:52 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> These are the patches I collected over this release cycle. Nothing all
> too exciting - mainly just updates to drivers and refactoring of the
> core code. Please pull.

Nice!

But I get a merge conflict in gpiolib-acpi.c! Since I said Andy should
be maintaining that file it makes me a bit nervous.

It looks like this:

index 6cc5f91bfe2e,23fa9df8241d..000000000000
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@@ -586,6 -526,40 +586,43 @@@ static bool acpi_get_driver_gpio_data(s
        return false;
  }

++<<<<<<< HEAD
++=======
+ static enum gpiod_flags
+ acpi_gpio_to_gpiod_flags(const struct acpi_resource_gpio *agpio)
+ {
+       switch (agpio->io_restriction) {
+       case ACPI_IO_RESTRICT_INPUT:
+               return GPIOD_IN;
+       case ACPI_IO_RESTRICT_OUTPUT:
+               /*
+                * ACPI GPIO resources don't contain an initial value for the
+                * GPIO. Therefore we deduce that value from the pull field
+                * instead. If the pin is pulled up we assume default to be
+                * high, if it is pulled down we assume default to be low,
+                * otherwise we leave pin untouched.
+                */
+               switch (agpio->pin_config) {
+               case ACPI_PIN_CONFIG_PULLUP:
+                       return GPIOD_OUT_HIGH;
+               case ACPI_PIN_CONFIG_PULLDOWN:
+                       return GPIOD_OUT_LOW;
+               default:
+                       break;
+               }
+               break;
+       default:
+               break;
+       }
+
+       /*
+        * Assume that the BIOS has configured the direction and pull
+        * accordingly.
+        */
+       return GPIOD_ASIS;
+ }
+
++>>>>>>> 1542ec5eaddb45b4fe625de3d95ee4e94226514d
  static int
  __acpi_gpio_update_gpiod_flags(enum gpiod_flags *flags, enum
gpiod_flags update)
  {

I don't exactly know what do do here ... any advice?

Yours,
Linus Walleij
