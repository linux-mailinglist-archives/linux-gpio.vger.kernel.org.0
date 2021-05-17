Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B613386C0B
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 23:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236109AbhEQVMx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 17:12:53 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:34339 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235796AbhEQVMx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 17:12:53 -0400
Received: by mail-ot1-f49.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso6824197ote.1;
        Mon, 17 May 2021 14:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=er+nFmon+svqmtkFcqXC0e3slEFDd9HMF6EJMQ1oQXM=;
        b=lv8UhXIjfiglvtAX0+ymkiEoyrRzuTgHHX2E8hMHEdNTMVswOeg4YSO8k9ls2YFfYx
         k4j21TzqM1P/046kcqBniL+vp23tSEyfR3fTECKxmV+HJd08DdoOZJwm31iR5rmskMEz
         2S4fYEfTZd4HFChNABr/8HpW0s3yrKYzqNg6+02MpCCtFSJ/NCy9GD9X0zNP/pizmK/2
         Ds3OQwa3XBe2kQ2SgnGJ45zR/stazw3nvLwCGJht3ve6WcVTrRqjkWM0EVSiWQfUHHls
         V7G22tM+2XDmlIOwMqXn4f/q9fLtNWUHiiWq+gVCPb6jwL2FcvmL/dnHZ+/7PiCTMDsg
         fdSQ==
X-Gm-Message-State: AOAM531vD4D+yb4Wf4eETzmhfWxy19FoE/gzvZDAOlp3bTBdsfPZ9fvg
        PZYZUt/9QaKnBwK9BWs3/VNdC/a3vQ==
X-Google-Smtp-Source: ABdhPJxkTw2VFbtDoOEtMEjJz0I8famE3J/wge+2Bnazq1FlHH61nbZWedLyyZ53+pWLMXKdfG1buw==
X-Received: by 2002:a05:6830:1f52:: with SMTP id u18mr1233598oth.298.1621285895288;
        Mon, 17 May 2021 14:11:35 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a11sm2955723oif.52.2021.05.17.14.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 14:11:34 -0700 (PDT)
Received: (nullmailer pid 3200619 invoked by uid 1000);
        Mon, 17 May 2021 21:11:33 -0000
Date:   Mon, 17 May 2021 16:11:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/2] dt-bindings: gpio: Add devicetree binding for IDT
 79RC32434 GPIO controller
Message-ID: <20210517211133.GA3200481@robh.at.kernel.org>
References: <20210514123309.134048-1-tsbogend@alpha.franken.de>
 <20210514123309.134048-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514123309.134048-2-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 14 May 2021 14:33:08 +0200, Thomas Bogendoerfer wrote:
> Add YAML devicetree binding for IDT 79RC32434 GPIO controller
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v5:
>  - made interrupt controller optional
>  - made ngpios setting optional
> 
> Changes in v4:
>  - renamed to idt,32434-gpio this time for real
> 
> Changes in v3:
>  - renamed to idt,32434-gpio
>  - drop ngpio description
>  - use gpio0: gpio@50004 in example
> 
> 
>  .../bindings/gpio/idt,32434-gpio.yaml         | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/idt,32434-gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
