Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA9B38C9CA
	for <lists+linux-gpio@lfdr.de>; Fri, 21 May 2021 17:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhEUPKX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 May 2021 11:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhEUPKV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 May 2021 11:10:21 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A289BC061574;
        Fri, 21 May 2021 08:08:57 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso7335014pji.0;
        Fri, 21 May 2021 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZK5vDUvIgC6bF48AUmy/OX+Gvz7Keg1NucsMNX6Zy4o=;
        b=Dx9XkbBe/GmK+FqmIbzp0hVenlj7MFt21Nz/kQwk43TKsYOEi/sCG+pnhjucrJlB4q
         jRqOR4U2z9qArpH/YOhny/fD/vxBvpic0qZS2jCRM50tbrp1x2/nAUbFVLP7Qi19JCNn
         qE+wcRC2PDchPNCgBK/kplZ23l4XdAGwwvK+devv43Tmy2PXYdX97oc1fqD8wahEWSJM
         S61yrAdAUsXDHexNw5S8uDNv9I5m5zDfnwbBzysVhBp7QDRB17vjUxauVdwpiCZ5QOm6
         GSKGV9qn/UZSHH/cHz1QKfJLUx8l+eGWf0kuCA7n9SDNwDoPDs6CXjEoCKn+r8OWexA7
         I/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZK5vDUvIgC6bF48AUmy/OX+Gvz7Keg1NucsMNX6Zy4o=;
        b=bmrpmCHmBaOz+symqFd7oSYAKOpoLGfqoqbjM8ahu0rSYeC6RY+fBow7tWNih7BK9x
         7iyvi/RscY5wVgPxV/4L/SQBJPBu6ClH9r4/+AapALXvJGBZoUq9U3quKEuqK3jb9861
         ljPG6ig5dOgZqLrD1holSUXGnlaFyGBmGHU+GiiI7n1S7ZQf20XZF3fZyKx6ziZJkhLk
         5REVHrOiYJO5MJmau0qW5+wJU35bJWVxV7zClo0AHVpXuPy3Cxbt6ht6zSE09A8ttAX+
         KS5Ud+RDTiZ6awfJMybmYCp33eq2WzIUe3cY4rpihOtYRPuaWe64FqfLmwjq0ADQgejE
         f+Gg==
X-Gm-Message-State: AOAM532n8/P+/jvWTjig3VQj8RWNofulxwe5zzqzPKwFbngKpfhbeP9e
        PS5oF1GlcfSo7kTcKXyhfT6yHfFsa5s=
X-Google-Smtp-Source: ABdhPJwCvPiXdUhwh8fr71RC4veZs/oxr51w/F6wONFAA1gyWJCkV4ltIEByJrdN3ZMeHTUqHNOGzQ==
X-Received: by 2002:a17:90a:5309:: with SMTP id x9mr1458823pjh.111.1621609736739;
        Fri, 21 May 2021 08:08:56 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id h26sm4443160pfo.203.2021.05.21.08.08.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 08:08:56 -0700 (PDT)
Subject: Re: [PATCH] pinctrl: bcm2835: Accept fewer than expected IRQs
To:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210521090158.26932-1-iivanov@suse.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <47bf2b41-d42f-fb25-ee9e-5527f3324b17@gmail.com>
Date:   Fri, 21 May 2021 08:08:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210521090158.26932-1-iivanov@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 5/21/2021 2:01 AM, Ivan T. Ivanov wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> The downstream .dts files only request two GPIO IRQs. Truncate the
> array of parent IRQs when irq_of_parse_and_map returns 0.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 1d21129f7751..2c87af1180c4 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -1274,9 +1274,13 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
>  		char *name;
>  
>  		girq->parents[i] = irq_of_parse_and_map(np, i);
> -		if (!is_7211)
> +		if (!is_7211) {
> +			if (!girq->parents[i]) {
> +				girq->num_parents = i;
> +				break;
> +			}
>  			continue;

This assumes that interrupts are specified in an ordered way and skipped
in an ordered way as well, however given that we just hand
girq->parents[] to the GPIOLIB core, I don't really see a better solution:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
