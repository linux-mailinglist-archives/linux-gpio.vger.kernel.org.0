Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 500EC11E165
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2019 11:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbfLMKCH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Dec 2019 05:02:07 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37609 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfLMKCH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Dec 2019 05:02:07 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so1515224lfc.4
        for <linux-gpio@vger.kernel.org>; Fri, 13 Dec 2019 02:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DeeOzKe2zAUlwwd/9O8wZ1rslw3HHKZmVIURMw54dFQ=;
        b=bL82nkp/irqcnt8DT9s/V9GdhdGVXmtOo/+OYCbmfKnrtr1Q5jlpbQgn3bGaFwwO4g
         IyjQkkTVUhBb1UgE+ucTKHjbLVCblmGtsTHl3J4uDnI+kqMxu0cSr9BhUt7Fk+vM+5l/
         pQXymgne4f/YU7/1un9jhC7KU4Ud35As0q1oVky7Uz+11DaDGZxns44zAEn28ki9n+h5
         nMgz0K+cO3C/3DNggUpi9ZkZB5HBM7hbO8jxMAX1NNA9I9ONCgCW5S3a/DfQWstd9fIl
         7fLo9QJ9NgwPjAfeq4cXRxRNh5H8uDT0w2tKprYS2Gu38zTuLj1qyyv0KPoJ52AZh2G9
         iy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DeeOzKe2zAUlwwd/9O8wZ1rslw3HHKZmVIURMw54dFQ=;
        b=neDbjhBqOJhX62gWMc0m/k4x2ukCek5hdRyowmkjiUvB6SmKWxAtWwSzLSoPW+XvDE
         7820fYs8MmOALR38dUc91NdwxGMWP5DYR87Pv/SuosW6DoDgreky81PcccjivIldNECP
         kRJn9dMpPSNxL26RjC7cB1sXmAPPM2X8rR2uAUOGiOk8SeSKJPJIL9F2hX1+cCvkFSK0
         d4Lj+d6wJOTccy+2YbSOgQFUlNC7E70r27DgmHIMuXUuafwT2xpqypK0HXBCtACJBGMT
         /A6HfOEPMMPSpTMKJki2hYBLVCAdpPzK5HsluW+V53p/dd7DMjcwrMfiCkmlZ14mhV2D
         IWfg==
X-Gm-Message-State: APjAAAUiE/dvE8CXkb0cccSQz+9mMl+Cs1OHrskcUZDdHee9DcyQD7VF
        Rd50c69elgqTkOVGlSStsf9oyTba9DKEdxTAJzqHDeWTAs4=
X-Google-Smtp-Source: APXvYqzvt6y5QXKBgXOsFmyjaNYHtRlCCZFqjKzajOVWH9mulkFGWrSnp9AF3TDthKvSqlSz5Bgg8eX563u7kyCTR9Q=
X-Received: by 2002:a19:c648:: with SMTP id w69mr8312337lff.44.1576231325495;
 Fri, 13 Dec 2019 02:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20191209122247.GA85209@black.fi.intel.com>
In-Reply-To: <20191209122247.GA85209@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 11:01:54 +0100
Message-ID: <CACRpkdZYhw9tEYmQjZaOLanUrsLzHK-FE=nJtc+GKc0rH88mEg@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.5-2
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 9, 2019 at 1:22 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is material for v5.5-rc2.
>
> There are two fixes for BayTrail and the rest of conversion to pass IRQ chip
> along with GPIO one. The latter is a part 2 of the merge which has been delayed
> to -rc1 for dependency reasons. It has been hanging for few weeks in Linux next.

Pulled into my pinctrl "fixes" branch, thanks!

Yours,
Linus Walleij
