Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBCCB5E40F
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 14:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbfGCMfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 08:35:36 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44221 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725847AbfGCMff (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 08:35:35 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so1635773lfm.11
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9yjZLyM9JOHe1yZ3T3nibJuov33+lgCxQ34IkJ3YWoQ=;
        b=MBKUEIk7naz4Y3fvvU65OzmlKtCI30NENWTo+afhiNMK5znd4Y1eQOnkDJOcg0aY+v
         ++7it044iEA0/FnqXRy9uVMCF6MR0sNynwBDdD22xtV+hNHMNNgjCEQ7U9rlh2JYeWWM
         ewuMGRi59rNUvNyn7PxpkrglasWGXAJsTnxIqrYGrHBtU2YQ1mcV/erApCDaFvkfJ6DQ
         i31VHZa80MLy32I5VNuyfBI7GYE900zLgxPQbbTlZ40LoCUOyotjP3R5q6l7SryAy4qi
         WQevM0L80vkOVIsX3mZUNJ2TZL463RUKjeI7Cpcgj//LRodNH7QyTRygpFWHsLjxAtqT
         qOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9yjZLyM9JOHe1yZ3T3nibJuov33+lgCxQ34IkJ3YWoQ=;
        b=PmzQLqxGQfUOqV8WqEKU1l9gCHDGrLaa0H+OiG6HIc/n/ogWgXSKDujF+n/dsaCV8o
         9ZJPi4k6rhUQLLyQEs3OmOe9OLmX7eML6pdP839m/+ud3ZO1KCkeYzk+792okwkCsZ/s
         6NugW1i5jQXMgpdVPfLq0patTpEDoxcggeKD143UCw4+ix1mXXnHY235zVa9Zsp9DAvo
         IAihuJgzn3V3nqq4Zb2yn5MwRjPf6leWeAJUs5qwuI9xA2+5U6BOYmJSPEeiUt/G1Pi3
         409v1w9YIxRUh+v6Rze01e9sRII3Upj+8lgNg/2IaCYL31P0Tpwm2slXGXwKJK2N/Of5
         0wPQ==
X-Gm-Message-State: APjAAAVj3AP0wlPfBwZnOXAglt3rDAo6Q4wmpuhpJ3FRQ920gSxsqcGm
        XJ39XSuoi1LVbzl2Hcq2cIk1qfGBGrMI9cK+bVNv1zLG
X-Google-Smtp-Source: APXvYqz7dH1dOhL9GPZ3rezQELsJyZdenNecNAinD3cs2wH7cnyReBlZqciqoJFvA3uBaX6sgLuWduWNDyfTkk2F5yk=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr5964199lfn.165.1562157333469;
 Wed, 03 Jul 2019 05:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <1562146944-4162-1-git-send-email-info@metux.net>
In-Reply-To: <1562146944-4162-1-git-send-email-info@metux.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 3 Jul 2019 14:35:22 +0200
Message-ID: <CACRpkdbtwXYiKOo6LwNm2bQnEMSUoi2UutP4DKXzt=_jOcRkLg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: drop duplicate printing of device name
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 3, 2019 at 11:42 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> From: Enrico Weigelt <info@metux.net>
>
> The dev_info() call already prints the device name, so there's
> no need to explicitly include it in the message for second time.
>
> Signed-off-by: Enrico Weigelt <info@metux.net>

True. Patch applied.

Yours,
Linus Walleij
