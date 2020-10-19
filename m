Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA445292888
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Oct 2020 15:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbgJSNsk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Oct 2020 09:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgJSNsk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2020 09:48:40 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F25DC0613CE
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:48:40 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 184so14263005lfd.6
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2020 06:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lvmvIl62QxxYsRuevZ4ZPz8m9zlF6eoCr1pNFZNeDvs=;
        b=GFs8v2SjypMqXg6oTSGYrihPPFXDpWYZdfEmtpwvIGCtQgl/eTXWGMn7glIOUJNlCS
         L4TnJqoK1D26JI1+aGd8HafqSMDjOnHWdEmpxQfOgNNTppNMzHOo6f0On8T0VVYYmur1
         oEOVJJDQciDQFAStYkjy/vKKYWve7dQpnEBiYM1KIY1vz+bbgmsTJwtCrYMbvZvwoD/+
         8FIY5/x0CsZYPpOsuHV3kG4BvZXKPrw6JHF2CI1dUeJstj0LsHs30w7UAbpOR2RhCNOH
         iPZR5m54arZVtw0m1paw4YVz+mX2Hz2YmWtSUAQ57enc62iGDsrVnPz4b/qeS00hNIN8
         upLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lvmvIl62QxxYsRuevZ4ZPz8m9zlF6eoCr1pNFZNeDvs=;
        b=o85wefaJt/6V+pUC9bAMJrSYf5l6cOLr9ai2PWyHr2KfL+flWGO9MY2wZXnSOzNPeZ
         yEsvdAjb5LqsF1jNgdVAPz8WkH0yEfHKGqCbE+W9OZSxaoR8f2bKJZq/y3rqwXNoCIjq
         3a/mWVI238YJMaEvP4gaU/mhkuXdHKFuQD545+0cmPVTRXl8kwJcBbMUB6+D4cugKX8U
         jAFQx9fl6x82JlCX4/hCOR6D2r/4mGZ5AoODZAhn4gZAGcsrRSsD9aNuh+k9q93oaGL2
         SRVcq6wh8g5d6FB1xLsiUOxf1Hqh4ehqSHDQ1yfb2lYNBRNaqgQxbgVvGkfZ/3MXUV0R
         dxXQ==
X-Gm-Message-State: AOAM532A215WCKhixJ9oGRFNvdPruXuIwJvEIoRgY2JVQZDRo7R7sOZR
        AW59SfiC52vqx69hk+SrX1/vkhZ4myKuyvSkImTrCA==
X-Google-Smtp-Source: ABdhPJxMmoMICERYWMHmh24WCSuO7fGjQ3abrirvhmBz7oLlTqWrO88FLAxzgw+xdqrOkZoqTJ9smtS+SCzJIBk7USA=
X-Received: by 2002:a19:191:: with SMTP id 139mr5337669lfb.502.1603115318472;
 Mon, 19 Oct 2020 06:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkda1B3LcGWc1PhXNgi-6JxapiKY4F_94c6dk4eBLgVGBJg@mail.gmail.com>
 <20201010192509.9098-1-paul@crapouillou.net>
In-Reply-To: <20201010192509.9098-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Oct 2020 15:48:27 +0200
Message-ID: <CACRpkdZMC--Ejvbd0CU7+jTrtddGmu_01=SsuuQTGasZLi9wxg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: ingenic: Fix invalid SSI pins
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Artur Rojek <contact@artur-rojek.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Oct 10, 2020 at 9:25 PM Paul Cercueil <paul@crapouillou.net> wrote:

> The values for the SSI pins on GPIO chips D and E were off by 0x20.
>
> Fixes: d3ef8c6b2286 ("pinctrl: Ingenic: Add SSI pins support for JZ4770 and JZ4780.")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reported-by: Artur Rojek <contact@artur-rojek.eu>

Patch applied for fixes. Thanks!

Yours,
Linus Walleij
