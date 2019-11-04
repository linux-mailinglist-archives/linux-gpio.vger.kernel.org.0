Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B40EDA38
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 08:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbfKDH73 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 02:59:29 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38400 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726633AbfKDH73 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 02:59:29 -0500
Received: by mail-wr1-f68.google.com with SMTP id v9so15840655wrq.5
        for <linux-gpio@vger.kernel.org>; Sun, 03 Nov 2019 23:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=hSqKVwc6bJDp4a89lIu+lMczQX467huhHqDN052faFc=;
        b=PTpN+ZwuBfKdTAnpKvgXZbCQQz8WC79oxCbnZC40CQUEiVfD2FtrVOMZ5NN9Bo1E6n
         JiK5bdp5cK+hp+p/9TNcOFtm9nhIUavOaMwWe8ax6rOSeoktiO6dhHb9Bl1kxwAqsL0q
         r4TyWsvBdiQDG1raUx51YG7ig11HGrErgih91DR/ntB8ScPFh7XOPUfNAljcjYH3FsES
         JRJdZjSKE1bkEqj23pOcnFEwBZhvF5hyw4lwezIFVO+0pqeOYlMh7mVb2TrxZ4+vHztR
         OCIDgOSYRU530s60ouz5Sx2assCn2tEWmMo6fmK2DLnmHZLtanyVk+iz0E88GmhX5AoM
         ktBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=hSqKVwc6bJDp4a89lIu+lMczQX467huhHqDN052faFc=;
        b=YkFcwfsTuCkOrgP+415KfPgb56PJYpzSpwJgBE/9bjo6Onak8K8VWNjIFEri8eyxOc
         TUS3ryMRglAZ+fxhOVXgfKpAuQ88NmCc8NedXjFCrh8InG9Gr6vs3oteGFQpKPhcg+t7
         AhTzZxChBtZe7nI+XvLcbap42bjr9BtLISPVZd3xgPwSpVw/dNnxNTXMXNw4jWHBtCRv
         212JlkkH065OJ4XDKpDttzQEvwjaZZj5ZsbsJzSyZTsolr/krQ2k57AOP6ZpWG9kihya
         a7EaKu+lhgcfd9Bl8Ntl4ttCA75QDxZm5mFZrirzU+ytnPHAVf3egJl/ZtKPpUrMJHXw
         CDxQ==
X-Gm-Message-State: APjAAAUQJ7rRlMo/8RFInLtIgPEISIdnb39Jj/PB9l3DH0TUeZj3kavj
        tKmM59b6PD9J5MXpOO6kyb2QxQ==
X-Google-Smtp-Source: APXvYqy9al4urCFA6fpYb/D7VafuMc4Y5ZvLTdzSKfLU5CvIPNYPDX/9vIxtpAlJPzcLdVUySVhz8w==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr22574436wrr.50.1572854365762;
        Sun, 03 Nov 2019 23:59:25 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o81sm7133638wmb.38.2019.11.03.23.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 23:59:24 -0800 (PST)
References: <1572004167-24150-1-git-send-email-qianggui.song@amlogic.com> <1572004167-24150-3-git-send-email-qianggui.song@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        "Jianxin Pan" <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        "Mark Rutland" <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] pinctrl: meson: add a new callback for SoCs fixup
In-reply-to: <1572004167-24150-3-git-send-email-qianggui.song@amlogic.com>
Date:   Mon, 04 Nov 2019 08:59:23 +0100
Message-ID: <1jeeyo3wdg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Fri 25 Oct 2019 at 13:49, Qianggui Song <qianggui.song@amlogic.com> wrote:

> In meson_pinctrl_parse_dt, it contains two parts: reg parsing and
> SoC relative fixup for AO. Several fixups in the same code make it hard
> to maintain, so move all fixups to each SoC's callback and make
> meson_pinctrl_parse_dt just do the reg parsing, separate these two
> parts.Overview of all current Meson SoCs fixup is as below:
>
> +------+--------------------------------------+--------------------------+
> |      |                                      |                          |
> | SoC  |                EE domain             |        AO domain         |
> +------+--------------------------------------+--------------------------+
> |m8    | parse regs:                          | parse regs:              |
> |m8b   |   gpio,mux,pull,pull-enable(skip ds) |    gpio,mux,pull(skip ds)|
> |gxl   | fixup:                               | fixup:                   |
> |gxbb  |   no                                 |     pull-enable = pull   |
> |axg   |                                      |                          |
> +------+--------------------------------------+--------------------------+
> |g12a  | parse regs:                          | parse regs:              |
> |sm1   |   gpio,mux,pull,pull-enable,ds       |   gpio,mux,ds            |
> |      | fixup:                               | fixup:                   |
> |      |   no                                 |   pull = gpio            |
> |      |                                      |   pull-enable = gpio     |
> +------+--------------------------------------+--------------------------+
> |a1 or | parse regs:                                                     |
> |later |  gpio/mux (without ao domain)                                   |
> |SoCs  | fixup:                                                          |
> |      |  pull=gpio; pull-enable=gpio; ds=gpio                           |
> +------+-----------------------------------------------------------------+
>
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-axg.c  | 11 +++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  9 +++++++++
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 11 +++++++++++
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  | 11 +++++++++++
>  drivers/pinctrl/meson/pinctrl-meson.c      |  9 +++++----
>  drivers/pinctrl/meson/pinctrl-meson.h      |  3 +++
>  drivers/pinctrl/meson/pinctrl-meson8.c     | 11 +++++++++++
>  drivers/pinctrl/meson/pinctrl-meson8b.c    | 11 +++++++++++
>  8 files changed, 72 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index ad502eda4afa..9c07f4423c37 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -1040,6 +1040,16 @@
>  	.num_pmx_banks = ARRAY_SIZE(meson_axg_aobus_pmx_banks),
>  };
>  
> +static int meson_axg_aobus_parse_dt_extra(struct meson_pinctrl *pc)
> +{
> +	if (!pc->reg_pull)
> +		return -EINVAL;
> +
> +	pc->reg_pullen = pc->reg_pull;
> +
> +	return 0;
> +}
> +
>  static struct meson_pinctrl_data meson_axg_periphs_pinctrl_data = {
>  	.name		= "periphs-banks",
>  	.pins		= meson_axg_periphs_pins,
> @@ -1066,6 +1076,7 @@
>  	.num_banks	= ARRAY_SIZE(meson_axg_aobus_banks),
>  	.pmx_ops	= &meson_axg_pmx_ops,
>  	.pmx_data	= &meson_axg_aobus_pmx_banks_data,
> +	.parse_dt	= meson_axg_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson_axg_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index 582665fd362a..41850e3c0091 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -1362,6 +1362,14 @@
>  	.num_pmx_banks	= ARRAY_SIZE(meson_g12a_aobus_pmx_banks),
>  };
>  
> +static int meson_g12a_aobus_parse_dt_extra(struct meson_pinctrl *pc)
> +{
> +	pc->reg_pull = pc->reg_gpio;
> +	pc->reg_pullen = pc->reg_gpio;
> +
> +	return 0;
> +}
> +
>  static struct meson_pinctrl_data meson_g12a_periphs_pinctrl_data = {
>  	.name		= "periphs-banks",
>  	.pins		= meson_g12a_periphs_pins,
> @@ -1388,6 +1396,7 @@
>  	.num_banks	= ARRAY_SIZE(meson_g12a_aobus_banks),
>  	.pmx_ops	= &meson_axg_pmx_ops,
>  	.pmx_data	= &meson_g12a_aobus_pmx_banks_data,
> +	.parse_dt	= meson_g12a_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson_g12a_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index 5bfa56f3847e..f5494a948200 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -827,6 +827,16 @@
>  	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
>  };
>  
> +static int meson_gxbb_aobus_parse_dt_extra(struct meson_pinctrl *pc)
> +{
> +	if (!pc->reg_pull)
> +		return -EINVAL;
> +
> +	pc->reg_pullen = pc->reg_pull;
> +
> +	return 0;
> +}

Can you share the definition of this function instead of repeating it ?

> +
>  static struct meson_pinctrl_data meson_gxbb_periphs_pinctrl_data = {
>  	.name		= "periphs-banks",
>  	.pins		= meson_gxbb_periphs_pins,
> @@ -851,6 +861,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt	= meson_gxbb_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson_gxbb_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 72c5373c8dc1..943fb27dab08 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -796,6 +796,16 @@
>  	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 9, 0,  16, 0, 0,   0,  0,  0, 16,  1,  0),
>  };
>  
> +static int meson_gxl_aobus_parse_dt_extra(struct meson_pinctrl *pc)
> +{
> +	if (!pc->reg_pull)
> +		return -EINVAL;
> +
> +	pc->reg_pullen = pc->reg_pull;
> +
> +	return 0;
> +}

Same

> +
>  static struct meson_pinctrl_data meson_gxl_periphs_pinctrl_data = {
>  	.name		= "periphs-banks",
>  	.pins		= meson_gxl_periphs_pins,
> @@ -820,6 +830,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson_gxl_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson_gxl_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt 	= meson_gxl_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson_gxl_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 8bba9d053d9f..e182583422a4 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -677,14 +677,12 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>  	}
>  
>  	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
> -	/* Use gpio region if pull one is not present */
>  	if (IS_ERR(pc->reg_pull))
> -		pc->reg_pull = pc->reg_gpio;
> +		pc->reg_pull = NULL;

Instead of doing this fixup, could modifhy meson_map_ressourse() to
return NULL instead of -ENOENT ?

Then you should IS_ERR_OR_NULL() for "mux" and "gpio" and just IS_ERR()
for the rest

>  
>  	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
> -	/* Use pull region if pull-enable one is not present */
>  	if (IS_ERR(pc->reg_pullen))
> -		pc->reg_pullen = pc->reg_pull;
> +		pc->reg_pullen = NULL;
>  
>  	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
>  	if (IS_ERR(pc->reg_ds)) {
> @@ -692,6 +690,9 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>  		pc->reg_ds = NULL;
>  	}
>  
> +	if (pc->data->parse_dt)
> +		return pc->data->parse_dt(pc);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index c696f3241a36..d570f7c53045 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -11,6 +11,8 @@
>  #include <linux/regmap.h>
>  #include <linux/types.h>
>  
> +struct meson_pinctrl;
> +
>  /**
>   * struct meson_pmx_group - a pinmux group
>   *
> @@ -114,6 +116,7 @@ struct meson_pinctrl_data {
>  	unsigned int num_banks;
>  	const struct pinmux_ops *pmx_ops;
>  	void *pmx_data;
> +	int (*parse_dt)(struct meson_pinctrl *pc);
>  };
>  
>  struct meson_pinctrl {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
> index 0b97befa6335..65c70c9b7070 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
> @@ -1079,6 +1079,16 @@
>  	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0, 16,  0,  0,  0,  0,  0, 16,  1,  0),
>  };
>  
> +static int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc)
> +{
> +	if (!pc->reg_pull)
> +		return -EINVAL;
> +
> +	pc->reg_pullen = pc->reg_pull;
> +
> +	return 0;
> +}
> +
>  static struct meson_pinctrl_data meson8_cbus_pinctrl_data = {
>  	.name		= "cbus-banks",
>  	.pins		= meson8_cbus_pins,
> @@ -1103,6 +1113,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson8_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson8_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt	= &meson8_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson8_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
> index a7de388388e6..85dc12e0c839 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8b.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
> @@ -938,6 +938,16 @@
>  	BANK("AO",   GPIOAO_0, GPIO_TEST_N, 0, 13, 0,  16, 0, 0,  0,  0,  0, 16,  1,  0),
>  };
>  
> +static int meson8b_aobus_parse_dt_extra(struct meson_pinctrl *pc)
> +{
> +	if (!pc->reg_pull)
> +		return -EINVAL;
> +
> +	pc->reg_pullen = pc->reg_pull;
> +
> +	return 0;
> +}
> +
>  static struct meson_pinctrl_data meson8b_cbus_pinctrl_data = {
>  	.name		= "cbus-banks",
>  	.pins		= meson8b_cbus_pins,
> @@ -962,6 +972,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson8b_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson8b_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt	= &meson8b_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson8b_pinctrl_dt_match[] = {

