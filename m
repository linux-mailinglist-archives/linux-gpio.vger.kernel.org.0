Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 702F8228177
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgGUN7P (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgGUN7N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 09:59:13 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1D5C061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:59:13 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id h22so24167418lji.9
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EgqRXi3NOllyJKBdrdMiygwl6LFoCqVQM6YigtanIDQ=;
        b=Bp7e9NK5GOZ754bcpwrPO8ULIPeTTiAhroO+DWS8d761uoCapjlcTrQ8+Uafamgbzq
         E6Lxu30cH52cedpGviM6imkwMuD4693gPnf5Sd6jrnO4Q9kkxa+v0YcqWDryw4jsmLga
         D3vNgkArShwr6WDAAeRbWxQ9/UQiKBsb0K10rwxfs8ugm4TZkY03Ex4kc4TRZD1on/eA
         4nL7483bHTzTGAnpUrqNAewaVZTlgWYeaSpOCtrYv5t/iroqLhSRKoPN7aNyV/7bsN6M
         iCrpYSOR9KC+jPppU7/XYTjHXWIKjcjs1QDhhlqE9NbX3kgP1yTxAtAzvKLeX/u1GFkR
         ZHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EgqRXi3NOllyJKBdrdMiygwl6LFoCqVQM6YigtanIDQ=;
        b=MwWBAMX8p/IK/T2K1LzY7q1/pUEzB76rRpdZdR8HyPrwI/8YznT3cJ3iyLNB3Dqn7H
         tdSTcdVhxRmNShL9DoDw/uN8JYw0Lox/ap+AbLaCo4mPdBw0kQ6nEbCjMi9S+T4wJ1rQ
         kakdSVusMJ3YrbGwiEP8e6BQKaOrw5fWDGqZnYCaJnvj8ShCDO542iq5RsM3NfSJBQGO
         hOkK0uwrI4IYlRbZl9ckEJrmLAJQtCQg2XaPwCLBhCag8UYYg4AVt56jwbhyl/+sb8h8
         YIqOy3AEa28h51lUmOCrZIb9B9p6UoekidJ5Zdv7+8mq52Lfq/BVidQLlto0t5TE2jMa
         BbMA==
X-Gm-Message-State: AOAM530xKZO5BADfXzqIrPt0LnEgCLgZAPhFD9NCuEqF7SVUmZMIOIYI
        gzR2RGLVVGLrn55lkYqHocf/yc8HN0KwWWLzEilTK4tQQMThjw==
X-Google-Smtp-Source: ABdhPJwNexjkN8kjDUMNaxbarTlZO67BlUV9WjLHlw8vgvbSfyZP+F2Filqh4hwccCk49d5M8brjLNx1zn6UiGDGE/k=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr13599379ljj.283.1595339951651;
 Tue, 21 Jul 2020 06:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200721131829.GA67334@black.fi.intel.com>
In-Reply-To: <20200721131829.GA67334@black.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Jul 2020 15:59:00 +0200
Message-ID: <CACRpkdYcKKQNwk905J+mOAXY-hCx0Pku2wKikMccX6yqECT0Mw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 5.9-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy!

On Tue, Jul 21, 2020 at 3:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> ARM/orion/gpio:
>  -  Make use of for_each_requested_gpio()
>
> at91:
>  -  Make use of for_each_requested_gpio()
(...)
> gpio:
>  -  xra1403: Make use of for_each_requested_gpio()
>  -  mvebu: Make use of for_each_requested_gpio()

Are these dependent on this:

> gpiolib:
>  -  Introduce for_each_requested_gpio_in_range() macro

Because if they only need for_each_requested_gpio()
I could just merge it to the gpio tree, since I have merged
the immutable branch for that into both trees. Then I'd
prefer to have one pinctrl and one gpio pull request.

However if they explicitly need for_each_requested_gpio_in_range()
I say I can compromise and merge it all into pinctrl.

Yours,
Linus Walleij
