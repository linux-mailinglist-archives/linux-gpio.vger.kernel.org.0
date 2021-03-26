Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F6D349F0F
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 02:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhCZBt6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 21:49:58 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:40643 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbhCZBt4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 21:49:56 -0400
Received: by mail-io1-f41.google.com with SMTP id n21so3888346ioa.7;
        Thu, 25 Mar 2021 18:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N9Te2GQTu4UomMNR5C1yrVqQ8Ms/2vbp9BYJ7j0G8SY=;
        b=Xk2/sUavNcmDqB0E6AhW/FpBZniUmqgfMwBP/tXDVJRImh9eC3YlAvZZBR/XwMi7Vr
         q7xhqlfKyWVxYvq6UXXIxA6Xfk3NVbwV+oqnhFKdWnFrfBxE+o/v/Jsav1SUG9sswL5k
         7GTugXdPuztsD5Tuh7ZNhsAbYNM/vKgQqumk/v8u/FnWIu+YYShdhMXzsjYO7QZG4SzU
         O/2DCznYwIYmS0Mw0hq/fyezP8T/dh+TWjd5Z42nb5SQRjnJKks5VJQstG/v5miF6ml0
         nD0e3j0kxY2PyyVPBWJhW+1wG2/pdunvBQzzeOASJ9UwGwOPIBtBIAq+0RD8sg6kXrA9
         2CLA==
X-Gm-Message-State: AOAM5304DO5lZaKdAseKojS/jpIEtmuqPj8dAh4rVGKctr+XthDdepMF
        GFEMYwSnbpgvIN0jiKxIfA==
X-Google-Smtp-Source: ABdhPJzoTwDGhGHQRCjyGQmKg+KE2sK/7QlyDCM2mrD6AWIkiUxBHRzesApHsW7lgBo9JGVADjnmEg==
X-Received: by 2002:a6b:ea04:: with SMTP id m4mr8486022ioc.160.1616723396206;
        Thu, 25 Mar 2021 18:49:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id g8sm3140676ile.44.2021.03.25.18.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:49:55 -0700 (PDT)
Received: (nullmailer pid 2160116 invoked by uid 1000);
        Fri, 26 Mar 2021 01:49:47 -0000
Date:   Thu, 25 Mar 2021 19:49:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        avifishman70@gmail.com, lee.jones@linaro.org,
        ryan_chen@aspeedtech.com, devicetree@vger.kernel.org,
        tali.perry1@gmail.com, robh+dt@kernel.org, venture@google.com,
        benjaminfair@google.com, linux-aspeed@lists.ozlabs.org,
        minyard@acm.org, openipmi-developer@lists.sourceforge.net,
        chiawei_wang@aspeedtech.com, tmaimon77@gmail.com
Subject: Re: [PATCH v2 18/21] dt-bindings: ipmi: Add optional SerIRQ property
 to ASPEED KCS devices
Message-ID: <20210326014947.GA2160061@robh.at.kernel.org>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-18-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319062752.145730-18-andrew@aj.id.au>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Mar 2021 16:57:49 +1030, Andrew Jeffery wrote:
> Allocating IO and IRQ resources to LPC devices is in-theory an operation
> for the host, however ASPEED don't appear to expose this capability
> outside the BMC (e.g. SuperIO). Instead, we are left with BMC-internal
> registers for managing these resources, so introduce a devicetree
> property for KCS devices to describe SerIRQ properties.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml      | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
