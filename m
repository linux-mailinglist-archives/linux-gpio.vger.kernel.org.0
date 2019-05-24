Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9B329FB2
	for <lists+linux-gpio@lfdr.de>; Fri, 24 May 2019 22:19:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403942AbfEXUTL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 May 2019 16:19:11 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44127 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403868AbfEXUTL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 May 2019 16:19:11 -0400
Received: by mail-ot1-f65.google.com with SMTP id g18so9788623otj.11;
        Fri, 24 May 2019 13:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4BgwpmzvuEYG5bbiFXcT5gJEK7XLNndx1UEVcbCTL1Y=;
        b=Q9ZHzt/hfC+2knGIBNhtqkTJUNoZiF+HEtYBuBW43az6cgdkGPNai2zLruoruTyxAO
         59crY51pYf3t/JzoK+xBHrkWLI3tAClu7aJt21aSlMnWe2xcLe67g8b1MPPwW7BLEASL
         T3z48rcNJmZ23c23UkR1AyeDepFBOO2tYQg8HP0x4q6GlQ7lCyNu3GxcVlN3Ubb2JSaT
         vH/pxHsgJs76WG/QcF0h1745ZxZnvSwhxxXfi5Tj3yaKQ7F5pkoikrv5+oBuxb37k/Xs
         VZEdA+K959BtVIhkUUY1cMULhPR6kAy2aXKMI8IEEfph3bNREE0z1vlW1IBw+VvjJ1PX
         eNSQ==
X-Gm-Message-State: APjAAAUDljyNkHe+NmvjPZWVTF14j9ElG4chXv5id1+SxPMJPJe+uB6N
        Bj1NLIw+b5zS6tho3wxdug==
X-Google-Smtp-Source: APXvYqw3YcrBMtqX52qXcQ/4FkGRHHhtIFwYq6n0tYdUypl+6QyDB8HR06oq8ut8MDibo+v2QpeVWQ==
X-Received: by 2002:a9d:2965:: with SMTP id d92mr25712643otb.87.1558729150351;
        Fri, 24 May 2019 13:19:10 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m13sm1132617ote.68.2019.05.24.13.19.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 May 2019 13:19:09 -0700 (PDT)
Date:   Fri, 24 May 2019 15:19:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc:     linus.walleij@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, pdeschrijver@nvidia.com,
        josephl@nvidia.com, smangipudi@nvidia.com, ldewangan@nvidia.com,
        vidyas@nvidia.com
Subject: Re: [PATCH V3 1/4] dt-binding: Tegra194 pinctrl support
Message-ID: <20190524201908.GA13368@bogus>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, May 16, 2019 at 05:23:11PM +0530, Krishna Yarlagadda wrote:
> Add binding doc for Tegra 194 pinctrl driver
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> ---
> Changes in V3:
> remove optional fields not supported by pins published here
> 
>  .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 107 +++++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt

Reviewed-by: Rob Herring <robh@kernel.org>
