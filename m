Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF081BBD08
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbgD1MGm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 08:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgD1MGg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Apr 2020 08:06:36 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31E46C03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:06:36 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id f7so10573050pfa.9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qSnbHnhb/ImrO+E750ELL0K9ASPG1g7hbBn5rfr0x4c=;
        b=jR9eFaou+iyFSfX4VQBaBJ0D4UOtBuEz6lUWJct6oja3uQf/5KgF4ZId80WdawOIyA
         9Y2pWDGToovcozOo/7tIIS1iYKOr9zyzpUtxGGeBeGh1oBeil31lRaJbRyl4HKQYuGn4
         HW1Drb17QDC7nJzXjhe3y1tNvUFMcz5C3ZPhZTTeWcCqQh4tgVdPajM+Eu8l5TbL3SR3
         FtKuslmSvWDAqUoCyJkHlCfbEoxAyxrfgJlVykmzXYKcYPf0JUeaTumpwjsV+gRtNioY
         w3f3oxFawSM9P9jEmvp/ok1VHYLgngw0FRaKthA4mvhkzEnVgKSRPx50kb13KTNhukJR
         JqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qSnbHnhb/ImrO+E750ELL0K9ASPG1g7hbBn5rfr0x4c=;
        b=coUg/SF47L/N3VCXHY2Ns9UheUYhnWvSaQFSNhJtMdgDlNFVC6okh/EPqdzCS+XbCW
         zIsvySTlZPADhiFA3wFlnm6FJVSr7lRBc289aQL3yoVeICW6EPJBvX08YpfOKg2fsPmY
         alilHEA+b0i5Fps+84wVCvtn9ZKz4nkRYK23dyBDXWJqnYapHSccyvgOoHfLhddP+LbX
         G4sFDMD5LQ0AVo3tdDA9lhwTMMG/QvDMsDmfVCCoc6DLmfSeqE28L+wHye0FDGs8JCjl
         ARbRX7aHqXp4eJYGhawUEdSMjGDEYrHrVNKx//qt+S6bvQiRnRau7yiYjoPg4QPKfB3H
         Lk6A==
X-Gm-Message-State: AGi0PuaAoEKOD1h/GXvXFGjfY34PMkiesQ3U0hYxVWCI9HZHuGQeST5b
        4GHfddflXVXLKoNtGtjnmEpv
X-Google-Smtp-Source: APiQypI0tvX/4A1LC0q9piuTrkImrZ05Sk2zx1XJrKPT5BlEwwzYPeny8WSqV+GVEHi1Stg1k6/3AQ==
X-Received: by 2002:a62:cf06:: with SMTP id b6mr31065848pfg.9.1588075595284;
        Tue, 28 Apr 2020 05:06:35 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:816:a859:6d8a:8338:74e:a3d1])
        by smtp.gmail.com with ESMTPSA id a200sm14696172pfa.201.2020.04.28.05.06.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 05:06:34 -0700 (PDT)
Date:   Tue, 28 Apr 2020 17:36:28 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jason Yan <yanaijie@huawei.com>
Cc:     linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: add pwm37 to bm1880_pctrl_groups
Message-ID: <20200428120627.GB5259@Mani-XPS-13-9360>
References: <20200428115543.33379-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200428115543.33379-1-yanaijie@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 28, 2020 at 07:55:43PM +0800, Jason Yan wrote:
> The 'pwm37' is not added to bm1880_pctrl_groups, which triggers a gcc
> build warning:
> 
> drivers/pinctrl/pinctrl-bm1880.c:263:27: warning: ‘pwm37_pins’ defined
> but not used [-Wunused-const-variable=]
>  static const unsigned int pwm37_pins[] = { 110 };
> 
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/pinctrl/pinctrl-bm1880.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
> index f7dff4f14101..d1a7d9836787 100644
> --- a/drivers/pinctrl/pinctrl-bm1880.c
> +++ b/drivers/pinctrl/pinctrl-bm1880.c
> @@ -408,6 +408,7 @@ static const struct bm1880_pctrl_group bm1880_pctrl_groups[] = {
>  	BM1880_PINCTRL_GRP(pwm34),
>  	BM1880_PINCTRL_GRP(pwm35),
>  	BM1880_PINCTRL_GRP(pwm36),
> +	BM1880_PINCTRL_GRP(pwm37),
>  	BM1880_PINCTRL_GRP(i2c0),
>  	BM1880_PINCTRL_GRP(i2c1),
>  	BM1880_PINCTRL_GRP(i2c2),
> -- 
> 2.21.1
> 
