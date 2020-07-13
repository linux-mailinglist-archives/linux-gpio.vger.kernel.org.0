Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695A421DF38
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2020 19:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbgGMR7F (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jul 2020 13:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbgGMR7F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2020 13:59:05 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46B8C061794
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 10:59:04 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z15so17542095wrl.8
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jul 2020 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=E18MAc0nkNbRTaxZd2OKURgPcHFN+ctVoY0tSbowupY=;
        b=KlMoSwm5GaRFwhGjudQHPHcNvOf6igTkPDH8EHdajH4zxPSjFP5rWmd17z1bcVLsm7
         LkOYqJqhFKEuhZnCPZ22PWInbkhdW8r2Bozugx2h0/3rPCcTYBlXacgOO2+Rirf0kffM
         EktHYj9Gzh4+L0aTBpPZAYuSEFVF0wqPMq/O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=E18MAc0nkNbRTaxZd2OKURgPcHFN+ctVoY0tSbowupY=;
        b=Z7P6D07s62ReIKKyc5lN/ud5S2ATGTQoE2osoJFYPU/vPSxAIQbtS+FkRIoOio5J6i
         VzD3pXyiYpHRSFl55PGY6hqAgfTESsfVLw8M07DqoTWgrdd0DVqABsJzqrjOz2FW9iss
         3IAhxKNGJFW9npitQgvDpsa2M+dhellJMpMdkDghgQT3Th2R/1+mak7s2drKZPlI2vxp
         6Ob3mdUhrt4qeq43Cx4+8dkEbwAIxMQ+ygT5HufagEH7g4cJ4NHm0/k5MqiG7AAL+O0R
         vMTXTN1+kbHcb+auZT5hsOWssrgutmGPaPaIHH8lOCA7TN43UBXSxZq1riDwSs89xTCF
         UbKA==
X-Gm-Message-State: AOAM530ZPBaQPqZI3iyy4HMPCHKlrd/GOKOIBzTAyxyItGoUNztG/gQj
        +2HZUG6+7hglZJkolAJfZt/7HA==
X-Google-Smtp-Source: ABdhPJwwageRyXNotoFdi435qR8tmlg2BgI5l+TGsSxD9nhW3MH9X1s0J4ee+M52L6C+NqBGu+nVZQ==
X-Received: by 2002:adf:8091:: with SMTP id 17mr586143wrl.13.1594663143216;
        Mon, 13 Jul 2020 10:59:03 -0700 (PDT)
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id f197sm510542wme.33.2020.07.13.10.59.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 10:59:02 -0700 (PDT)
Subject: Re: [PATCH 04/25] pinctrl: bcm: pinctrl-iproc-gpio: Rename
 incorrectly documented function param
To:     Lee Jones <lee.jones@linaro.org>, linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-5-lee.jones@linaro.org>
From:   Scott Branden <scott.branden@broadcom.com>
Message-ID: <61bf1345-be78-a303-1199-7275fa5c6d89@broadcom.com>
Date:   Mon, 13 Jul 2020 10:58:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713144930.1034632-5-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

thanks.

On 2020-07-13 7:49 a.m., Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
>
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:141: warning: Function parameter or member 'chip' not described in 'iproc_set_bit'
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c:141: warning: Excess function parameter 'iproc_gpio' description in 'iproc_set_bit'
>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index a38f0d5f47ce9..e2bd2dce6bb41 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -131,7 +131,7 @@ static inline unsigned iproc_pin_to_gpio(unsigned pin)
>    *  iproc_set_bit - set or clear one bit (corresponding to the GPIO pin) in a
>    *  Iproc GPIO register
>    *
> - *  @iproc_gpio: Iproc GPIO device
> + *  @chip: Iproc GPIO device
>    *  @reg: register offset
>    *  @gpio: GPIO pin
>    *  @set: set or clear

