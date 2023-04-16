Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA1F6E35D1
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Apr 2023 09:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjDPHmX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 16 Apr 2023 03:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjDPHmV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 16 Apr 2023 03:42:21 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5305010F4
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 00:42:19 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-94a34a0baf9so520893566b.1
        for <linux-gpio@vger.kernel.org>; Sun, 16 Apr 2023 00:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681630938; x=1684222938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dLa1M1X92V/rEfxWxLWOXbfYqz+Tfo7l/6rlFRMEeU=;
        b=D+/5BrFrsRWl6tmSf2Cb4v4fCRJJDBC750uoFultAdnh/rxD6JdYZkt+JAuTlghQ+P
         iX3CEovNCrbVXLxOaOBCDzYGniAX8u3E33EOK4BffQx0+K0A3vZS15PLxJfq3BVIjxog
         iXdJs8zeHVu47n1/p2lRWMqTnsIHgk7V7fduxtCEw9iduO6tvXKJyqokQPlaPBfHevqr
         GVEgV6kzZvtM7Ynkg+iDrymAwPR9KF8H3UUzZC/SdpSrkxRvJyakxqBLaXy3DTBNoblD
         HPDoeQL7LJ2KioJ3amShv7J9fCH0muNs3lnnv66fqHVS46OnwNV2CDOLuvk1p5M2P3nv
         F3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681630938; x=1684222938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dLa1M1X92V/rEfxWxLWOXbfYqz+Tfo7l/6rlFRMEeU=;
        b=QgG6Wq5F+AwcwKSVQbGrFVzhI9Qj3ccdLkYHIJZ1cCE1ihrKaXAf9PJDu87tOKF6c7
         N7HL3JABQMuemFR8EiqtHS4OiwRjMapAvug1/PrxgBzY5W/MKASIx2hISoJruS4sIcx0
         IJYEYNfKB9HlKoyd6TE2LtzRFb9yzWZgZmCGlCOPFzOyZX57dGWFPH+2FOI7crVdq700
         HGkHB7vq/lfK+l2V5T5SKGYLmhZB9QD6euIAsiMDuGVkFYOEUIVRwT5bCLIK5oHMeRZR
         7nz0lcQMKMoqOEhcLdeRw4QHnbpzpgi3Jrf8UpE3S/3J1MnvdFvRiNBuGYs89qwkbuYw
         T3dw==
X-Gm-Message-State: AAQBX9d0tVN4zMDZH97Xifw+IM4VC8cL2yIaxg8bD+31s96lNOru5Z3d
        CkWyxokCUR6n/Q+ZnOk+0xhmOQ==
X-Google-Smtp-Source: AKy350YdEbzwwBXwD5KRCKHU96tJ9nWZ+m0qP+3oUQ7ORuqXSsAD1aF7PwhCPfQ53cXPp14fSnGkvw==
X-Received: by 2002:a05:6402:68f:b0:506:98e8:7e58 with SMTP id f15-20020a056402068f00b0050698e87e58mr1775432edy.34.1681630937823;
        Sun, 16 Apr 2023 00:42:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db? ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id bl8-20020a170906c24800b00949691d3183sm4738461ejb.36.2023.04.16.00.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 00:42:17 -0700 (PDT)
Message-ID: <a79134a3-be9d-7297-15e1-1de4eb4054d0@linaro.org>
Date:   Sun, 16 Apr 2023 09:42:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/3] gpio: Add gpio-delay support
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230406093344.917259-1-alexander.stein@ew.tq-group.com>
 <3231223.aeNJFYEL58@steina-w>
 <CAHp75VeR5R_CqWNT=Fpbyp-YSeo+3QXBnR62C=K_tyr-qQ2MVw@mail.gmail.com>
 <4800953.GXAFRqVoOG@steina-w>
 <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAHp75VeTFDkaYRfX+9hE7LYE4Z-NpNfP=xfsGt27nm_DrTC_cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 15/04/2023 17:06, Andy Shevchenko wrote:
> On Fri, Apr 14, 2023 at 9:37 AM Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
>> Am Dienstag, 11. April 2023, 11:34:16 CEST schrieb Andy Shevchenko:
>>> On Tue, Apr 11, 2023 at 10:19 AM Alexander Stein
>>> <alexander.stein@ew.tq-group.com> wrote:
> ...
> 
>>> So, taking the above into consideration, why is it GPIO property to
>>> begin with? This is PCB property of the certain platform design that
>>> needs to be driven by a specific driver, correct?
>>
>> True this is induced by the PCB, but this property applies to the GPIO,
>> neither the GPIO controller output, nor the GPIO consumer is aware of.
>> So it has to be added in between. The original idea to add a property for the
>> consumer driver is also rejected, because this kind of behavior is not limited
>> to this specific driver.
>> That's why the delay is inserted in between the GPIO output and GPIO consumer.
>>
>>> At the very least this is pin configuration (but external to the SoC),
>>> so has to be a _separate_ pin control in my opinion.
>>
>> Sorry, I don't get what you mean by _separate_ pin control.
> 
> As you mentioned above this can be applied theoretically to any pin of
> the SoC, That pin may or may not be a GPIO or a pin that can be
> switched to the GPIO mode. Hence this entire idea shouldn't be part of
> the existing _in-SoC_ pin control driver if any. This is a purely
> separate entity, but at the same time it adds a property to a pin,
> hence pin control.
> At the same time, it's not an SoC related one, it's a PCB. Hence _separate_.

I don't think that anything here is related to pin control. Pin control
is specific function of some device which allows different properties or
different functions of a pin.

This has nothing to do with different
properties/configuration/functions, thus it is not pin control. The pin
control maintainer also acked the patches.

The choice was discussed before, so I am surprised why you jump late in
discussions.

Although different problem is calling it v1. This is not v1, but v3 or
v4. Keep proper versioning. After v2 goes v3. RFC does not mean "v-2".

Best regards,
Krzysztof

