Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D3D5F62B8
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Oct 2022 10:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiJFIdH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 6 Oct 2022 04:33:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiJFIdG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 6 Oct 2022 04:33:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9158D92F6B
        for <linux-gpio@vger.kernel.org>; Thu,  6 Oct 2022 01:33:04 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j4so1750096lfk.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Oct 2022 01:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0zWyrMkyGobrQx874bTZAA5b8Dexwv4AiQ2OcW+8aGg=;
        b=Y0pbM6ALrzdTBdXJS966/k1eUheM1kRKNqh/1tvMhMtz20fhpmHRsiw6pvOoxXctNW
         BOvA6s/vw9ZZkwgKgecdMPfoK6uk/PUzvzf7Qt1pNdjZfozeBq+sN3iBhim8uXtKa2IM
         8xkSfEX6rWrgBj1a5cyOd0hwQcCRy1DmkwdMSr+GL5CwFcQJ7prg6B0X5RUnIZamT8k4
         YXKtaGipBhk/vf+eL3inX1B8/qpmd8bG24zRG0HXkqlvsEZjHKpf5nGoNOy1rwonqB9k
         E9EHCs7JOTYmMFu2SKhkmDZFrzYKp4qLQeksNjbm8cuAoVg5as2VG/bw7zr2RIYxUgLv
         Lo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0zWyrMkyGobrQx874bTZAA5b8Dexwv4AiQ2OcW+8aGg=;
        b=MxZXffrs8B3PuiiQnin4m0IvSSgEZM2ANXiThWd352uONqDuzQZTXZfQkTuy9iDcaO
         35KtPZuCrGyZLicwrckD9oBoaQGdfa1HEv0eDGTddYRUVPzcCROmb/jAMQwuD9TN3jZV
         /Fx8Bup9AGADDWFCZ15WXBNVh4lZgOEU1cb5h0+cbkSwpzeHkY2f79FBA5lmEcZg7k9d
         8W9vYQm542+0Ld+4aCSiOI09PgnsVo1o3GWj/h0VQDh959YA3DoACKpxPa9n11wQGEY6
         vHDf2wx4/pk1AfXXS0QwDZTgbSZKeKLKvwtODmV0H5FZlG2uDtCEAl8G3asy5S5ShFgo
         y2Ew==
X-Gm-Message-State: ACrzQf22MHrcvrB+hBiIS/jVZgSqLNKcMVmnXhkGLkEDLby0bIAdduTH
        lojVPhROGKg7RX4i7NOjVasLFA==
X-Google-Smtp-Source: AMsMyM5Sz53eIoUkX9ETZyqQ/I4MORTTZlFSKbuF8Cns63ZSpGZzYepD6qvicoYHW8NLGQL4JyEAHg==
X-Received: by 2002:ac2:4114:0:b0:4a0:6357:c362 with SMTP id b20-20020ac24114000000b004a06357c362mr1354775lfi.140.1665045182948;
        Thu, 06 Oct 2022 01:33:02 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i1-20020a2ea221000000b0026c549bdd2fsm1825034ljm.129.2022.10.06.01.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 01:33:02 -0700 (PDT)
Message-ID: <f48f112b-a5d5-e0ef-f97c-a582f856d6c9@linaro.org>
Date:   Thu, 6 Oct 2022 10:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFCv2 PATCH 1/4] dt-bindings: bus: add Wiegand bus dt
 documentation
Content-Language: en-US
To:     =?UTF-8?Q?Martin_Za=c5=a5ovi=c4=8d?= <m.zatovic1@gmail.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linus.walleij@linaro.org, brgl@bgdev.pl,
        gregkh@linuxfoundation.org, jeffrey.l.hugo@gmail.com,
        andersson@kernel.org, Michael.Srba@seznam.cz, saravanak@google.com,
        mani@kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20221005145746.172138-1-m.zatovic1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221005145746.172138-1-m.zatovic1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 05/10/2022 16:57, Martin Zaťovič wrote:
> This patch documents the devicetree entry for enabling Wiegand
> bus driver. The drivers that will use Wiegand bus driver shall
> create a sub-node of the documented node.
> 
> Signed-off-by: Martin Zaťovič <m.zatovic1@gmail.com>
> ---
> Hello again,
> 

Missing cover letter and changelog.

Best regards,
Krzysztof

