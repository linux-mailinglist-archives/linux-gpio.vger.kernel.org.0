Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE3A02D7365
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 11:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388204AbgLKKGY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 05:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405787AbgLKKGD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 05:06:03 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C3FC0617A6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 02:04:42 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id m5so8390236wrx.9
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 02:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=1m1097L8Z65yNEwPVsqCFAhMTO7JcIQztqm0XMNCEPQ=;
        b=QxFc8GC7E8T+U1gL6XJZvjeXxiWbuXfRqv6+3/ZJOEoQYn8YiRuOLDZAWueGTraddr
         xPqz2bb/8UoAjcvd5vsoN8LW5Iq1Lp0AqSabcEPsXCi+l/VkgtRG+OzcSz2lDjE/Pdix
         jshzcxstN+qosX02zQCGS+/I2FYEYzEAEBcOtJSJ1mr8h1MxoB17ALXOASyS2RwWORLD
         sYyHzWywWpvht4yy3yfrgCqZgrWTC9ga2KkmmQ+oI2PP2v+Qn9n0ORXRDwcKBkqiCMKf
         N0XznwYuSkPJfUeKcTzGZ2pjw4N1X+j5jdnHapfeS7fwZVeyxQTBUj+e7/XfSTgXR3Ap
         ykzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1m1097L8Z65yNEwPVsqCFAhMTO7JcIQztqm0XMNCEPQ=;
        b=isUfTPZP4a3M/wVuFoxhbdTAAD12fKNMavTiGc0/ZpBGX0uyDE7oDijApxwf46CdCL
         Oc/KJ45auj1E8D3N5KJHHpaQqxBj2r2/Kg43/+5OlBwpIb3kF5fCjk3TRDZPqNdu4nWz
         2uuGBuYewxs43VNCIF+QAiwf+8+NGNSL78QhxFNMWEHLnC4FKsoPK+nbXSlwPWMZjkOT
         Dwd61RJ0RjD9lvyNYeV/UqHuQfSp6Srw6IYPVVA0/ZP+6F+LLZv8DUPa1F/asK5eMKze
         DE0LGqQAQLFFmmyVQ90K3hW+oEBYmf4GAtLA6lNrmZrr9EO69uo7hIH/XDDVPrZv/eHW
         fG1Q==
X-Gm-Message-State: AOAM533ZZMKtWliscERusQayMgQ2/dxeNxeeJGeEPlvaKQPShH2GE3Me
        zUpPMQQnnv3bLA7vxivd7h8GDw==
X-Google-Smtp-Source: ABdhPJwPXfTZPDeiEu60EOOVLfjPDebdQDfkcu30zCcF3k07tbHpbRDSiAPsDeGxO9u3bWjkQ8cNJw==
X-Received: by 2002:a5d:6ccc:: with SMTP id c12mr13142414wrc.4.1607681080467;
        Fri, 11 Dec 2020 02:04:40 -0800 (PST)
Received: from dell ([91.110.221.240])
        by smtp.gmail.com with ESMTPSA id 125sm14307876wmc.27.2020.12.11.02.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 02:04:39 -0800 (PST)
Date:   Fri, 11 Dec 2020 10:04:36 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        linux-gpio@vger.kernel.org, Jon Mason <jdmason@kudzu.us>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-pci@vger.kernel.org,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
        Tariq Toukan <tariqt@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [patch 16/30] mfd: ab8500-debugfs: Remove the racy fiddling with
 irq_desc
Message-ID: <20201211100436.GC5029@dell>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.157283633@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201210194044.157283633@linutronix.de>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 10 Dec 2020, Thomas Gleixner wrote:

> First of all drivers have absolutely no business to dig into the internals
> of an irq descriptor. That's core code and subject to change. All of this
> information is readily available to /proc/interrupts in a safe and race
> free way.
> 
> Remove the inspection code which is a blatant violation of subsystem
> boundaries and racy against concurrent modifications of the interrupt
> descriptor.
> 
> Print the irq line instead so the information can be looked up in a sane
> way in /proc/interrupts.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/mfd/ab8500-debugfs.c |   16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
