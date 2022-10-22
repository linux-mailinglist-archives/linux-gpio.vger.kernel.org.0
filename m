Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35921608DFF
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Oct 2022 17:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbiJVPTF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Oct 2022 11:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJVPS7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 Oct 2022 11:18:59 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7E1399C8
        for <linux-gpio@vger.kernel.org>; Sat, 22 Oct 2022 08:18:55 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-13b103a3e5dso7122392fac.2
        for <linux-gpio@vger.kernel.org>; Sat, 22 Oct 2022 08:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gz0LxUsOUlJDcIAW5bPu+WDjpQGro2FyWxGKpu7r8bo=;
        b=gWrs34NeTJPV2fQ1MVoQY+zpFojHR3D/A6fVxaEOoPyaG1lz86TK/RINtSik3ihs6m
         epr6PhFlnoD33CCeTfWoNQCRee99kzlwRupaR937A3VU5HU4OTIvs/zluF82SMnywl6D
         HdEJ7m7PbwxapFaNOFa9ppWW4y91iGtKkwoLpnocgDPBTYKE8ItremNKc8YrHhceRIZp
         h3VMtehI1AqTwZwEWQcTgFOjDVRQQngjmAnbv2gz4Ef/Bbck+zcB6GCOTs8PKUKrqPeL
         49sPdfcCEYUyqTEphtRdJczJc984b2NmTshEFvs/XiFALWDOPilFuaMHYm7NR6Fhz+qX
         X9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz0LxUsOUlJDcIAW5bPu+WDjpQGro2FyWxGKpu7r8bo=;
        b=JnxzZfdC8LzdL0DaZxYePkl8MN8cTyTBdezxR/xDShRHnTg0PiGldyur0RVDN239h7
         HZ9jg2aI+QQ6yOvui918wn8tnAZzFGMpt/kTVG6WaqY62MEcTD0Q16aopdIYWWyPtDfQ
         JvX2tojZn82mXvuwTQR+3oTrEwHckZDMVw+kxU3c3wk1eEsF2jLWM+Zu1GtYr3tpTdwo
         3s14QUQGSYPSuXO1QwavpMyP8ObwACyBZX/B/hpMqGCTvrP4XgZ31FxeuMRLP813Y6mH
         2ZnVGaAJtQRBr0HRpTQir2BNuopEx4OhDB/gP5gK/IJ/Oza1k+4Jv3qhX08nEZE06i6/
         fKVg==
X-Gm-Message-State: ACrzQf1sOSW2t27in1qs4IlicUXq6fihPxGmhjZSSBv09GXzutJ5k61U
        Di/tbZUrI1FRb4QJ04TZySI+vg==
X-Google-Smtp-Source: AMsMyM4Ums0et6AQMZox+xdB7Wz2plUu78klbaMd0EOzV1OnnwGbhhl8/BymyNDqbBFL+Y+cBT/t0g==
X-Received: by 2002:a05:6870:f288:b0:131:de71:3eb6 with SMTP id u8-20020a056870f28800b00131de713eb6mr31239483oap.63.1666451935002;
        Sat, 22 Oct 2022 08:18:55 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
        by smtp.gmail.com with ESMTPSA id v5-20020a056870310500b00136c20b1c59sm11538284oaa.43.2022.10.22.08.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Oct 2022 08:18:54 -0700 (PDT)
Message-ID: <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
Date:   Sat, 22 Oct 2022 11:18:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 00/21] ARM: s3c: clean out obsolete platforms
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-watchdog@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 21/10/2022 16:22, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

Just to be sure - do you expect me to ack the series, or rather as usual
pick them up?


Best regards,
Krzysztof

