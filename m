Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29495442416
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 00:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhKAXhZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Nov 2021 19:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhKAXhZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Nov 2021 19:37:25 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920E1C061714;
        Mon,  1 Nov 2021 16:34:51 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id h14so16621199qtb.3;
        Mon, 01 Nov 2021 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Qe/jf30Y3o/pmc26ACLNjuS8JmQeoQQ3eNfoksRErqQ=;
        b=meyqyUd/ZQyFTlOFbpQmDWQBblRqcdcrSUKWso+9ZuYNublXe/ZttCH0W4VdQjJwSG
         7/EPsTeoo+WkMvDC1cOTQjJh7gVZUABjpKsY7SR6uFh8yqsrjAHIEBIX3Km5Dsq2Y+Ob
         SnDXPeVMXiO8jugBR67Bvhix80sc4zcO6KoiCYVhtCPTi39BnakPo5MFx7jaH3l2URmb
         Sh5+SyCQh3qIHa4JXkxf2XNrNcb6kUwjxzMGOk+cfaCRwkATpuom1R4bdlBRZYTiXQoA
         dTZlLZpdj9KfLY13M8iqYjkn14dAB6fqmNENU9JlJlivYefautnTK/6H6Qdb8vZnDXL7
         wKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Qe/jf30Y3o/pmc26ACLNjuS8JmQeoQQ3eNfoksRErqQ=;
        b=WFT6OLZJ7y560zQh2CrmnXxS0r06VXy44lJAh9LiAKTMbT2TgQcc5oFDZ2HBqSVpnf
         k/AyAaSNbgiW6B5QLDznWXmkFROUjTkHYCrTW0vEN6Jnw560JwxAl3sTSgapKnL3dWmm
         ULvYRxmVZJcbftW/YHXgRyEthNK7z7nPX9bwTq48qG3BJCiruecV2yjUds5g+02hkPC9
         FaqhJdk9EGRWeA7PlU0WYhFIT2go52pYfwz7sG6hDdEsWNlbsjhUNxHNCwPV/PqONJUG
         czTfFUJJK47R8PbrHkno8IUp6a759biIrzqyGMKo8VUQkPsEGKoPJiH23NjmPZLhy2lk
         iQ5w==
X-Gm-Message-State: AOAM533Q1YSRpXh3FQa7Nn1FrqI5Y3GVO92EDJVsVUL7cgTBcE4bY6D5
        vbEgxwRgQeHwXAbnT+ZzKDI=
X-Google-Smtp-Source: ABdhPJzszAm1hNUhWdNj2F3b33eIBAlQhcRdClkzaW2WFdJoN9bdZELkbTvPnuJLuvdKLmw9qyoaWg==
X-Received: by 2002:a05:622a:54a:: with SMTP id m10mr27961206qtx.239.1635809690756;
        Mon, 01 Nov 2021 16:34:50 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id m6sm11260918qti.38.2021.11.01.16.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 16:34:50 -0700 (PDT)
Message-ID: <58e5ec6a-7b85-3935-f859-6670600ac6a2@gmail.com>
Date:   Mon, 1 Nov 2021 19:34:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 08/13] dt-bindings: serial: fsl-lpuart: add i.MXRT
 compatible
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux-imx@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com,
        stefan@agner.ch, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net,
        soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com,
        adrian.hunter@intel.com, jirislaby@kernel.org,
        giulio.benetti@benettiengineering.com,
        nobuhiro1.iwamatsu@toshiba.co.jp, leonard.crestez@nxp.com,
        b20788@freescale.com, fugang.duan@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20211024154027.1479261-1-Mr.Bossman075@gmail.com>
 <20211024154027.1479261-9-Mr.Bossman075@gmail.com>
 <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
From:   Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <YYBKh1KYrWTzm+5G@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 11/1/21 16:13, Rob Herring wrote:
> On Sun, Oct 24, 2021 at 11:40:22AM -0400, Jesse Taube wrote:
>> Add i.MXRT documentation for compatible string.
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>> index a90c971b4f1f..4b4340def2aa 100644
>> --- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
>> @@ -21,6 +21,7 @@ properties:
>>            - fsl,ls1028a-lpuart
>>            - fsl,imx7ulp-lpuart
>>            - fsl,imx8qm-lpuart
>> +          - fsl,imxrt-lpuart
> 
> Actually, 'rt' is not a single part is it? If the variations are same 
> die, but fused off then no need to distinguish. Otherwise, these should 
> be SoC specific.
> 
I don't exactly know what "but fused off" means I would assume
disconnected but on-die? The imxrtxxx is a series that has the same UART
controller across them. Should I add ACK?
> Same applies to other compatible strings.
> 
>>        - items:
>>            - const: fsl,imx8qxp-lpuart
>>            - const: fsl,imx7ulp-lpuart
>> -- 
>> 2.33.0
>>
>>
