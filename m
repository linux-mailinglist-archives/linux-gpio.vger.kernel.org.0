Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013FC229B40
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 17:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732699AbgGVPWh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 11:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbgGVPWg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 11:22:36 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A3FC0619DC;
        Wed, 22 Jul 2020 08:22:36 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f2so2292343wrp.7;
        Wed, 22 Jul 2020 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p46aNpFOGjdCmJUYCpOTrNt8oHQJcuNdSnoUklPY2KU=;
        b=FtSpJ5Cf7uEsr3PCdVXu/ThzroZELAAgxI5XSHKoHhPqICq8j7jJm57MTCQt/FoVJR
         tOUXhYlpE7K4qq8ptOgZWxa1KAKeUT3SXzUgFVP443/7qmqQdjIGNGUeDopmMejdHKdm
         Ss8ULTkAr23R77WM2EMkEF/XKwgOcxJaUs80MTlL2h0028lTEleLHa3fHziIFjmR+kxm
         FYF75ivaIGSyjuGNbKfC5o1axi14RdPHy49kY/7213SQC7skXYE2SpWmY4CcG9LwAnGj
         Kj0Fk1dsl+5hlk9VTa6ksYbSZRWbFZRZ3SIEl2RzvkmVkJ1nxWJQBV1oGNMBM8XvBN8V
         wW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p46aNpFOGjdCmJUYCpOTrNt8oHQJcuNdSnoUklPY2KU=;
        b=P0W6TskF0zVLrHf/Lf+pkiRftmCo5aeFazOwogGANC4/nPi321gg6An71Zt1pg/Hkn
         kgM9v3E8aOIWBGzx9G849mYxhg+C6YBTJzOjagDpGMcx59xOKuKBWPMgx8IA04ZsmwyS
         E9KgZjRN8Qhc9XtSLok0zNdBezxIjJ9/t/qyLRXU3ZRT/QFpEGRtEA9S1zEbLs4zUhrb
         IO6dENNeGzFZtdnBAzhCU/q0lt+qGrRUFuOFWpArMTvpHzOURPZGOXLvc+rmSs4k5cSK
         DaG1uT4x/4+FOimqo0fmd2OLIVABNZOdS91NOJYb0jN+sv2MWiBKhOYMHF3JidqKcnBp
         6Z7A==
X-Gm-Message-State: AOAM533t12RwWt/Uk5P+o6mcwif+hV0YsRMmxr3ixnM/0SnmLLSpGF8x
        5TTSySvP5N2Jk+KujTd4sZc=
X-Google-Smtp-Source: ABdhPJzfk+sntvb8MTYNW0SLffM4YqzF4Kt2Pn9rPi7wN6oH604KA4hfxmQUs1CCPXdjrb/zEQoDHA==
X-Received: by 2002:adf:d084:: with SMTP id y4mr69504wrh.161.1595431355050;
        Wed, 22 Jul 2020 08:22:35 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id y11sm271524wrs.80.2020.07.22.08.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 08:22:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] clk: mediatek: remove UART3 clock support
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
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <1595387397-13110-3-git-send-email-hanks.chen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3f326326-ca93-1d4d-3a5c-0821aa97fd71@gmail.com>
Date:   Wed, 22 Jul 2020 17:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595387397-13110-3-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/07/2020 05:09, Hanks Chen wrote:
> CLK_INFRA_UART3 is a dummy clk interface,
> it has no effect on the operation of the read/write instruction.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mt6779.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
> index 9766cccf5844..75f2235486be 100644
> --- a/drivers/clk/mediatek/clk-mt6779.c
> +++ b/drivers/clk/mediatek/clk-mt6779.c
> @@ -923,8 +923,6 @@ static const struct mtk_gate infra_clks[] = {
>   		    "uart_sel", 23),
>   	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
>   		    "uart_sel", 24),
> -	GATE_INFRA0(CLK_INFRA_UART3, "infra_uart3",
> -		    "uart_sel", 25),
>   	GATE_INFRA0(CLK_INFRA_GCE_26M, "infra_gce_26m",
>   		    "axi_sel", 27),
>   	GATE_INFRA0(CLK_INFRA_CQ_DMA_FPC, "infra_cqdma_fpc",
> 
