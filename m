Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9700C2FFFB4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 11:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbhAVKCw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 05:02:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727763AbhAVKBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 05:01:05 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D8BC06178B
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 01:50:30 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id p13so5832431ljg.2
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 01:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pKapt/M6y/PyIWz6wXtu/tZ4eGaVQitNaXfiOXO+clw=;
        b=Ai0IGzb/825iKbCNaOMRzOq/NIIdsqb1K/mSaEkhPBqb1st67Cwqu2faoXi+pSoqJa
         V2tZFQR6tYIfGfYruJlgPDBN0Z+sgVFc5yef1OIl/FFJq3Vk/kcjX7CxSS1T8kbBLJzr
         qs6iP9UOHVE6ZPNXVAyBWzzeTyJ6VAtidhIQHD7x3IdolPgEfcrghaNVbG4c0/3Ggpq8
         chr72u2wzD1Cwa5ND9zXe/wBBqwzB/vmzVmlYWqDTQ+uqqvWncpAzgIdHSLSwPIRwuSe
         8FGmf9sxtu6UYFEnluZ/lBJ0YgkS0509F02OlCSSf3foc7RzmkOzpejlQ/V37r+N60b9
         fJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pKapt/M6y/PyIWz6wXtu/tZ4eGaVQitNaXfiOXO+clw=;
        b=mQhIZ8bGibOdvaZzHrigse8xsidvbblXhMWtZ0xD4Umd/wQL1/RFPnmp2LhbXiUXa4
         c5cBP5t0NWEncbf0ZeXN5qNWKOZNf5OkjsKd0ijW3Fn9htSn93eGfM07ftivzTTQroKO
         a4QNmELl83RqRaC56t1c1a5JnNnQTr/8e0aEBWqUfpyzFYTlHB08bzSqabqjKBO/pQ++
         ehQl7e0B58wWd6u8dCPPWLfnoK+ImwJF91kKIjdBBnruuXKXUwIypYXWBtDhGMt8+65R
         SW5Ivl9B1qcevQOmynH2iotkwASGk9aWecxUpQ5AfTUD66Z/2I5WZoTQ8lxnuMkC8qLq
         w22g==
X-Gm-Message-State: AOAM530QkQyQ9aRrUOswgQimBQK57ybDkgXOcvzJKxJkDnOHMJ8VH1Jd
        57AN326GFljeUa+nFrVjCGvif+Ari+jceGKxgG28vQ==
X-Google-Smtp-Source: ABdhPJwxAUKeWHiEudGoJqNviXtDPynvQ8t1kMzlIC2gud45legMMte2/A/VmDnms7BnWvZCVVE4QvXAtgPdQPsWOAA=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr298641ljl.467.1611309028785;
 Fri, 22 Jan 2021 01:50:28 -0800 (PST)
MIME-Version: 1.0
References: <20210113194952.104734-1-u.kleine-koenig@pengutronix.de>
 <20210113194952.104734-2-u.kleine-koenig@pengutronix.de> <CACRpkdbVKzE_pe0mPb4H2c0RVJGxEtiFEfMpTCoEO+7qdVBHFQ@mail.gmail.com>
 <20210118145721.6puoqfd6jx3x76jh@pengutronix.de>
In-Reply-To: <20210118145721.6puoqfd6jx3x76jh@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Jan 2021 10:50:17 +0100
Message-ID: <CACRpkdY03=pawFPJqxwfdxL=dUUDOVvcpt+s+qTHfa9Wg6-eiA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: gpio: pca953x: increase allowed length
 for gpio-line-names
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 18, 2021 at 3:57 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:

> Who will pick up this series (preferable v2 instead of this (implicit)
> v1)? Will they notice this Reviewed-by?

Bartosz is collecting GPIO patches to Torvalds for this merge
window.

Yours,
Linus Walleij
