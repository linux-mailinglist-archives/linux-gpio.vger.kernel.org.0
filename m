Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1AF42D884
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Oct 2021 13:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231191AbhJNLuk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 14 Oct 2021 07:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhJNLud (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Oct 2021 07:50:33 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BD5C061570
        for <linux-gpio@vger.kernel.org>; Thu, 14 Oct 2021 04:48:29 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mazDg-0007An-3b; Thu, 14 Oct 2021 13:48:20 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1mazDf-0004VT-Q3; Thu, 14 Oct 2021 13:48:19 +0200
Message-ID: <5f200e944b3b2d81bd3ff0ceff00c36939dd45c5.camel@pengutronix.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 Add reset binding
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Horatiu Vultur <horatiu.vultur@microchip.com>,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
        UNGLinuxDriver@microchip.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 14 Oct 2021 13:48:19 +0200
In-Reply-To: <20211014085929.2579695-2-horatiu.vultur@microchip.com>
References: <20211014085929.2579695-1-horatiu.vultur@microchip.com>
         <20211014085929.2579695-2-horatiu.vultur@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-10-14 at 10:59 +0200, Horatiu Vultur wrote:
> This describes the new binding for calling the reset driver in the
> pinctrl-microchip-sgpio driver.
> 
> Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> ---
>  .../devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> index 4fe35e650909..d7b3aa726e1d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.yaml
> @@ -68,6 +68,12 @@ properties:
>        clock, and larger than zero.
>      default: 12500000
>  
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    maxItems: 1

I'd expect reset-names to specify the name if it exists.

regards
Philipp
