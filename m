Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC3932F48E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 21:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCEUV3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 15:21:29 -0500
Received: from mail-oi1-f180.google.com ([209.85.167.180]:46703 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhCEUUy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 15:20:54 -0500
Received: by mail-oi1-f180.google.com with SMTP id f3so3830495oiw.13;
        Fri, 05 Mar 2021 12:20:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7xR5NCBxhrARwQO8z2WYodg7iFqTBEt7u94V7TR2XRE=;
        b=eewvtFdKKAw8eGrZ51ofYMHB1An0FHB/WX70oraxj0I660fgGgt0tjM/v0imFMgdTr
         WkUr/5GB81Q6R83irqqnRa6rdJm+tG9+TAAoTegufTduJ2tXDra8L11pbzEIUhRkYsEC
         WIr7wjF/A2M6Ocn9C3ajt4cyU/P9SjuA8hrfYJiGIqRmuVSV2mxI84RamAAASxyLoB5V
         MIuTiKFCug9UFfXlQgmdjThAp4JxY7CNe0n8l+1QPvmtFTdNZg87FFfz35Eg5w8x36uk
         bqZlN2p+gE2lAxHL/p2EilmFSiEsnHyRopisFVNCwtAGaai2QAXeZmnEqUJ5e9+gZrof
         3yqw==
X-Gm-Message-State: AOAM533SKC199iWOtilieOqOPXp9p9rI24UM+TkcR3KgnH9Glz+wLYZU
        bfM4oAFYqLKXx52r5SCKHg==
X-Google-Smtp-Source: ABdhPJwO7bxlBD1CsXc+orZxdaUptbPsilftaXTe1kl4XqgE1lah2vsGdYG8faOyokCH5Hw1tKjOAw==
X-Received: by 2002:aca:d5cb:: with SMTP id m194mr1589374oig.111.1614975653404;
        Fri, 05 Mar 2021 12:20:53 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m189sm710055oia.58.2021.03.05.12.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:20:52 -0800 (PST)
Received: (nullmailer pid 582868 invoked by uid 1000);
        Fri, 05 Mar 2021 20:20:51 -0000
Date:   Fri, 5 Mar 2021 14:20:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     git@xilinx.com, linux-gpio@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, saikrishna12468@gmail.com
Subject: Re: [PATCH v3 2/3] dt-bindings: pinctrl: Add binding for ZynqMP
 pinctrl driver
Message-ID: <20210305202051.GA582808@robh.at.kernel.org>
References: <1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1613131643-60062-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1613131643-60062-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 12 Feb 2021 17:37:22 +0530, Sai Krishna Potthuri wrote:
> Adding documentation and dt-bindings file which contains MIO pin
> configuration defines for Xilinx ZynqMP pinctrl driver.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 339 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |  19 +
>  2 files changed, 358 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
