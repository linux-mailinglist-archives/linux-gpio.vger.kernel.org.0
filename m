Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F218D14858D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jan 2020 14:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387754AbgAXNDK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jan 2020 08:03:10 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33257 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387445AbgAXNDK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jan 2020 08:03:10 -0500
Received: by mail-lf1-f65.google.com with SMTP id n25so1070861lfl.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jan 2020 05:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eCpdZ4SbAxU711n27XxVx5qGRYEByYtRJ3gADzNkiUw=;
        b=K/GSZ/BBusGf85P2NgTYjou1E0Bq3Wge6S844kLBuybXMTZ/tTYEsS3esjGOcdBYyX
         PzZ3vPRwp2Z3rbHANmZur6TFjimbicp/a5Y07cgfTWUERVg8cnh0cJtscBNQ8+qlqx0H
         sHrsJYm6MWEFwsD8JYQM46KpIgT0C3+k5nfQQsSw+j89E7MhHBg2Kxx/e41oSw0kXhpY
         jyy0avc13+jIrOWnIdXKIrL2/2q5pd8hvTElfPSuZOhTiSEexT5yy99MUxjSkIzqueF3
         Bl4yGdpqlEm4/o0V/wDLKZQOHk8mm9IB2nyr6ecxArS82uHgwxpKJbKUAGwSZr6FhKtY
         Fqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eCpdZ4SbAxU711n27XxVx5qGRYEByYtRJ3gADzNkiUw=;
        b=VPkGLUMq1JOOcnvDQHYzj5qvn1nL7DeA+cHAJUJRsKPHpR2S2KsDIffHsqtE4MFBwY
         BNak0QmiDGx7UpklofNwaTxnAeQR1Nop2qIkftR/P7IO018q1544HIDZ+7wlNeUMk9q1
         gJwTXMFqqhAoa0xDvGLnLfrH3IlfqJlDbTDyhxvvG0+7usoFbO+g5rLBK4o8DiJfuQe9
         E3UMk1JIfzxQuHOpc6sf7qb2xKfuFIwQs3IhEt9ekqSqsyYHS0ncKcYWqwCYk+TO9Vuj
         vRfbei2EqMBbKZD9zdoTnwo0X+esoFDknOA+pt1vPZWJsvXlI2sDw2bbl0Spy90N++wI
         +U3g==
X-Gm-Message-State: APjAAAX1av188CeAUUqc+17teXKcvQiaB+N0TRiDeQc6WuTY6K1eHwzS
        J/J1vcg1VlKxk0MGnezfHWD0JTeg2UwLa2N6ahMDqw5/h7o=
X-Google-Smtp-Source: APXvYqwi+lW26xqCZH5ABpL5EFqZx2G8xoR9MtJxQQVQ7/G/Z/ZPbx4z4p6KpWZ8jWU9Njrdq+e4lni77gtrPTfYAjE=
X-Received: by 2002:ac2:5499:: with SMTP id t25mr1309915lfk.194.1579870987781;
 Fri, 24 Jan 2020 05:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20200120100957.GA11113@black.fi.intel.com> <CACRpkdZh4Cy83BPfdgcXR6idf7KCr15VD0YkR-7CcDxV=HZgaQ@mail.gmail.com>
 <20200124105735.GC32742@smile.fi.intel.com>
In-Reply-To: <20200124105735.GC32742@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 24 Jan 2020 14:02:56 +0100
Message-ID: <CACRpkdba9zw3qN5MEVsRhdkebVfi-fHoiNU+FhCZfpoZ1g3vLw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.6-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 24, 2020 at 11:57 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Jan 23, 2020 at 03:45:14PM +0100, Linus Walleij wrote:

> > Pulled this into my "devel" branch for v5.6.
>
> Thanks!
> How long usually does it take to see in linux-next?

What I need before I put it for-next is successful builds on a few
archs.

Zeroday has been smacky before so I could quickly cornfirm the branches
build fine and that made things quicker in the past. But as of lately
zeroday comes and goes a bit sporadically.

I can do local builds of some archs but my computer isn't the most
fantastic workhorse really.

Lately I am investigating a cloud build service, it is quite promising,
you see the branch "testmerge" in linux-gpio where I merge all
the new stuff for GPIO and pin control and toss at the build server,
so I am working on something here.

Sometimes I just give up trying to build all stuff and submit it for
next anyway but I'd rather not have to do that, it usually results
in a patch storm of 4 different people fixing the same trivial
issue in linux-next...

Yours,
Linus Walleij
