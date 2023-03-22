Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80D056C4C02
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Mar 2023 14:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjCVNkP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Mar 2023 09:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjCVNkO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Mar 2023 09:40:14 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1EB54AFF8
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 06:40:12 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r29so17100667wra.13
        for <linux-gpio@vger.kernel.org>; Wed, 22 Mar 2023 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679492411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHNsw7LxlCqFoMl8EWjBKiEZL4o59QoD2UHFpV8/WBQ=;
        b=caba7aVPU6lnf+BBBU3K0f1qmo+uKqFlE6l6h44agRSSrtj20S6XpgSa2rd5WdBKyC
         u0Ipx+BvSlR+JBzx7NBe8uvaONUl81uWcyRL7+RFyOKIvuXTc8agXOazlHHDDXsCwLoN
         +2BlOHNyuYWss/a43M6g05BdeUhLnFH4pXR7yzF0+7uvjnENS9/vCUwCff7j3LPpFCwn
         qZ0pO/Er+LlNAmBFI4qQvw6rNNJh+Vk2i7fxfPxTjRS4jQIXRmp92xPzV/n+fNUHmOkU
         jhqXZUKc3ImlL4uiFBG0i3x9eLrEGYH9h3l6+4CqyyZdqR9B8DyLC4UlYZZsr303eIYN
         R8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679492411;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHNsw7LxlCqFoMl8EWjBKiEZL4o59QoD2UHFpV8/WBQ=;
        b=T6MpN7mmVGhj7n4VVCcjH2q6ycFzG4mI1a+CZidrvknfHSzRHZg7rAAXER2bkw5gJD
         i1ZP3/cmCK5TtYwhYCZrUx15xWxn6i/Z5Zg1hpWP94w8OdOKgE7wZum8NPcZ5LyOfS5V
         yMIZ/uzKzWZkIdjOvusa/CGbZTGs93yu/j+Jl0JgRHB+Ex7GSHesOg1PUtp/XhR4Wmx1
         KbKGaJvcBvDrN9PfmGLP1oV4Eo3+9P5CwNNuFW8kDSfLyxlTTCgX5HQPg6PZl9eZljJE
         +ikYmWK4iXOvUR79AvX7BJCafA94f1T833I7oYSMYca0TFl1QV1hmYG5ajqptKpadvky
         Plcg==
X-Gm-Message-State: AO0yUKUq6+pXinCZ92rFanTAcfY3SlGA85v8d6FyZhj3yNiOkX4d9Qd8
        Zo/MJkXrSqDURNcUJK1jmTpHXA==
X-Google-Smtp-Source: AK7set+TloqbMZ+vJGhqg1CScqLm59HoY+1s0hGrELHfVbcANa48Mh0hMTkdbKsbqLDM7ulS1fQs3A==
X-Received: by 2002:a5d:644b:0:b0:2d2:3ca:8c43 with SMTP id d11-20020a5d644b000000b002d203ca8c43mr5025509wrw.31.1679492411230;
        Wed, 22 Mar 2023 06:40:11 -0700 (PDT)
Received: from [192.168.1.70] (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id b9-20020adfde09000000b002daeb108304sm791234wrm.33.2023.03.22.06.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 06:40:10 -0700 (PDT)
Message-ID: <3cb28b7e-fc43-a222-77be-137e04118bd8@baylibre.com>
Date:   Wed, 22 Mar 2023 14:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH INTERNAL v1 3/3] regulator: tps6594-regulator: Add driver
 for TI TPS6594 regulators
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Esteban Blanc <eblanc@baylibre.com>, linus.walleij@linaro.org,
        lgirdwood@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        jneanne@baylibre.com
References: <20230224133129.887203-1-eblanc@baylibre.com>
 <20230224133129.887203-4-eblanc@baylibre.com>
 <205a4e62-fd87-629c-ea34-d863ff1549d8@baylibre.com>
 <ZBr+7X3lcFdI8p/o@sirena.org.uk>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <ZBr+7X3lcFdI8p/o@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 3/22/23 14:13, Mark Brown wrote:
> On Wed, Mar 22, 2023 at 10:10:23AM +0100, Julien Panis wrote:
>
>> Question @ Mark/Liam:
>> Shouldn't we use the generic 'regulator-coupled-with' property
>> instead of 'ti,multi-phase-id' ?
> My understanding was that this was a hardware configuration where
> two regulators operate as one with only one set of registers used
> for configuration.

Your understanding was correct.

>
>> I am in charge of upstreaming dt-bindings and maintainers
>> pointed out the similarity between 'multi-phase' and 'coupled'
>> regulator concepts. Does 'regulator-coupled-with' mean that
>> outputs of buck converters are combined ? If so, this generic
>> property should replace our specific 'ti,multi-phase-id' prop,
>> I guess.
> No, coupled regulators are regulators where the voltages can vary
> but there's a constraint that their configurations need to be
> related somehow, for example they must be within 200mV of each
> other or something like that.

OK, thank you for this explanation.
So, we keep 'ti,multi-phase-id' property.
