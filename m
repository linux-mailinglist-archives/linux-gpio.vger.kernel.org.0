Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B4E2D4642
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 17:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgLIQDF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 11:03:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgLIQDF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 11:03:05 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800AAC0613CF
        for <linux-gpio@vger.kernel.org>; Wed,  9 Dec 2020 08:02:25 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id f9so1277582pfc.11
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2020 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VQAQ2J6LbV3gszHKeOVHEcsMGoc7/0iCrJQJ/rSIwdY=;
        b=R0gt3ItnqniRhw7aQYymhT8ObGWHPuSWf1gEpXTsdNV3duXkIpWAdJ85ItSGb0cABr
         O7PhSdxmqCD59qPbsL7cd2SMIap5DxNEbUh5PCAerM9mKq4kZCClkUTM4FRhnXrp067R
         447RfFYRYoRZML4LSJt8IUKJrQcXWO9hN0OVxO86N52BtYxcRiVhU2pncZx5O3i1YTpw
         QG/eXM7il9HcaALtE85kwbvAhBH5w2HBPCKrIGdrozETxdgj+gkKcu9xtG2CJ39L7res
         sZV9Cq4+6AwIbidbIT5S0qHqXVYxg/ZImWQ1uMraH6BHgtxuPh+hMYa6Q3X9qdIU1Zty
         ctjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQAQ2J6LbV3gszHKeOVHEcsMGoc7/0iCrJQJ/rSIwdY=;
        b=lBw82z63mINWjOJ5lcodH3Fu6xQhtZTShQRNc7OzTgpXkgbyhVsnUgBPleJ9z4UUkd
         o5ksH6yvVrOa5b7Qrtm3tWa4ZNwTh279NyC9O8xjIWfkOGkLgOdslUSD3mX+PZhVW0kH
         UcP6+fB6rLA1yEcHiKr4DiO1SToW/9ra3t+FoYMfp3vTUDrhj2qrbq9PbvyoDShIsyYZ
         kclt3/Pmp7IDIwZBe3nNxSU/pdr/narhqCDwKckn4jdq8NxeJoUFBF4lTgwr3bNdFmcM
         k3BtpUNmbCY3WlspbWpTYua+FuNOdcxh2RWHFOkgIFJyUD0/cR3cSbVrhgQXr7Ny9IwM
         8Emg==
X-Gm-Message-State: AOAM533AZc7glOF7uMXbN/PSh0Z6SNJpKK0Jq8dbVM6dm9ISPv9ZwZWV
        bE0JrfmxFprbEkhfjkJrEtvG6ZAOilLnzRs+9YY=
X-Google-Smtp-Source: ABdhPJy/wApaXKX9jrNfIf67ronwPYtl+kP65NpKmwSC9zUC28XMVPj39AHMj3ILh9Rgbs3/J9xTpH+ud8o20z8NewU=
X-Received: by 2002:a63:4002:: with SMTP id n2mr2582063pga.4.1607529744948;
 Wed, 09 Dec 2020 08:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20201209095248.22408-1-brgl@bgdev.pl> <CACRpkdZgK3dmjM32BYAWFvHOhBUsQbNbCSNMaebvRr+Jnes=Ww@mail.gmail.com>
 <CAMRc=Mdq7LBTAbUguuLH=f5_vfo5pc95BCveqSvApBTC26aNQQ@mail.gmail.com>
 <CACRpkdYM2knogZLRp+AAdE5ssvhULDZ6xr8yGrO8rvSMrZuScw@mail.gmail.com>
 <CAHp75VefreUB1KvdPGYUqmd7jq+hEWuPoq7nRG4RxLP6YpPRLA@mail.gmail.com>
 <CAHp75Vebqe2ndfAx5b_awLnjM7UCh2bmcdJBEakVZL3hSQhRQA@mail.gmail.com> <CACRpkdYbANG6GCYPrUus0k_wnEzF-6rkE1GMRLc3-nvqja=73w@mail.gmail.com>
In-Reply-To: <CACRpkdYbANG6GCYPrUus0k_wnEzF-6rkE1GMRLc3-nvqja=73w@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Dec 2020 18:03:13 +0200
Message-ID: <CAHp75VeGoFurUzUvKLLDhF7Mb9T2H9oqV_fVgTcAEvknBjBH3g@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.11-rc1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 9, 2020 at 4:39 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Dec 9, 2020 at 11:39 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > Manually I did the following:
> > - removed the conflicting hunk entirely
> > - added 'break;' to the existing function in 'case
> > ACPI_IO_RESTRICT_OUTPUT:' case
>
> OK I did the same and merged in Bartosz branch exactly like that,
> let's hope it works!

I just have checked your devel branch and it looks okay to me, thanks!

-- 
With Best Regards,
Andy Shevchenko
