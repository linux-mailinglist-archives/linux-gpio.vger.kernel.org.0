Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD422C8247
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 11:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgK3Ker (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 05:34:47 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33010 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728528AbgK3Ker (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 05:34:47 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AUAX6PD033011;
        Mon, 30 Nov 2020 04:33:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606732386;
        bh=yMgfSKwhsApyTXmZzBfg0ZsUT/F0myEgiyp5/ylYxt8=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KMBVkjQSHs4tRl15XDSWtkAkjvl/aP5msjciPvs0AaGbM3Vc38Kndrr04kecGPVMF
         IfomIXvg4j6g5IpKXLPk6HeGqNlcebuKCFgdbpZJ94WPhJ6hYO53TAqABni7W8tLCE
         k3r896q+qXGY2rc/HGqwjPjWoYprMXQORc80kUjo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AUAX6sT086703
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Nov 2020 04:33:06 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 30
 Nov 2020 04:33:06 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 30 Nov 2020 04:33:06 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AUAX2OS015683;
        Mon, 30 Nov 2020 04:33:04 -0600
Subject: Re: [PATCH] gpio: omap: handle deferred probe with dev_err_probe()
 for gpiochip_add_data()
To:     Tony Lindgren <tony@atomide.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-omap@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
References: <20201118143149.26067-1-grygorii.strashko@ti.com>
 <20201119091907.GH26857@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <a3c0e105-36a5-f100-ae42-d6b43a1461a9@ti.com>
Date:   Mon, 30 Nov 2020 12:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119091907.GH26857@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi All,

On 19/11/2020 11:19, Tony Lindgren wrote:
> * Grygorii Strashko <grygorii.strashko@ti.com> [201118 14:33]:
>> The gpiochip_add_data() may return -EPROBE_DEFER which is not handled
>> properly by TI GPIO driver and causes unnecessary boot log messages.
>>
>> Hence, add proper deferred probe handling with new dev_err_probe() API.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> 
> Acked-by: Tony Lindgren <tony@atomide.com>
> 

Are there any comments? Could it be merged?
On am335 we no do see ~10 annoying error  messages during boot as there now is
dependency from pinctrl on this platform.

-- 
Best regards,
grygorii
