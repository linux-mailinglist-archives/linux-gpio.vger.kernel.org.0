Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D29353901
	for <lists+linux-gpio@lfdr.de>; Sun,  4 Apr 2021 19:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbhDDRSF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 4 Apr 2021 13:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbhDDRSE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Apr 2021 13:18:04 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A77C061756
        for <linux-gpio@vger.kernel.org>; Sun,  4 Apr 2021 10:17:59 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id g15so6810873pfq.3
        for <linux-gpio@vger.kernel.org>; Sun, 04 Apr 2021 10:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0bEgjcZfyifibnKaRilOlQ9KzYXLX4+85bEor9F5a3Y=;
        b=vH5xniMalIavWuDjPJAGe/oV9R0jWCvSfpfUCp9/uwbXKV8ue779aUNokcxiZdGATa
         jJj3o0/cJtp+lZAzRQ30I639sjKnrI+XX8aOl/pnmo1Xvi30AIQhYGSeM3fwpUZYIsDe
         eWTrR9SZ5OIy5bSwn/t7bUTaPOdFcBci0q+JUj7lilmwRRS6wTGu2rjM4+4XnrhFlPRT
         lnm+nxQhSBSW/rSZlZvhttsGjY8pmXAyqUetX8Al/Fh24gVpz5ACmD1YjFquhj31Pkbu
         Gp53HuUN+y3lGZTAr+UW4TTSiZnn/blyt+Na5ixILSsqVQTPUTrTG+0vbGeOouzEVD94
         z4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0bEgjcZfyifibnKaRilOlQ9KzYXLX4+85bEor9F5a3Y=;
        b=RTA9i9NN/IVfQQ2KDsf2hoO6Xc/NIqfI9Nsbn0kl4t+V9LVCeNhoJnKz7dreciwxZ1
         73J3KZgc81GhEMNptq2gQjgeIkGhrKdCozj8mF50tIBZp+WyTp6xv/t5pz1McRrqzF5Y
         kQ25BBXej8SOG/S94B7FGarXzTIfqhj0VQz6FEsa70vP4INsUsvjBW7WiR6Te1JDJE/z
         tQXRn8wSzDR/dQEHthSFeklLGLBJRVO0IwpQ+ayO2z7bSY1D9YCuweNB9SPNO9WDQLj6
         /XrebVgcjfa3/IPST0hgUtMVLn9vme8l7cZ7NpelfeADfvwESSy8/rVoAnpi3qGkyqhj
         mnfw==
X-Gm-Message-State: AOAM533/gwOYF1jxxlGfzmXrB+QEIl1fdbBn+f0s5iW1o0bUZn6t+Ypo
        ZDm+CeuKulrrSBt/FjO33UE9xP4sS0QZuWUP6Hc=
X-Google-Smtp-Source: ABdhPJwvNKSDWwDgUMlZGNskSIVGX57DfPl5vQQeLyXcsjHuzcTItuDqnvnMEWjJO/B5iUGZPAboqSgH1aWdGGZFQ4Q=
X-Received: by 2002:a62:7c43:0:b029:1ef:20ce:ba36 with SMTP id
 x64-20020a627c430000b02901ef20ceba36mr20687483pfc.40.1617556679244; Sun, 04
 Apr 2021 10:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210223195326.1355245-1-sandberg@mailfence.com>
 <20210223195326.1355245-2-sandberg@mailfence.com> <CAPgEAj5CZ1KxLEn3=GjKJTBFM8dTpC=NRGwLkN6wuw7VVv6YDw@mail.gmail.com>
 <1306564766.662706.1617546604089@ichabod.co-bxl> <CAPgEAj4Zd9FWL1UFkBLbiJRadBhGqc+NWdrKCxaTXyVeO3tSxA@mail.gmail.com>
In-Reply-To: <CAPgEAj4Zd9FWL1UFkBLbiJRadBhGqc+NWdrKCxaTXyVeO3tSxA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 4 Apr 2021 20:17:43 +0300
Message-ID: <CAHp75VcG7Uj-cDhbxDL23w0zNDG7eVqedw_eN5J6XPmVTECbvQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: driver for the NXP 74HC153 chip
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Mauri Sandberg <sandberg@mailfence.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Apr 4, 2021 at 6:36 PM Drew Fustini <drew@beagleboard.org> wrote:
> On Sun, Apr 4, 2021, 07:30 Mauri Sandberg <sandberg@mailfence.com> wrote:

...

> Do you think TI SN74HC153N should be ok for testing the gpio input
> multiplexer patch [1]?

Functionally all those *4xxx153yyy are all analogous.
You even may try soviet copy of it, i.e. 555=D0=9A=D0=9F11 (cyrillic letter=
s!,
555 can be 1533 or a few more variants).

> [1] https://lore.kernel.org/linux-gpio/20210325122832.119147-1-sandberg@m=
ailfence.com/



--=20
With Best Regards,
Andy Shevchenko
