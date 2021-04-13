Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09E635E296
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Apr 2021 17:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbhDMPWy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 13 Apr 2021 11:22:54 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:43521 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231485AbhDMPWv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 13 Apr 2021 11:22:51 -0400
Received: by mail-ot1-f41.google.com with SMTP id p6-20020a9d69460000b029028bb7c6ff64so339130oto.10;
        Tue, 13 Apr 2021 08:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M5LRlWktXGo8iA/Vsd38aM0WTulSItsG6aBATWd3DBQ=;
        b=U0xKdxvL7NL/c9ONKtKpcFKzocW2rrGgtoeocUAWokGhItnIXib67gs1ybfeIXUBDJ
         nBKJIFAlmbImRdmfRRNkXR58RW1HW/GQC8iUkEHzSz6Ge8ILVnslQlFYC8RkHSJxhmbZ
         OCVVcuDg7WInxY/kpwjnyew7R+lFkv8TEx5uu3CZ3kjj2v1BB5a/8DWlNYATyr215SZ0
         bj1nSCRMBNtW28HaIGWskQC5Fmi9GLfek8iAi0viKAXznkdYz0Inr+bvWXW7dxuIWLJn
         9hsh9sYvSD/duptmWNE5uOCzqo5NSrENyCIthLDJqTORi+DIBqdqfnGwMln8vLSypIE4
         eFTg==
X-Gm-Message-State: AOAM53065pYZceMlA5yApwlagFwC2f2/cK8WEgqjMAD5lYckJ65GWmZz
        JKSGKuk8uLMppijhk3jO0Q==
X-Google-Smtp-Source: ABdhPJyE2+W7kpfnEGRVoGJRA12pV2gliQPOhMv99rM2tC2m7lXueFZ++JfkU3wSS8oiV9TXYajDtw==
X-Received: by 2002:a05:6830:3115:: with SMTP id b21mr28240296ots.318.1618327351138;
        Tue, 13 Apr 2021 08:22:31 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t3sm579967ooa.18.2021.04.13.08.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:22:30 -0700 (PDT)
Received: (nullmailer pid 1702387 invoked by uid 1000);
        Tue, 13 Apr 2021 15:22:29 -0000
Date:   Tue, 13 Apr 2021 10:22:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        linux-rockchip@lists.infradead.org, heiko@sntech.de,
        linus.walleij@linaro.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: add YAML description for
 rockchip, gpio-bank
Message-ID: <20210413152229.GA1702359@robh.at.kernel.org>
References: <20210412223617.8634-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412223617.8634-1-jbx6244@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 13 Apr 2021 00:36:15 +0200, Johan Jonker wrote:
> Current dts files with "rockchip,gpio-bank" subnodes
> are manually verified. In order to automate this process
> the text that describes the compatible in rockchip,pinctrl.txt
> is removed and converted to YAML in rockchip,gpio-bank.yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changed V2:
>   changed example gpio nodename
> ---
>  .../bindings/gpio/rockchip,gpio-bank.yaml          | 82 ++++++++++++++++++++++
>  .../bindings/pinctrl/rockchip,pinctrl.txt          | 58 +--------------
>  2 files changed, 83 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/rockchip,gpio-bank.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
