Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F421BCD9F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 22:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgD1UmK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 16:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726180AbgD1UmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 16:42:10 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D1AC03C1AC
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 13:42:09 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id u15so193563ljd.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5CNxMxqrQ2+AsMwJGB1pKLyTKTfhWImCVydgeMhIOQo=;
        b=oGKoYPHsBGrK71vBETwyLtE+ZEMGm6BJ0HHklgI3BlCjJ9XhrdJBup6YWIM3+c2s28
         JV+wa93/eRibgu56pkBRM199/ie29TQSPu6UrEd9QAEvWaWUhfGtR+gT/n85VOpmrkHy
         KMnEDBAbG/KzA2HIeXL3DOwGSNm6i0iJfz/bYmNtBjeVcG3wbWVtnERX78JEgQfSvyl1
         +Ij41dDmUl3t4MFbZrvK/RL+OGfmn6pxumZ9r0LfzfHB7C+uW7RzCbCNDjCjfraCE/Ie
         D2ddWfhKoRV4Nz1QK157PK25kx4jh737gI/CEI45Dcb71nHfIPYY5TDMXmUmmkOo3ixQ
         NURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5CNxMxqrQ2+AsMwJGB1pKLyTKTfhWImCVydgeMhIOQo=;
        b=uQ2ElaiHC/9fr6+J6xGECStOPWF4g2u70zNNxibQJFN26HeZkaz1Lq6LOtWQHAurvc
         fZZYw/xxrO2SdI3NV39GqHpwMX39urvVIPaHPNu+gcsh+cbu4OxZ4V3fGsGguWRCYPQF
         Fk9MmTDjvWptu9digdqa1wOf5tcZuNfw/xQBwGoX0FE9Cjf3wpxkbiN/NnJ7q1LgnijC
         0k4HFG/nLAMuHyoz4Bj2u9QKFUSYNpgG1s5CE7FGD5ZlTBEIi3PCJZbr0xLvcb2etE2T
         nyVBQ1yzQBSukzYrWMG7aQXzWCCw9YFm/BV0ynjzFw1PUtIfTADTTiwsE6ftZG4jhQSL
         fH2g==
X-Gm-Message-State: AGi0PuZ8AHBKDpSgXy+P0g4vYj9UP1fyCnd49YhBqPaw3cHA735vpJRc
        mHp5J7FONwzBkzr0nrj0vVRn+I6kWtVkiiIS9eVjySPZ
X-Google-Smtp-Source: APiQypJ5pIHbkCqfVz5L1aiKRMLi9O1XUE3R6yzYVvTsDb3wTGgHiyurRr9DkLx9o91LXp8Xnv3/l4XhFecWJaaTFQ4=
X-Received: by 2002:a2e:2ac2:: with SMTP id q185mr9906041ljq.125.1588106527607;
 Tue, 28 Apr 2020 13:42:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200424154103.10311-1-zhengdejin5@gmail.com> <20200424154103.10311-3-zhengdejin5@gmail.com>
In-Reply-To: <20200424154103.10311-3-zhengdejin5@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 22:41:56 +0200
Message-ID: <CACRpkdYw3r9JSPuPx3zSA45s6LdFtR6K=6hGoXW_UP=4jvpY-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: mm-lantiq: Fix small typo
To:     Dejin Zheng <zhengdejin5@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 24, 2020 at 5:41 PM Dejin Zheng <zhengdejin5@gmail.com> wrote:

> Fix a spelling typo in gpio-mm-lantiq.c by codespell
> s/dont/don't/
>
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
> ---
> v1 -> v2:
>         - split patch v1 (only one patch) into patches for each driver
>           by Bartosz's suggestion. thanks Bartosz.

Patch applied.

Yours,
Linus Walleij
