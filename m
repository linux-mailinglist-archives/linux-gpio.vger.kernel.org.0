Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF6E50932A
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Apr 2022 00:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382987AbiDTWut (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 20 Apr 2022 18:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356345AbiDTWus (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2022 18:50:48 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62ACF27CEA
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 15:48:01 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id x39so5533747ybd.8
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2022 15:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WG7/qwwohcpveFC4b8orrcY2Egx4HkLeIUdFzvNQsBw=;
        b=TBNK+8sCpnwUhRpU31FcSoXPxZaCvT3r7rHCZv1MtLFkhH/cz58NjZghZivpj8BKOC
         GDtAHelUiRXjcjNX+ao22qTfzgkNYsSH+WlbbqYgbvmd1ul7JUKuO8HzieDZ61jZ/+za
         TlnW9tNUwBCx/e4zgUk6Lm2yGpGB65Dm9wc53WkHtxCxylce8/wlYXHBxeplfzlO7DSu
         o/nRH3PXAJsRMsNgbtBJ8i66CsSAuVCWy/id+8Z0SgMZlrH9d4mOb6DajMAaUGt2ebSn
         LfWNpQCGE2gSf7aBT0Q5+YgVnCY9VHlRBHzTX8/kdaBiPRhcLuMMqypcvzt1vqjvjd42
         yRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WG7/qwwohcpveFC4b8orrcY2Egx4HkLeIUdFzvNQsBw=;
        b=ZeDHSj2bu6bTU8ZnFR/s6bBp0Dlh33x3XiFzN+ha2C4BmJTmrlFmPKwrvk8S3si9mF
         tgmf9sJkb0GCi3PhP0s0P24oMzi8hwlqBXQnoLj1EZ8bLpDeyyhOzD7svAu3DIqke4/r
         ZQ50RAHe5Y1i7ENv95yuNO5T7KB1lQwbwYso0QLlgdV0JyEHbq0WfmOuLY3Lshuf78Wt
         dVjM643jNvG4OUJ+ChhMcNWsbnIjsD/L7Zdd7L2rn46lW4vQufFEaq9x+vJOD6bWzPEB
         aEhqia4j5UpEUDmtPbOfBbnkhxpOFc8oupqcQ5s/v3vyFch6CfU9dPEeAEdRs4RpneT+
         +i9A==
X-Gm-Message-State: AOAM532GqLe6NutsdP7eeeDhP1YQUKz6EufjqO53+nbUExZpUXnLyT5Y
        OwAxSVu9fhRHnmWiL54GTR1a6ygunRM04QOZg7iEgw==
X-Google-Smtp-Source: ABdhPJw5zggL2YRAEeNvlNutCZhqAv9nIbUO/Rc3jMBFnVNBGK+G5g8V9dSnMAfMY6cTp8WCuRyHlfSAlFWYsm94R60=
X-Received: by 2002:a25:4e82:0:b0:633:68d7:b864 with SMTP id
 c124-20020a254e82000000b0063368d7b864mr23178848ybb.514.1650494880700; Wed, 20
 Apr 2022 15:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220303150653.1903910-1-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Apr 2022 00:47:49 +0200
Message-ID: <CACRpkda-Y8cbRkPcuBr0gRy0NDXkvJ0tE+i4uw3ic-mTDLv-Gg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Convert i.MX7D to json-schema
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 3, 2022 at 4:07 PM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> Convert the i.MX7D pinctrl binding to DT schema format using json-schema
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Patch applied!

Yours,
Linus Walleij
