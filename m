Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2682E2182CE
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jul 2020 10:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgGHIre (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Jul 2020 04:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgGHIre (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jul 2020 04:47:34 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DE02C08C5DC;
        Wed,  8 Jul 2020 01:47:34 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z3so10382370pfn.12;
        Wed, 08 Jul 2020 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+XW73svL4q3Y8sbhEmtW8nKZf1N04yzjCmqa1n2bim8=;
        b=BPMCOPSpEGQkjR63xGqcQgEt5jgS/XT8omj77nPL8ucAD11ZrIW/7zHyw/e1BBlOpb
         Hl7mQ4M9fbSeTuFbbUEcwublb0IZ2ck613GHy9ulyNbCKSb4RlSUzfKFoOM1dAo+6IWq
         ut8tfW0cJ/cVQjsSOUJOnJ1dN53YusOIIF7fUU+gtBolEbqw3RU9LEsOESQkuImNbCw2
         n5uhjxpkkIplzCK904sU+P1BEPNS0aMhaYqSin5ZZHa5PQyPxfe6GJeyNH/tea1BDUvs
         ROyIFNRqi1IYoUjBL2cX48oK7H723JM3qgNqYXzwSSj9ieW8JAwDHNxOBTwy+YMIwZOx
         B2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XW73svL4q3Y8sbhEmtW8nKZf1N04yzjCmqa1n2bim8=;
        b=lirx0fUQ6BW2Wq6SzGkaI6GvnzZjuOnI4+QG2cZJhDuu2R0yZ3mbEr3ciY5RDjZKxq
         4RYdZYPVpivVA4f5rcbVJ/1gQ0XSw06C1Hb4SBbwYA1la+KsctzuaL/kzGORGix1wpmf
         rrhWT4jPUcx09pEW9jYNBqAiiH6qUt56XeFR6j3N2eqvpvGYd+5GkmTVo4rrYX/mV89v
         g7sck9xJgo5DhQbOiiyQBOFXtViqEpUGf3xWqg5uTabe6rbN+VtT+A7fDLzm2hlXM0OT
         +SKiijv6zjN0JxVbUtJbaM4DYF55xocyGHXzjsD51qnHP4GCqcNH8wtjAo1qiXZI0ht4
         YMgQ==
X-Gm-Message-State: AOAM530oCV1SBkEovjkqq3v+YY6eHvlyLgrLbg6fV8ZupumX+d4j0Whm
        +UxZttBHLx1G0kQT+TiwPV4AAKiYMrJb2fDrfr4=
X-Google-Smtp-Source: ABdhPJxLozmIrntF8OwxLdnSULpe8zTIXamQeHqp89Arx+qe2C7k/dD47TaCIh2MUY0iy2W/6u/Sq/wo1xfYHCIXIu0=
X-Received: by 2002:a63:a05f:: with SMTP id u31mr41948590pgn.4.1594198053920;
 Wed, 08 Jul 2020 01:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-6-digetx@gmail.com>
In-Reply-To: <20200708082634.30191-6-digetx@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jul 2020 11:47:17 +0300
Message-ID: <CAHp75VeMhb6BH9LnZxM+_-6nNzDErKN70T_QuuuW_dmLwcpoHg@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] gpio: max77620: Move variable declaration
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Let's move the virq variable declaration to a top-level scope just to
> make the code a bit more visually appealing.

To me it sounds like unneeded churn, but it's up to maintainers.

-- 
With Best Regards,
Andy Shevchenko
