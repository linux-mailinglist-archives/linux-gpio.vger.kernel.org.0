Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66F9234A79F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 13:56:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhCZMzq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Mar 2021 08:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhCZMzW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Mar 2021 08:55:22 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36ABC0613B1
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 05:55:21 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id u9so8244197ejj.7
        for <linux-gpio@vger.kernel.org>; Fri, 26 Mar 2021 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K9SuKX2NoEYak6u3D158Ip2tiJkKOlip4/1iUV6Bsqk=;
        b=ggap5Sp3+odxqMJh3RqglKX0EXcNL9fn7d2HwELaiIos+42uMG1miSZc3ROFkoYtgE
         VQq1uKuHyvzV5IvRpIflFhD+y4R1vLMJdHzi7VZd0d/yBosbQs0tB2BC9LWVR/myUHWv
         JU4HlRBTLCWvYU/9q2spPXtUtafjglSzBQi/JL4yZx7pNq9g0HuhphmxaHdrRjwLgBJn
         QP/FtcGv1oLy1a2BLq/+VksZ3JFTDtDIzcV2WKfc+foE7UEZDxX3WrzAozNJpxx1RB0Q
         DRa6Ad9IPrZk0PcI42ci3dOlOedVYriL6DtpWDszHPCktnLMq2iDv+EKGK8Tw4z7cidj
         hSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K9SuKX2NoEYak6u3D158Ip2tiJkKOlip4/1iUV6Bsqk=;
        b=qHGMm4WDHCSt6QTsBP+pbeqOQVExm6EYLh5CuIYjJ7sRPpwAXkhqQ9eHatA5jLSJzi
         WV8eAkGj+rA/gFd2wqXDVwjbG/5Si2yC4UjDOhg9s3H/Vo0WksO76e9Mvj0ktS+EhGUY
         8h4QBf3jjNk9c2FaIG8cfoPLQ300RAy3tH5aNjqaBDgWIwfbabrG/gcTKG8r7ADClPKb
         9ENANmxIeHId9rpWkVMe9VX58LC0aJ2fPpvqDk/XYE4o8Y/kcBUx7g/DopLr0S9rksjd
         Ykcgv4R7toDV7xyukk2ick/fgM2NwHRiJ3/RcL5R9xyNeL9p8EwwC6ISQBEoiBEdVKzg
         AegQ==
X-Gm-Message-State: AOAM530Z8ibomkN/Vn9sTzCMSOorIhCZRkAm5brUXFWhoc+6+F5GoclR
        bo82jjwRTOd6tClvdFGQMvJADuRvUx3jdmrRaPSOxg==
X-Google-Smtp-Source: ABdhPJzb++lSdMN0Um5MXgBROBDwVzJQUX1EAskpAuFjHJf/1X8hm9zb9e8EIhAk9iEY/AoAh5la/fxiA9AS7zKEiW0=
X-Received: by 2002:a17:907:20b7:: with SMTP id pw23mr15440690ejb.168.1616763320445;
 Fri, 26 Mar 2021 05:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210325175536.14695-1-rdunlap@infradead.org>
In-Reply-To: <20210325175536.14695-1-rdunlap@infradead.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 13:55:09 +0100
Message-ID: <CAMpxmJVxA=1oYhQ72ZgWrWpupSENjWBDeXK4HTcmAL=dAd7JRA@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio-utils: fix various kernel-doc warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 25, 2021 at 6:56 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix several problems in kernel-doc notation in gpio-utils.c.
>
> gpio-utils.c:37: warning: Incorrect use of kernel-doc format:  * gpiotools_request_line() - request gpio lines in a gpiochip
> gpio-utils.c:61: warning: expecting prototype for doc(). Prototype was for gpiotools_request_line() instead
> gpio-utils.c:265: warning: Excess function parameter 'value' description in 'gpiotools_sets'
> gpio-utils.c:1: warning: 'gpiotools_request_lines' not found
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> ---

Applied, thanks!

Bartosz
