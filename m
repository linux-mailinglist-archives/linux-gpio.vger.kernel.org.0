Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E933928EC
	for <lists+linux-gpio@lfdr.de>; Thu, 27 May 2021 09:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233037AbhE0Hxz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 03:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhE0Hxz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 03:53:55 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F95C061574
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 00:52:22 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id b13so5887020ybk.4
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 00:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TxZRqzKFWb1Y87fPfbykTjlJa58FgkaWsZdn9yxxAF0=;
        b=ohKnheeO9lw20HQ8vQ8NSMuPFW2XnralAUzb48mwpRFmdwLE1K2D4EqQEwiE73KzsV
         6BTbQlhXn4wJgjHxP0kNe71rBXGwNtZcxEh4zA9tuscSY5bWAcds/JCsnznhpo1ykApK
         iVpE130RYrNv9hqu0dOflNkZ6P/UyVNRUqBqxKZuUuyAEV37UYZDhPmlObH3A6qiJHJE
         u/72MFH+G0WtEgbp1Dg503GHQqnYnbT2phhjr2mvHgsQOMD00h9FQqfKNQiUEhT7fgVU
         NOtPw0NCxQ1UQ6tEZriSbq//8P5wxxHBQvwYudCQ6JZlM9NkNfKgrydjE0InzohGEggS
         9WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TxZRqzKFWb1Y87fPfbykTjlJa58FgkaWsZdn9yxxAF0=;
        b=A45KthQ76eY5qQyeJJiuj79ej7PTuhkpHxeOk+HmJGPBO/l8IA2o4NSHdGcJCc/RRR
         bdtBhYeR/AdChOKPlvAZUSR9aXFN3DEdkYLgYfutNOJefEdjaMLG6n7S4rlwITrYLP6/
         w+ruVKhH7EKKOCLqzDCCrBtVyn0JIiGPoAhaaehY6lr7C/d+9Cn2hW9cJquwSw6Bvgik
         pWfL6dIXZZ4RTG/dw67IDtyTXtjBQs+4cyqGnpscmoUrJ+E3zixBPnTDHz1E5rsPYlaE
         eu3JFmdD0qO7CI2kmqrO3r1FPpIO2EizUvCmnO3f7wb5kKrbffDcz/nQxSj54mRMSnRf
         LNAg==
X-Gm-Message-State: AOAM531Rw0l53KLlx1zo1WsjEy7zkFDBvI05fd0nYLFkHnE4Ht3IapBT
        Dfn3sne5wQ3oizXNz8NmZcjXE5L9p/KxiUrS/p8wSw==
X-Google-Smtp-Source: ABdhPJzDKzkaBFFlIiYOU0ceXYoE/rWCPdBuXjV6bFmUfbcErknheYcx8XQvj3zkVSPHFDYlXM4aOKDH3Y6t2oztK14=
X-Received: by 2002:a25:6990:: with SMTP id e138mr3012583ybc.0.1622101941734;
 Thu, 27 May 2021 00:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210525165539.25330-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20210525165539.25330-1-srinivas.kandagatla@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 27 May 2021 09:52:11 +0200
Message-ID: <CAMpxmJXipNXMP1qvnPGhzDaBoP1of6XQVO70HGhH6Y9U1JFGUw@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] gpio: wcd934x: Fix shift-out-of-bounds error
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, john.stultz@linaro.org,
        amit.pundir@linaro.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 6:55 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> bit-mask for pins 0 to 4 is BIT(0) to BIT(4) however we ended up with BIT(n - 1)
> which is not right, and this was caught by below usban check
>
> UBSAN: shift-out-of-bounds in drivers/gpio/gpio-wcd934x.c:34:14
>
> Fixes: 59c324683400 ("gpio: wcd934x: Add support to wcd934x gpio controller")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> changes since v1:
>         - removed unnecessary dump stack from log
>
>  drivers/gpio/gpio-wcd934x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-wcd934x.c b/drivers/gpio/gpio-wcd934x.c
> index 1cbce5990855..97e6caedf1f3 100644
> --- a/drivers/gpio/gpio-wcd934x.c
> +++ b/drivers/gpio/gpio-wcd934x.c
> @@ -7,7 +7,7 @@
>  #include <linux/slab.h>
>  #include <linux/of_device.h>
>
> -#define WCD_PIN_MASK(p) BIT(p - 1)
> +#define WCD_PIN_MASK(p) BIT(p)
>  #define WCD_REG_DIR_CTL_OFFSET 0x42
>  #define WCD_REG_VAL_CTL_OFFSET 0x43
>  #define WCD934X_NPINS          5
> --
> 2.21.0
>

Applied, thanks!

Bart
