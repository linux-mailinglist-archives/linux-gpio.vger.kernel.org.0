Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB0A3E2C05
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 15:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbhHFN7t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Aug 2021 09:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233195AbhHFN7s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Aug 2021 09:59:48 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9581CC0613CF;
        Fri,  6 Aug 2021 06:59:31 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u2so7160906plg.10;
        Fri, 06 Aug 2021 06:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KRjDRWgaNwkdAtRmE+wENibg7DwdZ2FHjDrltJLcerM=;
        b=lkv4+Zm1+rKewfeLyXqO6tc6do22YxiIq73VskDjwQNWY+u3eNrhNacPC9tM5Xpcdt
         CyEFBibxXzhXYNAqH6oljkuRgMqn9GEbi4ems927fsbo1upfN3RDzBqlLerwX7Rk0n+q
         NKydbA6wptRSMBKpdPmTEz51Fkg8zaVUsvjNBj3J5VyZRObmKNT4QC1Yruebg3PZC4uT
         xzAaMrIGwfchmlqkKa2wv21SBZO/UnTlVKlhCDhZwObJqi2nE/Lv4VgnfYInq/X6N8xF
         Lhfrm2rE030eHHPbZI7XZWLg87Kxdubm7BVckfFxpy2UY6+pnGEuBUzRRwEVAl20QN79
         b6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KRjDRWgaNwkdAtRmE+wENibg7DwdZ2FHjDrltJLcerM=;
        b=WWZgUbHCjY+Ly+BTKrKVKWoGodCqLGXwZEhsymfGXwaxJR+WPopSdaCvM0tvrRuWsm
         Lsw4jvwcf+A6X4a+v+eUpTf0exBXPyIHWOIzFYRYNrFdU4TEo8L7QFFD8uNqJXwbjEDP
         D09HSPcDRpzVDx23pf5rf53mIhTZOknnxRbXvxrRV4LejVMsf8I8husPXITPOJ8rUA/J
         E3bcxQQ1opUr7xSd8RvUhUhs/0TaexfgA1tuldjebTavCX0iCt0FMC916FwQ5KnHuNAG
         ZwY21NayKejM2yV2LuizvZOTgcnQKRZYZ1s/2Xo9PZs9aN1reRpRMtVLOhdfKobvFV32
         ntrg==
X-Gm-Message-State: AOAM533ItH1gpyRtYmY/nPR6q/+tnoLYHrLrajrNsQ3JmoAlFY/viOdr
        o6MOS7J1qeTiJzL9yoj1vj2dSE6RXrxQ+22PDVQ=
X-Google-Smtp-Source: ABdhPJxWUsy/GtwYEOqq/xcPJsJT6Qn4hf4gJpXGviRrI0Fg0P22SphYXeoEFZZmtuN23wPiRb5tU1hdG/xyjK3SNH4=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr21318327pjq.181.1628258370971;
 Fri, 06 Aug 2021 06:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210806005755.2295193-1-chrisrblake93@gmail.com>
 <CAHp75VenSw9BanwH58VSCNpw4cNFf7h3uSWTXLb5n0+OPtnDTQ@mail.gmail.com> <b5430038-c18c-6037-44d1-a3c0089645a1@redhat.com>
In-Reply-To: <b5430038-c18c-6037-44d1-a3c0089645a1@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 6 Aug 2021 16:58:51 +0300
Message-ID: <CAHp75VeUcrHuBOW9LJ=sPR0atxoEEe19mpD32UfjY1NncD5dLA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: add meraki-mx100 platform driver
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Chris Blake <chrisrblake93@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 6, 2021 at 4:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 8/6/21 9:52 AM, Andy Shevchenko wrote:
> > On Fri, Aug 6, 2021 at 5:47 AM Chris Blake <chrisrblake93@gmail.com> wrote:

...

> >> +#include <linux/gpio/machine.h>
> >
> > Does this provide a GPIO controller driver? I don't think so.
>
> Actually GPIO controller drivers use <linux/gpio/driver.h>
> <linux/gpio/machine.h> for board files / glue code which
> e.g. needs to add lookup-tables, which this code does,
> so including this header is correct.

Ah, indeed. I stand corrected.

-- 
With Best Regards,
Andy Shevchenko
