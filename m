Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898232AF9C4
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Nov 2020 21:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgKKU2u (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Nov 2020 15:28:50 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:33183 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgKKU2u (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2020 15:28:50 -0500
Received: by mail-ot1-f65.google.com with SMTP id i18so3425699ots.0;
        Wed, 11 Nov 2020 12:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJf51nyncLEmkY0/O8/AmM9y/TuW/LVt/kXamrqppsE=;
        b=UZiE6L/o6VY31FLrBJWADGq6Tug55DTT61alcDpHYO1b4jgZZJSXmcrUZb3ttIWVrh
         JmX71fULy6cEiYsnie/NsxVOPEX3ZgCMf6nP+3b5awbN078te8zqAihoqB5BEZngmIYJ
         fKej7ukpjJwe6CTcgfp9Ajfen8CxnF9yzmr35iRhSzBby5G8YZuj/kYxNoNV3qvAA4Zy
         Q8gDjvr382aLNqzOsYl+vTiuNJcMapdIGx0GYlIUlG159vNbwsQ4UYXHLHGHKKgV/YEr
         QIQteHDwI/d2kFAgc2eVs1y+oAtNIu+3UsVpr/m1RRjQNtwegbycVE7qALeqT4s3VFdD
         hglQ==
X-Gm-Message-State: AOAM532iv1yAXXOUoebVxtzWVOR0i+XAnDkkIuUdkykOTxSIe6vpLUdd
        THda+FQYZ9TH5JUNMCMxQQ==
X-Google-Smtp-Source: ABdhPJzjBGK4y8JdGnGo7mz2lnpYgsMG9B4V8dQwLAkI9fFRQ6mTl1k0TJTK/sGulYG/kuqZD1Vd3Q==
X-Received: by 2002:a05:6830:348:: with SMTP id h8mr556706ote.318.1605126529396;
        Wed, 11 Nov 2020 12:28:49 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 186sm751073ooe.20.2020.11.11.12.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 12:28:48 -0800 (PST)
Received: (nullmailer pid 1974454 invoked by uid 1000);
        Wed, 11 Nov 2020 20:28:47 -0000
Date:   Wed, 11 Nov 2020 14:28:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     maz@kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        w@1wt.eu, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: gpio: Add a binding header for the
 MSC313 GPIO driver
Message-ID: <20201111202847.GA1974400@bogus>
References: <20201109121731.1537580-1-daniel@0x0f.com>
 <20201109121731.1537580-2-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201109121731.1537580-2-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 09 Nov 2020 21:17:27 +0900, Daniel Palmer wrote:
> Header adds defines for the gpio number of each pad from the driver view.
> 
> The gpio block seems to have enough registers for 128 lines but what line
> is mapped to a physical pin depends on the chip. The gpio block also seems
> to contain some registers that are not related to gpio but needed somewhere
> to go.
> 
> Because of the above the driver itself uses the index of a pin's offset in
> an array of the possible offsets for a chip as the gpio number.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  MAINTAINERS                            |  1 +
>  include/dt-bindings/gpio/msc313-gpio.h | 53 ++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/msc313-gpio.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
