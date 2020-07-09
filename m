Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4A421A4F0
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 18:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgGIQgI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 12:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbgGIQgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 12:36:08 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE8CC08C5CE;
        Thu,  9 Jul 2020 09:36:08 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m26so1505630lfo.13;
        Thu, 09 Jul 2020 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hcIcw3vIFIIqOlNLiBPfaOEOm7u6K/228i2wplr1dBk=;
        b=V84W7Vc1jDhuxWPhLzfvPMUmAt+49OsJrxRktyWHYvg6+0lgrUNtM8M4zwhdjCLDXz
         2EhM7vzLc98fLDE8SOX//oMUMwGbvXSUg1SvcGeaCN06FQNO5xE8RCKxp4zPzYsvK/Ub
         LOqlQiZUcvrj1t6l/WMchBAS1WYi2Qb3TPsraGQYTg6mLMTGyBoRoP6zCbK632Palvlb
         F18AlbtrC8jQHfl0/NO24BrH1k3dvq/kdDTRXCQqxGuqo1MP+p8Tw2tXe66InfWXU/rL
         UfnTXHY7MAzksWSw+8JZwpgtJxA6MExaaTWKLMZcegypUHOMZclsGgInmam/WgfYGbL4
         azgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hcIcw3vIFIIqOlNLiBPfaOEOm7u6K/228i2wplr1dBk=;
        b=npg1kBH3H8kycqHnSm0EMGXv3gr+Wn+XnJnXTHBAS596VjaKKZr3CBWwizAQ1cF0gI
         nwutKO+M+6zu5Z+DZVTww4movnCfC5g0IDo/VZ2KcFrRB8tzidgBSbnR+2/vEHOQqch7
         IF/QJ2Rvsps/YZPJeDfTOpcKILxRQIQhH0rN7icuDruNP5RJ47C1ptJxVbd8Xl6ym9N5
         FCwyRgQx7xcpbe5bYNvElpG+h3nM3+aCz0XmKQLZikw3bQ4LN+bM/qQEN5/teH+kEvxW
         hwm3pu2lBH2heZ5qqJ3k2nFKnnATb1KEqqeLaurFmD00y9w1IU6OFDs3ysXt85dtWYp6
         1Hfw==
X-Gm-Message-State: AOAM531DU9DDI2pfDfOpceoeZsQ+pNRIAsU69xitdkf+xqvPMowYrtOL
        YVSzeJOY6apZpIhgG39b2JGXufL/
X-Google-Smtp-Source: ABdhPJxxVjnrs9wMWMphmJYs/yYhcfX9aaNR/yzIXoPJ7//uu00YdKnQR/QagWC+5hbj1nUcEXNIZQ==
X-Received: by 2002:a19:a417:: with SMTP id q23mr39715338lfc.181.1594312566150;
        Thu, 09 Jul 2020 09:36:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-79-162-105.pppoe.mtu-net.ru. [91.79.162.105])
        by smtp.googlemail.com with ESMTPSA id v20sm1098646lfr.74.2020.07.09.09.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 09:36:05 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] gpio: max77620: Fix missing release of interrupt
To:     Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200708202355.28507-1-digetx@gmail.com>
 <20200708202355.28507-3-digetx@gmail.com>
 <80f4d1ff-8096-9060-3cf0-a59448866c40@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <89592ba5-f62e-3145-6f0b-9289f80a3171@gmail.com>
Date:   Thu, 9 Jul 2020 19:36:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <80f4d1ff-8096-9060-3cf0-a59448866c40@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

09.07.2020 17:57, Laxman Dewangan пишет:
> 
> 
> On Thursday 09 July 2020 01:53 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> The requested interrupt is never released by the driver. Fix this by
>> using the resource-managed variant of request_threaded_irq().
>>
>> Fixes: ab3dd9cc24d4 ("gpio: max77620: Fix interrupt handling")
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> 
> Looks good to me.
> Acked-by: Laxman Dewangan <ldewangan@nvidia.com>

Hello, Laxman! Thank you very much for taking a look at this series!

I missed to add the stable tag to this patch, so will prepare a v4 with
the corrected tag. I'll also add yours acks and Andy's r-bs to the
patches. Thanks!
