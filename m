Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8E42AD75B
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Nov 2020 14:20:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730254AbgKJNUF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Nov 2020 08:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728478AbgKJNUE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Nov 2020 08:20:04 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D0EC0613D1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:20:04 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id f11so11190004lfs.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2020 05:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jUc4FROYQtgj3f48EMA2Q35Aoeo6A9Bg4v3Z3azlYbc=;
        b=LKt4KC1Go1Oj5oFXT7AoL8a0nJJznQOtDGScKZujsj5OVIh3fowX7tMSGQHrxnbSUd
         WXh3jubqa5756OKJWf22Psf+4OBUSn3C+75Lh8mhGsHFpri0DHyNwbmpQyOelpARznUL
         z232JG/w47Fy8BxqUKJjlH6796bjpyJwm4a44unW5XPEdLO3Y+0LyIeMazu1bYzh0voK
         oQtCHeRdZ8pLSqErf6QS//DnrCdlkB9YXROmZIj9xS4pQGYUGosiiAiVN1OIeWdTBgH5
         bK5JUz4BvJOx8Ygoen9/YVoc7S9fG0sGxlvuYB+ADxUmRP6/qc2Fn0vbZyQD2QgJqtpc
         AlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jUc4FROYQtgj3f48EMA2Q35Aoeo6A9Bg4v3Z3azlYbc=;
        b=rGUUChZKPb+rNfIuezapmyOj1DrVv8BZR0lmm7siBAffJhLU0Ol6x/LE/IeuvJwKby
         UxFq+D9IR4o0+UvIv7ssIit9z6osfGlwXge97BMaDpdIuO0nU2v3qMT+EAXeKRTDe3EP
         zGST3dXPxb/yR6TheF5e0WwbUSISJOllc9WBJ/CB8OHnYaNTXZcfQGIS/fJbnr6VFknr
         467nztfer9VrnRrRwODy2B/YMDODTepZbfOkaNlqjsgew5P8Mrpp7jlBuaV0s7Re6JVV
         ZOr4cTEjYUJYQOdNY5iAIEqsC5Y+qmDqmE4DiQupQ4p/IVTlcw8luskElVccsfdEQnjP
         9hDA==
X-Gm-Message-State: AOAM531aEKL4uQ7Zt4i/QoKmC8T33NDAAmyB0SRGc9LI+JrkiLIC07yY
        JKosfWf1mn4NoDuQaE6aPJx49aSS3rqLAoW1Sqzizw==
X-Google-Smtp-Source: ABdhPJxpyPHQTFP6VP4fU3ofkUDZvR/pdH5VIYTxgPIqiFsFP+wncHwniiJUcsuE+hGmM5FmhF4yAu1OFJ20oB1R8W4=
X-Received: by 2002:a19:f00b:: with SMTP id p11mr7179710lfc.585.1605014402796;
 Tue, 10 Nov 2020 05:20:02 -0800 (PST)
MIME-Version: 1.0
References: <20201105231912.69527-1-coiby.xu@gmail.com> <20201105231912.69527-3-coiby.xu@gmail.com>
In-Reply-To: <20201105231912.69527-3-coiby.xu@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Nov 2020 14:19:52 +0100
Message-ID: <CACRpkdZRwkhk_Bh0ua7sbq0emRRjTRkHwJWE8EMk9JwdPB8kUg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] pinctrl: amd: use higher precision for 512 RtcClk
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 6, 2020 at 12:19 AM Coiby Xu <coiby.xu@gmail.com> wrote:

> RTC is 32.768kHz thus 512 RtcClk equals 15625 usec. The documentation
> likely has dropped precision and that's why the driver mistakenly took
> the slightly deviated value.
>
> Reported-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Link: https://lore.kernel.org/linux-gpio/2f4706a1-502f-75f0-9596-cc25b4933b6c@redhat.com/
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

This patch applied for fixes and tagged for stable.

Yours,
Linus Walleij
