Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB79286F52
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Oct 2020 09:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgJHHZT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Oct 2020 03:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgJHHZT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Oct 2020 03:25:19 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE20C061755;
        Thu,  8 Oct 2020 00:25:18 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id lw21so6609660ejb.6;
        Thu, 08 Oct 2020 00:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ggIWyfuMBk6RIEocE2/Vctf1qOpbGaLGNz2DDI1RKQw=;
        b=uHE8Wbup0CIM3eJ/kouB5+KRgrfXOTnZ9ec9Im6DRs/o1QWIDqyOd2d/Cs0w/QFI/t
         mjA7k0MmdF24npFMSz4AKBeSbwNxVthW6C/Tj+21pp3VO+Iz6cXMdZqRstOcSeiPIt8+
         J8oPUSTCsmA5oCl/371oa6L8yQIeakvdE2IWUzLe/wd+WicX5btT/XxeS6K6Jt9tgD9p
         6E0raPiWjDAt8Dmun2jb+br2wnFGFfeVYPN8dhPzOOCPNOjCxgz8P0N4TGH6JO/f/Pzb
         /mOvLohinPNup/4JymI/wN56YHrkFwM6ijcDEkTgpezY9skOZjRtQOCo/KGGeJH2dYMb
         Llww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ggIWyfuMBk6RIEocE2/Vctf1qOpbGaLGNz2DDI1RKQw=;
        b=fiTYpYvY5i7U4exT8A78rERozLIUabC9Q3ZLJlt/gfFCz0gYWMG/KQBmzFpUO2GB2P
         79Uq8dBenCj0LxMUWWnJl8l5etovxZv6MUbbDH21hcm8b4AqEfnbygv2VorcQAmM8wcn
         JLPWfKcU7zl2LrRKwmWvcIHwvzMGP3C0yGTLS5n2XPDsauKMzAa0A5EWJlDz4t7SakSD
         1KLLVg2kEX3cO+aGTgU36UPs1h/1CNxXq8kC44VsWu1TSkW2K8fEP+NNlo8L3Df0k+gE
         SsRsWyeOMHd4Qg8LxXJxXhQdJEtWgln0U1Zf8FlJti4llW8n9UjpsjeuXXNK+rYpA/dz
         4epQ==
X-Gm-Message-State: AOAM531oFfZVe5SpLCGr/I93Hj/iCrJBQ7S5bNiMb4TqvPWxqB26Dmmi
        BirRSTFhoScEBuq+8lpRpyI=
X-Google-Smtp-Source: ABdhPJyAgdoQHy9wC8IC8bDBnduHRYPjKutskcLbTeVUUhKov84Xic82qWyFgjQOprNIMpxV3JPDDQ==
X-Received: by 2002:a17:906:1957:: with SMTP id b23mr7210605eje.312.1602141916960;
        Thu, 08 Oct 2020 00:25:16 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
        by smtp.gmail.com with ESMTPSA id p17sm3370228edw.10.2020.10.08.00.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2020 00:25:16 -0700 (PDT)
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
To:     Stephen Boyd <sboyd@kernel.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
        Andy Teng <andy.teng@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Loda Chou <loda.chou@mediatek.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        linux-arm-kernel@lists.infradead.org
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
 <1599546314.24690.3.camel@mtkswgap22> <1601719607.774.1.camel@mtkswgap22>
 <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2a00b4d0-35ab-d1e6-0b8b-d4e0672e7118@gmail.com>
Date:   Thu, 8 Oct 2020 09:25:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <160212240863.310579.5253840355657757088@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stephen,

On 08/10/2020 04:00, Stephen Boyd wrote:
> Quoting Hanks Chen (2020-10-03 03:06:47)
>> Hi Michael & Stephen,
>>
>> Please kindly let me know your comments about this patch.
>> Thanks
>>
> 
> What's the base for this patch? I tried applying to v5.9-rc1 and it
> didn't work.
> 

Can you please double check. The file the patch touches didn't get touched since 
v5.5-rc1. I tried to apply it and it didn't give me any error. I paste my way of 
applying patches just in case:

b4.sh am -l -o /tmp -n patch -P 3 
1596115816-11758-4-git-send-email-hanks.chen@mediatek.com && git am -3 -s 
/tmp/patch.mbx

Regards,
Matthias
