Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8AC59BBDA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Aug 2022 10:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbiHVIk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Aug 2022 04:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiHVIk5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Aug 2022 04:40:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FE3824F2D
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:40:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t5so12881234edc.11
        for <linux-gpio@vger.kernel.org>; Mon, 22 Aug 2022 01:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GnZDQk5LIMr3GakBSGKOOTY0TqMjUwPWov2oTvBE8VY=;
        b=QuFb/+6BgnyHjY7GUkigM6akFlS73LREIX442mm4x/9Z1G+ycKJqf2j5IrdRcs75NN
         RRYJbeKqq9ROKV71zIzBZ7ILpBJCuZN2EV31M21q0xEFUwo3shz2gnMFR4dqoNAK1ZG9
         yUKM98+ZYTTjLuGX2lkEKY/X24sInfRZq7lRS1ZQLFNE58JTMadkNtl7VdA93ivBlXA6
         TMPi/H5relC5jaUR81A9i5jCwrP0sA6SuVXBN9ixXHH0xLfpRHVnT18LNV1Xnc+k2VFO
         ciVROB4o6vFEvVq00fuod8PZr3DsaS4xdESTuRrI/7aEe6GusU0v/TO+jHLuCybblGsn
         jEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GnZDQk5LIMr3GakBSGKOOTY0TqMjUwPWov2oTvBE8VY=;
        b=TYlm0m/MbPHqEqvhOwHdXjKdUsfqBY64Mw61/6fWpl8pOxNv48EsoUkAUNJ90YOKEq
         rjO9ZiVYANZ6OtvLjkqNsyO5yqz9BwoWEiprus3VY/QF2Awy9ks1RLeqOFraiTSbN80A
         a9nvfb5dfoh2+yT3DDRIKsl0weg7kSYEWw45lSOmx0GFwzk4diJlPN5NuTFW2RnPiTnk
         mJmVVk6sn+REDZhdV8R5UQy9olKolJx37tfRFJbmsKa2Wyob4AXR7BFL11CfgLonBoAH
         wWWXQDwJd+RsTwztSXJEdOA1F0v/5MPVFCjyxfnTGzHWUIjgrvgdTCJlmRfa44JEA53j
         CNgQ==
X-Gm-Message-State: ACgBeo3y7JHNwHNYB4u8OMAy8P2kKzqvInzb4AZ1sSpsTRHuYSmfZRRh
        ZBdvjznoVJ+ncGX7U0lkamY87bnkwnZ3HqHwADdwaQ==
X-Google-Smtp-Source: AA6agR7+bvymtWvFD4LuKjtyx3OvO8Vfz51R5D1pvn1aa/+bcPY44H0zMEpdWk4hX0KzZOCyP2zNazCT2i0mHi5SI2E=
X-Received: by 2002:a05:6402:641:b0:446:d:bd64 with SMTP id
 u1-20020a056402064100b00446000dbd64mr15720568edx.32.1661157654999; Mon, 22
 Aug 2022 01:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220802110232.130758-1-francesco.dolcini@toradex.com>
In-Reply-To: <20220802110232.130758-1-francesco.dolcini@toradex.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Aug 2022 10:40:43 +0200
Message-ID: <CACRpkdYLSB1JV57_FbJ096DpnRhWBU9qafb4oEsTZ_6xspUO6w@mail.gmail.com>
Subject: Re: [RFC PATCH v1] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
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

On Tue, Aug 2, 2022 at 1:02 PM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:

> Change PINCTRL_IMX8M* dependency from just ARCH_MXC to SOC_IMX8M,
> likewise is done for other PINCTRL_IMX* kconfig. This avoid polluting
> the config when SOC_IMX8M is not enabled.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> A similar change would be needed for drivers/clk/imx/Kconfig,
> in addition to that the other pinctrl are selected by the SOC
> (config SOC_IMX7D -> select PINCTRL_IMX7D), while this is not true for
> IMX8M and these options.
>
> Not sure what should we do exactly, therefore the RFC tag, I stumbled on this while
> slimming down the imx_v6_v7_defconfig for my own needs, and after disabling SOC_IMX8M
> all these options were still enabled.

No comments for 20 days from the maintainers so resend it as non-RFC, if the
maintainers have no comments I guess we apply it and see what happens?

Yours,
Linus Walleij
