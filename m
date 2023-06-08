Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889FE72814B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jun 2023 15:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbjFHNYN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Jun 2023 09:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236136AbjFHNYM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 09:24:12 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 178311BD6
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 06:24:11 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5149bdb59daso884890a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686230649; x=1688822649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g9Yk2OboE4KOOjDxWPjnmeKvEIXr2uCqK9TWX1mzSS4=;
        b=yVOpePdYvp2oKWGszjgfNkpPNlXfFQ96SAqoKeJ34PTPaZgP5pn4tdM9MigO17+jsN
         fNwRNPTOx3L9Lx5LJ2hL89UavLvg7Zq4RSkFRJES1WT/TNjmsFnvBbwYPsrgMffdzgNl
         za5uvwimrwdzRicGmR0l529Ew0I3p0SxItFzf0UlpxkCXAspF8D0t/8+wpt8qPqzXRS6
         6vsWJZ4bUfRjZow15EcChB0KFpswQJT2R4BaB0zPdyBmquUnlAuwRaacDc5HFDiQxvwH
         W4XmHCiiM9IT3Qoc34FaQwf3XH2iffC3k+2T0G2QAfz5keeDxtmu/BgrvZ9ZCncZvI3D
         Yzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686230649; x=1688822649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9Yk2OboE4KOOjDxWPjnmeKvEIXr2uCqK9TWX1mzSS4=;
        b=J20v87AfPCYCqfwC+42znQZ5Ve7BV+BnEJputoJH+BsvsHFWTdhqf6BOswyyQyHqPH
         UhE6/anbm00KYG6wT8Zd6eZYEQUoNo+BKnEEX8PTl5M8rWqRDn6yRl+Sz1VHgULckvP4
         tq0sPLVyc0LPCqaVO0L+0GcZwjWmDyjch991FISO2RgACRA9HUd69gHqmxy6pbpeinC4
         3sPTq+kA6gNeQjJ9Sv1RNHXRlcAghnAzFI9aBg3dWcJTHXIkv+MSVGY44xs2pPzs7DSC
         qclrGiMWE7WMu0pAoGoKSP+3FenvCg12Y0xfmZxv3hxi8NVHr4JMSuly4eyDH6fUz+ha
         qORA==
X-Gm-Message-State: AC+VfDyI4xx/RB/F4PpLKBJU/zRIbAPSI/rwpDkFVVFBcz1Cb/VQ9YN+
        3WKrpI/GEvLiGdbhTmHqNsn+Tw==
X-Google-Smtp-Source: ACHHUZ6BgqYNNaZ4dGOLWZa98lCbG2t9XjPm5yXqX+ciiwVYZjuibcuzhFFGNHfqnh+AtY7cyjU/8Q==
X-Received: by 2002:a17:906:730c:b0:94f:956:b3f7 with SMTP id di12-20020a170906730c00b0094f0956b3f7mr9332394ejc.2.1686230649577;
        Thu, 08 Jun 2023 06:24:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u3-20020aa7d543000000b00514bddcb87csm560700edr.31.2023.06.08.06.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 06:24:09 -0700 (PDT)
Message-ID: <010e4dca-c2eb-25b5-77e5-d4869727b5af@linaro.org>
Date:   Thu, 8 Jun 2023 15:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1 3/8] dt-bindings: gpio: pca9570: add gpio-line-names
 property
To:     andy.shevchenko@gmail.com,
        =?UTF-8?Q?Leonard_G=c3=b6hrs?= <l.goehrs@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Sungbo Eo <mans0n@gorani.run>, kernel@pengutronix.de,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
 <20230607115508.2964574-3-l.goehrs@pengutronix.de>
 <ZICyGY4OSyM1i6ia@surfacebook>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZICyGY4OSyM1i6ia@surfacebook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/06/2023 18:36, andy.shevchenko@gmail.com wrote:
> Wed, Jun 07, 2023 at 01:55:02PM +0200, Leonard Göhrs kirjoitti:
>> This patch allows giving each of the controller's pins a meaningful
>> name.
> 
> Isn't it gpio.txt already mentiones this?

TXT does not matter for DT schema. It's is already covered by dtschemas.

> Perhaps you need to convert that to YAML and use it here?

How would it solve anything? We still want constraints, right?

Best regards,
Krzysztof

