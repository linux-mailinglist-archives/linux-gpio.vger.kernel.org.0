Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E129B68D4C1
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 11:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbjBGKsU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 05:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbjBGKsT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 05:48:19 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB7715C86
        for <linux-gpio@vger.kernel.org>; Tue,  7 Feb 2023 02:48:18 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id y1so13123444wru.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Feb 2023 02:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gg49IFqpeAQfmBJkAA5LrY+aWex44/SIMd7NgBZZbz4=;
        b=dYmTa0QPSro6wtLi7pNka2KzARdj8cvuxbMeQEvJHCOANYTVE+carE6yEKEiiQLpMI
         LEnnVSpbqEc7E0DM7RY7HAW6Hw2csImOVVAUlOgn+zHzet0sZQx+3x4uvjCA6W29kNJK
         5+nplgZ2eehgB/mG4SKIrncNLR9iW9MCjBmK8evY7ONUfbyApI0v8QInDHtQo4yIQtd/
         5nzzQCLljqNl05OL6V9ZoSZDUYQgUhgjuSsYFeANCkcmXSTFIWjnuamGqTUwfBSllVbE
         byhsn8usvURz8ZApivQN4EEEgVSNRxP01h5oTcXUXo3IQ1uy+ioC50tMvJE59rKcj2yb
         XrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gg49IFqpeAQfmBJkAA5LrY+aWex44/SIMd7NgBZZbz4=;
        b=5BFdo/2tedEndlCLK3TtiK6oupab/vtrL7RmL2PcWjyMAZSm0yHBSQiYfEvuj2BTHR
         LGur7ztzOOunSsfYHZBVoSEcFJ13fWFSn9ArH9RlgYt5IxnkADYMq4QuisRTGI62WWWw
         rz4Iy4ulVDdCDwB4sVlSBqiYAJalQSZMqtaslFtAisQexl6jJYgPGFLZfalwOoh1BYbh
         y2F4s8vanaQPDNiajr//MmVK3LPxwPDICwVgX3jlbWim4FDSGpg0uX8h4ojlZVeFw6AU
         JTP4F1wm5ah1vMAo8gS0cr/H7s0aHqlk5/B2StaYPFD90fy4k+3BwL5dekHULZUTIIx2
         PoCw==
X-Gm-Message-State: AO0yUKUQjEKcZJKD5jmQRsjjSR7UX81HqvIW4mSSc6EhCNxqmtGdkKes
        g5vyrlQZ5DVKcB1+cP5fjOWd9w==
X-Google-Smtp-Source: AK7set/flZ0uI3S5H+JwH+3pLf2osZRpHKwRRzyi4liPq5ZAx+hl5itxMz/9YuHCnjw5HUvz4BJ/Pw==
X-Received: by 2002:adf:efd2:0:b0:2bf:b113:8ae2 with SMTP id i18-20020adfefd2000000b002bfb1138ae2mr2484681wrp.15.1675766897172;
        Tue, 07 Feb 2023 02:48:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d8-20020adfe2c8000000b002bfe08c566fsm11022477wrj.106.2023.02.07.02.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:48:16 -0800 (PST)
Message-ID: <6a52c20b-0fd3-6970-2171-0dbbb4ba4f46@linaro.org>
Date:   Tue, 7 Feb 2023 11:48:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] dt-bindings: improve wb,mbl-gpio binding
 documentation.
Content-Language: en-US
To:     "Leonard, Niall" <Niall.Leonard@ncr.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230126-gpio-mmio-fix-v2-0-38397aace340@ncr.com>
 <20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com>
 <4df3ec7a-e4af-89bc-9eda-21150395a935@linaro.org>
 <1aa27ad3-d6a3-6ef1-5e56-36697583988c@ncr.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1aa27ad3-d6a3-6ef1-5e56-36697583988c@ncr.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 07/02/2023 10:49, Leonard, Niall wrote:
>> Drop all examples below, they are not needed. Actually even these two
>> above could be combined as they differ with only one property.
>>
>> Best regards,
>> Krzysztof
>>
> Thanks for reviewing. I'll make the suggested changes.
> 
> You might note that I added myself as maintainer of this file (as it 
> wouldn't pass the dt checks otherwise) but that can't really be the case 
> going forwards. I have only converted it from txt to yaml. Who should be 
> the maintainer ? There was no-one listed as maintainer previously ?

If you are not interested in maintaining this binding, then as last
resort add here subsystem maintainers (Linus and Bartosz) but it isn't
really correct... just better than nothing.

Best regards,
Krzysztof

