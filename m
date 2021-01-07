Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20BD2ECDAB
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jan 2021 11:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727707AbhAGKSw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jan 2021 05:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbhAGKSw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2021 05:18:52 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCC1C0612F4
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jan 2021 02:18:06 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s26so13309850lfc.8
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2021 02:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eXcgrTzV8O4Ehzt2/ByOy2kk+5XppIuE21Qv6gqnryQ=;
        b=hoB48T2IASUXAGX3I8lrFPPnJPJgJn9nnnHJpQFa6ebJTZWaM/lqO64OhdwLrlVY2a
         BnN1YYTeiB97fv1elLtKnHLmp7DFH1xcoFsYRdqfs+S9+icbmfn1sMIpB6qcXetNxK6j
         yNCRixyOykuayWhR+fsprXZ3qqhrb0Jbetp+dT07/PCeoxwO008PGy2WlNCznin6dI+T
         aNVM8zLsgRsCEQweJZevibCbmmxaWsEOxiYhl045OPOhwTqkdrYDIL73PGrkTDFBcwif
         pGZ/XTsRULu7/5qysMfUOmddEStkm+AZA0Nck0OqQGDKTslwNbpungB0SNXszA6ILTt8
         Zldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eXcgrTzV8O4Ehzt2/ByOy2kk+5XppIuE21Qv6gqnryQ=;
        b=LtgZ++QwlNR0s70UCtmmZi/qgKCzX973wabjiCx3m8SmkZkDKkMbGTSHO7TmlSgGV0
         VQGp5KMHTS5Z/iWKyaCP0CobZP5InT+J3Km2izIPXgFfdrnVpQ5rh25nJFuZUM9b4Qzv
         cIPf/2imS61h7cX9eb4oXJSr8Aq8cUf/bp7yUnm2+eGtc28KXDuLUTPiVD2JRLxL8PeL
         FlhQNcn/qvmxKzFdggEsFFF4Fmv3xofE87gu3DUg6H5WF46I2ccyzPZJ/9YoUGMaobCO
         2fMpHuZhviYuXC3Pp41PMYeYijmAh9HaTyjmngAcRuDMs6lwJysUBaaEzqOnGTWJsBD1
         QMTA==
X-Gm-Message-State: AOAM533qOuSyMStbkdGxjrxlc6eDD5UNeA4xsBpxjsVlUQuqmSbeIJic
        kF+3Adn+d9K0y9rr+UPNaiI71Y/7JiCULli1j4gvl+bHHVQ0TA==
X-Google-Smtp-Source: ABdhPJxKSrsH31vUM7VoBUuDtA/gc5xAHMMhG3aPfJREu2Ua3Wylwf/2VVsRrTPMakc6kYPKN52BlJejNkZZabaVZzU=
X-Received: by 2002:a19:495d:: with SMTP id l29mr3491631lfj.465.1610014684689;
 Thu, 07 Jan 2021 02:18:04 -0800 (PST)
MIME-Version: 1.0
References: <1609936000-28378-1-git-send-email-srinivas.neeli@xilinx.com> <1609936000-28378-6-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1609936000-28378-6-git-send-email-srinivas.neeli@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 7 Jan 2021 11:17:54 +0100
Message-ID: <CACRpkdZrBXJSo_kicWKQ_wtFTZvkOUNyjP6UHZfY7xwRSNZBRw@mail.gmail.com>
Subject: Re: [PATCH V4 5/5] gpio: gpio-xilinx: Add check if width exceeds 32
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

> Add check to see if gpio-width property does not exceed 32.
> If it exceeds then return -EINVAL.
>
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>

Aha

> @@ -591,6 +591,9 @@ static int xgpio_probe(struct platform_device *pdev)
>         if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
>                 chip->gpio_width[0] = 32;

This xlnx,gpio-width seems very much like the standard ngpios property
from Documentation/devicetree/bindings/gpio/gpio.txt
but I guess not much to do about that now. :/

Do you think you can add support for both?

> +       if (chip->gpio_width[0] > 32)
> +               return -EINVAL;

This looks OK.

Yours,
Linus Walleij
