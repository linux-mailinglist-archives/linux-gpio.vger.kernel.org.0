Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AA9D394435
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 16:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234845AbhE1Od0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 10:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhE1OdZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 10:33:25 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9AAAC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 07:31:50 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id y2so5732583ybq.13
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qjefxB6K3pXyZRFBVuZ/s9GA0VXxwXxIMVMfs8uEQuE=;
        b=E5Itrw7sUfstT4XabpvlXTK+918yIoWEcnA/kt4W/xq+8610J7DjzDBEBKjYtuKR5g
         AFfqcXHRP9rI2sX4vVLkfftkFmncszZkr9cmDxLCJ/wFmtQYKv9Y5+yUXzjxHmerxN7a
         q0Tqc3e5BdCxyMNMJJlLM8ojX8Z6PBLtnFkEBOrGjRgvpJS2OJJ/qSSgFpWasyJXLAYp
         wGLTs5n6kVxLYSh6VjQjhfUFU1rT5ke9WCcvekweL0ZGfUKVcYmLDg8xafg07l6/LVXy
         blXJRsPXTNTYl9dSZjkpN1y8LyD6ziep6ePI/4Pu55EqU8zvCt7fc4LQazz7tkrmg5n7
         FhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qjefxB6K3pXyZRFBVuZ/s9GA0VXxwXxIMVMfs8uEQuE=;
        b=RhL7ONZTCpP80gPOaWiK0ZQgRUC/s+eReWWj8W1dYKA5lAQUIX/mZQAP/BbKJQAAlP
         Fb9zmNCJu8H+OCy3IT5AZ3BSFgG+egoeZjb/4xrSg4RKkkPa2S67ha9EqW070N0V4sSq
         bptmIgmsQSKUeQ53LU6BaXmoIPC2i9cFwmWdKFReOf+EiOvqQYZ1rnbjIYhgezdX4zEf
         wu5Au2pzIl8+O+1SPygqZsa2qPX/8phCB1D5oD2DidrpNxp0K0u7C+K4hRf1gNSOWs+l
         YMAt65YlNf+OxmpOm+SPvtrm3iquOfLS9YX7jVHtETUboX4aWpilI5iJLbiTlCjEgP6c
         w74Q==
X-Gm-Message-State: AOAM532WblGiY5g+uIPukE3vrGpnzOE9xDOzvtFPsogf9OH6R7QDmCeq
        GHwLGTVoJaf/rioMG9DeqRwX8lrKbVwyIEUutI2TqA==
X-Google-Smtp-Source: ABdhPJz4Xl6mqInmSc9JBcDMcCFvEvkpEskAwSgLA6HaE1rL/9lfRZ3yHG8pE1VEX4fLSM0b1Tvt+4nXV05OC7afXsI=
X-Received: by 2002:a25:287:: with SMTP id 129mr12603370ybc.312.1622212310080;
 Fri, 28 May 2021 07:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622008846.git.matti.vaittinen@fi.rohmeurope.com>
 <CACRpkdaSr_CV1pKS44Ru15AEJ0-1429+6E7Lei2sPHdaijr9iw@mail.gmail.com>
 <0c2a8ffab666ef31f5cee50b8b47767285dfe829.camel@fi.rohmeurope.com>
 <CACRpkdZ2GdrGr8-XnVvf59O4AVBueBjX0PHYGtOeOdGXi=iE4A@mail.gmail.com> <15d9e565021c115eec268c7fca810799eb503a90.camel@fi.rohmeurope.com>
In-Reply-To: <15d9e565021c115eec268c7fca810799eb503a90.camel@fi.rohmeurope.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 28 May 2021 16:31:39 +0200
Message-ID: <CAMpxmJVJAX8jPrYg3=jkG4JqEEnUfpexfn+cFKWJQYpdRJaRUA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] gpio: gpio-regmap: Support few custom operations
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "michael@walle.cc" <michael@walle.cc>,
        "noltari@gmail.com" <noltari@gmail.com>,
        "jonas.gorski@gmail.com" <jonas.gorski@gmail.com>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 28, 2021 at 8:33 AM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
>

[snip]

> >
> > What makes things easy for me to maintain is active and happy
> > driver maintainers, so it is paramount that the file looks to Michael
> > like something he wants to keep maintaining. This removes work
> > from me and Bartosz.
>
> I agree. When someone takes care of a driver, he should be happy with
> it. Period. And thanks to Michael for writing this driver and reviewing
> the patches. Reviewing is hard work.
>
> On the other hand, I don't enjoy writing code I am unhappy with either.
> And as this particular piece of code is not a paid task for me, I do
> this for fun. gpio-regmap is not mandatory for my drivers now. So, I'll
> just opt-out from this change. I'll happily use the gpio-regmap where
> it fits, when it fits.
>

I take it that path 2/3 is still good to go?

Bart

[snip]
