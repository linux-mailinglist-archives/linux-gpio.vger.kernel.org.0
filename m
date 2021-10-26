Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F79843BC27
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 23:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237141AbhJZVRV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 17:17:21 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:43526 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235746AbhJZVRU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 17:17:20 -0400
Received: by mail-ot1-f52.google.com with SMTP id y15-20020a9d460f000000b0055337e17a55so554989ote.10;
        Tue, 26 Oct 2021 14:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SDaAAmgyqMKBFIk4QEGnV3lhSwUQ5npJ6sj1T8ITMAE=;
        b=6nz93dCDVvEPh2yig3RIdVok1DA2uDIYLeEalILw6R/ilEEyec/9EeML/u4fv2sex3
         6WfR4e759ZJ+7hrbNCpvL5Fnpfz1RBQL11xl2cYbfQQDaYW45VksBmmlGKwiVNk0+NSt
         6cNtKG35hhtdQxmxERSAMvNbdzGK2pulZzeSuVokhoXnMtt2FM+GLeZeffrdCANzPofB
         r6SkL3sqGztfm77xHx3Y6AL3Rg9F8OIMPQNazKNEeV/v3OMYUxi532eX4sh/bYKW3wNE
         eUCoJwgUDYQ/KTG+S2JJDs2+UXdSdVC0bj69Ix7N5PeyfjYvSvEfby7F5HVmdGX94RU3
         6BeA==
X-Gm-Message-State: AOAM530b3Oh1M2Ocwa++CO3Sa1UOidjJ0vF+Lb+JmkJH5HNJOv4mkWep
        BJq9zQmGJ4Ynt1bEoIqJdg==
X-Google-Smtp-Source: ABdhPJx8WfzQ0tJCsbl+owWh5PdnoO7Fu0vRXZSDwOSNOZKrQMH3rqZlHnsgmN8u9mMGxSZ2vRZx9Q==
X-Received: by 2002:a9d:6ada:: with SMTP id m26mr21845233otq.373.1635282895876;
        Tue, 26 Oct 2021 14:14:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id f1sm4126223oos.46.2021.10.26.14.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 14:14:55 -0700 (PDT)
Received: (nullmailer pid 3263818 invoked by uid 1000);
        Tue, 26 Oct 2021 21:14:54 -0000
Date:   Tue, 26 Oct 2021 16:14:54 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-gpio@vger.kernel.org, monstr@monstr.eu,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>, git@xilinx.com
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add missing compatible strings
Message-ID: <YXhvzioBmC4+9/g9@robh.at.kernel.org>
References: <72c973da5670b5ae81d050c582948894ee4174f8.1634206453.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72c973da5670b5ae81d050c582948894ee4174f8.1634206453.git.michal.simek@xilinx.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 14 Oct 2021 12:14:18 +0200, Michal Simek wrote:
> "xlnx,zynqmp-gpio-1.0", "xlnx,versal-gpio-1.0" and "xlnx,pmc-gpio-1.0"
> compatible strings were not moved to yaml format. But they were in origin
> text file.
> 
> Fixes: 45ca16072b70 ("dt-bindings: gpio: zynq: convert bindings to YAML")
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
