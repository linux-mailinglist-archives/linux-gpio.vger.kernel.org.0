Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530A47B02AE
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Sep 2023 13:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbjI0LWu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Sep 2023 07:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjI0LWt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Sep 2023 07:22:49 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C07192
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 04:22:47 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-4527d7f7305so4602613137.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 04:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1695813767; x=1696418567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9W5Ngnr14nBoSC3H+GsUsSguJamNvyP0jPE38TzV6Q=;
        b=dpFKMwO2uHfiNz9y2gx0Nnmmy5ODNomLeaiTrhwCZYmUFpdRnyO1BLzHYplu5oyFnR
         HRrVQvhd9QE63j59Kr7yo+xZwqTsLyZFMYsTI7yHzaOlimyDKiuHdRJck96Wv6DelP68
         ci1gmyg4D6OUdADmjrYrVdvCtDR7wYvOo6hYZfR4KXnVQif6IlwCvLdfzBQqH9YaS/ZX
         wKlNkdVFwnejAQ4zIJWp9NwAzbW5zxHvkQCTNaXDlXpanBScvc8kNME3vJ9cZpwiNvH4
         DVZZlsz4oMxTPazgDGKG/y2qeR85RtEUCiqTA73DPE2y8EOAGMYmsdwpFh32s0Gfa3XK
         6jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813767; x=1696418567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9W5Ngnr14nBoSC3H+GsUsSguJamNvyP0jPE38TzV6Q=;
        b=gJrduygXo9Cnoz/Zh+SpLran/4i4KclD3bsu0eov0anor43DbEilUXCa9zzq7Mbhby
         wEDi2XCqDUsdCXVmKZ0+AD/0iVZXzybC7aE9ddPdxsMlpN2bQZbFEe1hn2hNqLrHN9mf
         yYg3pFksC7cLuxT/HgFiqRG+1+7TVU/HY/s6QDODu0gMOVOwQqbX0zxAw63mBdXLZcGA
         ufoRyQzijN5wVt2z1LmAFkSXUGrDEV4yEcM23FZX7yIItOjYPbkI9qvCchglAiNJ3aTI
         v9xqZiJHK1t94/Wa/RnoZnddowFCpiJfIsyE1MRFXpGA7XjuZVDA+Ncn96e+3ncHZeL+
         5Tow==
X-Gm-Message-State: AOJu0YzhRIoOAdrUde6TdwQ/CI5zZhb9QLZB6eh98BD+L9LTFdoeafKK
        CeeDDH0ambj7qBcC5YrE2lxTz79Ycv/KJvxFFS/7bA==
X-Google-Smtp-Source: AGHT+IGr1xBVjlwUfBbRaYOQjuqK8MH9oxjPnhUw6XCTjJAgAJXthvL/V4CfCz4xo2U7wFPkIciv9LoUnl3NtvK5zJg=
X-Received: by 2002:a67:ec59:0:b0:452:8e0e:9aff with SMTP id
 z25-20020a67ec59000000b004528e0e9affmr1694068vso.2.1695813766870; Wed, 27 Sep
 2023 04:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230915150327.81918-1-brgl@bgdev.pl> <20230915150327.81918-5-brgl@bgdev.pl>
 <ZQf6E+itll3dmCnU@smile.fi.intel.com>
In-Reply-To: <ZQf6E+itll3dmCnU@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 27 Sep 2023 13:22:36 +0200
Message-ID: <CAMRc=Mcq-0yWcYp6ksDF5RP-B+7b+r2KYh5onEMKx1tpS9O4hQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] gpiolib: provide gpio_device_find_by_label()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 18, 2023 at 9:19=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 15, 2023 at 05:03:19PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > By far the most common way of looking up GPIO devices is using their
> > label. Provide a helpers for that to avoid every user implementing thei=
r
> > own matching function.
>
> ...
>
> > +static int gpio_chip_match_by_label(struct gpio_chip *gc, void *label)
> > +{
> > +     return gc->label && !strcmp(gc->label, label);
> > +}
>
> I am still wondering if we can oblige providers to have label to be non-e=
mpty.
>

Of course we can. Just bail out of gpiochip_add_data_with_key() if it
is. But that's material for a different patch.

Bart
