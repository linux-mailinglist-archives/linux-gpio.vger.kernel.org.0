Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71A3A47688D
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 04:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhLPDP6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Dec 2021 22:15:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbhLPDP6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Dec 2021 22:15:58 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE8EC061574
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:15:57 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id 7so34482009oip.12
        for <linux-gpio@vger.kernel.org>; Wed, 15 Dec 2021 19:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/vd1l1da4L+56BdRKicFSLYhUH5s+2oK991AO1O0D3Q=;
        b=Moen/dDt2GL4Pm5rmYm0JJ3sp/Do+Jim7fbwzHPF2v5FUXZoyBZgT3fc0Ow5Z53o2G
         g8fg9wXMeZ1KhGqFOYfscFqPiLypIfavXYMHRX7bVFWbzdpqXNP92nzQqZsRze/mGdCb
         bMaXmFx4Syr7qlY+dSUDNSHfXg11kCN1uRmjxX/dwrMITGBCUxH+KFbVGQ3ZkYnezKaT
         BrPQmJZ9C9e4cMzG+mCxOQqzzruQUlCtJ63XomrZ6AyAuohoBjw36jOHGrzwUkoMJ+dz
         YlEXnFLr0KFmlh9PkhLFtdesYi5Xq1GmiywP5rXHeofRYMmJ5iwiz6wy98eWBjoKUlN7
         hmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/vd1l1da4L+56BdRKicFSLYhUH5s+2oK991AO1O0D3Q=;
        b=P0FuTensyLgc1WKgT/uRRHEgFDaNRTtdXutAckH01i/0z5Lxh/73KxNhs1tQqacs4s
         HEDEhZERIxHHk4CC4GJIhH1kRAIc3AeSisudtT4Y8CGWTG3D2z17iGIpwXLnzSHZkA0/
         DnS9j2HX4HgON5tmVCGSsBcyW/VHSY6Jub+FveKDdW2AoIUJ1Wj8vRR0sGDKbKPuQJHQ
         /h4V2ZEvnmMYNddGTgZinT7aZ0MQM5a8FjaQA0EOwnaNrnGaqZwEvKEGw1m7tK4RPwYU
         aYKwgPb/EPz4KRUht2FP8NDSnV1riwiUgM3Lz6sDXl9zyTe2yiYyV8yxdOnjl6Re9q6w
         1FDg==
X-Gm-Message-State: AOAM530ICbj0W+//KZ0hVwnncIPCRkD23nMFwwIGPsX/xSbzuZw1YuOT
        XoGK0ipljxKyPp13eKxUZDFJr9jMF7OUOu+ae8EzbA==
X-Google-Smtp-Source: ABdhPJwoPFQNRTk2WxXDFzdGoMtLJK2aSsDgN54l1FfDsqBiFYUMUWemWa48WFy7s+s/gDXbdor2ZgQIn40RGUQvw0U=
X-Received: by 2002:aca:120f:: with SMTP id 15mr2603584ois.132.1639624557318;
 Wed, 15 Dec 2021 19:15:57 -0800 (PST)
MIME-Version: 1.0
References: <20211215095808.621716-1-fabien.dessenne@foss.st.com>
In-Reply-To: <20211215095808.621716-1-fabien.dessenne@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 04:15:46 +0100
Message-ID: <CACRpkdb4_zm8ywUsDUm=ZMG4jL=t-3gQx1sPEWQaFpBr_rRxGw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: consider the GPIO offset to expose all
 the GPIO lines
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-gpio@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Christoph Fritz <chf.fritz@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 15, 2021 at 10:58 AM Fabien Dessenne
<fabien.dessenne@foss.st.com> wrote:

> Consider the GPIO controller offset (from "gpio-ranges") to compute the
> maximum GPIO line number.
> This fixes an issue where gpio-ranges uses a non-null offset.
>   e.g.: gpio-ranges = <&pinctrl 6 86 10>
>         In that case the last valid GPIO line is not 9 but 15 (6 + 10 - 1)
>
> Fixes: 67e2996f72c7 ("pinctrl: stm32: fix the reported number of GPIO lines per bank")
> Reported-by: Christoph Fritz <chf.fritz@googlemail.com>
> Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>

Patch applied for fixes and tagged for stable.

Yours,
Linus Walleij
