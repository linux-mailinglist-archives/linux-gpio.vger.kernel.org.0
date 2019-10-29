Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCD44E8A54
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Oct 2019 15:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbfJ2OLI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Oct 2019 10:11:08 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:39864 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbfJ2OLH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Oct 2019 10:11:07 -0400
Received: by mail-vk1-f193.google.com with SMTP id j84so880651vkj.6
        for <linux-gpio@vger.kernel.org>; Tue, 29 Oct 2019 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qWQITowh2Q0URF8H93GkuN79IW7ti/9RamrrjfoRUVk=;
        b=h7cKfUkNWgcSbLAWYz4BISnFwmYI2VDiKZEN8ZZ7p8Ok5B9kE0GcFk5wg9OhEyRfac
         +uKRRnQaQQOKfcG+eve50vFu7RYt4z3rm0yYeMBRasVXEl8jYRtcOnGImEBJmF9NZ3/h
         knguFIME8HMdDm9vkd7xI1o4lOm80lT2wdyzpIrEQE6GTUBND9fq7u/0gtZ6xlgpW6Jq
         O4aSfkwK96xqCFtznzEnoDyw0A/A5nW5tbOv5coZSd272y0ZBl8Ls+Xykt4DdofuS5lz
         aAZ5B4454m8i+fvRh83Xg52rz9XpNmTe9kqLkotr0NyfKWeU/P83ZBQwJit3di2XrkI0
         aBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qWQITowh2Q0URF8H93GkuN79IW7ti/9RamrrjfoRUVk=;
        b=Y37J3UDbsFDHRIWMwNjfKPI1dgfKnjUFtXQc/bNwBws8rDZ8zK69vpsrpxWuv4+c58
         wA7HZiU+xij7Ib56q6/uOk6jDnoyWUFtiUMC3tp/wNURN59zZ1SLrXMSShylKbLlDoAR
         FZgJmQ1jkUN7Qg4kb20Pttqd340vH9huSt4lOT6JLT8QadMtuKMjuLoQuhJSeNdkt+mj
         8j6YCS5cDdlzO6ONX+HyLQq3QxPt1g3eSjxMQd/lqLHFa7uVVPyUdNZcosbUlQQ+kJIM
         DWywA6xzfu3McaqWTjN1mzJ4Gfmf4JATLItSHZKsiqXRPjVeSiFL08gptp5vWxGyKXhO
         FCUA==
X-Gm-Message-State: APjAAAUMKVfM++tnUusG16Psub5WganIUQ563ZG66VaTkV5e/7y6+pU+
        P2Kr+sLCbfh28WcMQLKiUg12aiPTYEtJen8fiSF+jA==
X-Google-Smtp-Source: APXvYqyvtEDKet+g1asc4zUlmseGUxMCp1V2qq86jFU4KX0I6BOVylj6yFCCT+WvVq59xqCrit+FjGjmAUi3kzfzjVk=
X-Received: by 2002:a1f:7d84:: with SMTP id y126mr11721367vkc.99.1572358266851;
 Tue, 29 Oct 2019 07:11:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191021064413.19840-1-manivannan.sadhasivam@linaro.org> <20191021064413.19840-2-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20191021064413.19840-2-manivannan.sadhasivam@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Oct 2019 15:10:55 +0100
Message-ID: <CACRpkdYNB9RR2+u-yCPeyiKc56NTcSnkDZpvOz5gxXSSgjKbHA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: gpio: Add devicetree binding for RDA
 Micro GPIO controller
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-unisoc@lists.infradead.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 21, 2019 at 8:44 AM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:

> Add YAML devicetree binding for RDA Micro GPIO controller.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Patch applied.

Yours,
Linus Walleij
