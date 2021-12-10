Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1EF46F8C6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Dec 2021 02:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhLJBve (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Dec 2021 20:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235456AbhLJBvd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Dec 2021 20:51:33 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1EE7C0617A2
        for <linux-gpio@vger.kernel.org>; Thu,  9 Dec 2021 17:47:59 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id m37-20020a4a9528000000b002b83955f771so2087803ooi.7
        for <linux-gpio@vger.kernel.org>; Thu, 09 Dec 2021 17:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dWvOVPA+0MutOijnBAzIthRTqxnFtgjBuBRS6tbJOwk=;
        b=NXTU4DRG5dLcqScl6jn+eTL5mRPkjBm0U/xvSTVJev04tL3knDXUh7objzJFXLwIwp
         wmqbpnVfSXAoUrNSTIGpac5hKVh6OFmlYaicwppftkMp+Vk+fbkcdgqb1XjMUgS28PMm
         d6pA/ybeqaFu8D2G2UGDqtOcJUifbrk1HNYJ1QYYB/k4DGffSAJ75r3rQitJmXu8d0hx
         t8IEO5jRCJKj88o1c77kg/CGIsRN6pXXuqdI8YgV3ZY0tabX2VZQeYkshNbTDvtFXezI
         HtqL0dM5msGCFsTeR28m5heeJ1pQeGOZpWD2+fEjPT5sl37pHhLTeX4jcWC3LVDHmBbV
         Buzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dWvOVPA+0MutOijnBAzIthRTqxnFtgjBuBRS6tbJOwk=;
        b=6wxPXx9KPOO/JemDBCjiQYMTWB7UmJtOZ5NHxixSj9c7TYKG30BhVZKhz/Dg7Uc3u1
         PGwfCNSANGTD/qooquYrftlnkOn+Y+4BQGI3cWp31p1JFlIx1VjHUs2dUhVgDfEhDyvj
         cDd9+q+wCvwiQN99PpRRC3Aifv82p03z8U3kYdw2jbB78jvlw1tIq1Duocotez7jcZAs
         6yRyu/YGh6i/r5bTstK2vDOvmBab22QoJRCY4SP5FRgA63WlwIfmaZOWefqQfn78pmo9
         r2lAA0rJKMlnt7HtWsZnfRzQIII+bB9vi+EWS09VZ0iQQ4RQECbnJr+olT8b+bQc5/nl
         BUXw==
X-Gm-Message-State: AOAM531bv70b5+DDiLXW9N6UY850zWrf5pCP10zRdXTDmR0BE66u9/rj
        FrC6OeGWVHbk/qLcTDpwYDFXDeqrOpv95EqhuCjMuw==
X-Google-Smtp-Source: ABdhPJyK1lCVKvNMNsh+WgVmhUJ4WT5uOWiT1wYz7KCpW8moYEMiX4Nhq9m5pyo4rROuaVnz+As/SAXaT7aGq89V/Po=
X-Received: by 2002:a4a:aa8f:: with SMTP id d15mr6635657oon.86.1639100878996;
 Thu, 09 Dec 2021 17:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20211208173047.558108-1-thierry.reding@gmail.com> <20211208173047.558108-2-thierry.reding@gmail.com>
In-Reply-To: <20211208173047.558108-2-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Dec 2021 02:47:47 +0100
Message-ID: <CACRpkdbDj=2FtC=FLwAknc+zPJML8-8iZsB3Oz+4mdUmWpQxTQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: gpio: tegra186: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 8, 2021 at 6:30 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Convert the Tegra186 GPIO controller device tree bindings from free-form
> text format to json-schema.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
