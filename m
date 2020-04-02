Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0575E19CA10
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Apr 2020 21:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbgDBTgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Apr 2020 15:36:42 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:40202 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgDBTgm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Apr 2020 15:36:42 -0400
Received: by mail-vk1-f195.google.com with SMTP id k63so1316609vka.7
        for <linux-gpio@vger.kernel.org>; Thu, 02 Apr 2020 12:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2/1Fb4NTBpelrM8GbUCcCoSKy/ZB5mxE3+m/h5XdYZk=;
        b=vL+DR70ZB8OyRK36hduohcB0Gz5Bar3dM91fExKKr8tn+E/Qxct7JK8sNAs7dRhrLs
         bKoDxFz3iZh0Zft7XH8YBpHrfXZPZErpyZ3hhX1EgJRFLnR4GyefDLWdBkUJOMjV3Nh3
         SfYYa795AR2MHHN/wlrnNNtYBBrstK8/4Q+6qU2mSjnb6zqWiwnL5G7yGphB4By8q21P
         2ZYWn+wNCRYl1/7fiN8aeWLuloeoziPnfOq5o+srr6mSKxBQHWisVpHix8MyQ+rqYq5X
         1vhSoMyOXGpc9bYjfEkoy6j8hOrhJoFk/k3SDQ5WKYPxrfcXrROwg4H7D8ct5V1ToyUJ
         UPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/1Fb4NTBpelrM8GbUCcCoSKy/ZB5mxE3+m/h5XdYZk=;
        b=gm0FmAm3jTBmO9OJpgiR+iUBa4CfXSdPlHghvOTaGtUYSDK7UqWDMZjrY3YdqNLnUH
         1/gPt4ZgfdTDqv5sdAFPAsCqfivw8o0Exua6UU48RbACxjdSdquGYwOYJepstlT7HiiF
         vIRdxXXM2K6DdylCb6tcF4JpaUmnHHtDefpdDVP/0Zsnle/863bt+X62y5pApI72FfGO
         ESyJkp5PhRd+NKMIYc81YG/mRJgFxkUs3mjW9sYlVGrSxDDU1LuXM+HltWjwcxUWPmS7
         pp6gKN1OLIwJsbyUNKgKydKlp4KJhIqmz6g83Cyp9FgL5DO3k/oObp/vlGVqAWjLlg5s
         NyLA==
X-Gm-Message-State: AGi0PubgTA49BeXheP0hmXHj5sXa1x8HwiwWnMAaYsDLHyo15dw4kwT1
        nJ0p3v0AzwNPdNK8Oigia9RZGof2gnuRZ9NEMlw=
X-Google-Smtp-Source: APiQypJ2LzD6hf7k3b2IlFJFlc3p0y/B0MRk+J4P+0FVosL0M/cwGfCgCsWzfc9egKK5gVgNgu+LyHsZhy+Icxiu3+U=
X-Received: by 2002:a1f:1714:: with SMTP id 20mr3532926vkx.72.1585856200626;
 Thu, 02 Apr 2020 12:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200402192145.17239-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200402192145.17239-1-andriy.shevchenko@linux.intel.com>
From:   Vaibhav Gupta <vaibhavgupta40@gmail.com>
Date:   Fri, 3 Apr 2020 01:05:51 +0530
Message-ID: <CAP+cEOO-G=4_txK3dtOxOoRS51GWBzEwa5FfpRzYxDKHo=MdiA@mail.gmail.com>
Subject: Re: [PATCH v1] gpio: Extend TODO to cover code duplication avoidance
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 3, 2020 at 12:51 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It appears at least two drivers has a lot of duplication code in
> GPIO subsystem.
Yes, I was surprised too. I studied the gpio-pch to understand how
conversions are going to take place. But when I started working
on gpio-ml-ioh, It was exactly same and I could do it in no other
way, except like that of gpio-pch.

-- Vaibhav Gupta
To avoid adding more and get rid of existing duplication
> extend TODO.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpio/TODO | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
> index 3a44e6ae52bd..b989c9352da2 100644
> --- a/drivers/gpio/TODO
> +++ b/drivers/gpio/TODO
> @@ -99,6 +99,10 @@ similar and probe a proper driver in the gpiolib subsystem.
>  In some cases it makes sense to create a GPIO chip from the local driver
>  for a few GPIOs. Those should stay where they are.
>
> +At the same time it makes sense to get rid of code duplication in existing or
> +new coming drivers. For example, gpio-ml-ioh should be incorporated into
> +gpio-pch. In similar way gpio-intel-mid into gpio-pxa.
> +
>
>  Generic MMIO GPIO
>
> --
> 2.25.1
>
