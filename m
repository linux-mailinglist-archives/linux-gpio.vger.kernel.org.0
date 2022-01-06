Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDBA848618A
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jan 2022 09:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236837AbiAFImb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Jan 2022 03:42:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236793AbiAFIm2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Jan 2022 03:42:28 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D02C061245
        for <linux-gpio@vger.kernel.org>; Thu,  6 Jan 2022 00:42:28 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id w16so6650454edc.11
        for <linux-gpio@vger.kernel.org>; Thu, 06 Jan 2022 00:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/au2t0n9VIeyTxqbpNihOs1HXF/Qnzq9Nav0Zut7TVY=;
        b=K7UYXAi1Eop0upWJUh77qE3m1OyyQmIkT3i1vRFge93o4wGmoBn8rPz9PJgS3CRTR0
         N7etZasKwFKeCiWLvwPbB63BrexoooWHypXU/f1Vi6Pd8XJn3laf+XVYNtuvukQ5ZUlI
         QsiDydKY4/XUsbAiyRHWf0DyXZh2aad0q+LtpjMnro0khMITM10XSin4EgjSIxzTSSOT
         tN6HnWiCUUe1mQvhKg9iH93MIqAfzlaRZe7PEv06HVIsyJW2HTFIP5NVGL2UdJ4OUfTs
         Bq6DaFYHiZ9+N+rvE6TAtzFQs0F+ha1ErZ5BxGR4va0pZOAt3G99Z/5oaMuHNJMlR0u8
         +1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/au2t0n9VIeyTxqbpNihOs1HXF/Qnzq9Nav0Zut7TVY=;
        b=irpZxWpo/Wwh030xfQ3NAn5a6KY2R1SGpoKGYBPHIXuTsVUbClJL9eHToKXF/jJ98n
         y60zdHuX5GKqeT9XoDiwMrM8lfCc+kw1Gq2VJNrUVRdCnSOwJcWwdVRndFa1wWV549Rg
         U7Ub8QQESCyU7vrrg0z42R8Qf1zs5L0/OQUtGj5XUra2xqGRt1ucY2H8j9hhw1lHTlhI
         quaeUzPsJMQqOHWFvzhBvF/7DfJd8/bT6SPu8/x8Ae/Clw3H1CE+g3Ms2L+HijnZm3bS
         Lm1ilgv3ro5lioEN1PVbxzzRXLv1SnCQfyZeWxy+M5RuTdOc/R2gZCFl1LLuHtWOX6bm
         FQQw==
X-Gm-Message-State: AOAM530V8x3KpkGxUMPrG6nTDZS/PvE/fuSQQgHBhZZkEZ9eVPGTIPll
        Ukw6VDXrkpZtliAHSe+nZ+0OBg839aITZgsjho5bxg==
X-Google-Smtp-Source: ABdhPJwz3SBdeElQDXb8HB+0rOFnGBs2qr+FlINLy3eYTny8r4pAogIXFdY34hulIQntnBIwJ5temFHTmYc9MMHQ8us=
X-Received: by 2002:a17:907:7208:: with SMTP id dr8mr47093600ejc.697.1641458546603;
 Thu, 06 Jan 2022 00:42:26 -0800 (PST)
MIME-Version: 1.0
References: <20211223122639.86923-1-andriy.shevchenko@linux.intel.com> <YdWp09bj4SP5oNvc@smile.fi.intel.com>
In-Reply-To: <YdWp09bj4SP5oNvc@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 6 Jan 2022 09:42:15 +0100
Message-ID: <CAMRc=McdH7EebcM5AJb1jT2T_cP_yXyS7t+TP675f6kw92wbRA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: tegra: Get rid of duplicate of_node assignment
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 5, 2022 at 3:33 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Dec 23, 2021 at 02:26:39PM +0200, Andy Shevchenko wrote:
> > GPIO library does copy the of_node from the parent device of
> > the GPIO chip, there is no need to repeat this in the individual
> > drivers. Remove these assignment all at once.
> >
> > For the details one may look into the of_gpio_dev_init() implementation.
>
> Any comments on this one?
>

It looks good to me but I wanted to wait for Thierry's ack.

Bart
