Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEC9226211
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Jul 2020 16:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgGTO1d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Jul 2020 10:27:33 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36204 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgGTO1c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 10:27:32 -0400
Received: by mail-ed1-f65.google.com with SMTP id dg28so12918969edb.3;
        Mon, 20 Jul 2020 07:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WUqMYmm1tBjWN8rDa5/lH0f29faFioQqlLBrnGrzJjU=;
        b=ASXK/hNWr4IbhRGz/rTNTPghP1BlEP1uX7YODjnM7wtIyMy7tVfiwi3iQ2qkBAfehp
         NWF12WprensGa07qlWtp/o4ZFKcm+/JF2Jxnij+a1NKfKQGx/7mgnKRhTAmSYfQN+ixI
         RImkyv2zBUw6RkfzQB/ZTt+sMRPWIGYecJNudyBVDdC15g75QUJh86vBOteN3ea4f6oD
         Y0kHF09JBw5Oo1NFDNHBFhG2WirMSfn98Q5PtzuEPTYlOUv26ps7ViDXhvdXwpbgt6lH
         VeA4cbEqGpyykM4HhXhN87YGbQP2IkZj6IAZcBrtetfJLat8ENRaOWyQ5jaoYhddkwkV
         zkag==
X-Gm-Message-State: AOAM5323yyyG0aCgTMA4detbAjbjQG+YAOOoIUUuV/jBOa1BTVtU328C
        FfFfPdeiNSg7Ox0jScZkMIQ=
X-Google-Smtp-Source: ABdhPJzDYhs5S+ljtAHKafQIXjPtBz0lcQj1UO/SMFfCr8WneiloeP41cEVnNDjJTOKAXi8ok/P3uw==
X-Received: by 2002:a05:6402:1777:: with SMTP id da23mr21188357edb.260.1595255250573;
        Mon, 20 Jul 2020 07:27:30 -0700 (PDT)
Received: from kozik-lap ([194.230.155.200])
        by smtp.googlemail.com with ESMTPSA id s21sm15351891edw.37.2020.07.20.07.27.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jul 2020 07:27:29 -0700 (PDT)
Date:   Mon, 20 Jul 2020 16:27:27 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 07/25] pinctrl: samsung: pinctrl-s3c24xx: Fix formatting
 issues
Message-ID: <20200720142727.GB6747@kozik-lap>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-8-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200713144930.1034632-8-lee.jones@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2020 at 03:49:12PM +0100, Lee Jones wrote:
> Kerneldoc struct titles must be followed by whitespace.  Also attributes
> need to be in the format '@.*: ' else the checker gets confused.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c:100: warning: cannot understand function prototype: 'struct s3c24xx_eint_domain_data '
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/pinctrl/samsung/pinctrl-s3c24xx.c | 6 +++---

Thanks, applied.

Best regards,
Krzysztof

