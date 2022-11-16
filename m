Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E5462BA1E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Nov 2022 11:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbiKPKwQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Nov 2022 05:52:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238685AbiKPKvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Nov 2022 05:51:35 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD7D532D5
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:40:22 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1142108wms.4
        for <linux-gpio@vger.kernel.org>; Wed, 16 Nov 2022 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbd0MrzSKpoNU15NfmTageL726rc6rPXJTRDLTbRGU0=;
        b=g0bOnt+6OzmHXwVaVOFTmeN9Ewab8z9uyfL3dywjuaCy0KW6O+cKJq/Xee5PhL9gP7
         xSOCPaALlg+g3s5H4TYLryQH4tkMjl+NcN3zIwUWH44/sY8S5havhNBQpmbZnMDy1gJP
         QTb0tt4m8Hdn3BnC8RLbgslT7inEXUGNRNEV7mxwID+43LicCH+JUoh1acJ6h+kJMOKU
         Ya3DluD8+y1JNwNfnHjjoOXwkC1CE+jLsho5K2MulFummRhPT8l2KzRIR8RCfZit2af+
         qR51o0cgByO5Xl7VgP9L8zLcblWEUm8XXmP64jEB8ulMvToOpRMvBTdsdez6xU9euSHL
         OZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbd0MrzSKpoNU15NfmTageL726rc6rPXJTRDLTbRGU0=;
        b=7mjJyvGaqZyn5jegOny7pj8VzHns/rJaLFqpUjyyd8ORRPjyKKiLJcbO66kzw9PspH
         GjofyMf8AM0WElj+eSswDNf2Y7oxWr9MaznKdffx29J8ZPj6+KX8yD88i83h/65S76Tk
         ctWcbX2KLXyEo6gD/IzH6WIEM/+2zwa/qqkBBQE3bJR1LBdITLDenIBgad95YpfQYnl9
         uB5bzl7EcXHWxpb8K3x+6L1UgYG2xsEkZHK+VXB2K4vnAGAsswzj7wYQZEq7CM5ncnA5
         YMqih6hbuji0GR2Rq33xtCOXYPv9TWgNJo4tIvpiiZwB0F11JW8fDJ5PQ9TWl3SRL/l8
         8xUg==
X-Gm-Message-State: ANoB5plkN70QTiiepRkfWISUKd6ckJumOrwjdOX8TCYKyEnKIFtfNc/s
        MLEpFD5zN1A1pVhmh9dIQRa17g==
X-Google-Smtp-Source: AA0mqf6GNR8Umv3d/VtvvCibBIKvRpTTDHJaAMEsWGrqwmcS/SdMwCN4mFX+B1kw4/w+xtNwrH0kVA==
X-Received: by 2002:a05:600c:230d:b0:3cf:eaf5:77c6 with SMTP id 13-20020a05600c230d00b003cfeaf577c6mr1646635wmo.56.1668595221402;
        Wed, 16 Nov 2022 02:40:21 -0800 (PST)
Received: from [192.168.1.166] ([212.228.7.114])
        by smtp.gmail.com with ESMTPSA id n10-20020adff08a000000b002368f6b56desm17382639wro.18.2022.11.16.02.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 02:40:20 -0800 (PST)
Message-ID: <05f3c105-12f8-1fd5-0e6c-1ab7e24a01df@linaro.org>
Date:   Wed, 16 Nov 2022 10:40:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH RFC v2 0/3] pinctrl: add ACPI support to pin controller
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, mika.westerberg@linux.intel.com,
        rafael@kernel.org, linus.walleij@linaro.org
References: <20221115175415.650690-1-niyas.sait@linaro.org>
 <Y3PWjZb9Jci1oXyM@smile.fi.intel.com>
 <3766343a-ce40-10aa-99dc-2ea94bc1ffbd@linaro.org>
 <Y3Pexz7tLrAP05uY@smile.fi.intel.com>
 <c9eb64c4-4cb3-b25c-df04-97da24a595fd@linaro.org>
 <Y3Sz32+4uuynGeAy@smile.fi.intel.com>
From:   Niyas Sait <niyas.sait@linaro.org>
In-Reply-To: <Y3Sz32+4uuynGeAy@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 16/11/2022 09:56, Andy Shevchenko wrote:
> The GPIO to pin mapping is done by GPIO ranges. This can be made up in the
> driver or, IIRC, in DT (so in ACPI) by already registered properties).
> 
> Not sure, why you don't use them.

OK. I might have missed it.

In DT, gpio-ranges property is used to describe the mapping, I could not 
find equivalent property in GPIO ACPI properties - 
https://www.kernel.org/doc/html/latest/firmware-guide/acpi/gpio-properties.html

-- 
Niyas
