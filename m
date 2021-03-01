Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559B0328022
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Mar 2021 14:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236125AbhCAN6r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Mar 2021 08:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236121AbhCAN6q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Mar 2021 08:58:46 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7C7C061788
        for <linux-gpio@vger.kernel.org>; Mon,  1 Mar 2021 05:58:05 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id w21so20827725edc.7
        for <linux-gpio@vger.kernel.org>; Mon, 01 Mar 2021 05:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nKuWC3rVV9sra+4DDgdLnle85IT4vlB1n7DPoNwpayo=;
        b=STgKjcbbPqlcVj+Yg1do/AfuQIj/wmBwy56Kj0C4VQoXnZHFAiF79BD5kiIcPWzgDB
         /ZXT0GpsZgkfB8E5WMMZcT285MlbPXod+cZrK1EXjwzKrhy35bATHm0CPmObm0oq2iwE
         oEI+69fCBlum8d1WP/UXUJFU4vArguEIHlK4IC8nudxpjtvVAcAyL0j06R8Zfiu+2jag
         SuVppZD1+mT0+pC3MHTdWLPRlXomrKYGro0wq7F2vycFK/G5nxbDhmwfPKJpv0RT4Ihn
         5eUckBWRXm8wdtgsfsoDYYpwSvGKOLFIDSToQdvRq+F7T+vF6H2YKs+tBmUrTssHgTFq
         mByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nKuWC3rVV9sra+4DDgdLnle85IT4vlB1n7DPoNwpayo=;
        b=BESCtEMp0QOEBT8rOAQyDN/DbaBKFJTuQOshlB19qtBN+qJshh8dDNAW5OuV9K8bNz
         QpCufLJe3sVXCRn2NpcjpWv21pc/khaGX7ZXcGbR5x4+iUapLmMjHvWzXMti250FObMZ
         hsjayylaQSszVUCJFWWB5LWBgsJmeE3dtdWgZZURiqI/woxxeS3xumgK9OXOAnrtvlaU
         3gV2CfPT8vP5TvYX0A1yISfs1mF/45eqrhtxZreMzMZ7DcupBb94a9ZpsDaugCVuVjOg
         4DnRLLV9DsqyzgYSdAp8UKzQ19HUOsIocn8hwyZaRBylYEKhIS6AzdCDN7L8lOq9ZYxN
         VXfA==
X-Gm-Message-State: AOAM531iocMVL4zLXvizDJSS0tOQxFd7V7JW4ytEg6YkTi6hefWarSwc
        8k8qGV7lHHoOOo6XPmsW7yr5O4ix6p9kiqBKmdJN6w==
X-Google-Smtp-Source: ABdhPJwYJDxPiEv3ADUo2gt/NLH8qTuwvXhaLRKLrw+7IP/68NCdtzYiQfFshSLhg0rbOrVB84ornicr77iSkLSXmE0=
X-Received: by 2002:a05:6402:35c8:: with SMTP id z8mr3291764edc.341.1614607083797;
 Mon, 01 Mar 2021 05:58:03 -0800 (PST)
MIME-Version: 1.0
References: <1614069358-50943-1-git-send-email-yang.lee@linux.alibaba.com>
 <YDTsWR/kXhd96ICI@smile.fi.intel.com> <YDe8/2toCGEH2Mf1@smile.fi.intel.com>
In-Reply-To: <YDe8/2toCGEH2Mf1@smile.fi.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 1 Mar 2021 14:57:53 +0100
Message-ID: <CAMpxmJV5go-fHR2RWWdyi5a6ONeXrhC5c958oNZNzszt2aGN9A@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Add missing IRQF_ONESHOT
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Yang Li <yang.lee@linux.alibaba.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 25, 2021 at 4:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Feb 23, 2021 at 01:51:53PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 23, 2021 at 04:35:58PM +0800, Yang Li wrote:
> > > fixed the following coccicheck:
> > > ./drivers/gpio/gpiolib-acpi.c:176:7-27: ERROR: Threaded IRQ with no
> > > primary handler requested without IRQF_ONESHOT
> > >
> > > Make sure threaded IRQs without a primary handler are always request
> > > with IRQF_ONESHOT
> >
> > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Bart, I guess I will collect this in my branch and send you a PR.
> I have more fixes to that file anyway.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Fine with me!
