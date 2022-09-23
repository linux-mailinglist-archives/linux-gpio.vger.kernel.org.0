Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59625E8619
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Sep 2022 00:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231981AbiIWW52 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Sep 2022 18:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232598AbiIWW51 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2022 18:57:27 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4830E147681
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 15:57:26 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id q11so1002421qkc.12
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2022 15:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5hrXedaZhIByR6yB29M+ivMZurCH1U2sMTGULyAhbYA=;
        b=XneEoMbPEKVZCLaVF8IpGN89feJsPLB9QPr+PAOPIBVsL5czicrV8Xr/Mrn6pS8ykK
         2Ip6mkg69qcF/RZcC1d9miW5S/5QVQEZH/CBVpiQsHPSbK7bC/5olfuk0SS8XjLMxNKU
         rGbu/8HuuZpq54cPq7IMoxtTYn3AMnRu5b+aNpP7NgN8A7U3X/+/GvEiNXKLTJjK0wht
         sLPb5yfcI5RiUHuC3ipXyXoLIUWTWVAhH8g5X+yFDbc5uPqvZgSlxfqC7VvpOS+OahD+
         Y84XE0uoXYGLMTBH3rneSUm/nSmGQkvGEtAl/Jlj0njoMtJCosCAafVgRtTyiKx+jQkc
         bArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5hrXedaZhIByR6yB29M+ivMZurCH1U2sMTGULyAhbYA=;
        b=DQELlti3dygtReCU+F53BUUaWl7K/ba2RdULxphstDsQSzGLLtO6BCJBfjti9wkK4z
         xogrdVg72Cbtth8e2zBIUOYwGptzQXLvTuaqvoas03Iu2H/ldoFXp0WVi4H/U70gdgXh
         zox9wMIX2VPaMZp2bFAly9f5elDUlO3VxmQIgIdVnKbPXUd0bcApHfOqjKxN4BOzf83Y
         SAoxHhkKA0hMYUchCefiuV/G4L82X36UpcvxIE6WsFhr4xSmMH94Gz0uubIY+OE7d+G+
         0ZG9lxM+vGmUDGtl+Bl2Ff2K9KiLbpdZexl1tTqZs6Uh3Vtxh7wMo4Ax6Q64J9FebV6l
         VfwA==
X-Gm-Message-State: ACrzQf0zuBTazxoeOLDTGpk7UuMwBOEg9tyOzcEJHFzldFWXGZGkbQ/1
        tMefQ7v9yRuqrWyf2ZPzWfY=
X-Google-Smtp-Source: AMsMyM5Z8aCuwg7gr6km5zbYwe3kOoRmYQwewM8HVuRNTZKDU7axwxzIgBipszsBrhdXnCDAj2I+gQ==
X-Received: by 2002:a05:620a:f03:b0:6b6:6513:af63 with SMTP id v3-20020a05620a0f0300b006b66513af63mr7212992qkl.312.1663973845397;
        Fri, 23 Sep 2022 15:57:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n6-20020ac86746000000b0035d08c1da35sm5674046qtp.45.2022.09.23.15.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 15:57:24 -0700 (PDT)
Message-ID: <2f81e3e1-5a3e-b387-28be-c66b25874900@gmail.com>
Date:   Fri, 23 Sep 2022 15:57:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] pinctrl: bcm: ns: Remove redundant dev_err call
Content-Language: en-US
To:     Shang XiaoJing <shangxiaojing@huawei.com>, rjui@broadcom.com,
        sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org
References: <20220923101038.18036-1-shangxiaojing@huawei.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220923101038.18036-1-shangxiaojing@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 9/23/22 03:10, 'Shang XiaoJing' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.
> 
> Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
