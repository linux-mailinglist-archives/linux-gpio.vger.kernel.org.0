Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E47A3B2C0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 12:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388937AbfFJKKE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 06:10:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46480 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388647AbfFJKKE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 06:10:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 03D88602F3; Mon, 10 Jun 2019 10:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560161403;
        bh=oMzk0exJ+xInm/wmcPKtXW9VAu75APw0ZR5LIiqwBMA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZUu4FyQ4F3QEJLmauV8ESFFe6E8Wsayf9AmyCygmDWmL4yGaNIFiSk/K84j/JFl99
         QuWVJf67fyJ/eJGBAXy/l3NDfCne5VePno+QCvl4fjHBHVId8nUfuIe72UFZespvT8
         BqFVgkO74GArdKHGYQt3myV9/pAROEAoYExzHRkU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.201.2.161] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sricharan@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6A0E60265;
        Mon, 10 Jun 2019 10:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560161402;
        bh=oMzk0exJ+xInm/wmcPKtXW9VAu75APw0ZR5LIiqwBMA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SaLCPnR1Et/BEyNk+ZcTTxeIwo8gyJ/n2d+q5Xul05WI4YqSh0wyjjYUlXeZt+8+Z
         +O2BI26+KyHgNgyePciF/SQ4O9PzcgvrTyBtFsV+9RRbmDVIbSqwDUzeLy3D/3kh8l
         P7GuAlKBKloZtGxGR4J58CeiejGr35K20apQDEdE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6A0E60265
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=sricharan@codeaurora.org
Subject: Re: [PATCH 5/6] arm64: dts: Add ipq6018 SoC and CP01 board support
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>, agross@kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        =?UTF-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-6-git-send-email-sricharan@codeaurora.org>
 <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com>
From:   Sricharan R <sricharan@codeaurora.org>
Message-ID: <50231fba-7212-f8b9-9313-0c79294d4cc6@codeaurora.org>
Date:   Mon, 10 Jun 2019 15:39:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAAd0S9DKqAgFPgLzHiCBiJgE+OmUW7ainyjM_3-RyfCoKEa51A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Christian,

On 6/6/2019 2:11 AM, Christian Lamparter wrote:
> On Wed, Jun 5, 2019 at 7:16 PM Sricharan R <sricharan@codeaurora.org> wrote:
>>
>> Add initial device tree support for the Qualcomm IPQ6018 SoC and
>> CP01 evaluation board.
>>
>> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>
>> +       clocks {
>> +               sleep_clk: sleep_clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <32000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
> Recently-ish, we ran into an issue with the clock-frequency of the sleep_clk
> on older IPQ40XX (and IPQ806x) on the OpenWrt Github and ML.
> From what I know, the external "32KHz" crystals have 32768 Hz, but the QSDK
> declares them at 32000 Hz. Since you probably have access to the BOM and
> datasheets. Can you please confirm what's the real clock frequency for
> the IPQ6018.
> (And maybe also for the sleep_clk of the IPQ4018 as well?).
> 

What exactly is the issue that you faced ?
Looking in to the docs, it is <32000> only on ipq6018 and ipq40xx as well.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
