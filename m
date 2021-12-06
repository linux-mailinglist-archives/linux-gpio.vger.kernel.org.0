Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1158E4697B2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Dec 2021 15:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244801AbhLFOHN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Dec 2021 09:07:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbhLFOHM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Dec 2021 09:07:12 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1C7C061746
        for <linux-gpio@vger.kernel.org>; Mon,  6 Dec 2021 06:03:43 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g14so42857428edb.8
        for <linux-gpio@vger.kernel.org>; Mon, 06 Dec 2021 06:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TSuvRVLogrBTe7kkjtZaaRoBFVBTLM1V9jTfiZQ7qsA=;
        b=bnmJrbENlFkg97MPUUdUrqzz5nCyjBxNN6sohNARe2kXU1eeZAAe743j4DUVm/t0pF
         u+IE/9SfSiIeUqmXLD5FuOFQPtc4h9fmSQXjB3dZ5QhFK1gXLzXne1T9elUuMUEhIDcz
         T0KZR2ZvNzSr8fz0gH362G+1W3eUolXwpzOVUDVMQ/7Uq4NHi1eRvOtPCT9zsvw3SJbn
         nAHvpBoWZQQ/sgR/kxSZnKW7Ydqis9HChBbBSk5mfZQlLx5oshiERyHNH9c7lGbfZ0QP
         9fhQNlil6B/k+L9afnqTuZiu6CY3lg/b6gLrI2wn7koxn4Nd0V2FK61sB2abuRW59I5s
         CwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TSuvRVLogrBTe7kkjtZaaRoBFVBTLM1V9jTfiZQ7qsA=;
        b=XYf91wQxdS4mn9qliumThSARFheZ3kucrF3Uw4k+FWOxkPT+tIPu/cMrgR1O9mM8kl
         WEz2QMOZ0ew6yy+TDma0SHrK254YZLlMdUw4wfoSFtPlbsYFzOxuokUcmSAWcfAzuvZJ
         tJ03zrUt6WrkvF8KsXghNtalHtJeZs89rZsuKFLBh8nH+gHlnOCrOJFE7xLxKKgKyqjt
         2PTjP6CMcRqlTpyzsje6TaxZdlmWQ4k3IvOQwnO1ADF7dPjBn8T18QAbplRWzCvtfbJI
         AMrLgUFNNJfHPx/V6b/QChcEkfjvAdUxkqsrO2VN8IxbnEA2KP01zLfb4npzg2hxVdZT
         tVPg==
X-Gm-Message-State: AOAM533VqKDHBSqTUsXvwXhCOZvwFfoheWeEIhux2RDnLa3LMGRf115u
        7SdLNFMIQI3ZUEpboCy14NiLwF1lveNnKmR6cdAcdg==
X-Google-Smtp-Source: ABdhPJymN6t7ERCfnYBwAjGcTnW+awEbTsAbeKhy63aSaMdDBakd2YK4ssUz5EO26SwOQrnY+oSvHnnU5aXX5ZI1bu0=
X-Received: by 2002:aa7:cb45:: with SMTP id w5mr55456086edt.405.1638799422190;
 Mon, 06 Dec 2021 06:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20211203133003.31786-1-brgl@bgdev.pl> <20211203133003.31786-4-brgl@bgdev.pl>
 <Ya4WASlzYGOFWORk@smile.fi.intel.com>
In-Reply-To: <Ya4WASlzYGOFWORk@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Dec 2021 15:03:31 +0100
Message-ID: <CAMRc=MeLVsy3hfVdQdofk+m7VcTYYKLKGyeoyK7T4r87qn6sbA@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] gpiolib: of: make fwnode take precedence in
 struct gpio_chip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 6, 2021 at 2:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Dec 03, 2021 at 02:29:59PM +0100, Bartosz Golaszewski wrote:
> > If the driver sets the fwnode in struct gpio_chip, let it take
> > precedence over the of_node.
>
> By the way, have you tried this on pure DT-less/ACPI-less platform
> (CONFIG_OF=n, CONFIG_ACPI=n)? I believe gpio-sim in that case won't work,
> because this doesn't affect swnode case, right?
>

Works just fine on a BeagleBone Black - both the regular GPIO
controllers as well as DT-instantiated gpio-sim.

Bart
