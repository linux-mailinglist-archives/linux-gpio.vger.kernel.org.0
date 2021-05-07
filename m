Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB48376B64
	for <lists+linux-gpio@lfdr.de>; Fri,  7 May 2021 23:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhEGVDo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 7 May 2021 17:03:44 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:43955 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbhEGVDn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 May 2021 17:03:43 -0400
Received: by mail-oi1-f174.google.com with SMTP id j75so9886560oih.10;
        Fri, 07 May 2021 14:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DO84sjLIGDwcAM2CNEDLSdiq+br7DBsTGAzQsrrr+pg=;
        b=oc/B4hPiFAb1jUTEbqE4SE/ff7zvwws/DBr/oug5pwaa+DPrSarWe78eEJPYmSMqPm
         D/HLBHFUt9V5pP3sqDzRai8QVaGcYLkTXo3aITZaBM1l07cIQoN8O7NwSMAwoGO8wBvw
         CNo09kHzekv15vh63jE10IkpvZGKzpSoeCKsszfgETyGHXxUdi85FwMM2zhUnQCuHF7K
         PXySSktB1UQdz0XMfv5ldz1QMw6xPNZg45lpj9C0obcWHWZszbq+i5XJip+1eIsllLeB
         YuNDJXo9F25PXWtL9DXcfdDE9ACueNp+ZNFHMiv8RKQaq9T8qnQp4owBk9rmxw5vkqsb
         R7XA==
X-Gm-Message-State: AOAM5315VWuIlrsDSzcCj2USkwZpU/PSCtJtqiYz7+DIDWt3JZVLDoje
        wC2q5IKT8XlVhKPw7QqWiw==
X-Google-Smtp-Source: ABdhPJzGyVwFjylBNk+9CXgwXew9QRQ+W239mTVZzULe1gjXLn4AvTcsr5e2JqI/c7bb5p4ShjdtRg==
X-Received: by 2002:aca:1814:: with SMTP id h20mr16149416oih.150.1620421361927;
        Fri, 07 May 2021 14:02:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t9sm1418345otl.5.2021.05.07.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 14:02:41 -0700 (PDT)
Received: (nullmailer pid 2878901 invoked by uid 1000);
        Fri, 07 May 2021 21:02:39 -0000
Date:   Fri, 7 May 2021 16:02:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Johan Jonker <jbx6244@gmail.com>, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, jay.xu@rock-chips.com,
        shawn.lin@rock-chips.com, david.wu@rock-chips.com,
        zhangqing@rock-chips.com, huangtao@rock-chips.com,
        cl@rock-chips.com, linux-gpio@vger.kernel.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: gpio: convert rk3328-grf-gpio.txt to
 YAML
Message-ID: <20210507210239.GA2875797@robh.at.kernel.org>
References: <20210505134028.13431-1-jbx6244@gmail.com>
 <20210505134028.13431-2-jbx6244@gmail.com>
 <4104568.ejJDZkT8p0@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4104568.ejJDZkT8p0@phil>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 07, 2021 at 10:59:09PM +0200, Heiko Stuebner wrote:
> Hi Bartosz,
> 
> Am Mittwoch, 5. Mai 2021, 15:40:25 CEST schrieb Johan Jonker:
> > Current dts files with RK3328 GRF 'gpio' nodes are manually verified.
> > In order to automate this process rk3328-grf-gpio.txt has to be
> > converted to YAML.
> > 
> > Rename 'grf-gpio' nodename to 'gpio'.
> > 
> > Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> 
> just to not step on any toes, do you plan to apply this patch1 later on?
> Patches 2-4 are in my domain so I'll get them after -rc1, but in theory
> the gpio binding should go through the gpio tree.

Different trees will break the schema checks because the grf schema 
refers to the gpio schema.

Rob
