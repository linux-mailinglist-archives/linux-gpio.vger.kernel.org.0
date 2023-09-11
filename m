Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDC779B063
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 01:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238883AbjIKUy2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Sep 2023 16:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237551AbjIKM6B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Sep 2023 08:58:01 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37812CF0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 05:57:57 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-48d0edd8a81so1631202e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 Sep 2023 05:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694437076; x=1695041876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq9dNzonQexMD+yn7Vskd2yTLNtgiIlfzqxh9CCDUGw=;
        b=aL57E0SnUWkVDL7Bt9U+7Y1EGFvdSU/WRlJy1/k1FKKBr+cOZObHpR6qoq/jHezlMh
         AQnBXON+H3vOAz46a9gcrPKyWDlBgMMppyWVvqBNNih09rlH1NeA0fiSuKe1vEfR1EGz
         xrmL/FVVVgMSR6CwHkBWob95LipH7AMNo4yHcMq90HLUnvpnsFGNmSK0P8da7u/5Fjgf
         75zIA1/HtRVu7AJRrYJOkoeHWmQ0zkfuzcp58iK5b/iCffOGM9vrwmuLDSUgh51OnvYW
         sVVFHAzAlcmEr+w0uRCFYxYHs5Sw4+yBTnHf7bTJ7BI6a6HQ28lhctWQk/EjVg5IbSa/
         +tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694437076; x=1695041876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nq9dNzonQexMD+yn7Vskd2yTLNtgiIlfzqxh9CCDUGw=;
        b=fZH+h5Vqxf/TJTzxhKcinSEIXiElu4hqyg2aJt174oL58wPCU/lCHgU/YmEVRRfzEI
         DjX19b2/abPiyZLuZqbwhvYCUOMLo9LY5+YHnJmWNnsbHZhuq5f/TmfcqJ9UqSGJ9668
         YMFv/gAVvIvAnWYudIVJHQrx36T2pJ5KSaoUtU0WvGCOWLyheBdLzXMlWILwneezf0u2
         bR+NtcSo9OlHzfBwhoze9wJUOFp8zSnUtGdqHDtLOA3rQ4EMDbjO9zjaEAmE7P4P+fr5
         K6O8a+9fZDjrXHYrl1gzuK+zyE49zRdcW3YyCo4uBJmd63mRFSafBWcaPzp0jFKJlrEa
         AZCA==
X-Gm-Message-State: AOJu0YwmUBvBe1AGZCAx72Jw0ik8AYdsChZXU3ABETI7iJ6BoHb4D6vu
        I6U92zU0EL3nxdRIzFhzxg2ynA1sPyrzoVno29mbJg==
X-Google-Smtp-Source: AGHT+IGWgZr0hmnQ+lqns9cOMLK/t4LepUDDeinpP84jhoMV1MO4JspKksqmLZv2c8U0A63jcNgZJszsa0rXZlnwn2o=
X-Received: by 2002:a1f:fc4c:0:b0:48c:fc50:4292 with SMTP id
 a73-20020a1ffc4c000000b0048cfc504292mr7139587vki.15.1694437076283; Mon, 11
 Sep 2023 05:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230911110740.16284-1-brgl@bgdev.pl> <ZP8N4M6cqyP9rS3W@smile.fi.intel.com>
 <CAMRc=Mf8zhmMaMSoO_cceG9meCHr1AbZMMRJE7Qms8qEt047Cg@mail.gmail.com>
In-Reply-To: <CAMRc=Mf8zhmMaMSoO_cceG9meCHr1AbZMMRJE7Qms8qEt047Cg@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 11 Sep 2023 14:57:45 +0200
Message-ID: <CAMRc=Md++13y-h1xUADUkqshWFau0vqSvZoL2w27Rw1CM1MNUw@mail.gmail.com>
Subject: Re: [PATCH v5] gpio: sim: don't fiddle with GPIOLIB private members
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 11, 2023 at 2:56=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Sep 11, 2023 at 2:54=E2=80=AFPM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Sep 11, 2023 at 01:07:40PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > We access internals of struct gpio_device and struct gpio_desc becaus=
e
> > > it's easier but it can actually be avoided and we're working towards =
a
> > > better encapsulation of GPIO data structures across the kernel so let=
's
> > > start at home.
> > >
> > > Instead of checking gpio_desc flags, let's just track the requests of
> > > GPIOs in the driver. We also already store the information about
> > > direction of simulated lines.
> > >
> > > For kobjects needed by sysfs callbacks: we can iterate over the child=
ren
> > > devices of the top-level platform device and compare their fwnodes
> > > against the one passed to the init function from probe.
> > >
> > > While at it: fix one line break and remove the untrue part about
> > > configfs callbacks using dev_get_drvdata() from a comment.
> >
> > (Just wondering if you used --patience)
> >
>
> I may have forgotten this one time. I need to add an alias.
>

Ah, I can do "git config --global diff.algorithm patience". Will use
it from now.

Bart

> Bart
>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
