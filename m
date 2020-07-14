Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF5AC21F21F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jul 2020 15:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgGNNKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jul 2020 09:10:34 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:58987 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgGNNKe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jul 2020 09:10:34 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E2D5F1BF208;
        Tue, 14 Jul 2020 13:10:30 +0000 (UTC)
Date:   Tue, 14 Jul 2020 15:14:03 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 20/25] pinctrl: pinctrl-rza1: Demote some kerneldoc
 headers and fix others
Message-ID: <20200714131403.eguxpnzsioxfzzko@uno.localdomain>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-21-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200713144930.1034632-21-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lee,

On Mon, Jul 13, 2020 at 03:49:25PM +0100, Lee Jones wrote:
> Some description blocks are void of any description/documentation,
> others are missing 'struct' identifiers, there are also a couple of
> misspellings of function parameter names.  Fix all of them.
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/pinctrl/pinctrl-rza1.c:81: warning: cannot understand function prototype: 'struct rza1_bidir_pin '
>  drivers/pinctrl/pinctrl-rza1.c:90: warning: cannot understand function prototype: 'struct rza1_bidir_entry '
>  drivers/pinctrl/pinctrl-rza1.c:98: warning: cannot understand function prototype: 'struct rza1_swio_pin '
>  drivers/pinctrl/pinctrl-rza1.c:108: warning: cannot understand function prototype: 'struct rza1_swio_entry '
>  drivers/pinctrl/pinctrl-rza1.c:116: warning: cannot understand function prototype: 'struct rza1_pinmux_conf '
>  drivers/pinctrl/pinctrl-rza1.c:443: warning: cannot understand function prototype: 'struct rza1_mux_conf '
>  drivers/pinctrl/pinctrl-rza1.c:462: warning: cannot understand function prototype: 'struct rza1_port '
>  drivers/pinctrl/pinctrl-rza1.c:482: warning: cannot understand function prototype: 'struct rza1_pinctrl '
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'port' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'pin' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'func' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:546: warning: Function parameter or member 'rza1_pctl' not described in 'rza1_pinmux_get_flags'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'port' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'reg' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'bit' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:575: warning: Function parameter or member 'set' not described in 'rza1_set_bit'
>  drivers/pinctrl/pinctrl-rza1.c:672: warning: Function parameter or member 'rza1_pctl' not described in 'rza1_pin_mux_single'
>  drivers/pinctrl/pinctrl-rza1.c:672: warning: Excess function parameter 'pinctrl' description in 'rza1_pin_mux_single'
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Thanks, at the time I had no real idea about the implications of
documenting with kerneldoc :)

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/pinctrl/pinctrl-rza1.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 38a14bbced5f6..511f232ab7bc2 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -75,7 +75,7 @@
>   * RZ/A1 pinmux flags
>   */
>
> -/**
> +/*
>   * rza1_bidir_pin - describe a single pin that needs bidir flag applied.
>   */
>  struct rza1_bidir_pin {
> @@ -83,7 +83,7 @@ struct rza1_bidir_pin {
>  	u8 func: 4;
>  };
>
> -/**
> +/*
>   * rza1_bidir_entry - describe a list of pins that needs bidir flag applied.
>   *		      Each struct rza1_bidir_entry describes a port.
>   */
> @@ -92,7 +92,7 @@ struct rza1_bidir_entry {
>  	const struct rza1_bidir_pin *pins;
>  };
>
> -/**
> +/*
>   * rza1_swio_pin - describe a single pin that needs swio flag applied.
>   */
>  struct rza1_swio_pin {
> @@ -102,7 +102,7 @@ struct rza1_swio_pin {
>  	u16 input: 1;
>  };
>
> -/**
> +/*
>   * rza1_swio_entry - describe a list of pins that needs swio flag applied
>   */
>  struct rza1_swio_entry {
> @@ -110,7 +110,7 @@ struct rza1_swio_entry {
>  	const struct rza1_swio_pin *pins;
>  };
>
> -/**
> +/*
>   * rza1_pinmux_conf - group together bidir and swio pinmux flag tables
>   */
>  struct rza1_pinmux_conf {
> @@ -431,7 +431,7 @@ static const struct rza1_pinmux_conf rza1l_pmx_conf = {
>   * RZ/A1 types
>   */
>  /**
> - * rza1_mux_conf - describes a pin multiplexing operation
> + * struct rza1_mux_conf - describes a pin multiplexing operation
>   *
>   * @id: the pin identifier from 0 to RZA1_NPINS
>   * @port: the port where pin sits on
> @@ -450,7 +450,7 @@ struct rza1_mux_conf {
>  };
>
>  /**
> - * rza1_port - describes a pin port
> + * struct rza1_port - describes a pin port
>   *
>   * This is mostly useful to lock register writes per-bank and not globally.
>   *
> @@ -467,12 +467,12 @@ struct rza1_port {
>  };
>
>  /**
> - * rza1_pinctrl - RZ pincontroller device
> + * struct rza1_pinctrl - RZ pincontroller device
>   *
>   * @dev: parent device structure
>   * @mutex: protect [pinctrl|pinmux]_generic functions
>   * @base: logical address base
> - * @nports: number of pin controller ports
> + * @nport: number of pin controller ports
>   * @ports: pin controller banks
>   * @pins: pin array for pinctrl core
>   * @desc: pincontroller desc for pinctrl core
> @@ -536,7 +536,7 @@ static inline int rza1_pinmux_get_swio(unsigned int port,
>  	return -ENOENT;
>  }
>
> -/**
> +/*
>   * rza1_pinmux_get_flags() - return pinmux flags associated to a pin
>   */
>  static unsigned int rza1_pinmux_get_flags(unsigned int port, unsigned int pin,
> @@ -566,7 +566,7 @@ static unsigned int rza1_pinmux_get_flags(unsigned int port, unsigned int pin,
>   * RZ/A1 SoC operations
>   */
>
> -/**
> +/*
>   * rza1_set_bit() - un-locked set/clear a single bit in pin configuration
>   *		    registers
>   */
> @@ -664,7 +664,7 @@ static inline int rza1_pin_get(struct rza1_port *port, unsigned int pin)
>  /**
>   * rza1_pin_mux_single() - configure pin multiplexing on a single pin
>   *
> - * @pinctrl: RZ/A1 pin controller device
> + * @rza1_pctl: RZ/A1 pin controller device
>   * @mux_conf: pin multiplexing descriptor
>   */
>  static int rza1_pin_mux_single(struct rza1_pinctrl *rza1_pctl,
> --
> 2.25.1
>
