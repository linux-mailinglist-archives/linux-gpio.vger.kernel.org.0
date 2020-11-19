Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 368F02B92B3
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Nov 2020 13:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgKSMnw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Nov 2020 07:43:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgKSMnv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Nov 2020 07:43:51 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F03C0613CF
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 04:43:51 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id r9so8002833lfn.11
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2020 04:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4aLdtervtWp2F077eRbUzMPckoW3DESEXHpbokPPTzc=;
        b=RcXMnezo4L57xM1OLJ9nMpYoV3Q9SCvDZi9qmaoYTnjHHbcvz25tCjE0itaNNtPZPW
         ssa4MPl4QOVfrhI2+LVjKo5CtqAfjH5r78gA8PInU5UN8yY4ado/ACLslti7n3AKucAx
         xS6OeawPx1hJaVMOei7s/vhQ6npexEFWasClyY4yWveNb8U02jX3VO4Ccvl48lylKd2n
         LCRI9wQjuoWY3vAKmn2kwy78DW3Z24aGtqVBmgnUlTVQpTlURs1pOUpkEIQU7kqdJBEI
         PG6ivbkk9ECsd2Gw8eb6H1gRVo3yzbDq/8N2zcY5qBTW9Fu+Se2knJCui+cNvVC1ZO7B
         94sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4aLdtervtWp2F077eRbUzMPckoW3DESEXHpbokPPTzc=;
        b=K0IE/jHGjFf9Gy7mW9Aw5w6pDTaTVmBYeYRHFzbcePF8Z0/FWRIfR9d71X0KTMJytS
         z2ObKh21gDDF6t2HkC4WxpjL6mTxetVwwNN3dBYIyzwogolhZYEZIG8dzfFn4qubADX6
         HmgNC2XkkQRZ9xzI9vvAHn1+4TvVkZw0dV9fS8EWb/jxzeqhJSe/mW1ZtmaNAJHYnCBi
         kPOlZpLtXSCpwKVYvahUESng85jynhFHME7WHwd7E4zUg47P19UtYEUOtOgCgH7SJ0Zx
         sjyJ0JpVQ/IFRqbtImw5pLjF2FDdLbiknF3qIDBwH050h+iTZxmF+a0XpTAvQq+U2kIk
         j3Sw==
X-Gm-Message-State: AOAM530IHQSzPxR1/qDCMfi3UIvn42lxOp3BwVBG4kh6FRj6InWlytTV
        LSOpvZ4WPrMIAL/LhM3e1bZM2EE99K3Mn2+qRM7HKg==
X-Google-Smtp-Source: ABdhPJxPfBfQQbben9LdBUQrSFvhh3YO8bpHCOqeTS0YDmQvYpVqSJEfdFjLx4VFIckJQ+MaR7JX9i/1L4gkHvCDP1g=
X-Received: by 2002:a19:e08:: with SMTP id 8mr5400721lfo.441.1605789830053;
 Thu, 19 Nov 2020 04:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20201116152625.GA20187@black.fi.intel.com> <CACRpkdbgO++4scNqX=3D0XKSyUhah67UvMjHDbaT4SyX0ESF-A@mail.gmail.com>
 <20201118141811.GV4077@smile.fi.intel.com> <CACRpkdZO+OGvYVF1+ZxgnaMO-HUCCJ2oAJPQgP_zKQwXeOLtCQ@mail.gmail.com>
 <20201119105828.GZ4077@smile.fi.intel.com>
In-Reply-To: <20201119105828.GZ4077@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 Nov 2020 13:43:38 +0100
Message-ID: <CACRpkdb4ZKZpOQyV1FHnF2k1QFWe4WA=Yo0rQmk_1zgTG9r8-w@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.11-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux GPIO <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 19, 2020 at 11:57 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> > And that patch was on my fixes branch, which went into v5.10-rc4,
> > so in order to have the base commit in the devel tree I had to merge
> > in v5.10-rc4.
>
> I based solely on your gpio/for-next as has been stated in the cover letter.
> So, the PR might have been applied on top of your gpio/for-next without any
> additional merge required.

OK but my for-next isn't what is going to be merged by Torvalds so there
is some misunderstanding here.

In my tree "for-next" does not mean "for the next kernel that Torvalds
is going to release", it means "for the linux-next integration tree".

What is going into v5.11 is "devel" and that is why I'm always talking
about pulling stuff into devel etc.

for-next is created when I merged a few patches like this:

> git checkout for-next
> git reset --hard fixes
> git merge devel

(Procedure to create integration branch recommended by
Stephen Rothwell at one point.)

This is why your pull request work fine anyways if I merge in -rc4
because then "devel" will contain all commits from these two
branches at that point.

> I admit that PR automatic text is a bit deviated (it has been taken from wrong
> base, note that tag is correct nevertheless). I will look forward to amend my
> scripts.

Don't worry about it.

Maybe I need to think about how I name stuff.

Should I rename the branch "for-next" to "for-sjr-next" and
rename "devel" to "for-torvalds-next" then "fixes"
into "for-torvalds-current" or something
so it is crystal clear what they are for?

The community doesn't really have an established standard
here.

Yours,
Linus Walleij
