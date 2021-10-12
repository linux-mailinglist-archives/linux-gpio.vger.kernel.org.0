Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18F242B0A3
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Oct 2021 01:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234294AbhJLX5A (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 19:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbhJLX5A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 19:57:00 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7DD6C061570
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:54:57 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id d9so2612145edh.5
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JsDhOlqzhOapvl8qxZ/zkHGlh54hY6Kt5vSuddjS2m8=;
        b=jNR2hBGDsozEooWWvO9GWItqGjJUZg4h7ASntvUqvgN263KyNqEKuIkQ+9JwuLlHJC
         rmMLJRkNYZtc+mINxh1zuZgPeE1Y4VHbmk5J0p2QfEeWGRRVHfTTtkVfOwrQiQhSrjuC
         wXLlSvn688W0u9euPEq04KXD994cwEft8X/wUu06OvI4u8Gb8GqvFos8PCsl6d0SEvhM
         9VX55ChOyMd28ZGMxsrOEwLfTO5YnsL4LipilL3VlmJxj5khEcDbb2+84Lqk1ixZucX5
         tEPLqip+3aX6X/FIve2FBOCF0p0gtx1yFx+m6jHuel+Nzt7P6GFO+uHVzcBN85JYvbLI
         MQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JsDhOlqzhOapvl8qxZ/zkHGlh54hY6Kt5vSuddjS2m8=;
        b=vy8ZUM7wXC/GDwBb7PTUenJv9nm+VqPbSURuk/aDh3vDev70iqnWfOidtYmd+hwMV7
         iq9FGQEPRiBK6DKJoBG/Ci/0sUjuG1y1/OKv3npxTk+osJn4hJLFd1aeoAnJRoFxvm2E
         l8VUVexXNVqs74I7NKYu6Wa2rokCeWdQfzsV9VFkCOLX8bapAyAlXFX8AGmPqA+vSteh
         upwn8X7J1AHNRF1uXpR9nl2VU6fz6mA6xRLTi4lMqiudW3oCqTLVtthxgKiQZdLwQv/y
         I8spu/tzdRQpoxkwkUDQ/OTsxPgdPX+KIN+oOU9EQr+UA2lGavcwIkr+7PxfgM/PysSE
         shRA==
X-Gm-Message-State: AOAM533vjIsDpXhhBmGoZoqKYDcgjWgwKDFonU4ecVQLyAuYjjwub9+z
        hAE3ltOVAkCUBfOjnj2xcMOEGNFOsLn5zfdWUJikjuy+iGI=
X-Google-Smtp-Source: ABdhPJy0Ta/y0E0vjs17iI7GLoMijAuqH+qD48WZvbHmNnsvA0FTaJkHEiqVaJJ7O8N7vTMtkohDE4idInHyytpVcjc=
X-Received: by 2002:a17:907:118d:: with SMTP id uz13mr38510164ejb.382.1634082896509;
 Tue, 12 Oct 2021 16:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org> <20211008012524.481877-4-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211008012524.481877-4-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Oct 2021 01:54:45 +0200
Message-ID: <CACRpkdZEdJU9sjV2VPejSPc7Rpth3JFrtYihuT9P0VJVnqLqyA@mail.gmail.com>
Subject: Re: [PATCH v3 03/25] ARM: dts: qcom-apq8064: add gpio-ranges to mpps nodes
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 8, 2021 at 3:25 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Add gpio-ranges property to mpps device tree nodes, adding the mapping between
> pinctrl and GPIO pins.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
