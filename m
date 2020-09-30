Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BBEE27E342
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 10:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgI3IFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 04:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728177AbgI3IFX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 04:05:23 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B3EC061755
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:05:22 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id z5so732365ilq.5
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pKGcxP9oDE/Scs40mmFV3vtZyRz7YJAiQHhXReHdUHg=;
        b=elI45khHftDyZJGrZINOJjv8vC4PvcXsRkTbuJQ80zUZqpW9FDSlh2a5WwALyJtwxV
         k6PeGuIs+lN6IFi25iNzcEmVneBDvSCj63nkftpARbIF9XFgbfn+5HAXBfjo0TZvbKRt
         YmrsanSewXhaWmu3gfQre7ioS7uQre8n4RmJ/8azB60QGrISpAn8F/AxqWa9vXLYBV0P
         7mVuJncouenSVLeHbY0swJEBmWew2c+nYKZhXDjmf+ANcTrSMO113kbV8TbqaZpCb2Qj
         XCydaivL8QGeRvkGJdgUXNnNj7x3PJWV0EILFYAoDAxEs/6s3WbG4kai5HXG9+iplvaw
         Za+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pKGcxP9oDE/Scs40mmFV3vtZyRz7YJAiQHhXReHdUHg=;
        b=CbMdMRkVDXFXgRuP3AJxmg27v3bjmvfRCKcarnTYF3OTLUCaT8NZPu0A2RWbAUwRj5
         pE9UEdzTrntwu4Rl3RPv0Y4TDjnYIxjIgDjEI0YotNmkdGdXRSB6fsD6gpMVxCVb3VCe
         ywneYMys+iP6adI3kARTf6+AxRXm2LfHRqC+Vc80Je3U+PgFqP1Lwc1njUEa7EEa3lyt
         HjX0Y1WKWfqbekHTTKOXAhAx0HvjaKQ2qwgLh9H3wS2oe8d2IUqhkCtI2T9TSudQqYJX
         1xiRlZTs5Sf/0uxdyRpaNK81QaqhykxSN7YYIKHlNlEPqhnPGo+bNkp4jwEOA9ORiX7K
         +Wyg==
X-Gm-Message-State: AOAM533os7YlYNqKelVOr50/GT2+qlThviWILRUR/OI2p6fKWRghaeUs
        l/s7ki2GUwXy3IZqPu/7HIWWCi6RjO89K+HvAhozBg==
X-Google-Smtp-Source: ABdhPJw8sBg7rxDdwXEr7u+Gvud+qzGZmvxlsxJ1JqPSzaw7uvPqJFBpCbkdnEP2+rrm7oJxJ9372EZRAwG+Wa2Ut00=
X-Received: by 2002:a92:d8c5:: with SMTP id l5mr1009401ilo.287.1601453121514;
 Wed, 30 Sep 2020 01:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200929101004.20288-1-brgl@bgdev.pl> <20200929101004.20288-8-brgl@bgdev.pl>
 <20200929105320.GF3956970@smile.fi.intel.com>
In-Reply-To: <20200929105320.GF3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 30 Sep 2020 10:05:10 +0200
Message-ID: <CAMRc=MdfH7Nsq7L7sP0zPdfqcUxFfjn7FEb1_FNLRmng-qVjPA@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] gpio: mockup: increase the number of supported
 device properties
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 29, 2020 at 12:53 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 29, 2020 at 12:10:01PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > The driver actually supports 4 properties but we only ever set up up to
> > three. This will change however in upcoming patches so increase the
> > number of really (as in: the number the property array can hold)
> > supported properties to 4.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Reported-by ? (it does not imply the necessity of Fixes tag)

I'll add it when applying.

Bartosz
