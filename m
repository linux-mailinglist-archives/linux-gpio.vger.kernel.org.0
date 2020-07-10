Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4746B21B6A9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2020 15:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgGJNlG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Jul 2020 09:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgGJNlF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jul 2020 09:41:05 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1902BC08C5CE;
        Fri, 10 Jul 2020 06:41:05 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 17so5954503wmo.1;
        Fri, 10 Jul 2020 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NVk9Crf1mCP3Su/M8SoSn97qMooLpR/mAl9IlnwRJA4=;
        b=Uu1sn5nNB7Sk2aNPazNIEFCtVdCcpdH5lCco4ygL+kTt2/PBhi60P50AbM8xQppP0F
         RKlf6pAgK5Qxxu7cZ2MGRnKr0V+Ifqyo6hkYynfPWMAGloJ48EFCp3q1gwjhFaDdDhK1
         nrfuGcEh+xwG9imoD9iwlHfI+LDW+7e/6Amw0VsP9kH0zTMG+MTECRYAqJV4NFYumOpx
         KbNeOvHHFJmB7BgNJRUG0Jy9KTCXsRrtlklumKed15meJmAfbgXUNIRkn+Fmq1k0OuT8
         gcNlJLwXZdqsP7IKKVXaXsduUuedTY3Drg5Mg7YZt8wc4vEdYDE8CQiQBupiH1e5H1cV
         0TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NVk9Crf1mCP3Su/M8SoSn97qMooLpR/mAl9IlnwRJA4=;
        b=XxpPElfR1vROFd/tHwuFo3GkE+DItImypjkkqjuK7mY2T0Xe30rvM3V2FlXyjOSelg
         6OmbwSG8mSCQ6C67BmeOCn+c5RJY5Lf1C1UcH+GvkZ46QgDT9rauMmEpT5X5rFXhQ+Xa
         8ANpfi1gJ/JHr6aMgrJUEdChDlUWTjNBrPduZ881Ygu3ny874HNk5TOa6XiBdhepZ0tV
         Jwa8sYkEfN5P9zhZ0qCEuW2vX8/hux76LxlgwVJFS4wUM+uNb/eqTrqABE0icn0E4fv9
         cqrwdYoINL+IlhL9uJhbMTqllCii7cle8e0uwMkp4Is6Af2PqMIG8DO/xgdFEQqyD/Rq
         4z+w==
X-Gm-Message-State: AOAM530g/v6ecsAQgnuIy59KJl7lzhmf/DG6T0fE60SGJKiqDUOj0iT5
        ChNW1nnb2LG04UwRwBgUOgg=
X-Google-Smtp-Source: ABdhPJwL7Z6KQEina07YIcKXYKWMe2+LNfZsMpS9zXaDbsoXqyM4gJxLLC96zjezb0mkvVPil/F5+A==
X-Received: by 2002:a1c:ab56:: with SMTP id u83mr5071631wme.94.1594388463868;
        Fri, 10 Jul 2020 06:41:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
        by smtp.gmail.com with ESMTPSA id g195sm9714253wme.38.2020.07.10.06.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 06:41:03 -0700 (PDT)
Subject: Re: [PATCH v7 6/7] clk: mediatek: add UART0 clock support
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>
Cc:     mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <1593694630-26604-8-git-send-email-hanks.chen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c40d2739-92a1-3309-764a-ed3ac8ee7bc6@gmail.com>
Date:   Fri, 10 Jul 2020 15:41:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593694630-26604-8-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 02/07/2020 14:57, Hanks Chen wrote:
> Add MT6779 UART0 clock support.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mt6779.c |    2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
> index 9766ccc..6e0d3a1 100644
> --- a/drivers/clk/mediatek/clk-mt6779.c
> +++ b/drivers/clk/mediatek/clk-mt6779.c
> @@ -919,6 +919,8 @@
>   		    "pwm_sel", 19),
>   	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm",
>   		    "pwm_sel", 21),
> +	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0",
> +		    "uart_sel", 22),
>   	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1",
>   		    "uart_sel", 23),
>   	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
> 
