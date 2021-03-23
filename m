Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2D7346151
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Mar 2021 15:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbhCWOTc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 Mar 2021 10:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbhCWOSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Mar 2021 10:18:53 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D28B9C061765
        for <linux-gpio@vger.kernel.org>; Tue, 23 Mar 2021 07:18:52 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id a8so17151718oic.11
        for <linux-gpio@vger.kernel.org>; Tue, 23 Mar 2021 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ytJvpAsy7oFoxUq3vApvk64rCGUzRxHQsHvMZr4O6zg=;
        b=xH51TtUu8fD1ohLBic2PN0z1rb80qrGVGQs/1HMcUax4wknb1+RUKU0dLa96ch4afu
         vZCLoSx/Hoa7tm6WjrJjZABhl7aOdKORSPiZbl3cIt1hzHNLI7FMis8od+L1acb8UAoF
         FvEBLs4os1BcrTwOgwtNOA/s/JnarW5/ifzCosc2gxglTxy2AL4dMsGXMbVlI2DKIQ42
         aKeDBCNfmhNeTYYFFW55lYY2lKlkfWJdNHE0hk4pPfyDPos+rMyc21IbvmAN2HCM+fMv
         1RvKi9wavE/NWdhSgEjdsHRAzxt+xtLAOkBB7uFMtKrv8rNglXvmsgUn0p3AkfHe5AVY
         QXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ytJvpAsy7oFoxUq3vApvk64rCGUzRxHQsHvMZr4O6zg=;
        b=nj8WIbry2RISXwIBpUCf8Sd2Zlxqc4E4eqTnj0HYW5ws2+MsDcGq9DMyOgjDBr2n+F
         qZ21mlVxrlxRDOm8ZSv11cGwCGDqoNhjGji9ah8gkPK8CFrkgzPAYXBuo2mAk/dpaF89
         We524O6tR6clQCjSc/nd7h/6Dn6Kb0TTjcVGPe0TqOji2aPZ9zeJQg/vtIc/KIv/aMWc
         /0jZd0ornl5k/TGvTF6J4nzB1qrYgr2o56f1mIIW7L+rAaagiEcfrBX3LUQGH80EWYyh
         QIpLO+WVSdaf/rxcsz8ADim8on7+Iu2o2XL4we6JD5JVPZLqOm6WOTL0hatBxBJ9uWgQ
         mfmg==
X-Gm-Message-State: AOAM531KZvfCvePvc7d1GpEHvVj7Zwj4j9qtk9pQx7m6SGIsl2WLNKgP
        qmmugGlXH3SpDYVR3RbPwozJLQ==
X-Google-Smtp-Source: ABdhPJxyZ7MoYj/u8BVSgC0Gu8pWVUgKtLipkxfd8h159j9s13hNKvYLRZbanWyv00Qy2/9tgHe1Xg==
X-Received: by 2002:aca:d442:: with SMTP id l63mr3536830oig.49.1616509132104;
        Tue, 23 Mar 2021 07:18:52 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t2sm3708079ool.18.2021.03.23.07.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 07:18:51 -0700 (PDT)
Date:   Tue, 23 Mar 2021 09:18:49 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jeevan Shriram <jshriram@codeaurora.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] pinctrl: qcom: fix unintentional string concatenation
Message-ID: <20210323141849.GG5254@yoga>
References: <20210323131728.2702789-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323131728.2702789-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue 23 Mar 08:17 CDT 2021, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang is clearly correct to point out a typo in a silly
> array of strings:
> 
> drivers/pinctrl/qcom/pinctrl-sdx55.c:426:61: error: suspicious concatenation of string literals in an array initialization; did you mean to separate the elements with a comma? [-Werror,-Wstring-concatenation]
>         "gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
>                                                                    ^
> Add the missing comma that must have accidentally been removed.

That's certainly a useful warning! Thanks Arnd.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> 
> Fixes: ac43c44a7a37 ("pinctrl: qcom: Add SDX55 pincontrol driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-sdx55.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-sdx55.c b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> index 2b5b0e2b03ad..5aaf57b40407 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sdx55.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sdx55.c
> @@ -423,7 +423,7 @@ static const char * const gpio_groups[] = {
>  
>  static const char * const qdss_stm_groups[] = {
>  	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio5", "gpio6", "gpio7", "gpio12", "gpio13",
> -	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19" "gpio20", "gpio21", "gpio22",
> +	"gpio14", "gpio15", "gpio16", "gpio17", "gpio18", "gpio19", "gpio20", "gpio21", "gpio22",
>  	"gpio23", "gpio44", "gpio45", "gpio52", "gpio53", "gpio56", "gpio57", "gpio61", "gpio62",
>  	"gpio63", "gpio64", "gpio65", "gpio66",
>  };
> -- 
> 2.29.2
> 
