Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32BD5477608
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Dec 2021 16:35:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235182AbhLPPfE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Dec 2021 10:35:04 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:43521 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbhLPPfD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Dec 2021 10:35:03 -0500
Received: by mail-oi1-f181.google.com with SMTP id w64so3007388oif.10;
        Thu, 16 Dec 2021 07:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Tzhyv7NNF7027JUFF/IG6LCltND4kDLQ7SHvh0WotTc=;
        b=0I1Q7nD4se471xmd0HzLwwJbezTljxzK39mLTf+f+ovq592fGNtHfpIhp3ZP8mpuaI
         HmXh/yQr3QsjIPHerOWDL/Av6BVRaTLQG+qTr/uj6so4OE3I1CKrMskfHVqDHKBndlkn
         3oaAwOUcc6hjO0siQPEPRJUZJRC9aA2lhcHvI1KIKo3FCdlupKxrrDUBT9BXU/zkoqFt
         5dk2fJbRsikn+KLYvx02kYEwMdIfOdGbiQ2K1wkaWMoQjepR4Jqrdrn5sZXpd2kudfUn
         52unOQxW8ptMJXUO225A9rPuImq3h7ZA128x1KTmnmM3oAaxkPiaKOurjpy/VUwr2oUh
         uccw==
X-Gm-Message-State: AOAM533v+GGaMI2EFsn4cVryB45RtV2ldKGCi3P/jP4Cg3JxTio+I624
        Q5vgeMrtW1XUspWyu7zOjw==
X-Google-Smtp-Source: ABdhPJxrqO+9RtItEezdVson2d2d60GMBm2W2a5PxEHKDpLl3bbr6SRznUOSvL1zUtJJz1oxNqLDZg==
X-Received: by 2002:a54:4104:: with SMTP id l4mr4432313oic.17.1639668902580;
        Thu, 16 Dec 2021 07:35:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m6sm1082852ooe.24.2021.12.16.07.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:35:01 -0800 (PST)
Received: (nullmailer pid 259578 invoked by uid 1000);
        Thu, 16 Dec 2021 15:35:01 -0000
Date:   Thu, 16 Dec 2021 09:35:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
        linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add binding for BCM4908 pinctrl
Message-ID: <YbtcpbLIlUV89qEK@robh.at.kernel.org>
References: <20211215204753.5956-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211215204753.5956-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 15 Dec 2021 21:47:52 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's hardware block that is part of every SoC from BCM4908 family.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../pinctrl/brcm,bcm4908-pinctrl.yaml         | 72 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm4908-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
