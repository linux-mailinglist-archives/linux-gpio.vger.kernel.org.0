Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC06F45FC21
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 03:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347819AbhK0CoF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 26 Nov 2021 21:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242743AbhK0CmF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Nov 2021 21:42:05 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39271C09B107
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 17:38:02 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id a23-20020a9d4717000000b0056c15d6d0caso16264335otf.12
        for <linux-gpio@vger.kernel.org>; Fri, 26 Nov 2021 17:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/qy2fVsf4IGu5lXH6K0cKVvkPysB8kLgQcCvFksozo8=;
        b=zZRP5+zdTlaagOcbSDxdZ8PuDDuUy/L7LJO3ttHZgQKDlJZE15kNsEiERS21axDcsC
         LUccGVJA9lb+7+bYI5T26Wcb0epFTa0M1Nx7WJgiB79+Z+psUQFoEeivKe2Bfll4f7Ei
         kGlgsOtT3+8TXnqwDPZjqH7LzRmyLYemCBZe+O+KhCaiEkZ9Y2U1l7ffKXknVZqlwtwQ
         FYg8gLxqYn+eSuaag/GfU7zEZfVgmhRyor0e+o0IH9sqXJffV6Ku+SSRsgZJPeXC3Zdk
         hSJzuzKj1vhJCythfVssJF0MTrJMICurmBvllcMeH3K37r+MWPcIZuEYhUMft9+VL7Ul
         wajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qy2fVsf4IGu5lXH6K0cKVvkPysB8kLgQcCvFksozo8=;
        b=EmBButPtzFnjNko/xo+yQ7PaYmkwcISI2r2XIseouxPnuA+6LhVsVpYh63tu8IE0PC
         Dmkj2dVWjuDexVWfG4F8iJtKaiB0b1MAIs+dgCYB9Rn9N6D7xB69IDpBzG61UM1zy+ZQ
         jxQViopOL9/7Ei2XWRyhIXRJvV6N2I+3XJkixPejad7o04hE5UwPG/nV/seoCw0td26r
         oO8FAm9U5ROlJzxstwUbl/pz5fw36EZlmbWy414IB/5LWUoY7oqZWvr5ECWTrX7JA/w8
         zGsdV0YssY6ZbxHzU6vsGgEcx+6Ab1vEXjEMTsO2nOEmo6zYAu8owyRPgn9DskB4sPW1
         hXjA==
X-Gm-Message-State: AOAM531tTyGo2HC5uuJ2s+M0gRDYkthx1dIpgZSqOboaVPMRKOzq+u01
        cjuzwAuiU3rI3ZvpFf2Ejm5Z+hRQHuch1llMhBN6Rg==
X-Google-Smtp-Source: ABdhPJwz7YlhjlehvhsdllSAlratkmK3DP53zBfQyCzOUts83RiuSgVdEJlFvaYiY3fJrk8VgZ7a0E75/laPJ89l+QE=
X-Received: by 2002:a9d:74d0:: with SMTP id a16mr30440684otl.237.1637977081591;
 Fri, 26 Nov 2021 17:38:01 -0800 (PST)
MIME-Version: 1.0
References: <CACRpkdau+wHpoWa1JrLt35dnCHJejs8HZkkzZCrrcnRCx3SinQ@mail.gmail.com>
 <20211126163657.65471-1-dominikkobinski314@gmail.com>
In-Reply-To: <20211126163657.65471-1-dominikkobinski314@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 27 Nov 2021 02:37:50 +0100
Message-ID: <CACRpkdYdOvpS0GgHw9UfMrfnUeEphKUk-y-0vKYSsS9dWc3r3g@mail.gmail.com>
Subject: Re: [PATCH v2,1/5] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
To:     Dominik Kobinski <dominikkobinski314@gmail.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        ivo.ivanov.ivanov1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dominik Kobinski <dkobinski314@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Nov 26, 2021 at 5:37 PM Dominik Kobinski
<dominikkobinski314@gmail.com> wrote:

> From: Dominik Kobinski <dkobinski314@gmail.com>
>
> Thank you for applying the patch. I believe the second one in this series (https://patchwork.kernel.org/project/linux-arm-msm/patch/20211125215626.62447-1-dominikkobinski314@gmail.com/) should be also applied to the pinctrl tree.

Looks like the regulator tree should take this one?
It is a regulator binding...

Yours,
Linus Walleij
