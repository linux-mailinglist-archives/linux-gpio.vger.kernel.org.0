Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3762B70E2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 22:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgKQVYu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 16:24:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQVYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 16:24:50 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D024AC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:24:49 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id z21so32151464lfe.12
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 13:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CCjg31bi/GLvzCxoxBuZ3qp5qKRl2rI71Ek5qyNimVo=;
        b=ZF9g5omcgAFQvq3bdSPEi13PPH25c5ybsUJmIcEgEJWFXZx1bFIn1dAUIPLGLekrTf
         jVq11lGqY+RwODrQB1IwzRt5OqFEdg8FK4Z5vi4nZu31P0WEunJuWQNaAtCsPgD1Wqvl
         5jBcgHvMlzvbNDbZl/NZE9VThIf1ft1TAdJBZzlzSWiEX4L3cb+hdhd+anzyJ/BVSvkK
         HB3nR0HZ5ZkbyjnHcFWbI9ndA/ku9Mo8l1HcPwhphgR2yhx8pIHQ04BIV49sgrigl9ml
         3CguMe4dl4PgzN0qc8IsbUnxGiia3nuHdqm7OLL2v/DcBfWKgn5QMv7/9ex45oWA/wc1
         8twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CCjg31bi/GLvzCxoxBuZ3qp5qKRl2rI71Ek5qyNimVo=;
        b=Gbvm4vnAcuracMKNJQL4eTZzYWtL/UgC/k8Q4upOnLdKjwclSqdUcjBZE445VeO2kI
         uWwfigYQrnjMp0/EnCmRnCZGU6PbuBm9ScNTdXVdv65mIfoZMnXkjJpZDMscd+kAccEK
         Z/9WH+gpdsA0JlEL1Xr6X5gmeEyjlVIndT0bhpw6y3ElOXkHFutjFZq4+HFIoana1Qbh
         Ytb969qSzo/QbkilrtSkDAgJ2vGKD7mlUmYA1oDfejixxTBUy0a9YtIZBHxvBKIYQ+W4
         f82niyafBkYXEHKBVNhSwJX01rkJ9NbWTenplGk7dutH+mKvdC7UCgl97Gjj3rotHu2c
         Swuw==
X-Gm-Message-State: AOAM533T8bPS5bqFQiK6Vv47Vz7SSA4T/Dqcn3iqA77KJrnhdw3qYJD9
        /jD3e8V1QYothtW9pwc8mQmssVmLsiAG6N6/zvNzRw==
X-Google-Smtp-Source: ABdhPJzHN7JfhVYFyd7qRHlRFbfP2xmN1Nvk2pgmzVe7k2jK31LECAFP5by3VxaAH7Rc4fb/3CwFfY0TpPxspzcOUfU=
X-Received: by 2002:a19:7b06:: with SMTP id w6mr2631071lfc.260.1605648288355;
 Tue, 17 Nov 2020 13:24:48 -0800 (PST)
MIME-Version: 1.0
References: <20201116152625.GA20187@black.fi.intel.com>
In-Reply-To: <20201116152625.GA20187@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Nov 2020 22:24:37 +0100
Message-ID: <CACRpkdbgO++4scNqX=3D0XKSyUhah67UvMjHDbaT4SyX0ESF-A@mail.gmail.com>
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

On Mon, Nov 16, 2020 at 4:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The following changes since commit b72de3ff19fdc4bbe4d4bb3f4483c7e46e00bac3:
>
>   gpio: sifive: Fix SiFive gpio probe (2020-11-11 09:53:09 +0100)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v5.11-1
>
> for you to fetch changes up to e709a7b5a066362b697d65dda90edc71f913df70:
>
>   gpiolib: acpi: Make Intel GPIO tree official for GPIO ACPI work (2020-11-16 14:14:35 +0200)

Thanks! I merged in v5.10-rc4 to the GPIO devel branch and
pulled in this on top, works like a charm!

Yours,
Linus Walleij
