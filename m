Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CED22D949C
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 10:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729470AbgLNJMU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 04:12:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439583AbgLNJMT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 04:12:19 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F919C061793
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:11:36 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id x20so8744986lfe.12
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 01:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0T9WuDxp4z8u+0X1QQpYrnt9KBMRop6VWIdv68zxuXc=;
        b=IlIFBkppYMjUl1XpaV5iPaW7+eiJ4CFXLDYkHeu37m0vBaYK96CzYXYWbGTPLbJalY
         NLYgKscnaadGdCH+92ik3vRpwhv+kiCmg8NlW5j91yn0IHwYcWBE+X0RTYyQDJK09tAd
         zQlLYYMV449wpuAGIbVS/GceU1rLk16Fzi4U8UZNy2NQxof1kfbB9fDeJ8G6Vokvf939
         r6JKiHGno8tlrkK0viEEpz47MUf44cfyGjGcrJ1QDqDagyuqZY4ZE5XwjrfI2vZO1ZXl
         yf+j8XyHd7VCZpJLWRYlIBzvhKh9Ly7kQk45wg4/K2vItvGCwtT8GxobRDezOgY/BpDR
         Y4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0T9WuDxp4z8u+0X1QQpYrnt9KBMRop6VWIdv68zxuXc=;
        b=eIE/MQfvsJJRwwCB6wYa/HKagvl1GiujhYkAqdMd64lrL2i0ciVMySb/pMA5eAvSBN
         tdf4kpdA1HmyfxrjY5Cidqc0/QTdxtGNOha4HFGO6ZvlM6VDvGB20mg61wxQrRojDIVz
         iCm4T4pEx67916NkKuS0DWV3JIYgYw7oQy58IaUnAAlYTD3H5NDgHkpUTHXA/3BHJvpF
         lpFqe9LYIuKI6tIUxnFmgi8N/HqEWqC8yziSNeX4O27PEI3Z/mVu0Y2XtAmz1uPuNdsg
         6ZZRnOgYTQfYh9u++IHCSPS1x9DlqCew52426nNntJ/8kFCo0hEoKfMU6JsAkorkD01F
         QKog==
X-Gm-Message-State: AOAM531TkiKtJ1zC8/5fenIqIAPHC2FuGWIH4eMUy0ftYyp5JGEbPfho
        jQNaf/udj5gRRo6KLK0aYH89VhKuaLXhFENm07njiA==
X-Google-Smtp-Source: ABdhPJyxQ3ffqkK33uY3yPRoji9ZoPBl768Fl/wI2N724wAfLP8TLBjqVoNei97I1ZrYQ5/AJgpxZWycpGG1aXvrjUk=
X-Received: by 2002:a05:6512:74e:: with SMTP id c14mr9696933lfs.529.1607937095063;
 Mon, 14 Dec 2020 01:11:35 -0800 (PST)
MIME-Version: 1.0
References: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com> <1607934255-52544-2-git-send-email-luojiaxing@huawei.com>
In-Reply-To: <1607934255-52544-2-git-send-email-luojiaxing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 10:11:23 +0100
Message-ID: <CACRpkdZSQSCO3dWcjUZtUMDK+Jjdnc9ORxpR9qiopgMk-o=Ryg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
To:     Luo Jiaxing <luojiaxing@huawei.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        John Garry <john.garry@huawei.com>,
        Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 9:24 AM Luo Jiaxing <luojiaxing@huawei.com> wrote:

> This GPIO driver is for HiSilicon's ARM SoC.

Patch applied, any further issues can certainly be fixed in-tree.
Thanks for your excellent work on this driver!

Yours,
Linus Walleij
