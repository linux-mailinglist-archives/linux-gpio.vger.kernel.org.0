Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 969A05AB74
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jun 2019 15:18:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfF2NSE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jun 2019 09:18:04 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34145 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfF2NSE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jun 2019 09:18:04 -0400
Received: by mail-lf1-f66.google.com with SMTP id y198so5790962lfa.1;
        Sat, 29 Jun 2019 06:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vEjer6r5Kx9Kr0BplSf4NMofAQbkoIHpl4+CRU9oPL8=;
        b=KDj+XOQR7CYp+CKAO6RjEb62Ye2DCEfXcsyMPDemy+zd0rlkYnrGOLf9/HZ72S1WTD
         LxgWjNyAM8vU7lQRd7MYSQycC/+5sIsUbS1wyKrdYZV1tSaSSf1EeMisq9ReWyp3rrZv
         jRC+hoTwc9NsLSJfRgSluU1b8/SzHZUOGT8gxpv3Kz3uwBxlkjR+Qjhh7qLIplK0sn/D
         wO1/vPVz9v6JMzq9XedM4J0TsqSOS/p4iN3XrebBZe6dRVumyZ77+KqSUYwF7Ng1yooM
         +F7ujqnGUMs0DKBWV9kHiWJWw+4qKFyCtq9ytHnVuTwv/WzaD6GHeJ6kCCLO7lMowr/R
         ZBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vEjer6r5Kx9Kr0BplSf4NMofAQbkoIHpl4+CRU9oPL8=;
        b=GCx59HM/sliimdJaWKMLKaVDNJazhX+zAnQw66ELPYTUdmY3TO/7wuHZJts7Hkzr7Y
         Nu70baZYjOFeshBm8HS1K7uW+wyovJkl/F5sQoBzvgMs2yhX5zT+whNkmePpE9wcMvoS
         1sRypxbsRcKpKwo6/Xn+W5moCHcvvwiztw4O6Z2IDwiQltIosqdnXAnH8LMTr77V2M/u
         2E5mH+VY5uFmK560Pc1viSyL6PcOK9pnyK61AJLnEK86UuQ7W/XeijCZVKtvKBKqJPF6
         Yayj5c1hZB9JqBX/5Afnn+tPhRTDqBdiIl3ljstckDp62eVfUEav5pyqmarjavzKYMQb
         SRzA==
X-Gm-Message-State: APjAAAUU/iDqeY3yJcsOnay8cCnPDvT0KrenZrPViNhn2//lJK3P0cd+
        fXycRAW5ywESX4iJSUHDExFj7UA7
X-Google-Smtp-Source: APXvYqyVTdWyBsYnA/UZtk+9N2QUBPp+5uklN6RYyPiQvD7Qxx1bfVwPrw+ShEQOO2STFT7ELkGH3w==
X-Received: by 2002:ac2:4ace:: with SMTP id m14mr6831242lfp.99.1561814281497;
        Sat, 29 Jun 2019 06:18:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp79-139-233-208.pppoe.spdop.ru. [79.139.233.208])
        by smtp.googlemail.com with ESMTPSA id 16sm1366292lfy.21.2019.06.29.06.18.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 06:18:00 -0700 (PDT)
Subject: Re: [PATCH V5 09/18] clk: tegra: Add save and restore context support
 for peripheral clocks
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
        jason@lakedaemon.net, marc.zyngier@arm.com,
        linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc:     pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-10-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <711a6e01-f3c2-9bbe-60af-4f8701102d6d@gmail.com>
Date:   Sat, 29 Jun 2019 16:17:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561687972-19319-10-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> This patch implements save and restore context for peripheral fixed
> clock ops, peripheral gate clock ops, sdmmc mux clock ops, and
> peripheral clock ops.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So during suspend entry clock and reset state of peripherals is saved
> and on resume they are restored to have clocks back to same rate and
> state as before suspend.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-periph-fixed.c | 31 ++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph-gate.c  | 34 ++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-periph.c       | 43 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-sdmmc-mux.c    | 30 +++++++++++++++++++++++++
>  drivers/clk/tegra/clk.h              |  8 +++++++
>  5 files changed, 146 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-periph-fixed.c b/drivers/clk/tegra/clk-periph-fixed.c
> index c088e7a280df..981f68b0a937 100644
> --- a/drivers/clk/tegra/clk-periph-fixed.c
> +++ b/drivers/clk/tegra/clk-periph-fixed.c
> @@ -60,11 +60,42 @@ tegra_clk_periph_fixed_recalc_rate(struct clk_hw *hw,
>  	return (unsigned long)rate;
>  }
>  
> +static int tegra_clk_periph_fixed_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_periph_fixed *fixed = to_tegra_clk_periph_fixed(hw);
> +	u32 mask = 1 << (fixed->num % 32);
> +
> +	fixed->enb_ctx = readl(fixed->base + fixed->regs->enb_reg) & mask;
> +	fixed->rst_ctx = readl(fixed->base + fixed->regs->rst_reg) & mask;
> +

readl_relaxed() ?

