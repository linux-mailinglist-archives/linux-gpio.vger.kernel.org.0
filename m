Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1ED3349F06
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Mar 2021 02:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbhCZBsw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 Mar 2021 21:48:52 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:38878 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhCZBsq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Mar 2021 21:48:46 -0400
Received: by mail-io1-f50.google.com with SMTP id e8so3887223iok.5;
        Thu, 25 Mar 2021 18:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X6YTJv8PO1HpNTdDvMgdjs2viXmFhvJEOHLtU1v5wAY=;
        b=QrSWfZrDax2mQkF2VFgSouQZ5p61EjHThlSFENPbZkgT7AeATIAYtLK35XMD2lB8b5
         PVhpBgBfq5wKUUeJaMfIJVYtBymA+fvy7I7Rud9PbZ/OlVIMpoAuttb/ISQYMxtbOu4k
         aTEjXtjKaroy5T7aYEYsFB8FLtYvGbU0v4eCmpaXQckA3yi+9UPxQeAAAiC5499tnGmt
         JvNZdkBBOA+IEliUA3GzTuaARZugfNU737oY7nfnu7zNp9iNmFARWZ5wUjwo8rfaGYPp
         UoXvBoX0wXvQLZV1B4tlppz3rVSp5skj0KrvzQ2h++CEkBPan7BS4u0SieZuGvyKyVd1
         7nww==
X-Gm-Message-State: AOAM531OoCfBCaxLkWE2sWUYwn6WjZiAFLqFMIhaSHFDotJGJkF2Heul
        e6MSVpnUX/InIkBkN76T3Q==
X-Google-Smtp-Source: ABdhPJyDmoRag/D/LcKrCkrgOgZ/N8vDgz2C2nifLnc+tV7blqHuXcykgqFsEtGx5Ud/vQlEzwZksA==
X-Received: by 2002:a6b:6418:: with SMTP id t24mr8313385iog.159.1616723325341;
        Thu, 25 Mar 2021 18:48:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id k17sm3561002ilr.57.2021.03.25.18.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 18:48:44 -0700 (PDT)
Received: (nullmailer pid 2158331 invoked by uid 1000);
        Fri, 26 Mar 2021 01:48:42 -0000
Date:   Thu, 25 Mar 2021 19:48:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     linux-gpio@vger.kernel.org, avifishman70@gmail.com,
        tali.perry1@gmail.com, chiawei_wang@aspeedtech.com,
        ryan_chen@aspeedtech.com, lee.jones@linaro.org,
        linux-arm-kernel@lists.infradead.org, joel@jms.id.au,
        tmaimon77@gmail.com, benjaminfair@google.com,
        linux-kernel@vger.kernel.org, venture@google.com,
        linux-aspeed@lists.ozlabs.org,
        openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, minyard@acm.org
Subject: Re: [PATCH v2 17/21] dt-bindings: ipmi: Convert ASPEED KCS binding
 to schema
Message-ID: <20210326014842.GA2158272@robh.at.kernel.org>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <20210319062752.145730-17-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319062752.145730-17-andrew@aj.id.au>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 19 Mar 2021 16:57:48 +1030, Andrew Jeffery wrote:
> Given the deprecated binding, improve the ability to detect issues in
> the platform devicetrees. Further, a subsequent patch will introduce a
> new interrupts property for specifying SerIRQ behaviour, so convert
> before we do any further additions.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 92 +++++++++++++++++++
>  .../bindings/ipmi/aspeed-kcs-bmc.txt          | 33 -------
>  2 files changed, 92 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
