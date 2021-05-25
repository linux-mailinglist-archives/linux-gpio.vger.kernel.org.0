Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12CE38F6F6
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 02:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbhEYA2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 20:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhEYA2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 20:28:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22854C061756
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:27:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i22so42980522lfl.10
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 17:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ggN1ZyfpjeoPcK+b5TpMOSXo8A025wCmUM01aYg2EFg=;
        b=yOT2sHQJz8nvp4O5Q4NWuzU2gw8PBgy3p+S3aN5f0xs7BIpw9pWlTB5YBfiIhph5Gq
         3e33psxLGjctQdgqQbZapy3ir0V8qNI8Hjjc0YzhqWOMydI9tBoaYv+LsXyzCHmMJG7y
         3bzpcXma78Www3l4uL1lNF6jOMiRuS4OwYSzkY117QzTmLdGPIVMsQWdHnww5QxrwNxN
         Ulxqccg8A1YclQdQqkSYCME5+iV+SosXJAtPDM+vJqs2lj8beVe96oGlR0SY2QoklGvy
         CNIeUM5pZJodgZSHoa+B+0UDGT/lp6TjDK1VsxnDxZeBma79xT4cd3vOuzmRsk1H4iI5
         sOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggN1ZyfpjeoPcK+b5TpMOSXo8A025wCmUM01aYg2EFg=;
        b=GcO2DgTjSFTb+mWV6mnvRzWrgv0zGHC7UWlv+D5eWR+VhrEjKpDeGCQnKsrNJDumPz
         UtTIhZfQc4aIwtmN2VjaZJojOnkrCEIORK5AIQdJH2a4oeIpvIz0L1tQDh0XK+QAbytZ
         bsuVksuxMtL/NQ/D3fAAvKqtFXqrucVFAHH9zPIcPEO3w3xAYh8Tfa5HINaj776cewbz
         NUvhY+Gpq0qJXkBFzvWedjOzlzZKxDp3tFMZklfmD7g69RKUlrZRuFJi3056juFHuhjU
         t91HoZ+U+PXy/1gkPtqmXl2H7mUfowxh0jiySGHvh6vreLZNRVv2HrhI6lG0qWAFWAcP
         L2+g==
X-Gm-Message-State: AOAM531iaMKthSGlHTKfzTWbsMNjCe4VMcMfaqcXWB8pyAGbGBP6LWtj
        Xq163lWDZtC5WLy8hB5YMGPmszimelUqz5tqTzpu7g==
X-Google-Smtp-Source: ABdhPJyTefEIZ5y+qK7V+5Tec9ATzRvj6RgLSmVl0ftrBQcwXR6JAiYbyr8zFfudSZ+XDMF1phSLLmlUZr5h2L0Zwic=
X-Received: by 2002:ac2:5145:: with SMTP id q5mr12322949lfd.529.1621902431406;
 Mon, 24 May 2021 17:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210518155013.45622-1-andriy.shevchenko@linux.intel.com> <20210518155013.45622-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210518155013.45622-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 May 2021 02:27:00 +0200
Message-ID: <CACRpkdZad8huHXpNrJ4eeMpxnEkPBpQy1paOM8OmG5TQ0q3Tww@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpiolib: Introduce gpiod_request_user() helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 5:50 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The gpiod_request_user() is a special helper to avoid propagating stuff
> to user space that should not be propagated, e.g. internal error codes.
>
> For now, hide EPROBE_DEFER with ENODEV.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This looks like a good solution.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
