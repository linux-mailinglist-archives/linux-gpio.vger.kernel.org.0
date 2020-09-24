Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48427727E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 15:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727888AbgIXNgg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 09:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbgIXNgg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 09:36:36 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E58C0613CE
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:36:35 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id r7so4475876ejs.11
        for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2020 06:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ooaRReL2c6jKQ+vGGFRTPGKn0/Fj0W20wCnHuBSeuZo=;
        b=TaG2yVd4h5AqdMpjmVPoldgfNLdtU4GgM8Vyz8+aPaL7nTNdBAHR74lX98EucvUEh/
         fCL/N83YHlg5gLabqs8HOqhJFH3A4W2sw9273PqFeL05AwbEv/w4nGB6A+90BTn+CL+M
         +u/L9M1ZxJSvgM3zQPqtM3oMpW/xVmUkzouEv01+OyCP/cpaVGfXeCsEQSrR6/AobHiB
         vg1Gxmh2wbAFyfnn9LC/wS44NXXW4UfHNywywrb9OWtQZyJ7NPv5qE4d0CN6jlser+y/
         Dz86FEsUtmcsCv4/MJVA0GJnt1yn8RosKz7XPQq3N6apWq+5KECE+J+5MEBYHQn0Gh9p
         MkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ooaRReL2c6jKQ+vGGFRTPGKn0/Fj0W20wCnHuBSeuZo=;
        b=iuog34h0AdeUwa2MgekQa313E7/fgKpLG6bBLBrbNf35BHOGda/KXAVmtR0VuS1Zye
         xBfRI1nbr6PR+Q179QH2SPe/WtyEb8QIB1frhgWF8CAGtosBOpuS8urj3BOfgHeboe+M
         0uPXxDYa7l6bR6jJggaO9UOybPlc8jVxannYDS8SErHduZdffbmDib5c3vOveI53HGjP
         zG4qOMLdHfQYhB4lGK+vxa0INvEnu8TzHsVf0ymh+fdFfYYpmy/1/+AcF8zRRObmB/qb
         SPlJjJhm8pf1QDdCCvsPrYkdSil08aW4Ecc9tUmMVFF1NGNPN8SEskFZMKXbd+/OKzT8
         JYJA==
X-Gm-Message-State: AOAM5300PfDHLDuxT76W78ePoXUgEgkqXn7td4vgN954yAo/JwqzvafR
        8XCtlvTWE4oxNOg50BOJeyt2+9gNeHRoY/S51+1lHQ==
X-Google-Smtp-Source: ABdhPJx2Xg0bTE6pcTgSHF6cRwl2iJFV9udaOoibso/nwzLkWSGVsMqSvZmy1qnIna9CRrtx0DG73k6UxXjtvV4Ob6Y=
X-Received: by 2002:a17:906:f11:: with SMTP id z17mr1153495eji.88.1600954594733;
 Thu, 24 Sep 2020 06:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200905133549.24606-1-warthog618@gmail.com> <20200905133549.24606-8-warthog618@gmail.com>
 <CAHp75Vdm=61wibz70ScvayXk_D77rZw_pG7wPkLXkbkzagRPNA@mail.gmail.com> <20200920111204.GB793608@sol>
In-Reply-To: <20200920111204.GB793608@sol>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 15:36:24 +0200
Message-ID: <CAMpxmJW1g-Z4XR1BvOvxjweqMYA6dvS9A=ooLKyjdxU1n9-3HA@mail.gmail.com>
Subject: Re: [PATCH v7 07/20] gpiolib: cdev: support GPIO_V2_GET_LINE_IOCTL
 and GPIO_V2_LINE_GET_VALUES_IOCTL
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 20, 2020 at 1:12 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> >
> > Can we use static_assert() at the top of the file? Presumably after
> > inclusion block.
> >
>
> Good idea - will do.

Thanks Andy for bringing this to my attention, the amount of kernel
interfaces I still don't know after all these years still amazes me.

Bartosz
