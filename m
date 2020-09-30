Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0268E27E566
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Sep 2020 11:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728844AbgI3JmO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Sep 2020 05:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728677AbgI3JmN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Sep 2020 05:42:13 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F9A7C0613D2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:42:13 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y11so1336500lfl.5
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2020 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cNSx/XGWGsZi8+BpkDocBySvQFjLD1m5m8MaE/Ga7Zo=;
        b=cNEqP8uB66rMFsMmvN5GLINNhxGb01ntU6bg1O1RPiHcbjPrzUnV5CPLlvR4SB82AZ
         HVJCYmW/KKS75oMq7xYpAlyYgsglQyiwk6KVrlgqRp58eRqTNCP/T2CG4iRpUu/QcR/q
         bC5xA3JqyHaWe2imvP9S5FfWpwGAsX0zZejbU3/P8i1dPHfEUg+zhv68mGFHvnZIKv2C
         /64CR53om1R8U2DK2Rel+X5fj0WN4xwH1B2p8kPTQ1JTOAMj1u2sHe8x0UvyFRifL6/Z
         ZHtS+7+L7e+m4tFiTggU9pU5TsIxCNgLnLdxCHBReX/VgJvIleANP1dUy5WBDtcz/SH8
         saEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cNSx/XGWGsZi8+BpkDocBySvQFjLD1m5m8MaE/Ga7Zo=;
        b=kZJ6rbjbmW4xSXgWEMIeH6vYACFUA4rKtM8gY2/ZlHQ4PjLterGoke+TRlnrPsYHK/
         A3V+m39874L19Si2JlYFXBuTZyMMZ1woJZSeYS+8pe2/yCAso7hGl6dZ/VHyscoqgy2E
         flzBI3x0s5hW97LimFRLX6tnhdi5Rx2+pfrRPYAH24wvjoUNbZMvWCWUMxmMSy+fNhrn
         LcjzfAXyJbJL2/wMDvD8JyvmttvIGzS4Z7VlhU9I4Io5eeE4CqSZ4Em3Xg/CO9ilSwbT
         4dfPcjTV6G2GZguhVA3idJc7hhFPbRFmM04PjIqBKERMX2qhsr/ciVIUVcmWKRC66nUU
         N/DA==
X-Gm-Message-State: AOAM532x1jreNvT8sSWxpa77kvRPs9j0HbhoCGsnm9AxMYfaYzw6YV7g
        yNasRBQF2lVhJu/89xyhOtWTri+xVb2TOxlOEiKZug==
X-Google-Smtp-Source: ABdhPJxxtR0OPGYVEO1/7vb7kbnBXMD+I/paJu6HkGuuGtYNqVTKZ9EOf7zEQWvfDhiN8YGLPygK/y8wp8RbQmBti50=
X-Received: by 2002:a19:7e92:: with SMTP id z140mr606891lfc.299.1601458931956;
 Wed, 30 Sep 2020 02:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200919200836.3218536-1-drew@beagleboard.org>
In-Reply-To: <20200919200836.3218536-1-drew@beagleboard.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 30 Sep 2020 11:42:00 +0200
Message-ID: <CACRpkdaA7uz+6307BAK91nLWF2qRVSQSkYs2MKjHCqDpDsXHPg@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: document pinctrl-single,pins when
 #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Sep 19, 2020 at 10:10 PM Drew Fustini <drew@beagleboard.org> wrote:

> Document the values in pinctrl-single,pins when #pinctrl-cells = <2>
>
> Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
> Reported-by: Trent Piepho <tpiepho@gmail.com>
> Link: https://lore.kernel.org/linux-omap/3139716.CMS8C0sQ7x@zen.local/
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
> v2 change:
> - rephrase to make it clear that the pin conf value and pin mux value
>   are OR'd together with #pinctrl-cells = <2>

Patch applied with the ACKs.

Thanks for fixing this!

Yours,
Linus Walleij
