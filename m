Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9137224E1F
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Jul 2020 23:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgGRVby (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 18 Jul 2020 17:31:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgGRVby (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jul 2020 17:31:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C3EC0619D2
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2020 14:31:54 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id b92so8008311pjc.4
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2020 14:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MW3vYnh15YMFL9NBzMLvmKGSWy0eXL+SjCbeEXxNfBQ=;
        b=hb2kXYkjVOdWE5GhHXy/t6w5p9pfqdm3uafiBQQlTwu3/dKITmlsizhXvEIuffYNeI
         Zcmk8G47FA72a3YvQR67QlcZ/MEpmjFKVVXIYrYfvSkH7qke46b7lxdaP4gGM7KQwhXn
         o+sV5BxDEgzS1BQUuLtOAVUh2n/X4jHMEVTlFiEbiGeS7Yuh8hSu/d9iU8e1xQHzFfMr
         Kr9V+vzTP+iRxIGkkQ8y17FGb9vULjXna7Ct1MBZC5h7lqoYsOPIjVXQdznHe7ahPDWj
         DaAmvxLyzg0B/5z+V3k75M1vgcwzLVfAnd/ChjqLR/H5OfKWVdygpOftNKGUJElTU4zz
         ArSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MW3vYnh15YMFL9NBzMLvmKGSWy0eXL+SjCbeEXxNfBQ=;
        b=Y1PP+T95N0C+A5YvhBtgf34abNhUqD5PRtjVB6NM6zQyaqvvNfMK7kGC03Ca3ww9Ai
         MgbI/Y8Aavk8NYki2qJxmptLD64QG1G8nSVgBRWAWAcgAGgHtsFnt68b81XxKcttTLS0
         D4XTYXOkYMbKJhfAVRIUVir8+6hYPo8Yghh4KCnJSOqjrXX0hTyVrdqnJ2ramNp1MI/C
         pcWDXmRZ5RMulgzev3bGr5jogc4LDgGRYnv/7dzitiL3hN/bQSUd5X9Xv9VrrSthXQ5d
         uAVNRfFTOUzY9UrfYnpz/YxsKlxcWolyum0BWmeOKrY7Bph2/g9ACOhPrbkKJ169AweC
         wp2A==
X-Gm-Message-State: AOAM530qN1zDWIi/Tg1I3o0ZMMcKEhQAmDBKVoKYrmoA0t0X+uhJyEuw
        ZyzTj15yfRXk0Qy+yc4r8hectT7ea/j5knj9o3E=
X-Google-Smtp-Source: ABdhPJx2OO+hb5R8yvvOIrZNHTEZizbMhJoK9sXnST8d5xe92RO7SzZcaP9r7YUDhxIAlpvqNYJMcgm1S5Pkc43kW4s=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr16804702pjb.129.1595107912183;
 Sat, 18 Jul 2020 14:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
 <20200615150545.87964-3-andriy.shevchenko@linux.intel.com> <87sgdo35sf.fsf@FE-laptop>
In-Reply-To: <87sgdo35sf.fsf@FE-laptop>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 19 Jul 2020 00:31:36 +0300
Message-ID: <CAHp75Vep8ABSs_mvaBGTcgSZC4sV_Dad-PfUk48b=4cNyXOt4Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] ARM/orion/gpio: Make use of for_each_requested_gpio()
To:     Gregory CLEMENT <gregory.clement@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 18, 2020 at 11:53 PM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
>
> > Make use of for_each_requested_gpio() instead of home grown analogue.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Jason Cooper <jason@lakedaemon.net>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> > Cc: Gregory Clement <gregory.clement@bootlin.com>
>
> Applied on mvebu/arm

I guess you need to merge an immutable branch from Linus. Does above imply this?



-- 
With Best Regards,
Andy Shevchenko
