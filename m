Return-Path: <linux-gpio+bounces-1675-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A48190BD
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 20:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53B021C24E61
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Dec 2023 19:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1AB3987A;
	Tue, 19 Dec 2023 19:29:36 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7EA38FB3
	for <linux-gpio@vger.kernel.org>; Tue, 19 Dec 2023 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rFfmE-0001q6-FL; Tue, 19 Dec 2023 20:29:14 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1rFfmB-0005OK-NT; Tue, 19 Dec 2023 20:29:12 +0100
Received: from mfe by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1rFfmC-007p57-NO; Tue, 19 Dec 2023 20:29:12 +0100
Date: Tue, 19 Dec 2023 20:29:12 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: firmware: arm,scmi: support pinctrl
 protocol
Message-ID: <20231219192912.yulmczvqbuh4jizg@pengutronix.de>
References: <20231215-pinctrl-scmi-v1-0-0fe35e4611f7@nxp.com>
 <20231215-pinctrl-scmi-v1-4-0fe35e4611f7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215-pinctrl-scmi-v1-4-0fe35e4611f7@nxp.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

Hi Peng,

On 23-12-15, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add SCMI v3.2 pinctrl protocol bindings and example.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/firmware/arm,scmi.yaml     | 99 ++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index 4591523b51a0..bfd2b6a89979 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -247,6 +247,85 @@ properties:
>        reg:
>          const: 0x18
>  
> +  protocol@19:

...

> @@ -401,6 +480,26 @@ examples:
>              scmi_powercap: protocol@18 {
>                  reg = <0x18>;
>              };
> +
> +            scmi_pinctrl: protocol@19 {
> +                reg = <0x19>;
> +                #pinctrl-cells = <0>;
> +
> +                i2c2-pins {
> +                    groups = "i2c2_a", "i2c2_b";
> +                    function = "i2c2";
> +                };
> +
> +                mdio-pins {
> +                    groups = "avb_mdio";
> +                    drive-strength = <24>;
> +                };
> +
> +                keys_pins: keys-pins {
> +                    pins = "GP_5_17", "GP_5_20", "GP_5_22", "GP_2_1";
> +                    bias-pull-up;
> +                };
> +            };

This example is different to the one you mentioned within the
cover-letter. I didn't checked all patches just want to ask which API
will be implemented by this patchset?

Regards,
  Marco

>          };
>      };
>  
> 
> -- 
> 2.37.1
> 
> 
> 

