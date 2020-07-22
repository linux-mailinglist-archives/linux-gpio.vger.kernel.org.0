Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51714229B3A
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jul 2020 17:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732746AbgGVPVp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Jul 2020 11:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732635AbgGVPVp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Jul 2020 11:21:45 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C932EC0619DC;
        Wed, 22 Jul 2020 08:21:44 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f139so2368847wmf.5;
        Wed, 22 Jul 2020 08:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=APcE0dq9NffscdZqhCykq7zOiZI+MLpwiU+amE/ixCo=;
        b=H04Y+qWavDP+79AZ0wYfzTZY0nZ2U6Vr2mMgwqWQGMVTAJhO01mWw+VnJEnFIi5g6j
         d+Dc4o+NeAKcqGbPJPjmYtWQLuhCP/IzvJ55jQvu4eeIK+1nl53YslvrXWpsyGIp7ymb
         OZD573KORP9179/VXbJ8AWPEq7E6x6cXED1yUDeu5BMN/PiGpYFYahoZjGhRD/rZW0Yv
         +EnA08w8dp08iB+NYlr1qbrqJ8v/w/EpPxxGFCGqgC8N50W47drDEqEFNTlcT9XLjUBM
         u3DuPLtD34PCPK5iOirBpsXvJH3s2gvGiaJjbILYfMerHraw9IZtfuzsy6HGY6a80ljN
         FVnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=APcE0dq9NffscdZqhCykq7zOiZI+MLpwiU+amE/ixCo=;
        b=T1Eijzak44K08MNrD/jjN/0BiZivIfS+btD/yilHAtfDWyxXR/nld7+ykQ7TH5MlK4
         qo1Ti541cJQjZZk7ovOHdIPcnsS4Cm4z4fxvHt5FkIeUCkt//XWQhCfwjeBiz5CRRP8n
         6UejjxcBLIx0aU7ETloAS9dcJHPhVH88W1bB2PJZWoIN7YzYWBSekHiDwL1t+2nUj+Hi
         A/sYtlm7teRg6feoLE/CP8IZqOGlhCmjwRqo55SF/JJhuLJfJHnooFtyfFeQcgjLwNsM
         j66xdH+U7pN6BOrqG9bJYqS7xERyjBd/d02q7yWp9YQcXEiKq+bZikYN9y//dx0x+6uh
         zKhQ==
X-Gm-Message-State: AOAM532lV5dBMBKZYeQk/5E6hKDP5dCAMcDw7C+QnLiCjzOKF7iR4Kw5
        u9vTIkXU3MnDBe3bvvPc6fg=
X-Google-Smtp-Source: ABdhPJxnY3ccClP249C1jjXhVlvCN6U/cJtwqYjECuera/bTvS+XWkZNTW5km1E6Ff/jPK85BYcwQw==
X-Received: by 2002:a1c:96ce:: with SMTP id y197mr183927wmd.86.1595431303576;
        Wed, 22 Jul 2020 08:21:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
        by smtp.gmail.com with ESMTPSA id t141sm42767wmt.26.2020.07.22.08.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 08:21:42 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        wsd_upstream@mediatek.com
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
 <1595416581.5511.6.camel@mtkswgap22>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
Date:   Wed, 22 Jul 2020 17:21:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595416581.5511.6.camel@mtkswgap22>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On 22/07/2020 13:16, Hanks Chen wrote:
> On Wed, 2020-07-22 at 10:43 +0200, Matthias Brugger wrote:
>>
>> On 22/07/2020 05:09, Hanks Chen wrote:
>>> remove the redundant clk interface of uart.
>>> CLK_INFRA_UART3 is a dummy clk interface,
>>> it has no effect on the operation of the read/write instruction.
>>>
>>> Change since v2:
>>> Commit "dt-bindings: clock: remove UART3 clock support"
>>
>> Sorry just another comment. I think we can make this one patch deleting everything.
>>
> Sorry, I don't understand the comment. Do I need to merge them into one
> big patch?
> Btw, if I use one patch, I would get check patch fail.
> ---
> [2020-07-22 19:12:49,046 ERROR] Run check patch results:
> WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a
> separate patch. See:
> Documentation/devicetree/bindings/submitting-patches.rst
> ---

Hm, I think that's a debatable error message from checkpatch, but let's leave it 
as it is.

Regards,
Matthias


> 
> Hanks
> 
>>> -- remove Fixes tag
>>> Commit "clk: mediatek: remove UART3 clock support"
>>> -- remove Fixes tag
>>>
>>> Hanks Chen (2):
>>>     dt-bindings: clock: remove UART3 clock support
>>>     clk: mediatek: remove UART3 clock support
>>>
>>>    drivers/clk/mediatek/clk-mt6779.c      | 2 --
>>>    include/dt-bindings/clock/mt6779-clk.h | 1 -
>>>    2 files changed, 3 deletions(-)
>>>
> 
