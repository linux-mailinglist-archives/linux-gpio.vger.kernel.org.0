Return-Path: <linux-gpio+bounces-7290-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FD8901A7D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 07:54:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65A42B222F4
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 05:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC3817556;
	Mon, 10 Jun 2024 05:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Wy22HMeb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A8B18B14
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 05:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998759; cv=none; b=JCT4c6wNdt3qdjpU59RCvzojlJztXyLR4/FX2KfyUw5USIage4MPZoZ0BNP9A2jJfaZbKw0SpTpm+Se4G2VzoImO4IpsOqZMhJNbmAeOsgfDI666N2rMHY2Uls2c9Mlr3lvcMOiU5LcTtSp5vRKyWrp+wLU2KuFk32ueVkg3czU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998759; c=relaxed/simple;
	bh=rXs80daoL1urmER7FxF7F+IaIDMqSWEUtaoIusX6O8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ngk0D9y94VlaMOnPRxcDoMr1b+CcafzOyVscbQ5R0E2YmWgiLOOT3qfgHUFpXXQCrXhboxcEoyZf8TrcIAsJW+8qrJZBxd3mmOqBHrl14UbSYGuZAA7zrkIRMZir44gMqk6CrF/4uuqBzNfY7vnP9bMgZBpSrnqSI5mrEpm2t8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Wy22HMeb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4217136a74dso18545025e9.2
        for <linux-gpio@vger.kernel.org>; Sun, 09 Jun 2024 22:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717998756; x=1718603556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJozUlgkA6KFUFcC7yQBpq6KTkOF2Xq5WhTEY48C4aI=;
        b=Wy22HMeblqH+YSui8dv+ULybIbSMgqtPkyWuUBOQSUVyLA2D4HyCiQ7Vjwyvw902fx
         Jb5jURYBthH8Zi7Tei/TrcIM6giI6mO0AVWfCYDOHi7RDsb6jwwQGOjrLVBbqsmRmNPe
         qtubcKDVdiD3ETZXGQ32uk4gPFuVZNx6iYGnEuIuLXR+a5ufH6dMHDObv9iSjU22pxlW
         XPB+5viwzESc1UH4SoUEFekPF8iMS3KeNFFP5Vv3UbAMbBF6oOxVx77qcGMZnQ8A9Vfj
         UpfgnTSBT28nCQgvGMfgkiELuPD0M11YVD5mcGe66+p3MN5UrYIEINLJiAiY0xFapD+I
         RPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998756; x=1718603556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJozUlgkA6KFUFcC7yQBpq6KTkOF2Xq5WhTEY48C4aI=;
        b=ibR0DP/YVlTsrHJ2Pj+pXuAocqwydxZftP8iydkhlnWqFvJ86jymXVjyFpc3+mm2o7
         w+/Uceualx2dyfCI8xVZrsRzTD7gasrkMTsa6libl41KGXZVOFa1dLs+EYrjmEKSCySz
         VuNSe9MjZTCNH39oFhU8r4nm+XhIxnIdf9e3dym7Snf3IHquF951WsZh52YBJe80vrcF
         LX8t8cvMYnt8n1K75ZdIBPsAkgm2Mf4/HVksF51HMxdQgvIBBPB6MRbHZ3lfB1TLiQfG
         OgxrVD+PLRNAm5V/Jh0o9L6xEpXNXY5uRLsycxH40lqjQ/cRn3IxhmKLtcYpBUC5XqrW
         ucpA==
X-Forwarded-Encrypted: i=1; AJvYcCXPCEIqs+EtIC5UPNhkCpe8bNw6JcyVw1ODKDYPe+uWbaF+35NNkehsb+RZHxFLPtpN9Af3vWGi95MgPqT4+WfrYSUurvRLyYUTYA==
X-Gm-Message-State: AOJu0YwB2cmdOlkpxN7nihEvISe7bNPAAWUudSuqqWo4dHB1ghE9EmS3
	8vmrd0u49FbmAlus3453wmlNi9ip6v3YOzegmEpcCNIld+IONwJEKw9wf5qVmDc=
X-Google-Smtp-Source: AGHT+IF+2d2tZzwio4L00i22W722MIbPfjJa/FSvXOS2R8pLA1TlFiKNQW+z0tFNt+VKN0xHwk/QRA==
X-Received: by 2002:a05:600c:310e:b0:421:7d7f:c623 with SMTP id 5b1f17b1804b1-4217d7fc9famr28451875e9.11.1717998756080;
        Sun, 09 Jun 2024 22:52:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421cc89e055sm25464975e9.13.2024.06.09.22.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Jun 2024 22:52:35 -0700 (PDT)
Message-ID: <0a415c23-2ab6-4297-b804-7b72ddccc770@tuxon.dev>
Date: Mon, 10 Jun 2024 08:52:34 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/15] pinctrl: renesas: pinctrl-rzg2l: Allow more bits
 for pin configuration
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240530173857.164073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240530173857.164073-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240530173857.164073-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.05.2024 20:38, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The pin configuration bits have been growing for every new SoCs being
> added for the pinctrl-rzg2l driver which would mean updating the macros
> every time for each new configuration. To avoid this allocate additional
> bits for pin configuration by relocating the known fixed bits to the very
> end of the configuration.
> 
> Also update the size of 'cfg' to 'u64' to allow more configuration bits in
> the 'struct rzg2l_variable_pin_cfg'.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com> # on RZ/G3S

> ---
> v2->v3
> - Updated size for cfg in struct rzg2l_variable_pin_cfg
> 
> RFC->v2
> - Merged the macros and rzg2l_variable_pin_cfg changes into single patch
> - Updated types for the config changes
> ---
>  drivers/pinctrl/renesas/pinctrl-rzg2l.c | 30 ++++++++++++++-----------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> index 169986022a73..fe810d8dfa58 100644
> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -78,9 +78,9 @@
>  					 PIN_CFG_FILNUM | \
>  					 PIN_CFG_FILCLKSEL)
>  
> -#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(35, 28)
> -#define PIN_CFG_PIN_REG_MASK		GENMASK(27, 20)
> -#define PIN_CFG_MASK			GENMASK(19, 0)
> +#define PIN_CFG_PIN_MAP_MASK		GENMASK_ULL(62, 55)
> +#define PIN_CFG_PIN_REG_MASK		GENMASK_ULL(54, 47)
> +#define PIN_CFG_MASK			GENMASK_ULL(46, 0)
>  
>  /*
>   * m indicates the bitmap of supported pins, a is the register index
> @@ -102,8 +102,8 @@
>   * (b * 8) and f is the pin configuration capabilities supported.
>   */
>  #define RZG2L_SINGLE_PIN		BIT_ULL(63)
> -#define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK(30, 24)
> -#define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK(22, 20)
> +#define RZG2L_SINGLE_PIN_INDEX_MASK	GENMASK_ULL(62, 56)
> +#define RZG2L_SINGLE_PIN_BITS_MASK	GENMASK_ULL(55, 53)
>  
>  #define RZG2L_SINGLE_PIN_PACK(p, b, f)	(RZG2L_SINGLE_PIN | \
>  					 FIELD_PREP_CONST(RZG2L_SINGLE_PIN_INDEX_MASK, (p)) | \
> @@ -241,9 +241,9 @@ struct rzg2l_dedicated_configs {
>   * @pin: port pin
>   */
>  struct rzg2l_variable_pin_cfg {
> -	u32 cfg:20;
> -	u32 port:5;
> -	u32 pin:3;
> +	u64 cfg:47;
> +	u64 port:5;
> +	u64 pin:3;
>  };
>  
>  struct rzg2l_pinctrl_data {
> @@ -1081,7 +1081,8 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
>  	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[_pin];
>  	u64 *pin_data = pin->drv_data;
>  	unsigned int arg = 0;
> -	u32 off, cfg;
> +	u32 off;
> +	u64 cfg;
>  	int ret;
>  	u8 bit;
>  
> @@ -1185,7 +1186,8 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
>  	u64 *pin_data = pin->drv_data;
>  	enum pin_config_param param;
>  	unsigned int i, arg, index;
> -	u32 cfg, off;
> +	u32 off;
> +	u64 cfg;
>  	int ret;
>  	u8 bit;
>  
> @@ -2413,9 +2415,9 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>  
>  	for (u32 port = 0; port < nports; port++) {
>  		bool has_iolh, has_ien;
> -		u32 off, caps;
> +		u64 cfg, caps;
>  		u8 pincnt;
> -		u64 cfg;
> +		u32 off;
>  
>  		cfg = pctrl->data->port_pin_configs[port];
>  		off = RZG2L_PIN_CFG_TO_PORT_OFFSET(cfg);
> @@ -2459,12 +2461,14 @@ static void rzg2l_pinctrl_pm_setup_regs(struct rzg2l_pinctrl *pctrl, bool suspen
>  static void rzg2l_pinctrl_pm_setup_dedicated_regs(struct rzg2l_pinctrl *pctrl, bool suspend)
>  {
>  	struct rzg2l_pinctrl_reg_cache *cache = pctrl->dedicated_cache;
> +	u64 caps;
> +	u32 i;
>  
>  	/*
>  	 * Make sure entries in pctrl->data->n_dedicated_pins[] having the same
>  	 * port offset are close together.
>  	 */
> -	for (u32 i = 0, caps = 0; i < pctrl->data->n_dedicated_pins; i++) {
> +	for (i = 0, caps = 0; i < pctrl->data->n_dedicated_pins; i++) {
>  		bool has_iolh, has_ien;
>  		u32 off, next_off = 0;
>  		u64 cfg, next_cfg;

