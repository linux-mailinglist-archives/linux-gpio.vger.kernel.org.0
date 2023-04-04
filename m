Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9856D64BE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Apr 2023 16:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbjDDOGd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Apr 2023 10:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235605AbjDDOGK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2023 10:06:10 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E41F5245
        for <linux-gpio@vger.kernel.org>; Tue,  4 Apr 2023 07:05:50 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id k17so38771785ybm.11
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2023 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680617150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/rAq+ST3GBb2vUM4m8DtvtohGPy7+QO7yjCXRomrhI=;
        b=scZVfz5ryQtum9HOUhBLd6U+SRbeQdOY7ntr1sB1wL39EsWMyp1eZ+TaDyCAFdHS74
         PT2H8y57Rr7zYQxewXQBb1W3tjx+PPa55CaLQTJOJMhuyG+tkXp9qDw7KpGY5eeiEu9z
         5eSg2E8PQQ/1Y5bVnrhXuCfex9m0tQmdQ6Nv5KP4/HuIfuEVEBz11HxjQBB8u7sb5LHV
         98Mx/nGGYptIGjvPTzQWiOfDLUuZ3kn+mNBXQcS0uB2YP3LAR1NHggsVDBrLK6Q/3A0q
         r/TKMO0hl4dMiJRTnd3s5TuGoiSGwuvIl/XR04mdRPG011jVIQHesVGJVbBlmPBFwRmT
         StUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680617150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/rAq+ST3GBb2vUM4m8DtvtohGPy7+QO7yjCXRomrhI=;
        b=d/gNcJDL4t5I9VzMFSdKjsSVb/ycN6nOgv9jVM1yLzKUuT+g/N90xHiWFqgOXlETDA
         zbqLDrbFmoNh6sRwHYHV7p85oJOV+onzoBRO/qXHced3JmZs0EvsiQDUItMiMg8BqbsW
         bIgfxIh3RzllBciLtb0oQZ+5AFjPip0W3GJn6PIFlEjXa9qhXuBJ3CHFrsnWshsuJT01
         TH/9DYezhOMSCkZhXettHT954DOQFFduzGUDfuBe+0aFe/xVCD1p+V+zO3p0r0xGeYgm
         6JhqtB5zMr/3DigLVDplbkg6ctC81+M87lszEia51TkGFKv36ZyA1Q80ZQDK0pujRQc5
         vY5g==
X-Gm-Message-State: AAQBX9djCI9uw4msOFpIQ61D0eU433KVWSO/nDL4gEpXg2nzMX2NUsWm
        FEvLlhaRgSQLV1c9cGXypNgufrN5OEAQO5UYla8BbQ==
X-Google-Smtp-Source: AKy350axZePoyx4o9rTILxAsbYkfqxgivSY+UY0/KR4iEdDvk1UQSC2TmZR7wYJl6Qpynoa1bHyUBL3hoWmZg2/iTT8=
X-Received: by 2002:a25:c383:0:b0:b09:6f3d:ea1f with SMTP id
 t125-20020a25c383000000b00b096f3dea1fmr1966432ybf.4.1680617150033; Tue, 04
 Apr 2023 07:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230403114033.8336-1-edmund.berenson@emlix.com> <20230403114033.8336-2-edmund.berenson@emlix.com>
In-Reply-To: <20230403114033.8336-2-edmund.berenson@emlix.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 4 Apr 2023 16:05:39 +0200
Message-ID: <CACRpkdbnj-BiA8D0e4nza-za-E8g_AEBNjR4b3gWUZpw70U33g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: max7317: Add gpio expander driver
To:     Edmund Berenson <edmund.berenson@emlix.com>,
        Michael Walle <michael@walle.cc>
Cc:     Lukasz Zemla <Lukasz.Zemla@woodward.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 3, 2023 at 1:41=E2=80=AFPM Edmund Berenson
<edmund.berenson@emlix.com> wrote:

> Add driver for maxim MAX7317 SPI-Interfaced 10 Port
> GPIO Expander.
>
> v2: adjust driver to use regmap
>
> Co-developed-by: Lukasz Zemla <Lukasz.Zemla@woodward.com>
> Signed-off-by: Lukasz Zemla <Lukasz.Zemla@woodward.com>
> Signed-off-by: Edmund Berenson <edmund.berenson@emlix.com>

Notwithstanding the other comments from Bartosz, this seems like
a driver that should be using the regmap GPIO helper library.
git grep GPIO_REGMAP will show you examples of other drivers
that use this and how it is used.

Yours,
Linus Walleij
