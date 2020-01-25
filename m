Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB7B14970B
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Jan 2020 18:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgAYRyn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Jan 2020 12:54:43 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:37034 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgAYRyn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 25 Jan 2020 12:54:43 -0500
Received: by mail-pj1-f65.google.com with SMTP id m13so1308912pjb.2
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jan 2020 09:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gJHXSgNycR/Fg40U6K5VeL7hjEVgw/Iqr4a9M1XCgts=;
        b=igTKS9G15dreGgPGK8Z3FGOvG3/2AB8lygJW/1H0ieZx/CpCvJE9dRfuLc3tPTBYMs
         62DA8QGpqiQtRCQtNPZPNpVvzy7PbRtB1n+8lZ9Uj/7hD7piW3uyEP5aL5rM/eAXtPWl
         M6Cuuis4+EfsFNvYFzbK5e4az0pNkgOwXFE1Nk3kELS85KxHGtVo3goCIkRnOxyh/jh1
         pE21udLBFIacaIuJizLTO10tUU+/Wd43ygPAlbVf9w5FVnCvhNwe6uw3PJzHw2y7B4DO
         ajCapjx42J8F6M761zJbvg0PQf7o3CHXL7b+v5a6Jwl0hMJFqRpR1WQtMInbBEBPpk/R
         Bw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gJHXSgNycR/Fg40U6K5VeL7hjEVgw/Iqr4a9M1XCgts=;
        b=l5TWqjWdI8emGJFHLyj1Tz9QqFwIPdFvvHTzGMYoO7tp7x0gxAw5y3jX1JxJH5VdyJ
         0UkSA1CaW1ir3nyE4qw8IvPWuzT8ah7obnvFqeUoJQUv3/YTwJ5IwDvWYiEsNpg4Q45y
         ACKrh9ldKmqxSbV4wbTUitKvTQd2Av+Cq4xuDoVkVW5xbS+sFldjl1l1bnoWzoB/e1d5
         oreCmufDtt4wt8Y55h8og62slFHHwFF0ANRJ2XbvhwUmUehb8zHolNLmbcEv/FtGqfaB
         vhd6BGbnkp8yzxZtmmvHPbLYPrQ7c0WY+4ApeV5UCJT5OoQ//h9NyEzezkPoQEIcUD7+
         WmRQ==
X-Gm-Message-State: APjAAAUj4UWfn/UMWi2/6POiNw+KsMmMGzEZMZKIMA6rFBJjjtSYWnHC
        P56rEgPXxzJSd6kszH8Op31F
X-Google-Smtp-Source: APXvYqzT97W1AoH0Q42HwpyKg4j103QNEw1qngzV3BwFzzQ/M9se8N1bnKJCvl28aWOVsb5StDHntg==
X-Received: by 2002:a17:90a:a60f:: with SMTP id c15mr5901015pjq.61.1579974881886;
        Sat, 25 Jan 2020 09:54:41 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:417:e1dc:29c0:39fe:e9de:89ce])
        by smtp.gmail.com with ESMTPSA id d22sm10131135pfo.187.2020.01.25.09.54.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Jan 2020 09:54:41 -0800 (PST)
Date:   Sat, 25 Jan 2020 23:24:33 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Matheus Castello <matheus@castello.eng.br>
Cc:     afaerber@suse.de, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, pn@denx.de
Subject: Re: [PATCH] pinctrl actions: Fix functions groups names
Message-ID: <20200125175433.GA3500@Mani-XPS-13-9360>
References: <20200124031819.608217-1-matheus@castello.eng.br>
 <900334CE-3A85-443D-99EC-4DD169BBCB65@linaro.org>
 <838d8378-1a6a-11c4-fad8-aeb4b861478b@castello.eng.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <838d8378-1a6a-11c4-fad8-aeb4b861478b@castello.eng.br>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 24, 2020 at 10:20:04AM -0300, Matheus Castello wrote:
> 
> Em 1/24/20 9:46 AM, Manivannan Sadhasivam escreveu:
> > Hey,
> > 
> > +Parthi, who is the author of s700 driver.
> > 
> > On 24 January 2020 8:48:19 AM IST, Matheus Castello <matheus@castello.eng.br> wrote:
> > > Group names by function do not match their respective structures and
> > > documentation defined names.
> > > 
> > > This fixes following errors observed on s500-based Labrador board when
> > > groups names defined on documentation are used:
> > > [    4.262778] pinctrl-s700 b01b0040.pinctrl: invalid group
> > > "sd0_d1_mfp" for function "sd0"
> > > [    4.271394] pinctrl-s700 b01b0040.pinctrl: invalid group
> > > "sd0_d2_d3_mfp" for function "sd0"
> > > [    4.280248] pinctrl-s700 b01b0040.pinctrl: invalid group
> > > "sd1_d0_d3_mfp" for function "sd0"
> > > [    4.289122] pinctrl-s700 b01b0040.pinctrl: invalid group
> > > "sd0_cmd_mfp" for function "sd0"
> > > 
> > 
> > Doh, I'm not sure how I missed this obvious mistake during review. Sorry for that.
> > 
> > The change looks good but the commit message needs to be reworked a bit. It doesn't make sense to use s700 driver on s500 based board. Even though you could've modified it for s500, it should not be mentioned. So just mention the issue. Also you're missing colon after pinctrl in subject.
> > 
> 
> Ok, I will send a v2.
> 
> > Btw, are you planning to contribute s500 driver?
> > 
> 
> Yes I intend to, my research, from a macro view, the pin blocks, groups,
> registers and functions are quite similar from the s700 to the s500. If so,
> maybe put a compatible to s500, but still not sure, I have to check it out
> calmly.
> 

Andreas just reminded me that he did the S500 driver a while ago based on his
own pinctrl framework. And it has the pinctrl definitions sorted out already.
You can take a look at it here:
https://github.com/afaerber/linux/commit/34dfc9b29468c2addd95a0d9f229b02e43beb826

If it seems useful to you, please take that and rework based on the existing
framework and credit Andreas. I was supposed to be doing that but my S500
board got broken, also I don't have time for that now.

Thanks,
Mani

> > Thanks,
> > Mani
> > 
> > > Fixes: 81c9d563cc74 (pinctrl: actions: Add Actions Semi S700 pinctrl
> > > driver)
> > > Signed-off-by: Matheus Castello <matheus@castello.eng.br>
> > > ---
> > > drivers/pinctrl/actions/pinctrl-s700.c | 510 ++++++++++++-------------
> > > 1 file changed, 255 insertions(+), 255 deletions(-)
> > > 
> > > diff --git a/drivers/pinctrl/actions/pinctrl-s700.c
> > > b/drivers/pinctrl/actions/pinctrl-s700.c
> > > index 8b8121e35edb..1182b38ff4dc 100644
> > > --- a/drivers/pinctrl/actions/pinctrl-s700.c
> > > +++ b/drivers/pinctrl/actions/pinctrl-s700.c
> > > @@ -1125,317 +1125,317 @@ static const struct owl_pingroup
> > > s700_groups[] = {
> > > };
> > > 
> > > static const char * const nor_groups[] = {
> > > -	"lcd0_d18",
> > > -	"i2s_d0",
> > > -	"i2s0_pcm0",
> > > -	"i2s1_pcm0",
> > > -	"i2s_d1",
> > > -	"ks_in2",
> > > -	"ks_in1",
> > > -	"ks_in0",
> > > -	"ks_in3",
> > > -	"ks_out0",
> > > -	"ks_out1",
> > > -	"ks_out2",
> > > -	"lcd0_d2",
> > > -	"lvds_ee_pn",
> > > -	"uart2_rx_tx",
> > > -	"spi0_i2c_pcm",
> > > -	"lvds_e_pn",
> > > -	"sd0_d0",
> > > -	"sd0_d1",
> > > -	"sd0_d2_d3",
> > > -	"sd1_d0_d3",
> > > -	"sd0_cmd",
> > > -	"sd1_cmd",
> > > -	"sens0_ckout",
> > > -	"sen0_pclk",
> > > +	"lcd0_d18_mfp",
> > > +	"i2s_d0_mfp",
> > > +	"i2s0_pcm0_mfp",
> > > +	"i2s1_pcm0_mfp",
> > > +	"i2s_d1_mfp",
> > > +	"ks_in2_mfp",
> > > +	"ks_in1_mfp",
> > > +	"ks_in0_mfp",
> > > +	"ks_in3_mfp",
> > > +	"ks_out0_mfp",
> > > +	"ks_out1_mfp",
> > > +	"ks_out2_mfp",
> > > +	"lcd0_d2_mfp",
> > > +	"lvds_ee_pn_mfp",
> > > +	"uart2_rx_tx_mfp",
> > > +	"spi0_i2c_pcm_mfp",
> > > +	"lvds_e_pn_mfp",
> > > +	"sd0_d0_mfp",
> > > +	"sd0_d1_mfp",
> > > +	"sd0_d2_d3_mfp",
> > > +	"sd1_d0_d3_mfp",
> > > +	"sd0_cmd_mfp",
> > > +	"sd1_cmd_mfp",
> > > +	"sens0_ckout_mfp",
> > > +	"sen0_pclk_mfp",
> > > };
> > > 
> > > static const char * const eth_rmii_groups[] = {
> > > -	"rgmii_txd23",
> > > -	"rgmii_rxd2",
> > > -	"rgmii_rxd3",
> > > -	"rgmii_txd01",
> > > -	"rgmii_txd0",
> > > -	"rgmii_txd1",
> > > -	"rgmii_txen",
> > > -	"rgmii_rxen",
> > > -	"rgmii_rxd1",
> > > -	"rgmii_rxd0",
> > > -	"rgmii_ref_clk",
> > > +	"rgmii_txd23_mfp",
> > > +	"rgmii_rxd2_mfp",
> > > +	"rgmii_rxd3_mfp",
> > > +	"rgmii_txd01_mfp",
> > > +	"rgmii_txd0_mfp",
> > > +	"rgmii_txd1_mfp",
> > > +	"rgmii_txen_mfp",
> > > +	"rgmii_rxen_mfp",
> > > +	"rgmii_rxd1_mfp",
> > > +	"rgmii_rxd0_mfp",
> > > +	"rgmii_ref_clk_mfp",
> > > 	"eth_smi_dummy",
> > > };
> > > 
> > > static const char * const eth_smii_groups[] = {
> > > -	"rgmii_txd0",
> > > -	"rgmii_txd1",
> > > -	"rgmii_rxd0",
> > > -	"rgmii_rxd1",
> > > -	"rgmii_ref_clk",
> > > +	"rgmii_txd0_mfp",
> > > +	"rgmii_txd1_mfp",
> > > +	"rgmii_rxd0_mfp",
> > > +	"rgmii_rxd1_mfp",
> > > +	"rgmii_ref_clk_mfp",
> > > 	"eth_smi_dummy",
> > > };
> > > 
> > > static const char * const spi0_groups[] = {
> > > -	"dsi_dn0",
> > > -	"dsi_dp2",
> > > -	"dsi_dp0",
> > > -	"uart2_rx_tx",
> > > -	"spi0_i2c_pcm",
> > > -	"dsi_dn2",
> > > +	"dsi_dn0_mfp",
> > > +	"dsi_dp2_mfp",
> > > +	"dsi_dp0_mfp",
> > > +	"uart2_rx_tx_mfp",
> > > +	"spi0_i2c_pcm_mfp",
> > > +	"dsi_dn2_mfp",
> > > };
> > > 
> > > static const char * const spi1_groups[] = {
> > > -	"uart0_rx",
> > > -	"uart0_tx",
> > > +	"uart0_rx_mfp",
> > > +	"uart0_tx_mfp",
> > > 	"i2c0_mfp",
> > > };
> > > 
> > > static const char * const spi2_groups[] = {
> > > -	"rgmii_txd01",
> > > -	"rgmii_txd0",
> > > -	"rgmii_txd1",
> > > -	"rgmii_ref_clk",
> > > -	"dnand_acle_ce0",
> > > +	"rgmii_txd01_mfp",
> > > +	"rgmii_txd0_mfp",
> > > +	"rgmii_txd1_mfp",
> > > +	"rgmii_ref_clk_mfp",
> > > +	"dnand_acle_ce0_mfp",
> > > };
> > > 
> > > static const char * const spi3_groups[] = {
> > > -	"rgmii_txen",
> > > -	"rgmii_rxen",
> > > -	"rgmii_rxd1",
> > > -	"rgmii_rxd0",
> > > +	"rgmii_txen_mfp",
> > > +	"rgmii_rxen_mfp",
> > > +	"rgmii_rxd1_mfp",
> > > +	"rgmii_rxd0_mfp",
> > > };
> > > 
> > > static const char * const sens0_groups[] = {
> > > -	"csi_cn_cp",
> > > -	"sens0_ckout",
> > > -	"csi_dn_dp",
> > > -	"sen0_pclk",
> > > +	"csi_cn_cp_mfp",
> > > +	"sens0_ckout_mfp",
> > > +	"csi_dn_dp_mfp",
> > > +	"sen0_pclk_mfp",
> > > };
> > > 
> > > static const char * const sens1_groups[] = {
> > > -	"lcd0_d18",
> > > -	"ks_in2",
> > > -	"ks_in1",
> > > -	"ks_in0",
> > > -	"ks_in3",
> > > -	"ks_out0",
> > > -	"ks_out1",
> > > -	"ks_out2",
> > > -	"sens0_ckout",
> > > -	"pcm1_in",
> > > -	"pcm1_clk",
> > > -	"pcm1_sync",
> > > -	"pcm1_out",
> > > +	"lcd0_d18_mfp",
> > > +	"ks_in2_mfp",
> > > +	"ks_in1_mfp",
> > > +	"ks_in0_mfp",
> > > +	"ks_in3_mfp",
> > > +	"ks_out0_mfp",
> > > +	"ks_out1_mfp",
> > > +	"ks_out2_mfp",
> > > +	"sens0_ckout_mfp",
> > > +	"pcm1_in_mfp",
> > > +	"pcm1_clk_mfp",
> > > +	"pcm1_sync_mfp",
> > > +	"pcm1_out_mfp",
> > > };
> > > 
> > > static const char * const uart0_groups[] = {
> > > -	"uart2_rtsb",
> > > -	"uart2_ctsb",
> > > -	"uart0_rx",
> > > -	"uart0_tx",
> > > +	"uart2_rtsb_mfp",
> > > +	"uart2_ctsb_mfp",
> > > +	"uart0_rx_mfp",
> > > +	"uart0_tx_mfp",
> > > };
> > > 
> > > static const char * const uart1_groups[] = {
> > > -	"sd0_d2_d3",
> > > +	"sd0_d2_d3_mfp",
> > > 	"i2c0_mfp",
> > > };
> > > 
> > > static const char * const uart2_groups[] = {
> > > -	"rgmii_txen",
> > > -	"rgmii_rxen",
> > > -	"rgmii_rxd1",
> > > -	"rgmii_rxd0",
> > > -	"dsi_dn0",
> > > -	"dsi_dp2",
> > > -	"dsi_dp0",
> > > -	"uart2_rx_tx",
> > > -	"dsi_dn2",
> > > -	"uart2_rtsb",
> > > -	"uart2_ctsb",
> > > -	"sd0_d0",
> > > -	"sd0_d1",
> > > -	"sd0_d2_d3",
> > > -	"uart0_rx",
> > > -	"uart0_tx",
> > > +	"rgmii_txen_mfp",
> > > +	"rgmii_rxen_mfp",
> > > +	"rgmii_rxd1_mfp",
> > > +	"rgmii_rxd0_mfp",
> > > +	"dsi_dn0_mfp",
> > > +	"dsi_dp2_mfp",
> > > +	"dsi_dp0_mfp",
> > > +	"uart2_rx_tx_mfp",
> > > +	"dsi_dn2_mfp",
> > > +	"uart2_rtsb_mfp",
> > > +	"uart2_ctsb_mfp",
> > > +	"sd0_d0_mfp",
> > > +	"sd0_d1_mfp",
> > > +	"sd0_d2_d3_mfp",
> > > +	"uart0_rx_mfp",
> > > +	"uart0_tx_mfp",
> > > 	"i2c0_mfp",
> > > 	"uart2_dummy"
> > > };
> > > 
> > > static const char * const uart3_groups[] = {
> > > -	"rgmii_txd23",
> > > -	"rgmii_rxd2",
> > > -	"rgmii_rxd3",
> > > -	"uart3_rtsb",
> > > -	"uart3_ctsb",
> > > +	"rgmii_txd23_mfp",
> > > +	"rgmii_rxd2_mfp",
> > > +	"rgmii_rxd3_mfp",
> > > +	"uart3_rtsb_mfp",
> > > +	"uart3_ctsb_mfp",
> > > 	"uart3_dummy"
> > > };
> > > 
> > > static const char * const uart4_groups[] = {
> > > -	"rgmii_txd01",
> > > -	"rgmii_ref_clk",
> > > -	"ks_out0",
> > > -	"ks_out1",
> > > +	"rgmii_txd01_mfp",
> > > +	"rgmii_ref_clk_mfp",
> > > +	"ks_out0_mfp",
> > > +	"ks_out1_mfp",
> > > };
> > > 
> > > static const char * const uart5_groups[] = {
> > > -	"rgmii_rxd1",
> > > -	"rgmii_rxd0",
> > > -	"ks_out0",
> > > -	"ks_out2",
> > > -	"uart3_rtsb",
> > > -	"uart3_ctsb",
> > > -	"sd0_d0",
> > > -	"sd0_d1",
> > > +	"rgmii_rxd1_mfp",
> > > +	"rgmii_rxd0_mfp",
> > > +	"ks_out0_mfp",
> > > +	"ks_out2_mfp",
> > > +	"uart3_rtsb_mfp",
> > > +	"uart3_ctsb_mfp",
> > > +	"sd0_d0_mfp",
> > > +	"sd0_d1_mfp",
> > > };
> > > 
> > > static const char * const uart6_groups[] = {
> > > -	"rgmii_txd0",
> > > -	"rgmii_txd1",
> > > +	"rgmii_txd0_mfp",
> > > +	"rgmii_txd1_mfp",
> > > };
> > > 
> > > static const char * const i2s0_groups[] = {
> > > -	"i2s_d0",
> > > -	"i2s_pcm1",
> > > -	"i2s0_pcm0",
> > > +	"i2s_d0_mfp",
> > > +	"i2s_pcm1_mfp",
> > > +	"i2s0_pcm0_mfp",
> > > };
> > > 
> > > static const char * const i2s1_groups[] = {
> > > -	"i2s1_pcm0",
> > > -	"i2s_d1",
> > > +	"i2s1_pcm0_mfp",
> > > +	"i2s_d1_mfp",
> > > 	"i2s1_dummy",
> > > -	"spi0_i2c_pcm",
> > > -	"uart0_rx",
> > > -	"uart0_tx",
> > > +	"spi0_i2c_pcm_mfp",
> > > +	"uart0_rx_mfp",
> > > +	"uart0_tx_mfp",
> > > };
> > > 
> > > static const char * const pcm1_groups[] = {
> > > -	"i2s_pcm1",
> > > -	"spi0_i2c_pcm",
> > > -	"uart0_rx",
> > > -	"uart0_tx",
> > > -	"pcm1_in",
> > > -	"pcm1_clk",
> > > -	"pcm1_sync",
> > > -	"pcm1_out",
> > > +	"i2s_pcm1_mfp",
> > > +	"spi0_i2c_pcm_mfp",
> > > +	"uart0_rx_mfp",
> > > +	"uart0_tx_mfp",
> > > +	"pcm1_in_mfp",
> > > +	"pcm1_clk_mfp",
> > > +	"pcm1_sync_mfp",
> > > +	"pcm1_out_mfp",
> > > };
> > > 
> > > static const char * const pcm0_groups[] = {
> > > -	"i2s0_pcm0",
> > > -	"i2s1_pcm0",
> > > -	"uart2_rx_tx",
> > > -	"spi0_i2c_pcm",
> > > +	"i2s0_pcm0_mfp",
> > > +	"i2s1_pcm0_mfp",
> > > +	"uart2_rx_tx_mfp",
> > > +	"spi0_i2c_pcm_mfp",
> > > };
> > > 
> > > static const char * const ks_groups[] = {
> > > -	"ks_in2",
> > > -	"ks_in1",
> > > -	"ks_in0",
> > > -	"ks_in3",
> > > -	"ks_out0",
> > > -	"ks_out1",
> > > -	"ks_out2",
> > > +	"ks_in2_mfp",
> > > +	"ks_in1_mfp",
> > > +	"ks_in0_mfp",
> > > +	"ks_in3_mfp",
> > > +	"ks_out0_mfp",
> > > +	"ks_out1_mfp",
> > > +	"ks_out2_mfp",
> > > };
> > > 
> > > static const char * const jtag_groups[] = {
> > > -	"ks_in2",
> > > -	"ks_in1",
> > > -	"ks_in0",
> > > -	"ks_in3",
> > > -	"ks_out1",
> > > -	"sd0_d0",
> > > -	"sd0_d2_d3",
> > > -	"sd0_cmd",
> > > -	"sd0_clk",
> > > +	"ks_in2_mfp",
> > > +	"ks_in1_mfp",
> > > +	"ks_in0_mfp",
> > > +	"ks_in3_mfp",
> > > +	"ks_out1_mfp",
> > > +	"sd0_d0_mfp",
> > > +	"sd0_d2_d3_mfp",
> > > +	"sd0_cmd_mfp",
> > > +	"sd0_clk_mfp",
> > > };
> > > 
> > > static const char * const pwm0_groups[] = {
> > > -	"rgmii_rxd2",
> > > -	"rgmii_txen",
> > > -	"ks_in2",
> > > -	"sen0_pclk",
> > > +	"rgmii_rxd2_mfp",
> > > +	"rgmii_txen_mfp",
> > > +	"ks_in2_mfp",
> > > +	"sen0_pclk_mfp",
> > > };
> > > 
> > > static const char * const pwm1_groups[] = {
> > > -	"rgmii_rxen",
> > > -	"ks_in1",
> > > -	"ks_in3",
> > > -	"sens0_ckout",
> > > +	"rgmii_rxen_mfp",
> > > +	"ks_in1_mfp",
> > > +	"ks_in3_mfp",
> > > +	"sens0_ckout_mfp",
> > > };
> > > 
> > > static const char * const pwm2_groups[] = {
> > > -	"lcd0_d18",
> > > -	"rgmii_rxd3",
> > > -	"rgmii_rxd1",
> > > -	"ks_out0",
> > > -	"ks_out2",
> > > +	"lcd0_d18_mfp",
> > > +	"rgmii_rxd3_mfp",
> > > +	"rgmii_rxd1_mfp",
> > > +	"ks_out0_mfp",
> > > +	"ks_out2_mfp",
> > > };
> > > 
> > > static const char * const pwm3_groups[] = {
> > > -	"rgmii_rxd0",
> > > -	"ks_out1",
> > > -	"lcd0_d2",
> > > +	"rgmii_rxd0_mfp",
> > > +	"ks_out1_mfp",
> > > +	"lcd0_d2_mfp",
> > > };
> > > 
> > > static const char * const pwm4_groups[] = {
> > > -	"lcd0_d18",
> > > -	"rgmii_txd01",
> > > -	"rgmii_txd0",
> > > -	"ks_in0",
> > > -	"pcm1_in",
> > > -	"nand_ceb3",
> > > +	"lcd0_d18_mfp",
> > > +	"rgmii_txd01_mfp",
> > > +	"rgmii_txd0_mfp",
> > > +	"ks_in0_mfp",
> > > +	"pcm1_in_mfp",
> > > +	"nand_ceb3_mfp",
> > > };
> > > 
> > > static const char * const pwm5_groups[] = {
> > > -	"rgmii_txd1",
> > > -	"ks_in1",
> > > -	"pcm1_clk",
> > > -	"nand_ceb2",
> > > +	"rgmii_txd1_mfp",
> > > +	"ks_in1_mfp",
> > > +	"pcm1_clk_mfp",
> > > +	"nand_ceb2_mfp",
> > > };
> > > 
> > > static const char * const p0_groups[] = {
> > > -	"ks_in2",
> > > -	"ks_in0",
> > > +	"ks_in2_mfp",
> > > +	"ks_in0_mfp",
> > > };
> > > 
> > > static const char * const sd0_groups[] = {
> > > -	"ks_out0",
> > > -	"ks_out1",
> > > -	"ks_out2",
> > > -	"lcd0_d2",
> > > -	"dsi_dp3",
> > > -	"dsi_dp0",
> > > -	"sd0_d0",
> > > -	"sd0_d1",
> > > -	"sd0_d2_d3",
> > > -	"sd1_d0_d3",
> > > -	"sd0_cmd",
> > > -	"sd0_clk",
> > > +	"ks_out0_mfp",
> > > +	"ks_out1_mfp",
> > > +	"ks_out2_mfp",
> > > +	"lcd0_d2_mfp",
> > > +	"dsi_dp3_mfp",
> > > +	"dsi_dp0_mfp",
> > > +	"sd0_d0_mfp",
> > > +	"sd0_d1_mfp",
> > > +	"sd0_d2_d3_mfp",
> > > +	"sd1_d0_d3_mfp",
> > > +	"sd0_cmd_mfp",
> > > +	"sd0_clk_mfp",
> > > };
> > > 
> > > static const char * const sd1_groups[] = {
> > > -	"dsi_dp2",
> > > -	"mfp1_16_14",
> > > -	"lcd0_d2",
> > > -	"mfp1_16_14_d17",
> > > -	"dsi_dp3",
> > > -	"dsi_dn3",
> > > -	"dsi_dnp1_cp_d2",
> > > -	"dsi_dnp1_cp_d17",
> > > -	"dsi_dn2",
> > > -	"sd1_d0_d3",
> > > -	"sd1_cmd",
> > > +	"dsi_dp2_mfp",
> > > +	"mfp1_16_14_mfp",
> > > +	"lcd0_d2_mfp",
> > > +	"mfp1_16_14_d17_mfp",
> > > +	"dsi_dp3_mfp",
> > > +	"dsi_dn3_mfp",
> > > +	"dsi_dnp1_cp_d2_mfp",
> > > +	"dsi_dnp1_cp_d17_mfp",
> > > +	"dsi_dn2_mfp",
> > > +	"sd1_d0_d3_mfp",
> > > +	"sd1_cmd_mfp",
> > > 	"sd1_dummy",
> > > };
> > > 
> > > static const char * const sd2_groups[] = {
> > > -	"dnand_data_wr",
> > > +	"dnand_data_wr_mfp",
> > > };
> > > 
> > > static const char * const i2c0_groups[] = {
> > > -	"uart0_rx",
> > > -	"uart0_tx",
> > > -	"i2c0_mfp",
> > > +	"uart0_rx_mfp",
> > > +	"uart0_tx_mfp",
> > > +	"i2c0_mfp_mfp",
> > > };
> > > 
> > > static const char * const i2c1_groups[] = {
> > > @@ -1448,85 +1448,85 @@ static const char * const i2c2_groups[] = {
> > > };
> > > 
> > > static const char * const i2c3_groups[] = {
> > > -	"uart2_rx_tx",
> > > -	"pcm1_sync",
> > > -	"pcm1_out",
> > > +	"uart2_rx_tx_mfp",
> > > +	"pcm1_sync_mfp",
> > > +	"pcm1_out_mfp",
> > > };
> > > 
> > > static const char * const lvds_groups[] = {
> > > -	"lvds_o_pn",
> > > -	"lvds_ee_pn",
> > > -	"lvds_e_pn",
> > > +	"lvds_o_pn_mfp",
> > > +	"lvds_ee_pn_mfp",
> > > +	"lvds_e_pn_mfp",
> > > };
> > > 
> > > static const char * const bt_groups[] = {
> > > -	"i2s_pcm1",
> > > -	"i2s0_pcm0",
> > > -	"i2s1_pcm0",
> > > -	"ks_in2",
> > > -	"ks_in1",
> > > -	"ks_in0",
> > > -	"ks_in3",
> > > -	"ks_out0",
> > > -	"ks_out1",
> > > -	"ks_out2",
> > > -	"lvds_o_pn",
> > > -	"lvds_ee_pn",
> > > -	"pcm1_in",
> > > -	"pcm1_clk",
> > > -	"pcm1_sync",
> > > -	"pcm1_out",
> > > +	"i2s_pcm1_mfp",
> > > +	"i2s0_pcm0_mfp",
> > > +	"i2s1_pcm0_mfp",
> > > +	"ks_in2_mfp",
> > > +	"ks_in1_mfp",
> > > +	"ks_in0_mfp",
> > > +	"ks_in3_mfp",
> > > +	"ks_out0_mfp",
> > > +	"ks_out1_mfp",
> > > +	"ks_out2_mfp",
> > > +	"lvds_o_pn_mfp",
> > > +	"lvds_ee_pn_mfp",
> > > +	"pcm1_in_mfp",
> > > +	"pcm1_clk_mfp",
> > > +	"pcm1_sync_mfp",
> > > +	"pcm1_out_mfp",
> > > };
> > > 
> > > static const char * const lcd0_groups[] = {
> > > -	"lcd0_d18",
> > > -	"lcd0_d2",
> > > -	"mfp1_16_14_d17",
> > > -	"lvds_o_pn",
> > > -	"dsi_dp3",
> > > -	"dsi_dn3",
> > > -	"lvds_ee_pn",
> > > -	"dsi_dnp1_cp_d2",
> > > -	"dsi_dnp1_cp_d17",
> > > -	"lvds_e_pn",
> > > +	"lcd0_d18_mfp",
> > > +	"lcd0_d2_mfp",
> > > +	"mfp1_16_14_d17_mfp",
> > > +	"lvds_o_pn_mfp",
> > > +	"dsi_dp3_mfp",
> > > +	"dsi_dn3_mfp",
> > > +	"lvds_ee_pn_mfp",
> > > +	"dsi_dnp1_cp_d2_mfp",
> > > +	"dsi_dnp1_cp_d17_mfp",
> > > +	"lvds_e_pn_mfp",
> > > };
> > > 
> > > 
> > > static const char * const usb30_groups[] = {
> > > -	"ks_in1",
> > > +	"ks_in1_mfp",
> > > };
> > > 
> > > static const char * const clko_25m_groups[] = {
> > > -	"clko_25m",
> > > +	"clko_25m_mfp",
> > > };
> > > 
> > > static const char * const mipi_csi_groups[] = {
> > > -	"csi_cn_cp",
> > > -	"csi_dn_dp",
> > > +	"csi_cn_cp_mfp",
> > > +	"csi_dn_dp_mfp",
> > > };
> > > 
> > > static const char * const dsi_groups[] = {
> > > -	"dsi_dn0",
> > > -	"dsi_dp2",
> > > -	"dsi_dp3",
> > > -	"dsi_dn3",
> > > -	"dsi_dp0",
> > > -	"dsi_dnp1_cp_d2",
> > > -	"dsi_dnp1_cp_d17",
> > > -	"dsi_dn2",
> > > +	"dsi_dn0_mfp",
> > > +	"dsi_dp2_mfp",
> > > +	"dsi_dp3_mfp",
> > > +	"dsi_dn3_mfp",
> > > +	"dsi_dp0_mfp",
> > > +	"dsi_dnp1_cp_d2_mfp",
> > > +	"dsi_dnp1_cp_d17_mfp",
> > > +	"dsi_dn2_mfp",
> > > 	"dsi_dummy",
> > > };
> > > 
> > > static const char * const nand_groups[] = {
> > > -	"dnand_data_wr",
> > > -	"dnand_acle_ce0",
> > > -	"nand_ceb2",
> > > -	"nand_ceb3",
> > > +	"dnand_data_wr_mfp",
> > > +	"dnand_acle_ce0_mfp",
> > > +	"nand_ceb2_mfp",
> > > +	"nand_ceb3_mfp",
> > > 	"nand_dummy",
> > > };
> > > 
> > > static const char * const spdif_groups[] = {
> > > -	"uart0_tx",
> > > +	"uart0_tx_mfp",
> > > };
> > > 
> > > static const char * const sirq0_groups[] = {
> > 
