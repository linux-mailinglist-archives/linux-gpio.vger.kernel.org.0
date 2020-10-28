Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1B2029D432
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 22:50:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbgJ1VuU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 17:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbgJ1VuS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 17:50:18 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29CF1C0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:50:18 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id k6so1127410ior.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 14:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cOlVocq4IAMVemOE9OTUsRfXHyVhhbPmqVMPreN3EDA=;
        b=VLKLDhH5+ey26PhxB02kMOKqY1O7uJisIhFfY6sICgo06ZQU9ZyN0GHNUP+hjbnJZi
         Qkm0zxnFlwKDU63MgJo0DEI23ObE1wyJPaf4zVVukJCDWtB3tMujBt+zKAX5Ds/JIzwv
         YhKZCKsecvEm4MjQcksuDs+HKp/aif0UIGdXkkAshi7SFsc/euSq4gdZ3aP1VsF8TRX9
         +W86rpTBdADlx3bka8rOvUKPFUyzm2ekZTjAhL3+MvniBO8LDOXyRgQVjHTLK7Fpanbt
         kJf9nrWtBzx7dBwqhNrbVJVZPxY/L8WEvgtWEn16/bK4wLryeFqiXH7EZryoRaI/M7z8
         G2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cOlVocq4IAMVemOE9OTUsRfXHyVhhbPmqVMPreN3EDA=;
        b=qcQHQ/ywfyNfBP1V+jOAYlGS0cT7uTpItk0JcSPuqXCDQsWfpfaQo8TKQhZ9Tf21Av
         iQE3QJMnnKTzLON/lXq4lKnXvFDQHMoBRhOBThK2yHV+DZrwaO54TKdAZ9wgEQLP1xg9
         gnKSvgLBs8ZpUOFyeWBnAbPfQMAPY58nrsxkudgYIDPdEblPm/CuSk1h6Z3iy0Izc/RJ
         lWeocUiPq4VjYMGAl6kbHgktXd0vdxYx6gYc9+iBAJR7AhjkROhBlg3D8OCIf90N8Ze1
         xxlsZrZ7FbVe2/Ho1fCNMxVZjN1kqNMBnpVnqirFCqI5AiQuXobjaOs8MrIFuvKw2zc2
         Q3mw==
X-Gm-Message-State: AOAM5334zngDUAUpIYVCKndihacK1w3QzJWPbkX1gzWed3qZq5D7mdI4
        F9zfal30g32DFx+03xOgvhN4AYpD5nAmK0ZYms6tch5FSg8=
X-Google-Smtp-Source: ABdhPJycUHW9N4gSdb2+ekP7lI8+Knw9K4/zGN4RgsSq9aTfkdPb0cfF+t3wJgXPrUauiFppD7uAn0Q0Pag4L/43Zw8=
X-Received: by 2002:a6b:b883:: with SMTP id i125mr5889964iof.131.1603891156306;
 Wed, 28 Oct 2020 06:19:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201027091715.8958-1-brgl@bgdev.pl> <20201028093928.GA152368@sol>
In-Reply-To: <20201028093928.GA152368@sol>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Oct 2020 14:19:05 +0100
Message-ID: <CAMRc=MeyFR450u7=LUhGNqs7jKv0PAduUAHvM-um2SjfEMRQOw@mail.gmail.com>
Subject: Re: [PATCH v2] treewide: rework struct gpiod_line_bulk
To:     Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
>
> On Tue, Oct 27, 2020 at 10:17:15AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
>
> Subject should be prefixed with [libgpiod] according to the README ;).
>

Oh come on! :)

[snip]

>
> If you replace the gpiod_line_bulk_iter_foreach_line() here with
> manually looping over the bulk lines then everything from A to B above
> can be dropped.
>

Something is telling me that dedicated iterators are more elegant. But
I guess we can do everything manually for now and see about that
later. Fair enough, I'll drop it.

Bartosz

[snip]
