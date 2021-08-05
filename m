Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E293E15E6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Aug 2021 15:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241189AbhHENnh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 09:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239750AbhHENnh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 09:43:37 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34734C061765;
        Thu,  5 Aug 2021 06:43:22 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so11665849pji.5;
        Thu, 05 Aug 2021 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=58Ffi1Arbxce6aerw4WIspWj9tMJZpszbjIyc6AUL44=;
        b=GH/dqod3qaeVISZlEavJ1B1Q2ckMHBpygJRbUAG5V15AKHnuh55c1+0DnCQfcNbAyw
         32WP6Gwu7hlLL4eVrUid6reGBAB99eRuwoKBdSpon4fBYCmtWJuvMBjD04HNTYP15yKp
         O5gijcBXRvf9QfPDgdkclQ/bCXKms1Bm2yv4WHa/9PJAL01s2fY3YROgs6i4PTjP1ZZG
         i7/LeLwWzEnaq1r3AaGAV+ajMePlfLjvM6jeZof49A+vH6REdJtSeYvr7UmIhZ87KrqH
         N+v97k784K8vvMdS8WdoGR2cXG1CJ0KURs/MDyq432JX3l1TbkVaNFUxI2ThcLZfZVG5
         z+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=58Ffi1Arbxce6aerw4WIspWj9tMJZpszbjIyc6AUL44=;
        b=k2n9X6l0PSqsM8KtnilmXZfOFsEAUetnYxfnblZHWbj45rdnLl2n5RornYAd7jvdfm
         kZWmNg5+nrMu61s5dxHLW1GR7TH7A1b1G9BOV/Uw9QpUSMTs157uRzd9vArjbbei1OJc
         ZWyxxk3HRPK7UiUhVCL3CK7chO6TqnI47a/YgDd5H76t4eHsJcDE5qtIyniynGPNI/bC
         jWoMIdf5Hw0GLmccoyUsryBatUlnYqBuPKf8XfpfsUviwmKYHXz4fVkOw4a8gW+KQnse
         tyvrILRnO2NjkMle17hoTtjyzlTAXy4l69Ii9+iloudJVHspJcq02FS6f0royz63CBIA
         vuJw==
X-Gm-Message-State: AOAM531bXP3r+RBZnvBcTu3n6LuvhWvAXKbCr1eg/So2fOCfUGkWMV7i
        YI8Q4Bcr+B6d/U8g3eb3+6sDiQZUDGKbJsi62Q0=
X-Google-Smtp-Source: ABdhPJxQ7j9Z8TwVs6BQjf+UxIRFeNyr6I+JFKe1EKX8uckU3zdLzwQe9cpuMb/d5VHLmMrqWrtO9A2gpZpoukuqZYQ=
X-Received: by 2002:a65:5ccd:: with SMTP id b13mr232696pgt.203.1628171001734;
 Thu, 05 Aug 2021 06:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626429286.git.matthias.schiffer@ew.tq-group.com>
 <65f9787ebd6725e90fad9ea7f936ee0d5712da94.1626429286.git.matthias.schiffer@ew.tq-group.com>
 <YQvn9dkFluRYj80r@google.com> <9dc9fb4b37f7afa661bf1bb9148e5109b3f4329c.camel@ew.tq-group.com>
In-Reply-To: <9dc9fb4b37f7afa661bf1bb9148e5109b3f4329c.camel@ew.tq-group.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Aug 2021 16:42:42 +0300
Message-ID: <CAHp75VeQxr3pkX9j10wUi3NjZY-Nkn=waPsMDxG=pDprY3Wsyg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] mfd: tqmx86: clear GPIO IRQ resource when no IRQ
 is set
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Aug 5, 2021 at 4:40 PM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
> On Thu, 2021-08-05 at 14:30 +0100, Lee Jones wrote:
> > On Fri, 16 Jul 2021, Matthias Schiffer wrote:

...

> > Strange - why is this !0 in the first place?
>
> I don't see anything strange here. DEFINE_RES_IRQ() sets flags to
> IORESOURCE_IRQ. We reset it to 0 when there is no IRQ to clear that
> resource entry.
>
> An alternative would be to start with an empty entry and only fill in
> the fields when an IRQ is used, but that seems more cumbersome than the
> current code to me.

Another alternative is to start using the IRQ DISABLED resource flag,
but I'm afraid that OF code is not ready for that.
https://elixir.bootlin.com/linux/latest/source/include/linux/ioport.h#L331

-- 
With Best Regards,
Andy Shevchenko
