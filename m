Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C138631BB2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Nov 2022 09:39:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiKUIjw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Nov 2022 03:39:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiKUIjv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Nov 2022 03:39:51 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A7760E9A
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 00:39:50 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d20so13651043ljc.12
        for <linux-gpio@vger.kernel.org>; Mon, 21 Nov 2022 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfCkci6WAZIMqirtlBXVAgsIpWsivyGhwX0F9z3bWiU=;
        b=x9dQ5gz9Db5VI+Z2oZrHNOOrl6Z4x7BtjhTdTIThj0UAk/R288TW4FwtXNuORuBjga
         D3J8jPefxGlLGwk3ktURUv/eA86KF8QhOMe4FTM0aHQ2mimI5XCBK1vxD/d8zgYxKvtk
         Bwqzq+7F3BVm33TdARoIamWOCo1BBtSEqIShD9ktZJDlXnOMBdoMG6B1Sn4mWF9qhVrp
         JzrUIpk7fBQRCb9Bz4ycfccudvVO/9liYC3yDuSwSyW4UVY3hlRUfzqPw++l2v4P6Dbl
         fzevFLGbJXsK8fNeJrj/NMXcqsXuIyVNFHeXHJ+bRfCuCBiAME5OQ1zuNL1oBYXA3G+2
         ABNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfCkci6WAZIMqirtlBXVAgsIpWsivyGhwX0F9z3bWiU=;
        b=a6MVuakcB+GEBq4rbL7UQcX/TBBavykSEMmru8tqzodh/IVdOlgS9AUPLQAVeu10mj
         t9/J95Y/7zAHG/Qb0eqt9Uyy/ECC6e1ux31kXdXy6RxGgvVEz6umN6vzynodycXN1k5l
         ypBRttLW920GgdQVym2apgNdh6PPFJvzqCOrMZBwMaL9Sj5BbvQKhC2d0TnO1/soAzEk
         PaRldvg32cOPNNTuPNPP+D5BU5j9FG3xxtvNKDSmN0RCwg9yecX5ooJzX2cl3xKxd2EE
         4EbHKS2I63Bn3N0PR7fpgeDqA/pT+R8/ZlxanFEeIQMF3kyW7NSACnxfh0UjYxUwjRCd
         ZIYw==
X-Gm-Message-State: ANoB5pl5Ha6vpIX3NyBwlr7N0T6kvh78QFFK0XAYXfsExxBP4fPBQw8m
        SCqWqXQh84EYIpyaDMgJPbMopA==
X-Google-Smtp-Source: AA0mqf4+cHjraVxBZWmP3/8G0vOaaHJL8lOp3PrnDsdPi67/SyOnVVqr4fn6Qm6+O4ikKowYJmJFKg==
X-Received: by 2002:a2e:b55b:0:b0:26c:554f:87a5 with SMTP id a27-20020a2eb55b000000b0026c554f87a5mr2132957ljn.452.1669019988308;
        Mon, 21 Nov 2022 00:39:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y18-20020a05651c107200b0027741daec09sm1306234ljm.107.2022.11.21.00.39.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 00:39:48 -0800 (PST)
Message-ID: <08db0f3b-5222-9460-26ba-0e6380d16583@linaro.org>
Date:   Mon, 21 Nov 2022 09:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: Add StarFive JH7110 pinctrl
 definitions
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        linux-kernel@vger.kernel.org
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-2-hal.feng@starfivetech.com>
 <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
In-Reply-To: <eb3974a3-f715-f5b0-cac7-551af26bd17b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/11/2022 09:38, Krzysztof Kozlowski wrote:
> On 18/11/2022 02:11, Hal Feng wrote:
>> From: Jianlong Huang <jianlong.huang@starfivetech.com>
>>
>> Add pinctrl definitions for StarFive JH7110 SoC.
>>
>> Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>> ---
>>  .../pinctrl/pinctrl-starfive-jh7110.h         | 427 ++++++++++++++++++
>>  1 file changed, 427 insertions(+)
>>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
>>
>> diff --git a/include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h b/include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
>> new file mode 100644
>> index 000000000000..fb02345caa27
>> --- /dev/null
>> +++ b/include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h
>> @@ -0,0 +1,427 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
>> +/*
>> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
>> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
>> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JH7110_H__
>> +
>> +/*
>> + * mux bits:
>> + *  | 31 - 24 | 23 - 16 | 15 - 10 |  9 - 8   |  7 - 0  |
>> + *  |  din    |  dout   |  doen   | function | gpio nr |
>> + *
>> + * dout:     output signal
>> + * doen:     output enable signal
>> + * din:      optional input signal, 0xff = none
>> + * function:
>> + * gpio nr:  gpio number, 0 - 63
>> + */
>> +#define GPIOMUX(n, dout, doen, din) ( \
>> +		(((din)  & 0xff) << 24) | \
>> +		(((dout) & 0xff) << 16) | \
>> +		(((doen) & 0x3f) << 10) | \
>> +		((n) & 0x3f))
>> +
> 
> 
> (...)
> 
>> +/* sys_iomux doen */
>> +#define GPOEN_ENABLE				 0
>> +#define GPOEN_DISABLE				 1
>> +#define GPOEN_SYS_HDMI_CEC_SDA			 2
>> +#define GPOEN_SYS_HDMI_DDC_SCL			 3
>> +#define GPOEN_SYS_HDMI_DDC_SDA			 4
>> +#define GPOEN_SYS_I2C0_CLK			 5
>> +#define GPOEN_SYS_I2C0_DATA			 6
>> +#define GPOEN_SYS_HIFI4_JTAG_TDO		 7
>> +#define GPOEN_SYS_JTAG_TDO			 8
>> +#define GPOEN_SYS_PWM0_CHANNEL0			 9
>> +#define GPOEN_SYS_PWM0_CHANNEL1			10
>> +#define GPOEN_SYS_PWM0_CHANNEL2			11
>> +#define GPOEN_SYS_PWM0_CHANNEL3			12
>> +#define GPOEN_SYS_SPI0_NSSPCTL			13
>> +#define GPOEN_SYS_SPI0_NSSP			14
>> +#define GPOEN_SYS_TDM_SYNC			15
>> +#define GPOEN_SYS_TDM_TXD			16
>> +#define GPOEN_SYS_I2C1_CLK			17
>> +#define GPOEN_SYS_I2C1_DATA			18
>> +#define GPOEN_SYS_SDIO1_CMD			19
>> +#define GPOEN_SYS_SDIO1_DATA0			20
>> +#define GPOEN_SYS_SDIO1_DATA1			21
>> +#define GPOEN_SYS_SDIO1_DATA2			22
>> +#define GPOEN_SYS_SDIO1_DATA3			23
>> +#define GPOEN_SYS_SDIO1_DATA4			24
>> +#define GPOEN_SYS_SDIO1_DATA5			25
>> +#define GPOEN_SYS_SDIO1_DATA6			26
>> +#define GPOEN_SYS_SDIO1_DATA7			27
>> +#define GPOEN_SYS_SPI1_NSSPCTL			28
>> +#define GPOEN_SYS_SPI1_NSSP			29
>> +#define GPOEN_SYS_I2C2_CLK			30
>> +#define GPOEN_SYS_I2C2_DATA			31
>> +#define GPOEN_SYS_SPI2_NSSPCTL			32
>> +#define GPOEN_SYS_SPI2_NSSP			33
>> +#define GPOEN_SYS_I2C3_CLK			34
>> +#define GPOEN_SYS_I2C3_DATA			35
>> +#define GPOEN_SYS_SPI3_NSSPCTL			36
>> +#define GPOEN_SYS_SPI3_NSSP			37
>> +#define GPOEN_SYS_I2C4_CLK			38
>> +#define GPOEN_SYS_I2C4_DATA			39
>> +#define GPOEN_SYS_SPI4_NSSPCTL			40
>> +#define GPOEN_SYS_SPI4_NSSP			41
>> +#define GPOEN_SYS_I2C5_CLK			42
>> +#define GPOEN_SYS_I2C5_DATA			43
>> +#define GPOEN_SYS_SPI5_NSSPCTL			44
>> +#define GPOEN_SYS_SPI5_NSSP			45
>> +#define GPOEN_SYS_I2C6_CLK			46
>> +#define GPOEN_SYS_I2C6_DATA			47
>> +#define GPOEN_SYS_SPI6_NSSPCTL			48
>> +#define GPOEN_SYS_SPI6_NSSP			49
>> +
>> +/* aon_iomux doen */
>> +#define GPOEN_AON_PTC0_OE_N_4			2
>> +#define GPOEN_AON_PTC0_OE_N_5			3
>> +#define GPOEN_AON_PTC0_OE_N_6			4
>> +#define GPOEN_AON_PTC0_OE_N_7			5
>> +
> 
> It looks like you add register constants to the bindings. Why? The
> bindings are not the place to represent hardware programming model. Not
> mentioning that there is no benefit in this.

Also: this entire file should be dropped, but if it stays, you have to
name it matching bindings or compatible (vendor,device.h).

Best regards,
Krzysztof

