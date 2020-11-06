Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E36F2A9717
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Nov 2020 14:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgKFNkn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Nov 2020 08:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbgKFNkn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2020 08:40:43 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6F7EC0613D3
        for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2020 05:40:42 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 126so1961269lfi.8
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2020 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JfCJQ0jO5eraFDJbfYizUOVGWnEdmH9dyGuSSJLkvIw=;
        b=W9caSxE1LFwmaV36thpbhx25S8CmHaMDJztjs2sJYmrOs3KwLI8SmDCv/KzE1u8Kp1
         0J7/gWiX8hSRB7kFATEZR6NZS05ooJj3LxmWxh5FMqoF1IfZrnJfeq8GNvYUivZtD3he
         oZVCrBqwPhpB5NeWR9YZqcmtu+71j/NYe5UZW+8Mt2MEXlddTWqFdGdH/eQmrFczPHxJ
         FWuMhj2cD744AvRU7RDD1xhDM4jhs+OVwZhwnR2qvtDIIp6DSkGJ8I1l0fEWYfti7t2B
         tOKxCTQCnAZa/XYxdl1+oRSk/P057E0JWqYJG86FgoWxzygd6R8CKuAPgFfLCtpRvEOE
         Nonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JfCJQ0jO5eraFDJbfYizUOVGWnEdmH9dyGuSSJLkvIw=;
        b=rI4A5SA/+9836G4xT21Q4ltVhxzfpYV8CooAaERsS60pXfpO9zgPGUdQSnj6+m/SdL
         rLFI9WZd5IXo0iHGqK6bPeOt4sLUWYCnYbs3Y4n9WIzSdmkbqMnScGMsjqYx4LnM4QMn
         Gnru5SK5RXhwhZY9at7MM44u4Bbagyab0FBWbx0QMmFyaZbASYplPcdpv1ny+yUxevLj
         CVUg5uZnLlxIGBn/+YaLWoW31pQxxYKH8a8oR09G6nlQyl4e5nEq87OACnL6wnzfCqW8
         vxCtsp+VkXLilJs+yRxm1xO9bMkekJz4QJ/JaPy4Bcu9cXnqYXkQ43AWF0TQKirvP7tM
         NC6w==
X-Gm-Message-State: AOAM533dDlzNwM2G7K/7YLaBrceGZpO7I1nGqPpevkgyDxnGsTlhv1IZ
        +UJtVeWNcOkVfTBxqdWasMVvOA68jrpD18teJlD5EWj+mqBZjw==
X-Google-Smtp-Source: ABdhPJwZytu/TucMs/LzjMgrHms4raPSqPz486Urbgq99iCqReLz35olpz8fmr6pdMYLedtRThpCSPblGeiM1QLNkGQ=
X-Received: by 2002:a05:6512:3225:: with SMTP id f5mr871293lfe.441.1604670040988;
 Fri, 06 Nov 2020 05:40:40 -0800 (PST)
MIME-Version: 1.0
References: <20201016204019.2606-1-linux@fw-web.de> <20201016204019.2606-4-linux@fw-web.de>
In-Reply-To: <20201016204019.2606-4-linux@fw-web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 6 Nov 2020 14:40:30 +0100
Message-ID: <CACRpkdbjp87VH0Jq8SCtcMs1xaaKy3P+DPzMN8J=cuDad-YSvw@mail.gmail.com>
Subject: Re: [RFC 3/3] pinctl: mt7622: drop pwm ch7 as mt7622 only has 6 channels
To:     Frank Wunderlich <linux@fw-web.de>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 16, 2020 at 10:40 PM Frank Wunderlich <linux@fw-web.de> wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> mt7622 is reported by mediatek to have only 6 pwm channels
> so drop pindefines for 7th channel
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

This patch (3/3) applied to the pinctrl tree.

Please apply 1-2 to the ARM SoC tree.

Yours,
Linus Walleij
