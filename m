Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D65CC586F0
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 18:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfF0QYM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 Jun 2019 12:24:12 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40061 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfF0QYM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Jun 2019 12:24:12 -0400
Received: by mail-lf1-f66.google.com with SMTP id a9so1998096lff.7
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2019 09:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsg3pPE+uXiZ5ZNCGEU2wdrfwl4xwio0el8LVm2oV2s=;
        b=WVKjIdw/dgf1dso4fBZl0ThyjkVlIMS5F2sm1VEDvP1oh2BW0VJ6XO6ASYZJZx3v5L
         fJdJOW/DNYDFdS1L9x3QMf5sTfgIeh5pFCQIaFmRb7k2qcKLNRLxSEORfhEqQUfcW0on
         F8pQy19sDli3pQgl6TbDlbQUIhzPgqc+QkCXbmP0u3n+tg64lqkRV10z1tBUV4jXiYy8
         xIv+1Gi2W2dQbGR2cIPbi4qjLIYoH0Vp7Y8gmjtg5WK9pkRqmhsX8UvppJqx/+rp7V7N
         bIJFr0S9QJ+BNaH3717YgTeDo8PgWFR+JbtSpf/zsT0N4YfhSJzCAxXrmETa1pnKAjhx
         qMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsg3pPE+uXiZ5ZNCGEU2wdrfwl4xwio0el8LVm2oV2s=;
        b=in/CCAxEzXX4LW3Oeodgaw5hQQulxMeLHiL+ivTWXVPaRY2Zzh8d4FQgzcr+KpiVCm
         qemXOALAlx+ub1sFN8wUvhUAKsC/8BV92GwERbe2ImBGZEzWKrbIBO+Ah+iTAvE298jm
         OaP+4pUdIq0shux+p/uZGBzo7Ky6xxOnPl1MkFkUAgKw6vO3nnnj3BEtXCZU3Pv5EiFY
         9lOJ/g3TnDRNA1TU0YO1t7KkEk6fHCXBLmSsCnxiBp8SWBb+TqnUbAOMuOAtjzJAbB0z
         3YOiomvwLHNKtT4lersmeE16Bssypl+jyDTAcwJLSu0eQOK+FRikuHG1YTPsqvblxOOT
         oRKA==
X-Gm-Message-State: APjAAAWhOwtgeQ5/SaLUt+UNUcGfLtCkLYbmwy29sTO+mQCNzrg731bE
        BG843OAyH0Ad4wMhI9qxJ+Y8tF6L1nlzK/MIsg3n3Q==
X-Google-Smtp-Source: APXvYqzh9dnLvBZXwLXXwV2I7+/Ounq1rO197XdGA2+phLYpCKNBuLLJbMH74PA9VEBoAVnuZnTc1a5ICS5GsxHJpMw=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr2433593lfn.165.1561652650378;
 Thu, 27 Jun 2019 09:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190627144501.11063-1-brgl@bgdev.pl>
In-Reply-To: <20190627144501.11063-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 Jun 2019 17:23:57 +0100
Message-ID: <CACRpkda8rBs6PNXfD7F2MdczqhL6goWe9gem2j9FO8VuWiWqVg@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.3
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 27, 2019 at 3:45 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Hi Linus,
>
> please pull the following patches I have in my tree for v5.3.
>
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
>
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-v5.3-updates-for-linus
>
> for you to fetch changes up to f360dcd4ef7fbaec774a64c54b402b4c8a4cffb2:
>
>   gpio: mockup: no need to check return value of debugfs_create functions (2019-06-27 15:54:19 +0200)

Pulled into my "devel" branch and pushed to the build servers!

Thanks!
Linus Walleij
