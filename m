Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5CB3656E2
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 12:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbhDTKvo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Apr 2021 06:51:44 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:48002 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231770AbhDTKvg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 20 Apr 2021 06:51:36 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13KAoclu116545;
        Tue, 20 Apr 2021 05:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1618915838;
        bh=8hesSIuaVW5SB0Ri36onn983dne0vGQewCTk3OCyRXU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=PK964GQY7zQ+pMmHWS1eykT0Ix1g1QSIQSy+uevo+nsT7sfkbEs6nJhy3+vDTRTHj
         Clj2FhTZLFBFK6VfKJI66CJsAPTIo1CTYb/8rxFjJIL0NxPxPPfkdS39wVG8Nqj/1t
         P+CTo6R1Le63axYT/Ph6DRnyQ7qj1vW/pGJ3ttnk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13KAockw015459
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 20 Apr 2021 05:50:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 20
 Apr 2021 05:50:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 20 Apr 2021 05:50:38 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13KAoZq6028986;
        Tue, 20 Apr 2021 05:50:36 -0500
Subject: Re: [PATCHv2] gpio: omap: Save and restore sysconfig
To:     Tony Lindgren <tony@atomide.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>
References: <20210417083839.46985-1-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <7679127b-3642-bca2-2c6c-86b60779d815@ti.com>
Date:   Tue, 20 Apr 2021 13:50:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210417083839.46985-1-tony@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

hi Tony,

On 17/04/2021 11:38, Tony Lindgren wrote:
> As we are using cpu_pm to save and restore context, we must also save and
> restore the GPIO sysconfig register. This is needed because we are not
> calling PM runtime functions at all with cpu_pm.
> 
> We need to save the sysconfig on idle as it's value can get reconfigured by
> PM runtime and can be different from the init time value. Device specific
> flags like "ti,no-idle-on-init" can affect the init value.
> 
> Fixes: b764a5863fd8 ("gpio: omap: Remove custom PM calls and use cpu_pm instead")
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>   drivers/gpio/gpio-omap.c                | 9 +++++++++
>   include/linux/platform_data/gpio-omap.h | 3 +++
>   2 files changed, 12 insertions(+)
> 

Thank you.
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
grygorii
