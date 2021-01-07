Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85282ECD16
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 10:48:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbhAGJro (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 04:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbhAGJro (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 04:47:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52FACC0612F6
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 01:47:03 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id h22so13243276lfu.2
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 01:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G7NaTlfrTJWUXaJilppzFOMdooG1dXbh0X2tc9uYq8I=;
        b=LCI0f0rY6PkEMU9S/IavbvrPp/OFZ8yVpLwgKYUZirUIaQrAwYTdI/PePfSJfsQs7P
         YXZcN3WMAtpmVzNOa1+n6iR6qDMVVF0ukoOMOV0sw5iiXeh+4EL/A+fhISbywyKea7KE
         zvbMuMGEbgo32Fhp9bSQXFegMX+tD6G7e/IzFSVsgrnE/uXXEsaunvygj0w8PNCti5xi
         vhruJX9S+lTkcQrAXdhKe1As5OObtP5nXVnzbsPxMAACiur+IvXmUbXsj/4dsJdWr4Q1
         0yuWWNji7ArQ2izpnAPO4Rd9sOXlAePwXlrlHyNGC/eSW+6JILadizCTH8NpReZXe7/e
         3RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G7NaTlfrTJWUXaJilppzFOMdooG1dXbh0X2tc9uYq8I=;
        b=JNdXGrKp2oMJkxZ8OGt8q9RyHVWPkumlIkNRxA1OOlwtUJEwOwJiyLcwwyMBoXwq2n
         76NAL4GYsBwLvyxjdkzsps3ASUgq8aqLHeSiVZAlVSckV7g09awbLdsh5v49VOMTSEr+
         5m/PxS3OONJVC6m4wpScfj2CnIH22UnKIgoFM39wQ8vMJTQvoRqtc8cb8UQ64U4i1Td2
         5aylOYG51ogTmnYtovptdFWA+gVz85Watjg1xqFig9Gr8B5mgItOGKZvUATvXZrq1sAx
         yB5O81ZBeE4QTNk+M+Q7ziOInBxUD44w+vWf//5+wwNs15y2ynf5kId1jMyqDEcO6Txd
         nUEA==
X-Gm-Message-State: AOAM5337ihKdeJmowaBZo+e6YDhPEpdLDMK9qjyz1i06WWnCb2NViGOB
        zZ34EkpB9V50ld3jR1zBOq5f0qr/6a8hRKyIFNyN3w==
X-Google-Smtp-Source: ABdhPJyQBSxHaR6UnF6GTmWO2HCJ6YwoFxMYYd9E080KXVWwBZDt8H1Rl/oeOTyutVVocPigqgYIaY4dC0/E8aocHvs=
X-Received: by 2002:a19:495d:: with SMTP id l29mr3445703lfj.465.1610012821860;
 Thu, 07 Jan 2021 01:47:01 -0800 (PST)
MIME-Version: 1.0
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com> <1609936000-28378-5-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1609936000-28378-5-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 10:46:51 +0100
Message-ID: <CACRpkdYLp0uuB-QO5HvLH222TkCjk54JmftveHgpiW1JExF7DQ@mail.gmail.com>
Subject: Re: [PATCH V4 4/5] gpio: gpio-xilinx: Add support for suspend and resume
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 1:27 PM Srinivas Neeli <srinivas.neeli@xilinx.com> wrote:

> Add support for suspend and resume, pm runtime suspend and resume.
> Added free and request calls.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
(...)

> +static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       int ret;
> +
> +       ret = pm_runtime_get_sync(chip->parent);
> +       /*
> +        * If the device is already active pm_runtime_get() will return 1 on
> +        * success, but gpio_request still needs to return 0.
> +        */
> +       return ret < 0 ? ret : 0;
> +}

That's clever. I think more GPIO drivers should be doing it like this,
today I think most just ignore the return code.

> +static int __maybe_unused xgpio_suspend(struct device *dev)
> +static int __maybe_unused xgpio_resume(struct device *dev)

Those look good.


>  /**
>   * xgpio_remove - Remove method for the GPIO device.
>   * @pdev: pointer to the platform device
> @@ -289,7 +323,10 @@ static int xgpio_remove(struct platform_device *pdev)
>  {
>         struct xgpio_instance *gpio = platform_get_drvdata(pdev);
>
> -       clk_disable_unprepare(gpio->clk);
> +       if (!pm_runtime_suspended(&pdev->dev))
> +               clk_disable_unprepare(gpio->clk);
> +
> +       pm_runtime_disable(&pdev->dev);

This looks complex and racy. What if the device is resumed after you
executed the
first part of the statement.

The normal sequence is:

pm_runtime_get_sync(dev);
pm_runtime_put_noidle(dev);
pm_runtime_disable(dev);

This will make sure the clock is enabled and pm runtime is disabled.
After this you can unconditionally call clk_disable_unprepare(gpio->clk);

It is what you are doing on the errorpath of probe().

Yours,
Linus Walleij
