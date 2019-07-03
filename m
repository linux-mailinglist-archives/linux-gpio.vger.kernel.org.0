Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7CEB5E64D
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 16:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfGCORN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Jul 2019 10:17:13 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55045 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfGCORN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jul 2019 10:17:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id g135so2403088wme.4
        for <linux-gpio@vger.kernel.org>; Wed, 03 Jul 2019 07:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ks0bNwYapiN81vVxECStRbRSKzS0XfjKhzZiJiwEzwY=;
        b=Q0TBA8sKjhi4NK59C7tFimG/AiuJj8NjmNS77iU+k2Qmfdlh5Dc/rYAbcd/fDqSnHD
         /tbji06th9Xzvmi6KQ0uXit+8krhr5CAYIpig2H0xEGI/LCLsktoZD3PYI6Rn/QrD1qM
         vbLjZExZoQKayF3xaOkXoR9FF0/sx79SNWx9MGV3qQwP/4bgQ9YKmScXh2ZUf9m/vYCp
         huQ4lLrwpG3T5OrkuEDapgp3jUknzjOiRfKo+KCjpTWTDed2O9fYTFZEDa5/fZz+rHzD
         xRLlKBOUC1tD63wpfzRqC4OVCVX6I3q7Q37ZfKRvMIJ+fzmou0ZnLyEUXul4j+0JhFgW
         xtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ks0bNwYapiN81vVxECStRbRSKzS0XfjKhzZiJiwEzwY=;
        b=WYe72lLVkWxQYDORvdCGlAhrNTuL0ydShKI/ukXd/Q3MTimY1IcNm4y/ljb7oxeqTS
         dc7G2xpYRbRcz3mfqAPdIt+kW+Ro0qM+9GbfysrYpEQS8/BfFwsyOR/Z3zUaw/PcyWra
         EvF6OhdQ4QQc0S9gQnXs53zbsWLEt52v8rDwVaTA6WvyO+bJrrwgbImdJlytz0ApHh0X
         1snpdrVPi9wxrI2W+rBVy+Yk4cKb//Bk9iUCrhB9Z/vxRb/LITTENXqbPaEdPlrnBf5B
         PxZi6V6N1UStnGx34+ZhHixe7ueoO/+BWU4XexB7kH12KsxhBv/ou5K+BY/Fp9B6X40F
         +J/w==
X-Gm-Message-State: APjAAAWnPfzxuR98W6Vadg249nZnGhoKEcRSnIxUOAlJvV2HsKhlNujt
        R0ngYxIMKmoKx9WOR5DvGwTW8VStyE5/tw==
X-Google-Smtp-Source: APXvYqxmeARZ+dzcLmNlaBGXg9WvX8W+EC2+HrDQkCGX+smg1Bl3ozbQengqGYQ1JBWeO/R5WhX85A==
X-Received: by 2002:a05:600c:21d4:: with SMTP id x20mr7439597wmj.61.1562163431645;
        Wed, 03 Jul 2019 07:17:11 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x83sm2813879wmb.42.2019.07.03.07.17.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 03 Jul 2019 07:17:11 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        linux-gpio@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
In-Reply-To: <20190701091258.3870-5-narmstrong@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-5-narmstrong@baylibre.com>
Date:   Wed, 03 Jul 2019 16:17:10 +0200
Message-ID: <1jh8836w49.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon 01 Jul 2019 at 11:12, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Add a setup() callback in the eeclk structure, to call an optional
> call() function at end of eeclk probe to setup clocks.
>
> It's used for the G12A clock controller to setup the CPU clock
> notifiers.

I'd prefer if you implement the probe function in the related controller
have this probe function call meson_eeclkc_probe() for the common part

In your case, I suppose it means implementing the g12a controller probe
to deal with the notifiers

>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/meson-eeclk.c | 6 ++++++
>  drivers/clk/meson/meson-eeclk.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index 6ba2094be257..81fd2abcd173 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -61,6 +61,12 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (data->setup) {
> +		ret = data->setup(pdev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  					   data->hw_onecell_data);
>  }
> diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
> index 9ab5d6fa7ccb..7fdf424f71a6 100644
> --- a/drivers/clk/meson/meson-eeclk.h
> +++ b/drivers/clk/meson/meson-eeclk.h
> @@ -20,6 +20,7 @@ struct meson_eeclkc_data {
>  	const struct reg_sequence	*init_regs;
>  	unsigned int			init_count;
>  	struct clk_hw_onecell_data	*hw_onecell_data;
> +	int				(*setup)(struct platform_device *pdev);
>  };
>  
>  int meson_eeclkc_probe(struct platform_device *pdev);
> -- 
> 2.21.0
