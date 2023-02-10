Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F578692A6B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Feb 2023 23:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233995AbjBJWpW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 10 Feb 2023 17:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234000AbjBJWpT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Feb 2023 17:45:19 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C116D75368
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 14:45:17 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-52ec329dc01so68200647b3.10
        for <linux-gpio@vger.kernel.org>; Fri, 10 Feb 2023 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C8zbQ5UeRyMGBzBZKt+eKJGEp6xhDoMWS6ByqtAI+qQ=;
        b=jQ66+heze0J6Ozux4oG4WwoV+2CsrGPIRzg+v+qWUt4V83/YkynKLfwyVpYb+1LWaP
         dPW+6PSP90qh1UZoiGZy855Nf6gP2UwsCAio30PTEy4a8ujL7chBJ9yn0b++wrXuI0c+
         O1zVLv78LwEp/tzHG+hVFbN+DyHr4mAcv0zuwNizBDOhrrkE7Ed9hCnPLTZ9QDOGgvpp
         PNQ51xkGp2cOp041e2sIipfx6dTL41Jbck530hz0dmBsuaiwp/P6QznD6xUh2QbsTp1x
         kxiHqPlVnGJ0PF4Wy3GubcS5OpPTubUhMTtkjwfjsnrRnHKlCzvUFnpCs3YDG0/xXD7/
         zssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8zbQ5UeRyMGBzBZKt+eKJGEp6xhDoMWS6ByqtAI+qQ=;
        b=JdK9mKrGhmQMvTauzocBDtN2t3WLOXK8SXRffSXCD3PNzWxtLeJY7UUBQySMUUk8/U
         lD83c7NIAnPFG8U7hbME5Y9r8zfTCwwvjK1Dai8kEfOgPNbEgGfxDjerUBp2aJQ9aH7s
         DNBd+X9Ngo9yO+sFUnkZYG/ofuvLnj1k+5iWZW1/2VUsveL7vnC2b8+NqDnx4p3VtFRY
         Mm9xDpn5wP12Up35Cc28xZQcF8GcHXWbDRph5e4ZjdFGoXbW7wkxqmXSKjWTKpZXuBeF
         s2ayE+znY7HRQVWZ6FPnPhlQQc8lroVb8KKYL8a4eLjMxQ41GsoPbIVkbGGGP9IlPFUU
         zBHw==
X-Gm-Message-State: AO0yUKVuHJGy7awW5iDikKmsCrWYu76Ivtc3Tl3p0Er4G0H2A6GtBcRi
        hNCPeapS+3yD4YrwuUAVdwqGp5jTk6igf5i0+hs0ug==
X-Google-Smtp-Source: AK7set/6Xvi8CzuNgX79rZvneMkeXDi2US6l2P8G1w1iVzuJBaisym39eN4L1EuUt3tZClsyw0XAtI+QRSxWibIX0QQ=
X-Received: by 2002:a0d:ff45:0:b0:52e:e6ed:308c with SMTP id
 p66-20020a0dff45000000b0052ee6ed308cmr61064ywf.524.1676069117008; Fri, 10 Feb
 2023 14:45:17 -0800 (PST)
MIME-Version: 1.0
References: <20230209143702.44408-1-hal.feng@starfivetech.com>
In-Reply-To: <20230209143702.44408-1-hal.feng@starfivetech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Feb 2023 23:45:05 +0100
Message-ID: <CACRpkdbao9M5dMHFO_QE8z4_E6DZLZsMUW1OnUNjKSfQc59=ew@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Basic pinctrl support for StarFive JH7110 RISC-V SoC
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-riscv@lists.infradead.org, Andreas Schwab <schwab@suse.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 9, 2023 at 3:37 PM Hal Feng <hal.feng@starfivetech.com> wrote:

> This patch series adds basic pinctrl support for StarFive JH7110 SoC.

This v4 version applied, the driver is in good shape and all bindings ACKed,
nice work on this driver!

Yours,
Linus Walleij
