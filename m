Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372D23BA309
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jul 2021 18:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbhGBQGb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Jul 2021 12:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbhGBQGa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jul 2021 12:06:30 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020D7C061762;
        Fri,  2 Jul 2021 09:03:58 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id x21-20020a17090aa395b029016e25313bfcso6347091pjp.2;
        Fri, 02 Jul 2021 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+LJxKyVwoQ+McSsqpufkf/CYhmI4kyUuSVLHiImkPFk=;
        b=KnJsFvBpqL0laNoKqrPj5CdbK3FVhLgqkbPSRmYyPg1p2wAhvTkQOQ22fwT0eXUXFd
         7lWVchk2oZ8YShvCcZdqdfvxzNk4FU5ZPqHK5YrEUN1opsTmHcLv24qgPJkJjNqzRkWb
         TwuMhHwUIw561vklch5cYfbA0IQRsF+K38nz2zbM3fjApX7GsoBp/saoLrl7h7QKBS1t
         CHls9gLe2eUz0LOcOevl8AQi2KeJjvfD8hYx7co0MFZwSh8zIgBq/hHyUCUsz91BBHEn
         czKTssMkgy/94ip1d5kDPdD35s/WyYnXjvDe/AeYPMQ9W4CvGPOoKMNAjhRj+AqUKSXg
         Af/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+LJxKyVwoQ+McSsqpufkf/CYhmI4kyUuSVLHiImkPFk=;
        b=G955isCYt74kLQwJcP0QAtlim+Z/Y4pZGXkYF0wo3d5d7aw455bnDIYnuAAXFGl5mK
         4jyJt9AyVtkCpNGJ4uyuarqq1GT99nG5hZ0UnGvrH3hbWSKlPZhuW/gDVMy/AJP1yOEq
         vXrNv6lkcrIC56YKNHrympk3ELazlsWm7FbUTABiStiJ6KxAOGkzxxPbaQYE55YmH9Cy
         aV+sgNNL5Xja9i9XhdsMRiWoPiiMCFFEjk9S4r6/vk09oorWFW9/dXYlA36p1lUHj3Zo
         wf70tK0caVp6uGzosSqsfp6gmR7eTb+SOjPW3Pq+DPvWa5ZiETQQ+lMNYeFAPZqJNyoq
         fZXA==
X-Gm-Message-State: AOAM532LIyE2YKsLku8ktdC2WDV3D8ESCvPevFFPkPG25JdGx6owQgJ7
        Ckr1gBzJLZ4gMAwRj+oe5cktc/miI5ZfvR8orpI=
X-Google-Smtp-Source: ABdhPJxunKummMJzWu/tehysV7Xsz1mBbx1VNw8K62HhbO027E9yy7oOifD4dymMRm7PjyxqE1uMt4oWnIRqaEZrUQs=
X-Received: by 2002:a17:90a:af90:: with SMTP id w16mr457973pjq.129.1625241837450;
 Fri, 02 Jul 2021 09:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org> <20210701002037.912625-3-drew@beagleboard.org>
In-Reply-To: <20210701002037.912625-3-drew@beagleboard.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 2 Jul 2021 19:03:19 +0300
Message-ID: <CAHp75Vc7kFk_SC8MSmFE5mBt53=4yUnxpSpr=cxZ+7eA-t1r5g@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO driver
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Fu Wei <tekkamanninja@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 1, 2021 at 3:23 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc/
> [2] https://github.com/beagleboard/beaglev-starlight

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Seems some Co-developed-by are missing.

Brief look into the code brings the Q. Can't you utilize gpio-regmap
here? Why not?

-- 
With Best Regards,
Andy Shevchenko
