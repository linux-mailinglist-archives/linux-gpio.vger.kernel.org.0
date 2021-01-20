Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E329B2FCC4A
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Jan 2021 09:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbhATICm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Jan 2021 03:02:42 -0500
Received: from mx.blih.net ([212.83.155.74]:21225 "EHLO mx.blih.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729643AbhATICY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 20 Jan 2021 03:02:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bidouilliste.com;
        s=mx; t=1611129668;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZsuP9EUESZltLXaS8dgiXaaE9jo809x4YaPbT21PXX0=;
        b=H7JaUfFmYjDL9GqizsW5Z81btdTOdGyLWR7NoJXuI2Mf0ZC2A7VVQJ8nVadFxPz5Ns7NEh
        cHlxGitgyOwAdSJ8SVKX199i7PGBz8U75pttMkV2/fnqa6TB1JPFnmJWgpXbUXVAh4UC8z
        eReXnS+9nC83aog2msOHc1cunSX/oBI=
Received: from amy.home (lfbn-idf2-1-745-114.w86-247.abo.wanadoo.fr [86.247.192.114])
        by mx.blih.net (OpenSMTPD) with ESMTPSA id 3bf0e6a4 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
        Wed, 20 Jan 2021 08:01:08 +0000 (UTC)
Date:   Wed, 20 Jan 2021 09:01:08 +0100
From:   Emmanuel Vadot <manu@bidouilliste.com>
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: clarify #pinctrl-cells for pinctrl-single,pins
Message-Id: <20210120090108.bbdee781a237cb931a572323@bidouilliste.com>
In-Reply-To: <20210120050342.320704-1-drew@beagleboard.org>
References: <20210120050342.320704-1-drew@beagleboard.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; amd64-portbld-freebsd13.0)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 19 Jan 2021 21:03:44 -0800
Drew Fustini <drew@beagleboard.org> wrote:

> Document that #pinctrl-cells can be 1 or 2 for pinctrl-single,pins
> 
> Fixes: 27c90e5e48d0 ("ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2")
> Reported-by: Emmanuel Vadot <manu@bidouilliste.com>
> Link: https://lore.kernel.org/linux-gpio/20210115190201.9273b637a7f967e7e55bc740@bidouilliste.com/
> Cc: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> index f903eb4471f8..bb9999119314 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.txt
> @@ -8,7 +8,7 @@ Required properties:
>  - reg : offset and length of the register set for the mux registers
>  
>  - #pinctrl-cells : number of cells in addition to the index, set to 1
> -  for pinctrl-single,pins and 2 for pinctrl-single,bits
> +  or 2 for pinctrl-single,pins and set to 2 for pinctrl-single,bits
>  
>  - pinctrl-single,register-width : pinmux register access width in bits
>  
> -- 
> 2.25.1
> 

 Reviewed-by: Emmanuel Vadot <manu@FreeBSD.org>

 Thanks, now the docs make more sense :)

-- 
Emmanuel Vadot <manu@bidouilliste.com> <manu@FreeBSD.org>
