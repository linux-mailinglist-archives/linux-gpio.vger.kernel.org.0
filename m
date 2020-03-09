Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272D517DB84
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Mar 2020 09:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgCIIuB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Mar 2020 04:50:01 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:57289 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgCIIuB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Mar 2020 04:50:01 -0400
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Ludovic.Desroches@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="Ludovic.Desroches@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Ludovic.Desroches@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Ludovic.Desroches@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: CtE5m+ELkGAVPTcPcGWF0bzBHDYq/y1TZA9/A/Lh6/eGyiKlxgVGEMrs2Xkv6LOIBeQBMvAmIu
 WhBqEtZ2Lu4v8vuYsg2Hp5cw6tmkhWcowBBL2JDzSFrTvRgZAZGiqaj75MMA2IWMVOkym8kHl1
 yaJaW9gcnpSVICSc+seTCSwjSMhcldrNPZCl+c2HPsqRlczDfhE8k3gKo9vUTOJs9nhGx5K1ud
 qkyHCOCaWp0C65H04VHomaZTfE4EFlhTdtwRjKkaZQ6rtbWHB4PHv+OjuVYzgBiGxJ2XWvqGNF
 4Oo=
X-IronPort-AV: E=Sophos;i="5.70,532,1574146800"; 
   d="scan'208";a="69310236"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Mar 2020 01:49:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 9 Mar 2020 01:49:59 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 9 Mar 2020 01:49:56 -0700
Date:   Mon, 9 Mar 2020 09:49:13 +0100
From:   Ludovic Desroches <ludovic.desroches@microchip.com>
To:     Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
CC:     <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: at91: Fix a typo ("descibe")
Message-ID: <20200309084913.sgecbf3h2ajog3d7@M43218.corp.atmel.com>
Mail-Followup-To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200308214230.15193-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200308214230.15193-1-j.neuschaefer@gmx.net>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Mar 08, 2020 at 10:42:30PM +0100, Jonathan Neuschäfer wrote:
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
>  .../devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> index eb39f5051159..e8abbdad7b5d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> @@ -38,7 +38,7 @@ Bank: 3 (A, B and C)
>    0xffffffff 0x7fff3ccf  /* pioB */
>    0xffffffff 0x007fffff  /* pioC */
> 
> -For each peripheral/bank we will descibe in a u32 if a pin can be
> +For each peripheral/bank we will describe in a u32 if a pin can be
>  configured in it by putting 1 to the pin bit (1 << pin)
> 
>  Let's take the pioA on peripheral B
> --
> 2.20.1
> 
