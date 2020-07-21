Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4C9228BD7
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 00:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgGUWKi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 18:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbgGUWKh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 18:10:37 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7190EC061794;
        Tue, 21 Jul 2020 15:10:37 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id 22so95694wmg.1;
        Tue, 21 Jul 2020 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CUFVApO2b9cQq89aRlwUWU4CPz3+v1mbEwt5LEC0HTw=;
        b=eeU835oH6sxO1TQ86KycNK1CSs80K0J1tpt6xR4n4nqtXH28Ao+UgiVViU5wqEZ2/7
         yPhOwbZ3L4XX82Zt89/SIjF/eVyIxiKGNMJkJYTFUt+5TvHLu2H7+v834tOYB0cl6X5g
         qNsa8gWSsGqGKfcVWvsbPW1lkKLjy2c4iJ6DaLDzQsIBmQxHtQoGqiOjIB06QGh2aT5F
         Di7GFRR7oG8/wbowkjdhFZWkm2Ngx2nHHVYqQr6lp0eaDAadZd1rZ3PLDqSpGyxYoJIX
         tp6SbK+eVoCY25WK8XMgoJW8K0ybpZ6jGv03gtoSDwIF7kB2GYIXIHxHIRxuAP0BFnGY
         W9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CUFVApO2b9cQq89aRlwUWU4CPz3+v1mbEwt5LEC0HTw=;
        b=lbUcc4ColUpg86+z27BOdRtb7D0Asi0vpdQuSwBN94qzXZS6/IolsMovB7BtAaXrKL
         Pzf90RxwbIyybhhjmBnGaTIfjaqsq0chPcjDlKHFSM+aw2mVQtBls/3zB+ejPW+/oGtA
         jz8kyrR6VXbxvrzdENAaaKB+HqGsyN7ErKQnTWcstAhdNKzSOZn9Xox14lAmsaHy6R2P
         ufW2pdH0pI16rLcfvPSiaW4Lb1gOONI0+Mm0bGgTJ3VsfmG2RgHwBWeeIrIwKAV8d6C4
         PmXhwkuQzUmS3BJsT18chJE2X1XXEcN/E9XzfRXoH9g7u0E7zq6SNOzZdjayh/zY4lrf
         hhJw==
X-Gm-Message-State: AOAM531xlo/WzvdudCYw3YmhyWhqyTgqps8hVEAJw/9pd/R5jsBpP2e0
        th//wU0iiWVS1xdpqIVXtGU=
X-Google-Smtp-Source: ABdhPJzTVp965UfG1Qd/JLIYsVZscDi4yz0cLVSD+x45RcP4gzFAdIND3KE6aTyn+wCxsC5KSPuZLw==
X-Received: by 2002:a1c:8094:: with SMTP id b142mr5711792wmd.122.1595369436166;
        Tue, 21 Jul 2020 15:10:36 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id u2sm4771038wml.16.2020.07.21.15.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2020 15:10:35 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: clock: remove UART3 clock support
To:     Hanks Chen <hanks.chen@mediatek.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsd_upstream@mediatek.com
References: <20200721054033.18520-1-hanks.chen@mediatek.com>
 <20200721054033.18520-2-hanks.chen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <22a7a43b-1345-f316-f212-4d956ada50c4@gmail.com>
Date:   Wed, 22 Jul 2020 00:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200721054033.18520-2-hanks.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 21/07/2020 07:40, Hanks Chen wrote:
> remove the redundant clk interface of uart.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")

These are cosmetic changes. They don't fix any bug, so we won't need a Fixes tag 
here. Neither on 2/2.

Regards,
Matthias

> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> ---
>   include/dt-bindings/clock/mt6779-clk.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/mt6779-clk.h b/include/dt-bindings/clock/mt6779-clk.h
> index b083139afbd2..2b5f2354d7eb 100644
> --- a/include/dt-bindings/clock/mt6779-clk.h
> +++ b/include/dt-bindings/clock/mt6779-clk.h
> @@ -229,7 +229,6 @@
>   #define CLK_INFRA_UART0			21
>   #define CLK_INFRA_UART1			22
>   #define CLK_INFRA_UART2			23
> -#define CLK_INFRA_UART3			24
>   #define CLK_INFRA_GCE_26M		25
>   #define CLK_INFRA_CQ_DMA_FPC		26
>   #define CLK_INFRA_BTIF			27
> 
