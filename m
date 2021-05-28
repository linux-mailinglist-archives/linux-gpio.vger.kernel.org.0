Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E3C3943F1
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 16:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235542AbhE1ORw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 May 2021 10:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235422AbhE1ORv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 May 2021 10:17:51 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3883CC06174A
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 07:16:15 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id r8so5684476ybb.9
        for <linux-gpio@vger.kernel.org>; Fri, 28 May 2021 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=564lIXJmUSRyPqFJlY/VG6GLWxzT7sFnElx9pZNWZ0Y=;
        b=kZjxD/XLUKAJRsFR10qsGWga9yCHiM4caQusEIzywLJTQitKx8CFvgxazYA1OLoNpg
         oIaYOM6TTkwQM6Cy2d/QLqr3U/4ITdRqLUFLcwI+TlHNcHAjcpL2fZIz4bOlZt8Qie8n
         BkzfIVvkdvRrQBA4/0NqtpreoZPyhu7tiIOtnIggj7SqB7GH2WixMVX6HRTN3Q+1ETpD
         c7aTzgqqXJpPtE1p1ip11rFy8ea7iVe8oMKEB3Ev6jY2FMtlM3D4zjoZREUXsfLRBtzE
         bt8dRM12FUnBrJcJ4IhH+/pLMd5nMHUB60072JduXiOcOh61hrzOIj47vXamyCw+OmNL
         g3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=564lIXJmUSRyPqFJlY/VG6GLWxzT7sFnElx9pZNWZ0Y=;
        b=lhN2VvsXLAe9xBdC3PY2pjloXJQpvaUKVMXUr5laJYF28a4FgHIIcFaUYxHC+JjJ2T
         2EIU9cdxSPJ5VIKO/BeFoPsCuTfKpUMiN39JernzOycYt6hKMad0VL8+EmgfwA4Y2lPW
         NsTfHyc3ex4fLJK0aom8C8DPYaA0EFTbr/qEeFlfafi4Ea232dF4DGlS+Cuip12zObQ3
         +vmTo/wHI5tQyLH2AroBqUxDXHadSfgAIgier7s8dy/c9ZycwlDMqpLrNhPA1iL+18e2
         Zb24uoARYxOUMQiCCwngwTqr9cRGkZ6GfXBEvnazHk583ouqkgO0Bn/oN2yhuEDW9lb/
         qAiw==
X-Gm-Message-State: AOAM530qe+Ehh1C9jjR8q/pVytZ4S4W/GbDLwJZJuGachy0qqLl96Ex/
        6nfEpRh4tM/V2DL5bYWRAHgWOeAL9Jq5TETnobrG1A==
X-Google-Smtp-Source: ABdhPJyRxTidvS3VVFRjXDKd6um96n906eUKfbj5uB0G7ztaJaiaUTpOwq09iDR67FWrBoMTISAeLrycHfkgDWcqyZY=
X-Received: by 2002:a25:8804:: with SMTP id c4mr12800276ybl.469.1622211374439;
 Fri, 28 May 2021 07:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210525183518.63149-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210525183518.63149-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 28 May 2021 16:16:03 +0200
Message-ID: <CAMpxmJWgNFFvUnanQXgffcp_+JXb2OGFH=vjK7H9nB+qOGfxFA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] gpiolib: Split fastpath array to two
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 8:35 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Split fastpath array to two, i.e. for mask and for bits.
> At the same time declare them as bitmaps.
>
> This makes code better to read and gives a clue about use of
> bitmap API.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Applied, thanks!

Bart
