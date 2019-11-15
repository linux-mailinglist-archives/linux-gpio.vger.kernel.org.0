Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE41FDE51
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 13:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727520AbfKOMvi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 07:51:38 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53355 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfKOMvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 07:51:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id u18so9566053wmc.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 04:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6oiliPmUar2/Ste8G2MHZf9apEl23vVDpdr0+DkgpWg=;
        b=OHNJcQ0QK4kZNEGkuF+uWBnDLuYt8X77hsJPMsBowFYk2Z0ampX5iKSdHa0U2+GG9K
         f4C9DaHgf4SvgsaiAdzI8ZcAsabSpIetSIQfKx9uXq5LVyjwZ1ai8cqe+K+QRLWcaEy3
         SsrRi8dFbb9RDsTeslBcJj+6sjLXnE4HjLOAqlLD0W/hKmVkcCXALauw+wH9nl4PMn43
         VoAdhq3VsOVTF7s/gtT0KdmkyqqIa8J1tQLMSo08altBTIS4usrFmr2EoOQqCUddzxO+
         bbWdHUUGWH4/1n+o17gaCg5DyzD+/oXFbRAVZeRcJQa7MrC+if4l+HGEHz6LfMMDdiab
         +g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6oiliPmUar2/Ste8G2MHZf9apEl23vVDpdr0+DkgpWg=;
        b=PmMU60helP1eXElwL+us7ug01RhB6QoapYlgGuCyn/9TQTOut1j4zexAoFHTEQeODZ
         eIHgLgtR+l4kqiw8wxyGzePW3nLtcwt3LmhY3ZBE86/spsoNpjR3UG7aPCuz0F3jQ1oy
         Mz40rSSnTRf8GkXgEer4LJDB2lgbgVbCj0Klih0JebXYJ4fLzyRrTlsZGToJfI6TQLb+
         8xEvz/V6q88M0dSmQu5JnNvFRlUw3bqyKlTdXZ914b97nHOsuAwLnXvX/AXOvFQ4UxJI
         rR4NIhgZ8YRXryTBN34KjwMmT0uNHEp5j38I7lGF9Hn66F0p+scavZaMwMIAne+uep+X
         eIwQ==
X-Gm-Message-State: APjAAAUYAFxoadz39YEF12NTef8s79CzpD9Bb0xe9ICtQsDcWV3dDeDx
        r5kxu41pCuh/VryOqSjxR/LyAw==
X-Google-Smtp-Source: APXvYqxw+3iuLySm/olNp3NdhpihtFg65XcUz60K+VpLfb8GVTHn4OgRrQNFLTcBSFKnDc13iwvEDg==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr13300795wmf.24.1573822289869;
        Fri, 15 Nov 2019 04:51:29 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t5sm10950259wro.76.2019.11.15.04.51.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Nov 2019 04:51:29 -0800 (PST)
Subject: Re: [PATCH v6 1/3] pinctrl: meson: add a new callback for SoCs fixup
To:     Qianggui Song <qianggui.song@amlogic.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Carlo Caione <carlo@caione.org>,
        Rob Herring <robh+dt@kernel.org>,
        Xingyu Chen <xingyu.chen@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1573819429-6937-1-git-send-email-qianggui.song@amlogic.com>
 <1573819429-6937-2-git-send-email-qianggui.song@amlogic.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <8b041ed5-e2f2-0a2c-7b99-b8acf77c9d03@baylibre.com>
Date:   Fri, 15 Nov 2019 13:51:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1573819429-6937-2-git-send-email-qianggui.song@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/11/2019 13:03, Qianggui Song wrote:
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
> |gxbb  |   no                                 |     pull-enable = pull;  |
> |axg   |                                      |                          |
> +------+--------------------------------------+--------------------------+
> |g12a  | parse regs:                          | parse regs:              |
> |sm1   |   gpio,mux,pull,pull-enable,ds       |   gpio,mux,ds            |
> |      | fixup:                               | fixup:                   |
> |      |   no                                 |   pull = gpio;           |
> |      |                                      |   pull-enable = gpio;    |
> +------+--------------------------------------+--------------------------+
> |a1 or | parse regs:                                                     |
> |later |  gpio/mux (without ao domain)                                   |
> |SoCs  | fixup:                                                          |
> |      |  pull = gpio; pull-enable = gpio; ds = gpio;                    |
> +------+-----------------------------------------------------------------+
> Since m8-axg share the same ao fixup, make a common function
> meson8_aobus_parse_dt_extra to do the job.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-axg.c  |  1 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  9 +++++++++
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c |  1 +
>  drivers/pinctrl/meson/pinctrl-meson-gxl.c  |  1 +
>  drivers/pinctrl/meson/pinctrl-meson.c      | 29 ++++++++++++++++++++---------
>  drivers/pinctrl/meson/pinctrl-meson.h      |  5 +++++
>  drivers/pinctrl/meson/pinctrl-meson8.c     |  1 +
>  drivers/pinctrl/meson/pinctrl-meson8b.c    |  1 +
>  8 files changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index ad502eda4afa..072765db93d7 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -1066,6 +1066,7 @@
>  	.num_banks	= ARRAY_SIZE(meson_axg_aobus_banks),
>  	.pmx_ops	= &meson_axg_pmx_ops,
>  	.pmx_data	= &meson_axg_aobus_pmx_banks_data,
> +	.parse_dt	= meson8_aobus_parse_dt_extra,
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
> index 5bfa56f3847e..926b9997159a 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -851,6 +851,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson_gxbb_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson_gxbb_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt	= meson8_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson_gxbb_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 72c5373c8dc1..1b6e8646700f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -820,6 +820,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson_gxl_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson_gxl_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt	= meson8_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson_gxl_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 8bba9d053d9f..26c009f17574 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -625,7 +625,7 @@ static struct regmap *meson_map_resource(struct meson_pinctrl *pc,
>  
>  	i = of_property_match_string(node, "reg-names", name);
>  	if (of_address_to_resource(node, i, &res))
> -		return ERR_PTR(-ENOENT);
> +		return NULL;
>  
>  	base = devm_ioremap_resource(pc->dev, &res);
>  	if (IS_ERR(base))
> @@ -665,26 +665,24 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>  	pc->of_node = gpio_np;
>  
>  	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
> -	if (IS_ERR(pc->reg_mux)) {
> +	if (IS_ERR_OR_NULL(pc->reg_mux)) {
>  		dev_err(pc->dev, "mux registers not found\n");
> -		return PTR_ERR(pc->reg_mux);
> +		return pc->reg_mux ? PTR_ERR(pc->reg_mux) : -ENOENT;
>  	}
>  
>  	pc->reg_gpio = meson_map_resource(pc, gpio_np, "gpio");
> -	if (IS_ERR(pc->reg_gpio)) {
> +	if (IS_ERR_OR_NULL(pc->reg_gpio)) {
>  		dev_err(pc->dev, "gpio registers not found\n");
> -		return PTR_ERR(pc->reg_gpio);
> +		return pc->reg_gpio ? PTR_ERR(pc->reg_gpio) : -ENOENT;
>  	}
>  
>  	pc->reg_pull = meson_map_resource(pc, gpio_np, "pull");
> -	/* Use gpio region if pull one is not present */
>  	if (IS_ERR(pc->reg_pull))
> -		pc->reg_pull = pc->reg_gpio;
> +		pc->reg_pull = NULL;
>  
>  	pc->reg_pullen = meson_map_resource(pc, gpio_np, "pull-enable");
> -	/* Use pull region if pull-enable one is not present */
>  	if (IS_ERR(pc->reg_pullen))
> -		pc->reg_pullen = pc->reg_pull;
> +		pc->reg_pullen = NULL;
>  
>  	pc->reg_ds = meson_map_resource(pc, gpio_np, "ds");
>  	if (IS_ERR(pc->reg_ds)) {
> @@ -692,6 +690,19 @@ static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
>  		pc->reg_ds = NULL;
>  	}
>  
> +	if (pc->data->parse_dt)
> +		return pc->data->parse_dt(pc);
> +
> +	return 0;
> +}
> +
> +int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc)
> +{
> +	if (!pc->reg_pull)
> +		return -EINVAL;
> +
> +	pc->reg_pullen = pc->reg_pull;
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index c696f3241a36..bfa1d3599333 100644
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
> @@ -171,3 +174,5 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev,
>  
>  /* Common probe function */
>  int meson_pinctrl_probe(struct platform_device *pdev);
> +/* Common ao groups extra dt parse function for SoCs before g12a  */
> +int meson8_aobus_parse_dt_extra(struct meson_pinctrl *pc);
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
> index 0b97befa6335..dd17100efdcf 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8.c
> @@ -1103,6 +1103,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson8_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson8_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt	= &meson8_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson8_pinctrl_dt_match[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8b.c b/drivers/pinctrl/meson/pinctrl-meson8b.c
> index a7de388388e6..2d5339edd0b7 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8b.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8b.c
> @@ -962,6 +962,7 @@
>  	.num_funcs	= ARRAY_SIZE(meson8b_aobus_functions),
>  	.num_banks	= ARRAY_SIZE(meson8b_aobus_banks),
>  	.pmx_ops	= &meson8_pmx_ops,
> +	.parse_dt	= &meson8_aobus_parse_dt_extra,
>  };
>  
>  static const struct of_device_id meson8b_pinctrl_dt_match[] = {
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
