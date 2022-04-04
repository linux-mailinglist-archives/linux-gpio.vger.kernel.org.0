Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE3C4F150B
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Apr 2022 14:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347199AbiDDMnh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Apr 2022 08:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346196AbiDDMnf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Apr 2022 08:43:35 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E975B3A702
        for <linux-gpio@vger.kernel.org>; Mon,  4 Apr 2022 05:41:39 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id w4so14262107wrg.12
        for <linux-gpio@vger.kernel.org>; Mon, 04 Apr 2022 05:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=DUL8S2OoMyRqG/7s7R2uoNem727ljU5XkfbK9p9cv8E=;
        b=jfIyJSwm7twCD2gonoFI5cvJ1q989UYupliKqNo5taQD3EC5fk8JIG6tFGn9rPvnIh
         rFW8S0rhW86K58S2y5RliT4UjSAttaoPQuiC+syqjzC0+96Nef5Oypi2MQqj3bojMRYq
         BQluEagVa7jVK0SSg54Oj/TdeWKLapd2l7Q12iUI0mBDrXv0lBfFUAo7B+MU84Zht4xb
         iQH1h23lkNATwU6CGnvxPBtSAS+7bJiGqck493YCSpJg15u0ElPPCQvqGn9bvejMrqcL
         fCTooY9hQRwfyjjq+hzJAB6Wn24VbZIdM3WAJlIEn4XzZJYo66bpFGHSE6gwUlpuXIRp
         ewXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=DUL8S2OoMyRqG/7s7R2uoNem727ljU5XkfbK9p9cv8E=;
        b=icYNuBUTc2MBlgR95lZXuvDLMM47gbAD9v/t/YUlWKgHXVotuJTqAjZRVkpkcwAaAS
         q2hNrvDfjsT3Ma0AmZTriHcLYHtXxac+c/0I35ExWEBCMiLJV39aJ8JQAuywvDTseKu9
         0OaRcP8jLsMU6wKKYguKWgoRM0jixj9pFHhxtuW7ap4SX7177rpWh2pMPzzHwh6KsXDA
         tr5AErw8wKzPtplAzkQfyFwE/wrA0h75/9gRK4iSc2FK2ILCAB1fFSSMzeV5Ogvc4pJt
         rZpPThEWLmuDhZphlpuTWKPOmFhPCpijx8KiaqkQ0eIO+SDXy5jiBnQXtoAzBlhE/OrO
         p2dw==
X-Gm-Message-State: AOAM5318QxHlR5pCPoUV+5berrYQT/wpOO0JPctQ8GAq9S7ydqpOGDfX
        9EQ1FCsEVuvZTLtV6kEjVcnQHg==
X-Google-Smtp-Source: ABdhPJxIvCW+TSeCMCYrtX59dAKO6en+LRllfjmQ29fzb7TMQBy6ka32MfCRQwy7hwenEnWYNF6F2g==
X-Received: by 2002:adf:d081:0:b0:203:e209:7def with SMTP id y1-20020adfd081000000b00203e2097defmr16839540wrh.388.1649076098346;
        Mon, 04 Apr 2022 05:41:38 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46? ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
        by smtp.gmail.com with ESMTPSA id i10-20020a0560001aca00b00203daf3759asm9772755wry.68.2022.04.04.05.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 05:41:37 -0700 (PDT)
Message-ID: <05e7917b-adaf-53d9-c3af-7d65b5f39ac7@baylibre.com>
Date:   Mon, 4 Apr 2022 14:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] pinctrl: meson: fix unused variable warning
Content-Language: en-US
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220330023720.18238-1-qianggui.song@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220330023720.18238-1-qianggui.song@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 30/03/2022 04:37, Qianggui Song wrote:
> The kernel test robot reported a warning as below:
>>> drivers/pinctrl/meson/pinctrl-meson-s4.c:178:27: warning: unused variable 'tdm_sclk1_c_pins' [-Wunused-const-variable]
>     static const unsigned int tdm_sclk1_c_pins[]            = { GPIOC_3 };
> 
> Fix it by adding missing description about this pins
> 
> Fixes: 775214d389c2 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson-s4.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> index 3c7358f53302..cea77864b880 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> @@ -575,6 +575,7 @@ static struct meson_pmx_group meson_s4_periphs_groups[] = {
>   	GROUP(tdm_d2_c,			4),
>   	GROUP(tdm_d3_c,			4),
>   	GROUP(tdm_fs1_c,		4),
> +	GROUP(tdm_sclk1_c,		4),
>   	GROUP(mclk_1_c,			4),
>   	GROUP(tdm_d4_c,			4),
>   	GROUP(tdm_d5_c,			4),
> @@ -936,7 +937,7 @@ static const char * const iso7816_groups[] = {
>   };
>   
>   static const char * const tdm_groups[] = {
> -	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c",
> +	"tdm_d2_c", "tdm_d3_c", "tdm_fs1_c", "tdm_d4_c", "tdm_d5_c", "tdm_sclk1_c",
>   	"tdm_fs1_d", "tdm_d4_d", "tdm_d3_d", "tdm_d2_d", "tdm_sclk1_d",
>   	"tdm_sclk1_h", "tdm_fs1_h", "tdm_d2_h", "tdm_d3_h", "tdm_d4_h",
>   	"tdm_d1", "tdm_d0", "tdm_fs0", "tdm_sclk0", "tdm_fs2", "tdm_sclk2",

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
