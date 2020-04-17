Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E4A1ADAD8
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 12:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbgDQKVf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Apr 2020 06:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728631AbgDQKVf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Apr 2020 06:21:35 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3C42C061A0C
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:21:34 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r7so1434076ljg.13
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 03:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MQOUnSzPjZ8rvbaZqPPxjqcJfgipgrmZi1Zgn0PyywM=;
        b=mQEXkcdMMwE/eQPM0YapPBtjMo6DST8o/moyzKmeqyXHWeNXpaubL07pfHl0TCMyoP
         UDzcaqza5elEsa5JBNm9+fq7gPLXOG2qh4fD8KB2OL9HLLRnkaV6TMU0VHE7Nt62638r
         U45iyML7axS810w9+Q5wyOkZ/VeJ53MjVgt6o98t//JMLxEkXjYYjbO8X+rloy0brHZ0
         DPkso4foCSua+bH6ScvruldG2dbqu2uXxpJ7RXCqfWADAOnm8oM86LF3QZ8P5jrSIwsH
         HHIiFP9hwT4MlYhyPmIrLS7Iko6Y6GqA5kuQNDGTB9NqLnv90/OgaYq++M/g7hDwDiX5
         QnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MQOUnSzPjZ8rvbaZqPPxjqcJfgipgrmZi1Zgn0PyywM=;
        b=iPPa5G2pDD/fVaZ6xU1OSf1nRIqgNrVlxD++KZ4bWdOHRFNuSddMQOn2AmXmHlmnkJ
         s/AClnDdmPEjBJJOixWhFaI6exrbcVhYkEFjW+Yy9sK5HA8S2UPaSdaZqEFq/XERQyLZ
         Is67s/FGjVm3btxVrDfk70yh8xBTe4/QzEvycu4LNGDBzmeWgBs4Gx5b1+xWZ4E1zeeV
         xKLthn29rF7F6S+EM4B1UK/bobhdvVQLfOiTIC9sxjvBUQZCxwklZ4++7lHuy9aAUlO9
         Qe4ByEAkXYzSNO9ZrOGCFbCVbNEJNEDqazob5UJ+LPmgrz+72qf5Zqd6LaZXBd2rNm/p
         zDoQ==
X-Gm-Message-State: AGi0PuZHkp0Ef0e+ZxTO8pBohxSheLyU4zbOrzip7n6XpU5w//4yLWL6
        ecNI22zfZsbaqcmGsQpd0wr6Lg77aAK85bUdpH0dJQ==
X-Google-Smtp-Source: APiQypLTHEN5Wyv0xGHW8W9/+MjNtXfHLBoSN6+O6bavkPZo9Vmsv7BORVR9ikzPGn8HwVlxK1NAzmMA+uwJYGmoXoI=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr1602091ljh.258.1587118893186;
 Fri, 17 Apr 2020 03:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200417092125.12513-1-yanaijie@huawei.com>
In-Reply-To: <20200417092125.12513-1-yanaijie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Apr 2020 12:21:21 +0200
Message-ID: <CACRpkdYm7_DYSxvj+cwciUrfDZETbJSdGj=5L8O=QK5xcGYcCQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: add module license
To:     Jason Yan <yanaijie@huawei.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 10:55 AM Jason Yan <yanaijie@huawei.com> wrote:

> Fix the following build warning:
>
> WARNING: modpost: missing MODULE_LICENSE() in
> drivers/pinctrl/pinctrl-mcp23s08.o
> see include/linux/module.h for more information
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Thanks, patch applied.

Yours,
Linus Walleij
