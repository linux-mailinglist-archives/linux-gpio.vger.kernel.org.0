Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15415402F6B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Sep 2021 22:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242169AbhIGUJw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Sep 2021 16:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241385AbhIGUJw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Sep 2021 16:09:52 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76752C061575
        for <linux-gpio@vger.kernel.org>; Tue,  7 Sep 2021 13:08:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id l10so138031lfg.4
        for <linux-gpio@vger.kernel.org>; Tue, 07 Sep 2021 13:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UB1aa4k6oVCC3ZcKTNT6pk9uCjLuerGp3iiuYcgHab0=;
        b=GXUz8Yu58LAfdayBqLmD43RvsjiIxZAFWS+hUHR+8BPg2YlRn0p0H+Oog9x5JRVqVu
         yJjKTnuw5QOSKhG/nuWafIMV3f5kgfP0FFtXTzuh+CZ3irP1Hd4zKQ9gz9ZGShWNxE1X
         KzTs2W6uu6THgvmQSmdZ3WS5DErtWFQKPuRTWjNeJwLp4AW7CYYVY/4R36O+AnV6JKMQ
         1m/KDG5y1mz1R8qypDZDQn5ynfcTC14sxqZ3k1snMEr0wyU2i/H1wwL5qU2oy/rhPTjC
         UO/TF5bnOzW+CvxIO+MXUsFJEwN3gjbsyzdWF9H7YVGX6iys0ZjDlWbl2sb7gb6CcFcS
         h51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UB1aa4k6oVCC3ZcKTNT6pk9uCjLuerGp3iiuYcgHab0=;
        b=dDGK71euhxUL+aPqYG1CfflEOR1eMD1dmvqG9iT1JSL20vHYXsVQGZDg46PysLieMV
         UfWnyy2VrpeSzjsJeEKLR4FfIA2x65M7T8nxzxd0XOmEJbHFjD5w3iTjdg+tn8zQkoWC
         xvLoiNDgYXGudcZYHPbi172hSAHPgj1GZVLcqGIKtg2LsChELZ162w6cMrqtZvuwqhzP
         v2bqc5dnciuZvt5JuZZ4nCi+lWhp76j4EIq1lMjQwVQXiw9VLYK9vH4U+m5xQfjI8eRR
         EKNGNCwvM9hpPVX6RXra/vlFmQiCAAVQxMHN9XzcGun1HLI2Ef5aLbXYCWHemsAR2JNF
         lX+A==
X-Gm-Message-State: AOAM531+Z3qSmndISY4M38Emjohxf/hUrKRylEd/qAyI0WPTiO5xP/06
        Bazu6FMJxowfaibteavmMO9tj6NBVmKwdS3/t4bY5w==
X-Google-Smtp-Source: ABdhPJwwPKqhHma6Z4YaFvZipgRD24ypIJOPL5RKt1Hw0Mc5YyFrZGWs8Ts5NJdslSxw1qbP7cIz5GzjkpBGqkrRCVU=
X-Received: by 2002:a19:6455:: with SMTP id b21mr102063lfj.656.1631045323793;
 Tue, 07 Sep 2021 13:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210907083613.31268-1-brgl@bgdev.pl> <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
In-Reply-To: <CAHk-=wgQBgkut6zXTbZN45AtJmSceXwDw6Y60ZmwrPkOL__A8g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Sep 2021 22:08:32 +0200
Message-ID: <CACRpkdbG+pG8SXA1OGsfv2ZBoT8v9mgzUqWY-VFNLDN9pUAHUA@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.15
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 7, 2021 at 9:36 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:

> Merge commits need explanations. They need explanations for why the
> merge is done, and what the merge pulls in. Not this "single line that
> doesn't explain anything".

Good point, I think I am one of the offenders here as well, and I see
there has been quite a bit of media stir about github doing blank
merges like this by default (IIUC).

I'll try to do it better going forward, it'd be nice if there is or could be
a way to just configure a git tree to disallow blank commit messages,
then we can configure the maintainer trees so that we just can't do
it wrong, and if we mention this in
Documentation/maintainer/configure-git.rst
I think it would considerably improve things, I wonder if this is possible?

Yours,
Linus Walleij
