Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4AFD132788
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 14:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727658AbgAGN0U (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 08:26:20 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46641 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgAGN0T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 08:26:19 -0500
Received: by mail-lf1-f68.google.com with SMTP id f15so38829224lfl.13
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 05:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9djqwGIJf2I22OzfnRj3IuEtZ6zVvwdwNk4Hj6ZFA70=;
        b=qehfjqnlIKGhemdvcDzaHIWgPnMIKeEq9JYcoVJcdsSy8Wat4sbe4iABBcAk+56lCq
         n/niykJ5zW3gXIkUyKPDN2QY7xguV1vGofNnIaCmEItNPGFPAFKzl6aFKSLFUfGlhEBc
         h83Je2A3rbiMS+3FWD3mF39kdkdMn9H0hF4C91J4sYY3P9vSbioZkYKUH/HwI8hRXNdg
         dUWKMOcIYgJ6ExKWgP4K1ESqWNneUFp7hc00BfWmQzYO9XUdON/YZbPX4w2Ecr6ckL1J
         j+Q4ONZ5p8qiSABW176nzeVQOcpfF9kkhO5Kr12axgHB4S9HbTwYXs7drtn3eD4Heeu/
         UmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9djqwGIJf2I22OzfnRj3IuEtZ6zVvwdwNk4Hj6ZFA70=;
        b=WJqsO4smt9di29RPfo1VrDAhEG11Kiqdh4xGY/pBrZ4ijHMTf2GLbcnh9/KJt2KG4K
         niuMVFbC+kgIt86c7BsA7JKPwdaDYMCRcykcKt5cmG5ypEZ72RDxVv+VcMvQD/iF1iZo
         Fp4OTKBFJEQ/0mDKgTUhvW8H3J8oCopvCd+8teqTlqcYi9SVxFQBhbRs9eFt1vHc+fcd
         IwUIisM9kVhWy80cUW+aeifrlhmbC6AdRPDjAbgsn/WrVkYdToz+7uVxQguSRa7eMMrD
         gxdNGUk0yof/gMDXd4Nm6XRuKf/63GIKLLUfd/UiskS9ae4Q3xyQyDrPG7/ZDliTJzdC
         142w==
X-Gm-Message-State: APjAAAWp4TuHOVHAIrEAnWlKhnYdRY5eawHwurt+Zc37EczpXYzpt58q
        3TKlojPpT/SMYUpcY8vFbTKO13tL7b71yjCrZfPDbQ==
X-Google-Smtp-Source: APXvYqzkfn0LApP777P/NTsWuXQs9WqemFpwgDX6Y8xe92X1MAhfleO+4i8GW0Pi/uidnD4K7AZauJF4tdGd9SZmZZc=
X-Received: by 2002:ac2:5c4b:: with SMTP id s11mr58785651lfp.133.1578403577691;
 Tue, 07 Jan 2020 05:26:17 -0800 (PST)
MIME-Version: 1.0
References: <1577799707-11855-1-git-send-email-light.hsieh@mediatek.com>
 <1577799707-11855-5-git-send-email-light.hsieh@mediatek.com>
 <CACRpkdbto2goahTjzozi_LXXo1QNUTV1wm_rwoFOTcb36w0jkw@mail.gmail.com> <1578399400.16092.14.camel@mtkswgap22>
In-Reply-To: <1578399400.16092.14.camel@mtkswgap22>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 14:26:06 +0100
Message-ID: <CACRpkdYEq4FR07LyUSXRzPuQ=HXox7FJm+ABww0hvCYbHmQGkA@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] Backward compatible to previous Mediatek's
 bias-pull usage
To:     Light Hsieh <light.hsieh@mediatek.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sean Wang <sean.wang@kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 1:16 PM Light Hsieh <light.hsieh@mediatek.com> wrote:

> Use of "bias-pull-down = <MTK_PUPD_SET_R1R0_XX>" had already been
> described in
> Documentation/devicetree/binding/pinctrl/pinctrl-mt65xx.txt.
> Previous MediaTek chips using pinctrl-mtk-common.c had already use such
> binding. This is so-called backward compatibility.
>
> Besides, according to
> Documentation/devicetree/binding/pinctrl/pincfg-node.yaml, bias-pull-up
> and bias-pull-down can have an optional argument to select pull strength
> when supported by hardware.

That's right, I was wrong about this. This should be fine to use.

> So, I think the propose of using "mediatek,pull-up-adv" and
> "mediatek,pull-down-adv" is not necessary. However, I fail to stop
> upstream of using "mediatek,pull-up-adv" and "mediatek,pull-down-adv" in
> pinctrl-mtk-common-v2.c.

Let's see what Sean says, I am fine with the patch set in general.

Yours,
Linus Walleij
