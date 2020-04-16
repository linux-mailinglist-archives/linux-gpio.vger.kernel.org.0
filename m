Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0951ABF8A
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:37:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506420AbgDPLhU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633658AbgDPLhP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:37:15 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C204C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:37:14 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h25so7403200lja.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SRORy/jxNGUk5NEraICWvT2sGWL870gmeryOxUpsqYM=;
        b=yLKc2dHtJq1RomNZo4JS43LGkdULXAdQGKsqeIGHV3U/JTCec/GbOwtDu0Rl+Hoa8k
         Wh/vbqtVE+RvHyWWG7GpECyckOvUWNExQMOYud2YqKBxAr9IdfvVPFwHh2rkXoiY/Xaj
         JGPUlPbWM5DLFjRWUQkbOahA4yGSXVAsqLQz4pBrb6MCoCSwXExVHpUv4VC/P/ItH/Sd
         Xkql6vBAXyL8KU596I/EQiQj9Tal1Va7CpoHVlwX/hGW94E+jqeaM2DfTs0D4dyW/2+4
         jm5bZPE4Q4rRzePBfLDgrcmhEFYipWBRIWmouM2ZcT1/JaWjmLK+7FGD8NrYaSUfb5+8
         +NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SRORy/jxNGUk5NEraICWvT2sGWL870gmeryOxUpsqYM=;
        b=PtivttdlYi0PG6dVNlrB2R0SdmEagsSJ90RdwBUn9A6IOYnw0/EflRm+Oph6gKiBgl
         pJTraFMYr0MTl7vqUjjHkRoTiu4C3SPLG7afMynchYaPKbQYbSjmdwVaEFjSEa4DlOQu
         BROV5g1cckDbMNM4EF3NwzKPAHTdwsZ2YBihJbwQL7+eKGZb6u4N1C6cknSQdY6gvrU3
         k0gHs2bZ9NH95GKtcMunzdn7RZoAy+CJcXrGjBYy3cMYkBr71AEcFitjVNCAnmjotNOG
         hafN8qO6V8KR8dnurBW3xpt+Ld1sKl/RrDFMHysccAsbGs4mJ5zfds9yvgKHggK0yiN+
         xPmA==
X-Gm-Message-State: AGi0Pub9g6yZqyvVjech5EmlABZX7eibsKKDUv1k/G5lWUj3xGwXKbRb
        hvrk4M5hrRJNjSoP8Zi0jsAAjgFzbfWD9uWZXWNnMQ==
X-Google-Smtp-Source: APiQypIdB7RtMtXusxNoGoP2YKrzJf+ZTGr3IFcncIO4Mig1DvRIRaXB5y+uXjqf1BQKyDOw5rGkPpeU5JeHSa+MQRY=
X-Received: by 2002:a05:651c:23b:: with SMTP id z27mr5960293ljn.125.1587037033020;
 Thu, 16 Apr 2020 04:37:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200415082359.22152-1-brgl@bgdev.pl>
In-Reply-To: <20200415082359.22152-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:37:01 +0200
Message-ID: <CACRpkda_3CPy86Xm5TG37cYu6bDzLjeHPkbX_QSet8DUbJBhwQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: improve the robustness of watch/unwatch ioctl()
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 10:24 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This makes the new ioctl() a bit more robust - we now check if a line
> is already being watched and return -EBUSY if the user-space tries to
> start watching it again. Same for unwatch - return -EBUSY if user-space
> tries to unwatch a line that's not being watched.
>
> Fixes: 51c1064e82e7 ("gpiolib: add new ioctl() for monitoring changes in line info")
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I expect that you send me a pull request with some GPIO fixes
when you feel you have some stuff including this I should send
upstream, thanks!

Yours,
Linus Walleij
