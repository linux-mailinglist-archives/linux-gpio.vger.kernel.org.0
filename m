Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5050622627E
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgGTOsy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbgGTOsy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:48:54 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E328CC0619D4
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:48:53 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q15so22554570wmj.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DwUJWhYI7EDhj6o6beR5rWm8MiwiGAeMER6X1jHNG8Y=;
        b=ABhZoix+IuHnzu1IkPw8NOvNoW1BFcGjMpqWBa07PgtDgbsqiCDtRpsPWgrg5XY0V4
         z/KZT7+lAL4aaY1Pni5s7sHJ6CsO4ktmNC3gv+z3pb1vSA6AxlqgfhJyAt93y02RhXdZ
         zgK6vaL4+5IuwkOHL3oOcD+h6vlodridjDb3QoxrjnpeSfSxxGeBZ+X/rnfY+aGzszdn
         TSyn2eThwua/LH67KzSchjABzAAPEveDD7Rm1lo3MWfDEXdXPZk0C+pA4djzpPROSrO8
         /By7oaUTk0FYwKmOjJm7irLpX0fqkPjEpKqL9ATykd9M2CGBjsshX9QiMu/aWIL00HmH
         dwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DwUJWhYI7EDhj6o6beR5rWm8MiwiGAeMER6X1jHNG8Y=;
        b=HFBAXXR9Bw282vbIo7P8WidDmQNznGVSMy0WMmkgXyuyuodz/d1G/ysBtzvSoZZ2jU
         HCGCk+9MorcAqzbVbhrFoMlVno8cc1kZBBnmMtSvUe5dT5K1HFZfxVWVJhhyVzMYPqie
         fTmr79sUY5tpyYSbMj9uiGOT9LS4vC1aTdPGtOwRp/L0nS4V8PryNcZdfTGmJdYyw8Em
         Senf9kAnnTegt721CNFqmAM468re3mLat2G4A8enu7Ofdk2z3j6QX92aO1Bad4fLI5M/
         vpFUo/S2grvSnWnUPSFlf4oK3ldXRHOaSe4tXAm4PEUaLv6VJ+4os/xE2+yj8m1cbkra
         60/g==
X-Gm-Message-State: AOAM530uRRqOowCMsPx+8/t3zQ7wfmW6UgnOgxOpTKsljBzZM68s1hYW
        Y5qr300AUM9X0knw6tFUtR0DDQ==
X-Google-Smtp-Source: ABdhPJxmJKXA4V3y2ZB6Op6gUHESetgmya1frXxZiDcOn9PevGLzhPjqefcur4GG2y3AScfIl7eA5g==
X-Received: by 2002:a1c:dd86:: with SMTP id u128mr21394166wmg.131.1595256532527;
        Mon, 20 Jul 2020 07:48:52 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id j6sm35260375wma.25.2020.07.20.07.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 07:48:52 -0700 (PDT)
Date:   Mon, 20 Jul 2020 15:48:49 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 08/25] pinctrl: samsung: pinctrl-s3c64xx: Fix formatting
 issues
Message-ID: <20200720144849.GB3368211@dell>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-9-lee.jones@linaro.org>
 <20200720142836.GC6747@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200720142836.GC6747@kozik-lap>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 20 Jul 2020, Krzysztof Kozlowski wrote:

> On Mon, Jul 13, 2020 at 03:49:13PM +0100, Lee Jones wrote:
> > Kerneldoc struct titles must be followed by whitespace else the
> > checker gets confused.
> > 
> > Fixes the following W=1 kernel build warning(s):
> > 
> >  drivers/pinctrl/samsung/pinctrl-s3c64xx.c:212: warning: cannot understand function prototype: 'struct s3c64xx_eint0_domain_data '
> > 
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: linux-samsung-soc@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-s3c64xx.c | 6 +++---
> 
> Thanks, squashed with s3c24xx since these are similar issues and only
> documentation is affected.

This is already in -next.

Seems like an odd decision to squash them too.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
