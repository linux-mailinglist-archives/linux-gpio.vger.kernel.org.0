Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36583DBBB3
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 17:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239834AbhG3PHz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 11:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239746AbhG3PHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 11:07:44 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ED1C061254;
        Fri, 30 Jul 2021 08:07:01 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so14890118pjd.0;
        Fri, 30 Jul 2021 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Uiql/ha2ebfW9JafWLNa34BRrz0ryy5kT8baVUuANhk=;
        b=dxZ/F7jjBAza4XWmk7fQUv9x7HrhHcNGgQwWh4PiQha3P4nwT8We8aIixjV5pBer+R
         7N/VW4x2mw/Puh47jAdbOLO0baiHozAQT3ATnIbGQ+Xgl3N7m1wX0YMU2obOX3Z6krfJ
         Pxh5sLqMyurNqu67qrsyD+b89auN4iw2K9SPdPUda98TrGlI5vlHUQ8sIGoI2NU5Ve3M
         IGiYkT0NmiWjB7BmpN+Ornw0XTIBaeIDYh+ZAp1tHkCOmH9EYpSZBTFeat2jMO+XhLKe
         rHDPrsvt/MhnTQDlElBEAuSmnzV4GcVd5Xx+AXG4O3GQ5DkRZUwTKoCoAJ9kqZoTmUDc
         MG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uiql/ha2ebfW9JafWLNa34BRrz0ryy5kT8baVUuANhk=;
        b=mS7EhRT6gjsxJ+MlXfVDtYSs0dcgEvn9cQDofy0Mnyt67797yxkG/osiq4KA4e8DMo
         /DkukA3J/JLaNCUc+kVYA2cgVJq+SDa1bKcB12BlNCaRlDZLEoySvLi3OwHw5NhIl3gx
         oiZGCpsvION9SE4JMWjXmTjB+LUoXpR1RX4ZSjBfx+B7AlWcvrOljzAvcgNd8QYd5ZxH
         UPp2JSdlvhGsxkYIuD+MSRY8LobTlLuMFhOFMvvubF1u0+JpiC6NKKDb29FE3n2srhSL
         MHpJwLEzDx8n9l6vLAbaQF9yDHI1icvf4UT2bJv8ScWyah6ZgNTr2lymWp9ydLXfx16x
         yTig==
X-Gm-Message-State: AOAM530apO8/8j3ZvBdYC5CCzEoiN3KYUPWVeb77YcQfTQXmjCYJxhrW
        rxDTpjknVDLvDgwu4dK18fJKtoRpQhdxL4jt32k=
X-Google-Smtp-Source: ABdhPJzsp0hO1dNwvtZE+1MPAcv7pD8a7agbhA/n10XRqCnLqbVfBHV+EPCctybPzpGOfYdE6uDE85HH76t/0IQ9yf4=
X-Received: by 2002:a63:5a5b:: with SMTP id k27mr2771088pgm.74.1627657621176;
 Fri, 30 Jul 2021 08:07:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org> <20210730144922.29111-9-semen.protsenko@linaro.org>
In-Reply-To: <20210730144922.29111-9-semen.protsenko@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 30 Jul 2021 18:06:21 +0300
Message-ID: <CAHp75VcugLnV6D8xhkMHuW-X6LCtHDDnghD2G+vqwYmRvFP9Nw@mail.gmail.com>
Subject: Re: [PATCH 08/12] MAINTAINERS: Cover Samsung clock YAML bindings
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 5:50 PM Sam Protsenko
<semen.protsenko@linaro.org> wrote:
>
> New device tree bindings are usually added in YAML format. Fix "SAMSUNG
> SOC CLOCK DRIVERS" entry to cover both txt and yaml docs for Exynos
> clock drivers.

Fixes tag?

-- 
With Best Regards,
Andy Shevchenko
