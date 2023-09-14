Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733587A0E96
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Sep 2023 21:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbjINTzv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Sep 2023 15:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjINTzu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Sep 2023 15:55:50 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860D726BB
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 12:55:46 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-44e8984b724so884053137.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694721345; x=1695326145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXvsIkg5W5kZfs+DNvZ5qg+c180aqSMtxSvU7mWnFz8=;
        b=m0SzqUnpdyod+sf04xpoZmKPjblkBJNmfbZffWBAhwWDoaMxQyRBPOTbwhmc6Sizn5
         q5foeEbnok18pO/XJ5BWQSdoK3/ompkIwYqdgggsJYFzGlHZaBK2RuNZfZQH1fMN/Xtr
         9BV5oodBNClFpphEOFN4fqHBA2L/JV2YpckBhBHrKk7dKaFUzZrSHfvg6eXDybHzYpGp
         wI9RHSd5TwiPyRoSqtLMeDT6nbN34N1yW7U2IQV4LRwaTDrbnHS9MMuwYvnJP1LSfucb
         MbWrTa1axX/PVo3rgnuN94YUhZkJkhdtqF3tkaBxd9XJbjzZ+YfI4p56AnxIGVEKhW5f
         UVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694721345; x=1695326145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXvsIkg5W5kZfs+DNvZ5qg+c180aqSMtxSvU7mWnFz8=;
        b=CxBSeCJKu1IcXpdt9N2dcyWOosD/n4QPbAfrOMD8mUjpMXpd6C1gdeW3w+JiTEcohx
         WSSXPV9v25MKgRSy409z/4ZUKjDWlS6VGELX0mvnkvSyKaNHEgTqeuEdgTvpFytBSf3t
         WVaSJ5iTiw1Yzii3K6rFu9By3DhKCHImlgWbH9y1XZCEzg7FYAp1htcUfvnVkGZsD3WN
         BE4ilrACul3lS7ge0Qn3OPqpz+EYNMMs13RYmHfg0nkMIBnpWeDh1uDGUb57nW3ChE8n
         KhyYShrGzK12fmXjb1yoYa6pjdTO92YMdONQ+vqQ3EsE7iybysgPJ+pA5mM+UFqzNZMI
         3iQw==
X-Gm-Message-State: AOJu0YxVwr20iNQ9vUVGd8/xa/ej01sdD2DJgehg0jDdAFCnbTZ+IV+V
        ws8CkoMR31a9XN4H6jnAplgeR+p6ebbvrt0LYaA8WQ==
X-Google-Smtp-Source: AGHT+IEuwtjTxVRxEt//vIYG+8ayKmKrSHrk0njIa/gvUrYHhYrp9V/i5/Oo/3a5v5Ofqyy21JQg692vj2EjgHwZY6w=
X-Received: by 2002:a67:e94c:0:b0:44d:453c:a837 with SMTP id
 p12-20020a67e94c000000b0044d453ca837mr1673697vso.11.1694721345618; Thu, 14
 Sep 2023 12:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230912100727.23197-1-brgl@bgdev.pl> <20230912100727.23197-5-brgl@bgdev.pl>
 <ZQBECsLHhuNRYr20@smile.fi.intel.com>
In-Reply-To: <ZQBECsLHhuNRYr20@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 14 Sep 2023 21:55:34 +0200
Message-ID: <CAMRc=Me0vzHjwVPMk99Orx2EZfM-OKiEZKC2Nzk6HQFz5P867A@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] gpiolib: provide gpio_device_find_by_label()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 12:57=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 12, 2023 at 12:07:20PM +0200, Bartosz Golaszewski wrote:
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
>
> When gc->label can be NULL?
>

Whenever the driver doesn't assign it. The copy in gpio_device is set
to "unknown" for display in logs/user-space but not the one in
gpio_chip.

Bart

> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
