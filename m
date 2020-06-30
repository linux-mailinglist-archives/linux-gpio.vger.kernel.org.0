Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DB020FFE2
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 00:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgF3WIO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Jun 2020 18:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgF3WIO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2020 18:08:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE75EC061755
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 15:08:13 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id q15so20245091wmj.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2020 15:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h7TDtlGCpE+9NIF4eS7MT43wTOS1FJJy0Om2MAQ0voA=;
        b=ZJWhYNW80aP0UjLF2kYUMHvCiLGwyo9hylEay2xarposLoORgE2Ch0QRE90zfu7d4C
         HcWcdBfALIPOnUa82U8dsC9oj0/Qs7AQ4dWDhzRlqFbMQLj9OshNPw3e431Bqr9DV47R
         1dE/paxnDLFlc100OSaSsF8nYGx8mKkaMx3kM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h7TDtlGCpE+9NIF4eS7MT43wTOS1FJJy0Om2MAQ0voA=;
        b=eugXFRBw/vLv2fJGd8pAxjh/OX6SyChvTog1kJPHryh18IAyhSqhrbJgzJGoTrtapQ
         6f4QvJFIZHYelQBBqbWLEghSU9MdJjLjiZGAaW6c3WVFSMx+wpjEbW741NrsuvpJL0Zi
         fzup3YEawHXWAvWjwERd1U1kxQvukA3X4hmnrNWnyBgKvKYKFYexNjt58NohI0Z30XVW
         bD27E3Kq9n4ZRfzqAeJeKBWKRgZyWgQNbEnrLW5/rk+3zUnF7Ae4xOGp87pDZugK3j3o
         A2Wbobx42wndBExz7mg/qzyBBY+JsO0GqE3xp/N2FvvmmW6VVJTaCFS9EjSZcnvx8jvP
         k7ZA==
X-Gm-Message-State: AOAM532Y4tDtnMTPLQBkI6Ey9kKU9GiVngbfMB9neabMhe0CgsHvpkWo
        /KMl0bHy4UXczDW1HkC2rhiy4w==
X-Google-Smtp-Source: ABdhPJzjZhl1qhrkUOIUo/m25AEPI8WGU/fDVfZi71HnMPSFwWnuM9w7rn5qy3jXU3ZrOXB6iwh9xg==
X-Received: by 2002:a1c:24c6:: with SMTP id k189mr24732162wmk.9.1593554892402;
        Tue, 30 Jun 2020 15:08:12 -0700 (PDT)
Received: from [10.230.182.181] ([192.19.224.250])
        by smtp.gmail.com with ESMTPSA id e8sm5092967wrp.26.2020.06.30.15.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2020 15:08:11 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: initialise nsp-mux earlier.
To:     Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
From:   Ray Jui <ray.jui@broadcom.com>
Message-ID: <a1dc8f14-187d-a804-45bb-d1fa25ff7b01@broadcom.com>
Date:   Tue, 30 Jun 2020 15:08:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200630212958.24030-1-mark.tomlinson@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Mark,

On 6/30/2020 2:29 PM, Mark Tomlinson wrote:
> The GPIO specified in the DTS file references the pinctrl, which is
> specified after the GPIO. If the GPIO is initialised before pinctrl,

May I know which GPIO driver you are referring to on NSP? Both the iProc
GPIO driver and the NSP GPIO driver are initialized at the level of
'arch_initcall_sync', which is supposed to be after 'arch_initcall' used
here in the pinmux driver

> an error message for the -EPROBE_DEFER ends up in the kernel log. Even
> though the probe will succeed when the driver is re-initialised, the
> error can be scary to end users. To fix this, change the time the

Scary to end users? I don't know about that. -EPROBE_DEFER was
introduced exactly for this purpose. Perhaps users need to learn what
-EPROBE_DEFER errno means?

> pinctrl is probed, so that it is always before the GPIO driver.
> 
> Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
> ---
>  drivers/pinctrl/bcm/pinctrl-nsp-mux.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
> index f1d60a708815..7586949f83ec 100644
> --- a/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
> +++ b/drivers/pinctrl/bcm/pinctrl-nsp-mux.c
> @@ -639,4 +639,4 @@ static int __init nsp_pinmux_init(void)
>  {
>  	return platform_driver_register(&nsp_pinmux_driver);
>  }
> -arch_initcall(nsp_pinmux_init);
> +postcore_initcall(nsp_pinmux_init);
> 
