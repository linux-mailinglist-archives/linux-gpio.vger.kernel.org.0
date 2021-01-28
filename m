Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5509307576
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Jan 2021 13:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhA1MD4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Jan 2021 07:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbhA1MDH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2021 07:03:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3ADC06178A
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2021 04:02:05 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id q12so7215376lfo.12
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2021 04:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=usfc03r7bo+9iWnGhn3YJY+bfRfQpQsiPPvtGVZjTJo=;
        b=npthAUeo3rWK36iMclfXUXlzdH0VQDifjmso0bBCFVXOyQtra7DzyHgEmzJCt30dt/
         SJ9fMz6E+ZXbymrWtxziw9opC0BGbilGWBJXbYZg/g+BYXgWz07+qrex1EOMXMqIpzpE
         6jYfIeX/eLZOEM3VQR+NV2YEMCt5h3yT2zkYs2fBjC+YshcbiveecNrV2CoAJtG6ZVel
         ii8PNYw1BYp2K+WyqndwkTLNHTfxmpxwnUysv03/L8DCd9xBIWL+Ex04T8ZFQN2SR4Jv
         XJrieSOBP7Hg+fXfNeCpqIezF0N6+ilCD2nUbDQYYsRnM51XurcjK/Q5y7e31SHMaiG8
         0S7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=usfc03r7bo+9iWnGhn3YJY+bfRfQpQsiPPvtGVZjTJo=;
        b=f78bvHn9BaYaoScXE4vuYpTN/Aywc1GQNQoapWj4ImhyCX191qJBfQMTevttO0au4S
         6MOVpFVRdhzxOMpSlr/vW792J45iiflx8J35/KM1r3QLjgrR8o2WDqGOWdyqvVxsBHF8
         sfWybMnrmwmzhgbuH0D3pk3Yf/8sKo+CpXptJtgDYf5ypiYP95WU63iu2lIR94wB21Rg
         Fu9LlErOVuFJ+6pU8vqNInhIyDMASlXLT1oXLd8MgJmmcnlRy+pF8ovryvxJXx+ke6sV
         qIio3JidjeW5Awv0DTXs3m84vEYwDcNzTdk/SnbbRxHw6/iIvplfSl0OBu3vRm7qOu7j
         HQXQ==
X-Gm-Message-State: AOAM532BC7PAbGwfv3uQ5rMivKP6Pxq3NFwsRjG1hAI8GYG/foZQlvAO
        lKMr6dWocg2T3R63iGzPrUDOkLgzqjkjr/kgd+BWVw==
X-Google-Smtp-Source: ABdhPJza5WEqdY64nMdJh4p+Ysom/A+I1BzOUDl9O6I2P4XzvnsQTS6dm+guTw4PUOLC3FEaVrkSaMBAp3FtmqHRCno=
X-Received: by 2002:a19:b8e:: with SMTP id 136mr7679656lfl.29.1611835321876;
 Thu, 28 Jan 2021 04:02:01 -0800 (PST)
MIME-Version: 1.0
References: <20210127000303.436595-1-drew@beagleboard.org> <20210127000303.436595-2-drew@beagleboard.org>
In-Reply-To: <20210127000303.436595-2-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Jan 2021 13:01:51 +0100
Message-ID: <CACRpkdYkyxXmxhikvnpxc07MmWPweFAphRPCMd02Ye4EyuOVNQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: am335x-boneblack.dts: unique gpio-line-names
To:     Drew Fustini <drew@beagleboard.org>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 27, 2021 at 1:05 AM Drew Fustini <drew@beagleboard.org> wrote:

> Based on linux-gpio discussion [1], it is best practice to make the
> gpio-line-names unique. Generic names like "[ethernet]" are replaced
> with the name of the unique signal on the AM3358 SoC ball corresponding
> to the gpio line. "[NC]" is also renamed to the standard "NC" name to
> represent "not connected".
>
> [1] https://lore.kernel.org/linux-gpio/20201216195357.GA2583366@x1/
>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
