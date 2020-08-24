Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508F924F3F3
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 10:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHXI0Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 04:26:25 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:55365 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgHXI0Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 04:26:25 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B6B9A200007;
        Mon, 24 Aug 2020 08:26:21 +0000 (UTC)
Date:   Mon, 24 Aug 2020 10:30:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rza1: Switch to using "output-enable"
Message-ID: <20200824083007.x3l6ujn3mi5xhrsy@uno.localdomain>
References: <20200821111401.4021-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200821111401.4021-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Fri, Aug 21, 2020 at 01:14:01PM +0200, Geert Uytterhoeven wrote:
> For pins requiring software driven IO output operations, the RZ/A1 Pin
> Controller uses either the "output-high" or "output-low" DT property to
> enable the corresponding output buffer.  The actual line value doesn't
> matter, as it is ignored.
>
> Commit 425562429d4f3b13 ("pinctrl: generic: Add output-enable property")
> introduced a new DT property for this specific use case.
>
> Update the RZ/A1 Pin Controller DT bindings and driver to use this new
> property instead.  Preserve backwards compatibility with old DTBs in the
> driver, as this comes at a very small cost.
>
> Notes:
>   - The DT binding examples already used the new property,
>   - There are no upstream users of the old properties.
>

Did we introduce output-enable after the rza1 pinctrl and forgot to
update ? Good catch anyway

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc for v5.10.
>
>  .../devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt     | 5 ++---
>  drivers/pinctrl/pinctrl-rza1.c                               | 3 ++-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> index fd3696eb36bf307e..38cdd23d3498e74a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> @@ -117,10 +117,9 @@ function or a GPIO controller alternatively.
>      - input-enable:
>        enable input bufer for pins requiring software driven IO input
>        operations.
> -    - output-high:
> +    - output-enable:
>        enable output buffer for pins requiring software driven IO output
> -      operations. output-low can be used alternatively, as line value is
> -      ignored by the driver.
> +      operations.
>

Seems like no upstream DTS uses any output-* property for the pinctrl.

>    The hardware reference manual specifies when a pin has to be configured to
>    work in bi-directional mode and when the IO direction has to be specified
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 511f232ab7bc290c..944466ef34d33f51 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -928,7 +928,8 @@ static int rza1_parse_pinmux_node(struct rza1_pinctrl *rza1_pctl,
>  		case PIN_CONFIG_INPUT_ENABLE:
>  			pinmux_flags |= MUX_FLAGS_SWIO_INPUT;
>  			break;
> -		case PIN_CONFIG_OUTPUT:
> +		case PIN_CONFIG_OUTPUT:	/* for DT backwards compatibility */
> +		case PIN_CONFIG_OUTPUT_ENABLE:
>  			pinmux_flags |= MUX_FLAGS_SWIO_OUTPUT;
>  		default:
>  			break;

Great! For both parts:
Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j
> --
> 2.17.1
>
