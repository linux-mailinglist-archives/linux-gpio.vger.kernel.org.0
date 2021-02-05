Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4189310747
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 10:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhBEJAr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 04:00:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhBEJAq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 04:00:46 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 503A5C0613D6
        for <linux-gpio@vger.kernel.org>; Fri,  5 Feb 2021 01:00:06 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id q2so4786503eds.11
        for <linux-gpio@vger.kernel.org>; Fri, 05 Feb 2021 01:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s06AbkMpcPR6qBiEgvW5w21HriotjRpF7/CYnR11OnQ=;
        b=ZYgXnBFpl5xZdYg/Izmcl4RwgMohzkw9Zz96X9/cixtt0z5wVE2xLRJ5okmJQbxj1K
         IabmbPLAl7xAgwRBP2kzB9UgevMNT9+zmbRaG5FJcCuZRZj7UFoRi14wBgoBq4ogyb2e
         ulEQdio7V+lv3jhJiRxsp8IA2TnscynHeoLeFaBQvwTZJJrkwpTRVyybqnt322zTTY3l
         XMLuTALLeF8UZMlDsX/2qJUQfqid024pOFVjgdbQ+Ed5BqA5V8BgeWt7+dFFrTLQK4Ta
         W/UgkT0L5V0xDMTUo31snv680Gx4n5dCBCaA+jdFT4OuAvBTzAGapCk84uCxwikyarmw
         flOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s06AbkMpcPR6qBiEgvW5w21HriotjRpF7/CYnR11OnQ=;
        b=Jxnlxx/wbTpeRudekhnb/I/X9yTPNEasmnJa/2teG1Hozl7nPy8SWHgUvFAWA/9iUM
         s7pFa0x+qBtuI6YjeBrRuU7zJppUEwH1hDpINaoZA6NEiJo+q+YxX+wUPY9SUiXqyspy
         xUwap5Yzbr3aR4Smr60u01RMJTgA0LEGB9qrw1wQ9lt0fdbgwfhXNIeV1DcifHK4aSkr
         N3qD1SiRO5hE+6uENU5TwV3bosXNpCnbsz6U2lZN9Q+U/dhtviCxc++bLaFcO4zW3b7b
         c2Mvm9VifhjG2nKGFf9kKTGe9JgKP931HV5Oifjx9VdGe7W8/DxpEoY8/F4BSzYuFVnz
         RKSw==
X-Gm-Message-State: AOAM5303QOmmuOERLi1OhfMaabHRoQTV5ewwfhExOxEE/5tA3jzmoSNl
        79GGqpMXfCKrVo1BsGqG3wcoxCPVUI+4wqp5uSNkHA==
X-Google-Smtp-Source: ABdhPJya5Sd33cHYBeoWdq4wDX64QEVtShTNzi+LalCWoi1meGkcNJk6Cu+Ru415zlWBprru87Uu/mXEgX7R+dYdj4k=
X-Received: by 2002:a05:6402:b76:: with SMTP id cb22mr2702054edb.25.1612515605053;
 Fri, 05 Feb 2021 01:00:05 -0800 (PST)
MIME-Version: 1.0
References: <YBqOQpaTpUbDcdKo@black.fi.intel.com>
In-Reply-To: <YBqOQpaTpUbDcdKo@black.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 5 Feb 2021 09:59:54 +0100
Message-ID: <CAMRc=McbJbpaABg-gOfUjCUMoK2vdzWxXSef-m1S9qSTdNfqOQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.12-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 3, 2021 at 12:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> Non-traditional bunch for Intel GPIO drivers, because it includes an aggregator
> clean up with necessary libraries update and test cases. Besides that, it has
> nothing special, except removing couple of drivers from the subsystem. In any
> case this PR is independent, but would be nice to couple it with PR of
> ib-drm-gpio-pdx86-rtc-wdt-v5.12-1 which I had sent couple of weeks earlier.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>

Pulled in, thanks!

Bartosz
