Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2757B11C5
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Sep 2023 06:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjI1Eyw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Sep 2023 00:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjI1Eyv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Sep 2023 00:54:51 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463A4121
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 21:54:49 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-534659061afso6077909a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Sep 2023 21:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1695876888; x=1696481688; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=olm/D+dJExjfSBWXGE2Uq9vVnEsfwITsdsfFo+MxoTk=;
        b=Dr1zyC1tiyCEQjBL1uj1JD4h+4CA80qgc0YJRvtD7Fw+xe6WnHNn+uMkxHDV7XJe67
         A1LEWxgV1Pe5CESNz5cbrPvRDAZHdqRYYeXNMu6xo9etQIurMbGD/bAcmvmpG03pjJTN
         SeuF3oJAxs7Vyy9w/KlCsKMonoiWdoc0tcaD82qg+oKXI5FQ6SJ1eUAOsRNdehy2p8uj
         7eKOe8lWUfrUWiSjyndt82MaOSEiPGjeV0oapU+aPlEV5uvnA5Uh88E7R80KjpXlI5Pa
         V26TlUnUOJW2XT4t2qvf4vNFqpIKZXoeNgw7jQsavdqALhMc05oKE6h7C1VMuAqPRnOZ
         0ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695876888; x=1696481688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olm/D+dJExjfSBWXGE2Uq9vVnEsfwITsdsfFo+MxoTk=;
        b=mqKKECby8NiQDlf+xciIoufPKi6Hm8r5tmZ1nusCxMTbHS9IQNCeF3ub3S/Xc+kY9s
         tCGLvXzMhLIh4u7dnUWb8esSjzGNfIiL322mBJ+sRS8zrNys/rgx3+odRS3wVioA10yx
         6gXJGgMELKk2slPKjYfdXZXqPS5+aYyf5OUv2PpTuljkVno/kZDjCK7fasL/cQ//S+74
         KIwEArVr9qMvcplNOA8K+29OwV6chmxAitETa6+wM3A7EyY8FJSJyWqCbj+8YBWRUoNf
         BMnZFo7IxXP814F1AKy602zPf4BVmHo1CL+wUbhISDpQJ374r4UPOgPCfBfdrS1qjjc0
         30xQ==
X-Gm-Message-State: AOJu0YwKt/qtufEiJMqAX0KDUVbZbAbB2/bpV4po9mrzquwKMbzI+++w
        r1ouSbEPjc0msxbTCBgwhX80dg==
X-Google-Smtp-Source: AGHT+IEFpdq3a7HATHUTgENVuaEGn2ioT9l2ERfVEJ8IOkiDOT6bn01Sn56ChsWGJMbIjhbJQj2snQ==
X-Received: by 2002:a17:906:518e:b0:9ae:5fe1:ef03 with SMTP id y14-20020a170906518e00b009ae5fe1ef03mr176773ejk.67.1695876887638;
        Wed, 27 Sep 2023 21:54:47 -0700 (PDT)
Received: from [192.168.32.2] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id p26-20020a170906229a00b009ad8338aafasm10387144eja.13.2023.09.27.21.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 21:54:47 -0700 (PDT)
Message-ID: <154b823e-d532-ede7-5ada-08436ec86804@tuxon.dev>
Date:   Thu, 28 Sep 2023 07:54:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 21/37] dt-bindings: clock: add r9a08g045 CPG clocks and
 resets definitions
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
 <20230912045157.177966-22-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWc6yy=oJDo4zMdvB-t8pjCuE1oJ_Y6Ck0aX_hPkfhPug@mail.gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWc6yy=oJDo4zMdvB-t8pjCuE1oJ_Y6Ck0aX_hPkfhPug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi, Geert,

On 15.09.2023 14:59, Geert Uytterhoeven wrote:
> On Tue, Sep 12, 2023 at 6:53 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add RZ/G3S (R9A08G045) Clock Pulse Generator (CPG) core clocks, module
>> clocks and resets.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/r9a08g045-cpg.h
> 
>> +/* R9A08G045 Module Clocks */
> 
>> +#define R9A08G045_USB_U2H0_HCLK                65
>> +#define R9A08G045_USB_U2H1_HCLK                66
>> +#define R9A08G045_USB_U2P_EXR_CPUCLK   67
>> +#define R9A08G045_USB_PCLK             68
>> +#define R9A08G045_USB_SCLK             69
> 
> There is no USB_SCLK bit in CPG_CLKON_USB, so please drop
> R9A08G045_USB_SCLK.
> 
>> +/* R9A08G045 Resets */
> 
>> +#define R9A08G045_SRAM_ACPU_ARESETN0   11
>> +#define R9A08G045_SRAM_ACPU_ARESETN1   12
>> +#define R9A08G045_SRAM_ACPU_ARESETN2   13
> 
> There is no SRAM_ACPU_ARESETN2 bit in CPG_RST_SRAM_MCPU,
> so please drop R9A08G045_SRAM_ACPU_ARESETN2.

I see there is SRAM_ACPU_ARESETN2 in CPG_RST_SRAM_*A*CPU register. You are
actually saying that the documentation might be wrong?

Thank you,
Claudiu Beznea

> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
