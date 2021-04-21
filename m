Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558943675F3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Apr 2021 01:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbhDUX4v (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Apr 2021 19:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343794AbhDUX4u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Apr 2021 19:56:50 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3439C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:56:16 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x19so38960348lfa.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Apr 2021 16:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jScCnNgYw+6uXS8RCkV8cOc6vpYKM4nhpFzQC4X8xFk=;
        b=yKDcISw4Xf9Y6DAbYtERNo2KXM8uXDgE5zo/M7c4Sl0Iv59UyI29FxTe2p5hOMIbb3
         up/5xEp8950jm15ieI4xIuG2kU1aaIxapyBeAVSUcLicX2/G80dsENZf7X8uasnniopa
         Z/PpSlL4QVmkaK4sbPIzHdO0BNkynbeY0uUB62C7/e/qPGoU7qKQEtd+pQid0ezxl23G
         77vTvPGogIild+X0Xlp9wxQ8HeIFIaahVsANiZjoqLRPw3TnHiMozXUL72krnvEcOamy
         oZcSCTRqG3hWEqszfRo4Z0ZaDsWSm0vAarrTANYFAxtCesFH+FvP2i7fR8z18sQHbaps
         ykBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jScCnNgYw+6uXS8RCkV8cOc6vpYKM4nhpFzQC4X8xFk=;
        b=ZcXL1lvjJMlz5zOP96c1GlbuV1XCXpm2AakbrXWl7o4f5sBY/EfBztaCFaTFoN/lrV
         0NXPy3d97oxsxecUbvvVdCAqNZP//WVgQ08OY+6eJpxNZNR/Wq3ocbTeU3+sn7yUTNG0
         ky5yIfoyAPX6afBJikt8xOQ2yYfEbBxcCteWi0cS+2BxFNP5FhXOrJtRTqaFydLYtYZ/
         u8pwU98luuTWncBXRutI8aGHpAryTfVh5vUCi+/RxUbA+kD8ip+xsBwCjR+RPnLlm+RE
         s7RTBr2Io5RVjuielMVNUXDk1HuC3/kkPrWqDRPQNRZLM4T7rHXeCwA/nfUaF/A2v7hc
         hseg==
X-Gm-Message-State: AOAM5323hGmu3oa8el+yj4NBgh7u3EOPn24G5F9Inn1zs129KNTApgLb
        HT8sEbg7uMGu+RjcLjvPkZ+geSOBmw6ki4rZ9bB56pSwpkw=
X-Google-Smtp-Source: ABdhPJybEltUhG63+NS74YGYPxZwjzpS4nqORopVa+7OGxpP9OaH5uXEFitYtWUmoQv4AnEQ/yq7qrRaqescIGAUUzk=
X-Received: by 2002:a05:6512:3a85:: with SMTP id q5mr473572lfu.465.1619049375213;
 Wed, 21 Apr 2021 16:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210415123521.86894-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210415123521.86894-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 22 Apr 2021 01:56:04 +0200
Message-ID: <CACRpkdZvLqWp3tozHLpALKojuC6U_fE_4b_eHF9MM3K+0RCzGg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: core: Fix kernel doc string for pin_get_name()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Drew Fustini <drew@beagleboard.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dong Aisheng <dong.aisheng@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 15, 2021 at 2:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The kernel doc string mistakenly advertises the pin_get_name_from_id().
> Fix it, otherwise kernel doc validator is not happy:
>
> .../core.c:168: warning: expecting prototype for pin_get_name_from_id(). Prototype was for pin_get_name() instead
>
> Fixes: dcb5dbc305b9 ("pinctrl: show pin name for pingroups in sysfs")
> Cc: Dong Aisheng <dong.aisheng@linaro.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied, thanks!

Yours,
Linus Walleij
