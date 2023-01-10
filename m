Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14231663A39
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 08:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjAJHyx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 02:54:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237753AbjAJHy3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 02:54:29 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B081C93A
        for <linux-gpio@vger.kernel.org>; Mon,  9 Jan 2023 23:54:24 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id g4so10966901ybg.7
        for <linux-gpio@vger.kernel.org>; Mon, 09 Jan 2023 23:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M1HA+cUB8IN88uId3+2+zul+0QRsM4IYV5HaTxUg2o8=;
        b=ilvUVPx25OH3XNmE6VPoLRn6bqaJSPeWJn8Ir8cd9MgUZOAHsJycQV4sOLqd1+6DY4
         XAKhTVYNnLhSfK7NHNKM5MN7E7yEqTCioo6nbACSo3q80Si3AbmkAudS7SW6ZgswnsWk
         iW2E92oUtIv39FYjN79fSzAH+m58CCOmkR4i1kFWe7+1cdRaAfcBhlKw8zMCDGYPcIrh
         V6YlLvcehJNFbQpDjOJ0tjTWaTRL1GfbgFy+z2fwOLjQpeyyiPPpcwurTK6Dicw8mIyx
         ed3YFANM9iSdkO0SYBYEd+Oi6xmhfnendwnhLo886z3aeNWJfnQPqIOcrijwjLK+1vVM
         jCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1HA+cUB8IN88uId3+2+zul+0QRsM4IYV5HaTxUg2o8=;
        b=oIXPKsdB3t+gBKezbmUaBwtok0Ee7yI3VQop+Zyh/rrt0DPM63p/JJ634gKdGMqd2I
         zgjiQCrVPw3f7uU4F4u2eyun0aR3lHzc4T/zI2k+x2vlOUKWmE3ZRnMafcXQWk3uWNCN
         ArO79YBT9Rl6r8yAf01CaoY7/k3yxVGoWs/3SEEqFavxJjAQutmtUCDYfFtl7Udeo0db
         qnfAXojHmNXUcbk/gO7LYVw2l96sLzkGFmD7mMSPfsR3ujwJ9mJq5qFkab9cVzRC5dz0
         ADrrTmXl3c1l/jOVAQG/N5iW41sWBR/AaVbPjP8lkax6hW+5eYEECVtvBzwdiRsYEVW/
         ATow==
X-Gm-Message-State: AFqh2kqQ3/xYItEU1kJ4uf5eQ2QR0fEsXU9GhKXoYaPeUfQDWDK+jQfD
        19YWSLeBTK6N/iKCir00ZY7VMVDHlB4k1mRr1oKZtg==
X-Google-Smtp-Source: AMrXdXuxq1hU1ANfE7x69zRH+at5knWFVgWEGqMr5dBQpesWF7B6/CJi/6pfxL4Ad9TNAlTVy08sM+TyJ/s2Y3KsRPI=
X-Received: by 2002:a05:6902:1817:b0:723:be61:1a2c with SMTP id
 cf23-20020a056902181700b00723be611a2cmr7642350ybb.130.1673337264115; Mon, 09
 Jan 2023 23:54:24 -0800 (PST)
MIME-Version: 1.0
References: <20230104021430.3503497-1-peng.fan@oss.nxp.com>
In-Reply-To: <20230104021430.3503497-1-peng.fan@oss.nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 08:54:12 +0100
Message-ID: <CACRpkdaBAc78_Z0-rVBdqNF0ejt4Gnk+i2SG04LL0YYM9Kb5TQ@mail.gmail.com>
Subject: Re: [PATCH V2] dt-bindings: pinctrl: imx8m: Integrate duplicated i.MX
 8M schemas
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     aisheng.dong@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, ping.bai@nxp.com,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 4, 2023 at 3:13 AM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> The i.MX8MM/N/P/Q IOMUXC schemas are basically the same, it does not to
> have four schemas for almost the same binding.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
