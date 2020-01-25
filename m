Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D907C14954D
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jan 2020 12:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgAYLeI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jan 2020 06:34:08 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55277 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbgAYLeI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jan 2020 06:34:08 -0500
Received: by mail-pj1-f67.google.com with SMTP id dw13so523627pjb.4
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jan 2020 03:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I/SbAU7Mxnx0tx7ru42ZvtxyMPx7VKLEDaci5G9/z/I=;
        b=JpTlvowUSpCpniIjbrrQWDpGdPNObBvlMiYL/V3vdGPTXxqQfTAjv8pT1z4p+kbwu0
         GKp7gxNEYR48Mj20wSFDWm85HEOJbL8vlnH1KE+v0a66vWnCxjzbuT4KAR0Z1bRd8Ijo
         tX+ga7hBTVdRZGKtSGYLjMg5IQM0e+nsnR+WCWvSk3XdkTiC8xZoDN6nFDmeEnYpeb+n
         XqNGCH8HPPjGVNQRVHfXIRohW1EZIxIJDdUnbQf5DTldgcpQYiqZ793xByM2FxL250Nr
         vlL3KfCMHVLyPGIUB/z4bxWZM4h9LNuXf2gMloagJ1Pzjv2rwcwtfRzJHdKQAZBcjaNz
         MTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I/SbAU7Mxnx0tx7ru42ZvtxyMPx7VKLEDaci5G9/z/I=;
        b=WUxo8C5Z5Q3eXqTB6rHgCn+AooPxt/9V54Im/kifRdjU4io7Erbw9fyDbB40pOS4Vk
         7SMTnrv8guCf9V+F8KH6aZqX+1LQ5i/69joyzT06+MWv44zO2V7Lx+lB7FEC63OBH2kP
         YwgrXS0ILXB5UnfgI8W9Pj0jCYilYNk9FVEZcPh9ByugQwn4+Xo/jGxfb+h4KE56L1OG
         /bfoozaFOUiLD/B9dZZSGuhApKJJQ96eWdUmSyXdbV9//OfZarMQ3U1FnClfCs+BByIy
         lWfJhnKd7jaCIErFVzTPaU6E099w/fgULrjYRpUncYUAJ4h9/AC7rTplUWA6J+uyPmRw
         K2eg==
X-Gm-Message-State: APjAAAW0vsVuC/a0mHF79fuwYChx2opmtDvqggCosf4yw0HrJHwuTNxP
        fLa/dp+yL4jjuts5urxwFkeu
X-Google-Smtp-Source: APXvYqzNnb1DL3YHC4J73GJYcUNYQdGoebhwbUDHQSM7IuOe1LFYT8FT+qTXBd6fRiu1OMl9LqZa/w==
X-Received: by 2002:a17:90a:7f86:: with SMTP id m6mr4346753pjl.143.1579952046819;
        Sat, 25 Jan 2020 03:34:06 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:606:2d17:8c3b:978d:aab4:c772])
        by smtp.gmail.com with ESMTPSA id x11sm9121128pfn.53.2020.01.25.03.34.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Jan 2020 03:34:06 -0800 (PST)
Date:   Sat, 25 Jan 2020 17:03:58 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Matheus Castello <matheus@castello.eng.br>
Cc:     pn@denx.de, afaerber@suse.de, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: actions: Fix functions groups names
Message-ID: <20200125113355.GA22220@Mani-XPS-13-9360>
References: <838d8378-1a6a-11c4-fad8-aeb4b861478b@castello.eng.br>
 <20200124133758.10089-1-matheus@castello.eng.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200124133758.10089-1-matheus@castello.eng.br>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 24, 2020 at 10:37:58AM -0300, Matheus Castello wrote:
> Group names by function do not match their respective structures and
> documentation defined names.
> 
> This fixes following errors when groups names defined on documentation are used:
> [    4.262778] pinctrl-s700 e01b0000.pinctrl: invalid group "sd0_d1_mfp" for function "sd0"
> [    4.271394] pinctrl-s700 e01b0000.pinctrl: invalid group "sd0_d2_d3_mfp" for function "sd0"
> [    4.280248] pinctrl-s700 e01b0000.pinctrl: invalid group "sd1_d0_d3_mfp" for function "sd0"
> [    4.289122] pinctrl-s700 e01b0000.pinctrl: invalid group "sd0_cmd_mfp" for function "sd0"
> 
> Fixes: 81c9d563cc74 (pinctrl: actions: Add Actions Semi S700 pinctrl driver)
> Signed-off-by: Matheus Castello <matheus@castello.eng.br>

Nitpick, better to mention S700 in the subject as below:

pinctrl: actions: Fix functions groups names for S700 SoC

With that,
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Linus can you fix that while applying?

Thanks,
Mani

> ---
>  drivers/pinctrl/actions/pinctrl-s700.c | 510 ++++++++++++-------------
>  1 file changed, 255 insertions(+), 255 deletions(-)
> 
> diff --git a/drivers/pinctrl/actions/pinctrl-s700.c b/drivers/pinctrl/actions/pinctrl-s700.c
> index 8b8121e35edb..1182b38ff4dc 100644
> --- a/drivers/pinctrl/actions/pinctrl-s700.c
> +++ b/drivers/pinctrl/actions/pinctrl-s700.c
> @@ -1125,317 +1125,317 @@ static const struct owl_pingroup s700_groups[] = {
>  };
>  
>  static const char * const nor_groups[] = {
> -	"lcd0_d18",
> -	"i2s_d0",
> -	"i2s0_pcm0",
> -	"i2s1_pcm0",
> -	"i2s_d1",
> -	"ks_in2",
> -	"ks_in1",
> -	"ks_in0",
> -	"ks_in3",
> -	"ks_out0",
> -	"ks_out1",
> -	"ks_out2",
> -	"lcd0_d2",
> -	"lvds_ee_pn",
> -	"uart2_rx_tx",
> -	"spi0_i2c_pcm",
> -	"lvds_e_pn",
> -	"sd0_d0",
> -	"sd0_d1",
> -	"sd0_d2_d3",
> -	"sd1_d0_d3",
> -	"sd0_cmd",
> -	"sd1_cmd",
> -	"sens0_ckout",
> -	"sen0_pclk",
> +	"lcd0_d18_mfp",
> +	"i2s_d0_mfp",
> +	"i2s0_pcm0_mfp",
> +	"i2s1_pcm0_mfp",
> +	"i2s_d1_mfp",
> +	"ks_in2_mfp",
> +	"ks_in1_mfp",
> +	"ks_in0_mfp",
> +	"ks_in3_mfp",
> +	"ks_out0_mfp",
> +	"ks_out1_mfp",
> +	"ks_out2_mfp",
> +	"lcd0_d2_mfp",
> +	"lvds_ee_pn_mfp",
> +	"uart2_rx_tx_mfp",
> +	"spi0_i2c_pcm_mfp",
> +	"lvds_e_pn_mfp",
> +	"sd0_d0_mfp",
> +	"sd0_d1_mfp",
> +	"sd0_d2_d3_mfp",
> +	"sd1_d0_d3_mfp",
> +	"sd0_cmd_mfp",
> +	"sd1_cmd_mfp",
> +	"sens0_ckout_mfp",
> +	"sen0_pclk_mfp",
>  };
>  
>  static const char * const eth_rmii_groups[] = {
> -	"rgmii_txd23",
> -	"rgmii_rxd2",
> -	"rgmii_rxd3",
> -	"rgmii_txd01",
> -	"rgmii_txd0",
> -	"rgmii_txd1",
> -	"rgmii_txen",
> -	"rgmii_rxen",
> -	"rgmii_rxd1",
> -	"rgmii_rxd0",
> -	"rgmii_ref_clk",
> +	"rgmii_txd23_mfp",
> +	"rgmii_rxd2_mfp",
> +	"rgmii_rxd3_mfp",
> +	"rgmii_txd01_mfp",
> +	"rgmii_txd0_mfp",
> +	"rgmii_txd1_mfp",
> +	"rgmii_txen_mfp",
> +	"rgmii_rxen_mfp",
> +	"rgmii_rxd1_mfp",
> +	"rgmii_rxd0_mfp",
> +	"rgmii_ref_clk_mfp",
>  	"eth_smi_dummy",
>  };
>  
>  static const char * const eth_smii_groups[] = {
> -	"rgmii_txd0",
> -	"rgmii_txd1",
> -	"rgmii_rxd0",
> -	"rgmii_rxd1",
> -	"rgmii_ref_clk",
> +	"rgmii_txd0_mfp",
> +	"rgmii_txd1_mfp",
> +	"rgmii_rxd0_mfp",
> +	"rgmii_rxd1_mfp",
> +	"rgmii_ref_clk_mfp",
>  	"eth_smi_dummy",
>  };
>  
>  static const char * const spi0_groups[] = {
> -	"dsi_dn0",
> -	"dsi_dp2",
> -	"dsi_dp0",
> -	"uart2_rx_tx",
> -	"spi0_i2c_pcm",
> -	"dsi_dn2",
> +	"dsi_dn0_mfp",
> +	"dsi_dp2_mfp",
> +	"dsi_dp0_mfp",
> +	"uart2_rx_tx_mfp",
> +	"spi0_i2c_pcm_mfp",
> +	"dsi_dn2_mfp",
>  };
>  
>  static const char * const spi1_groups[] = {
> -	"uart0_rx",
> -	"uart0_tx",
> +	"uart0_rx_mfp",
> +	"uart0_tx_mfp",
>  	"i2c0_mfp",
>  };
>  
>  static const char * const spi2_groups[] = {
> -	"rgmii_txd01",
> -	"rgmii_txd0",
> -	"rgmii_txd1",
> -	"rgmii_ref_clk",
> -	"dnand_acle_ce0",
> +	"rgmii_txd01_mfp",
> +	"rgmii_txd0_mfp",
> +	"rgmii_txd1_mfp",
> +	"rgmii_ref_clk_mfp",
> +	"dnand_acle_ce0_mfp",
>  };
>  
>  static const char * const spi3_groups[] = {
> -	"rgmii_txen",
> -	"rgmii_rxen",
> -	"rgmii_rxd1",
> -	"rgmii_rxd0",
> +	"rgmii_txen_mfp",
> +	"rgmii_rxen_mfp",
> +	"rgmii_rxd1_mfp",
> +	"rgmii_rxd0_mfp",
>  };
>  
>  static const char * const sens0_groups[] = {
> -	"csi_cn_cp",
> -	"sens0_ckout",
> -	"csi_dn_dp",
> -	"sen0_pclk",
> +	"csi_cn_cp_mfp",
> +	"sens0_ckout_mfp",
> +	"csi_dn_dp_mfp",
> +	"sen0_pclk_mfp",
>  };
>  
>  static const char * const sens1_groups[] = {
> -	"lcd0_d18",
> -	"ks_in2",
> -	"ks_in1",
> -	"ks_in0",
> -	"ks_in3",
> -	"ks_out0",
> -	"ks_out1",
> -	"ks_out2",
> -	"sens0_ckout",
> -	"pcm1_in",
> -	"pcm1_clk",
> -	"pcm1_sync",
> -	"pcm1_out",
> +	"lcd0_d18_mfp",
> +	"ks_in2_mfp",
> +	"ks_in1_mfp",
> +	"ks_in0_mfp",
> +	"ks_in3_mfp",
> +	"ks_out0_mfp",
> +	"ks_out1_mfp",
> +	"ks_out2_mfp",
> +	"sens0_ckout_mfp",
> +	"pcm1_in_mfp",
> +	"pcm1_clk_mfp",
> +	"pcm1_sync_mfp",
> +	"pcm1_out_mfp",
>  };
>  
>  static const char * const uart0_groups[] = {
> -	"uart2_rtsb",
> -	"uart2_ctsb",
> -	"uart0_rx",
> -	"uart0_tx",
> +	"uart2_rtsb_mfp",
> +	"uart2_ctsb_mfp",
> +	"uart0_rx_mfp",
> +	"uart0_tx_mfp",
>  };
>  
>  static const char * const uart1_groups[] = {
> -	"sd0_d2_d3",
> +	"sd0_d2_d3_mfp",
>  	"i2c0_mfp",
>  };
>  
>  static const char * const uart2_groups[] = {
> -	"rgmii_txen",
> -	"rgmii_rxen",
> -	"rgmii_rxd1",
> -	"rgmii_rxd0",
> -	"dsi_dn0",
> -	"dsi_dp2",
> -	"dsi_dp0",
> -	"uart2_rx_tx",
> -	"dsi_dn2",
> -	"uart2_rtsb",
> -	"uart2_ctsb",
> -	"sd0_d0",
> -	"sd0_d1",
> -	"sd0_d2_d3",
> -	"uart0_rx",
> -	"uart0_tx",
> +	"rgmii_txen_mfp",
> +	"rgmii_rxen_mfp",
> +	"rgmii_rxd1_mfp",
> +	"rgmii_rxd0_mfp",
> +	"dsi_dn0_mfp",
> +	"dsi_dp2_mfp",
> +	"dsi_dp0_mfp",
> +	"uart2_rx_tx_mfp",
> +	"dsi_dn2_mfp",
> +	"uart2_rtsb_mfp",
> +	"uart2_ctsb_mfp",
> +	"sd0_d0_mfp",
> +	"sd0_d1_mfp",
> +	"sd0_d2_d3_mfp",
> +	"uart0_rx_mfp",
> +	"uart0_tx_mfp",
>  	"i2c0_mfp",
>  	"uart2_dummy"
>  };
>  
>  static const char * const uart3_groups[] = {
> -	"rgmii_txd23",
> -	"rgmii_rxd2",
> -	"rgmii_rxd3",
> -	"uart3_rtsb",
> -	"uart3_ctsb",
> +	"rgmii_txd23_mfp",
> +	"rgmii_rxd2_mfp",
> +	"rgmii_rxd3_mfp",
> +	"uart3_rtsb_mfp",
> +	"uart3_ctsb_mfp",
>  	"uart3_dummy"
>  };
>  
>  static const char * const uart4_groups[] = {
> -	"rgmii_txd01",
> -	"rgmii_ref_clk",
> -	"ks_out0",
> -	"ks_out1",
> +	"rgmii_txd01_mfp",
> +	"rgmii_ref_clk_mfp",
> +	"ks_out0_mfp",
> +	"ks_out1_mfp",
>  };
>  
>  static const char * const uart5_groups[] = {
> -	"rgmii_rxd1",
> -	"rgmii_rxd0",
> -	"ks_out0",
> -	"ks_out2",
> -	"uart3_rtsb",
> -	"uart3_ctsb",
> -	"sd0_d0",
> -	"sd0_d1",
> +	"rgmii_rxd1_mfp",
> +	"rgmii_rxd0_mfp",
> +	"ks_out0_mfp",
> +	"ks_out2_mfp",
> +	"uart3_rtsb_mfp",
> +	"uart3_ctsb_mfp",
> +	"sd0_d0_mfp",
> +	"sd0_d1_mfp",
>  };
>  
>  static const char * const uart6_groups[] = {
> -	"rgmii_txd0",
> -	"rgmii_txd1",
> +	"rgmii_txd0_mfp",
> +	"rgmii_txd1_mfp",
>  };
>  
>  static const char * const i2s0_groups[] = {
> -	"i2s_d0",
> -	"i2s_pcm1",
> -	"i2s0_pcm0",
> +	"i2s_d0_mfp",
> +	"i2s_pcm1_mfp",
> +	"i2s0_pcm0_mfp",
>  };
>  
>  static const char * const i2s1_groups[] = {
> -	"i2s1_pcm0",
> -	"i2s_d1",
> +	"i2s1_pcm0_mfp",
> +	"i2s_d1_mfp",
>  	"i2s1_dummy",
> -	"spi0_i2c_pcm",
> -	"uart0_rx",
> -	"uart0_tx",
> +	"spi0_i2c_pcm_mfp",
> +	"uart0_rx_mfp",
> +	"uart0_tx_mfp",
>  };
>  
>  static const char * const pcm1_groups[] = {
> -	"i2s_pcm1",
> -	"spi0_i2c_pcm",
> -	"uart0_rx",
> -	"uart0_tx",
> -	"pcm1_in",
> -	"pcm1_clk",
> -	"pcm1_sync",
> -	"pcm1_out",
> +	"i2s_pcm1_mfp",
> +	"spi0_i2c_pcm_mfp",
> +	"uart0_rx_mfp",
> +	"uart0_tx_mfp",
> +	"pcm1_in_mfp",
> +	"pcm1_clk_mfp",
> +	"pcm1_sync_mfp",
> +	"pcm1_out_mfp",
>  };
>  
>  static const char * const pcm0_groups[] = {
> -	"i2s0_pcm0",
> -	"i2s1_pcm0",
> -	"uart2_rx_tx",
> -	"spi0_i2c_pcm",
> +	"i2s0_pcm0_mfp",
> +	"i2s1_pcm0_mfp",
> +	"uart2_rx_tx_mfp",
> +	"spi0_i2c_pcm_mfp",
>  };
>  
>  static const char * const ks_groups[] = {
> -	"ks_in2",
> -	"ks_in1",
> -	"ks_in0",
> -	"ks_in3",
> -	"ks_out0",
> -	"ks_out1",
> -	"ks_out2",
> +	"ks_in2_mfp",
> +	"ks_in1_mfp",
> +	"ks_in0_mfp",
> +	"ks_in3_mfp",
> +	"ks_out0_mfp",
> +	"ks_out1_mfp",
> +	"ks_out2_mfp",
>  };
>  
>  static const char * const jtag_groups[] = {
> -	"ks_in2",
> -	"ks_in1",
> -	"ks_in0",
> -	"ks_in3",
> -	"ks_out1",
> -	"sd0_d0",
> -	"sd0_d2_d3",
> -	"sd0_cmd",
> -	"sd0_clk",
> +	"ks_in2_mfp",
> +	"ks_in1_mfp",
> +	"ks_in0_mfp",
> +	"ks_in3_mfp",
> +	"ks_out1_mfp",
> +	"sd0_d0_mfp",
> +	"sd0_d2_d3_mfp",
> +	"sd0_cmd_mfp",
> +	"sd0_clk_mfp",
>  };
>  
>  static const char * const pwm0_groups[] = {
> -	"rgmii_rxd2",
> -	"rgmii_txen",
> -	"ks_in2",
> -	"sen0_pclk",
> +	"rgmii_rxd2_mfp",
> +	"rgmii_txen_mfp",
> +	"ks_in2_mfp",
> +	"sen0_pclk_mfp",
>  };
>  
>  static const char * const pwm1_groups[] = {
> -	"rgmii_rxen",
> -	"ks_in1",
> -	"ks_in3",
> -	"sens0_ckout",
> +	"rgmii_rxen_mfp",
> +	"ks_in1_mfp",
> +	"ks_in3_mfp",
> +	"sens0_ckout_mfp",
>  };
>  
>  static const char * const pwm2_groups[] = {
> -	"lcd0_d18",
> -	"rgmii_rxd3",
> -	"rgmii_rxd1",
> -	"ks_out0",
> -	"ks_out2",
> +	"lcd0_d18_mfp",
> +	"rgmii_rxd3_mfp",
> +	"rgmii_rxd1_mfp",
> +	"ks_out0_mfp",
> +	"ks_out2_mfp",
>  };
>  
>  static const char * const pwm3_groups[] = {
> -	"rgmii_rxd0",
> -	"ks_out1",
> -	"lcd0_d2",
> +	"rgmii_rxd0_mfp",
> +	"ks_out1_mfp",
> +	"lcd0_d2_mfp",
>  };
>  
>  static const char * const pwm4_groups[] = {
> -	"lcd0_d18",
> -	"rgmii_txd01",
> -	"rgmii_txd0",
> -	"ks_in0",
> -	"pcm1_in",
> -	"nand_ceb3",
> +	"lcd0_d18_mfp",
> +	"rgmii_txd01_mfp",
> +	"rgmii_txd0_mfp",
> +	"ks_in0_mfp",
> +	"pcm1_in_mfp",
> +	"nand_ceb3_mfp",
>  };
>  
>  static const char * const pwm5_groups[] = {
> -	"rgmii_txd1",
> -	"ks_in1",
> -	"pcm1_clk",
> -	"nand_ceb2",
> +	"rgmii_txd1_mfp",
> +	"ks_in1_mfp",
> +	"pcm1_clk_mfp",
> +	"nand_ceb2_mfp",
>  };
>  
>  static const char * const p0_groups[] = {
> -	"ks_in2",
> -	"ks_in0",
> +	"ks_in2_mfp",
> +	"ks_in0_mfp",
>  };
>  
>  static const char * const sd0_groups[] = {
> -	"ks_out0",
> -	"ks_out1",
> -	"ks_out2",
> -	"lcd0_d2",
> -	"dsi_dp3",
> -	"dsi_dp0",
> -	"sd0_d0",
> -	"sd0_d1",
> -	"sd0_d2_d3",
> -	"sd1_d0_d3",
> -	"sd0_cmd",
> -	"sd0_clk",
> +	"ks_out0_mfp",
> +	"ks_out1_mfp",
> +	"ks_out2_mfp",
> +	"lcd0_d2_mfp",
> +	"dsi_dp3_mfp",
> +	"dsi_dp0_mfp",
> +	"sd0_d0_mfp",
> +	"sd0_d1_mfp",
> +	"sd0_d2_d3_mfp",
> +	"sd1_d0_d3_mfp",
> +	"sd0_cmd_mfp",
> +	"sd0_clk_mfp",
>  };
>  
>  static const char * const sd1_groups[] = {
> -	"dsi_dp2",
> -	"mfp1_16_14",
> -	"lcd0_d2",
> -	"mfp1_16_14_d17",
> -	"dsi_dp3",
> -	"dsi_dn3",
> -	"dsi_dnp1_cp_d2",
> -	"dsi_dnp1_cp_d17",
> -	"dsi_dn2",
> -	"sd1_d0_d3",
> -	"sd1_cmd",
> +	"dsi_dp2_mfp",
> +	"mfp1_16_14_mfp",
> +	"lcd0_d2_mfp",
> +	"mfp1_16_14_d17_mfp",
> +	"dsi_dp3_mfp",
> +	"dsi_dn3_mfp",
> +	"dsi_dnp1_cp_d2_mfp",
> +	"dsi_dnp1_cp_d17_mfp",
> +	"dsi_dn2_mfp",
> +	"sd1_d0_d3_mfp",
> +	"sd1_cmd_mfp",
>  	"sd1_dummy",
>  };
>  
>  static const char * const sd2_groups[] = {
> -	"dnand_data_wr",
> +	"dnand_data_wr_mfp",
>  };
>  
>  static const char * const i2c0_groups[] = {
> -	"uart0_rx",
> -	"uart0_tx",
> -	"i2c0_mfp",
> +	"uart0_rx_mfp",
> +	"uart0_tx_mfp",
> +	"i2c0_mfp_mfp",
>  };
>  
>  static const char * const i2c1_groups[] = {
> @@ -1448,85 +1448,85 @@ static const char * const i2c2_groups[] = {
>  };
>  
>  static const char * const i2c3_groups[] = {
> -	"uart2_rx_tx",
> -	"pcm1_sync",
> -	"pcm1_out",
> +	"uart2_rx_tx_mfp",
> +	"pcm1_sync_mfp",
> +	"pcm1_out_mfp",
>  };
>  
>  static const char * const lvds_groups[] = {
> -	"lvds_o_pn",
> -	"lvds_ee_pn",
> -	"lvds_e_pn",
> +	"lvds_o_pn_mfp",
> +	"lvds_ee_pn_mfp",
> +	"lvds_e_pn_mfp",
>  };
>  
>  static const char * const bt_groups[] = {
> -	"i2s_pcm1",
> -	"i2s0_pcm0",
> -	"i2s1_pcm0",
> -	"ks_in2",
> -	"ks_in1",
> -	"ks_in0",
> -	"ks_in3",
> -	"ks_out0",
> -	"ks_out1",
> -	"ks_out2",
> -	"lvds_o_pn",
> -	"lvds_ee_pn",
> -	"pcm1_in",
> -	"pcm1_clk",
> -	"pcm1_sync",
> -	"pcm1_out",
> +	"i2s_pcm1_mfp",
> +	"i2s0_pcm0_mfp",
> +	"i2s1_pcm0_mfp",
> +	"ks_in2_mfp",
> +	"ks_in1_mfp",
> +	"ks_in0_mfp",
> +	"ks_in3_mfp",
> +	"ks_out0_mfp",
> +	"ks_out1_mfp",
> +	"ks_out2_mfp",
> +	"lvds_o_pn_mfp",
> +	"lvds_ee_pn_mfp",
> +	"pcm1_in_mfp",
> +	"pcm1_clk_mfp",
> +	"pcm1_sync_mfp",
> +	"pcm1_out_mfp",
>  };
>  
>  static const char * const lcd0_groups[] = {
> -	"lcd0_d18",
> -	"lcd0_d2",
> -	"mfp1_16_14_d17",
> -	"lvds_o_pn",
> -	"dsi_dp3",
> -	"dsi_dn3",
> -	"lvds_ee_pn",
> -	"dsi_dnp1_cp_d2",
> -	"dsi_dnp1_cp_d17",
> -	"lvds_e_pn",
> +	"lcd0_d18_mfp",
> +	"lcd0_d2_mfp",
> +	"mfp1_16_14_d17_mfp",
> +	"lvds_o_pn_mfp",
> +	"dsi_dp3_mfp",
> +	"dsi_dn3_mfp",
> +	"lvds_ee_pn_mfp",
> +	"dsi_dnp1_cp_d2_mfp",
> +	"dsi_dnp1_cp_d17_mfp",
> +	"lvds_e_pn_mfp",
>  };
>  
>  
>  static const char * const usb30_groups[] = {
> -	"ks_in1",
> +	"ks_in1_mfp",
>  };
>  
>  static const char * const clko_25m_groups[] = {
> -	"clko_25m",
> +	"clko_25m_mfp",
>  };
>  
>  static const char * const mipi_csi_groups[] = {
> -	"csi_cn_cp",
> -	"csi_dn_dp",
> +	"csi_cn_cp_mfp",
> +	"csi_dn_dp_mfp",
>  };
>  
>  static const char * const dsi_groups[] = {
> -	"dsi_dn0",
> -	"dsi_dp2",
> -	"dsi_dp3",
> -	"dsi_dn3",
> -	"dsi_dp0",
> -	"dsi_dnp1_cp_d2",
> -	"dsi_dnp1_cp_d17",
> -	"dsi_dn2",
> +	"dsi_dn0_mfp",
> +	"dsi_dp2_mfp",
> +	"dsi_dp3_mfp",
> +	"dsi_dn3_mfp",
> +	"dsi_dp0_mfp",
> +	"dsi_dnp1_cp_d2_mfp",
> +	"dsi_dnp1_cp_d17_mfp",
> +	"dsi_dn2_mfp",
>  	"dsi_dummy",
>  };
>  
>  static const char * const nand_groups[] = {
> -	"dnand_data_wr",
> -	"dnand_acle_ce0",
> -	"nand_ceb2",
> -	"nand_ceb3",
> +	"dnand_data_wr_mfp",
> +	"dnand_acle_ce0_mfp",
> +	"nand_ceb2_mfp",
> +	"nand_ceb3_mfp",
>  	"nand_dummy",
>  };
>  
>  static const char * const spdif_groups[] = {
> -	"uart0_tx",
> +	"uart0_tx_mfp",
>  };
>  
>  static const char * const sirq0_groups[] = {
> -- 
> 2.25.0
> 
