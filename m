Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A98C3D1C3A
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jul 2021 05:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhGVC2Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Jul 2021 22:28:25 -0400
Received: from mail-io1-f46.google.com ([209.85.166.46]:41922 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhGVC2Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Jul 2021 22:28:25 -0400
Received: by mail-io1-f46.google.com with SMTP id z9so4726957iob.8;
        Wed, 21 Jul 2021 20:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+2gi8jgpBf2HT6xFKosHY+cehvCKKppSdy1MSQAO4EI=;
        b=L4yykOExVfUfppAdrBYUcKCSgxZ8MOA92UwmMqrwWDT5KKXPASgMMFpl3fAhxPxmjk
         geZrOWqyIQPROqPk0yy7vIl//7/VZGaLTpqNRgVDbirAnkpNyZK+vUtD5x4f7aOzP8z7
         YTBe8MFfGDIdGZkYiXPA0weSYqo7IsL8dzb/CESWj9+XtbZcgrtuBT07VCs5MO2ktXy9
         RgHDN/ztB29U3HZ9BAx/kwENotN0/Grvs9GPwZlxUdjK8LKfycGWtSDykNTtGnwqE4N4
         eoueoAaQEoDuHeGrntvv8eAoP1KO9Y6+w+nyraXfgTsYj3GSQKbY+i2WVxfTrPI3LfsF
         OLcg==
X-Gm-Message-State: AOAM531/uqYmwClCtZFDuQX0UzAVS/VUPx/pygg/6+n6ajEajMLNV8ZA
        kmPCujeruHJVjnyGw+PvZw==
X-Google-Smtp-Source: ABdhPJyIndYW6uP5QZ3fQmNa+7zC+hvqSegKmYKpKp+O8vBpc5Yjh1VWed4Cxb7SD7RkAjPuPE61SA==
X-Received: by 2002:a05:6638:2416:: with SMTP id z22mr26835174jat.57.1626923339686;
        Wed, 21 Jul 2021 20:08:59 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m12sm13717465iln.43.2021.07.21.20.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 20:08:59 -0700 (PDT)
Received: (nullmailer pid 3227699 invoked by uid 1000);
        Thu, 22 Jul 2021 03:08:57 -0000
Date:   Wed, 21 Jul 2021 21:08:57 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        romain.perier@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/10] dt-bindings: gpio: msc313: Add offsets for ssd20xd
Message-ID: <20210722030857.GA3227650@robh.at.kernel.org>
References: <20210717045627.1739959-1-daniel@0x0f.com>
 <20210717045627.1739959-3-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717045627.1739959-3-daniel@0x0f.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 17 Jul 2021 13:56:19 +0900, Daniel Palmer wrote:
> Add the gpio offsets for the SSD201 and SSD202D chips.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  include/dt-bindings/gpio/msc313-gpio.h | 71 ++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
