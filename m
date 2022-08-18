Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0198F598057
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Aug 2022 10:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242366AbiHRIvI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 18 Aug 2022 04:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238978AbiHRIvH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Aug 2022 04:51:07 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F3698C84
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 01:51:06 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id s9so1067259ljs.6
        for <linux-gpio@vger.kernel.org>; Thu, 18 Aug 2022 01:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=/Nr3N/b08Wb5kyUSKYi2f2bcPXo4wDB4CPFcW61BR6Q=;
        b=Awu6jpGv/ga3S4PuL1zX/lnHplckrKSQFNZDgsD8TuvK1SdfIQX6cFZOdkTI5Ezs/X
         8n3QgGLTaZxsHKJ0ox9Z5WIhIOZU+E03vOTC272gKpDhytLtMGjMiejx1o3eYEdRuMzw
         vnk1I868bQlXDCAaQCHnpd3VtMjOFQfLzfYg3tqgLYYOVeotIUfSgeyh4HyPVhnL2xm6
         h9/rBRvyoI7VzZztQgZzTXQGnN5FP/uKQm+ywnZ4alvUAy4hSrjEaqjdrmLuFntxz/Nk
         zFBqqvYhmrn50pFwxfGgUVicb+CIjXvSv9lHP1vfgOC4OoM3Nd7vM48O92kn1YVsLjzR
         IWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/Nr3N/b08Wb5kyUSKYi2f2bcPXo4wDB4CPFcW61BR6Q=;
        b=I+Qeq+hMDxqQRuCCHn1r7rwtFarjZk5mpWInOjSFnI9FVhkHGQo2i73a9uI3pDyxCp
         1JC0aOpZGqo8G1JnzSYGT8Wzqy7Bo/VUn6QK2dWUpp/O4TKpOfePLotvPDcxiEKmKlyy
         J0N660hYHyvvzhp7PA0E6IP4FfXge/BCYLSw/RTMxtz3mIr5IufYufgzPy9popxLo/D+
         29qNaclqea2njElRS7dLB+vXIpyIrCw4/Lk+IAhDpDcyhqLaP/gdvXLbhHMOqwchZjpj
         p7vMogWg3aOGbNfnUoO4hXDFvWHguQRB8YvF9ocdqJdhkjhmMNB1ZyB+zb4CC0UgBZ19
         hKlQ==
X-Gm-Message-State: ACgBeo0A/Qux2oGo9ei2Hm4aZrKd11DLclfkfptNbikPih4knCiZKU3V
        6a4C0BFfXppzvFHIZrFeivYPew==
X-Google-Smtp-Source: AA6agR7SO5DEvt9w9WtDwfHcrHe4gtZ7WURFZ5LMDiLciB2Lbog4FchBeOzpvJdtKtUSJGaekJqhTA==
X-Received: by 2002:a2e:8092:0:b0:25f:f075:a1b1 with SMTP id i18-20020a2e8092000000b0025ff075a1b1mr549535ljg.23.1660812664914;
        Thu, 18 Aug 2022 01:51:04 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id h12-20020a19700c000000b0048aef1abb08sm135047lfc.297.2022.08.18.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 01:51:04 -0700 (PDT)
Message-ID: <d01536e9-9da2-9580-dbb5-07f7ecfabef3@linaro.org>
Date:   Thu, 18 Aug 2022 11:51:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/2] gpio: pca9570: add slg7xl45106 support
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-gpio@vger.kernel.org
Cc:     git-dev@amd.com, mans0n@gorani.run, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        shubhrajyoti.datta@gmail.com
References: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817085550.18887-1-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 17/08/2022 11:55, Shubhrajyoti Datta wrote:
> Add SLG7XL45106 GPO expander support
> 

Please do not Cc fake/non-existing addresses in your submissions:

Your message to svemula-all-with-npw@amd.com couldn't be delivered.
The group svemula-all-with-npw only accepts messages from people in its
organization or on its allowed senders list, and your email address
isn't on the list.
krzysztof.kozlowski     Office 365      svemula-all-with-npw
Sender          Action Required
Sender not allowed


Best regards,
Krzysztof
