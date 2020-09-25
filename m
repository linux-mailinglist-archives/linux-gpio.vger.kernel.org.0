Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D396278619
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Sep 2020 13:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgIYLkW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 25 Sep 2020 07:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgIYLkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Sep 2020 07:40:22 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13097C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2020 04:40:22 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id i26so3140472ejb.12
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2020 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bibwz6xtXc59LlPlbNqZb06QG0WOc82EPNG/m8AOWgM=;
        b=dSc/KCtznv2Nneu9E0L4E6GZC4phzWtLtucZD26WfnjbrQqAVDDyDuLH3ReTVHBRrb
         j9UOuSPctci4XvnfIEs3V4w0RfmwW+h9FfXeORqfzJEEPLqMSC9/BQXVOvrl2SmZknhE
         yrvruWYm18xxeI13FqyzFRWrPmHrWCDerMMLvrehr3rBZgtnhtPEmuc1iwvnUHpXMwK1
         7zbGq7zUD7+0aMDo1TJVn1OsQf7wOz2xb1ftrwHos58uzo6ZMvFZiTYVaB9BXnP355FS
         ySdfqnrSSQXsBoSUnyr1hKbRqD9HG805rkMwEVMcPRiU33N7c2sD+9pphRyaHk/wxClx
         JAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bibwz6xtXc59LlPlbNqZb06QG0WOc82EPNG/m8AOWgM=;
        b=mKqoppdghXv4M8eCpnSMrlRqEUJannlmP2MXV90GKt42Q2/JrJcD0eo6CCtS6/Wnas
         8Y9ar1N08QsqzRVR51KAmKg/0GzsGaYEafp9tKBw9jgTqqv7CKl73jSqMxjzMFfWa6XV
         jFZy5kMV1qmmnKpXOMUo5PV+z26J0hBF/uemWp3hp6iuR0Mrult5421kHLYcNEUMMk59
         K7RQ2z93x8rZwq4awWNELCKbUx6BtCE3UOwiGJPtpPWYMp2lwMdLjJvA9wJdkmyfZgrI
         emijh/KgrZKo5BgzALjWfv+Bbxjy2+h4mS8HqTz3ktyCFaddXn36ytlB2trZF67siY5/
         XH5g==
X-Gm-Message-State: AOAM531Iyfp08gczJQu0WhPcwLQLg5+xWG60ktBEBGUAaNCtcymnmGx8
        V0QvzALRfa2IU8hC1y+IIGZuRs1S2nG7n99JqF9fEOYX6DZ/aA==
X-Google-Smtp-Source: ABdhPJwn2e7xjK7G36KT8ZSmKFE3rfPC7d3IYHiCVDf7fxLGWKu8DM1qXuYm/+oEWtbYS/rR/2Q+AfvcPV71RZviaPM=
X-Received: by 2002:a17:906:49c6:: with SMTP id w6mr2170357ejv.445.1601034020713;
 Fri, 25 Sep 2020 04:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200924113842.11670-1-brgl@bgdev.pl> <20200924113842.11670-9-brgl@bgdev.pl>
 <20200925090329.GZ3956970@smile.fi.intel.com>
In-Reply-To: <20200925090329.GZ3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 25 Sep 2020 13:40:10 +0200
Message-ID: <CAMpxmJWBSwofFy94mHZWB2mdvHGStYp5oLDZp2M+wO57t40HSQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] gpio: mockup: use the generic 'gpio-line-names' property
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 11:03 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Sep 24, 2020 at 01:38:41PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > GPIO line names are currently created by the driver from the chip label.
> > We'll want to support custom formats for line names (for instance: to
> > name all lines the same) for user-space tests so create them in the
> > module init function and pass them to the driver using the standard
> > 'gpio-line-names' property.
>
> ...
>
> > +             if (gpio_mockup_named_lines) {
> > +                     line_names = gpio_mockup_make_line_names(chip_label,
> > +                                                              ngpio);
> > +                     if (!line_names) {
> > +                             platform_driver_unregister(&gpio_mockup_driver);
> > +                             gpio_mockup_unregister_pdevs();
> > +                             return -ENOMEM;
> > +                     }
>
> > +                     properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
> > +                                             "gpio-line-names",
> > +                                             line_names, ngpio);
>
> Forgot to update GPIO_MOCKUP_MAX_PROP?
>

No, there are still three properties: chip-label, nr-gpios and
gpio-line-names. Same answer to patch 8/9.

> > +             }
>
> ...
>
> > +             kfree_strarray(line_names, line_names ? ngpio : 0);
>
> Perhaps you may check for NULL pointer in the kfree_strarray() and drop ternary
> here?
>

I did in the previous series and you told me to not to. :)

Bartosz
