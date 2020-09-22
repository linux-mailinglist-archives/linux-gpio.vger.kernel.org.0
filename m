Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5E7274C3B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 00:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgIVWjp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Sep 2020 18:39:45 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:32965 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgIVWjo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Sep 2020 18:39:44 -0400
Received: by mail-il1-f194.google.com with SMTP id y2so8237866ila.0;
        Tue, 22 Sep 2020 15:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KP/bIax8AYxevHceHULkcS4me70aHkKP7ZGYXm7vv54=;
        b=We4l8B50JSD6qCXq1gxI1hHalQ5e3Ag2eN/FsUjRj3slyl5Ml9SS2heaSYoSbzAdkA
         BhX1HfWm0dygw7wYZVgZ0swUTurLVWmAEkQfRynSFsjSSJrwebOpgD2WupItcNIK100i
         rDNJQp3Apfcm/RRR3Rzp3i9RKdncmGkZL4gerPFX87LzTGF2r8Yhm7REzSBl8a92juLQ
         5sOJsklnvlyuP0TmUmAoT1X0rJmk7HSyVX4xPOEI3LotOWf4ntMQ1/H0td7EKe/8TEBO
         zYrH/bNpNxETQsLdhdeDcAZQY4J1bUD880/NsIXioxGg2kos6Fqz9j7fbmetilc4CP9n
         pAWw==
X-Gm-Message-State: AOAM530gMZBTGWdLj2PfeBjyFcwRgIKSBKSAKEEhHKNsVuhxZTzL4vUa
        JJaq91AxES6ecbhJck+mmJ/SI53WhNlB
X-Google-Smtp-Source: ABdhPJy/D45MSIrtIxNDveJ1FlhelEkEb4ukAbZHwXhyxMtJXSjWg4yZn0PGGjL0bwqExLSA7b0r3Q==
X-Received: by 2002:a92:dd8a:: with SMTP id g10mr4497927iln.125.1600814383453;
        Tue, 22 Sep 2020 15:39:43 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id g1sm9786940ilh.12.2020.09.22.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 15:39:42 -0700 (PDT)
Received: (nullmailer pid 3391337 invoked by uid 1000);
        Tue, 22 Sep 2020 22:39:40 -0000
Date:   Tue, 22 Sep 2020 16:39:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio/aspeed-sgpio: enable access to all 80 input
 & output sgpios
Message-ID: <20200922223940.GA3391274@bogus>
References: <20200911015105.48581-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911015105.48581-1-jk@codeconstruct.com.au>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 11 Sep 2020 09:51:04 +0800, Jeremy Kerr wrote:
> Currently, the aspeed-sgpio driver exposes up to 80 GPIO lines,
> corresponding to the 80 status bits available in hardware. Each of these
> lines can be configured as either an input or an output.
> 
> However, each of these GPIOs is actually an input *and* an output; we
> actually have 80 inputs plus 80 outputs.
> 
> This change expands the maximum number of GPIOs to 160; the lower half
> of this range are the input-only GPIOs, the upper half are the outputs.
> We fix the GPIO directions to correspond to this mapping.
> 
> This also fixes a bug when setting GPIOs - we were reading from the
> input register, making it impossible to set more than one output GPIO.
> 
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> 
> ---
> v2:
>  - Fix warnings from kbuild test robot
>  - Add comment for input/output GPIO numbering
> ---
>  .../devicetree/bindings/gpio/sgpio-aspeed.txt |   5 +-
>  drivers/gpio/gpio-aspeed-sgpio.c              | 126 ++++++++++++------
>  2 files changed, 87 insertions(+), 44 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
