Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FA554C9B6
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 15:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238254AbiFON0w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 09:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236362AbiFON0t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 09:26:49 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250B73F302
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:26:48 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id t1so20532579ybd.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2uJBdNrvWnRJEqnKZPpIHQmnT1CIlbB2x7GUHZk371o=;
        b=svkVmIzhK2OAHpVq1j7D5Y0BMlGsbs/r5txjoPVTRQ3mxbX2q+KeDYS5dFr9SedA1U
         G+CX/SEC2YDtM171HS1vYVFypF4406i/Gp4cjq9VGt2NKyJlaxFACzAjfml3uTZ3ABTT
         Bpawy4OLBnfnplZabQ57yj1fBScfFeEBlM3hbYQJ1dXlZHVmZbcgjKyDREq5hVzRnN+b
         IB5WjZRUVCHQXSGfEW/U8kRnKjCVfywJVT3+PMNySB+DKE/v2s/UUYLBD+K0l8Krw2UF
         0xuRAJLoVyxOH6swQ4Jjbke53RsOiIGZp5lG8ZzAG07mAFtniFJIWDPlglXPq7A4itVN
         wRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2uJBdNrvWnRJEqnKZPpIHQmnT1CIlbB2x7GUHZk371o=;
        b=fkOyD+CX8+M14lFT6PLqbu0wDb4mU45LbRhSuHzZKdM0MzV6W42zb0NxjCpQ/dtvL7
         OxP1+3QUMdpsGzhEn+W4Vcx9mlMa0fqIKJgNt1onh/pquAkiD2gVxYFa4Y5aOGYCg0bJ
         1dfcVCkhr29Qi9s3ESm0zRdGqBKHsPkFN2vjtH3vL5D1L1A1yPhOC1XaSPkzevuaAD7T
         XWyM904xQBRh+PUfov413H8rwTgWbpOQd0XsuFEt+9049kPtd3EvLObgyOKIeK2gqAOT
         lQIDl3wcDPSBiB/VD8SiCcSbDsue84o6QgkVEuyc6xOX6mScgYf3kZPESVFxrcWqs941
         oRPA==
X-Gm-Message-State: AJIora8k1eBN36rqnwO872bWEL95a21L2R9tJTM6HQ6bGy4KqQmi5cl9
        jEA+hX++vY/MIwv4FJj9BVHyBmdkpPyen65ICxmFBA==
X-Google-Smtp-Source: AGRyM1uXbFdzJy6wHZ8d8kshG4hHCgicMvgdaZy4F6zLHljayPXpaH/KNqKvp55V9OEMRLWm5czLWFtEK5L8lLi/+pU=
X-Received: by 2002:a25:dc0b:0:b0:65d:e5d:a87a with SMTP id
 y11-20020a25dc0b000000b0065d0e5da87amr10584832ybe.295.1655299607356; Wed, 15
 Jun 2022 06:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220531053623.43851-1-samuel@sholland.org>
In-Reply-To: <20220531053623.43851-1-samuel@sholland.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jun 2022 15:26:36 +0200
Message-ID: <CACRpkdas0MEu5ShkdJr-5rrM2i5LkrwARmC6J=X_UQGkRrc7EA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: sunxi: Remove non-existent reset line references
To:     Samuel Holland <samuel@sholland.org>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 31, 2022 at 7:36 AM Samuel Holland <samuel@sholland.org> wrote:

> I assume these properties came from a lack of documentation, and the
> very reasonable assumption that where there's a clock gate bit in the
> CCU, there's a reset bit. But the pin controllers are special and don't
> have a module reset line. The only way to reset the pin controller is to
> reset the whole VDD_SYS power domain.
>
> This series is preparation for converting the PRCM MFD and legacy clock
> drivers to a CCU clock/reset driver like all of the other Allwinner
> SoCs. I don't plan to add reset lines that don't actually exist to the
> new CCU driver. So we might as well get rid of the references now.
> Technically this breaks devicetree compatibility, since the old drivers
> expect the reset. But the CCU conversion will be a compatibility break
> anyway, so it's a bit of a moot point.
>
>
> Samuel Holland (3):
>   pinctrl: sunxi: Remove reset controller consumers
>   ARM: dts: sunxi: Drop resets from r_pio nodes
>   dt-bindings: pinctrl: sunxi: Disallow the resets property

Patches applied for v5.20!

Yours,
Linus Walleij
