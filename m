Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115593163F8
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Feb 2021 11:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbhBJKf7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Feb 2021 05:35:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbhBJKdg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2021 05:33:36 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36429C061786;
        Wed, 10 Feb 2021 02:32:56 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id e9so977442plh.3;
        Wed, 10 Feb 2021 02:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LLdDQUQP13NzlWu2COedE9BO4DgJfjSYV3P0R/5YqEU=;
        b=uZplPSuADWwkqUO8bgIIajgUW16QAkBvFN94GSmyqwzYunDJNAR7LhwIUkYGnQPD2x
         nQTx04fiJwt89Q1lD1B3rXIURUfUgplPBo2veVv3N1tXkuX8ZPncFl9NuZhIdu7/KJcN
         16e0vSCzMrLr44XWOidlRgn6CbE6OKb6rcyVGvcump3xLxu3uWPthlWDYcpWS6wvU5jN
         0kILc0OnaKpZnRkfHVo9fb3awdyhDoE5ix966TYcndXF6TpnKh/aV8Q7T+X+a8vCsoZk
         m7evANyNAGB0nUEWbMiqt2YBLl0OyCYtM28LLaPVK/z3fC45ijd1hStUBVt7PL8n1vgk
         XyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LLdDQUQP13NzlWu2COedE9BO4DgJfjSYV3P0R/5YqEU=;
        b=h2egSvydowzp1adDBtoInfa0FFyqxz4UmQeFFis4qPrv/4XHBz2HnIvoHhvsOZ8aBo
         6QkEq1wMvOpOxgWbMXtNkMTRQXAtt0DhuXaEyQJKwvh9CxN+pEL34EY6Sxoxt62CQLez
         EM0U3inhuHvANENaAViUy+NYkQdh3g5Xw8/qONmyhx0dJDhbMUpNygiB1NsdR5NWqvSF
         BQrpyz6vlS1gbsG0SNgh7PzAJYHsBXeCCdjLAclApBuqj469/yTBeylDAYcE5KPTN2OK
         zORu0RBm1oaVB4roGH+DEwxphlZHM0ud+qht3/d3UJfghFWH+usPiyRbmMe6sUNzVrGf
         E0CA==
X-Gm-Message-State: AOAM530/0uxzjnDCk9CmZioX0AgYi+JShJrgPIwlAMxytj9/uQwiYbbv
        EN0Pzp19Scb1jP4wugKjBpadMO8cYna9yUJpMgY=
X-Google-Smtp-Source: ABdhPJx8gN/pOyi4L/K6NTKHaPSYP/H8BZ1OTpKiP3+sA1IEMtj1n/T8uqzmVvTKZh+3ZXyCmDSLCvwBN5DzxXZxl7Y=
X-Received: by 2002:a17:90a:1b23:: with SMTP id q32mr2522932pjq.181.1612953175724;
 Wed, 10 Feb 2021 02:32:55 -0800 (PST)
MIME-Version: 1.0
References: <20210208222203.22335-1-info@metux.net> <20210208222203.22335-12-info@metux.net>
In-Reply-To: <20210208222203.22335-12-info@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 10 Feb 2021 12:32:39 +0200
Message-ID: <CAHp75Vd9ui5bttkrG0KQLqecS_-5m_mPQHfdawpLhx7+YObrYQ@mail.gmail.com>
Subject: Re: [RFC PATCH 11/12] platform/x86: skeleton for oftree based board
 device initialization
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 9, 2021 at 12:27 AM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Lots of boards have extra devices that can't be fully probed via bus'es
> (like PCI) or generic firmware mechanisms like ACPI. Often those capabilities
> are just partial or even highly depend on firmware version.
>
> Instead of hand-writing board specific drivers merely for the correct
> initialization / parameterization of generic drivers, hereby introducing
> a generic mechanism, using the already well supported oftree.
>
> These oftrees are compiled into the driver, which first tries to match
> machine identifications (eg. DMI strings) against rules defined in the
> individual oftrees, and on success, probes the devices that are defined
> by them.
>
> For the time being, we just support matching on DMI_BOARD_NAME and
> DMI_SYS_VENDOR - other criteria, even bus- or ACPI-id's can be added later,
> when needed.

This is weird and seems it missed the fact of the DMI based modprobe
mechanism that the kernel has for ages.

-- 
With Best Regards,
Andy Shevchenko
