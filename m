Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359552DA3E7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Dec 2020 00:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441119AbgLNXAg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 18:00:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441382AbgLNXA2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 18:00:28 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5753DC06179C
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 14:59:48 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id x20so14920527lfe.12
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2020 14:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=djP1cIFGNKx6l7Nlgqp0ZKpNw9S9LD7jiI9PWcz6Kdc=;
        b=PJ4d01FMMdIJ9wg0E4hURfNRev8clAPOyiEAqeNtjwnCs9SMUclB7HE+PeDMfVS6KD
         ogUCRGVFoWbjgJ+2jqSx6ejWfd/8nZ0gtWqhURGQHxmmVnHSwwUwNyi21T51wB6y6AVN
         LdO3C2t2yU6PNkEYMtnyJIiOMyf3qNICAF3izYyXRPbjxc5dpy9eLsFrppg2He+omQ6p
         d2SSE4Wk9xV2SDNzoKGIPBGSFdmIfG/E8s+VP/Syi00KdAJK57YDAxW3iHAu9OMpwEYc
         /rsqWI1zn5Qa0w4r+cbSeGay2GYdOvL6LnqObA/p2pqLqUUFgFYnncu8NrijpItmqVUX
         u5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=djP1cIFGNKx6l7Nlgqp0ZKpNw9S9LD7jiI9PWcz6Kdc=;
        b=H9t4+sCAh+Sz15CvwMOri0o5BVZo57B1+NmhHMJguuMzVb0DJpk7VI2dlOn7uWLUFC
         8K5F+cWtpEcfKQed9nzQqKMcDXaY1QlwPiX0znJ9jK8jj2Of5QlsxsPTD1eijuwhBA0f
         RD2LDWwlWKEnCVjottxrtJbnkdOcAI8nfG98gKXUb0c/Y0viGe6DHBEJIx2412k2AB9V
         FZI4PSV7LixMGH3TlBZjOWy7QWyAac+Bu4cErEOU7wayLbEJXnoNv8ZxfnTSyzE5bBJY
         OKmnsV0Gk32uXOrgiO8Hvwh6v6rE8VQLU9shmF336jjxKPFVioFFZOm0l+BPolE4mjCI
         wQ4A==
X-Gm-Message-State: AOAM531nWZOCSdx3aca3mgtPJ7V6qlmkLw2D+ZxTEGpB71t5k4g2vsev
        y2y6LDaV2c3SIbq7hJfDnBziySoJM1MrbkH2AzUl0A==
X-Google-Smtp-Source: ABdhPJyPZCaZYrTOX3XXkA3mrXLWyVqJ2GqQy9M0v+4KhyopHggdMWf8J1pDw8TGf+FeZZSaeHNreW8yMvZ6Da81Dfw=
X-Received: by 2002:a05:651c:1312:: with SMTP id u18mr10565874lja.200.1607986786869;
 Mon, 14 Dec 2020 14:59:46 -0800 (PST)
MIME-Version: 1.0
References: <20201214165524.43843-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20201214165524.43843-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 14 Dec 2020 23:59:36 +0100
Message-ID: <CACRpkdY8xEK+Z6q6LiFt43qThutUx7-niFjGL+FA9RLymZ-XBg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpio: hisi: Do not require ACPI for COMPILE_TEST
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Luo Jiaxing <luojiaxing@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 14, 2020 at 5:55 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Make it clear that ACPI needs to be present only to get driver functional.
> It is not required for compilation.
>
> Fixes: 356b01a986a5 ("gpio: gpio-hisi: Add HiSilicon GPIO support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Both patches applied!
Thanks!

Yours,
Linus Walleij
