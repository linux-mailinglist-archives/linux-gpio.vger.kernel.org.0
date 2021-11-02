Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC715442EDA
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 14:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhKBNMX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 09:12:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBNMV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 09:12:21 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A9EC061714
        for <linux-gpio@vger.kernel.org>; Tue,  2 Nov 2021 06:09:43 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id o8so3959443edc.3
        for <linux-gpio@vger.kernel.org>; Tue, 02 Nov 2021 06:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=He2tBJp/S/OPYLV3aHwW42PAWKVcsbBLGdk7/PgoNcQ=;
        b=4stlSRIDqMnB6tPK2cFBmcxXAZ/B5/YnG/le4pPigzXsUrQ401ndrR+GM1U3anNLRr
         kEtyvW9BLVW3Qb9u51J1SmrBZtWgeUPlUzI/F78MY2IMAu28KpwxNP+U8SMQpv4Qs3BI
         C1nvw1NOEfIo0i40Q9Mos1/CdZ0a3snYktY7oVc3EUMIsJ46IhlqDaR69zeHHp+1NJui
         kbYo1Y9zVgJwA3wfz3otDZWM1uLfCzj5zA+u2Jxo3gwSwKjI7WlWq6POyMSQ9cGglAWb
         W9zZhRQ0Z/H6fZpgGr9MjWjxNjggMA86nhnDLEJpwrnaBzZWICXVsw7AB5F/Slb8bMJz
         KnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=He2tBJp/S/OPYLV3aHwW42PAWKVcsbBLGdk7/PgoNcQ=;
        b=tn7jCRzvT0R2jQl5M86ljUgs7RMWxKibvsWDGPGV3DXOUv0LI6SSUUz25i+dc4rEue
         yDecAWInMng8/g/HeyXb6Jsx9e1mMhEB/y5DxS0m1vaW201vP2VRwK4jOh0yZAxPt4l+
         fqzF5ac/DRb0GHtBEUb2coxL4V33Cyoy6VwciRIsXbYBGqFO4ckdpW6UdR1Ty2GfUiMz
         WSpJ3PUKvxoOjwJP43RxVoyouJvp5YKBXcuwXyGLlHFV8Zx/QbSJsJU9+Ri/m3K9Mnxi
         nli0vTEgjytHikUik91qYUV+Wt9I6HkWeX7ch1+k2w0oiAt2IR/ls4JTlfeg7K3g7xQK
         2U8Q==
X-Gm-Message-State: AOAM532QuDhUX4bZfk+JVQXFgxnJWf8CbTo1AoiQ2Dq1f+svg4au9d8z
        h2ymbppKldl0DZSnn+Ms19AylDKHuG1yCnxM9ZdkCg==
X-Google-Smtp-Source: ABdhPJzP2VnIeh6T+qBxTL6TdELotexnuE37aWAecnlHeaFmuZO9zFl159Ffgx8OtQDWgPY40Jpho3MnSSpGFWTRIoY=
X-Received: by 2002:a17:906:5343:: with SMTP id j3mr44565720ejo.538.1635858581686;
 Tue, 02 Nov 2021 06:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211014123342.174711-1-jonas.gorski@gmail.com> <CAHp75VeTU-+rLnuVoKqh2yc8t3Wt0MsePs0yASjRKx50E0MfLA@mail.gmail.com>
In-Reply-To: <CAHp75VeTU-+rLnuVoKqh2yc8t3Wt0MsePs0yASjRKx50E0MfLA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 2 Nov 2021 14:09:31 +0100
Message-ID: <CAMRc=MfGZHn8W=iFrjQPk1WF4ZMRUDwPOXMaB5ZfcwZNrJtNVg@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: fix parsing of ngpios property
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Oct 31, 2021 at 2:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Oct 14, 2021 at 3:48 PM Jonas Gorski <jonas.gorski@gmail.com> wrote:
> >
> > of_property_read_u32 returns 0 on success, not true, so we need to
> > invert the check to actually take over the provided ngpio value.
>
> > -       if (of_property_read_u32(dn, "ngpios", &num_gpios))
> > +       if (!of_property_read_u32(dn, "ngpios", &num_gpios))
> >                 chip->gc.ngpio = num_gpios;
>
> Just a side note: I'm wondering how many of such we have in the
> drivers and why we can't simply do it under the OF GPIO library's hood
> for everybody.
>
> --
> With Best Regards,
> Andy Shevchenko

Looks like we have 17, so yes, definitely a candidate for pulling into
the GPIO core.

Bart
