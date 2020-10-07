Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C80A285AAB
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 10:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgJGIl2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 04:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbgJGIl0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Oct 2020 04:41:26 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99442C0613D2
        for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2020 01:41:24 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id p15so1128785ljj.8
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2020 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sHa2vFP6Z8cci/P7jIrJ+MfHpuwcBKpgKXxskm6Q6fw=;
        b=YJ0BrXrTdWa9WcTPIrxIhis2lFVE8NJZ7eX1eFAsS12yIwIRFHaWaDTdRTuEw7YouW
         x+Adgai/YMC612Um+spQ3qH++PGFChPoVsfEJp0lWu/e1Oav5QmjrtWkyQuVJkNNtcfK
         bPwfch50Boi29xjUj+u53MugBX+0p1RpEY58R8h0UkHHqwFqEXD8noT5siTVjYkqly1O
         e5D3Z4A/9SM3icFV3mbAIn5Bt6Z1wxMmstL9LMwYoTXAGB/VnSoCLbeoEbHw9tD3wUQf
         8FaIgT+zxzwljpQIJB7DGAgtyJUI1Ln/IMLsPJtGEt+MMrpvEtMrQXqxGhsHNP21paMY
         HNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sHa2vFP6Z8cci/P7jIrJ+MfHpuwcBKpgKXxskm6Q6fw=;
        b=JZtqO60/RTpEWZCKYsLCfyDWWzR0nALgGddvjWBmmxTAPytXzJJOiarIqWEA1+hbpE
         aWLr1oDxuCOcQ/zUKoJMvfEVFLuXwcR+2OidE1oRI2rzx8f3JBLKDpowM5RXITg3y0F3
         FDVcA7bvt37u77pv/t2xsvgGrbsFGlUhVE4MiwW8oxpdCi0S/EvsBIUWDVnVFAwp6bf/
         gzgHZMDg0Ku0+0w7/6+qR8L+LwAlQqkN/r4Vj/UrLnZQWdwzAmEM/+v+33O5sVYac513
         b0ccX6WDU2GPv6OnVKx7rxrQtQBWe6WzbAkXwlfdbHr8/HJj7UgYnOewCrw88/BrUsGS
         GNnA==
X-Gm-Message-State: AOAM5315Uq5j6v8uFJAocv2P+J/jAAIYxh0uszkIfssGRqf9f67aQCij
        bno8U4YB1gjMJZzC/lsiSk1A42HXcnfT8bafGTTmdA==
X-Google-Smtp-Source: ABdhPJxmxSmndRJcdm9n8iZOBVRj/ahjFLB1cwPQRfxLM+g9mWOMwZ8+xk5a9BryxnbSPEpeI/xy+t1OFxdEDOmQmec=
X-Received: by 2002:a2e:810e:: with SMTP id d14mr890047ljg.100.1602060083038;
 Wed, 07 Oct 2020 01:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1601616399.git.mchehab+huawei@kernel.org> <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
In-Reply-To: <bad4d85c218d59c1bf69157df8e1012577680d88.1601616399.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 7 Oct 2020 10:41:12 +0200
Message-ID: <CACRpkdacQ=rtbeyGd-s7j303Ne=Z1gFFSer4i-6cqQ-uYCPJ7A@mail.gmail.com>
Subject: Re: [PATCH 6/6] docs: gpio: add a new document to its index.rst
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 2, 2020 at 7:49 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> There's now a new ReST file. Add it to the index.rst file.
>
> Fixes: ce7a2f77f976 ("docs: gpio: Add GPIO Aggregator documentation")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

This patch (6/6) applied to the GPIO tree.
Fixed the Fixes: as indicated by Kent.

Yours,
Linus Walleij
