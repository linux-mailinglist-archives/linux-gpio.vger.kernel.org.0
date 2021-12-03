Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DED1467139
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 05:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349710AbhLCErH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 2 Dec 2021 23:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349446AbhLCErG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Dec 2021 23:47:06 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BD3C061758
        for <linux-gpio@vger.kernel.org>; Thu,  2 Dec 2021 20:43:42 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id nh10-20020a17090b364a00b001a69adad5ebso1488226pjb.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Dec 2021 20:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7mPNLk8tLdK5DDTbw5bfTCjo4IkSyEGMOB9BFirxYGU=;
        b=IKaG1hPcKKzPHkdxz/tFVlAXS0Rd3Pi0CjIPnWAs/jCYFkJoX/NX/d9eKwVd95LCR5
         mgjMTmnUo7tttI5MfgoaeA0Q/eCsjbeKMuzZrHzkZGVN3citeLjiM8P1yiMwBex0zxn8
         nnveMoYL8JYU+YyKGzCnDsC4RcjfDxMwpMZM0OB+SsZOOSDcYNdWcOcovEvPhKlqezkT
         dG0Kmamp6TtuDUZIpZkapyNFQzFy7K660wHDQRBqRKAA7YT27tw/vwf/0t7iseb6z9J8
         EDpthKxwTiqh5ChWlEBtcNNCeGoXl8fzzfWD4HgyWv0GEWwZpzxIFZPlsDLQNqgeogUX
         2erg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7mPNLk8tLdK5DDTbw5bfTCjo4IkSyEGMOB9BFirxYGU=;
        b=WW1oJHpr7wPsDr2q6GALj5dfVrnoe7+GGqAR65N1r0Fk1emfC58E1/ELJPRqrsUgyR
         V/1ycgwMSGrD8+NsoBjwrD7YJ2qMdLGjnbar6uZ6yOBtYqkAwhSiesS5w1yCDJjURoof
         GNBn970+5lTXsSBbYHReiYreYUvLdlBi2bKiWwPRWX1HRlwRAsnt7E2QvDKgzLmeiELY
         7JS+OcssxkEdiWhFHZQNEdqybd+UcIUKPa3oxnStJnRyOIHWmzRLs8pt7ts8q/ka0+Xt
         Djh4OujRAb0qshapsU4eOSG2KKQzep/q4LifTkC1sMqTlqABUBOyECsuhwcvRuyp0R3d
         X30g==
X-Gm-Message-State: AOAM533Qh0VhAbS5muzkl3qNNruwgM1uuDrcj6LnSyYxZi5zHFuBKjG1
        1U2ssrN59lLf1m45sfrtFnnBhQ==
X-Google-Smtp-Source: ABdhPJz327okhh8voT4wIIAxhUoaKYcbIWi4Cfjeksrhd/QxBYsPqkMeYfKWpfxR7/l6L7m4/VzNFw==
X-Received: by 2002:a17:902:7b82:b0:143:a6d6:34ab with SMTP id w2-20020a1709027b8200b00143a6d634abmr20058440pll.30.1638506622012;
        Thu, 02 Dec 2021 20:43:42 -0800 (PST)
Received: from localhost ([106.201.42.111])
        by smtp.gmail.com with ESMTPSA id d10sm1353449pfl.139.2021.12.02.20.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 20:43:41 -0800 (PST)
Date:   Fri, 3 Dec 2021 10:13:39 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 0/6] spear: Fix SPEAr3XX plgpio support
Message-ID: <20211203044339.exx77afqgkbdhqgs@vireshk-i7>
References: <20211202095255.165797-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202095255.165797-1-herve.codina@bootlin.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 02-12-21, 10:52, Herve Codina wrote:
> Hi,
> 
> This patch series fixes the plgpio support on SPEAr3xx SOCs.
> 
> The first four patches of this series fixes a ressources
> sharing issue between the plgpio driver and the pinmux
> driver.
> Indeed, these two drivers can use the same IO address range
> on some SPEAr3xx SOCs.
> To solve the issue, a regmap (syscon managed) is used in both
> drivers and the plgpio driver can reference the pinmux regmap
> to use it.
> 
> The second part of this series is related to IRQs.
> The plgpio on SPEAr320s SOC uses an IRQ line in the reserve
> range (from SPEAr320 point of view).
> This issue is fixed enabling all the 'reserved' IRQs and
> adding a dtsi file for the SPEAr320s with the correct interrupt
> for the plgpio node.
> 
> Best regards,
> Herve
> 
> Herve Codina (6):
>   pinctrl: spear: spear: Convert to regmap
>   pinctrl: spear: plgpio: Convert to regmap
>   pinctrl: spear: plgpio: Introduce regmap phandle
>   ARM: dts: spear3xx: Use plgpio regmap in SPEAr310 and SPEAr320
>   irq: spear-shirq: Add support for IRQ 0..6
>   ARM: dts: spear3xx: Add spear320s dtsi

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
