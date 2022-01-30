Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5284B4A3320
	for <lists+linux-gpio@lfdr.de>; Sun, 30 Jan 2022 02:50:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353463AbiA3Bui (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jan 2022 20:50:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244162AbiA3Buh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jan 2022 20:50:37 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FFFEC061714
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:50:37 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id w81so7560826ybg.12
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jan 2022 17:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cOgmiwyZjjoa2KmLRsDTQqtndRZfyO2tlSE6rtX52CU=;
        b=GADiTDv7bceiPCwC+8hOAL00PLZrvQ/NahQ4u3SQKW0IofAB42JoU9oJ3i4k8yP/cp
         UjoRe65Avw+T69+se7Xe3/T5HR0x5fGM5jN9j2VIg2nfqNWfOJgXNdoYOGoIxLr+Dvlt
         qTZsrnlyTzDRqqjtdeDyI/43LOynZlOlP1zGPwobeeizWVr60PoEt3AOzFIxnSQ386/e
         adSPWi4aNGjS3jwDBoSg1yEkA2l/zIlQfX2A8054bUYTcPddM02VKecZyRnIkwkGtx9S
         gL3TiVRghBTDZdaqr+B0P+LvVcSj+LfCrUvGtO1Ck3qqfZ9agqjJxCJ6d4W+Y5JM/NAf
         IDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cOgmiwyZjjoa2KmLRsDTQqtndRZfyO2tlSE6rtX52CU=;
        b=xTVk4yTekpy2xjMF6TdOgHrqSyn3EBIqeH0ARHlDiRVioeDfzFq8Fd0ArsB1IK7/kc
         UevqxmE7Zd+iW91DyDYkYsPpH645+CC7zxMy5atLSqvm84K5VwNcQdrsTuxz0h5YCa34
         bFK5PsIOKONvHx3SXN6GYmXb4cf7Fsyu1stSsN7jz4pcnGTlhyJG6nFevnRtVhC5iRP/
         wINGzsfldFJ5eDA1w/+5GvVu8W/AoSvKG6FbyLHHRarZRimytPmC6NQofJaLJ/sG+JvG
         /GUMsrKo/sv3GIIt2be0oEctUwHEyjk83Tzs6yK2RvvccsiqrnmKUcNuytL88gt3SG9B
         27VQ==
X-Gm-Message-State: AOAM532HJ8GLKgh/lSK7Xx2mR/Q1KgFs7Eqdy6Ma7MndXlxl0wTCJruy
        pEOM0M6+BVatHVGR9bq696rcspLbrpc4uCLFpUFD1g==
X-Google-Smtp-Source: ABdhPJwsUgbHQxzZC2X5NxV1xXcoZwY26kEaYR+fnCssyr4T9BhV55Xyz53hohkukDK6ALvgU8mEZhuGi8OOBHFFBJo=
X-Received: by 2002:a05:6902:124a:: with SMTP id t10mr20359327ybu.634.1643507436695;
 Sat, 29 Jan 2022 17:50:36 -0800 (PST)
MIME-Version: 1.0
References: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
In-Reply-To: <20220129115228.2257310-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 30 Jan 2022 02:50:25 +0100
Message-ID: <CACRpkdYEigGHkoGfBg15tFXadgpXUAjDOnw7ePXhmvHJqPEJXw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Nuvoton WPCM450 pinctrl and GPIO driver
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        Tomer Maimon <tmaimon77@gmail.com>,
        Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 29, 2022 at 12:57 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> This is version 5 of the WPCM450 pinctrl/GPIO driver patchset.

I haven't had time to look in detail but the kernel robot is complaining
about patch 5...

> I was originally just going to rebase the patchset on top of v5.17-rc1,
> but while testing, I found that the IRQ handling code violated locking
> rules, specifically that it used spin locks (which can sleep on RT kernel=
s)
> in IRQ contexts. So I made a few changes to fix that, mainly switching
> to raw spin locks.

Which patches do you expect to be applied to the pin control tree?

Yours,
Linus Walleij
