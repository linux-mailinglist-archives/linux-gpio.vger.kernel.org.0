Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7747F2070FB
	for <lists+linux-gpio@lfdr.de>; Wed, 24 Jun 2020 12:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388551AbgFXKS7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 24 Jun 2020 06:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388197AbgFXKS7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2020 06:18:59 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78C1C061755
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 03:18:58 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id cv17so758945qvb.13
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2020 03:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=C6/v5FDFWQu+K+FXq08cjlRQyyzbafWyPUDoa4Irltc=;
        b=jj3cnZCOyOB9NW5CdQjqAVegrA2UgCoaX9vN5SE+cDx5Ij/EqZgnx69yDAe7CAmhe8
         aOZBqYkZpuwrgMZ2Lcl2qZ2Pg7lQTEKxyurHvft6gu/JIA/Na7misgT3ELJ2Yo/YvK+j
         K2TIdcqZmopU46RyJqGNmzoAbLsKnb1WPD/E2plF8iD9ugy//nIgZh1ATKMXGOvSYJrx
         /rPcLMTsznbRDq7QgAqYlZqtAkjwZ4bJBpLWyf+ObIh9D9pk+zIDVQALitwwbE5tL1cX
         HKlyGkK81UEOArvbLGDPDI7Dj1xncuMTl18GUPZ54HUi/yC85eEwucjb7I/k9Nn3hpdV
         KVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=C6/v5FDFWQu+K+FXq08cjlRQyyzbafWyPUDoa4Irltc=;
        b=F/bnge8rmmZvR5dvtH4jDxewcCroCk4A5BTQKdQhi7lQD0jrglxdTj32kQRhCiY9Dq
         kwzxspjHogfOzMtd7icAIZ4C8Pr8ZAdn2T/qWhZ9iHncvSwc9x/b//aXweVg8z8G66p8
         gvwhelA0QmXbAFrwiipn+PzlEU5Kp0Ehym5nmHuVYckrQKIwyZzuZU1/dKiuIpcGy9uN
         48jmGOMXZVz4W+qfo1toCujEPd7jzxpF+lnkI34nFbqFhSS1f8iR/SlTfQKV3tQGE2rL
         khL5os8BZuKcPfjDvAP6IaTa4s53zuoEKKc+grLkthT7l8krhedJ4vm0XwlkW2TqWrzf
         Ac0g==
X-Gm-Message-State: AOAM531XxOWnfwOx01sIZlMTiLA19uiJLcVkAJr12SIbGNyW3ziqEHGI
        Y6M7HedYoneaFlNniUCyyojqB8W9F3vi+zLyDNJwsA==
X-Google-Smtp-Source: ABdhPJxyOty9d2vWpwJQ8sY1tPaTNpUtvrolxOFLx9ay2+sbUQy6PmOXqt/+hA79Z2fnVWQc7yZOCL6cO4O2DyjGW28=
X-Received: by 2002:ad4:580e:: with SMTP id dd14mr14074237qvb.96.1592993938042;
 Wed, 24 Jun 2020 03:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <1592393847-1415-1-git-send-email-srinivas.neeli@xilinx.com> <1592393847-1415-4-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1592393847-1415-4-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 24 Jun 2020 12:18:47 +0200
Message-ID: <CAMpxmJVJQ0Kz0xdRr4pmHddWonn8JQ-4pSEZyfr39ApQV73G=A@mail.gmail.com>
Subject: Re: [PATCH V4 3/7] devicetree-binding: Add pmc gpio node
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 17 cze 2020 o 13:37 Srinivas Neeli <srinivas.neeli@xilinx.com> na=
pisa=C5=82(a):
>
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add the pmc gpio node to the device tree.
>
> Versal devices are the industry's first adaptive compute
> acceleration platforms.
> https://www.xilinx.com/support/documentation/data_sheets/ds950-versal-ove=
rview.pdf
>
> On the Versal platform, we are using two customized GPIO controllers(IP)
> which were used in Zynq/ZynqMp platform.
> One of them present in the Platform Management Controller(PMC) block and
> other in Processing System(PS) block.
>
> In PMC_GPIO only Bank0,1,3 & 4 are enabled and in PS_GPIO only
> Bank 0 & 3 are enabled.
>
> You can find more details of GPIO IP in ZynqMP TRM General Purpose
> I/O(Chapter-27).
> https://www.xilinx.com/support/documentation/user_guides/ug1085-zynq-ultr=
ascale-trm.pdf
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

I fixed up the subject - should have been "dt-bindings: gpio: ..."

Bartosz
