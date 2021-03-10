Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98095334C52
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 00:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbhCJXPx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 18:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbhCJXPn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 18:15:43 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6E8C061574
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:15:43 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k9so36454282lfo.12
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 15:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FvgqzQ3J8j30csPWmBVtuOz65ao5kSPhlDNVxVSpFEc=;
        b=I3yoB+2Jz9M77UGRHjOQ21FENV/4rcf8+OthqQA31JhtTKZUynjkLmtKEf0HMj+NLJ
         8jvPlfUVgF98rs95p39XYZc7yFb68WICkPO/kQvt6Q1c8J+jFT7QEG8y7D7kdoqxOKRJ
         DMvE5N7lFIevdpnTIj5+Slb00i7pEud0WDbJWaNU6iv3eZS9zVGUZtE2fpS3+EVmb/ec
         gxuW8mdqT5QZr8E/D68kK+oKbchcF9jIscvwr/plgHJf3SvvLbj/ikY77bD8rHw/9yWj
         yAbzJKsg98OHJB07f4Nlku0qvpt94YACmKgcRBfReIi1j5LWoP2M0muZ8nMy/pBj6pTI
         Bdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FvgqzQ3J8j30csPWmBVtuOz65ao5kSPhlDNVxVSpFEc=;
        b=ByjzCd1cipVAnzy9+jEA/ie56h5zHnxUWARq/9DEifRiAQrnip6mzCa/cBzD/Z4zcO
         9AFDMWYn8QrKqbCE+p13vxLUXQPuZCRgOJjVu3mwbDhyfauG4aY4PdG2kqG+v9WhvDQb
         v+tsUBcvpnhJpBt9zgU+j+UqVJwfBRvzBuFdI4KaE3q0+7i188MVjl9ftOWIrtiRfow3
         UFvXPuK/4f8si9k/3y8DshpJDtF31vOPRAO41QiWyhdLkSDRPo77MfKRku0M5XmxUgeU
         3nI0qwlyd23a3KxSovpGQXBta/42aqTMdfy4L6NN7pnHDF6KrpdtLsD++CWTg4+b7omm
         MiVw==
X-Gm-Message-State: AOAM5318VQ7Y+GMM5J68y856fGZIDqN/6FYz5WpjpDtLJDAAFrAWIjdQ
        pGQJdI6UKQ+Ep57oEvdaGEar2ZV6E9VhQDo2ZmEmQX9nmh7rU3Q+
X-Google-Smtp-Source: ABdhPJz6sqRctIaxVCY7bLqYO+NzPpIJ6vlSe8TnV452GfK18RjK/YOYwyudDIEPPPFgwGG+hoX2MGiC29xhnianDGc=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr508729lfe.29.1615418140326;
 Wed, 10 Mar 2021 15:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20210304201253.14652-1-andriy.shevchenko@linux.intel.com> <20210304201253.14652-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210304201253.14652-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 00:15:29 +0100
Message-ID: <CACRpkdbA+Q24JV3Uct2dHtGfBb1AaF4uHwCbzcrOFAxoGQ4wXQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] irqdomain: Introduce irq_domain_create_simple() API
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 4, 2021 at 9:13 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Linus Walleij pointed out that ird_domain_add_simple() gained
> additional functionality and can't be anymore replaced with
> a simple conditional. In preparation to upgrade GPIO library
> to use fwnode, introduce irq_domain_create_simple() API which is
> functional equivalent to the existing irq_domain_add_simple(),
> but takes a pointer to the struct fwnode_handle as a parameter.
>
> While at it, amend documentation to mention irq_domain_create_*()
> functions where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
