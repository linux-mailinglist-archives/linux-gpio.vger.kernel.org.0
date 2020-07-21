Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C515228BD4
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 00:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgGUWJK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 18:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbgGUWJJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 18:09:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4DFC061794;
        Tue, 21 Jul 2020 15:09:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 184so107050wmb.0;
        Tue, 21 Jul 2020 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jmxp9ZjwzrYU1CbK6BbkvHp9azWbhVXBGBSwuvDU5/Q=;
        b=UbYmBjCBdVt56lbOo9uLJj4QIJ93bEJNWqYyy0Aa7BP07xdb46QT1/1hS69tOeS55S
         Y/lDYpWJrncj7JgrdrarkD8BaI28v7fMrFT8WoWmDeDgmlbG47qvkTdrZNE6phccwm2g
         OiFvnenr1w2xNP2h4Bo3JMQTdKOUic5WmGHVw7AP0bgxou9WmkssfHWWNhUXIYOEEAFp
         xM9g/GkplKSdNyKy9IG7FWHJn1kRLzwqBCPSz8abbMuVY3hFhtBRhcpu3XXfh20e9nHD
         c1scEShv0oNJGjuJlh1hXzjN63AwBsgs4VdA+sQRvf3/9zUK6fsxN1zvjye/Q0A4/DYL
         zOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jmxp9ZjwzrYU1CbK6BbkvHp9azWbhVXBGBSwuvDU5/Q=;
        b=dZ8T0jnzQChlgFECj18Z05gshDR6lJE5htY3VnUqQAgc1N6hC0nVC4fgI4CcId061t
         MYtfQs9nM9hH+clohiPTJAFqLWDfW4O/nfFogOFKNDK8IQdw5u6eQvv/516xIj0Lf82Q
         fmDR1De4e0a19lahqBLKHuGkn0mqzY+a7kEuPdztzkDzuXtveGHxl7hby+BxtKlHg3bz
         8Ns7VNxSTzfLnAY012+XT63Ic5D6PJRfGRQy+apSApezKO5DdPFtR9hc/BxyAw5ap5Xb
         daWdlqQZlk+8YJeOJ8tdEZnizg1Zp2cBDkJNbRKduoAfufft4lExMhaSYq10lQlK2wTu
         MRxA==
X-Gm-Message-State: AOAM533eqPEciXtu7lxxiqbL9rq63iAAdyA9AUmFcYu8/mOJITclDKoE
        JXdN3EmIfBk6whcs7xvSIBY=
X-Google-Smtp-Source: ABdhPJwl/nnr+jBNsRDdiUcJoX66N+yahxMmWnzmyCTxkv1EFWyNbM9CrmHt1yr/mCOJmwbNuTKUkA==
X-Received: by 2002:a7b:c4d6:: with SMTP id g22mr6095038wmk.170.1595369348208;
        Tue, 21 Jul 2020 15:09:08 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id k126sm5110920wmf.3.2020.07.21.15.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 15:09:07 -0700 (PDT)
Subject: Re: [PATCH v8 6/7] arm64: dts: add dts nodes for MT6779
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsd_upstream@mediatek.com, CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
References: <1594718402-20813-1-git-send-email-hanks.chen@mediatek.com>
 <1594718402-20813-7-git-send-email-hanks.chen@mediatek.com>
 <1b335463-b0af-9010-feed-c4b673ebb6c5@gmail.com>
 <1594872242.11090.8.camel@mtkswgap22>
 <742eefe1-954b-eb3f-98b7-469833df729a@gmail.com>
 <1595311242.5599.3.camel@mtkswgap22>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1eb11f7f-603a-4aa9-92c5-1e18e6e2ce01@gmail.com>
Date:   Wed, 22 Jul 2020 00:09:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595311242.5599.3.camel@mtkswgap22>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 21/07/2020 08:00, Hanks Chen wrote:
> On Mon, 2020-07-20 at 18:13 +0200, Matthias Brugger wrote:
>>
>> On 16/07/2020 06:04, Hanks Chen wrote:

>>>>> +		uart2: serial@11004000 {
>>>>> +			compatible = "mediatek,mt6779-uart",
>>>>> +				     "mediatek,mt6577-uart";
>>>>> +			reg = <0 0x11004000 0 0x400>;
>>>>> +			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
>>>>> +			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
>>>>> +			clock-names = "baud", "bus";
>>>>> +			status = "disabled";
>>>>> +		};
>>>>
>>>> Devicetree describes the HW we have. As far as I know, we have 4 UARTs on
>>>> MT6779. So we should list them all here.
>>>>
>>>
>>> Actually, We have only 3 UARTs HW on MT6779, but have 4 UART clk in
>>> header file of clk.
>>
>> Correct, I got confused by the four clocks.
>> With that clarified I'm fine with the patch and will take it as soon as the
>> clock driver patch is accepted.
>>
>> Regards,
>> Matthias
>>
> Got it, I send a new serial to fix the redundant UART clk
> https://lkml.org/lkml/2020/7/21/45
> 

Ok, also I was talking about:
[PATCH v8 7/7] clk: mediatek: add UART0 clock support

Regards,
Matthias
