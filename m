Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065594E280B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Mar 2022 14:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245352AbiCUNtc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Mar 2022 09:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238525AbiCUNtb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Mar 2022 09:49:31 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C31E19C
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 06:48:02 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r13so5731638wrr.9
        for <linux-gpio@vger.kernel.org>; Mon, 21 Mar 2022 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :references:to:from:in-reply-to:content-transfer-encoding;
        bh=K6gn7K/oDvR2tMKBsIH3O1Fiq3uY0RKT+jEpr8NQMR0=;
        b=Uf7AQRiID/O85t2ET1RLAMeeiXwxn2g5xC/XmmWavfxxmXbxhx1ebDnb3g0Cty7RY4
         rqZCxs3MWhtiI0kFuiyiRMTAzA7qIdXx8Ef1+r6lJNOC8L0OkmOkJqO42xpJnI4dtCYh
         IcIXoBuwrqbYw5+ICN8+hC6gZE2hy6WKE/Eo3MYywAnf5Cb0qCSMqzOxhAl5SUXY+SJY
         ECWMouW9UN7dXpTcMRUfFiNu09DN/H0W7OZsOz3BqIAPUHyZXbzzQ1hvKb1xUTC07gzB
         jpHnj6SOi9OdNzLe7L3w/olsLzBwiSR9tCsSG98L8yfsQqYRaJ6SED1OvjTIiq2lfpbD
         fONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:references:to:from:in-reply-to
         :content-transfer-encoding;
        bh=K6gn7K/oDvR2tMKBsIH3O1Fiq3uY0RKT+jEpr8NQMR0=;
        b=fisGFtS9Ry6T14/xjfazZLvlPX0sN6oSs2cQJDkJTkBVuazicxA0u7n7x/ammmkQxi
         UOpdRt6ghs0H/68QkokAxeUO8t5vaX+CYGi4bf3JEm1Pq/MhAOKvp50g0qpVAFzDtOA4
         JkxdPm3FtxusvUyaaY3IiYHAi+VypBEaaojQ2/JHQwyJ6G5Pe162YKjGWuRF1dABisTJ
         Lx6OPmA0IFF8rzFkd3U09q/aPEU5LHZ3lFXzu/l6FM6hK4X/UEDUaPeLb/upwj9aWwMk
         gzdjDs/w8utszxXCNUQCn5PK4vGe9IESpiUyVHhsaudHk4NiQQ0/miQfq6YvHWK52bQo
         rPuw==
X-Gm-Message-State: AOAM531MYDDxQ9KXm/7894yxTyBcga2kd9eiZcfb/ztelqjqbMGyyLX5
        GyNXfJDApmhzWEp0Z/ZMOV6WKBvvPqIm/g==
X-Google-Smtp-Source: ABdhPJxhxfEo15EtzdFQW0R6euYF25knp8uRrTt0XvJbBaYSBkdzViYC1+7G6FA/M21xYKnjtgCALg==
X-Received: by 2002:adf:b645:0:b0:1e3:bab:7594 with SMTP id i5-20020adfb645000000b001e30bab7594mr18565196wre.346.1647870480924;
        Mon, 21 Mar 2022 06:48:00 -0700 (PDT)
Received: from [192.168.1.31] ([90.61.176.186])
        by smtp.gmail.com with ESMTPSA id 189-20020a1c02c6000000b0038c57df82aasm14295248wmc.20.2022.03.21.06.48.00
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 06:48:00 -0700 (PDT)
Message-ID: <33b30df9-3763-7ced-88f9-3b6e32ae236b@gmail.com>
Date:   Mon, 21 Mar 2022 14:48:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: gpiod: Set pullup for Input Line
Content-Language: fr
References: <ab3240e5-df61-cff4-ebba-f6a7e5d99f52@gmail.com>
To:     linux-gpio@vger.kernel.org
From:   Hans Kurscheidt <lve0200@gmail.com>
In-Reply-To: <ab3240e5-df61-cff4-ebba-f6a7e5d99f52@gmail.com>
X-Forwarded-Message-Id: <ab3240e5-df61-cff4-ebba-f6a7e5d99f52@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Alex,

sure, device trees are eventually overwritten w/ new kernels or "as is" 
on a new device. Hence my application won't work on a new 
installation/board, because it needs certain GPIO input pins w/pull ups. 
DTBs need to be disassembled and re-compiled, which is not for the 
average user to install & run an application!

RGDS

hk


Am 21.03.2022 um 14:34 schrieb Alexander Dahl:
> Hello Hans,
>
> Am Mon, Mar 21, 2022 at 11:43:45AM +0100 schrieb Hans Kurscheidt:
>> Despite deep searching, I cannot find any information, if gpiod allow
>> specifying pull-ups to input lines and how to do/handle it.
> This is usually something described in device tree. Or do you have a
> use case for changing it at runtime?
>
> Greets
> Alex
>
