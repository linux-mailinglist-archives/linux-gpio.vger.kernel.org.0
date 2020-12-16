Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1172DC076
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Dec 2020 13:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgLPMrk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Dec 2020 07:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgLPMrk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2020 07:47:40 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345AEC061794
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 04:47:00 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id h205so4477047lfd.5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2020 04:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VOVajqeL58osbRPPaomgTK8n6oUgfCbxRdg+Fy/mnXs=;
        b=i4hQCSzgyarWqSRx8lwW55w7AT8SqV+QL34hqfbK2tNFgrtNkuHa4lUZ5EZtsUhapF
         wBSlb1/HKs4lWTrub+/WG9KZYknYDRJ1tpNK4ysCbZrhEfB2ChKXyoOpgiNpcYgK9Lcz
         qE7O6CpmzUPvK1X/riZptbyzZtI8f1EqX5+i/ebuyHXyfJPNRcRXyDTD788s9+9G035L
         rnc1jLJ75WIbpFq817pOLonid0xYqguLJkrGOwU78TJj8DJz2UtX0OuxYo843MGQeGe1
         by6jGqr1SImmXps3YZhXbI9pqWCmteSDK19Gn/BMgdqdwqM0j2Zx/iRvQ1qItoPCaphm
         alCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VOVajqeL58osbRPPaomgTK8n6oUgfCbxRdg+Fy/mnXs=;
        b=HuVxFxldlIWpvZAKT9FSczr8MNlRlLI9R2ICzQ8zyL8dPAKHwLsj6p08kxisbx36WX
         7rxlzGgEzjqvwCcz8pbNegAHTO3AlIjdB0nbQIYFidnKOLx2xEe1R+WFovToVSYkLsl2
         JijxRo8UIS3NXUnMS9kiFrcSuTrrlD2jRidV04DWXxIXi+ABZpz25MPNLJXIbzsC1a4F
         /psEBQ1gAiTsc9MsKxDj7CkvBZfy/Aj9/tyMNxocnkqkyT02OfRg6dABIccxklMAw+0L
         xr7DLjS4QHqkaYyyHLY+5ST0qBXO5PHPKurKQHIfsxlJ1RRNu4jRBh8f1h0t60W2HiSt
         hSJA==
X-Gm-Message-State: AOAM530glSZ1WJCVrkWVkhACume3y9k+N5K1hWdAlbUAY+7Ol4sWdYL/
        zQqxGZ82CoIYsgjVxGlmx9VHh6DBqqCA/fq+OTk34g==
X-Google-Smtp-Source: ABdhPJx/ESz87W3XJ6XGTijh+mpw6fi1H7wcl/u92ThLJDNcAiIGewSSl41QCClJfIgduJfJv7cNsCBzlSMsg4LFAMs=
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr2718938lfd.291.1608122818612;
 Wed, 16 Dec 2020 04:46:58 -0800 (PST)
MIME-Version: 1.0
References: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Dec 2020 13:46:47 +0100
Message-ID: <CACRpkdZKKetFFm8AanVnzV9SyZhuurLHT_ZTak27-vGEdqVgEw@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Allow name duplicates of "" and "NC"
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 15, 2020 at 6:02 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> Not all GPIO pins are exposed to the world and this is typically
> described by not giving these lines particular names, commonly "" or
> "NC".
>
> With the recent introduction of '2cd64ae98f35 ("gpiolib: Disallow
> identical line names in the same chip")' any gpiochip with multiple such
> pins will refuse to probe.
>
> Fix this by treating "" and "NC" as "no name specified" in
> gpio_name_to_desc()
>
> Fixes: 2cd64ae98f35 ("gpiolib: Disallow identical line names in the same chip")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> The introduction of 2cd64ae98f35 breaks pretty much all Qualcomm boards and
> grepping the DT tree indicates that other vendors will have the same problem.
>
> In addition to this the am335x-* boards will also needs "[NC]", "[ethernet]",
> "[emmc"], "[i2c0]", "[SYSBOOT]" and "[JTAG]" added to this list to allow
> booting v5.11 with the past and present dtb/dts files.

I pushed this patch yesterday that fixes the obvious "(empty string)" problem:
https://lore.kernel.org/linux-gpio/20201215123755.438369-1-linus.walleij@linaro.org/T/#u

But I see this is for device tree line naming only, right?

I think I will conjure a patch allowing identical naming only for
device property naming (like from device tree) but emitting a
warning so that people fix it to something unique moving
forward.

Yours,
Linus Walleij
