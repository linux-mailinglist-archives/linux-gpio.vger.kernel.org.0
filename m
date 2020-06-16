Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC5C1FBFA7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2020 22:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730252AbgFPUCa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 16:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728144AbgFPUCa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 16:02:30 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A84BC061573;
        Tue, 16 Jun 2020 13:02:29 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w15so12495544lfe.11;
        Tue, 16 Jun 2020 13:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mw839rq7RjrHM/hppkDoF5y0yc1HEG6Z382QxOHiZE4=;
        b=tgt9w+4hhcFOFvmXJG0d9BLOqArfPCHifgXbSYew66UIyXnLr0WUwEx4TsvRz028Lf
         bivExKj/4cpv1mA9fUYkYngREvq4Ty+BdV9AWLRkuU+b3R/ghhAzF1wjZ9am/BzgnyAX
         6BgHGeesz3cMwAjD4Rys7gVGBQU67KzsuHhhtgpfNUJZD/kvU+P/MCh1OjqYNn3Ep7Cw
         L9rH+HQR6ygyoEG8foSwxB1CSQG2UL/cuJCqr/UNNKO6DUcxhcaBIsIE+cl6mW+us2h8
         od9BQKTKD5jIGZEmQe4fPRcAGCJpk/K9mtLFGnyRNHfnLo5jzYY4BZW0TecQWRJ02foK
         xOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mw839rq7RjrHM/hppkDoF5y0yc1HEG6Z382QxOHiZE4=;
        b=G1jwDtcOlbUPEIQWWQ9ojo2SKl1pyy85B4hUHz57dq+zyDnHpV6dnOxdCPaxYltlYT
         S5Oob3/jAXV0fJJ/oTkIJyiCZPEFsuA5CIsXu3hoxPIw8HqyndbIHoMLOsTc5jInETTF
         Sinf7vOn8LrP0a1wIafyqwLdi/4VBRPeAXccyZQOyEMP8u15GUVMbH6ZA17Z/vV5lSCC
         Dx+TrOzj9pvIfk3gn0xFNTPjovQoKdwpVrUCIjHcbRkaSTIK5xhfgHbQPvzNXgMTjpQO
         v9hG70xtTAMKuLMr9WlUIAMFTO53t34yIaLX0eD6cfiTTuR3srZ/130Njp5Pl54ZHU4i
         MSkA==
X-Gm-Message-State: AOAM532zF5GQUsji/q92dIA/u1VuUVFJNK3t3la+UCAkIZakGSflhSxg
        jLlycDmav2iQmdzpn9UEzVWSKj0U
X-Google-Smtp-Source: ABdhPJytqFCePdIKP+8M6eemAWjcBI9X51u1xMeVXsCLKE0WG48gFo9Ny4Zbw4Qelfx4B3lTHCtSNA==
X-Received: by 2002:ac2:44cd:: with SMTP id d13mr1126260lfm.13.1592337748063;
        Tue, 16 Jun 2020 13:02:28 -0700 (PDT)
Received: from mobilestation ([95.79.139.207])
        by smtp.gmail.com with ESMTPSA id 144sm2858709lfm.87.2020.06.16.13.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:02:27 -0700 (PDT)
Date:   Tue, 16 Jun 2020 23:02:25 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
Message-ID: <20200616200225.32mwzew3zw3nuiwh@mobilestation>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:
> Some devices would need to have a hierarchy of properties and
> child nodes passed to the child or children of MFD. For such case
> we may utilize software nodes, which is superior on device properties.
> 
> Add support of software nodes to MFD core and convert one driver
> to show how it looks like. This allows to get rid of legacy platform
> data.
> 
> The change has been tested on Intel Galileo Gen 2.

I am wondering whether we could move the {gpio_base, ngpio, irq_shared}
part into the gpio-dwapb.c driver and use either the ACPI-based or
platform_device_id-based matching to get the device-specific resources
info through the driver_data field. By doing so you wouldn't need to
introduce a new "snps,gpio-base"-like property and propagate
software_node-based properties, but still you could get rid of the
dwapb_platform_data structure since all the info would be locally
available.

If ACPI-based matching doesn't uniquely address the Quark GPIO node,
then you could just replace the intel_quark_mfd_cells[0].name with
something like "gpio-dwapb-quark", which then by the MFD core will be
copied to the corresponding platform_device->name due to calling
platform_device_alloc() with cell-name passed. That name will be used
to match a platform_driver with id_table having that new name added.

-Sergey

> 
> Andy Shevchenko (5):
>   gpio: dwapb: Replace irq_shared flag with fwnode type check
>   gpio: dwapb: Read GPIO base from snps,gpio-base property
>   mfd: intel_quark_i2c_gpio: Convert to use software nodes
>   gpio: dwapb: Get rid of legacy platform data
>   gpio: dwapb: Define magic number for IRQ and GPIO lines
> 
> Heikki Krogerus (1):
>   mfd: core: Propagate software node group to the sub devices
> 
>  drivers/gpio/gpio-dwapb.c                | 44 +++++++++-------
>  drivers/mfd/intel_quark_i2c_gpio.c       | 64 +++++++++++-------------
>  drivers/mfd/mfd-core.c                   | 31 ++++++++++--
>  include/linux/mfd/core.h                 |  3 ++
>  include/linux/platform_data/gpio-dwapb.h | 23 ---------
>  5 files changed, 85 insertions(+), 80 deletions(-)
>  delete mode 100644 include/linux/platform_data/gpio-dwapb.h
> 
> -- 
> 2.27.0.rc2
> 
