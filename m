Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4E995287C7
	for <lists+linux-gpio@lfdr.de>; Mon, 16 May 2022 16:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241191AbiEPO6n (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 May 2022 10:58:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244891AbiEPO6d (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 May 2022 10:58:33 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8E53B554
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 07:58:29 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id y22-20020a4acb96000000b0035eb01f5b65so4075640ooq.5
        for <linux-gpio@vger.kernel.org>; Mon, 16 May 2022 07:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BmMxxJNBMXkETqnAggznerwbpuGU049yThiwMTgkfdU=;
        b=Gk6kkS4R99vsEV9fdkVuEJk4mXZvNweHQLY8VjEkAOhxw3xlVzaG3y3Kj9Rnbf/0JZ
         fPlSa8gMFoasLj/twP5U3ZVVtxaUdabqEe8NRcHI9VAuwdU33zPuaVc0EuiurOzF4if/
         QKnLhZrWpPgOBeQxjKN5wjewdBH4LmVtcn+s121jRRdFprZtt+ZQOL3MbE7iCN0AqSBT
         2Xx/YDulSF0zpaaNiitE9hE2WCHI+IQdGMuZA33rXyjNzzNV3XwXZ26WeJ59/CuqWk7Y
         KgM6BDq8u1hvfQr4qCH0xbmGN4+3B+91yt/lkq0SNlZmgm4DqXPlG9waIrfyZ+Wy+pcJ
         kvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BmMxxJNBMXkETqnAggznerwbpuGU049yThiwMTgkfdU=;
        b=BSVpoQuDvrCUWthPU0bQnJpn575n0GMqBsdgzSB6c32LmY+WiD8oHGiPAexBdQxkro
         7rxs56s/gUb0dKfpNT7R0xFoJeM/hemf2zYysedOzjZYXUW0qPgtMKhWWr9tqMJTnr6g
         Ion6VtR7rLc/rbKXpaoxPHC9ruiEIZdw/Y7hAQxmyJpVKAhMqsKqGiHegGFhKqOC+ocs
         zSHdYsBC53exP4kBX7HEursQ4rrd+N38Fq18jzAkimw0/Y3+etP+vrGeUpQbfjPHpn4h
         8byL6N+fmgP0STnYagoRY6FVd+FlIoa8ftBpjkvLf8/E7KpvSQ21UuGhLyNQ/ggYMc+Q
         BSGg==
X-Gm-Message-State: AOAM531GgVYaylaklOkXiXnEDmh5QtF4vujjEXi6qOgLiZefksWEAnwm
        vjNMSxK6b4RDst3njHfD4kjj7X/MdF0g/Q==
X-Google-Smtp-Source: ABdhPJxfeAAzbs/cxASCwiCKMhDGVI4YkhQPfGFqG9BnVH/WAKUrkzyFcFAhS/NY/v/Dc/6r9XRSwQ==
X-Received: by 2002:a4a:d450:0:b0:324:c398:7305 with SMTP id p16-20020a4ad450000000b00324c3987305mr6094736oos.45.1652713108955;
        Mon, 16 May 2022 07:58:28 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u7-20020a056871058700b000e686d13876sm5535918oan.16.2022.05.16.07.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:58:28 -0700 (PDT)
Date:   Mon, 16 May 2022 08:00:52 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] pinctrl: qcom: spmi-gpio: Add pm6125 compatible
Message-ID: <YoJnJAZ/RzpSYC90@ripper>
References: <20220511220613.1015472-1-marijn.suijten@somainline.org>
 <20220511220613.1015472-4-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511220613.1015472-4-marijn.suijten@somainline.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 11 May 15:06 PDT 2022, Marijn Suijten wrote:

> The pm6125 has 9 GPIOs with no holes inbetween.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index a0c45b305981..fd5fff9adff0 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1146,6 +1146,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
>  	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
>  	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
> +	{ .compatible = "qcom,pm6125-gpio", .data = (void *) 9 },
>  	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
>  	{ .compatible = "qcom,pm6350-gpio", .data = (void *) 9 },
> -- 
> 2.36.1
> 
