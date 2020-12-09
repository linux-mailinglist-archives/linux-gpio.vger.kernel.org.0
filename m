Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 446DD2D4700
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Dec 2020 17:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731076AbgLIQnC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Dec 2020 11:43:02 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:32829 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730407AbgLIQnC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2020 11:43:02 -0500
Received: by mail-oi1-f196.google.com with SMTP id d27so2384393oic.0;
        Wed, 09 Dec 2020 08:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T/j4UDJcNeMx/AnKgvLpxVmZNow15ACAeoiW0uvvTrA=;
        b=HaOPUhta6RHrtBDwdQKjynOggQybbxGetThbQiEnr56vPiWtI8vDXHdhMcNDoKvbyC
         /TaXJK+hAECvQKh5zgti5wTQITgjfc6cDGD85RJtjSzwl8uMg8cFHzxFwS/n6vUTWlL3
         +08cSmSbaXwnqyWl4wq4z+mTCUdxiMRnE883G3gH8zVRpZKnpZRMPkjaP1d8FhQxi+zi
         ILncL0GloW3gfOGXpGM5iYDn3mA9e1fnqhUx6yh3zRA/jyXMz1pw9+gdYuiGHtWJnWje
         YWPvokShdyKrMbZ5Ukv1gOqCuELG1zt/mxUQ+3UnS5PgMumORCIOph2gdUGCacgwuhET
         aX4w==
X-Gm-Message-State: AOAM532F4WK3WODGxuwETD5FYPXXQ1K1gBJxUxK0O1QPNZYdt8/vvxOs
        ogyT9Lk6wJiGyCUd1rYUZw==
X-Google-Smtp-Source: ABdhPJwgfFzIzKO7Ey6pofBuMX+Ndev5HRtxxm5o2j5Y4yEX0ceDFV03frbTRG48KAXXZ97NDt/SVw==
X-Received: by 2002:aca:ab8b:: with SMTP id u133mr2425303oie.18.1607532140894;
        Wed, 09 Dec 2020 08:42:20 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d62sm398826oia.6.2020.12.09.08.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 08:42:19 -0800 (PST)
Received: (nullmailer pid 578767 invoked by uid 1000);
        Wed, 09 Dec 2020 16:42:17 -0000
Date:   Wed, 9 Dec 2020 10:42:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     git@xilinx.com, saikrishna12468@gmail.com,
        Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Added binding for ZynqMP
 pinctrl driver
Message-ID: <20201209164217.GA578453@robh.at.kernel.org>
References: <1607503454-26503-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1607503454-26503-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607503454-26503-3-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 09 Dec 2020 14:14:13 +0530, Sai Krishna Potthuri wrote:
> Added documentation and dt-bindings file which contains MIO pin
> configuration defines for Xilinx ZynqMP pinctrl driver.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  .../bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml | 329 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-zynqmp.h  |  29 ++
>  2 files changed, 358 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-zynqmp.h
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml:254:49: [warning] too few spaces after comma (commas)
./Documentation/devicetree/bindings/pinctrl/xlnx,zynqmp-pinctrl.yaml:278:15: [warning] wrong indentation: expected 12 but found 14 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1413284

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

