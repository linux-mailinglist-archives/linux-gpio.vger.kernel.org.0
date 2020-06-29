Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917C220E718
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2020 00:10:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404273AbgF2Vxg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jun 2020 17:53:36 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:37466 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404461AbgF2Vxf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jun 2020 17:53:35 -0400
Received: by mail-io1-f65.google.com with SMTP id v6so5163812iob.4;
        Mon, 29 Jun 2020 14:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TqO9zSccC03uQUBHdnGu8Ma3JV07Cz0JDvsVx9Gx0ZY=;
        b=BI5j2klROPkAw5y71Nus7JZg2kw4DRN35t07NRJ8k7ia18GH/E0t3shkmjJ18jl0SP
         /rTnVa2UbnSnJNgWxI8OFen9vWgatI3pPXPj/4WMXjJxvxFdSfI8ywNrCw+WR8YrlARO
         mTaMURwB9Z0RPIn2mWLBE3qw5vk2hYKNR44yqIGVs0T5bLDvpLknUc7eTNupVfliVRya
         yVSNAzcpr7e6v2Yuir7Nod8b0MTrOaH4d/ss5+Sjr+y+jmc320xfXlce2YPHTYuC5Z+2
         BMCB9J5u9DHwASyI2AxdIoxbMR+zKhJu9ae7SVdM6q14yX88MEBetp6EFiJLHf2B1XDL
         0GPA==
X-Gm-Message-State: AOAM530wCbae5J3sg6I2a4rDTIcR9/v6t5Jp3l6xGyiG5A8bpLNxhtph
        jaQqtkoVLIj2QHFMncrWsw==
X-Google-Smtp-Source: ABdhPJyIbG7PIhmtfb8YhLKR5Xh3nGklRFT+QTShHlA/Rx0Efb1UteRJRihqMm1UaKN8nH02gpJ1Xw==
X-Received: by 2002:a05:6638:2601:: with SMTP id m1mr9213481jat.43.1593467614612;
        Mon, 29 Jun 2020 14:53:34 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
        by smtp.gmail.com with ESMTPSA id t12sm604000ilo.80.2020.06.29.14.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:53:34 -0700 (PDT)
Received: (nullmailer pid 2994774 invoked by uid 1000);
        Mon, 29 Jun 2020 21:53:31 -0000
Date:   Mon, 29 Jun 2020 15:53:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hanks Chen <hanks.chen@mediatek.com>
Cc:     wsd_upstream@mediatek.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Teng <andy.teng@mediatek.com>,
        linux-kernel@vger.kernel.org, mtk01761 <wendell.lin@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>, linux-clk@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        CC Hwang <cc.hwang@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v6 1/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
Message-ID: <20200629215331.GA2991039@bogus>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592480018-3340-2-git-send-email-hanks.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 18 Jun 2020 19:33:32 +0800, Hanks Chen wrote:
> From: Andy Teng <andy.teng@mediatek.com>
> 
> Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> 
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  210 ++++++++++++++++++++
>  1 file changed, 210 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dts:21:18: fatal error: dt-bindings/pinctrl/mt6779-pinfunc.h: No such file or directory
         #include <dt-bindings/pinctrl/mt6779-pinfunc.h>
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
scripts/Makefile.lib:315: recipe for target 'Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1312018

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.



Here, you need patch 2 to come first or merge it into this patch as it 
is part of the binding.

Rob

