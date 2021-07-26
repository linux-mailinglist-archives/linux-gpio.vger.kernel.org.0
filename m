Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363603D695A
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jul 2021 00:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhGZVjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jul 2021 17:39:47 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:47099 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231502AbhGZVjq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jul 2021 17:39:46 -0400
Received: by mail-io1-f50.google.com with SMTP id u15so13713651iol.13;
        Mon, 26 Jul 2021 15:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/UPTsSiPssy2lUwQ2bCypVro7JXhjzsIo3rMa398JW0=;
        b=rSGm8/sn0InO8elBj+QFuzY2ZhbjJWbn9hFBf+ELTEJFDmYuPWAHm/xSZgG2dLcPzk
         pqpjyxiWEklxVD4WKOB1M3j0d+xvWS6HcKKBrpUe61c3yCj6IIlQH+7w6O0oar46bz0E
         /t/SIAL2R6qQBk7lj2ZLrElR7TlIQAXDWyCO/3Ek375JqldJg8WI+lpH7zncKrWDjmIg
         jbHVWIspdZ+Cuf5UE9sGQHV5OAUlZQ4bPAn9Fju1QF/SdVRF4PYFQkENS6qFy+IK4aKT
         +4OV4Wnsv4VaUT5/uWxAihieKBBXcK6avJbgPE6ohjZaUjqR69f3NZi5SWSsBbbjseAb
         ogdg==
X-Gm-Message-State: AOAM532xJN5X8u3CS5i0RqzctKvKOJT7gvX/po3+GpV8pO4A7ZZVNNge
        EXygBXuiYLzHE5wxxZeQKnReslar4Q==
X-Google-Smtp-Source: ABdhPJyym75PURmZfN5Nxhsua4zaOr9IGbKcUMcawU/jhiLfJ7DA3ZH6Nav8c0QrQsRNSKYDZwqwmg==
X-Received: by 2002:a6b:6f11:: with SMTP id k17mr16247995ioc.114.1627338013818;
        Mon, 26 Jul 2021 15:20:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id v18sm582510iln.49.2021.07.26.15.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:20:13 -0700 (PDT)
Received: (nullmailer pid 974953 invoked by uid 1000);
        Mon, 26 Jul 2021 22:20:10 -0000
Date:   Mon, 26 Jul 2021 16:20:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     devicetree@vger.kernel.org, heiko@sntech.de,
        linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        bgolaszewski@baylibre.com, Liang Chen <cl@rock-chips.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 4/9] dt-bindings: gpio: change items restriction of
 clock for rockchip,gpio-bank
Message-ID: <20210726222010.GA974922@robh.at.kernel.org>
References: <210726013345.1634442-1-jay.xu@rock-chips.com>
 <20210726013457.1634557-1-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210726013457.1634557-1-jay.xu@rock-chips.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 26 Jul 2021 09:34:57 +0800, Jianqun Xu wrote:
> From: Liang Chen <cl@rock-chips.com>
> 
> The clock property need 2 items on some rockchip chips.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> ---
> v7:
>  - none
> v6:
>  - add to this serials
> 
>  .../devicetree/bindings/gpio/rockchip,gpio-bank.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
