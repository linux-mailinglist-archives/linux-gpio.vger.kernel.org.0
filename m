Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1DB48181B
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727158AbfHELZM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:25:12 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34037 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbfHELZI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:25:08 -0400
Received: by mail-lf1-f67.google.com with SMTP id b29so50406284lfq.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yO3IjPZhy8xeOjJxJvmE3Qd/RCJXikfSTjciEqZALp8=;
        b=GN0V1l+pQRKCt/P/RNcyC2+LzMJgDuUTfzEUQVDrQmJ2M6dpVTmViAi1QTrEk3mr5L
         Xq5JLeExSgxEnBFOaILHFsGjaJA5Sl0kDMQUVaAp8FHNaKHZlFZR4J4vsvyoRTdi4bEG
         lEzOAZEfdY0deoaC9NssyhYYEItwLH51Tx5ytfpoflrR9pMGdbtYQ2HAnVm8HyLSKgsB
         HWK2ItHaTFTSxHz5Apphozd2xbrOt7P0q2wFLUW543d603nYCMPl77AesvHz0w8Yheiz
         r7kyAqVrkZSuYGuEKvtkJ+OFhfjOQ8d/HTCsOdHlN5sUhkzZn40l/8/nm6k3kLv5FXzD
         MWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yO3IjPZhy8xeOjJxJvmE3Qd/RCJXikfSTjciEqZALp8=;
        b=stnpm5U76+2KTVolb6jvdUKZPjHFwC3vYxXJJHEOH6rIcuRucWJf4JRgtmTpiDP1Ay
         /Hzfeixk4uEWvef3KFukPFCW8a76XCCxxlGDs9XxYCsjpoY7ORMnXAq+bYMhE919kKSQ
         2FvbJYfa2VCkKLuCrmf/jT9tCCgCXP4E9ov3fy/XU9ASMwrTBogkeoQzgY8A3qTqa4qZ
         yUjVSUyEShjPfUC+w1Ll0AHKSdBfdkmYY+W0uqTu52WEeIAet9QlWJp3exaVxAAKUrJk
         xS8LIHRHWiuGjgdn7TPAf4z4HVrzj5EY3FvdpB8jfb6vX4lMhkLfnxzamVEYKwJdaeyT
         rGpQ==
X-Gm-Message-State: APjAAAXXdMBAqHUgclqQK34Cp48E/klBXS9uiaUDyaeHYLOnQZP8oKfX
        yK55HPftkYgRcUZZO2v74x+0aB2vXQCgzDVQHzlMwA==
X-Google-Smtp-Source: APXvYqz8CgY2IV5jGjgcFM0WhvD88j5mixKk0bfLOTEgrii2dMNZERcKfZhDad+FpRbfhugtgHBp8QVxKQCWzAPBQjQ=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr2033424lfy.141.1565004306873;
 Mon, 05 Aug 2019 04:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190730181557.90391-1-swboyd@chromium.org> <20190730181557.90391-34-swboyd@chromium.org>
In-Reply-To: <20190730181557.90391-34-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:24:55 +0200
Message-ID: <CACRpkdZ7gmzEnz1HFuK5c6NpyOYN9txKpXJELdYzpKDeJpP4CA@mail.gmail.com>
Subject: Re: [PATCH v6 33/57] pinctrl: Remove dev_err() usage after platform_get_irq()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 8:16 PM Stephen Boyd <swboyd@chromium.org> wrote:

> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
(...)
> While we're here, remove braces on if statements that only have one
> statement (manually).
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Patch applied to the pinctrl tree!

Nice work.

Yours,
Linus Walleij
