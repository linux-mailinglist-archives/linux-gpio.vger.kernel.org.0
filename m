Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 686AC6F655
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jul 2019 00:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbfGUWPA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 21 Jul 2019 18:15:00 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40743 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725989AbfGUWPA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jul 2019 18:15:00 -0400
Received: by mail-lf1-f67.google.com with SMTP id b17so25193894lff.7;
        Sun, 21 Jul 2019 15:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=u5vwBrczH3pqHYjrJBk9McgfzQ7jMbFeq2+Xy/9jSHs=;
        b=seI3F9fpPffbFnxlS/u3ukpoPc9HsX4lOzM+fyQUPgtSVtuNrNrvURScnkiEVoxjXX
         yNXBKagCb9FNcs/j24x3vUbjA86Xke4z7GWx+KjZ8Oc5HQ5Uh74JkaZGtJWRU7zdWAmY
         3MBswB/RyxOIVk22u1T63wxeAQL3DF5UIcoOe7cIfRolzj52HpWKu6GKp3A9ZRtUN6q0
         0HTj7m9aSvqCzPy6qQQQVcDV59N2OFCCnQmjPE7a0wazr/4lM+fz/d0rWIPmEp3UcXtX
         Q9exuBZKNls6daZ7XSVKOHSgk9/2uK3epeVIIP8Hni8IKeSVPPZ6b3Qa8s7WXv9z4lOB
         5Shw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u5vwBrczH3pqHYjrJBk9McgfzQ7jMbFeq2+Xy/9jSHs=;
        b=FquRMH4oFQtBB5HE6p8+CNL+ECp+W4rE+Fo51P+fftkGxnGofNx8HIZohpaXPl6E1h
         V0N2hF3wIxspUqdnDjbgJ0Lz5mQpFrXAMksev+s3iyx32q1rxMSIzwdG8IJ79BBL5S1T
         3NqemcS0gVtQUEu/bYrS9EBI2SpHEqNdPj3ZpS/2PDtOHvS99zs06uWvdT6K01w4Tq6i
         24C4DiUJndksZfl5RhXgBll3Vo9VVp3jsDCPODzyzdhCp8tGeAGOiZnoEuwHwxmO5Xvd
         6NdpNUZSBOsN/lecQqY3lEtXJtOhq9XHgRtk+m4KRn376ei4V/Mi6glD/LrN0PVa2har
         Am/g==
X-Gm-Message-State: APjAAAWZqtJ3fccAQ0WwX4sh3kX2rQ7sXpneuVbVBonMAs61jikG4ubn
        d/85YsdDPl5C/9xHcSRBMQVhKz5Q
X-Google-Smtp-Source: APXvYqzTYLJFwYhimRTdw312FnuK794BLQJrOZ0paj+cb7R/tUhPy3OOPX0RYbel9oW2PE7iAPLJvg==
X-Received: by 2002:ac2:4839:: with SMTP id 25mr30187483lft.79.1563747296901;
        Sun, 21 Jul 2019 15:14:56 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-220-99.pppoe.mtu-net.ru. [91.78.220.99])
        by smtp.googlemail.com with ESMTPSA id d3sm5743130lfb.92.2019.07.21.15.14.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jul 2019 15:14:56 -0700 (PDT)
Subject: Re: [PATCH V6 04/21] clk: tegra: Save and restore divider rate
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
References: <1563738060-30213-1-git-send-email-skomatineni@nvidia.com>
 <1563738060-30213-5-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <88a6a8ea-df4e-4cdf-4723-6e16d645218c@gmail.com>
Date:   Mon, 22 Jul 2019 01:14:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563738060-30213-5-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

21.07.2019 22:40, Sowjanya Komatineni пишет:
> This patch implements context save and restore for clock divider.
> 
> During system suspend, core power goes off and looses the settings
> of the Tegra CAR controller registers.
> 
> So during suspend entry the context of clock divider is saved and
> on resume context is restored back for normal operation.
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/clk/tegra/clk-divider.c | 23 +++++++++++++++++++++++
>  drivers/clk/tegra/clk.h         |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
> index e76731fb7d69..ecb7ff9ce97e 100644
> --- a/drivers/clk/tegra/clk-divider.c
> +++ b/drivers/clk/tegra/clk-divider.c
> @@ -109,10 +109,33 @@ static int clk_frac_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return 0;
>  }
>  
> +static int clk_divider_save_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	unsigned long parent_rate = clk_hw_get_rate(parent);
> +
> +	divider->rate = clk_frac_div_recalc_rate(hw, parent_rate);

I'm not sure what's the point of this, because clk_hw_get_rate() returns
cached value.

> +	return 0;
> +}
> +
> +static void clk_divider_restore_context(struct clk_hw *hw)
> +{
> +	struct tegra_clk_frac_div *divider = to_clk_frac_div(hw);
> +	struct clk_hw *parent = clk_hw_get_parent(hw);
> +	unsigned long parent_rate = clk_hw_get_rate(parent);
> +
> +	if (clk_frac_div_set_rate(hw, divider->rate, parent_rate) < 0)
> +		WARN_ON(1);

Hence this could be:

	unsigned long parent_rate = clk_hw_get_rate(parent);
	unsigned long rate = clk_hw_get_rate(hw);

	if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
		WARN_ON(1);

> +}
> +
>  const struct clk_ops tegra_clk_frac_div_ops = {
>  	.recalc_rate = clk_frac_div_recalc_rate,
>  	.set_rate = clk_frac_div_set_rate,
>  	.round_rate = clk_frac_div_round_rate,
> +	.save_context = clk_divider_save_context,
> +	.restore_context = clk_divider_restore_context,
>  };
>  
>  struct clk *tegra_clk_register_divider(const char *name,
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index 905bf1096558..83623f5f55f3 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -42,6 +42,7 @@ struct clk *tegra_clk_register_sync_source(const char *name,
>   * @width:	width of the divider bit field
>   * @frac_width:	width of the fractional bit field
>   * @lock:	register lock
> + * @rate:	rate during suspend and resume
>   *
>   * Flags:
>   * TEGRA_DIVIDER_ROUND_UP - This flags indicates to round up the divider value.
> @@ -62,6 +63,7 @@ struct tegra_clk_frac_div {
>  	u8		width;
>  	u8		frac_width;
>  	spinlock_t	*lock;
> +	unsigned long	rate;
>  };
>  
>  #define to_clk_frac_div(_hw) container_of(_hw, struct tegra_clk_frac_div, hw)
> 

