Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE4F408B1F
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Sep 2021 14:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238428AbhIMMhc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Sep 2021 08:37:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236211AbhIMMhc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Sep 2021 08:37:32 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A2EC061760
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 05:36:16 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id m70so19025091ybm.5
        for <linux-gpio@vger.kernel.org>; Mon, 13 Sep 2021 05:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/7I4pp3bCeX5QtDeGFLNRIAdhczuRGJY+RZHqPbZaY=;
        b=v4RvoaeIBbVIdxvY8xRQ4WL4/b7BIh5z4yAdugyL3U40o0OAox8l/o86/wCLeuSVLY
         SkFl2x/4cP7fQHUKJB8Lum7jMTkL+sdW7a2alYIYIXzR0hK+km75ixtIK6FVRwCa1zwb
         Mrpaa3nC7c3HRCbgxOJjL40Sl+/Caliwzv1Lmb4FnJx2C+rIF1+zpzyjAIqHeHAO4cOz
         ew07jy2l/SUzCzjyxoGsRJVgwl7J9IxvHXVdwboZxIMKtsj/QHOe0G2/54yqlAI76mpi
         PdjYXZpimIImuJDxV+h7gP1v/xG11paG1BAUkn6RKxGfoc8sshK0JokDrcZIpsXsUphJ
         RCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/7I4pp3bCeX5QtDeGFLNRIAdhczuRGJY+RZHqPbZaY=;
        b=RwcxlixFSg65WlWFTnUKw54VsktJF0G4AtH559cH/xDGqD3HG5X2QxPtLmH8UmG9YV
         9wVgifGnQRQ78NRwNjsDtM3wKgIPnAGZmynWfcFmAtMA+lyHbiqkAQsqxfAP7PmwI1bE
         1SLGgQ2ekC+vM6Z88lcQsy3Hg1XJcB8nReVIdAyynrfEyQJWU61CauqszWCEgWX6aZxG
         ziy6hyM9Kp9971Ug4nMBT9i91TD+zWByTomkUZss0+sYUYTccvX0NU9K6VM+fJ78sHCX
         X1FDOIaslUsh5XP4aDr4J0Tg7KY7+iWJHLO+PvAOiU7Lunq5AZ3+jvqCnQ136EGXF2sb
         o5Bw==
X-Gm-Message-State: AOAM5321KwOlzWcMnsi8g1xGQBWcvafkSHuaxSVj+LzLcYwE71VjBe++
        UYU2lTjVUfRljWy5rqmaN35puK7l3D2DL6rBL9Ae6w==
X-Google-Smtp-Source: ABdhPJwxn1AKm92da/Waw57h9E+5bL6agaUKuU1Ri+g26ebKDO6jncg+nkjCj8CjiBlxY7UbSLfr+ulCb6LaiDBmvtI=
X-Received: by 2002:a25:388c:: with SMTP id f134mr15710121yba.209.1631536575709;
 Mon, 13 Sep 2021 05:36:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210828121007.14865-1-jbx6244@gmail.com>
In-Reply-To: <20210828121007.14865-1-jbx6244@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 13 Sep 2021 14:36:04 +0200
Message-ID: <CAMpxmJWncsMtjsjZY7c5aOtvf0+gxgui=yu27acouO1XjaGq7Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: add gpio-line-names to rockchip,gpio-bank.yaml
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 28, 2021 at 2:10 PM Johan Jonker <jbx6244@gmail.com> wrote:
>
> Some people and companies may want to add more description
> to there gpio pins. Add a gpio-line-names property to the
> rockchip,gpio-bank.yaml file to reduce the notifications
> from the existing mainline DT.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> index 0d62c28fb..d4e42c2b9 100644
> --- a/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> @@ -29,6 +29,8 @@ properties:
>
>    gpio-controller: true
>
> +  gpio-line-names: true
> +
>    "#gpio-cells":
>      const: 2
>
> --
> 2.20.1
>

Applied, thanks!

Bart
