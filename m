Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54A75A9DA8
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 10:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731289AbfIEI7a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 04:59:30 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60014 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfIEI7a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 04:59:30 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3CDE525B753;
        Thu,  5 Sep 2019 18:59:28 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 28345940AC6; Thu,  5 Sep 2019 10:59:26 +0200 (CEST)
Date:   Thu, 5 Sep 2019 10:59:26 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/3] pinctrl: sh-pfc: r8a77990: Rename
 AVB_AVTP_{MATCH,CAPTURE} pin functions
Message-ID: <20190905085925.umc6khhp2nurdljo@verge.net.au>
References: <20190904121658.2617-1-geert+renesas@glider.be>
 <20190904121658.2617-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904121658.2617-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 04, 2019 at 02:16:56PM +0200, Geert Uytterhoeven wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> The Hardware Manual Errata for Rev. 1.50 of April 10, 2019 renamed IPSR2
> register bit[23:20] value H'3 and register bit[27:24] value H'3 from
> AVB_AVTP_MATCH_A resp. AVB_AVTP_CAPTURE_A to AVB_AVTP_MATCH resp.
> AVB_AVTP_CAPTURE_A.

I think the trailing '_A' above is a typo.

That notwithstanding:

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> Update the R-Car E3 pin control driver to reflect this.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [geert: Reword, reference errata]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Do we need a SH_PFC_PIN_GROUP_ALIAS() for backwards compatibility?
> There are no users of the "avb_avtp_match_a" and "avb_avtp_capture_a"
> pin groups in upstream DTS files, so I would say no.

Agreed.


> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 32 +++++++++++++--------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> index 2dfb8d9cfda126e4..2a6de2125bbf38b3 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> @@ -232,8 +232,8 @@
>  #define IP2_11_8	FM(AVB_MDC)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP2_15_12	FM(BS_N)		FM(PWM0_A)		FM(AVB_MAGIC)		FM(VI4_CLK)		F_(0, 0)		FM(TX3_C)	F_(0, 0)	FM(VI5_CLK_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP2_19_16	FM(RD_N)		FM(PWM1_A)		FM(AVB_LINK)		FM(VI4_FIELD)		F_(0, 0)		FM(RX3_C)	FM(FSCLKST2_N_A) FM(VI5_DATA0_B) F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP2_23_20	FM(RD_WR_N)		FM(SCL7_A)		FM(AVB_AVTP_MATCH_A)	FM(VI4_VSYNC_N)		FM(TX5_B)		FM(SCK3_C)	FM(PWM5_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> -#define IP2_27_24	FM(EX_WAIT0)		FM(SDA7_A)		FM(AVB_AVTP_CAPTURE_A)	FM(VI4_HSYNC_N)		FM(RX5_B)		FM(PWM6_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2_23_20	FM(RD_WR_N)		FM(SCL7_A)		FM(AVB_AVTP_MATCH)	FM(VI4_VSYNC_N)		FM(TX5_B)		FM(SCK3_C)	FM(PWM5_A)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> +#define IP2_27_24	FM(EX_WAIT0)		FM(SDA7_A)		FM(AVB_AVTP_CAPTURE)	FM(VI4_HSYNC_N)		FM(RX5_B)		FM(PWM6_A)	F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP2_31_28	FM(A0)			FM(IRQ0)		FM(PWM2_A)		FM(MSIOF3_SS1_B)	FM(VI5_CLK_A)		FM(DU_CDE)	FM(HRX3_D)	FM(IERX)	FM(QSTB_QHE)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP3_3_0		FM(A1)			FM(IRQ1)		FM(PWM3_A)		FM(DU_DOTCLKIN1)	FM(VI5_DATA0_A)		FM(DU_DISP_CDE) FM(SDA6_B)	FM(IETX)	FM(QCPV_QDE)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
>  #define IP3_7_4		FM(A2)			FM(IRQ2)		FM(AVB_AVTP_PPS)	FM(VI4_CLKENB)		FM(VI5_DATA1_A)		FM(DU_DISP)	FM(SCL6_B)	F_(0, 0)	FM(QSTVB_QVE)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
> @@ -634,7 +634,7 @@ static const u16 pinmux_data[] = {
>  
>  	PINMUX_IPSR_GPSR(IP2_23_20,		RD_WR_N),
>  	PINMUX_IPSR_MSEL(IP2_23_20,		SCL7_A,		SEL_I2C7_0),
> -	PINMUX_IPSR_GPSR(IP2_23_20,		AVB_AVTP_MATCH_A),
> +	PINMUX_IPSR_GPSR(IP2_23_20,		AVB_AVTP_MATCH),
>  	PINMUX_IPSR_GPSR(IP2_23_20,		VI4_VSYNC_N),
>  	PINMUX_IPSR_GPSR(IP2_23_20,		TX5_B),
>  	PINMUX_IPSR_MSEL(IP2_23_20,		SCK3_C,		SEL_SCIF3_2),
> @@ -642,7 +642,7 @@ static const u16 pinmux_data[] = {
>  
>  	PINMUX_IPSR_GPSR(IP2_27_24,		EX_WAIT0),
>  	PINMUX_IPSR_MSEL(IP2_27_24,		SDA7_A,		SEL_I2C7_0),
> -	PINMUX_IPSR_GPSR(IP2_27_24,		AVB_AVTP_CAPTURE_A),
> +	PINMUX_IPSR_GPSR(IP2_27_24,		AVB_AVTP_CAPTURE),
>  	PINMUX_IPSR_GPSR(IP2_27_24,		VI4_HSYNC_N),
>  	PINMUX_IPSR_MSEL(IP2_27_24,		RX5_B,		SEL_SCIF5_1),
>  	PINMUX_IPSR_MSEL(IP2_27_24,		PWM6_A,		SEL_PWM6_0),
> @@ -1524,22 +1524,22 @@ static const unsigned int avb_avtp_pps_mux[] = {
>  	AVB_AVTP_PPS_MARK,
>  };
>  
> -static const unsigned int avb_avtp_match_a_pins[] = {
> -	/* AVB_AVTP_MATCH_A */
> +static const unsigned int avb_avtp_match_pins[] = {
> +	/* AVB_AVTP_MATCH */
>  	RCAR_GP_PIN(2, 24),
>  };
>  
> -static const unsigned int avb_avtp_match_a_mux[] = {
> -	AVB_AVTP_MATCH_A_MARK,
> +static const unsigned int avb_avtp_match_mux[] = {
> +	AVB_AVTP_MATCH_MARK,
>  };
>  
> -static const unsigned int avb_avtp_capture_a_pins[] = {
> -	/* AVB_AVTP_CAPTURE_A */
> +static const unsigned int avb_avtp_capture_pins[] = {
> +	/* AVB_AVTP_CAPTURE */
>  	RCAR_GP_PIN(2, 25),
>  };
>  
> -static const unsigned int avb_avtp_capture_a_mux[] = {
> -	AVB_AVTP_CAPTURE_A_MARK,
> +static const unsigned int avb_avtp_capture_mux[] = {
> +	AVB_AVTP_CAPTURE_MARK,
>  };
>  
>  /* - CAN ------------------------------------------------------------------ */
> @@ -3784,8 +3784,8 @@ static const struct {
>  		SH_PFC_PIN_GROUP(avb_phy_int),
>  		SH_PFC_PIN_GROUP(avb_mii),
>  		SH_PFC_PIN_GROUP(avb_avtp_pps),
> -		SH_PFC_PIN_GROUP(avb_avtp_match_a),
> -		SH_PFC_PIN_GROUP(avb_avtp_capture_a),
> +		SH_PFC_PIN_GROUP(avb_avtp_match),
> +		SH_PFC_PIN_GROUP(avb_avtp_capture),
>  		SH_PFC_PIN_GROUP(can0_data),
>  		SH_PFC_PIN_GROUP(can1_data),
>  		SH_PFC_PIN_GROUP(can_clk),
> @@ -4061,8 +4061,8 @@ static const char * const avb_groups[] = {
>  	"avb_phy_int",
>  	"avb_mii",
>  	"avb_avtp_pps",
> -	"avb_avtp_match_a",
> -	"avb_avtp_capture_a",
> +	"avb_avtp_match",
> +	"avb_avtp_capture",
>  };
>  
>  static const char * const can0_groups[] = {
> -- 
> 2.17.1
> 
