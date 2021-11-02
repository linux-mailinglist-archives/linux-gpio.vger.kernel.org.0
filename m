Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C71644260E
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 04:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhKBDez (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 23:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231639AbhKBDez (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 23:34:55 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCAEC061714;
        Mon,  1 Nov 2021 20:32:20 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id 19so16205259qtt.7;
        Mon, 01 Nov 2021 20:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=q5xMzCydsOIW4HjjOOaSLM7lfTR/flQAzXNP4pGjc9U=;
        b=U78XbMRz+qE4VaDT7oxdXMYQ/jmLMdehcG/VGRktZQktJubRPUJJxkDuurnUVcehvR
         0IVl+Bh8/FvVmGYH0T4OrasWQIxlVo8Xb1iFXzppqXv/ZlEVRbdeJlkg2EZKL0Apzzxr
         N/T/zKCLkEisYWxqhKHKRNBx4rUreKGAnd+6L+JfdYsNc1CBxBr/RvxCQj0yo1K/IGRp
         F7zpiLslbTYhnGt+xhwmCDtEU/nuWehaVE5wmzLHlDX5gdHLp8uXFah9L9a2Q7AKHd2x
         pU/d19XiG/UwuGXsckmXZhBKKDlLZO2pDMmmh0MBxg5KsyIwf/RERiu/tJdz4TutwaPO
         gpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=q5xMzCydsOIW4HjjOOaSLM7lfTR/flQAzXNP4pGjc9U=;
        b=ezlAEB+FPSgNjK6EDP5rlYxUE69xwvp9ZQojc0fvntTbBkgH0nlX5xgR9aq8hdEQ8k
         WkrNlXOMMY8qgHRer8lkZAiPAvM3ToDGJEQlCumfoLAShug1MYLGBrjCbCB7OE1sJVan
         J9kruwypcCqIeTSuEX+qpOuTnm1kuOClqrxERHgX9xv7ukuG4ywLY3A1EjBJsRTOnjtk
         GTsJq5EUBd2HJRYGXVkEyESO4PVScf6tGoEWTkGBEpRsXreXGibI2cel1B6ZZv4YQ5Io
         lfvp+ycA4gQfhr/AVQslJd0ZVSExev/0NK39sNqEb0QHuJn6h9g2C32EGzzQXcRAvVlE
         Lh1g==
X-Gm-Message-State: AOAM531UJX6HuN9m9KiZ3n+j2vPs/cEPtViu0iJUPiyM650Md6hNkbXR
        2yS3Xm1bdBOGwKPuEonsq0E=
X-Google-Smtp-Source: ABdhPJzF5RqaqayWs3xAVNhdtWPF99fNOWgT7/fdcJTkR9sKGuVAuM+WBDmRff/bw28k+/7FBj68Fg==
X-Received: by 2002:a05:622a:1441:: with SMTP id v1mr35430791qtx.45.1635823939799;
        Mon, 01 Nov 2021 20:32:19 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id l22sm81668qtq.45.2021.11.01.20.32.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 20:32:19 -0700 (PDT)
Message-ID: <071c0b81-be62-8fc3-cf0a-d8a74a9a556c@gmail.com>
Date:   Mon, 1 Nov 2021 23:32:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 03/13] dt-bindings: imx: Add pinctrl binding doc for
 i.MXRT1050
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, stefan@agner.ch,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, olof@lixom.net, soc@kernel.org,
        linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com,
        jirislaby@kernel.org, giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154017.5X5YE5S_x5KJDGyYyx5jd-8m4gybur1xerb15SgFAiY@z>
 <YYBJyKv61p/sk1PE@robh.at.kernel.org>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <YYBJyKv61p/sk1PE@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/1/21 16:10, Rob Herring wrote:
> On Sun, Oct 24, 2021 at 11:40:17AM -0400, Jesse Taube wrote:
>> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>> Add binding doc for i.MXRT1050 pinctrl driver.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>>   include/dt-bindings/pinctrl/pins-imxrt1050.h | 993 +++++++++++++++++++
>>   1 file changed, 993 insertions(+)
>>   create mode 100644 include/dt-bindings/pinctrl/pins-imxrt1050.h
>>
>> diff --git a/include/dt-bindings/pinctrl/pins-imxrt1050.h b/include/dt-bindings/pinctrl/pins-imxrt1050.h
>> new file mode 100644
>> index 000000000000..a29031ab3de0
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/pins-imxrt1050.h
>> @@ -0,0 +1,993 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
> 
> Needs to match the .dts files which has BSD-3-Clause. The rest of i.MX
> uses MIT IIRC. You should align with that.
> 
It seems to use "GPL-2.0+ OR MIT", I shall replace the both with that.
