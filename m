Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698DA1AD4CC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2020 05:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgDQDT6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 23:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726141AbgDQDT5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 23:19:57 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2BBC061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 20:19:57 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h25so496947lja.10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 20:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JD3qiMlHd5EsQciWAFjGX//qBSPNMw64iDNLCTkUKfs=;
        b=TB0a5lNMV5v5AvPFqVnlEKrEDHE3KUNwIu863mg6jZAtMaYxOCT5jFqDFUsawtXPrd
         PGk1bcpvXXW+ocAzG/hBgkVpBg1L2+T8A54vPJbIYfZNHV8gqlITwAkwXGB7xccf16wI
         spIfDfl6B9zF/fYzxhXZ+s25gGsxiEJhLUSus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JD3qiMlHd5EsQciWAFjGX//qBSPNMw64iDNLCTkUKfs=;
        b=h999ZTWvOa+/KIhOdwwZnZqYvyrN8jGcZQNyET6BMy+4FGmDslo2Dcx5BhqpRa+QtJ
         a9oExMeRGZPesMYXrkudbrzP1V4xW7LtfLrU96wm4jUH7x6c+V4Yg0IrUUcCTxTixe4i
         BPlL4TdsCemBnoiY4/XhyG7eFPwX896yiOKkmAmKUrpA8dGM3INRrzXTlpQOXNagwUHa
         Eg1FbyM12ZQh/tUSM7yYoj2Sxg9U0u6Kuao6R9EWFuYt3vXoUw1yV4tlwlgihNDLQQyC
         pTmw6P1N+uR9j9fRdHgpdi6pSWZEWLIlLNbl2fjgOjhJpDsLyIxOiaMd9n97QZkE1JLz
         GpeQ==
X-Gm-Message-State: AGi0Puas8eZf39djkiXHJ5KrNOLlV3GhedGuhdcceFLdUY/YA1Phl1My
        IZ3lBsG6vkp/ofkuJfowu5/4FvxdFoQ=
X-Google-Smtp-Source: APiQypItAVD7cNxcAXx4F7r4W6G/e9ClBrc/wVmZ4Wk3cZguRGDVAhug5XiVOpfLyMAQrGLdc2s2Qw==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr756169ljg.33.1587093595201;
        Thu, 16 Apr 2020 20:19:55 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id y25sm16441984lfy.59.2020.04.16.20.19.54
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2020 20:19:55 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id u15so531361ljd.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 20:19:54 -0700 (PDT)
X-Received: by 2002:a05:651c:208:: with SMTP id y8mr697713ljn.280.1587093593874;
 Thu, 16 Apr 2020 20:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200417030449.10601-1-grace.kao@intel.com>
In-Reply-To: <20200417030449.10601-1-grace.kao@intel.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Thu, 16 Apr 2020 20:19:42 -0700
X-Gmail-Original-Message-ID: <CA+ASDXM7SLqv_9wrkc=+gnv9bLLHBox3O4vvmgwPf1H2qLyL3g@mail.gmail.com>
Message-ID: <CA+ASDXM7SLqv_9wrkc=+gnv9bLLHBox3O4vvmgwPf1H2qLyL3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
To:     Grace Kao <grace.kao@intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

[Regarding subject: this says v2 -- where's v1?]

Hi,

On Thu, Apr 16, 2020 at 8:07 PM Grace Kao <grace.kao@intel.com> wrote:
>
> According to Braswell NDA Specification Update (#557593),
> concurrent read accesses may result in returning 0xffffffff and write
> instructions may be dropped. We have an established format for the
> commit references, i.e.
> cdca06e4e859 ("pinctrl: baytrail: Add missing spinlock usage in
> byt_gpio_irq_handler")
>

Might deserve a Fixes tag and Cc stable:

Fixes: 0bd50d719b00 pinctrl: cherryview: prevent concurrent access to
GPIO controllers
Cc: stable@vger.kernel.org>

> Signed-off-by: Grace Kao <grace.kao@intel.com>

Seems like you should at least give me the reporter credit, if not the
actual authorship, since I did in fact write this patch...

Reported-by: Brian Norris <briannorris@chromium.org>

And since I approve of my own patch:

Reviewed-by: Brian Norris <briannorris@chromium.org>
