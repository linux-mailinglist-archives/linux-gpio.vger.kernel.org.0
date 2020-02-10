Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD3551573B7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Feb 2020 12:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgBJLwm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Feb 2020 06:52:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33166 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgBJLwl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Feb 2020 06:52:41 -0500
Received: by mail-lf1-f66.google.com with SMTP id n25so4000823lfl.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Feb 2020 03:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6TSUn8xPcd6H5fjophC7T+z3GxaUtEa64TR/ndAUqog=;
        b=EjIiU+YGccj3kIRt1MhzLYhws7v879uEZ889Ve+TSTVdSqoqRFW0jM+7pskiGaf0xe
         t6javzVHeGfoVJfweIX1ECBduHJDfBctQlFQmvGhANEwrXZICkD3IZxgTkNqDVZJx+tG
         M34XypGWKZFWHX9buWHvh/3K7pyQZq3RqgsmlV1rAx0gaBbuTUjcpPtQt2/zDWHtayFb
         ecg4uzTZm1F0JxtDkP6RfUklVnqkCXNmm9jZMq1YRONE4tZTNzUjWsZYfqa1s3v1xhke
         SbkTGUoDoyGuWIsPKdpASDHVbNRsWsuNeQbGUZiogCejAeVE4u1sK/fIj+tQtdFtEcUm
         C15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6TSUn8xPcd6H5fjophC7T+z3GxaUtEa64TR/ndAUqog=;
        b=e8/Kuorp1XSNGnza+BCAllRz96kbfwWlgmlXPrygmAOiVzife45U2+J80+nV1aFkFv
         YiANIzv6JV3eIb2ZVFKSFN8MSHxARV2m2hEF5pHB9KU6ME6muoIOUzYXDup0uP7mkyEi
         HFKeSDSiotR71BUpPhX8cwAd4Tg6nqomfxag6aIuxvOu4DpcP66CVkvy2bVmjhgL075m
         PmJtwpzqBMOt7wuQnjtf7S/jTQJur0WlR9/xBPiCja8aGSggQTGr/AKH9ZyCOZLCSSfg
         fElUdFY3lH2ziS8zn5RuW3UiJdrJZwiVNpncg7XpMRXZrUAA8AsMY7AjshGP8kXAQhrV
         egrw==
X-Gm-Message-State: APjAAAWG3/LuchTZ/oi1GCB5PkkwRyy+4IrfNK2hJNc++uKf2OpQtbtE
        0qx9sTMBrpgVMVVQyoqYYePJn1uq3/mRxTxRuE6mWA==
X-Google-Smtp-Source: APXvYqzv7ZFAJVm8UDa2eHfp6BEfq1DCHyjIQeu1nId0TRH9xJlhezpl6EtuyJBfI40CcQuahPCeUz44MwQ+mtM6MeA=
X-Received: by 2002:a19:40d8:: with SMTP id n207mr594507lfa.4.1581335559768;
 Mon, 10 Feb 2020 03:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20200125221410.8022-1-pthomas8589@gmail.com>
In-Reply-To: <20200125221410.8022-1-pthomas8589@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 12:52:28 +0100
Message-ID: <CACRpkdZjFpyp=fySNRfMCnm6-JJ0xY-sGU4deDc6i6iPOuAG+w@mail.gmail.com>
Subject: Re: [PATCH] GPIO, Fix bug where the wrong GPIO register is written to
To:     Paul Thomas <pthomas8589@gmail.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 25, 2020 at 11:14 PM Paul Thomas <pthomas8589@gmail.com> wrote:

> Care is taken with "index", however with the current version
> the actual xgpio_writereg is using index for data but
> xgpio_regoffset(chip, i) for the offset. And since i is already
> incremented it is incorrect. This patch fixes it so that index
> is used for the offset too.
>
> Signed-off-by: Paul Thomas <pthomas8589@gmail.com>
> ---
>  There are many different ways to correct this, I'd just like it to get
>  fixed. I've tested this with a 5.2 kernel, but this patch is against
>  5.5rc7.

Fixed up the subject and applied, added a tag for stable.

Thanks!
Linus Walleij
