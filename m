Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C83E7A157C
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Sep 2023 07:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbjIOFf1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Sep 2023 01:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232057AbjIOFf0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Sep 2023 01:35:26 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131202711
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 22:35:20 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31f8a05aa24so1630104f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Sep 2023 22:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1694756118; x=1695360918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCFwLWQlvVlQiSU7UZdz9MimUN6oP0AbuVDIc/7fuZ0=;
        b=aOBXzb4Y0TOR/laA9Eag4nyKqTZLC+hJ4q4xWnRB9kAEjnEH2NF5mvNhhyPDKz6/+B
         NgaHZ5dHKmq5c1Jv/nokLyyZyUA+HZN6jpp83HqyfYgp6ZlJRpM85GBDjECmooCtT6SA
         TrV0Bx52GGKET6qghcD+EXOv431IT/K3WATdrt0tTy/kSQ+DXd8hNWG4uybhKSMKBeZ3
         MGOk0b1kFRD1HNSmq4abuWgYBsEB7j3Dsw+SYFIiJiEGyc7AIAhMUgHIW3HGcp+GYmZH
         eZ83q4Q2AB/FW8OPNxR8Q3BYQVdm5Z3NlCassfOf0Y+wO8P2Q/Ns8uuvwUiv8xtGvQji
         JggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694756118; x=1695360918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jCFwLWQlvVlQiSU7UZdz9MimUN6oP0AbuVDIc/7fuZ0=;
        b=cUjDqSgY3Ypre/O0zmhVFDZMlqXr1fi2Muk+LgbtckQyqMBeLgqr9CBQWD+disuI0t
         YRmLmvRpg36UQ2omecNeJ/0z4TAF04yrsGG/nQJ6Ms/KxqNyC5ZlfAYxlBNtXWfugmve
         qFawTP33cTEBIWyuJQjTXmHA6z7e0cUjHtcJMpVjxvQXtols919ufrMgdSPRbjbZkcYE
         t3hRdPr4d9+AM7+/5f5Vj5oO+Z58ZJezAYtmY7z1L/OiPuoU7S6er28TbY2J47554Rtf
         LTb2GMPhyRsd9UI8RXY6vGIXGwY1FeFS0nWgf+pwJiajOSjZ2+LlNb2kZhdsKWJX70wE
         f5zA==
X-Gm-Message-State: AOJu0YwagdFlf4nR6n+ryhAcUn9lxvNUKrOatOUE0YQuGrQldA3MaBsU
        FrsAF9PSbrkUgFdOWwDg4uOvDw==
X-Google-Smtp-Source: AGHT+IGL9oG9qxI8b+K2vqWLJ/uBYUSG/EAvdwsyp1zBwA32EpDfEXEXIjOzgvRHhIU/3erKMLaNJA==
X-Received: by 2002:adf:dcd1:0:b0:31f:98c2:b384 with SMTP id x17-20020adfdcd1000000b0031f98c2b384mr517214wrm.30.1694756118266;
        Thu, 14 Sep 2023 22:35:18 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id k8-20020a5d4288000000b00317a29af4b2sm3439064wrq.68.2023.09.14.22.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 22:35:17 -0700 (PDT)
Message-ID: <94ae925c-6bd3-7253-9ac5-1d87280a1972@tuxon.dev>
Date:   Fri, 15 Sep 2023 08:35:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 06/37] clk: renesas: rzg2l: wait for status bit of SD mux
 before continuing
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org,
        magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org,
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
 <20230912045157.177966-7-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXoq96ptmm+oU_yHdkSfN4+WCfABn98tXV5xfyvM66Eig@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXoq96ptmm+oU_yHdkSfN4+WCfABn98tXV5xfyvM66Eig@mail.gmail.com>
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

On 14.09.2023 14:42, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Tue, Sep 12, 2023 at 6:52 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hardware user manual of RZ/G2L (r01uh0914ej0130-rzg2l-rzg2lc.pdf,
>> chapter 7.4.7 Procedure for Switching Clocks by the Dynamic Switching
>> Frequency Selectors) specifies that we need to check CPG_PL2SDHI_DSEL for
>> SD clock switching status.
>>
>> Fixes: eaff33646f4cb ("clk: renesas: rzg2l: Add SDHI clk mux support")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/rzg2l-cpg.c
>> +++ b/drivers/clk/renesas/rzg2l-cpg.c
>> @@ -188,7 +188,8 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>>         u32 off = GET_REG_OFFSET(hwdata->conf);
>>         u32 shift = GET_SHIFT(hwdata->conf);
>>         const u32 clk_src_266 = 2;
>> -       u32 bitmask;
>> +       u32 msk, val, bitmask;
>> +       int ret;
>>
>>         /*
>>          * As per the HW manual, we should not directly switch from 533 MHz to
>> @@ -203,9 +204,6 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>>          */
>>         bitmask = (GENMASK(GET_WIDTH(hwdata->conf) - 1, 0) << shift) << 16;
>>         if (index != clk_src_266) {
>> -               u32 msk, val;
>> -               int ret;
>> -
>>                 writel(bitmask | ((clk_src_266 + 1) << shift), priv->base + off);
>>
>>                 msk = off ? CPG_CLKSTATUS_SELSDHI1_STS : CPG_CLKSTATUS_SELSDHI0_STS;
>> @@ -221,7 +219,13 @@ static int rzg2l_cpg_sd_clk_mux_set_parent(struct clk_hw *hw, u8 index)
>>
>>         writel(bitmask | ((index + 1) << shift), priv->base + off);
>>
>> -       return 0;
>> +       ret = readl_poll_timeout(priv->base + CPG_CLKSTATUS, val,
>> +                                !(val & msk), 100,
> 
> "msk" may be uninitialized.

Indeed! I'll update it in next version.

> 
>> +                                CPG_SDHI_CLK_SWITCH_STATUS_TIMEOUT_US);
>> +       if (ret)
>> +               dev_err(priv->dev, "failed to switch clk source\n");
>> +
>> +       return ret;
> 
> This is now (supposed to be) doing the same thing twice, once using
> clk_src_266, and then again with the wanted index, so why not introduce
> a small helper? That would have avoided the uninitialized variable, too.

Initially I thought about it but I found it too much for this stage as it
is only about the readl_poll_timeout() and the debug message. I may keep
the debug message in a local variable if you think worth it (but FMPOV it
the code will look a bit... unusual). Moreover, as the code is rewritten in
patch "[PATCH 18/37] clk: renesas:
rzg2l: refactor sd mux driver" I thought it doesn't worth introducing a new
helper in this patch.

Thank you,
Claudiu Beznea

> 
> I know you're rewriting this code in "[PATCH 18/37] clk: renesas:
> rzg2l: refactor sd mux driver", but even after that, you always do
> a register write before calling rzg2l_cpg_wait_clk_update_done(),
> so it may still be a net win.
> 
>>  }
>>
>>  static u8 rzg2l_cpg_sd_clk_mux_get_parent(struct clk_hw *hw)
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
