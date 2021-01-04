Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05BD02E979A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbhADOsu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:48:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbhADOst (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jan 2021 09:48:49 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C40C061794
        for <linux-gpio@vger.kernel.org>; Mon,  4 Jan 2021 06:48:09 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id 23so64804626lfg.10
        for <linux-gpio@vger.kernel.org>; Mon, 04 Jan 2021 06:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nG2AjKleZe/MMg/+l3MttP/gNqHREnKnr0A94onw/qQ=;
        b=mrHPn2OLOi4YME7VPJwM1Rx1e/Q264762rjOvhewz3zu6B+GVeVIs+U9nhANj6GWXD
         ENlFBRHOhRucQZ/S6Sxmimwn1/NHvCzrVeevg0idAbZb/4y2KFyunTGygGvuaPab7ANB
         mJd5/YUzU8OgAa4X5X/mH5pRltea0sfjplVpNpAY8MVJZzhM8P5kYzR+gmnMh9HyCkoC
         NA9lOioDiJtGUhRGK4o8OAOOicpcpstztggK6H5VeD8k2b2NgX/TN5IViM1rcEkVQl4j
         Y0S5Sum0sXxTBKY5Gsep8+24gREX/IsNqxeQ3UJJruthO9rkeu4VoYKDGSYLYwqh6VR2
         LKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nG2AjKleZe/MMg/+l3MttP/gNqHREnKnr0A94onw/qQ=;
        b=i+d3GBids+6q2pPSQ8Mv971dKHWY/ZafGfrBdcuXrG0JncZ/Voywx6pH5eVsYddtKC
         wSfHXO1nvMMIaPsIbJFSzOTV2Rnc6CfaI1lKnUAcB6g6cBLggc4OjiZTbbOfvYuy61pv
         N8+fGZzk75T0yU3Aqm6HQ7DviFtGJPH+9MJ3I5vPuo/O15eM7mUrQzrN0gDBLcn1wlK8
         V5ueelJR5s0oQ6KEydOXdQos9zuDQpi94bJWkj0xDoJh/UHcH9KehS+yLweupuhWK70E
         Kzr0w+ZQgPJKOgFe6AryWIoIBK46s+rgjZNcOGZE9OHmqGthRwQL59kLtb/9HDnP5X/j
         ellA==
X-Gm-Message-State: AOAM530T2fYPr5StiELYNz0nic/GoLPNOp0XFHQ5zWAVh5ENbDLV4cU2
        fyI1QXVjp06FnBeGmL9WPLqrWSbcy0dz2VswQiLMlQ==
X-Google-Smtp-Source: ABdhPJxb6AkCuGsmhq0qIIX6WKbPdSm7r/t8ww3A8ZuDSPhv2/36r1RAxLqOm0mMjX17aL3Ia+ibXVc7QDRG9fW6qTk=
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr37547603ljj.326.1609771687776;
 Mon, 04 Jan 2021 06:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20201212040157.3639864-1-icenowy@aosc.io> <20201212040430.3640418-2-icenowy@aosc.io>
In-Reply-To: <20201212040430.3640418-2-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Jan 2021 15:47:57 +0100
Message-ID: <CACRpkdaeOEFEf_sz4Gs-hobVopq2HUkS3F+22ca9VzQzVKAU=w@mail.gmail.com>
Subject: Re: [RFC PATCH 05/12] pinctrl: sunxi: add pinctrl driver for V831/V833
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Icenowy,

On Sat, Dec 12, 2020 at 5:04 AM Icenowy Zheng <icenowy@aosc.io> wrote:

> V831/V833 are new chips from Allwinner. They're the same die with
> different package.
>
> Add a pinctrl driver for them.
>
> The difference between V831/V833 pinctrl is implemented based on the
> user manual.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

Could you respin patches 4 & 5 with Maxime's comments
addressed and include Rob's ACK on patch 4? Also please rebase on v5.11-rc1.

I suppose these two patches are independent from the rest of the stuff
in the series so it can be managed separately?

Yours.
Linus Walleij
