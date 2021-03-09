Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C21332ACC
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 16:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCIPmg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 10:42:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhCIPmD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 10:42:03 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4124C06174A
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 07:42:02 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 18so27747214lff.6
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 07:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mWtuxuoxcvwW1zB0QXwMngDcHmZrmGaclw1+BcnUKB0=;
        b=g+AcwhGsKZ6Ex0fpz6rmrw4l5hz7pS2nctsECswTK0jbmwiS89QwX99oue8e29NYbB
         jKwQp9EKv9CyFFSh9dRaz0x3TkSqA/0LNiQ1hDbSdArwgYYVuHc0pQpmCyw3QOVcpcQD
         NbYoEyujdCsPv84k7CK4I03BQV9upjeVY0C/4O9HiVmikB1X6Op32gS7keba4uWMt3W+
         W7pO0qEHw3VW5XiyqBinkE04500d86hQAmXeG7JPwOZipZNdIhTv6EKdKJQeJ5NQ11Sr
         FA94TlFlmIpefZHHor4CjnGuqdyoCGGyOJEhckI/8vF7sRjAIjGrATeuUmoSl4KvW3dA
         ISzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mWtuxuoxcvwW1zB0QXwMngDcHmZrmGaclw1+BcnUKB0=;
        b=hnGpBd8nJTygRdXCT39a2dA19zxBE9+17dn4WzFROFs54nNX4UyRXwDkZyBk/9PLS9
         FJVZfNLSUSocdE6FzrvuvWL3EhPFB5JtVVMMZloKVQ9w8dJTsayniijWEPh883OBERvH
         jB7n2YCyWIRvVXzCg0jkRg7uGnTm2poorR+sAEZ3Z3bsM66LhX00JdvMQ4pGUipGoICr
         c5nlVVNxtd0Q1tsx1SRuNZodogwdxYNNmuBM1s93wXHZYsBAAPrqJ6mHaR+uizRrPJB2
         SL39bvCZzN2YQdZIC7MI5TkvE1OKoskCm8k/mxoW1tzNT7+2oFL4ZXqoEcuqJkZ3dFjX
         E2KA==
X-Gm-Message-State: AOAM530CL+9XPbkeg3iI0ZU1DdqL4S+QgjAbUY2GvVHO9HFEUBiyQkBp
        AHxe0QGMZLz4yD4IPoRzlwTFtLtBx7QJRWqgjJDAVw==
X-Google-Smtp-Source: ABdhPJxVikdbLGgEpdKo+7a8BCFYNdTayOP7XG3Qhu+SQhKA2qbJrEkEmdLej9XwEl129AGMiRtPiYFjnrKU6J1kV28=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr14661147lfo.529.1615304521545;
 Tue, 09 Mar 2021 07:42:01 -0800 (PST)
MIME-Version: 1.0
References: <YD9K8LzSFpuAhDvW@black.fi.intel.com> <CAMRc=Mf1MsRUGJN9Y09yVQ=OO41-kYRo8n3D3tyLpymnJ6_JvQ@mail.gmail.com>
 <YEX72lTYIwxc0I8O@smile.fi.intel.com> <CAMRc=MeWppCHTc5G3wu3MMb0ZvncbaNJfOLU=WFFTbaw7EVnXQ@mail.gmail.com>
 <CACRpkdZF2x-mAs3p=d1gx-rfrSGQA4J5v+-6WHOjFwt=62De5w@mail.gmail.com> <CAMRc=MftNQMNA4riDBkGBo0A1nmO808mux0fWf_inLzy8jfPnA@mail.gmail.com>
In-Reply-To: <CAMRc=MftNQMNA4riDBkGBo0A1nmO808mux0fWf_inLzy8jfPnA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Mar 2021 16:41:50 +0100
Message-ID: <CACRpkdYS-wN72EGAkVDx4DS4RFLSqt5n+tsBMAJgYCnFOboKjg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 5.12-2
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux GPIO <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 9, 2021 at 4:36 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Ah cr*p I did because of the v5.12-rc1 problem signalled by Linus Torvalds. :(
>
> And I already sent a PR to him too...
>
> Anything I can do now to fix that?

Fix up the branch (just add your own Signed-off-by's) then send an updated
pull request from the new signed hash. That's what I do :D

Yours,
Linus Walleij
