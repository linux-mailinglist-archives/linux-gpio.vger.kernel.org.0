Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B9B363F48
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Apr 2021 12:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhDSKFm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Apr 2021 06:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238063AbhDSKFg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Apr 2021 06:05:36 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C52C06174A;
        Mon, 19 Apr 2021 03:04:59 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id m6-20020a17090a8586b02901507e1acf0fso2739737pjn.3;
        Mon, 19 Apr 2021 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wdb0pFWhXyCZ395YaB5DDppVlbVhuv2Pveb1p+tzizA=;
        b=VhehsEGYyGZgtY0s/4ArsGKri1LzEtkMyriO1rJCAQ2jYqb2K+/VllyrYolcpe+f4v
         k3wENqcusfxzk3aCsW/jrPsci/lXiNJmnJi4MWND025H/4ViwIwDmHCOokdRVEBe1n8I
         HUDSDHJR64RmZUqpVaJKV1rGJ345mQQgI+Bfq3pg0aX+r3tyvWLRGgYy802o/puq2bvn
         BToyFVdtFGAJyKJl+lKWuIxkMn++mMygQeXbwSkXRpaiWonDlehRchaEf9uNbw1H6nA4
         zhCnr8U2foa2pWJh62u0v9GnXrdFuJQBJaPPpCzreDjGC76zWVwCb5GF0JIUKSoFDPwL
         oTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wdb0pFWhXyCZ395YaB5DDppVlbVhuv2Pveb1p+tzizA=;
        b=lJJywAfK45qQYO7yN4nteXQQaaKWqEw/KuhEf4g19NaKCYQvfdDndGT6wnverOnE1W
         sF/mwwIQ2UpsbOd8wkFqNIpkbjwtPbahyDYYlUIvzaXODO1pqqXuSU9iYvL1ZDGPM28W
         rdjnaCH6LppWCJ26GrYh+kkUZd5LIxqCVBpQ6lAcQgjf1bXvll7SF3b11R7NzCuvfh6g
         o2txIjVLUzLddoxF0Hzs2sEHaLAjqJFQPX0kMUV1ivii8mOSX+4tYvPLa/m4QEihDPWw
         WbOJ0LpWWwMUtIA+1UhcYWRnJGBDyi/mRBXSmhU0jy0DzrWG3SObqQJ0SSjOaFHxogPn
         +zYg==
X-Gm-Message-State: AOAM53079uCAgTZeLO/YdgNIapuTiqI0Rba+rE1bC0Ms8qyS4Rjhp/hs
        q/oUO8T9MDJgkS1nmVBBukxHuB65265PFi3lgoUZIbrFpVI=
X-Google-Smtp-Source: ABdhPJxj2ht6M6kAEf/G7j4ryPpn7DWevF8WKCK0DqHgcxBYhphiLLG48wEj8QJ5M/FAVskkT7W7Da6RTFyuCrB8xH4=
X-Received: by 2002:a17:90a:bd13:: with SMTP id y19mr5077717pjr.181.1618826698433;
 Mon, 19 Apr 2021 03:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210415130356.15885-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210415130356.15885-1-andriy.shevchenko@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 19 Apr 2021 13:04:42 +0300
Message-ID: <CAHp75VcVBELiTk3C79jHUtxG5xBDoa-wpFYPPXiTUfV-J0PqRQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: core: Show pin numbers for the
 controllers with base = 0
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Drew Fustini <drew@beagleboard.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 15, 2021 at 4:07 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The commit f1b206cf7c57 ("pinctrl: core: print gpio in pins debugfs file")
> enabled GPIO pin number and label in debugfs for pin controller. However,
> it limited that feature to the chips where the base is a positive number. This,
> in particular, excluded chips where base is 0 for the historical or backward
> compatibility reasons. Refactor the code to include the latter as well.

Linus, since we got one more week, can you consider applying this one
and the other one against kernel doc for the final release?

-- 
With Best Regards,
Andy Shevchenko
