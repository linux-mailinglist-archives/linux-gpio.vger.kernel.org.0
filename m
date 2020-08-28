Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0E0255CDF
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Aug 2020 16:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgH1Onv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Aug 2020 10:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728135AbgH1OmK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Aug 2020 10:42:10 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18199C061264
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:42:10 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y17so841136lfa.8
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2020 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f79kdlAh5IcKuWoCYTa657Zb9eU06P2OlaoVxKUCN6w=;
        b=OFa+5OuC4GuquUUrXVE//sKmY3784S5MHQRai9DlKJFXu5KZHGhLLofSSQvDRUp0Ol
         XdER7N24f5WAkQ01Ff/6y/VoTzOE7BNSVhe7Y94wyCvZ32N9vm2VztgA09dWx+822TcN
         OefBijDu+jDteGNHImHP/NemPpcWYQgGhte78wj/UFT//BDKFF8sYj9XUN/H3N7+FQFi
         XCWOudrL6mjYt9N+2+0gien0jkuvyDYzI8NLHJxw4ZKv+ZBVt09tDI7yQSCtZazdUhNC
         yM688uoIQIXtWvy1ou7NRmmuiGSZVJPHA8WWd1TtChZc+6Fw773aum1oRrG5/oJOQnjj
         lotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f79kdlAh5IcKuWoCYTa657Zb9eU06P2OlaoVxKUCN6w=;
        b=T60KDK676EXcanZsalfn+1a1hQdkypqRTzpvqhr9x/BPJCK90rsnqrz10kAnQAT04F
         qxouLzU5yDfvLLAwZZGpl/9xgscedC5bnlB81FL7k+NcKRscyzjQTwBc0+7JO3K7L0S5
         wEPr09mhm2Gbd88xrvK7ZQZ+HK3OTq/EIkx7f1usStZS9tfyJe03qEt+utuJanJq8NS0
         Y+mpiTLRMKonFIPg9oiokTUTIrW5YMASpxcuD4w97J/udBj+KosTmyaLP1FE8GZFxK0r
         +V8G1PuFSQWa+SirNjhDFMsB4YdbWxnLqL8lC8qi6zQSxpRzPyHV61uNYZDXyqe5ALae
         3Gxw==
X-Gm-Message-State: AOAM531rOLSP3/bwpnktZfhvXBp1vrrAo9EpjVclGKh9gw1Q2j3nku66
        4ZrGPLVlZouoU7gKpz/3+ZPfiE910a48qHl2wyzv8A==
X-Google-Smtp-Source: ABdhPJyM4gNjNTbHAWbyqAZMSVOXPU+EVin4QwTAwzomXgZ3pwZiTuElnITq4KRAaOanVVVNOmY1RYaynZhL5i9ndQ0=
X-Received: by 2002:a05:6512:210d:: with SMTP id q13mr426584lfr.194.1598625728439;
 Fri, 28 Aug 2020 07:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200828103235.78380-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200828103235.78380-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:41:57 +0200
Message-ID: <CACRpkdbEgvGkLhREZERDC+eXjmrCyVMhbkJqWEh0ArF9_3yWqA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mcp23s08: Improve error messaging in ->probe()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 28, 2020 at 12:32 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Print particular message in each of error case in the ->probe().
> While here, use dev_err_probe() for that.
>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
