Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFC34586EC
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Nov 2021 00:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhKUXO2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Nov 2021 18:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhKUXO2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Nov 2021 18:14:28 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C840C061574
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:11:23 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso26097970otf.12
        for <linux-gpio@vger.kernel.org>; Sun, 21 Nov 2021 15:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bTAbuwwiRCZN3KqUf/kG304lXY2W1vD8B7/l1GzwKy8=;
        b=Z8DWsyha2Dp8bop4b5/0sikkJ061GrpRiI6v7NAguDswKzjJi4nt70dyVA8wXDEcZx
         uBOZcbm8w0zhjmrrFVOhZW4E6JpB/5YUg9T4Aiy7dgt9Es0TmlRx3vRjfUYtaxc1jyHW
         1N/bWcNR02//76oyApRPkP2hE3BuyT3TcnIF1AkpSXKirNW8nHCixaiLv2lA8DEBz+Tn
         83vBDgpnQAASx9N8NirSQPA50pqwoOw0tiHrnroiyf55mECppIjg5uR6NUdqRt9/At77
         HCEr37NfSL6gPJ6RHZP289BaQa3eIGWrs56PMAnO1rLNx8CNG7xZAHQUSq4VrX9oowkw
         YmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bTAbuwwiRCZN3KqUf/kG304lXY2W1vD8B7/l1GzwKy8=;
        b=WR8QDyBQRZ1PjNhAE4fwT2izbSU99jh9pV5z2IoGWOhG97EqdblqTQXqcKl7LZ0SDf
         4rfb3VfT1aAqKCVS7vP3hp4IQdbuyHS2Ho7GEkkBDnlt24cH3B2fpKBkNUtfu+izxsAT
         AKN7H60mlLm2P0h+umKVnb5hP0ocf7MfGhZFqt8Sm3BqKpZIW+0QRX5wgc8bVw7LNs7n
         zAEOd3Au03ilVrA/mY7KKfZWOkG/MGHyBk8jFArI0BueiKyZwv1kwCpgLSyH1o6XLFvc
         OIXsHhXQ7rCXBKq7sxClNbQGD7NfAWyEuEPGQEWylbPoOlVYH2rzlNzNrQEdvL+MQhRr
         W00A==
X-Gm-Message-State: AOAM531izC7dmJfR1MnUTihItLJDuvSRDUivRfEOiVNcTXn9HFTBA7Q9
        1+9BMGKaxBW2BcGM1qGFIrsOFnedmqnwLrw5BcphCNyClm4=
X-Google-Smtp-Source: ABdhPJxnzPWPghCWX8gYtpkOsS59rzm44Ms1Mf25+pnmI3+IHeGK770vYP2R9da+dR4OmbKV6ZsJrF6I6pOlZdkK99g=
X-Received: by 2002:a9d:ed6:: with SMTP id 80mr20510732otj.35.1637536281974;
 Sun, 21 Nov 2021 15:11:21 -0800 (PST)
MIME-Version: 1.0
References: <20211112130152.3682556-1-thierry.reding@gmail.com>
In-Reply-To: <20211112130152.3682556-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Nov 2021 00:11:10 +0100
Message-ID: <CACRpkdYR4-xVcYd-0AsCvzknAbP_hbnJnnwmESh1=pgAfYOVyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] gpio: tegra186: Add support for Tegra234
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 12, 2021 at 2:02 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> this set of patches converts the Tegra186 (and later) GPIO device tree
> bindings to json-schema and adds support for the GPIO controllers found
> on the new Tegra234 SoC. This also adds a gpio-keys device tree node to
> the Jetson AGX Orin Developer Kit device tree to allow events from the
> various inputs to be received by the system.
>
> Based on work by Prathamesh Shete.

This looks good to me:
Acked-by: Linus Walleij <linus.walleij@linaro.org>
for the series.

I suppose Bartosz can just apply patches 1-3 to the GPIO tree
and the rest go to the Tegra tree?

Yours,
Linus Walleij
