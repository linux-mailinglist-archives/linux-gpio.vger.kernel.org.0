Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF1692B72C9
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Nov 2020 01:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgKRABO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 19:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgKRABN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 19:01:13 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 216CFC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:01:12 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id d17so333411lfq.10
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 16:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4ycXUMGSCeTsWaW7nmdLeqpi6qBx0yLCpRoblXT9KU=;
        b=DhZpw9q63G31YygvD9yuw+yE681SiE1BU8LFNB1VAbJKxD9t/37kOwhFwfaVHrETh4
         GZUj++glg6kzICymCXr/ksdK06KGELdwRhq/ZslIcaAK8Jz97X+UgCXRa6EWs+uv3ptF
         mLRIUTOfrbDPgyTEblMz1MtIAJc4Wg/O1z7esUCvLsKCrI72WDpM5Zq2nITJvcScWonU
         cnPr5hh9SGyVealdIJwVDQAtWWGOz8TCbNPfIwiQzQyOKLao8V7NS+61vuxYyW9YqdQ/
         88ZfaIN+blZ+rDxn5ZeZVKVrlRAZP55rM5Nk8oUHFy7qUSuDsNwm0i19i3h3BV9cxBca
         RYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4ycXUMGSCeTsWaW7nmdLeqpi6qBx0yLCpRoblXT9KU=;
        b=BBsAWy9NZQ+ojAmVpr+eFnyBAIgKYgi6bYIlw4GwYjYEa1ECnyaQzcZQ0v2Lj6RP4R
         7H+iwJjyALng7cCWcWzMSbSNNJW2497t9f7UdF/92/8urTcTDGw8umqlfPTDV/bgvuPM
         VVwVqSixHDWs0o7/bwONgfXEoPCTanH/d8lnOwwHWqf7x2kNmesuFYa2llKc0+RjY+7A
         gnj8ZJz4ecOuASHEixvLhVahlZ6hl+TkRo0i8Ftm+FlXWewjplELQmFUUPAfFM7uu9jz
         zX2x1GcqhQXoywZhWY4mzBbFjp6/zV6slZ6snalvEGxlBeyaQgvumnsBNSoKTaNhhSo+
         9qzQ==
X-Gm-Message-State: AOAM533Mjcx2buTKFR6LnIRdMlE0p0un5EM7FFwcxU/rQAqZ4y728uUr
        jZfloZooADeHvELS7M+WhVJ7QIjsMvddA7o2NQechg==
X-Google-Smtp-Source: ABdhPJykej3jZlv5oi3l2bnvYBqKQn3+3VXMjsO0fsxudyst3FZId2oJkHK8ASswjD+RBh69JWnUJtAo8TSCSqYEaXY=
X-Received: by 2002:a05:6512:3e7:: with SMTP id n7mr2480741lfq.585.1605657670638;
 Tue, 17 Nov 2020 16:01:10 -0800 (PST)
MIME-Version: 1.0
References: <1605201148-4508-1-git-send-email-srinivas.neeli@xilinx.com>
 <1605201148-4508-4-git-send-email-srinivas.neeli@xilinx.com> <CACRpkdZw_rYXUq_UuJrjUk-moSZAiNL1f_nkuWhA2xovgk-vtg@mail.gmail.com>
In-Reply-To: <CACRpkdZw_rYXUq_UuJrjUk-moSZAiNL1f_nkuWhA2xovgk-vtg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 01:00:59 +0100
Message-ID: <CACRpkdbwuMRR=mMg49bKnTEaUAb8vt1vx=iVTcfUJ3Kd3mNFug@mail.gmail.com>
Subject: Re: [LINUX PATCH V3 3/9] gpio: gpio-xilinx: Add clock support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        sgoud@xilinx.com, Robert Hancock <hancock@sedsystems.ca>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 18, 2020 at 12:53 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 12, 2020 at 6:13 PM Srinivas Neeli
> <srinivas.neeli@xilinx.com> wrote:
>
> > Adds clock support to the Xilinx GPIO driver.
> >
> > Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
>
> (...)
> > +       chip->clk = devm_clk_get_optional(&pdev->dev, NULL);
> > +       if (IS_ERR(chip->clk)) {
> > +               if (PTR_ERR(chip->clk) != -EPROBE_DEFER)
> > +                       dev_dbg(&pdev->dev, "Input clock not found\n");
> > +               return PTR_ERR(chip->clk);
> > +       }
>
> You can now use return dev_err_probe(dev, ret, "failed to get clock\n");
> to avoid all the comparing with -EPROBE_DEFER.

Patch applied anyways, this can be done separately.

Yours,
Linus Walleij
