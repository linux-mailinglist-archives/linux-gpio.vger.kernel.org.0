Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A486A1251EA
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2019 20:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLRTdO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Dec 2019 14:33:14 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40958 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbfLRTdN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Dec 2019 14:33:13 -0500
Received: by mail-pg1-f193.google.com with SMTP id k25so1790070pgt.7
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2019 11:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iwgdUvCpkYyWwBF9kTPhunj3uYeUygxi6iIacMURMk8=;
        b=V/HtCrK/Z3jiwZKROOKZGn0Bnaus2NByOT3r3082m9LUcPEPfbROc8iu6qeGUr2jSN
         FmM5Yk4kOf4pwBmOhrrwC7JY0197mfi7CR1mi4Pojh59/i43dCCB2wozy5PeJ/Bglldm
         c9UOS/9z6NriX0UduI36mbyOm+Tdb9G07LybBf9bSASb70z6doKthbmhnZBZKM7uFiH8
         7OLfWHohOEpmz7Anc33Gm2WLlt0d/wQeO7EYKy/qMfzkreyiyKvDrqX6vYcpa8QUw/dV
         nMM4CVSw01ItihE7bQ6wPP/oxj/0ZmDyePkSwXt03BED0F6zm0xNvdNF1dPrzQyDyZGb
         tpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iwgdUvCpkYyWwBF9kTPhunj3uYeUygxi6iIacMURMk8=;
        b=cpaCEdiP0LQ/jSuMwQr1n5LGv1K1k9ewnuynjuzlsLmC3WW6WevIj7vcyy84KzXJC2
         5uRopfOhCNUNhs/M9IHXgu4TVNQ5IxXfvHe3vpGLCPZ5qemVSG2FQu9LyyBlgWVDXBky
         hAaj0UTYw4B0WLU8R+3oYAO9Z+CYkT9Pp4c1ObmtpUYNUmJRPAfTSAf2sOCcLaZ3Jdh7
         6TQuC12eiXXhfawd9YVjtKZKVywil++kQNPl0mdiYuKzdJCnB+X4hXqAijfsE/xSk560
         ASOlFS/7tavw8JQ3HPDZ1k577ExX0wC7DhsicMDJZhaobJGBpwCZHUrfUCZQd/wWEdVQ
         SdiQ==
X-Gm-Message-State: APjAAAUtZywkxAwoL8M8Qad7SSwxfghGxttZO2XiynLMzVG8C/j+DuaO
        6gins3qx0g48nmI2TKIToV514A==
X-Google-Smtp-Source: APXvYqyTRC1Lfi6kWOZ3GZP/tPo6lpUEggFB0OedbSNLWiiUNFKTh+6C3IqDdSF4ncNO0Mxic1qWFQ==
X-Received: by 2002:aa7:8a99:: with SMTP id a25mr4980815pfc.233.1576697592787;
        Wed, 18 Dec 2019 11:33:12 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e11sm3658720pjj.26.2019.12.18.11.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 11:33:12 -0800 (PST)
Date:   Wed, 18 Dec 2019 11:33:09 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: make 'm_voc_groups' static
Message-ID: <20191218193309.GW36595@minitux>
References: <20191218102804.2487374-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191218102804.2487374-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed 18 Dec 02:28 PST 2019, Ben Dooks (Codethink) wrote:

> The m_voc_groups is not declared outside of the
> driver, so make it static to avoid the following
> sparse wanrning:
> 
> drivers/pinctrl/qcom/pinctrl-msm8976.c:592:12: warning: symbol 'm_voc_groups' was not declared. Should it be static?
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
> ---
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/pinctrl/qcom/pinctrl-msm8976.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm8976.c b/drivers/pinctrl/qcom/pinctrl-msm8976.c
> index e1259ce27396..183f0b2d9f8e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm8976.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm8976.c
> @@ -589,7 +589,7 @@ static const char * const blsp_uart5_groups[] = {
>  static const char * const qdss_traceclk_a_groups[] = {
>  	"gpio46",
>  };
> -const char * const m_voc_groups[] = {
> +static const char * const m_voc_groups[] = {
>  	"gpio123", "gpio124",
>  };
>  static const char * const blsp_i2c5_groups[] = {
> -- 
> 2.24.0
> 
