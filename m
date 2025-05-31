Return-Path: <linux-gpio+bounces-20827-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DBAC9B2D
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 15:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E405D189E86E
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 13:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2421623C51B;
	Sat, 31 May 2025 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvTlOkkH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CED12D758;
	Sat, 31 May 2025 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748698196; cv=none; b=LyMGKxafafCXLDrg460R/Ymf/UsYBol3zoEjS5QudmSAM+EqqhYkmpWh/cACTlfUiCckM8CzdR2+nNJJuUBCfSHAmE0NYdtwvnP7SkfMVrfJNRVidVU/eg2H2sCafrb7nHFuYdzKhQlEp/DoaCV3RqBNqUj6lQZ17jzyZh6bqjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748698196; c=relaxed/simple;
	bh=zSj9/PjjaEIB5uOSkwm3Y4/KEH+ENHZ6nr2kv8di2fA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz6vXjFcISzr87UaPsxVZ3IkiP7TwjitpEn3EYvixyuPjnxpwn8RxWJj5gRwrmkOW40/FKV9Avgy1ZrzCNlxsIlsFgwTEL/80MxSL32qaHbItDmUleuKyc51zVysY7VVO9tatM300NFxosUvGEGO/jioqEo84q1GRtSviE/MyxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvTlOkkH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1206476f8f.1;
        Sat, 31 May 2025 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748698192; x=1749302992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W4v4c+bhDQgFaiZRLYL4mV2XqDTJDvDSCztvfLO0B1k=;
        b=hvTlOkkHmyuHotLFKMzPDhmP6D08RydLEel4xkAkNiDdSA5la+v5bDl/ba+lFylaKi
         TV2r9nOUcAmbZxTFDXq7ED1B15MLNqOW33jxcKqPWzEhzOhLCTURwRdQl4zik/ZelHW7
         crNcD64Fx/Y6qUQSrY8xtelEgN/1ZaJOiuGdmhZ5PMtKLKjfL/2CF97znnkCljmIGOVU
         zc9lWSd+ZXCBs59ltYxp5iNzvaD4aqHBpGG599x2MglCTkvs97/320X6/dKNvPwfDJ0Q
         OryTN/DCZoNuQYX+BSs6F1swrvtGXl9pcXAZ0U6SkuIj9IyOtYSSDz75qMv5/tTltT7k
         Fjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748698192; x=1749302992;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4v4c+bhDQgFaiZRLYL4mV2XqDTJDvDSCztvfLO0B1k=;
        b=nfamMdHzWpoMjCsm5Ra9Ul/Jg2E1gyntjq1LuH1iC/5db1k1ErIVtQEEDq+qXuc0Sz
         0FvB6J8qt9mSDHULsXyNC2/1NF4YbyTOi9JesYiNpFC9sKMe1r/Dzcmq5Zp5T6n62fc/
         +eeorHob/bL0Ivpmjdp4XJbHCQxxJty0oKncDo+9T1+lR5olXs5SThEq8MUhn+gguv2R
         pdbyAZznDxzhPgrsrf4rVWYk0q13DYRJH1NZ2cRnLzljqh5zPXQhlOHy92jT1jnsgrKA
         NrZg2R/GPPrNRjj5rzmj4F+jfDeQPIHxUOra44uWU1ttKVuCWxjq6uj3lVsopV/r0DSg
         s4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5/x0Xm1gkLnyF6d0cAuwYW/iaUHAoyF42Uau5Z3PNR23OoTEFhqlz5gdKUD9bZznspZ2vmjKspcQAzBWV@vger.kernel.org, AJvYcCUgEG+5QS+WdAhSRtCqZZoyFMEZZoetcf9tgl4BarOWONP2r/v9ZOVgVXoQ5CidQ8xhtIkEFQs4zREH@vger.kernel.org, AJvYcCWlN2wRkWlPPOi8yOGxUyQAtmcfNIzAoiA8bHsHmFEtRvBMdXxG4WbwLUAn5tWs3ncNyPTSnZI71Ec4fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf2W4YY3ce34NFrsngmQEn52GT+yvqw2LFhz847oS1hkr57V7Q
	b6QCPGC/BxRx38L/aSRP9Uyb6ZEdPWmLOj7J3Hi/uHY7r81pBSi9Xzwu
X-Gm-Gg: ASbGnctSE+5TClFe3368iGAyW8ER5Uw++ZqW9X+uzusXAlmVlnaxZwZhRS+UfaqAaIh
	CfeqQ7m4aBuvoG0bql+F8qAhr4UWZr3yQZGEs9HjOteXpT3dGRhLuJyr7hS4pAK3rkWm3Gz+wyB
	a5iYudmMP/rw3YC8KydaKlpboaYhLXPnUqDlch6OtiMxc1XpcVpe5S1AZtFDnIPhWp03yQ0azIR
	CqwUqVfnOLYcTnBvO4HPrNvUEPaWtx6+fHaiDR9ro033wxWACMDQcL2Pzkg8pl7sxmWCnUDKBHp
	hNEZVKIXdt/fG3aXnX6LW+W2MCm2/CEdmPM4WA5E1Ks/RmmgXPrLYL2cPNO/
X-Google-Smtp-Source: AGHT+IEsx8KC2h3Xow01s+ziLAeI3k6QomVjm2yFbyU8tdvm/GXEy75IolDw690RJ/ZWcIpFA/ku8w==
X-Received: by 2002:a05:600c:1da6:b0:442:d9fb:d9a5 with SMTP id 5b1f17b1804b1-450d6b7cc08mr58334415e9.9.1748698191872;
        Sat, 31 May 2025 06:29:51 -0700 (PDT)
Received: from Ansuel-XPS. ([62.18.208.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm50001555e9.1.2025.05.31.06.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 06:29:50 -0700 (PDT)
Message-ID: <683b044e.050a0220.11338b.f6c8@mx.google.com>
X-Google-Original-Message-ID: <aDsETJJtJHbxdI4a@Ansuel-XPS.>
Date: Sat, 31 May 2025 15:29:48 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] pinctrl: mediatek: airoha: generalize
 pins/group/function/confs handling
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
 <20250527222040.32000-3-ansuelsmth@gmail.com>
 <aDbESUHdO4DgOtsm@lore-desk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDbESUHdO4DgOtsm@lore-desk>

On Wed, May 28, 2025 at 10:07:37AM +0200, Lorenzo Bianconi wrote:
> > In preparation for support of Airoha AN7583, generalize
> > pins/group/function/confs handling and move them in match_data.
> > Inner function will base the values on the pinctrl priv struct instead of
> > relying on hardcoded struct.
> > 
> > This permits to use different PIN data while keeping the same logic.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> 
> Hi Christian,
> 
> I think the approach is fine, just some comments inline.
> 
> Regards,
> Lorenzo
> 
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-airoha.c | 569 ++++++++++++----------
> >  1 file changed, 319 insertions(+), 250 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> > index 8ef7f88477aa..8af9109db992 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
> > @@ -30,20 +30,20 @@
> >  #include "../pinconf.h"
> >  #include "../pinmux.h"
> >  
> > -#define PINCTRL_PIN_GROUP(id)						\
> > -	PINCTRL_PINGROUP(#id, id##_pins, ARRAY_SIZE(id##_pins))
> > +#define PINCTRL_PIN_GROUP(id, table)					\
> 
> since this is now just used for the name pointer, I guess you can rename it in
> "name".
>

Sure.

> > +	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
> >  
> > -#define PINCTRL_FUNC_DESC(id)						\
> > +#define PINCTRL_FUNC_DESC(id, table)					\
> >  	{								\
> >  		.desc = {						\
> >  			.func = {					\
> > -				.name = #id,				\
> > -				.groups = id##_groups,			\
> > -				.ngroups = ARRAY_SIZE(id##_groups),	\
> > +				.name = id,				\
> > +				.groups = table##_groups,		\
> > +				.ngroups = ARRAY_SIZE(table##_groups),	\
> >  			}						\
> >  		},							\
> > -		.groups = id##_func_group,				\
> > -		.group_size = ARRAY_SIZE(id##_func_group),		\
> > +		.groups = table##_func_group,				\
> > +		.group_size = ARRAY_SIZE(table##_func_group),		\
> >  	}
> >  
> >  #define PINCTRL_CONF_DESC(p, offset, mask)				\
> > @@ -359,16 +359,46 @@ struct airoha_pinctrl_gpiochip {
> >  	u32 irq_type[AIROHA_NUM_PINS];
> >  };
> >  
> > +struct airoha_pinctrl_confs_info {
> > +	const struct airoha_pinctrl_conf *confs;
> > +	unsigned int num_confs;
> > +};
> > +
> > +enum airoha_pinctrl_confs_type {
> > +	AIROHA_PINCTRL_CONFS_PULLUP,
> > +	AIROHA_PINCTRL_CONFS_PULLDOWN,
> > +	AIROHA_PINCTRL_CONFS_DRIVE_E2,
> > +	AIROHA_PINCTRL_CONFS_DRIVE_E4,
> > +	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
> > +
> > +	AIROHA_PINCTRL_CONFS_MAX,
> 
> I guess with the approach suggested below we can get rid of AIROHA_PINCTRL_CONFS_MAX
> 
> > +};
> > +
> >  struct airoha_pinctrl {
> >  	struct pinctrl_dev *ctrl;
> >  
> > +	struct pinctrl_desc desc;
> > +	const struct pingroup *grps;
> > +	const struct airoha_pinctrl_func *funcs;
> > +	const struct airoha_pinctrl_confs_info *confs_info;
> > +
> >  	struct regmap *chip_scu;
> >  	struct regmap *regmap;
> >  
> >  	struct airoha_pinctrl_gpiochip gpiochip;
> >  };
> >  
> > -static struct pinctrl_pin_desc airoha_pinctrl_pins[] = {
> > +struct airoha_pinctrl_match_data {
> > +	const struct pinctrl_pin_desc *pins;
> > +	const unsigned int num_pins;
> > +	const struct pingroup *grps;
> > +	const unsigned int num_grps;
> > +	const struct airoha_pinctrl_func *funcs;
> > +	const unsigned int num_funcs;
> > +	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
> 
> In order to generalize the approach, I guess we can use a
> airoha_pinctrl_confs_info pointer here, something like:
> 
> 	const struct airoha_pinctrl_confs_info *confs_info;
> 	const unsigned int num_confs;
> 

You mean putting the entry on a dedicated table.

For num confs I'm not sure as we use the same function and in theory
every pinctrl needs to define them.

> > +};
> > +
> > +static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
> >  	PINCTRL_PIN(0, "uart1_txd"),
> >  	PINCTRL_PIN(1, "uart1_rxd"),
> >  	PINCTRL_PIN(2, "i2c_scl"),
> > @@ -429,172 +459,172 @@ static struct pinctrl_pin_desc airoha_pinctrl_pins[] = {
> >  	PINCTRL_PIN(63, "pcie_reset2"),
> >  };
> >  
> > -static const int pon_pins[] = { 49, 50, 51, 52, 53, 54 };
> > -static const int pon_tod_1pps_pins[] = { 46 };
> > -static const int gsw_tod_1pps_pins[] = { 46 };
> > -static const int sipo_pins[] = { 16, 17 };
> > -static const int sipo_rclk_pins[] = { 16, 17, 43 };
> > -static const int mdio_pins[] = { 14, 15 };
> > -static const int uart2_pins[] = { 48, 55 };
> > -static const int uart2_cts_rts_pins[] = { 46, 47 };
> > -static const int hsuart_pins[] = { 28, 29 };
> > -static const int hsuart_cts_rts_pins[] = { 26, 27 };
> > -static const int uart4_pins[] = { 38, 39 };
> > -static const int uart5_pins[] = { 18, 19 };
> > -static const int i2c0_pins[] = { 2, 3 };
> > -static const int i2c1_pins[] = { 14, 15 };
> > -static const int jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
> > -static const int jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
> > -static const int i2s_pins[] = { 26, 27, 28, 29 };
> > -static const int pcm1_pins[] = { 22, 23, 24, 25 };
> > -static const int pcm2_pins[] = { 18, 19, 20, 21 };
> > -static const int spi_quad_pins[] = { 32, 33 };
> > -static const int spi_pins[] = { 4, 5, 6, 7 };
> > -static const int spi_cs1_pins[] = { 34 };
> > -static const int pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
> > -static const int pcm_spi_int_pins[] = { 14 };
> > -static const int pcm_spi_rst_pins[] = { 15 };
> > -static const int pcm_spi_cs1_pins[] = { 43 };
> > -static const int pcm_spi_cs2_pins[] = { 40 };
> > -static const int pcm_spi_cs2_p128_pins[] = { 40 };
> > -static const int pcm_spi_cs2_p156_pins[] = { 40 };
> > -static const int pcm_spi_cs3_pins[] = { 41 };
> > -static const int pcm_spi_cs4_pins[] = { 42 };
> > -static const int emmc_pins[] = { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37 };
> > -static const int pnand_pins[] = { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42 };
> > -static const int gpio0_pins[] = { 13 };
> > -static const int gpio1_pins[] = { 14 };
> > -static const int gpio2_pins[] = { 15 };
> > -static const int gpio3_pins[] = { 16 };
> > -static const int gpio4_pins[] = { 17 };
> > -static const int gpio5_pins[] = { 18 };
> > -static const int gpio6_pins[] = { 19 };
> > -static const int gpio7_pins[] = { 20 };
> > -static const int gpio8_pins[] = { 21 };
> > -static const int gpio9_pins[] = { 22 };
> > -static const int gpio10_pins[] = { 23 };
> > -static const int gpio11_pins[] = { 24 };
> > -static const int gpio12_pins[] = { 25 };
> > -static const int gpio13_pins[] = { 26 };
> > -static const int gpio14_pins[] = { 27 };
> > -static const int gpio15_pins[] = { 28 };
> > -static const int gpio16_pins[] = { 29 };
> > -static const int gpio17_pins[] = { 30 };
> > -static const int gpio18_pins[] = { 31 };
> > -static const int gpio19_pins[] = { 32 };
> > -static const int gpio20_pins[] = { 33 };
> > -static const int gpio21_pins[] = { 34 };
> > -static const int gpio22_pins[] = { 35 };
> > -static const int gpio23_pins[] = { 36 };
> > -static const int gpio24_pins[] = { 37 };
> > -static const int gpio25_pins[] = { 38 };
> > -static const int gpio26_pins[] = { 39 };
> > -static const int gpio27_pins[] = { 40 };
> > -static const int gpio28_pins[] = { 41 };
> > -static const int gpio29_pins[] = { 42 };
> > -static const int gpio30_pins[] = { 43 };
> > -static const int gpio31_pins[] = { 44 };
> > -static const int gpio33_pins[] = { 46 };
> > -static const int gpio34_pins[] = { 47 };
> > -static const int gpio35_pins[] = { 48 };
> > -static const int gpio36_pins[] = { 49 };
> > -static const int gpio37_pins[] = { 50 };
> > -static const int gpio38_pins[] = { 51 };
> > -static const int gpio39_pins[] = { 52 };
> > -static const int gpio40_pins[] = { 53 };
> > -static const int gpio41_pins[] = { 54 };
> > -static const int gpio42_pins[] = { 55 };
> > -static const int gpio43_pins[] = { 56 };
> > -static const int gpio44_pins[] = { 57 };
> > -static const int gpio45_pins[] = { 58 };
> > -static const int gpio46_pins[] = { 59 };
> > -static const int pcie_reset0_pins[] = { 61 };
> > -static const int pcie_reset1_pins[] = { 62 };
> > -static const int pcie_reset2_pins[] = { 63 };
> > -
> > -static const struct pingroup airoha_pinctrl_groups[] = {
> > -	PINCTRL_PIN_GROUP(pon),
> > -	PINCTRL_PIN_GROUP(pon_tod_1pps),
> > -	PINCTRL_PIN_GROUP(gsw_tod_1pps),
> > -	PINCTRL_PIN_GROUP(sipo),
> > -	PINCTRL_PIN_GROUP(sipo_rclk),
> > -	PINCTRL_PIN_GROUP(mdio),
> > -	PINCTRL_PIN_GROUP(uart2),
> > -	PINCTRL_PIN_GROUP(uart2_cts_rts),
> > -	PINCTRL_PIN_GROUP(hsuart),
> > -	PINCTRL_PIN_GROUP(hsuart_cts_rts),
> > -	PINCTRL_PIN_GROUP(uart4),
> > -	PINCTRL_PIN_GROUP(uart5),
> > -	PINCTRL_PIN_GROUP(i2c0),
> > -	PINCTRL_PIN_GROUP(i2c1),
> > -	PINCTRL_PIN_GROUP(jtag_udi),
> > -	PINCTRL_PIN_GROUP(jtag_dfd),
> > -	PINCTRL_PIN_GROUP(i2s),
> > -	PINCTRL_PIN_GROUP(pcm1),
> > -	PINCTRL_PIN_GROUP(pcm2),
> > -	PINCTRL_PIN_GROUP(spi),
> > -	PINCTRL_PIN_GROUP(spi_quad),
> > -	PINCTRL_PIN_GROUP(spi_cs1),
> > -	PINCTRL_PIN_GROUP(pcm_spi),
> > -	PINCTRL_PIN_GROUP(pcm_spi_int),
> > -	PINCTRL_PIN_GROUP(pcm_spi_rst),
> > -	PINCTRL_PIN_GROUP(pcm_spi_cs1),
> > -	PINCTRL_PIN_GROUP(pcm_spi_cs2_p128),
> > -	PINCTRL_PIN_GROUP(pcm_spi_cs2_p156),
> > -	PINCTRL_PIN_GROUP(pcm_spi_cs2),
> > -	PINCTRL_PIN_GROUP(pcm_spi_cs3),
> > -	PINCTRL_PIN_GROUP(pcm_spi_cs4),
> > -	PINCTRL_PIN_GROUP(emmc),
> > -	PINCTRL_PIN_GROUP(pnand),
> > -	PINCTRL_PIN_GROUP(gpio0),
> > -	PINCTRL_PIN_GROUP(gpio1),
> > -	PINCTRL_PIN_GROUP(gpio2),
> > -	PINCTRL_PIN_GROUP(gpio3),
> > -	PINCTRL_PIN_GROUP(gpio4),
> > -	PINCTRL_PIN_GROUP(gpio5),
> > -	PINCTRL_PIN_GROUP(gpio6),
> > -	PINCTRL_PIN_GROUP(gpio7),
> > -	PINCTRL_PIN_GROUP(gpio8),
> > -	PINCTRL_PIN_GROUP(gpio9),
> > -	PINCTRL_PIN_GROUP(gpio10),
> > -	PINCTRL_PIN_GROUP(gpio11),
> > -	PINCTRL_PIN_GROUP(gpio12),
> > -	PINCTRL_PIN_GROUP(gpio13),
> > -	PINCTRL_PIN_GROUP(gpio14),
> > -	PINCTRL_PIN_GROUP(gpio15),
> > -	PINCTRL_PIN_GROUP(gpio16),
> > -	PINCTRL_PIN_GROUP(gpio17),
> > -	PINCTRL_PIN_GROUP(gpio18),
> > -	PINCTRL_PIN_GROUP(gpio19),
> > -	PINCTRL_PIN_GROUP(gpio20),
> > -	PINCTRL_PIN_GROUP(gpio21),
> > -	PINCTRL_PIN_GROUP(gpio22),
> > -	PINCTRL_PIN_GROUP(gpio23),
> > -	PINCTRL_PIN_GROUP(gpio24),
> > -	PINCTRL_PIN_GROUP(gpio25),
> > -	PINCTRL_PIN_GROUP(gpio26),
> > -	PINCTRL_PIN_GROUP(gpio27),
> > -	PINCTRL_PIN_GROUP(gpio28),
> > -	PINCTRL_PIN_GROUP(gpio29),
> > -	PINCTRL_PIN_GROUP(gpio30),
> > -	PINCTRL_PIN_GROUP(gpio31),
> > -	PINCTRL_PIN_GROUP(gpio33),
> > -	PINCTRL_PIN_GROUP(gpio34),
> > -	PINCTRL_PIN_GROUP(gpio35),
> > -	PINCTRL_PIN_GROUP(gpio36),
> > -	PINCTRL_PIN_GROUP(gpio37),
> > -	PINCTRL_PIN_GROUP(gpio38),
> > -	PINCTRL_PIN_GROUP(gpio39),
> > -	PINCTRL_PIN_GROUP(gpio40),
> > -	PINCTRL_PIN_GROUP(gpio41),
> > -	PINCTRL_PIN_GROUP(gpio42),
> > -	PINCTRL_PIN_GROUP(gpio43),
> > -	PINCTRL_PIN_GROUP(gpio44),
> > -	PINCTRL_PIN_GROUP(gpio45),
> > -	PINCTRL_PIN_GROUP(gpio46),
> > -	PINCTRL_PIN_GROUP(pcie_reset0),
> > -	PINCTRL_PIN_GROUP(pcie_reset1),
> > -	PINCTRL_PIN_GROUP(pcie_reset2),
> > +static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
> > +static const int en7581_pon_tod_1pps_pins[] = { 46 };
> > +static const int en7581_gsw_tod_1pps_pins[] = { 46 };
> > +static const int en7581_sipo_pins[] = { 16, 17 };
> > +static const int en7581_sipo_rclk_pins[] = { 16, 17, 43 };
> > +static const int en7581_mdio_pins[] = { 14, 15 };
> > +static const int en7581_uart2_pins[] = { 48, 55 };
> > +static const int en7581_uart2_cts_rts_pins[] = { 46, 47 };
> > +static const int en7581_hsuart_pins[] = { 28, 29 };
> > +static const int en7581_hsuart_cts_rts_pins[] = { 26, 27 };
> > +static const int en7581_uart4_pins[] = { 38, 39 };
> > +static const int en7581_uart5_pins[] = { 18, 19 };
> > +static const int en7581_i2c0_pins[] = { 2, 3 };
> > +static const int en7581_i2c1_pins[] = { 14, 15 };
> > +static const int en7581_jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
> > +static const int en7581_jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
> > +static const int en7581_i2s_pins[] = { 26, 27, 28, 29 };
> > +static const int en7581_pcm1_pins[] = { 22, 23, 24, 25 };
> > +static const int en7581_pcm2_pins[] = { 18, 19, 20, 21 };
> > +static const int en7581_spi_quad_pins[] = { 32, 33 };
> > +static const int en7581_spi_pins[] = { 4, 5, 6, 7 };
> > +static const int en7581_spi_cs1_pins[] = { 34 };
> > +static const int en7581_pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
> > +static const int en7581_pcm_spi_int_pins[] = { 14 };
> > +static const int en7581_pcm_spi_rst_pins[] = { 15 };
> > +static const int en7581_pcm_spi_cs1_pins[] = { 43 };
> > +static const int en7581_pcm_spi_cs2_pins[] = { 40 };
> > +static const int en7581_pcm_spi_cs2_p128_pins[] = { 40 };
> > +static const int en7581_pcm_spi_cs2_p156_pins[] = { 40 };
> > +static const int en7581_pcm_spi_cs3_pins[] = { 41 };
> > +static const int en7581_pcm_spi_cs4_pins[] = { 42 };
> > +static const int en7581_emmc_pins[] = { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37 };
> > +static const int en7581_pnand_pins[] = { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42 };
> > +static const int en7581_gpio0_pins[] = { 13 };
> > +static const int en7581_gpio1_pins[] = { 14 };
> > +static const int en7581_gpio2_pins[] = { 15 };
> > +static const int en7581_gpio3_pins[] = { 16 };
> > +static const int en7581_gpio4_pins[] = { 17 };
> > +static const int en7581_gpio5_pins[] = { 18 };
> > +static const int en7581_gpio6_pins[] = { 19 };
> > +static const int en7581_gpio7_pins[] = { 20 };
> > +static const int en7581_gpio8_pins[] = { 21 };
> > +static const int en7581_gpio9_pins[] = { 22 };
> > +static const int en7581_gpio10_pins[] = { 23 };
> > +static const int en7581_gpio11_pins[] = { 24 };
> > +static const int en7581_gpio12_pins[] = { 25 };
> > +static const int en7581_gpio13_pins[] = { 26 };
> > +static const int en7581_gpio14_pins[] = { 27 };
> > +static const int en7581_gpio15_pins[] = { 28 };
> > +static const int en7581_gpio16_pins[] = { 29 };
> > +static const int en7581_gpio17_pins[] = { 30 };
> > +static const int en7581_gpio18_pins[] = { 31 };
> > +static const int en7581_gpio19_pins[] = { 32 };
> > +static const int en7581_gpio20_pins[] = { 33 };
> > +static const int en7581_gpio21_pins[] = { 34 };
> > +static const int en7581_gpio22_pins[] = { 35 };
> > +static const int en7581_gpio23_pins[] = { 36 };
> > +static const int en7581_gpio24_pins[] = { 37 };
> > +static const int en7581_gpio25_pins[] = { 38 };
> > +static const int en7581_gpio26_pins[] = { 39 };
> > +static const int en7581_gpio27_pins[] = { 40 };
> > +static const int en7581_gpio28_pins[] = { 41 };
> > +static const int en7581_gpio29_pins[] = { 42 };
> > +static const int en7581_gpio30_pins[] = { 43 };
> > +static const int en7581_gpio31_pins[] = { 44 };
> > +static const int en7581_gpio33_pins[] = { 46 };
> > +static const int en7581_gpio34_pins[] = { 47 };
> > +static const int en7581_gpio35_pins[] = { 48 };
> > +static const int en7581_gpio36_pins[] = { 49 };
> > +static const int en7581_gpio37_pins[] = { 50 };
> > +static const int en7581_gpio38_pins[] = { 51 };
> > +static const int en7581_gpio39_pins[] = { 52 };
> > +static const int en7581_gpio40_pins[] = { 53 };
> > +static const int en7581_gpio41_pins[] = { 54 };
> > +static const int en7581_gpio42_pins[] = { 55 };
> > +static const int en7581_gpio43_pins[] = { 56 };
> > +static const int en7581_gpio44_pins[] = { 57 };
> > +static const int en7581_gpio45_pins[] = { 58 };
> > +static const int en7581_gpio46_pins[] = { 59 };
> > +static const int en7581_pcie_reset0_pins[] = { 61 };
> > +static const int en7581_pcie_reset1_pins[] = { 62 };
> > +static const int en7581_pcie_reset2_pins[] = { 63 };
> > +
> > +static const struct pingroup en7581_pinctrl_groups[] = {
> > +	PINCTRL_PIN_GROUP("pon", en7581_pon),
> > +	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
> > +	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
> > +	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
> > +	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
> > +	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
> > +	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
> > +	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
> > +	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
> > +	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
> > +	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
> > +	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
> > +	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
> > +	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
> > +	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
> > +	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
> > +	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
> > +	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
> > +	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
> > +	PINCTRL_PIN_GROUP("spi", en7581_spi),
> > +	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
> > +	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
> > +	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
> > +	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
> > +	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
> > +	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
> > +	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
> > +	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
> > +	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
> > +	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
> > +	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
> > +	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
> > +	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
> > +	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
> > +	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
> > +	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
> > +	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
> > +	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
> > +	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
> > +	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
> > +	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
> > +	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
> > +	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
> > +	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
> > +	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
> > +	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
> > +	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
> > +	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
> > +	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
> > +	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
> > +	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
> > +	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
> > +	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
> > +	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
> > +	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
> > +	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
> > +	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
> > +	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
> > +	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
> > +	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
> > +	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
> > +	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
> > +	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
> > +	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
> > +	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
> > +	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
> > +	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
> > +	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
> > +	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
> > +	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
> > +	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
> > +	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
> > +	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
> > +	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
> > +	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
> > +	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
> > +	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
> > +	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
> > +	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
> > +	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
> > +	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
> > +	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
> >  };
> >  
> >  static const char *const pon_groups[] = { "pon" };
> > @@ -1957,33 +1987,33 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
> >  	},
> >  };
> >  
> > -static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] = {
> > -	PINCTRL_FUNC_DESC(pon),
> > -	PINCTRL_FUNC_DESC(tod_1pps),
> > -	PINCTRL_FUNC_DESC(sipo),
> > -	PINCTRL_FUNC_DESC(mdio),
> > -	PINCTRL_FUNC_DESC(uart),
> > -	PINCTRL_FUNC_DESC(i2c),
> > -	PINCTRL_FUNC_DESC(jtag),
> > -	PINCTRL_FUNC_DESC(pcm),
> > -	PINCTRL_FUNC_DESC(spi),
> > -	PINCTRL_FUNC_DESC(pcm_spi),
> > -	PINCTRL_FUNC_DESC(i2s),
> > -	PINCTRL_FUNC_DESC(emmc),
> > -	PINCTRL_FUNC_DESC(pnand),
> > -	PINCTRL_FUNC_DESC(pcie_reset),
> > -	PINCTRL_FUNC_DESC(pwm),
> > -	PINCTRL_FUNC_DESC(phy1_led0),
> > -	PINCTRL_FUNC_DESC(phy2_led0),
> > -	PINCTRL_FUNC_DESC(phy3_led0),
> > -	PINCTRL_FUNC_DESC(phy4_led0),
> > -	PINCTRL_FUNC_DESC(phy1_led1),
> > -	PINCTRL_FUNC_DESC(phy2_led1),
> > -	PINCTRL_FUNC_DESC(phy3_led1),
> > -	PINCTRL_FUNC_DESC(phy4_led1),
> > +static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
> > +	PINCTRL_FUNC_DESC("pon", pon),
> > +	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
> > +	PINCTRL_FUNC_DESC("sipo", sipo),
> > +	PINCTRL_FUNC_DESC("mdio", mdio),
> > +	PINCTRL_FUNC_DESC("uart", uart),
> > +	PINCTRL_FUNC_DESC("i2c", i2c),
> > +	PINCTRL_FUNC_DESC("jtag", jtag),
> > +	PINCTRL_FUNC_DESC("pcm", pcm),
> > +	PINCTRL_FUNC_DESC("spi", spi),
> > +	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
> > +	PINCTRL_FUNC_DESC("i2s", i2s),
> > +	PINCTRL_FUNC_DESC("emmc", emmc),
> > +	PINCTRL_FUNC_DESC("pnand", pnand),
> > +	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
> > +	PINCTRL_FUNC_DESC("pwm", pwm),
> > +	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
> > +	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
> > +	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
> > +	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
> > +	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
> > +	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
> > +	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
> > +	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
> >  };
> >  
> > -static const struct airoha_pinctrl_conf airoha_pinctrl_pullup_conf[] = {
> > +static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
> >  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
> >  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
> >  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
> > @@ -2044,7 +2074,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_pullup_conf[] = {
> >  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
> >  };
> >  
> > -static const struct airoha_pinctrl_conf airoha_pinctrl_pulldown_conf[] = {
> > +static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
> >  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
> >  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
> >  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
> > @@ -2105,7 +2135,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_pulldown_conf[] = {
> >  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
> >  };
> >  
> > -static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e2_conf[] = {
> > +static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
> >  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
> >  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
> >  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
> > @@ -2166,7 +2196,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e2_conf[] = {
> >  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
> >  };
> >  
> > -static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e4_conf[] = {
> > +static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
> >  	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
> >  	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
> >  	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
> > @@ -2227,7 +2257,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e4_conf[] = {
> >  	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
> >  };
> >  
> > -static const struct airoha_pinctrl_conf airoha_pinctrl_pcie_rst_od_conf[] = {
> > +static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
> >  	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
> >  	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
> >  	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
> > @@ -2548,12 +2578,17 @@ airoha_pinctrl_get_conf_reg(const struct airoha_pinctrl_conf *conf,
> >  }
> >  
> >  static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
> > -				   const struct airoha_pinctrl_conf *conf,
> > -				   int conf_size, int pin, u32 *val)
> > +				   enum airoha_pinctrl_confs_type conf_type,
> > +				   int pin, u32 *val)
> >  {
> > +	const struct airoha_pinctrl_confs_info *confs_info;
> >  	const struct airoha_pinctrl_reg *reg;
> >  
> > -	reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
> > +	confs_info = &pinctrl->confs_info[conf_type];
> > +
> > +	reg = airoha_pinctrl_get_conf_reg(confs_info->confs,
> > +					  confs_info->num_confs,
> > +					  pin);
> >  	if (!reg)
> >  		return -EINVAL;
> >  
> > @@ -2566,12 +2601,17 @@ static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
> >  }
> >  
> >  static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
> > -				   const struct airoha_pinctrl_conf *conf,
> > -				   int conf_size, int pin, u32 val)
> > +				   enum airoha_pinctrl_confs_type conf_type,
> > +				   int pin, u32 val)
> >  {
> > +	const struct airoha_pinctrl_confs_info *confs_info;
> >  	const struct airoha_pinctrl_reg *reg = NULL;
> >  
> > -	reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
> > +	confs_info = &pinctrl->confs_info[conf_type];
> > +
> > +	reg = airoha_pinctrl_get_conf_reg(confs_info->confs,
> > +					  confs_info->num_confs,
> > +					  pin);
> >  	if (!reg)
> >  		return -EINVAL;
> >  
> > @@ -2584,44 +2624,34 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
> >  }
> >  
> >  #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
> > -				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
> > +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
> >  				(pin), (val))
> >  #define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
> > +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
> >  				(pin), (val))
> >  #define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
> > +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
> >  				(pin), (val))
> >  #define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
> > +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
> >  				(pin), (val))
> >  #define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
> > +	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
> >  				(pin), (val))
> >  #define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
> > -				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
> > +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
> >  				(pin), (val))
> >  #define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
> > +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
> >  				(pin), (val))
> >  #define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
> > +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
> >  				(pin), (val))
> >  #define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
> > +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
> >  				(pin), (val))
> >  #define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
> > -	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
> > -				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
> > +	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
> >  				(pin), (val))
> >  
> >  static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
> > @@ -2798,12 +2828,13 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
> >  static int airoha_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
> >  				    unsigned int group, unsigned long *config)
> >  {
> > +	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
> >  	u32 cur_config = 0;
> >  	int i;
> >  
> > -	for (i = 0; i < airoha_pinctrl_groups[group].npins; i++) {
> > +	for (i = 0; i < pinctrl->grps[group].npins; i++) {
> >  		if (airoha_pinconf_get(pctrl_dev,
> > -				       airoha_pinctrl_groups[group].pins[i],
> > +				       pinctrl->grps[group].pins[i],
> >  				       config))
> >  			return -EOPNOTSUPP;
> >  
> > @@ -2820,13 +2851,14 @@ static int airoha_pinconf_group_set(struct pinctrl_dev *pctrl_dev,
> >  				    unsigned int group, unsigned long *configs,
> >  				    unsigned int num_configs)
> >  {
> > +	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
> >  	int i;
> >  
> > -	for (i = 0; i < airoha_pinctrl_groups[group].npins; i++) {
> > +	for (i = 0; i < pinctrl->grps[group].npins; i++) {
> >  		int err;
> >  
> >  		err = airoha_pinconf_set(pctrl_dev,
> > -					 airoha_pinctrl_groups[group].pins[i],
> > +					 pinctrl->grps[group].pins[i],
> >  					 configs, num_configs);
> >  		if (err)
> >  			return err;
> > @@ -2852,23 +2884,16 @@ static const struct pinctrl_ops airoha_pctlops = {
> >  	.dt_free_map = pinconf_generic_dt_free_map,
> >  };
> >  
> > -static struct pinctrl_desc airoha_pinctrl_desc = {
> > -	.name = KBUILD_MODNAME,
> > -	.owner = THIS_MODULE,
> > -	.pctlops = &airoha_pctlops,
> > -	.pmxops = &airoha_pmxops,
> > -	.confops = &airoha_confops,
> > -	.pins = airoha_pinctrl_pins,
> > -	.npins = ARRAY_SIZE(airoha_pinctrl_pins),
> > -};
> > -
> >  static int airoha_pinctrl_probe(struct platform_device *pdev)
> >  {
> > +	const struct airoha_pinctrl_match_data *data;
> >  	struct device *dev = &pdev->dev;
> >  	struct airoha_pinctrl *pinctrl;
> >  	struct regmap *map;
> >  	int err, i;
> >  
> > +	data = device_get_match_data(dev);
> > +
> >  	pinctrl = devm_kzalloc(dev, sizeof(*pinctrl), GFP_KERNEL);
> >  	if (!pinctrl)
> >  		return -ENOMEM;
> > @@ -2883,14 +2908,23 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
> >  
> >  	pinctrl->chip_scu = map;
> >  
> > -	err = devm_pinctrl_register_and_init(dev, &airoha_pinctrl_desc,
> > +	/* Init pinctrl desc struct */
> > +	pinctrl->desc.name = KBUILD_MODNAME;
> > +	pinctrl->desc.owner = THIS_MODULE,
> > +	pinctrl->desc.pctlops = &airoha_pctlops,
> > +	pinctrl->desc.pmxops = &airoha_pmxops,
> > +	pinctrl->desc.confops = &airoha_confops,
> > +	pinctrl->desc.pins = data->pins,
> > +	pinctrl->desc.npins = data->num_pins,
> > +
> > +	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
> >  					     pinctrl, &pinctrl->ctrl);
> >  	if (err)
> >  		return err;
> >  
> >  	/* build pin groups */
> > -	for (i = 0; i < ARRAY_SIZE(airoha_pinctrl_groups); i++) {
> > -		const struct pingroup *grp = &airoha_pinctrl_groups[i];
> > +	for (i = 0; i < data->num_grps; i++) {
> > +		const struct pingroup *grp = &data->grps[i];
> >  
> >  		err = pinctrl_generic_add_group(pinctrl->ctrl, grp->name,
> >  						grp->pins, grp->npins,
> > @@ -2903,10 +2937,10 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
> >  	}
> >  
> >  	/* build functions */
> > -	for (i = 0; i < ARRAY_SIZE(airoha_pinctrl_funcs); i++) {
> > +	for (i = 0; i < data->num_funcs; i++) {
> >  		const struct airoha_pinctrl_func *func;
> >  
> > -		func = &airoha_pinctrl_funcs[i];
> > +		func = &data->funcs[i];
> >  		err = pinmux_generic_add_function(pinctrl->ctrl,
> >  						  func->desc.func.name,
> >  						  func->desc.func.groups,
> > @@ -2919,6 +2953,10 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >  
> > +	pinctrl->grps = data->grps;
> > +	pinctrl->funcs = data->funcs;
> > +	pinctrl->confs_info = data->confs_info;
> 
> I guess we can just use a airoha_pinctrl_match_data pointer here.
>

Yep it was to prevent too much redirection. Maybe I can just add to the
priv struct pointer to match_data ?

> > +
> >  	err = pinctrl_enable(pinctrl->ctrl);
> >  	if (err)
> >  		return err;
> > @@ -2927,8 +2965,39 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
> >  	return airoha_pinctrl_add_gpiochip(pinctrl, pdev);
> >  }
> >  
> > +static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
> > +	.pins = en7581_pinctrl_pins,
> > +	.num_pins = ARRAY_SIZE(en7581_pinctrl_pins),
> > +	.grps = en7581_pinctrl_groups,
> > +	.num_grps = ARRAY_SIZE(en7581_pinctrl_groups),
> > +	.funcs = en7581_pinctrl_funcs,
> > +	.num_funcs = ARRAY_SIZE(en7581_pinctrl_funcs),
> > +	.confs_info = {
> > +		[AIROHA_PINCTRL_CONFS_PULLUP] = {
> > +			.confs = en7581_pinctrl_pullup_conf,
> > +			.num_confs = ARRAY_SIZE(en7581_pinctrl_pullup_conf),
> > +		},
> > +		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
> > +			.confs = en7581_pinctrl_pulldown_conf,
> > +			.num_confs = ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
> > +		},
> > +		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
> > +			.confs = en7581_pinctrl_drive_e2_conf,
> > +			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
> > +		},
> > +		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
> > +			.confs = en7581_pinctrl_drive_e4_conf,
> > +			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
> > +		},
> > +		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
> > +			.confs = en7581_pinctrl_pcie_rst_od_conf,
> > +			.num_confs = ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
> > +		},
> > +	},
> > +};
> > +
> >  static const struct of_device_id airoha_pinctrl_of_match[] = {
> > -	{ .compatible = "airoha,en7581-pinctrl" },
> > +	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
> > -- 
> > 2.48.1
> > 

-- 
	Ansuel

