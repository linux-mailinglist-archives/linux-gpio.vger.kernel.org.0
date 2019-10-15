Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04563D838E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 00:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389755AbfJOWYT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Oct 2019 18:24:19 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34090 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732312AbfJOWYT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Oct 2019 18:24:19 -0400
Received: by mail-oi1-f193.google.com with SMTP id 83so18306904oii.1;
        Tue, 15 Oct 2019 15:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nK0aavkV2vBesQcv0AgqoDNcvg469f2OzuJk5GeXGKE=;
        b=tm3NVTLbuROFoKpV12NBTzuQkEpufJ6jXkk/a0zACWGzx2a2sXFydOMMhcIYAwqfW9
         1mcYcarXVSubjdSwL5FUt+/rX5iqTjB6ycXPVdaUGTqLrJhrrtEZe2iHL4uR3B/5SltF
         W7wOkq3EkYmW38uh6PhjvRbsvZImP7dvUdrF2WAzW/UskQ4hiIIlm//KkmBQ5uzSAODJ
         vCA3TjGg/KP65cPs5iIYKyLqCRz5IxQ+sxGT32XDUqWAJ9hwjNiWBHsM5g9vp5eJY8/6
         TnAkbkDs+7cKRXRVP1KDswCdvDBcHem2ivB6ighRO6jVjhBqXt2ffOK3eWgtFxqO3GvZ
         l/tg==
X-Gm-Message-State: APjAAAWtVvZyt7/m+oxfW/CBag/ABH1kLt748S2T4ykwTNMap0y0OBXj
        r+uJ6u4+g7+2re4Wdnmekw==
X-Google-Smtp-Source: APXvYqw2zlzetx+asQEISLHCoq9N6nsXVVk1APE2KhuoS0Weh/DxpADYhOg0xmTVQQw+4Z3eMZTbng==
X-Received: by 2002:aca:3b84:: with SMTP id i126mr785946oia.28.1571178256967;
        Tue, 15 Oct 2019 15:24:16 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m20sm6622503oih.43.2019.10.15.15.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 15:24:16 -0700 (PDT)
Date:   Tue, 15 Oct 2019 17:24:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        johnny_huang@aspeedtech.com, ryanchen.aspeed@gmail.com
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: aspeed-g6: Rework SD3 function
 and groups
Message-ID: <20191015222415.GA10977@bogus>
References: <20191008044153.12734-1-andrew@aj.id.au>
 <20191008044153.12734-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008044153.12734-2-andrew@aj.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue,  8 Oct 2019 15:11:47 +1030, Andrew Jeffery wrote:
> Rename SD3 functions and groups to EMMC to better reflect their intended
> use before the binding escapes too far into the wild. Also clean up the
> SD3 pin groups to eliminate some silliness that slipped through the
> cracks (SD3DAT[4-7]) by unifying them into three new groups: EMMCG1,
> EMMCG4 and EMMCG8 for 1, 4 and 8-bit data buses respectively.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Unfortunately reflowing the list creates a lot of noise in this change. As
> mentioned the SD3DAT[4-7] groups are renamed, as is the SD3 function. There
> should be no functional changes beyond that.
> 
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 86 +++++++++----------
>  1 file changed, 42 insertions(+), 44 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
