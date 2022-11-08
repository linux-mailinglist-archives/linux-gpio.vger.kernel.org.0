Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3646362154F
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Nov 2022 15:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235220AbiKHOKZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Nov 2022 09:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235228AbiKHOKS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2022 09:10:18 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA81818385
        for <linux-gpio@vger.kernel.org>; Tue,  8 Nov 2022 06:10:14 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id 13so38990714ejn.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2022 06:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2yiVoAjbKu5g1coXsCgJKSnFMV0KG9qA5Tyi32t7Ao=;
        b=E+Y5suCr+yzSgsxf4CAfSwYU6qGOO0WXMEkeGneCrQ+Iyi9y6tbGvKL5nPmcDJfi8w
         pBRCnFGKuoZyeBArf39VyK3ZZxF0UArrsfuYkFD99eV+vj2vPYwXvm32Lx51/J8aL6+E
         EQ35C8r2LkqPXoFZDtyy8P8o7hr0NpodczxJikqJGsrEdN6sdeJKEMFL7cfdihbeXt1G
         5i/M80miQtpmOEfIyLsVoVz3BidmwMt0TUuGW0HluWHy/O+zDKJuXDKTT76NtQNkElZ/
         QzWnRmiaY41rENQ/b5cRhNoa0846ehVG/lRFOiEkHB3XMHIjedSLr389ryO3KI+mYe3j
         ZcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2yiVoAjbKu5g1coXsCgJKSnFMV0KG9qA5Tyi32t7Ao=;
        b=P2Zk78a2NQUEDSZys1YZ1M/Z/WlC8knpTx+JlST+eoVuafWk3nzGv0O5BbwKZB3OVH
         Kp/WCCY31Y769mjZFWONuDvWe/V7ar0P4dnpQvpD8YIU00JJ3jHVw+BKkoN65hyTMhFA
         O2RENzmRtMn8GyjcG9Fu8PClBdwjy0t9AiOx87BzkWIUXdI92edGisv5eb6CeaeHPaMk
         ZAIXn+MLZ0lgzy8UcCp5phHC7786KAddRAtbQmsM0+xqC4iC6mjaHwqvlFUoPyR0QIBF
         EU1L8egVyaYiZdbo8onv7Mp2VzMn6sXTJZ1c5zISF8lfxzzKKmMuqDDhCFOHo+F6f2F4
         K5zA==
X-Gm-Message-State: ACrzQf0aGECarSvyFPbuA2uI+tzzkzCn/WQ0C63p48TxdpxlG1PJP/v3
        kOFIfYxfClFMkJJG+M5OeubFAobI+A+2ECU36yVprg==
X-Google-Smtp-Source: AMsMyM4iXolXTKOej2MHua0HeSMKari1EAYAvBP6NBtB2bCwfNK4fQb+QUIw0XHsAzpw31HAyvjVJBRFlyND+fysAUk=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr21317787ejc.690.1667916613344; Tue, 08
 Nov 2022 06:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20221104142345.1562750-1-thierry.reding@gmail.com>
In-Reply-To: <20221104142345.1562750-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 15:10:01 +0100
Message-ID: <CACRpkdYT0X09bWYg9za8x+3YkcbVmBm8Prb0Fyk2nfi_eanDyw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] pinctrl: tegra: Separate Tegra194 instances
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 4, 2022 at 3:23 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> This patch series changes the pin controller DT description on Tegra194
> in order to properly describe how the hardware works. Currently a
> simplified description is used that merges two pin controller instances
> (called AON and main) into a single DT node. This has some disadvantages
> such as creating a complicated mapping between the pins in those pin
> controllers and the corresponding GPIO controllers (which are already
> separated).
>
> As a prerequisite, the first patch in this series converts the device
> tree bindings to json-schema. A second patch then adds an additional
> compatible string for the AON instance (along with more details about
> each controller's pins) and finally patch 3 converts the driver to
> cope with these changes. A fourth patch makes the corresponding
> changes in the Tegra194 DTS file.
>
> Note that while this changes the DT node in an incompatible way, this
> doesn't have any practical implications for backwards-compatibility. The
> reason for this is that device trees have only reconfigured a very
> narrow subset of pins of the main controller, so the new driver will
> remain backwards-compatible with old device trees.
>
> Changes in v3:
> - address more review comments by Rob Herring and make validation work

This looks good to me!

I tried to apply them to the pinctrl devel branch but this happens:

$ git am --signoff
./v3_20221104_thierry_reding_pinctrl_tegra_separate_tegra194_instances.mbx
Applying: dt-bindings: pinctrl: tegra: Convert to json-schema
error: Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml:
does not exist in index
Patch failed at 0001 dt-bindings: pinctrl: tegra: Convert to json-schema

I guess there are some prerequisites?

Yours,
Linus Walleij
