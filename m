Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A033639C297
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jun 2021 23:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhFDVj6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Jun 2021 17:39:58 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:33694 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbhFDVj5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jun 2021 17:39:57 -0400
Received: by mail-ot1-f49.google.com with SMTP id q9-20020a9d66490000b02903c741e5b703so9343018otm.0;
        Fri, 04 Jun 2021 14:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MYkrTN2lYjPsA/rQ0nxEvi+evdlSuxVIs1zFHc5pQLs=;
        b=fV/Q0juaKKMLfqmwFq5zbG3zeqK0u1To9xUFDttgf2c3onk5LTpBb6CJEmX5qZLEP8
         GIp/GlbstGRcMehduodG4JQDFYGL2qF6nBq1IQoh1A8Uzemk8rXC0XZE97l5t1F3LstV
         J4u45rmirNglOYXR6Fyd6pLYcQ4G+sPAlr+G8OpfQV5a/f7JzFRVcHQYol5hMLXd+B14
         WLsmHSFkKhs6NuA/8AnMMQY3jEieCMvt5ptBBhGlUXIbuiYUQkaaQY71/LN7uO9LMOfX
         GvOacCALD8Y/EO0ylVYHCN9toJyELXJtT3eohrXhFv5eIFUO0WXX4Nk+ZWTPlhIQWpSD
         +syw==
X-Gm-Message-State: AOAM533TATozVS64r8BAv8Uusr7QnXdCetHA27a25iV0+dGPNMOkHCVe
        HgcFDi38x3gVzBNf3v+4fg==
X-Google-Smtp-Source: ABdhPJwlepvxLG20UTpYmKhHreiKXllWJ4McJRb1z2XG3RhOlYaLaQuO2SgcXbO9H+D87ayjfnN8vg==
X-Received: by 2002:a9d:5f85:: with SMTP id g5mr5201348oti.86.1622842690750;
        Fri, 04 Jun 2021 14:38:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p1sm741953otk.58.2021.06.04.14.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:38:09 -0700 (PDT)
Received: (nullmailer pid 3966749 invoked by uid 1000);
        Fri, 04 Jun 2021 21:38:08 -0000
Date:   Fri, 4 Jun 2021 16:38:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc:     linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Soren Brinkmann <soren.brinkmann@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Harini Katakam <harinik@xilinx.com>,
        Anurag Kumar Vulisha <anuragku@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: convert bindings to YAML
Message-ID: <20210604213808.GA3966696@robh.at.kernel.org>
References: <20210531120753.719381-1-iwamatsu@nigauri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210531120753.719381-1-iwamatsu@nigauri.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 31 May 2021 21:07:53 +0900, Nobuhiro Iwamatsu wrote:
> Convert gpio for Xilinx Zynq SoC bindings documentation to YAML.
> 
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
> ---
>  .../devicetree/bindings/gpio/gpio-zynq.txt    | 36 -----------
>  .../devicetree/bindings/gpio/gpio-zynq.yaml   | 59 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-zynq.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
