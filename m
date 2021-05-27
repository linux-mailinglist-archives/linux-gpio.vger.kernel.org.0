Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE35393962
	for <lists+linux-gpio@lfdr.de>; Fri, 28 May 2021 01:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236485AbhE0XtY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 27 May 2021 19:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236327AbhE0XtX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 27 May 2021 19:49:23 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E9EC061574
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 16:47:48 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id w7so3018117lji.6
        for <linux-gpio@vger.kernel.org>; Thu, 27 May 2021 16:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2q5bxqiL3RmhUQgZjWS0StDo6w0kZxEVUhgbpPjauE=;
        b=cSDGAxeChyN935ODp1inJLu7l0S13MyTsKIRSsqXOK6cXm+8i2omLijZJqU/JUH6Ah
         D/2OlVMBYcjb+AyQZg7J3MeEfF0BG3Vaugml//5QcemxM/+aFpgZvcLCb0bZfY0IIal3
         R5slk2oWlepD6l/bsYyrxkhjN43IBFyYL25ZFccy1lkZCi1dVZkWlfopwoxaSYvLqHj5
         Bf/dx6Knm3aucrzCINO61otLB0vyjLch4hgNIs2IoH8pmbWm2d5ZHGBinREHNkUXlMVA
         ZSfRBTBsslzQjNbsP+PZSrT3qPiw9bYhxfIrI1mTTzeUPb1fyeFG4n7X/NA0ROkKrpnJ
         T+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2q5bxqiL3RmhUQgZjWS0StDo6w0kZxEVUhgbpPjauE=;
        b=khpRU1dQWG9H98uqxxZAct7CVEELnVXm1kL5bb8b6FiiETVMwCUwg5lrFhOEKBSVIv
         HgGaq8dfpvE/7GPEuuniHGEg23Dozwdfu0y1/Zt1sW7KZdLPtNvhIRUyS8MIWQKriq8Y
         cm0rnAykSaS7BiMIMgHJPUbe/aC3HfNAgPI2qheSLCE65JTVmIbn/9N/d/zxzF7EtMau
         aDPDrD3uwcMv12qwUQ5RaSFS2hUZ/8V86KYUwp3pUFOxw8j29LU1JOHcJaTZiv4JUUnb
         d7Sev/d76/FgtcrJwlfDLG5+lR1STN4FawK8mcVkXbgx7g6rbdC2iPFQO5iMBNzNcGfA
         vYhw==
X-Gm-Message-State: AOAM5323Sx8UALmkRC0DAtkH6JW9zppJ4FvAa2BbOrtr8WPQ1qLlN/EV
        lT0RGzuibjgmr/kzuGVGPBzjzf2qV8E6DPxcWGkgGSECtsI=
X-Google-Smtp-Source: ABdhPJzRZIXUM5v0L9y/J3SYmWZlTefoTYzbZzpPJiwkvhwh8H0h3EDZMkqNbakFaetCMO0USRSrvzBmrnlu03IJpJ4=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr4436100ljg.368.1622159266928;
 Thu, 27 May 2021 16:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com> <20210525055308.31069-3-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-3-steven_lee@aspeedtech.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 May 2021 01:47:36 +0200
Message-ID: <CACRpkdZy0UwaJcYTiM9asVwNh4wuEYdMSrmqAPAiikbrvjtKpw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add pinctrl settings
To:     Steven Lee <steven_lee@aspeedtech.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Rob Herring <robh+dt@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        "moderated list:ASPEED PINCTRL DRIVERS" 
        <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
        "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Hongwei Zhang <Hongweiz@ami.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 7:53 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Currently, only SGPIO master 1 and SGPIO slve 1 in the pinctrl dtsi.
> SGPIO master 2 and slave 2 should be added in pinctrl dtsi as well.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please funnel this patch through the Aspeed/ARM SoC tree.

Yours,
Linus Walleij
