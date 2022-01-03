Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B24EA482FC5
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jan 2022 11:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232586AbiACKHC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jan 2022 05:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbiACKHC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Jan 2022 05:07:02 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B325CC061785
        for <linux-gpio@vger.kernel.org>; Mon,  3 Jan 2022 02:07:01 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id z9so64029302edm.10
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jan 2022 02:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HDDNrbo94yGf/mFPUSwm53ZPq2DtpQ/AKgaZuhvvG3E=;
        b=uDZejrRMI89xz8mKDplRD8+MVXUW3LjgL0hyxTBzUazxljJmOZBruVG81LZdhMVGWL
         bEJbh3791y8SEiOtnJd+rN5rtbJ5bR9huauO3s8vN5HoKNyAb5Ef2DCwCDFEmb0Kl40/
         Z5RwO0I5MV6Fa5I8rbm0VfogoOJWWy0sE4YBhl954dEhj6cQbGKA55tSV+ht3G8oSOpu
         8ZucOpJuro6X9/9zY8erAKIIYoBVT0agTTfCZLqWlLqFs8UPnf12iBQQJoQmU62vTwgH
         Q+XC6JthkDC4QEO7ZQUrUPZyM/WsNiQHmMS6j9a4Xtv8QxHJzDBMCaTGewIwrZnqQSh9
         gZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HDDNrbo94yGf/mFPUSwm53ZPq2DtpQ/AKgaZuhvvG3E=;
        b=xwiT7D41BPi3MbTE5v7b3AGlB1KVnfq2hfhN725lE67qCqOllKKQClV8n1ySYyK20v
         X5km42ZJ35Ie8b6+wFlRv8bX3gmlqyZJjNmtLtg/e0V6gwLnjY90KEQgYl96spO4SmhE
         QrJsUnosotJcN4R3RtqdliBe420ks5B+6xIE0lJKnVJwsFj5op1wJ2NPaconaFa1ggVy
         d9FlH6+/ZTN+WWF6VLICgwOg3QBL2OMBQi2HX0lwEjyZ02Remrn/z139k+Khlj4+xbUu
         seMzE19HOWa0f2wk8pfqdhAIkL8PT20FqnSQsI6a6FKVSl7eH5v/vlDvAD94oTCPUYq6
         PmgA==
X-Gm-Message-State: AOAM533bwUWC6+bPb7Z7W1G9gqe1UdRGJNMBf8sRdjUV7jyl8mz2WiPu
        pASLMwqbbcHDMTO+ymJ/JzRaPXIS1Tf/LB5RIFxwDg==
X-Google-Smtp-Source: ABdhPJxSo0bFqOkD1JphB5Ji1q1GKjtA/igTEwlGcc4AoWZL9cWg+AN1uhSA2irsbSx/M7ObRkZLjJZTp3a9i2hMJ/Q=
X-Received: by 2002:aa7:dd59:: with SMTP id o25mr43212393edw.288.1641204420348;
 Mon, 03 Jan 2022 02:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20211223103809.12343-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211223103809.12343-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 3 Jan 2022 11:06:49 +0100
Message-ID: <CAMRc=McKS5CM-9ioQGVkEn4Oct6uxAiNKAm-y6S4FBOU3WDtVg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: acpi: make fwnode take precedence in
 struct gpio_chip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Dec 23, 2021 at 11:38 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> If the driver sets the fwnode in struct gpio_chip, let it take
> precedence over the parent's fwnode.
>
> This is a follow up to the commit 9126a738edc1 ("gpiolib: of: make
> fwnode take precedence in struct gpio_chip").
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
