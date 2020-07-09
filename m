Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F67821A3E9
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 17:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGIPlJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 11:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbgGIPlJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 11:41:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4122C08C5CE
        for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2020 08:41:08 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k4so976453pld.12
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2020 08:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LzzeZF2F8wXfKj4NpifHedJ7VZiYMIscRcYif+ByvqU=;
        b=FfmTgZZS6RMsHQknSTpRhzu+WrlWNIdmjKR4M6gh29uQYDV4UaoKN0KkaIJjWd/yTO
         /wRMSS+MJvqFwzHVGCkDQLX8MSsxY30dFhebBpwAKSMNVGuPD8JW/IGTwVQNI9hvoWPs
         7Tx+7I8jsdzxH+paaOuVdTI/EHV1mFIre+ET18uLZaPKLgaU9IolHtQY6izDAlsbdIJr
         m8OB3t4sU+80UI3KWoxImMSQt/oyM63/0iAvvsWQ4an4KzSaMJSq+r1x0NX1uAKP2od8
         4oTHBZ/3oT1qcjG6PRm2VKeRYi5AL2CEiJSwuuurvpYEfszyTZ30ZJmcYVJIUy+3Kw7m
         ArsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LzzeZF2F8wXfKj4NpifHedJ7VZiYMIscRcYif+ByvqU=;
        b=UMkn8STi7eRyFjwiZvtUnBRPGMzClih7qPJwK9fGJFGgT73vGG1tGehYmDrBQJvquN
         z5zGoXXYpOO/2XuZYjowTpPvRFI4J67ftPoPd2xhTJM4NRnCeML1pyxynPm3tpQjf3xb
         Wb0cNNqJSvPCpmB3gyO2jZrKlHfvnydkFj48BMhSjNi7V24o4yazbjLUMRRuiCSA9qve
         wyNq2UOQgCpGK78EvHJyGL7W58pBuW0pMl+AL2anFZ+c/NJXjoRAGXVfMPmUrY84XaOi
         /kbDxhOR2OxoleADUB7dhQchg5x3OiUTmPoF55iCIJSDPu1BVsFztRGhGN1Z2JB37TGK
         02Qg==
X-Gm-Message-State: AOAM530EWeebF9lOGN2hPKp6rsP250Ncvmo4/a7t9iFosKV1vjbhf5m7
        rLpa7J8mkzaFEg0HV9R9fS0RapMSNSxbfay112U=
X-Google-Smtp-Source: ABdhPJxolHkeTFz84DBSi6xcZq9kO1cqp46G+a2hczakG+SNE4a0+YB+ktHjliaVw00PISBQyAMXhj3wYnkUAB4x9kI=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr56145592pll.18.1594309268421;
 Thu, 09 Jul 2020 08:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <5f049035.1c69fb81.15cb1.53fdSMTPIN_ADDED_MISSING@mx.google.com> <CAMpxmJWDiF+x5YzYcgcQgH9C6U3rpZLex19UGFAAj7Dh-+BA=Q@mail.gmail.com>
In-Reply-To: <CAMpxmJWDiF+x5YzYcgcQgH9C6U3rpZLex19UGFAAj7Dh-+BA=Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 18:40:52 +0300
Message-ID: <CAHp75VevzXfUH2E6DPRt4QP82xcDqPAZeKfqFAmiwcNG4XaK2g@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Add some warn print for easier to debug
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     mnlife <mnlife@foxmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 9, 2020 at 4:27 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
> On Tue, Jul 7, 2020 at 5:09 PM mnlife <mnlife@foxmail.com> wrote:

...

> > +               if (size >= sizeof(prop_name))
> > +                       dev_warn(dev, "prop_name %s is truncated with size %d\n",
> > +                                prop_name, size);

> To me this isn't a reason for a warning. If anything, this should
> simply be documented (if it's not already).

+1. This can only be useful in the development cycle.

CONFIG_DEBUG_GPIO easily catches this as well.


-- 
With Best Regards,
Andy Shevchenko
