Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEF93DAC48
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 21:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhG2T5E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Jul 2021 15:57:04 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:33313 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232559AbhG2T47 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Jul 2021 15:56:59 -0400
Received: by mail-il1-f181.google.com with SMTP id y4so7165237ilp.0;
        Thu, 29 Jul 2021 12:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z0J5LQNEEyjEvcuJujP5AefHinx/f1KYPzS6uivxeNY=;
        b=oSBFA1lTV2kDWzQjWtttqtAzSwk1rFdCenISsfasUjpUKe0ARXMXqmpAWKrwxHz6oU
         Mro+Kn6YG/XDUZidB3PKkZtRr29TwLS3xi3IsutgGM/ZPJ4QusBlY9IVBXBDDKZ81u6k
         gYjDhOZ7hcWVNzHMfoaxa5OZFhbfFJVwsntNUGPUxf9bBPxBS2IpahjC/XByax7pRJb8
         RmXKXC6CE6HOCaTUNSK+X67mbPWCJ1VNgOsX5fm0bbAi1e9Qke635DNht7jpsTE6s/lA
         XFrGhhdsyWdgHRDQR13XEeiYW499t2O2CqdZoLxyY8Bfd4yBtv63RUVCB/uAmersC1MQ
         i0Ig==
X-Gm-Message-State: AOAM532nqxTv37/9Q/6IsHCN3Uw8XIzuU97fn3LLEX+9uPX+EC4ald27
        J1fIOhnZvnRu2MYYhONIBg==
X-Google-Smtp-Source: ABdhPJxRRDWEUSJeM4gWtTDNajmw+L0NBzLZkybl2EAg5IFbGY4xTZgE8SbLXVVvUBXrnTiDac5GrA==
X-Received: by 2002:a92:dcc2:: with SMTP id b2mr4974750ilr.84.1627588614140;
        Thu, 29 Jul 2021 12:56:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p8sm2920321iol.49.2021.07.29.12.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 12:56:53 -0700 (PDT)
Received: (nullmailer pid 779754 invoked by uid 1000);
        Thu, 29 Jul 2021 19:56:52 -0000
Date:   Thu, 29 Jul 2021 13:56:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>, git@xilinx.com,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        saikrishna12468@gmail.com
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: pinctrl-zynq: Convert to yaml
Message-ID: <YQMIBJ7n4EN3KDhr@robh.at.kernel.org>
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
 <1626868353-96475-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626868353-96475-2-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 21 Jul 2021 17:22:30 +0530, Sai Krishna Potthuri wrote:
> Convert the Zynq pinctrl binding file to yaml.
> 
> Signed-off-by: Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
> ---
>  .../bindings/pinctrl/xlnx,zynq-pinctrl.txt    | 105 ---------
>  .../bindings/pinctrl/xlnx,zynq-pinctrl.yaml   | 216 ++++++++++++++++++
>  2 files changed, 216 insertions(+), 105 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/xlnx,zynq-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
