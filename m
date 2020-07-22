Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D6F2293D1
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 10:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgGVInT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 04:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgGVInS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 04:43:18 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8983CC0619DC;
        Wed, 22 Jul 2020 01:43:18 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z15so1046598wrl.8;
        Wed, 22 Jul 2020 01:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wjB5ELp9SHAf9SrbqAcXBLR0Nucf1cmk8PLR4YQ6EeE=;
        b=ILgCH7OVE1I2wwwPOX+7NQudT+l7/ZlhvlAf2Wxc+ALPOdpvxovZVdBQnKDv4VvSOX
         WeKNWKbs6o41dVeiDf1bHgAM+FhsHf5ijbZnbipChAvemxTzKPiQf0ThMl/3Zg67x32f
         YPJF15cSwmSj7JPKUDfnHxj4P0QGdiDgQtRZh3mzOAWBbKcPluLSJXKEl9vlyNRdk0Bp
         iO77Mv5K5Vst6unlftQXlcONA8EM6WRUvB4+9NMBIuAVZJx5Lm/j7PU1OmNSz7DpGfIi
         C9FMKzrLXZeEsXq3GDm9z3Hnpv+ZjohX9kD/HP9YLzjasxAgbSWD7X1jyZrp3MQLP4kh
         QmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wjB5ELp9SHAf9SrbqAcXBLR0Nucf1cmk8PLR4YQ6EeE=;
        b=shI9NVscmPFDycT2F3OCQB0/S7L+SIamVZTh+HoU5Ybl4cBVqajPpAOOVWn02KEK5Z
         OF9HojNmUGZHMZSvK1xtv1DLSqT1+kxHd+j1gNbcZZyrq8Db4yOtjHUL7o9npHvBy2s0
         QzEPGCq7p6oiDhuXAQ+ZVTaIeNxC2fk6KFDkb3JIrufS+iAnNw2KQfpx3mLjSgwzdmZ7
         uEcGMEK8NCmTm0GwZeUMelMA7mVFnPSx7HL/oXzysB/dQBxkneUoaFpbHvijMW331VZU
         QilgohaAE9q+Wl+hkwInNfSfbZzry2YoCfDk8pASnwlRVPgrgTQA3ANSi7w+zPskJd4l
         w1fA==
X-Gm-Message-State: AOAM530MPHkhHrn6PRUaqq472a3meL/C5A2zUuPXNm8KvKWqgQ5uX2Rf
        GvOi4vZcidu8oxs7UkWrz0Y=
X-Google-Smtp-Source: ABdhPJxlWiEov15iy9/riqXA7B2hI67oGx3zp7/BbZOGyfUGYQf4x5XHJFdL6u7mY1E1itglTCxrcw==
X-Received: by 2002:adf:f18c:: with SMTP id h12mr28847223wro.375.1595407397275;
        Wed, 22 Jul 2020 01:43:17 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id n16sm6255231wmc.40.2020.07.22.01.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 01:43:16 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
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
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
Date:   Wed, 22 Jul 2020 10:43:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/07/2020 05:09, Hanks Chen wrote:
> remove the redundant clk interface of uart.
> CLK_INFRA_UART3 is a dummy clk interface,
> it has no effect on the operation of the read/write instruction.
> 
> Change since v2:
> Commit "dt-bindings: clock: remove UART3 clock support"

Sorry just another comment. I think we can make this one patch deleting everything.

> -- remove Fixes tag
> Commit "clk: mediatek: remove UART3 clock support"
> -- remove Fixes tag
> 
> Hanks Chen (2):
>    dt-bindings: clock: remove UART3 clock support
>    clk: mediatek: remove UART3 clock support
> 
>   drivers/clk/mediatek/clk-mt6779.c      | 2 --
>   include/dt-bindings/clock/mt6779-clk.h | 1 -
>   2 files changed, 3 deletions(-)
> 
