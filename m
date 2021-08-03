Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3023DF0DC
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 16:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235607AbhHCO4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 10:56:06 -0400
Received: from mail-io1-f52.google.com ([209.85.166.52]:34624 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235527AbhHCO4G (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 10:56:06 -0400
Received: by mail-io1-f52.google.com with SMTP id y200so24590014iof.1;
        Tue, 03 Aug 2021 07:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kD7lkwGnBrAWtQ4Yvyumyu5YNOwGaLH82mshMsNuV0s=;
        b=jxVpu6ZzL7kqEtfeZeBRyfemhkCElg3bY+8zn4dHpJCC7FMjPqEWRIaxAaYGQlxo8i
         74wIJqqX1eOzLh4rgIQfx/BzvcN1tULB5Wuat2aYfcR8cP0Lpqqg7rLb5AwBiMVWY6xr
         8p5Iv8vTxP8yuZTYMxq4L9FVRaDYBrmzbT4WQmpmu0Hdz3sIkdCHnM0popLKDx042Lo9
         UNQsU3f9POJlBArlGO8KKaHpueO61s062TbXF8AhCNAWfezjXxkL4N9ArTHyF91WSluQ
         84hjbgMXFH0jvyuKw+qPokuyZ35DgW8lUi39hcIqg4ycWzGudyAIwUmTsUcV8oMjxkQ1
         SZIg==
X-Gm-Message-State: AOAM533AgaDgISUYmsuVpS/Gbvi/MGLOcd/jVAc616lBkRU8RzHNwKch
        l2Bg6krXXV3stJIVVLSHvw==
X-Google-Smtp-Source: ABdhPJzY36XqMTJ9t/2g2jsTX7vFaYI7b8gh0CL1YPRGzel3gnv1zaaoWZzPOx7BB/gaoMf2w4EdMA==
X-Received: by 2002:a5e:9743:: with SMTP id h3mr433048ioq.52.1628002553781;
        Tue, 03 Aug 2021 07:55:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id k9sm8646960ioq.55.2021.08.03.07.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 07:55:52 -0700 (PDT)
Received: (nullmailer pid 3254509 invoked by uid 1000);
        Tue, 03 Aug 2021 14:55:51 -0000
Date:   Tue, 3 Aug 2021 08:55:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Message-ID: <YQlY9/5GNOGKG4gv@robh.at.kernel.org>
References: <20210803051318.2570994-1-hsinyi@chromium.org>
 <20210803051318.2570994-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803051318.2570994-3-hsinyi@chromium.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 03, 2021 at 01:13:19PM +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3:
> fix comments in v2.

That's assumed... A good revision history will list out what changed to 
remind reviewers what they said. (I kind of remember since it was just 
yesterday, more more than that assume I've forgotten.) This is different 
than the commit msg which should tell us 'why' and not 'what' as there 
we have the diff and can read what changed.

> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 373 +++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 980 insertions(+), 861 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt

With the MAINTAINERS references fixed,

Reviewed-by: Rob Herring <robh@kernel.org>
