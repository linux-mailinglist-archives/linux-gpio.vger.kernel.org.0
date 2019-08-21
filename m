Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1731597961
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 14:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbfHUMbk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 08:31:40 -0400
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:42020
        "EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728007AbfHUMbk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Aug 2019 08:31:40 -0400
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2ADAADFNl1d/zXSMGcNWBoBAQEBAQI?=
 =?us-ascii?q?BAQEBBwIBAQEBgVUDAQEBAQsBhB4UhB+RDIlsjyeBewkBAQEBAQEBAQE3AQG?=
 =?us-ascii?q?EPwKCfzYHDgIFAQEBBAECAQEGAwGFUoYYAQEBAQIBIxVBBQsLDQsCAiYCAlc?=
 =?us-ascii?q?GAQwGAgEBgx6BdwWpZnOBMhqFL4M8gUmBDCgBgWKKHoF/gREngms+h0+CWAS?=
 =?us-ascii?q?VIpYzCAGCH5QzIY1mA4pdjVuaDQyBfTMaCCgIgyeRGWCNJwEB?=
X-IPAS-Result: =?us-ascii?q?A2ADAADFNl1d/zXSMGcNWBoBAQEBAQIBAQEBBwIBAQEBg?=
 =?us-ascii?q?VUDAQEBAQsBhB4UhB+RDIlsjyeBewkBAQEBAQEBAQE3AQGEPwKCfzYHDgIFA?=
 =?us-ascii?q?QEBBAECAQEGAwGFUoYYAQEBAQIBIxVBBQsLDQsCAiYCAlcGAQwGAgEBgx6Bd?=
 =?us-ascii?q?wWpZnOBMhqFL4M8gUmBDCgBgWKKHoF/gREngms+h0+CWASVIpYzCAGCH5QzI?=
 =?us-ascii?q?Y1mA4pdjVuaDQyBfTMaCCgIgyeRGWCNJwEB?=
X-IronPort-AV: E=Sophos;i="5.64,412,1559491200"; 
   d="scan'208";a="246864955"
Received: from unknown (HELO [10.44.0.192]) ([103.48.210.53])
  by icp-osb-irony-out5.iinet.net.au with ESMTP; 21 Aug 2019 20:22:22 +0800
Subject: Re: [PATCH] m68k: coldfire: Include the GPIO driver header
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20190821070923.687-1-linus.walleij@linaro.org>
 <CAMuHMdWF1GXYtFbjrALRMObqzezd-cBwDPAqhC-9d=RbrLxNyQ@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <fb01f312-5cc5-03a1-a1a5-a12819e2ff7b@linux-m68k.org>
Date:   Wed, 21 Aug 2019 22:22:19 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWF1GXYtFbjrALRMObqzezd-cBwDPAqhC-9d=RbrLxNyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 21/8/19 5:19 pm, Geert Uytterhoeven wrote:
> CC Greg (coldfire)

Thanks Geert.
I am happy to take it via the m68knommu tree if you prefer?

Regards
Greg



> On Wed, Aug 21, 2019 at 9:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>> The Coldfire GPIO driver needs to explicitly incldue the
>> GPIO driver header since it is providing a driver.
>>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Geert can you pick this up for m68k?
>> ---
>>   arch/m68k/coldfire/gpio.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/m68k/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
>> index a83898426127..ca26de257871 100644
>> --- a/arch/m68k/coldfire/gpio.c
>> +++ b/arch/m68k/coldfire/gpio.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/module.h>
>>   #include <linux/init.h>
>>   #include <linux/device.h>
>> +#include <linux/gpio/driver.h>
>>
>>   #include <linux/io.h>
>>   #include <asm/coldfire.h>
>> --
>> 2.21.0
> 
