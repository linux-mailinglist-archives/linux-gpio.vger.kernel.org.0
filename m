Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA1D66DD931
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Apr 2023 13:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbjDKLR1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Apr 2023 07:17:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDKLR1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2023 07:17:27 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04ACCB4
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 04:17:25 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id i27so7132801wrc.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Apr 2023 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681211843; x=1683803843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=62hsVi+QUfoOKuYp2vpVkc9puq+N1iUtD/B1+czftAY=;
        b=SKe6JIxZ5X0t6jdZpOlho0qGWVej/qeJcAzcHLsAFQ2SIz+my/ILQMW5fDnLJkVjOs
         bhqBbOzrfDUk+HoC9Y3byrRbsKJMmwyhw8XgdhbD8tMIN0M4cMHdVk9JwnOE4TuP/KpA
         0LfmnPCaDeiu7BjfOQkN/7RDTGLyBo6P3JpIlzaRtO6pwNLbMRSPeulavEzDbp4T+oPx
         Rty8edAIOOtewbr6YPKvtANRaSkE1dj444PvmkMpalOhmZoODx6MDLth0H1GQqQrQXCo
         m7NX4DyS3OwbKmhpd+LGu2WnEoZa4f/1ohzmvwUObZ126vd3IE8fFL5NmSnbb5Wa4zKi
         b5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681211843; x=1683803843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=62hsVi+QUfoOKuYp2vpVkc9puq+N1iUtD/B1+czftAY=;
        b=bxVSlbKO02DIBNB28jNoEa281crlw9+1vE+aWceiOMF6o9Urgt4/kWtVEh2oFNfAHs
         RyspxhX8qSG1aXzYro7vd7/q1k9sQiFBqqEXQV3J2kiU8kWgOODhpptncN04EGclVwMG
         ahcWiOSu96FwegeHHDdn6o3IzNnYpuc0LtilDhYJEzgIJXh5U3FJK+9PGbO0CvFSN0GL
         zYNgyIJTa8offwSv2AIyjx09dQ1R0hBQmtIXe6G/5N+n/vNNJpqnlw0YmgE2Z/SA764D
         OtXHpIuV/fQ2zGehCcn1s8icUUUovoCIiXuMNM1hRWi7HjtURYhBP30IIon5RKx+Zb67
         7+KQ==
X-Gm-Message-State: AAQBX9fyiWwbYkz/llN+LC8982PCP8md6T9ot0LmxHhvFWwCXmew5y48
        KOQg7Wd/Y1F70rmyeFa9nGAVeQ==
X-Google-Smtp-Source: AKy350YNIHpETfKFyNwriQojM4cwGMtxFd9k2BIAoqEoZyUD79V9JE8xJs9z66OhnfG3ED0jM+Quog==
X-Received: by 2002:adf:e34c:0:b0:2e5:a86c:fe74 with SMTP id n12-20020adfe34c000000b002e5a86cfe74mr6136269wrj.51.1681211843387;
        Tue, 11 Apr 2023 04:17:23 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id y9-20020adffa49000000b002c592535839sm14335619wrr.17.2023.04.11.04.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 04:17:22 -0700 (PDT)
Message-ID: <b7a43215-8c51-8609-63bb-c0748887688a@baylibre.com>
Date:   Tue, 11 Apr 2023 13:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 07/12] arm64: dts: mediatek: set vmc regulator as
 always on
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wenbin Mei <wenbin.mei@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>,
        =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Alexandre Bailon <abailon@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-7-1883c1b405ad@baylibre.com>
 <ce6a9e78-efae-c430-c990-ceafdfc7be41@collabora.com>
From:   Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ce6a9e78-efae-c430-c990-ceafdfc7be41@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 11/04/2023 10:23, AngeloGioacchino Del Regno wrote:
> Il 07/04/23 14:59, amergnat@baylibre.com ha scritto:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> MSDC1 IP block is powered by VMC. Make sure it is always on.
>>
>
> Can't we set vmc as parent of vemc? 

I don't find parent property for regulators. AFAIK, vin-supply is used in other DTS to do that but is it supported by fixed-regulator and gpio-regulator, which is not the case here.
Based on this, I don't think so, but I'm probably missing something.

Regards,
Alexandre

