Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF9B558A00
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 22:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiFWU0M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 16:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiFWU0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 16:26:12 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B7C1532E3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 13:26:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o10so610224edi.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 13:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9DQnJCB/qnsZZ49YdwXaekju9k4tCSafvgxqzP9n2e4=;
        b=Pkfw2SVEODkEr/iN3r2gia1wLufw1vFGeVCgqKehK/nKj1tniPTjFy00fU8Qm5lAXc
         FCC5ZLbyDI7wAvX80ZNILC4EgzlpbjDJbqRHCQ8KXSfDBb2ZzLJjx2Swj2ya4R5hgIpU
         NWQF8fZ72qCynH/W4bOEP1GUD4biW4hBXwnjNFmXnfF80fB5XN61vsm+keE5rWT/Sjjn
         TQyn4PsuSowMsXeX6o6W+gj4EmjFCo/OQECEF+1WvuM7WUObxiwPu+Q8GtyQcdZCRmZ/
         4PZq4Z5Vu6r258j98Va1mAnmRqCXdQe+4ws2GAv2ujbUJcC87OxlDhJ+GmOOCEtp5Rdb
         J7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9DQnJCB/qnsZZ49YdwXaekju9k4tCSafvgxqzP9n2e4=;
        b=vU/e0TmbWD+jgEf3CSh6YFRAcqbMbVEbrXk805r0Eqy4lIOcAreg2efb1SO5JzcGEP
         LaBBlbDbWTlscn9f1aNgXUafFxSpb6N6/V7xpPlRi4wq+K+hoHO+e+ztfBPBieo7QjfR
         LrdC1VTuwVqGPl4buhi2USlPlRR4dCn3cg7BXrjX7JKQHB1dUczPDIPv385L8bw4BoQv
         AfaiodaxwrXpX0fQKOZFky8qNPyfbE2ioGQndcanJxKpkjeB3yEu/4Wb76xmdblHmYVG
         uNCsh8210UGZ89kXBJoJAuslG8pIvNCqWo8VMMJBJqqtWfpYL0ti0DZoE8EfggzEbZhF
         3isQ==
X-Gm-Message-State: AJIora8WfBlcsizYNQ4gE42hTS6yTERNcr7ops7Qe/jk2DMSzMlB5lSx
        iyVq96J2KprlGNXI++548ulVNswR8S0bvzvkXM6Jl2gWMB2tHw==
X-Google-Smtp-Source: AGRyM1udbZoS5HJJFMkz3vP35YFIDi1NipZA1WLbI3MwDL5OTpckKueb5LXpr8ocKVdSIt0x1YRZbhIx8cOMsNjEYcM=
X-Received: by 2002:a05:6402:1774:b0:435:7fea:8c02 with SMTP id
 da20-20020a056402177400b004357fea8c02mr12808712edb.213.1656015968593; Thu, 23
 Jun 2022 13:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220526012946.3862776-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20220526012946.3862776-1-chris.packham@alliedtelesis.co.nz>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 22:25:58 +0200
Message-ID: <CAMRc=MfOdbanS+rBoMnD00z2y015nW5xtyyzLHfHrMi68GHyOA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] dt-bindings: gpio: gpio-mvebu: Convert to DT
 schema format
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 26, 2022 at 3:29 AM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
>
> The 1st patch converts the old binding mostly 1:1.
> The 2nd patch deprecates the unused marvell,armadaxp compatible.
> The 3rd patch documents the existing usage of the offset/marvell,pwm-offset
> properties.
>
> Chris Packham (3):
>   dt-bindings: gpio: gpio-mvebu: convert txt binding to DT schema format
>   dt-bindings: gpio: gpio-mvebu: deprecate armadaxp-gpio
>   dt-bindings: gpio: gpio-mvebu: document offset and marvell,pwm-offset
>
>  .../arm/marvell/ap80x-system-controller.txt   |   2 +-
>  .../arm/marvell/cp110-system-controller.txt   |   2 +-
>  .../devicetree/bindings/gpio/gpio-mvebu.txt   |  93 -----------
>  .../devicetree/bindings/gpio/gpio-mvebu.yaml  | 146 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +-
>  5 files changed, 149 insertions(+), 96 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mvebu.yaml
>
> --
> 2.36.1
>

Applied the series, thanks!

Bart
