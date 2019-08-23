Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061309AD0F
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2019 12:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728961AbfHWKZx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Aug 2019 06:25:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46625 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387490AbfHWKZx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 06:25:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id m3so5525166pgv.13
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 03:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ja6PwZ+lifL6ldtgtuG8FgcF++GOKiCodjAdB0WtF6I=;
        b=CIuerCSenkgBe9ZHHRjoTlPnk/9xA4zmAtp+ssgU8UsjX0CfnDWUpTvADsMN/DfbDF
         Lgm7UauJGe3wkQBc05e0Gom9jguoqFWch1IWKRBj8QisPPl8z4y/AZP5QE/XpQPN1TeY
         UZfqcxQGg/UdldNdM3CIacFWYhDIXoXQleXwouMnVBpB7Ym1kyzpMf9rZHxG/MVF8/Nx
         akg6WTlxAw4Kp9ovMAOTsMeEwccQ8Vfos5VUPelu8eWzoMOMPShO2DzxYkeI16DUitXI
         5QW6HMVoQ+R5dJnEZA6xZw+uvDbSykfg1r/RwcrxEMABE1CB74pb375C6OW5fV/qN9+W
         3kaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ja6PwZ+lifL6ldtgtuG8FgcF++GOKiCodjAdB0WtF6I=;
        b=b1ldlEIle15KkL7757pXg1CtF2G3yQKnEAg5NRCMdkLcGskr43QJbhec2xNVNZLU8V
         NUgQepODdsDeqaMt8rctzdN4jLHLbsu0wE5g6HQaGJ0whug+OL6G/BLnknbDkQiiElni
         8ywY1Nce1uuFxnLlY/LUSDOHZEqs8waG9Bd+YY/85wBMfpEx0SfBtpkGM+YAeEWCY/He
         NwMFXvKME3xpwWirfaywTtuXhayNe7Ivu9hJZFxfJ94GKqbLjMOYoO7c/9xdAeaezS4Y
         klO3UwBes2z/IwCRJaNsbc/N/ZNkn4Lj6vEtaTDFsZqued/zGOCxhxOpcfOOMXgreiyz
         3Ngg==
X-Gm-Message-State: APjAAAXCHtUrj8IOYLDV8sICJ687fjpmE2bor5wyQT6ThCf0mV1Ztvmw
        /HMv3kljceVc6s2WbVDY49FoO32cx6P3ohK3gJc0SWhy
X-Google-Smtp-Source: APXvYqx6xCkIkxTP4YyZZw50DqsSxhLYyhVJMUE+vAdtN5XTU4BpQl+TqlVlj0fhuXvduJli477XmqtqStwNoj9Dje8=
X-Received: by 2002:a17:90a:dd41:: with SMTP id u1mr4569501pjv.132.1566555952943;
 Fri, 23 Aug 2019 03:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190820080527.11796-1-linus.walleij@linaro.org>
 <5D5FA478.6090707@hisilicon.com> <CACRpkdYKN23csn+DekZdNRN1HN8weX8SiU5W6XofvqzdAERTAQ@mail.gmail.com>
In-Reply-To: <CACRpkdYKN23csn+DekZdNRN1HN8weX8SiU5W6XofvqzdAERTAQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Aug 2019 13:25:40 +0300
Message-ID: <CAHp75VfERNF63yBucAn=vL8kj_reJvZ7D-PgsZqzvwi6fUOomw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Fix irqchip initialization order
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wei Xu <xuwei5@hisilicon.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Thierry Reding <treding@nvidia.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 23, 2019 at 12:02 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Aug 23, 2019 at 10:31 AM Wei Xu <xuwei5@hisilicon.com> wrote:
>
> > Yes, this fixes the problem and tested based on gpio/devel branch.
> > So,
> >
> > Tested-by: Wei Xu <xuwei5@hisilicon.com>
>
> Awesome! Thanks a lot Wei!
> I'll get this to Torvalds tree ASAP.

Thanks, Linus, to fix this!

-- 
With Best Regards,
Andy Shevchenko
