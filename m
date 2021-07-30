Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BF73DBDC6
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 19:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbhG3RdL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 13:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbhG3RdJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 13:33:09 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71A4C0613C1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 10:33:04 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id b5so4276022uaj.8
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 10:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JaBel+Wk+Pmj/m/QWG3pSV0rzgtGPwsESburA6QnpC0=;
        b=FhUt38mUtFIiLDdQIxIQoXNxNSSACz3P74Pvf9/7tfNd8lCP3n5L4F56oUZaI/XE5V
         VcqKCElVfJuA/8oM6UGQK6sz7nMLW0t2jyS8v2hTI9ATj9QJ1Mm5j0IdoPtG8WGUTHri
         bHCYKViNYMOvw9g/VW7ic19rZqIkUI4xxqyM0rO8XMhuczGIv7VRf2mcRAgVM7P9Gso2
         OUkF/iq1VjVvWMFYpIS5oktLhycz5Jh6/HVhTj23eOvlu1NziMVqzv//yRtE05spLPIr
         btZhS+eZkiePZdnRCNd74CRuy5GcuaHwzmLrhulokA1WpsDAY1yVDhkurmc+Nt7dKDHA
         Z7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JaBel+Wk+Pmj/m/QWG3pSV0rzgtGPwsESburA6QnpC0=;
        b=R2m2hVe0VCP/jaQo6Ju3LKtsCd3g5K8MgufLk/iRfNY+MeegTjQOWsKvN2RI47Fgu2
         +bxM28IV6ETmYwIZX4dxYIVNrexaYP+1Cx/QC/XrPnP2oKS3ARLLKN9ZzEkOBd3beAjJ
         yAj11KsnNxFEULkjlCGUiKmAf2XpIPcfgrfELrHzFQhsF/Z+XkaWKivlC0xdqGWXyRgt
         3JIBGnMu7w9FkqZ/3sIWwEJC2CEPu1mkCVW/8eDpAwDZZZYuuAmRe5zK/Qwh8gjtd8oM
         F3h8nMtBqEergL+xig3crUdUPYQ3f8fFIzgDpqqZ8fVh9aRVsUfZw9n8MxtKXcFU0UwA
         8evw==
X-Gm-Message-State: AOAM532CrxsewiyI6r8i0YI9CzOiSDTilHD033vAzxs++1KSiVQgIRt9
        YlHa1t+6MulKdfTEvfcRbj/mn4hN3GDxhgbcQLVUkw==
X-Google-Smtp-Source: ABdhPJw43II2PhFksB0jmNqxACJZWx9bpShJeIvnmuKr7qKhtUKe+219lDwvOwfyXr4EiYyBAsjydof5yY2K1WxqSb8=
X-Received: by 2002:ab0:6392:: with SMTP id y18mr3251539uao.139.1627666384076;
 Fri, 30 Jul 2021 10:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-9-semen.protsenko@linaro.org> <CAHp75VcugLnV6D8xhkMHuW-X6LCtHDDnghD2G+vqwYmRvFP9Nw@mail.gmail.com>
 <8202e9f9-06f4-f1ba-4f30-e1a0c8340450@canonical.com>
In-Reply-To: <8202e9f9-06f4-f1ba-4f30-e1a0c8340450@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 30 Jul 2021 20:32:52 +0300
Message-ID: <CAPLW+4mB1NpswMDVThEiOgn0ce29xckV5ZHo=85+ia9d5=x-6A@mail.gmail.com>
Subject: Re: [PATCH 08/12] MAINTAINERS: Cover Samsung clock YAML bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
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

On Fri, 30 Jul 2021 at 18:25, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 30/07/2021 17:06, Andy Shevchenko wrote:
> > On Fri, Jul 30, 2021 at 5:50 PM Sam Protsenko
> > <semen.protsenko@linaro.org> wrote:
> >>
> >> New device tree bindings are usually added in YAML format. Fix "SAMSUNG
> >> SOC CLOCK DRIVERS" entry to cover both txt and yaml docs for Exynos
> >> clock drivers.
> >
> > Fixes tag?
>
> No need because the pattern is correct at the moment. The patch does not
> make sense on its own and should be squashed with the next one.
>

Nice catch. Will do in v2, thanks!

>
> Best regards,
> Krzysztof
