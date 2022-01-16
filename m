Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B721048FA1C
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Jan 2022 02:05:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbiAPBFk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 15 Jan 2022 20:05:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbiAPBFi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 15 Jan 2022 20:05:38 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51620C061574
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 17:05:38 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id r138so18116907oie.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 Jan 2022 17:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XZu/hPMQAR6JerGfyaKVu4NwDn/+L++TXjPb4qGe5LA=;
        b=xlYARUpK95WH+obZMuApEx27EFq2DTEmuY1EX1dOlNfwSX4ub5aUwaoVdly/t9HR1+
         TSY9EHLXKep2AnA7YMHm2hIRDh7Dzc5Xc5JFAY1mdNkuLxAeJvcRyINKZvbrT3J6opwA
         vqRvFHkDNRN3w48/884LL235NWIvDq9lRSY6P/wnH0SRZANcVph1cQoToqjC4otHs26S
         LibgbBYdz4j9P+2XgQ75maFZb9Fa30lmDZE9ZrYMaJLV7OZfOi7Cgk+BkMptzV4FCIhe
         Nx/rQXDg+rZyRiHxpQb2UPfolwD0oXSFnF20Cas5f5bTNs1aCTeRABxQIucp8KFj4XpY
         GEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XZu/hPMQAR6JerGfyaKVu4NwDn/+L++TXjPb4qGe5LA=;
        b=vtJENAvySYUvyQxPkgk1hsvSSR/5A9hL+a6FBkCb0Hfwg6J9fhc00k9oebmDDTPdHl
         MONxyq44HvcYmCQKbW22n10OVyvVCuwRox6eNbrRo2/nA7qMlA2bdqf2xqVU5ZPk4ijY
         7iPCsSQ8hI23KNpr4B0OoYB+xkK79Y3hA6pZo9OPfeVw3uc7U7LD67axISKGFfErWmx4
         J4SSY9zNN7hTQFYce2O7Ueny5aCb9hCU6nZYX9FgEn2j8wcX4yAvE/26sWRk9EfJsiGJ
         nPzPs2vB/dtDXwyvCikVRhdfd97rNw7M71Z+pU9QxU2l8yJe6wVSHmGyO7Xf7Lq0KaBS
         BQTQ==
X-Gm-Message-State: AOAM532qemc3tblUrsO85k0XGKGjMkgwyUru+HrHwU3X26Ot50UgJfaH
        QsTXbzZYvH4Xf60/ym0nrGp1xrO+EjMiCdNpTrfHdA==
X-Google-Smtp-Source: ABdhPJwDK4/ffYyTCt/T0hFCZfC/epnKIPbY3tO20B3nOviEnXENCjxIeq6FW49NrdbhZ59gZWdBbiMdt9mv01MUZro=
X-Received: by 2002:a54:4613:: with SMTP id p19mr12265631oip.162.1642295137712;
 Sat, 15 Jan 2022 17:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20220105172952.23347-1-andre.przywara@arm.com>
In-Reply-To: <20220105172952.23347-1-andre.przywara@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 16 Jan 2022 02:05:26 +0100
Message-ID: <CACRpkdZ528B4b9XzBpfGAwPbDaDH12LQ8rTce9AsDuKF+v5A=A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Fix H616 I2S3 pin data
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        SASANO Takayoshi <uaa@mx5.nisiq.net>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 5, 2022 at 6:30 PM Andre Przywara <andre.przywara@arm.com> wrote:

> Two bugs have sneaked in the H616 pinctrl data:
> - PH9 uses the mux value of 0x3 twice (one should be 0x5 instead)
> - PH8 and PH9 use the "i2s3" function name twice in each pin
>
> For the double pin name we use the same trick we pulled for i2s0: append
> the pin function to the group name to designate the special function.
>
> Fixes: 25adc29407fb ("pinctrl: sunxi: Add support for the Allwinner H616 pin controller")
> Reported-by: SASANO Takayoshi <uaa@mx5.nisiq.net>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Patch applied for fixes.

Yours,
Linus Walleij
