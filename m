Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D6F3A11FD
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jun 2021 13:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhFILFr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Jun 2021 07:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbhFILFq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jun 2021 07:05:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1755CC061574
        for <linux-gpio@vger.kernel.org>; Wed,  9 Jun 2021 04:03:52 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id r16so11930767ljk.9
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jun 2021 04:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=23PqY84rDFFzN+EMu16ee7QwSRCxxfHf3R/X1VjnsbQ=;
        b=dPSsyoT6h5ACD+Ry7t5A6zJRX8JXkimdLmOH1m9jgClXYc/lVbOREkyOVdA5ng8WA4
         7S3bqvVnuwy4cBQxGqs3+L7Z2rMmWsIIvq9LPJbOJ9LSlw6cXwUo9AgBL0uAkpSgFl8r
         KSHcYab/tKqNA3XUO7HhsWg/dIdhKRjH7nOoVPKJMKGz4orglrSjffDAjUFXdvUpXU/X
         CM3lOa27osR1EEsDdkhWGViHiDULPNrR4+WSQy5CkTZQQNsvH+ptIJYj9A43NZxhiW4w
         idtEqqNshZbPt/8cz+6EzrfLiIXuFUtF2ZH7dKWAme77gwdwcCyQmGlcHCIIQPkjYp0c
         f3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=23PqY84rDFFzN+EMu16ee7QwSRCxxfHf3R/X1VjnsbQ=;
        b=rzO4zVcbQ1rAHIRnHo3g+FgXa7INheuio3JA1xf7LRH7EygCGv3ADwEJcIuL1QOhCG
         vEeIiw/LSJkoMHktV59IOPF0Am70R2DmPOYXC9fQ4L9gqXMpBEOPYtNkPDKYumE5Q3kR
         gW9hOxPVEz4F4DkomL3YqawP5GpkwOfc1BP64u6VRJLAARO812/zI6Sa7hbqJBSkbpL2
         FuGaYpCz1kUY7c/qxd3QiiRQarDUZv8PBrWwuGD3AZl+j686I95SEvZk9JJ6tPC/TK6L
         zKFvv61GIE6qtbOvnl/YvuR5XHDNhA2kPU5vs0+DJtKTW9ZlziUuBitsrkWa3qgfB+JL
         zptg==
X-Gm-Message-State: AOAM53091uKFRS2U1UflS2R7s6S91kc4D7K1HURk1aYVpSI6sFtL5Csu
        rgPl+qjy9arW2zXNJ0AP4DyENbM2QXztEThEG34ghzlyslk=
X-Google-Smtp-Source: ABdhPJz1IX2dpJORjsIr/rfCS9Sl1rGp7i6MXqStEHBFZTMJGpFKAEimR2OYbzDukVAJT6XcENx1ZF4L24Pq7mIXjcE=
X-Received: by 2002:a2e:7811:: with SMTP id t17mr12291345ljc.368.1623236630398;
 Wed, 09 Jun 2021 04:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <YL4whsUj4M3av46e@black.fi.intel.com>
In-Reply-To: <YL4whsUj4M3av46e@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Jun 2021 13:03:39 +0200
Message-ID: <CACRpkdbwNAOyv0E2Bb1GKjxGN82Ory-0Kbi2EofUgC_HqEEJBQ@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.14-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 7, 2021 at 4:42 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Really quiet cycle this time. While it's for v5.14, feel free to apply for
> current since it's only ID patch.

Pulled in to the devel branch!

Yours,
Linus Walleij
