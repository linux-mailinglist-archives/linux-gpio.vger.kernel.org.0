Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEF7B782A9A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Aug 2023 15:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235429AbjHUNei (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Aug 2023 09:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbjHUNei (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2023 09:34:38 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D79F8B4
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 06:34:36 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-44d4d997dcfso380288137.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Aug 2023 06:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1692624876; x=1693229676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yll92B/PAYlyoza4UB0EV1Mtne7mI3UI9dNYvsAMgXo=;
        b=fqE1oXc2tokPYR6p00XvlFV9tSlXbU2bXqlh8cosNkRqCnhFW53Ky5NIFsEVR5fB6d
         mxZ1WmMF+nJMEraBjn8S4iV701LbMEkrMVtEPBllyIppwwbHc89hpx4FS4xZrZIPyDbT
         ARBjKeWLZZCiZOB+J4M+3QEPkM3zLu32WivRutKJBlXNnlLXlFdNyWjzWR2kJoBwwVO3
         6sPbI3np8oF+f4o/0BoUTRwMbd6vz8pE65TuVGObQKoDms0J1XuZMdw6RXihW2XkGzcd
         OVkoyS4CfAEtCnhIwW0CX/0miug3uGcAtM10ALazu6+Kzw1HU0YBkSqjtDztuYVL5Uvv
         da3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692624876; x=1693229676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yll92B/PAYlyoza4UB0EV1Mtne7mI3UI9dNYvsAMgXo=;
        b=ZSb1HejFqaVMWaFBPKcqHguOvnJFltuUYr/jlrGhYGbPgg75pbs86afMN88n7DOoJd
         uACO0LPcRGOHlXNI0KRb5+OSAXT0gWNM2KUyGjWMOCK2bWmE02HNS61lK/KdoYBrV2xg
         KEaIsIkzCM4fhQcuv9s3aJxyWd4RmJJi0nNjGiwp5kz3KqUb/a6owETNnrI3Ph98gOxj
         Bi57o3EdDpfGCrUuabb4M9OODW0snmslzLJXnaZ3LGak+b55XamirCej1JRTasIYjdte
         vXAvZDkuYmcFrWOMixbRlZE10uibCBDmAOV+BYmXoMnHLhWFlxT7cSzToAYL99qag3SD
         YD6A==
X-Gm-Message-State: AOJu0Yzi3lXDnfXcZB2NXQ/3jLyuKY6Cst2GGJTW2JE16bdCYFJZRyyP
        POryBZykvjW3uHJip8v54K/Dy3PDujohnilDCL0nhw==
X-Google-Smtp-Source: AGHT+IGwLeL8AjLk0tHOuG124+jxLTDDgZM0CE7ukF8CF1AGmLexcebYDHKKMwJ+TNJVxtyv3jzF4/JA0eifyO5Xn+s=
X-Received: by 2002:a67:de12:0:b0:44d:55a4:2279 with SMTP id
 q18-20020a67de12000000b0044d55a42279mr968534vsk.6.1692624876003; Mon, 21 Aug
 2023 06:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230817184958.25349-1-brgl@bgdev.pl> <20230817184958.25349-5-brgl@bgdev.pl>
 <ZN9IYYgD6q/H3EuG@smile.fi.intel.com>
In-Reply-To: <ZN9IYYgD6q/H3EuG@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 21 Aug 2023 15:34:25 +0200
Message-ID: <CAMRc=Md+F=S1ipwNPjZQ+Kp=t7Py_Y=-SmFtbpOQa-xGYWsBPw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] gpio: cdev: wake up chardev poll() on device unbind
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2023 at 12:31=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Aug 17, 2023 at 08:49:56PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a notifier block to the gpio_chardev_data structure and register it
> > with the gpio_device's device notifier. Upon reception of an event, wak=
e
> > up the wait queue so that the user-space be forced out of poll() and ne=
ed
> > to go into a new system call which will then fail due to the chip being
> > gone.
>
> ...
>
> > +     struct gpio_chardev_data *cdev =3D container_of(nb,
> > +                                                   struct gpio_chardev=
_data,
> > +                                                   device_unregistered=
_nb);
>
>         struct gpio_chardev_data *cdev =3D
>                 container_of(nb, struct gpio_chardev_data, device_unregis=
tered_nb);
>

Ah, this goes over 80 chars. I will leave it as it is, I will fix the
other one when applying.

Bart

> ?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
