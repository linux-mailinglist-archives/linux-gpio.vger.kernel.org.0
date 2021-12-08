Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB67746DC15
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Dec 2021 20:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhLHT0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 8 Dec 2021 14:26:30 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:39820 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229710AbhLHT0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Dec 2021 14:26:30 -0500
Received: by mail-oi1-f173.google.com with SMTP id bf8so5454852oib.6;
        Wed, 08 Dec 2021 11:22:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JVUHdlcjANpWIX3oCPQTGOjULKB0r4iXfNQdqpSRs3o=;
        b=LTWf984zz5Emit/jjiB7mm8HaCt4iB8Fzcs9NaWn4Z7FsHy9SN/+uYUY19GkthkbqY
         +TufWXuhsa3cd1zGerhtQkWspTPYwGj58+QOVoh0F+8pO5JVlxYbgGmogxyf6P3X5n7L
         Ml4qhPGjmQ3LJ5KbMtkFTtdS7TmzytN4A18+zgArUtB2Dr6E5XmovLTzyATj9jMkOe9t
         mNwNGAObKf02QuBB/Ixf3KGkivzNbeWPQMejKHHl6sfsloQDbl/Qi7TrmaS5ZUCgq0bF
         r2GVoiplkPVPgVmG/dwUhCf27baLWCUxMAefKaNdgjZAZvutzIB6nfTS1qZYrXyAt7Nn
         qxHw==
X-Gm-Message-State: AOAM531Rlky2CoJNg6r4n6eOVXVhYWF/YgvgjYzzDrX5curBdLcxMAHa
        j2u9aLfp0BvVSNX0hicHOA==
X-Google-Smtp-Source: ABdhPJywJ9QuFjCu5QQbFxqSf5IYYES7gR9bovoGurQOCLjCmts70jKH0Z0ZQA2CW15EmZTnx5YT3g==
X-Received: by 2002:a05:6808:1802:: with SMTP id bh2mr1396006oib.142.1638991377631;
        Wed, 08 Dec 2021 11:22:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q10sm880074oiw.17.2021.12.08.11.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 11:22:56 -0800 (PST)
Received: (nullmailer pid 183075 invoked by uid 1000);
        Wed, 08 Dec 2021 19:22:56 -0000
Date:   Wed, 8 Dec 2021 13:22:56 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Prathamesh Shete <pshete@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 3/6] dt-bindings: gpio: Add Tegra234 support
Message-ID: <YbEGENBN3fCj5KUJ@robh.at.kernel.org>
References: <20211208173047.558108-1-thierry.reding@gmail.com>
 <20211208173047.558108-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208173047.558108-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 08 Dec 2021 18:30:44 +0100, Thierry Reding wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> Extend the existing Tegra186 GPIO controller device tree bindings with
> support for the GPIO controller found on Tegra234. The number of pins is
> slightly different, but the programming model remains the same.
> 
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> [treding@nvidia.com: update device tree bindings]
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/gpio/nvidia,tegra186-gpio.yaml   |  4 ++
>  include/dt-bindings/gpio/tegra234-gpio.h      | 63 +++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/tegra234-gpio.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
