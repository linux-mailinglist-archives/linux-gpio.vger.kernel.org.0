Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 595607BEA5
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2019 12:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728338AbfGaKuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 06:50:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35031 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbfGaKuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 06:50:04 -0400
Received: by mail-lj1-f193.google.com with SMTP id x25so65190188ljh.2;
        Wed, 31 Jul 2019 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JSHH0bvfckFP4G396m/XDPZBCfClT4GsU0n157iKlgM=;
        b=XEWVgaf+9qgPUMCmzsTf/fomaAGojiWJH5f8e3x2zyiz3rLuKZdM0NTozUAQ85Ewd4
         7fUK/Ro7czxMczXwM5q1hFGZTXzmgZ9Exs1N+k+uTyHwKWsBaDKkYTvanKsNKeOf/CqD
         ezBjFNVw/G/OZDyJv9rJSffOHTAT5AIRuvydM5GVrCngfWSF/403Zlhk+ruM/law8TNZ
         Lwk+l64Tdg6NKPs1I02UTEyx+C1TrEhuPboW0X0i0kScyHeDv3SnO5hmpM2RRSWMHhPg
         oJQCsiOdv7/WarEYciti21Syr7RQvSelpcQzwMlEEDdgR834d2qI/+gFPxzLEdvfzBO5
         z9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JSHH0bvfckFP4G396m/XDPZBCfClT4GsU0n157iKlgM=;
        b=gz+FmAkaTdPH/2Mpwi9zljE/la5Z74vXa0mBR6is65+IHe12GurW0aHj6nqf1A+YGi
         x3X26hBy/KAyGe0kq7yNEBolBVA93GjZfmFOrm/MA2a5O51rF901uU+qtEcPkv5s9nJh
         rjms2CFYfDjXPVJLyc8FQ6zz3q7D4i8zyMbB7bcUTycmZEilj3cETGUXSIzVeFUyodZA
         7NJKUn5pxZxqtV0Pd876dhWt61EvCpJ2ZMe8+f/+a5hWV+zt3OHgiWXjcbur5QBf23xY
         xriTPJzWkByTn4Pd95mrY56B6w2FwpNuY9k4EvMiYHUEfDaMRaYAxmOSpQ9faufMswOB
         3Rbg==
X-Gm-Message-State: APjAAAVPZDXqwmfXWSQGxGJ3z28Br1dj94dae6OhfsWCNztR0qrjcOQd
        ra4Q/ibVe4dWgNYTYEy4ntfWHj4P
X-Google-Smtp-Source: APXvYqzzq6iOESn8faLWDvxD/s+KigzJUfWMDvdT2oWhd+tEnu773XOPnxOvGye0yGKXeBibwDLHIw==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr64029967ljg.134.1564570201974;
        Wed, 31 Jul 2019 03:50:01 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id m17sm11607940lfj.22.2019.07.31.03.50.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 03:50:01 -0700 (PDT)
Subject: Re: [PATCH v7 03/20] clk: tegra: divider: Save and restore divider
 rate
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
References: <1564532424-10449-1-git-send-email-skomatineni@nvidia.com>
 <1564532424-10449-4-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <36a7f0a2-89d3-4f7b-7521-eefc61cbfcef@gmail.com>
Date:   Wed, 31 Jul 2019 13:49:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1564532424-10449-4-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

31.07.2019 3:20, Sowjanya Komatineni пишет:
> This patch implements context restore for clock divider.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So on resume, clock dividers are restored back for normal operation.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index e76731fb7d69..ca0de5f11f84 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -109,10 +109,21 @@ static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return 0;
>  }
>  
> +static void clk_divider_restore_context(struct clk_hw *hw)
> +{
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	unsigned long parent_rate = clk_hw_get_rate(parent);
> +	unsigned long rate = clk_hw_get_rate(hw);
> +
> +	if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
> +		WARN_ON(1);
> +}
> +
>  const struct clk_ops tegra_clk_frac_div_ops = {
>  	.recalc_rate = clk_frac_div_recalc_rate,
>  	.set_rate = clk_frac_div_set_rate,
>  	.round_rate = clk_frac_div_round_rate,
> +	.restore_context = clk_divider_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_divider(const char *name,
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
