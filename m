Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 030617A439B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Sep 2023 09:55:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238536AbjIRHye (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Sep 2023 03:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240548AbjIRHyM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Sep 2023 03:54:12 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E0F3A96
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 00:50:40 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bfbd7d49e7so66279541fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 Sep 2023 00:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695023432; x=1695628232; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3y431fp7zImpDWkvcmWfe4LAHrYOVE+zuYJQGH6Vve8=;
        b=SISV0CS8M5bxkkPkub1VMfMVIDBOE2nLvyt9OK5Yc8nrVfgdWuhLYOV0FuDEVzVBuA
         3y83V5Fj2s7lqszoHZ/V5ULI7nGf5pqU9hCRz6mXzxrub0WXLerP9+QVWPGbUhCvKq+h
         XXElYbaAKLNGJ260n5qM3flrj6P7SelcmSCBMAAy5TSpI5YnphYLFqBA790hDM9n0KQG
         CTgkQvZFbspQuu8HgG2bObtmiCLwn52G9O3D+c13cWV0dYQS4RUaBAnnhBQJeMuC8jAh
         j972D6N2rUmqCRyNSrUMYSNAQvkfsUT2QIyCl/EhbJSfRsSSB9MKqstiExrEqWgo+6Ps
         9j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695023432; x=1695628232;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3y431fp7zImpDWkvcmWfe4LAHrYOVE+zuYJQGH6Vve8=;
        b=P9HpgTR0rfd+QjNHXVCYAHtCbiwf1RioYGCpkztYZ2k3hZPGkbKuxVWtiuMb0kRvk1
         P/zjD5txRXwJzEhO7sEWxipEv66T/0OoZbKMDbxvvbDGfGuB1woO3FY//0h89smyQwR2
         8CzbghWjWBXvg3nYhQeEmjpjO3oFlTYmpdb8KGZTNRXWUu45vo4i3lDw1XNv44Lk7NrG
         JNfiEUSJEWfuxM1ksc8j7hkwFd+Bm470BZZMK0VOdi6hXAJV7UBOk1t8xosddlVIL6cO
         p8thuWKfeBkJyOqoY+NgsNQOmI7dpm26AxiRYiotkIzZnjxIVTLiBHbrx5KYQJIO9cBM
         wZ+w==
X-Gm-Message-State: AOJu0YxtcIprB5tcklA2Wv9PH0I0j+zJNa3s3Smy3k6256GYy7Heas3y
        cxTzVTqz2zvyCkWObagbbAgm3Q==
X-Google-Smtp-Source: AGHT+IGDwTGCqvI7ErFSwd5+9EaU2bhKoinXXuDhfENDvQM6ygOX7ZuQ/7Sf1mEAGjlycsO7Ct0+tg==
X-Received: by 2002:a2e:9b87:0:b0:2bd:d4d:7fb6 with SMTP id z7-20020a2e9b87000000b002bd0d4d7fb6mr6798737lji.2.1695023431915;
        Mon, 18 Sep 2023 00:50:31 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906350b00b009a5f1d1564dsm5993808eja.126.2023.09.18.00.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 00:50:31 -0700 (PDT)
Message-ID: <701ee3bd-5d16-6b5f-2d34-4a4919c4c532@tuxon.dev>
Date:   Mon, 18 Sep 2023 10:50:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 22/37] clk: renesas: add minimal boot support for RZ/G3S
 SoC
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, magnus.damm@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        biju.das.jz@bp.renesas.com, quic_bjorande@quicinc.com,
        arnd@arndb.de, konrad.dybcio@linaro.org, neil.armstrong@linaro.org,
        nfraprado@collabora.com, rafal@milecki.pl,
        wsa+renesas@sang-engineering.com,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com>
 <20230912045157.177966-23-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUCpbPA3cDjNAq1irvr6z4Jux-5-tVDBuyr6nx_qOQGpg@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUCpbPA3cDjNAq1irvr6z4Jux-5-tVDBuyr6nx_qOQGpg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Geert,

On 15.09.2023 15:52, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Sep 12, 2023 at 6:53 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add minimal clock and reset support for RZ/G3S SoC to be able to boot
>> Linux from SD Card/eMMC. This includes necessary core clocks for booting
>> and GIC, SCIF, GPIO, SD0 mod clocks and resets.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 

[ ... ]

>> +       CLK_PLL3_DIV2_4,
>> +       CLK_PLL3_DIV2_8,
>> +       CLK_PLL3_DIV6,
>> +       CLK_PLL4,
>> +       CLK_PLL6,
>> +       CLK_PLL6_DIV2,
>> +       CLK_SEL_SDHI0,
>> +       CLK_SEL_PLL4,
>> +       CLK_P1_DIV2,
>> +       CLK_P3_DIV2,
> 
> Do you need CLK_P1_DIV2 and CLK_P3_DIV2?
> I don't see them in Figure 7.3 ("Clock System Diagram (2)").
> 

P1_DIV2 is clock source for MHU_PCLK or OTFDE_DDR_PCLK.
P3_DIV2 is clock source for DMAC_PCLK, OTFDE_SPI_PCLK.
These are expressed in clock list document
(RZG3S_clock_list_r1.00_20230602.xlsx).

It is true the functionality could be preserved even w/o these 2 clocks but
I kept them here as I saw them as core clocks even though they are not
present in the Clock System Diagram from HW manual.

With these, would you prefer to keep these clocks or just remove them?

Thank you,
Claudiu Beznea
