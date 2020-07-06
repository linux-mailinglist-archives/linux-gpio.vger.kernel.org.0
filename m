Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD953215640
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728881AbgGFLVa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 07:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbgGFLVa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 07:21:30 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C608DC061794
        for <linux-gpio@vger.kernel.org>; Mon,  6 Jul 2020 04:21:29 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id dm12so16968803qvb.9
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jul 2020 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaKkoa6OtK9ushlhbRsOllZl1SkbmcFyigdDIq8+K+E=;
        b=KFKjgcxGJuWiNXupkKc/WX+BRn9eaPo70uMCjtxoRwexDUqyKLPR74ag+pyo2iHje0
         fWce7QcRP/v0WSiBq2IGXHYY069VP7xOrsRtEFB/lqWESZ2JruZ5NfI8nkTw+9rxJBhT
         O4WbVRTd40L4Gk8K67XZ6YpvWv+7OE/aSdrMoDYvvjPf12jW690Wx3eJscAg4bBqmG45
         8b7vuh3Zql+rrZ7jgLMzJqZUghlcg1Ij2VJNrxch1PGF+q9099PPddonHkIhYWbM4MXB
         Gle3lOnMaPrTAMZ1r5+RlaX8/GRDOVigZj0gn+PU6z1ykVa5L9TPh+1vrnAT5Xl3bOKs
         qBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaKkoa6OtK9ushlhbRsOllZl1SkbmcFyigdDIq8+K+E=;
        b=aOfrifVzwBDdNnxNIhPlIYG2STJYfRsCjwnrP6ob5aU/CPlmGe4Oh6LhzaWg6kTUv1
         C3QHBv2I6V3VXpXxdHcCxFcla8cnPeqqQn40HxS9syDEzUSnF0FbCdE4JxxcXHI5tIew
         MvfaH0orMnwb38oKMfDACDksisn1qC7dkf/MDexhrTJpOFGILtcloi9LYoDjYd8BldOo
         4D/DaMMV+Vf9DvV/J1aeCQ5eDDAaHeVbjt0mP7U3OMvRNVi2JxZMpbBNxy+fisAYsLol
         AaMkIiFw2FS1iS1QWuVurfS0yaV8AydtMcdR1MVtqjM2p+AR48a9GdnzOZQLgVmR4eeN
         RtuA==
X-Gm-Message-State: AOAM530BOnjfpfEDNu6Dpq7yqFC58G7LeNzazcey/1AuYLD61aneJYOu
        fpvLLUIamKnkCPlvrOLiEmcPv9MNtIf7da21tURN1w==
X-Google-Smtp-Source: ABdhPJxqWzMYBXqxw8sg+ZtpjtUqR1PP8k45Y3HIpLFVvj/kkrM2AKCZmXiSz8xgHwLvqXWQCktiertkhyBS6Fl3sEY=
X-Received: by 2002:a05:6214:72c:: with SMTP id c12mr43869344qvz.76.1594034488967;
 Mon, 06 Jul 2020 04:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200705133038.161547-1-mans0n@gorani.run>
In-Reply-To: <20200705133038.161547-1-mans0n@gorani.run>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 6 Jul 2020 13:21:18 +0200
Message-ID: <CAMpxmJUxGq3_R7BRGv68ApeNC+g9PDm_kBd0r=8TjFSyTNxFWg@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] gpio: add GPO driver for PCA9570
To:     Sungbo Eo <mans0n@gorani.run>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 5, 2020 at 3:31 PM Sungbo Eo <mans0n@gorani.run> wrote:
>
> NXP PCA9570 is a 4-bit I2C GPO expander without interrupt functionality.
> Its ports are controlled only by a data byte without register address.
>
> Datasheet: https://www.nxp.com/docs/en/data-sheet/PCA9570.pdf
>
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> ---
> v5:
> * amended the commit message
> * removed unnecessary castings
> * added data to of_match_table
>
> v4:
> * removed ->direction_input() and ->direction_output()
>   (Seems unnecessary to me)
> * removed ->set_multiple()
>   (I'm not sure this implementation is really correct)
> * added ->get()
>   (DS says we can read the status from the device)
> * read current status during probe
>
> v3:
> * remove mutex
> * rename buffer to out
> * simplify return statements
> * replace ->probe() to ->probe_new()
> * move ngpio to driver_data
>   (PCA9571 is 8-bit so I thought making ngpio configurable is a good idea)

This driver looks nice now but why did you remove the mutex in v3? I
think when Andy commented on that, he meant not understanding why the
error check is protected, not the i2c operations.

Are you sure you don't need this lock?

Bartosz
