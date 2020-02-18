Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF3B41623F2
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 10:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgBRJwu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 04:52:50 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58459 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbgBRJwu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 04:52:50 -0500
X-Originating-IP: 90.65.102.129
Received: from localhost (lfbn-lyo-1-1670-129.w90-65.abo.wanadoo.fr [90.65.102.129])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0D59FE0002;
        Tue, 18 Feb 2020 09:52:46 +0000 (UTC)
Date:   Tue, 18 Feb 2020 10:52:46 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:PIN CONTROLLER - FREESCALE" <linux-gpio@vger.kernel.org>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH] firmware: imx: Align imx SC msg structs to 4
Message-ID: <20200218095246.GA3385@piout.net>
References: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a8b6772a1edffdd7cdb54d6d50030b03ba0bebb.1581455751.git.leonard.crestez@nxp.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 11/02/2020 23:24:33+0200, Leonard Crestez wrote:
> The imx SC api strongly assumes that messages are composed out of
> 4-bytes words but some of our message structs have sizeof "6" and "7".
> 
> This produces many oopses with CONFIG_KASAN=y:
> 
> 	BUG: KASAN: stack-out-of-bounds in imx_mu_send_data+0x108/0x1f0
> 
> It shouldn't cause an issues in normal use because these structs are
> always allocated on the stack.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
> Reported-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/clk/imx/clk-scu.c               | 8 ++++----
>  drivers/firmware/imx/misc.c             | 8 ++++----
>  drivers/firmware/imx/scu-pd.c           | 2 +-
>  drivers/pinctrl/freescale/pinctrl-scu.c | 4 ++--
>  drivers/rtc/rtc-imx-sc.c                | 2 +-
>  drivers/soc/imx/soc-imx-scu.c           | 2 +-
>  6 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index fbef740704d0..b8b2072742a5 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -41,16 +41,16 @@ struct clk_scu {
>  struct imx_sc_msg_req_set_clock_rate {
>  	struct imx_sc_rpc_msg hdr;
>  	__le32 rate;
>  	__le16 resource;
>  	u8 clk;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct req_get_clock_rate {
>  	__le16 resource;
>  	u8 clk;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct resp_get_clock_rate {
>  	__le32 rate;
>  };
>  
> @@ -82,11 +82,11 @@ struct imx_sc_msg_get_clock_parent {
>  	struct imx_sc_rpc_msg hdr;
>  	union {
>  		struct req_get_clock_parent {
>  			__le16 resource;
>  			u8 clk;
> -		} __packed req;
> +		} __packed __aligned(4) req;
>  		struct resp_get_clock_parent {
>  			u8 parent;
>  		} resp;
>  	} data;
>  };
> @@ -119,11 +119,11 @@ struct imx_sc_msg_req_clock_enable {
>  	struct imx_sc_rpc_msg hdr;
>  	__le16 resource;
>  	u8 clk;
>  	u8 enable;
>  	u8 autog;
> -} __packed;
> +} __packed __aligned(4);
>  
>  static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
>  {
>  	return container_of(hw, struct clk_scu, hw);
>  }
> diff --git a/drivers/firmware/imx/misc.c b/drivers/firmware/imx/misc.c
> index 4b56a587dacd..d073cb3ce699 100644
> --- a/drivers/firmware/imx/misc.c
> +++ b/drivers/firmware/imx/misc.c
> @@ -14,30 +14,30 @@
>  struct imx_sc_msg_req_misc_set_ctrl {
>  	struct imx_sc_rpc_msg hdr;
>  	u32 ctrl;
>  	u32 val;
>  	u16 resource;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct imx_sc_msg_req_cpu_start {
>  	struct imx_sc_rpc_msg hdr;
>  	u32 address_hi;
>  	u32 address_lo;
>  	u16 resource;
>  	u8 enable;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct imx_sc_msg_req_misc_get_ctrl {
>  	struct imx_sc_rpc_msg hdr;
>  	u32 ctrl;
>  	u16 resource;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct imx_sc_msg_resp_misc_get_ctrl {
>  	struct imx_sc_rpc_msg hdr;
>  	u32 val;
> -} __packed;
> +} __packed __aligned(4);
>  
>  /*
>   * This function sets a miscellaneous control value.
>   *
>   * @param[in]     ipc         IPC handle
> diff --git a/drivers/firmware/imx/scu-pd.c b/drivers/firmware/imx/scu-pd.c
> index b556612207e5..af3ae0087de4 100644
> --- a/drivers/firmware/imx/scu-pd.c
> +++ b/drivers/firmware/imx/scu-pd.c
> @@ -59,11 +59,11 @@
>  /* SCU Power Mode Protocol definition */
>  struct imx_sc_msg_req_set_resource_power_mode {
>  	struct imx_sc_rpc_msg hdr;
>  	u16 resource;
>  	u8 mode;
> -} __packed;
> +} __packed __aligned(4);
>  
>  #define IMX_SCU_PD_NAME_SIZE 20
>  struct imx_sc_pm_domain {
>  	struct generic_pm_domain pd;
>  	char name[IMX_SCU_PD_NAME_SIZE];
> diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
> index 73bf1d9f9cc6..23cf04bdfc55 100644
> --- a/drivers/pinctrl/freescale/pinctrl-scu.c
> +++ b/drivers/pinctrl/freescale/pinctrl-scu.c
> @@ -21,16 +21,16 @@ enum pad_func_e {
>  
>  struct imx_sc_msg_req_pad_set {
>  	struct imx_sc_rpc_msg hdr;
>  	u32 val;
>  	u16 pad;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct imx_sc_msg_req_pad_get {
>  	struct imx_sc_rpc_msg hdr;
>  	u16 pad;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct imx_sc_msg_resp_pad_get {
>  	struct imx_sc_rpc_msg hdr;
>  	u32 val;
>  } __packed;
> diff --git a/drivers/rtc/rtc-imx-sc.c b/drivers/rtc/rtc-imx-sc.c
> index cf2c12107f2b..a5f59e6f862e 100644
> --- a/drivers/rtc/rtc-imx-sc.c
> +++ b/drivers/rtc/rtc-imx-sc.c
> @@ -35,11 +35,11 @@ struct imx_sc_msg_timer_rtc_set_alarm {
>  	u8 mon;
>  	u8 day;
>  	u8 hour;
>  	u8 min;
>  	u8 sec;
> -} __packed;
> +} __packed __aligned(4);
>  
>  static int imx_sc_rtc_read_time(struct device *dev, struct rtc_time *tm)
>  {
>  	struct imx_sc_msg_timer_get_rtc_time msg;
>  	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> diff --git a/drivers/soc/imx/soc-imx-scu.c b/drivers/soc/imx/soc-imx-scu.c
> index fb70b8a3f7c5..20d37eaeb5f2 100644
> --- a/drivers/soc/imx/soc-imx-scu.c
> +++ b/drivers/soc/imx/soc-imx-scu.c
> @@ -23,11 +23,11 @@ struct imx_sc_msg_misc_get_soc_id {
>  		} __packed req;
>  		struct {
>  			u32 id;
>  		} resp;
>  	} data;
> -} __packed;
> +} __packed __aligned(4);
>  
>  struct imx_sc_msg_misc_get_soc_uid {
>  	struct imx_sc_rpc_msg hdr;
>  	u32 uid_low;
>  	u32 uid_high;
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
