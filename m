Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E881D5FEF
	for <lists+linux-gpio@lfdr.de>; Sat, 16 May 2020 11:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgEPJT4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 May 2020 05:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726202AbgEPJTz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 16 May 2020 05:19:55 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC378C05BD09
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:19:53 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h4so4722858ljg.12
        for <linux-gpio@vger.kernel.org>; Sat, 16 May 2020 02:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dM0BobC3wqwwN5Q62CTiPLWvoTQfJfVxspTP6P93S94=;
        b=pZQK34WNGorGczQnl0DhCAuNv+Ko3oHeoxq97133u78ttw6KkKUz5JG3BdEFjBdl0U
         gOkPnmS+0c4v/Svk8DbaPYwObFHrup4O7Xrk80LncQCwq0TmwDWe1CE+Wk3dq5akGq4C
         H9eYezfkKEx7XSFayQP9jA3ppXkqtnkLz3jy4D18seAYonHNfF52rjyw+LGp7FvSFwvn
         dR1N2wFEI3OrfNOY9vAsesdywjuFrTrgYmXHTB86SHCo1HX7eqJmG/iF7bGi665RxxBl
         E8yURub0SF4yjZsEXNWvTUfil/fmkIbjnrC/jLB2qiQ5WdNqjBr5sEgwue+7YlRpJ0jL
         Q/+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dM0BobC3wqwwN5Q62CTiPLWvoTQfJfVxspTP6P93S94=;
        b=NcNcmgbPu1OL2fg3nWYQc/j9qv9SNiY73jT0if6y+t9jcy1QYjWK7XL8Yj/hurKV5V
         4/4sD6+A4mc7291/V+1ibxz1xJC8/HiSMB2m0fIU6aiyhdHFjGNC0ink19r4fhr5EF4j
         UqXASObQiMVyu1H2qFWbHJ4GcgO3/Fm6tv7/sWfJ2LBJJupgG5afLYvRGAGKLZe92R65
         2ko+WqyaHWXGQzzzXPOLn2ctJYigCk6tmkbx+7Yz7eYDBqZOkXLHvCu2Wb65dbGfDFSB
         dDGJW+KMm3+VHSHvfBvljxxI+9XaerhIE9QvVee9iMNzkNxWCGIyc+QbvfTG5D33xtXY
         oI4w==
X-Gm-Message-State: AOAM531dssHnB2f5u73chfnxowWcMxGr/bcWfmhwd1FiU4szuJn/EdUv
        MqyO5o8F52uZv3NX3VgxXa1+Lmn2goS9du7udrV/dw==
X-Google-Smtp-Source: ABdhPJy0Il41Z0E9+Cc0Hy32EKCZqCdlt5D62mardObqBJZHA2MVu2Tw48zNe8Vs8DJ9kCtTHDIhOCL/MGDsAb7dryM=
X-Received: by 2002:a2e:9d5:: with SMTP id 204mr3708900ljj.168.1589620792399;
 Sat, 16 May 2020 02:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <e973f8f194ce4cb2639121572e8621b5efa5bfbe.1588823152.git.baolin.wang7@gmail.com>
In-Reply-To: <e973f8f194ce4cb2639121572e8621b5efa5bfbe.1588823152.git.baolin.wang7@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 16 May 2020 11:19:41 +0200
Message-ID: <CACRpkdYzZO_PaQu3gZ4SkyF1zWSrC+b5VjJmZfTuSVYgj=CGsA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sprd: Fix the incorrect pull-up definition
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Orson Zhai <orsonzhai@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 7, 2020 at 5:47 AM Baolin Wang <baolin.wang7@gmail.com> wrote:

> The bits of pull up resistor selection were defined mistakenly,
> thus fix them.
>
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>

Patch applied.

Yours,
Linus Walleij
