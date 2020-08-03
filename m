Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACC3623AFB7
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Aug 2020 23:41:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgHCVk7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Aug 2020 17:40:59 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43982 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgHCVk7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2020 17:40:59 -0400
Received: by mail-io1-f65.google.com with SMTP id k23so40051703iom.10;
        Mon, 03 Aug 2020 14:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+qbA17NBRX4DFVcCtce1OR443e452icdklfA8GxdqOQ=;
        b=rMeUO/+LV/W5oCvFVeL2s5LEkkLx97cL8d2UlE58f+0T+1OZ+eX51s3dnez0mqDzaa
         LPYSPzBeF+cZqSj4nfqGmEzniTsJdYulJIt3YACtYHrfmQ5LiGMB/trqFfiAA3/paiSQ
         Wa7aGTpKXo6awCN2nYASEVMY7ji+kE/ZgSOHrhS1Gpf27dbNqi5Tc701BEZ3L2T2tOQ1
         B6cVRFD7ne5QB342/S+d8bQtF9n3v3IMvMQxunPyulD5mPlOOIXYxBhp6ztHU05XwU7c
         TQIanus5JRqku0F2ySlS7YtbnY0arP7Cbuwp0zBKEX1UHu3uUwhuprd1YlM9NbKB8dBi
         14eA==
X-Gm-Message-State: AOAM533kzYgnthxvDbMGa0RehhyLVQPRe/QF7/GsPyNTp75Sc2j5pKcD
        DxvAOT8AW4vxjL5A0Ok90g==
X-Google-Smtp-Source: ABdhPJzMH4Qu3dMzd0ErMEXWcCAy8F7OOarZCAV4Agm/rvfutcveskUC8SZEeVtMmVlFVM8iWoBOYw==
X-Received: by 2002:a5d:9d58:: with SMTP id k24mr1869658iok.107.1596490858430;
        Mon, 03 Aug 2020 14:40:58 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k204sm10853501iof.55.2020.08.03.14.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 14:40:57 -0700 (PDT)
Received: (nullmailer pid 3185405 invoked by uid 1000);
        Mon, 03 Aug 2020 21:40:54 -0000
Date:   Mon, 3 Aug 2020 15:40:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     seiya.wang@mediatek.com, linux-arm-kernel@lists.infradead.org,
        jg_poxu@mediatek.com, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, chuanjia.liu@mediatek.com,
        sean.wang@kernel.org, srv_heupstream@mediatek.com,
        biao.huang@mediatek.com, erin.lo@mediatek.com,
        mark.rutland@arm.com, hongzhou.yang@mediatek.com,
        matthias.bgg@gmail.com, devicetree@vger.kernel.org,
        robh+dt@kernel.org, hui.liu@mediatek.com, eddie.huang@mediatek.com,
        sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
        sj.huang@mediatek.com, linus.walleij@linaro.org
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: mt8192: add binding document
Message-ID: <20200803214054.GA3184946@bogus>
References: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
 <20200801043303.32149-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200801043303.32149-3-zhiyong.tao@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 01 Aug 2020 12:33:02 +0800, Zhiyong Tao wrote:
> The commit adds mt8192 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8192.yaml      | 175 ++++++++++++++++++
>  1 file changed, 175 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:0: [0, 268455936, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:1: [0, 297926656, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:2: [0, 298909696, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:3: [0, 299040768, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:4: [0, 299106304, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:5: [0, 300023808, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:6: [0, 300351488, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:7: [0, 300548096, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:8: [0, 301072384, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:9: [0, 301137920, 0, 4096] is too long
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.example.dt.yaml: example-0: pinctrl@10005000:reg:10: [0, 268480512, 0, 4096] is too long


See https://patchwork.ozlabs.org/patch/1339661

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

