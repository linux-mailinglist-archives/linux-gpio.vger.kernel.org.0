Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A09E273CFF
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Sep 2020 10:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgIVILT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 04:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgIVILT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 04:11:19 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412F0C061755;
        Tue, 22 Sep 2020 01:11:19 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id f2so11326063pgd.3;
        Tue, 22 Sep 2020 01:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kjqu8oiQnpukngndV4Aa0Ssw8pga7Wr4GCqPnaHdW3s=;
        b=Mre6u2EH7OYjPAiCgPg6+fmLT8kIuFDLJREv4dIau4eqCOoQcu89o7n/TC4B4U041W
         ev8R11UyS28+pccci62N8TcY6kw995XrJLppjvZwBn54pn15d6OV17l3bsi/J3WwQgrq
         vUb1cUAuGYs0/WrgutX+GYaxYnX/Yd3l6na8oMZ3QN6DVOXxy0AlR6kfEk62JIl33lCn
         rOUuxcYv1p+3nWn5hX/vLOAzp5BJydRqH5uEMn1ELQZJnkLbZNLWvQR0F/K2ll+vGPPT
         k4ACKaPY3q2UWmlBA5mxRuv5OycO+JvBDO5uZhU5Zwm/GIJhVPndPyga2U2a1nhY+jft
         S6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kjqu8oiQnpukngndV4Aa0Ssw8pga7Wr4GCqPnaHdW3s=;
        b=f0Ppwej04rV/E5bzlDlMMma9ptIvWOsqeHefQN6KxgzUJ4ImW+CBrfcPle050a5nE6
         RZ7jumGHGApk0Z/Dh5XcwPmSL0YrOlLYmnWv5asUzVPxr6DyV7+vq/GbZvlizdbtF9rk
         ++cSvQ0/gr8vNrSIqkTNRaaOIMiAYGguVwN6Hv1YIsBLQyczZIM4185aoaboXEewguqo
         OtbabWiptDlCJ1zEUg2pl+zpFvgFG9L8qYvmUKlBhPzU06vybvmeneiAL851UlFeHZVA
         1+dePBE4jUwugIP4ullIjUcjpZsgYa5UqzIzTNVGX11kH2Vs+xuOs1x1233BUUW6hk6P
         Y9HA==
X-Gm-Message-State: AOAM531ksOT4h2M2gVU7LKV7USVpYTu5VF3v4D4xs6Y48pA6mXxdgzk1
        CyvwH7iJ1nQPlrEgKLEYz6Djb8fkGd5ZikKAPhI=
X-Google-Smtp-Source: ABdhPJwRmCYBQAbxTO7gpz1iMN4UReCiBmVNQt2bIghMvb9gJSivHKXDkQqPTV4bjV9h9I/AaO6jcFjW6qeNii2FxDo=
X-Received: by 2002:a17:902:778b:b029:d1:bb21:513d with SMTP id
 o11-20020a170902778bb02900d1bb21513dmr3493734pll.17.1600762278657; Tue, 22
 Sep 2020 01:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200922023151.387447-1-warthog618@gmail.com> <20200922023151.387447-14-warthog618@gmail.com>
 <CAK8P3a2S3YLgy001xB-xWib9kYkkQKgFmEEP1MGYFhvd2HZAXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2S3YLgy001xB-xWib9kYkkQKgFmEEP1MGYFhvd2HZAXQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 22 Sep 2020 11:11:02 +0300
Message-ID: <CAHp75VfBddSLz47YQkNUOX0PEYzujC2ghFYrhzh+Js5cEoJ_MQ@mail.gmail.com>
Subject: Re: [PATCH v9 13/20] gpio: uapi: document uAPI v1 as deprecated
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 22, 2020 at 10:49 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Sep 22, 2020 at 4:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >  /*
> >   *  ABI v1
> > + *
> > + * This version of the ABI is deprecated and will be removed in the future.
> > + * Use the latest version of the ABI, defined above, instead.
> >   */
>
> How intentional is the wording here? It seems unrealistic that the v1 ABI
> would be removed any time soon if there are existing users and applications
> cannot yet rely on v2 to be present in all kernels, so it sounds like a hollow
> threat.

I have similar thoughts when commenting on previous versions of this piece.

> At the same time I can see that telling users it will be removed can lead to
> them moving on to the new version more quickly, so maybe a hollow threat
> is in fact appropriate here ;-)

Users all know that if something will be broken, they may escalate to
Linus T. and get things reverted. So, above depends on the user's
knowledge about the process.

-- 
With Best Regards,
Andy Shevchenko
