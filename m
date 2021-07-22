Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4193D1C37
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 05:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhGVC2M (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 22:28:12 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:39851 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhGVC2M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 22:28:12 -0400
Received: by mail-io1-f53.google.com with SMTP id w22so4738104ioc.6;
        Wed, 21 Jul 2021 20:08:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lGhOHv0Snbxr2YPhm4azvkQdb5AIKJ2miLu9HidRSqs=;
        b=R1QKlArOv47kWy+p9YNiz/fMQj0v6SplpnCvy+vDk2K8k4/eL+T64nWRtqbpqAbmPe
         /n9qLNQ5+lProhMUPK9gUegCJ5pi9RzCaJm8pT3D9TZWdJDPE2YEnHeiR7voymBVekqD
         Yc4RaRfzRA7MjXJ/cUfcjCjZGDAYuGtVAFPAR1bNf5+EgHqQsj7Dy9KEIQdkn3UWSBut
         xN9MNmzRd5oFdE5iGJijukg4Ku6bzNjxqkdrrpqGFalNh+o0fTAtht24Brkq2XbqaYg1
         3Axxe/zpnc45Eol9dVvS4wRzy7vz+4K+SMDx+nz4zXdCHjTBomWYjvDAcqI+a2NtLvJ6
         c/nQ==
X-Gm-Message-State: AOAM530T2oGJw0/Q/90qyxuC9Oh7XwJVXuNphDD96zqmMgTnf5proF7K
        48bh2Ka8AQ0kHoxQsuDX7A==
X-Google-Smtp-Source: ABdhPJyVmA1c7DuyMKZ4h0GEUTo6Lqp9wQDwpW5sQGdifl4mnuSeGx4e3ecP5TX5IrzUhXK9WB7Txw==
X-Received: by 2002:a05:6638:14d6:: with SMTP id l22mr33202417jak.99.1626923326645;
        Wed, 21 Jul 2021 20:08:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q1sm15954824ioi.42.2021.07.21.20.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 20:08:46 -0700 (PDT)
Received: (nullmailer pid 3227306 invoked by uid 1000);
        Thu, 22 Jul 2021 03:08:44 -0000
Date:   Wed, 21 Jul 2021 21:08:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        romain.perier@gmail.com, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: gpio: msc313: Add compatible for
 ssd20xd
Message-ID: <20210722030844.GA3227255@robh.at.kernel.org>
References: <20210717045627.1739959-1-daniel@0x0f.com>
 <20210717045627.1739959-2-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717045627.1739959-2-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 17 Jul 2021 13:56:18 +0900, Daniel Palmer wrote:
> Add a compatible string for "ssd20xd" for the SigmaStar SSD201
> and SSD202D chips. These chips are the same die with different
> memory bonded so they don't need their own strings.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
