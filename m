Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC84F35C769
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Apr 2021 15:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239477AbhDLNU0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Apr 2021 09:20:26 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40715 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239388AbhDLNUY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Apr 2021 09:20:24 -0400
Received: by mail-oi1-f173.google.com with SMTP id i3so13367893oik.7;
        Mon, 12 Apr 2021 06:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=hzHfZu8e65Sn1btLVYGzu7cBqxLKTQVgEFz+j4avFdk=;
        b=J4Vcseh1ICbvph5Wtm45e5pe8FJq+BBC23VU03JZy0DFL+sjqZDsVDHe6xsERmqJkf
         V0ER9wBmRVM/pSlLoO4BqJyf3ytrP/2cGo3bQaytDEnV9RNzD1Tuaz+grwyVLl79cFaA
         +AOBcVoPy9sQk/H2DjDg8i/iv7pYvL2yT6pJ6JyS1Vu6XIlT89weThHc/lQVu7OYqLzz
         eR7o+x2UiskbiqvHSmhcPHgQuyodH44+kHQPvvmhZdHcIl5T1W+z0gV+0cbx6hKBqZq4
         +CUKWWTZpIfS116HHqXxRsmv/drjGoet5R7MqKHP6WgE1k5eILe6iJeE6CC3Iv29zAL+
         YZgw==
X-Gm-Message-State: AOAM532meCCdrbL0Xlj7P0sjqkl/NFo7VgnM7CSet5MjLSHb/Y2QI6yw
        osU6RVYvzNTOFCZt3KJ8Yw==
X-Google-Smtp-Source: ABdhPJyvWr8wbNAJq9fl9Tt+VaEYca5cgXsgpQzh5o8vHIS3waTqr6/xnHfjZAEI2jymUcrCseE9eA==
X-Received: by 2002:aca:c34d:: with SMTP id t74mr20271983oif.131.1618233606225;
        Mon, 12 Apr 2021 06:20:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t14sm2634140otj.50.2021.04.12.06.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 06:20:05 -0700 (PDT)
Received: (nullmailer pid 3757974 invoked by uid 1000);
        Mon, 12 Apr 2021 13:20:00 -0000
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, srv_heupstream@mediatek.com,
        linux-mediatek@lists.infradead.org, hongzhou.yang@mediatek.com,
        seiya.wang@mediatek.com, sj.huang@mediatek.com,
        jg_poxu@mediatek.com, sean.wang@mediatek.com, mark.rutland@arm.com,
        eddie.huang@mediatek.com, sean.wang@kernel.org,
        biao.huang@mediatek.com, linus.walleij@linaro.org,
        matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, hui.liu@mediatek.com,
        erin.lo@mediatek.com
In-Reply-To: <20210411092659.22838-2-zhiyong.tao@mediatek.com>
References: <20210411092659.22838-1-zhiyong.tao@mediatek.com> <20210411092659.22838-2-zhiyong.tao@mediatek.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: mt8195: add pinctrl file and binding document
Date:   Mon, 12 Apr 2021 08:20:00 -0500
Message-Id: <1618233600.191242.3757973.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 11 Apr 2021 17:26:55 +0800, Zhiyong Tao wrote:
> 1. This patch adds pinctrl file for mt8195.
> 2. This patch adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 +++
>  include/dt-bindings/pinctrl/mt8195-pinfunc.h  | 962 ++++++++++++++++++
>  2 files changed, 1114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.example.dt.yaml: pinctrl@10005000: reg: [[268455936, 4096], [298909696, 4096], [299040768, 4096], [299106304, 4096], [300023808, 4096], [300023808, 4096], [300613632, 4096], [301203456, 4096], [268480512, 4096]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml

See https://patchwork.ozlabs.org/patch/1464777

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

