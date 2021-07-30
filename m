Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301E03DC110
	for <lists+linux-gpio@lfdr.de>; Sat, 31 Jul 2021 00:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233310AbhG3W2Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 18:28:25 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:43586 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbhG3W2X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 18:28:23 -0400
Received: by mail-il1-f172.google.com with SMTP id x7so7577261ilh.10;
        Fri, 30 Jul 2021 15:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=D52Vy0CgcE0wfPHmI57Uv6O5bCcoMUm9q+qsHe1m5OE=;
        b=Ym4V16ChMgDMYEcRaLIj91P7ur1Qpanl56iMYdBlNaTx4OaPOpycWoNmHs2h6uc6b1
         rWad75hIj6FZhjv4bpojPzVl5R1KsRsAGITujjg9Fd129vMnaYoK9R6zpqIxNkR1TFkW
         F+jdqyyGp5YOqfaEumsa3lxkY4HWr0QXlAx8kxjn8WFmpKFhgQ6qm6DpFGyDkw4ZmBc4
         dbmmL1RldrAwQRvqs7CkELEhY5DtJDz7rUGNPsoi+QsV1LI0l2hZLe9kPa/7+ouAkNpB
         SbKqpjGzpO0pHBtY7+n4azgp7JpDxW4Dads8t8CwG7VVUMxifGWE6f18PjPdmvGQrafP
         Aihg==
X-Gm-Message-State: AOAM53277ZtUwun3pAOoYs/Kbi1yt+9CBm0ReEgPi/3lX0JeN5sxY2oX
        +ZPV1vkG28VVt1q/uAlH6Q==
X-Google-Smtp-Source: ABdhPJwxFmwDv+5IpRAc36U/IY0R6KHUZxqyVwE7pzDL8f+orD1mZ/cnblLwZldJa1oLxZ4RdtDipw==
X-Received: by 2002:a92:cf4d:: with SMTP id c13mr1018767ilr.300.1627684098045;
        Fri, 30 Jul 2021 15:28:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d18sm1505290ile.32.2021.07.30.15.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 15:28:17 -0700 (PDT)
Received: (nullmailer pid 3442795 invoked by uid 1000);
        Fri, 30 Jul 2021 22:28:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Tom Gall <tom.gall@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-serial@vger.kernel.org
In-Reply-To: <20210730144922.29111-10-semen.protsenko@linaro.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org> <20210730144922.29111-10-semen.protsenko@linaro.org>
Subject: Re: [PATCH 09/12] dt-bindings: clock: Add bindings for Exynos850 clock controller
Date:   Fri, 30 Jul 2021 16:28:10 -0600
Message-Id: <1627684090.562853.3442794.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 30 Jul 2021 17:49:19 +0300, Sam Protsenko wrote:
> Add documentation for Exynos850 clock driver bindings and corresponding
> clock ID constants, which will be used further both in clock driver and
> in device tree files. Constants are grouped per domain basis (CMU) for
> more convenient usage, but those are just unique numbers and have
> nothing to do with register offsets, etc.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/clock/exynos850-clock.yaml       |  70 +++++
>  include/dt-bindings/clock/exynos850.h         | 267 ++++++++++++++++++
>  2 files changed, 337 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/exynos850-clock.yaml
>  create mode 100644 include/dt-bindings/clock/exynos850.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/exynos850-clock.example.dts:71.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/clock/exynos850-clock.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1511715

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

