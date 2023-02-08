Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9ED268ED84
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Feb 2023 12:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjBHLIY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Feb 2023 06:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbjBHLIX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2023 06:08:23 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66BB84491
        for <linux-gpio@vger.kernel.org>; Wed,  8 Feb 2023 03:08:20 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id x8so13343443ybt.13
        for <linux-gpio@vger.kernel.org>; Wed, 08 Feb 2023 03:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H3UlESeBgDciAANYrbDYeDSe/nLTXzJWVU7vv0QvjTQ=;
        b=FpTH+5SNG50VekrvfskE3miwhfUFl+CWP4tBydhtVNcsbNGeVvYDyBR45eJn3DiqC+
         RQApd/xtzL6xrDBazYsmciFcRnbB+A+8EVTN8uOr7YbtjfTyCkvhpbSYs9PYUQzNPSQ+
         IfAjUFG3UrAWy7KH515p6NiHKTERG1xLCsjZitWwrn4hpUHG5myGgFUyqkjcNszyelPE
         4XgiaA3YlvBsYmYmJDOhzWb/jXN3mRFaOwqmiLTMVWotEINHmsZT4XlDLf7+pEaAhLRX
         zUmDirZkeX7gifq04Zt9YgA443YIJ8UBXd7fFsMj2naruVfbTHXO0x/comBGG06fqMed
         fMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3UlESeBgDciAANYrbDYeDSe/nLTXzJWVU7vv0QvjTQ=;
        b=U6HJ2xF76+sI8R9fxO/z6syZbudWcneB469rID8+7Zlmw6x5JwRsEPk/I3bZrRvQ+J
         Y4zEDdxrD2TNkCB1GZJY9FZ4ZthBo+5d41nKM8cSbSW+WW1zqIv4WwfR3KMgKSL4Kb52
         u76Axj7/TfhOoVqm4JUo8VmceJZQpdlAaupcvXsXYNFGtzyVxdwH28+R/hNUdamQxV6L
         B7Z7rjPHuL6hWBRHlU7nmm/p6KMVdp0zFHmdwtZJpxOgpn+eH2UNHuRdGy9H7JGOzqwJ
         HrQX8FhBd6pL5UF+dXS9Ob/WGMGPDovFNu3cR3lTP+Qx4odfHegKblnd2KObBDlRDWwK
         /Feg==
X-Gm-Message-State: AO0yUKXzysSGlErg3EQsU63+QVYPmzUqpBHvKJuoD+T8FP5Amr9E6lxk
        JkkRRn+0dmGcyu4NzEs5LsmKYP49sTU2KSqf+ktmoA==
X-Google-Smtp-Source: AK7set8xHbCP+Q2iJNCuxgj4D+UrE9o+1uWIfbVQJLQpwO5h1x/YO2XK51m0DHdQHHPEJpJ0k7HEhsu/xE2qaEsRvws=
X-Received: by 2002:a5b:85:0:b0:8c0:638c:74c6 with SMTP id b5-20020a5b0085000000b008c0638c74c6mr252977ybp.341.1675854499608;
 Wed, 08 Feb 2023 03:08:19 -0800 (PST)
MIME-Version: 1.0
References: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com>
In-Reply-To: <03627216-54b5-5d9b-f91d-adcd637819e3@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 8 Feb 2023 12:08:07 +0100
Message-ID: <CACRpkdbmXri1vtRShm7a3N0sRA7Qg_ni5FpAtiEv+72a6g9Wng@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: gpio: rockchip,gpio-bank: add
 compatible string per SoC
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     brgl@bgdev.pl, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        kever.yang@rock-chips.com, sjg@chromium.org,
        philipp.tomsich@vrull.eu, john@metanate.com,
        quentin.schulz@theobroma-systems.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 21, 2023 at 12:06 PM Johan Jonker <jbx6244@gmail.com> wrote:

> Currently all Rockchip gpio nodes have the same compatible.
> Compatible strings should be SoC related.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Bartosz can you merge this one patch and keep the rest back
so we get a more defined DT binding baseline?

Yours,
Linus Walleij
