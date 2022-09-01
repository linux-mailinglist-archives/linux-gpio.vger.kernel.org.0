Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA315A9B52
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Sep 2022 17:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbiIAPMj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Sep 2022 11:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbiIAPMi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Sep 2022 11:12:38 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1849B83F24
        for <linux-gpio@vger.kernel.org>; Thu,  1 Sep 2022 08:12:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id bx38so18195970ljb.10
        for <linux-gpio@vger.kernel.org>; Thu, 01 Sep 2022 08:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qTC2Y70APRJOcps3tf6QOae/fOMCH2muBNa4G8Z6yPs=;
        b=J1TYZkwC0XhQDSfLrkftWdaC2pwGjiDifNnjEa6B86mdUJo0eZRfPaMBgBPzzxGofr
         F3yf0h2RFfn1UocIllVNmkov5IDmsmHAS+/oqBSfSAolxYv6sAb1MpHiL7AHLfEa1yUO
         yvLOzCvHf2tmrljoFBfwLEfMRVg11vAVdq9m2T+kusBJyoomTRhhKFxeHEq5aiHWbcsy
         Prg/gzK2vq10/sIhjXSGa84BIHGYkoiX8GEqJdrbq1Qu1oJhDbBiQiyEQUUgYcLSwJOh
         sP5A9zYPc5h4hrDmyV0RQ9hl5fDfWkD+H71MdExNw1sYta0akN3QuJ5kVeSQCEnBZ6VW
         mbUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qTC2Y70APRJOcps3tf6QOae/fOMCH2muBNa4G8Z6yPs=;
        b=LJJ+uf2RyJ4j2yx2E/iBDxxpVM4g9h2VAbdJkLwdiFgsgF2TMQ27KDyTvOkX1myWao
         eggPZ6LN6vUzIXdg1dniI0Qw6y1WMVdTfJuWpcVU3S47EIXan/c3qsrUk1e5Q4WTE7fc
         Dqu2VblhPRtpEJ27VSVSeCR+mjgZ6A/PlBqQYIIcy36kFt+2nEl4LDzVhnQ4Fj/fYfkP
         b+u5TwlMx6qVh5rrWJJ7fPVNiZz2gKyqWTiNNgJ1EWy8esBCUxxNs7Yad2OJkvn9auqU
         /56CvEziSh09S3ZgwqkbjD5RinN/6wF7MSFAlvobq6eixIRSmmtJEsuxEAUox6LJghFr
         Or9A==
X-Gm-Message-State: ACgBeo1pNbHWqA1JWMrCeYZYhx+QF9A4mzq9L6KNpA02sFewA7Jg8kL5
        2Z7d1RwtpvKaKentYqg9i+niGg==
X-Google-Smtp-Source: AA6agR4ugS5tyTwVwYnuIaQklpVkzkiOpqJmaKPSnCGjhxjT9arcAzMb64uBWCZfCu3H+QzZlAfpOQ==
X-Received: by 2002:a2e:a552:0:b0:25e:6fa1:a6c4 with SMTP id e18-20020a2ea552000000b0025e6fa1a6c4mr9388414ljn.90.1662045155444;
        Thu, 01 Sep 2022 08:12:35 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id b1-20020a056512070100b004947fcf0c0bsm912235lfs.281.2022.09.01.08.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:12:35 -0700 (PDT)
Message-ID: <be6cda7d-28ab-6fe8-e0ee-5e448c7696b9@linaro.org>
Date:   Thu, 1 Sep 2022 18:12:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 0/6] Add Apple Mac System Management Controller GPIOs
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxC5eZjGgd8xguDr@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 01/09/2022 16:54, Russell King (Oracle) wrote:
> Hi,
> 
> This series adds support for the Apple Mac GPIO driver. These GPIOs
> are hadled via the System Management Controller.
> 

Thank you for your patch. There is something to discuss/improve.

> The first two patches add the DT binding documentation for the new
> drivers.
> 
> The second two patches add the core System Management Controller
> support.
> 
> The last two patches add the GPIO support.
> 
> DT updates will follow once the bindings have been reviewed.

...and how can we validate that your DTS actually implements the
bindings? Typical submission includes everything, either in one patchset
or at least linked to each other so we can see the user of the bindings.

Best regards,
Krzysztof
