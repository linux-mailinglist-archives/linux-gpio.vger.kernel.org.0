Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC92369933
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Apr 2021 20:18:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbhDWSS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Apr 2021 14:18:57 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:44793 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243436AbhDWSSx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Apr 2021 14:18:53 -0400
Received: by mail-ot1-f52.google.com with SMTP id 5-20020a9d09050000b029029432d8d8c5so20122139otp.11;
        Fri, 23 Apr 2021 11:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mCcUTIsaap93Zl8PmHJ74KyeOt6DCbHv/vtx3QCdv9s=;
        b=AxP90qLGn24AV1o9BGVO1sfjI9OqbBFJrWP8sRlppwXUJ3cxlarjeOVIJuDf4gRhC6
         GdC9p6k5XlSicNXG3L5pWKu/HnQibo/4btEQ9qLZfkKogXKcYLYZISQXYztuza1krf7+
         suwaPSkkcF6ne8fVe7hRZKgedp5zphVNfLs1u809KsRPmOY3aH12C6+Zm7aMOg4Id3bY
         uBerjrSqAHHk4IQpS/JRRPSbHGG6xJUfV6YrA8/gBPoiM3p7fTVAZW+FZjRxXdF1pMKH
         vHTdoWvUZSTVxje8Extez1Y55VmxMG6DeZc3NL3oY8qaCA7oYBWaryuU+zFiQSBs9tLB
         Pu6w==
X-Gm-Message-State: AOAM530kqczfSzNjsq7LBo2RWX0fsTV/qpb53GPyWzdXlxZ6dFHpbrEF
        P7kvvA//NpsGlv8GiqHF2A==
X-Google-Smtp-Source: ABdhPJy788DxCXQj+WefwbjEQ8Tog8LGXrpVxy7C1OHOiunTLrAiBwawE5xSI6ptUvB8ssR6r8871g==
X-Received: by 2002:a05:6830:3497:: with SMTP id c23mr4395477otu.344.1619201896039;
        Fri, 23 Apr 2021 11:18:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c12sm1286998oou.26.2021.04.23.11.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:18:14 -0700 (PDT)
Received: (nullmailer pid 1370216 invoked by uid 1000);
        Fri, 23 Apr 2021 18:18:14 -0000
Date:   Fri, 23 Apr 2021 13:18:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: pinctrl: convert Broadcom Northstar to
 the json-schema
Message-ID: <20210423181814.GA1370156@robh.at.kernel.org>
References: <20210421082928.26869-1-zajec5@gmail.com>
 <20210421182041.22636-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210421182041.22636-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 21 Apr 2021 20:20:41 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Important: this change converts the binding as it is. It includes
> dependency on undocumented CRU that must be refactored. CRU must get
> documented and offset property has to be reworked.
> 
> Above can (and will be) be handled once every CRU MFD subdevice gets
> documented properly (including the pinmux).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Add "maxItems" to the "offset"
>     Add "minItems" & "maxItems" to the "groups"
>     Drop "DMU" simple-bus node from the example
>     Improve commit description (mention ugly "offset" property)
> 
> CRU ("Clock and Reset Unit" or "Central Resource Unit") binding is being
> worked on, for details see:
> [PATCH robh dt/next] dt-bindings: mfd: add Broadcom CRU
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210415062839.11713-1-zajec5@gmail.com/
> ---
>  .../bindings/pinctrl/brcm,bcm4708-pinmux.txt  | 55 -----------
>  .../bindings/pinctrl/brcm,ns-pinmux.yaml      | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4708-pinmux.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,ns-pinmux.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
