Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19831FC1F1
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 00:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgFPW4y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 18:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgFPW4y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 18:56:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA13BC061573;
        Tue, 16 Jun 2020 15:56:52 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id q19so536870lji.2;
        Tue, 16 Jun 2020 15:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xATZgEhnG4iKc4HqGtcJhZicmRUvlwjJ75PcShv0Jqo=;
        b=CPIBpSPElykGHBPMqo9Q4pjn4Auscuaph/MdSO7bCogU5ysAEYwLTmQx6PdzbDoZZQ
         zO53ZnWwyw0JejFDRyEQTSkMbKkyOoMDWhYOZ5KyQkdweEb1CVtRPSD8VptrrN2IDNPZ
         Ynd+IOUh+YpoK3CQ59njE+4WC4lOo34DaNvGx7o2SUrnIzrAlvGRWC2KIrxfZihuGhtb
         hk2MLH76MfcLE/vyEYaHtewAfbZYQl2lYJRdtALC1ljmkR5WglIL4OZLkcbDMagABPe8
         WQXemwGwOTZXLGrhg/T5II1GAGtlEPABzRFCPt9oHuM8PNFt1RscmpN1Bhb1SnqQoCyg
         kuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xATZgEhnG4iKc4HqGtcJhZicmRUvlwjJ75PcShv0Jqo=;
        b=SERNXsTPOkKf9ixTvC8ByKCjVeiUZ5Lh81QJxWKofhI2Y4ogZWCVg4NkjFukjEWn+3
         tu0a2mDWiUvZ6Xpp52K1MAXbgyY8BXsaGq8GXHMiJ9Hnc4QgOWwy+rOvJ4aS00x1n2JQ
         wOnGr/5+MdFwXWpOqu5qKHw/AsomtNRfuALdFVsQHpYpJImE2GKFsvxmVHfQDrn+4/KX
         QEooRJXiijV+dN+XcKckXDOipOKKrsfjJk8i+wrWznPgKOl/9DH1R2BwikgFLFHNna/p
         pQnOX2nMzGuSQuIkxV/o8naQjsYn/YgzHGc3o3LnZjCF6VwpBKx5OMlg4RM8Y5krimz9
         lS8g==
X-Gm-Message-State: AOAM531KeU9lUggxUx1p2ZBtCZS8r9Gr7K6Jhc8ZmdZVNrkuwu39lc7q
        oRxc3a0KUTo98g5m5FeVGds=
X-Google-Smtp-Source: ABdhPJzb+Fd0VMFfJKRay58MZlrAsRVUwz7+Aw5W83ky8xl5ymgEUzxNmrsFflzNNxMu9ttEGmjA7Q==
X-Received: by 2002:a2e:3010:: with SMTP id w16mr2515012ljw.8.1592348211279;
        Tue, 16 Jun 2020 15:56:51 -0700 (PDT)
Received: from mobilestation ([95.79.139.207])
        by smtp.gmail.com with ESMTPSA id a1sm4631647ljk.133.2020.06.16.15.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 15:56:50 -0700 (PDT)
Date:   Wed, 17 Jun 2020 01:56:48 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 0/6] mfd: Make use of software nodes
Message-ID: <20200616225648.eqzugzapatblndcy@mobilestation>
References: <20200608134300.76091-1-andriy.shevchenko@linux.intel.com>
 <20200616200225.32mwzew3zw3nuiwh@mobilestation>
 <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfZMx8ip=Bo=gZQiGufJvh=7dtr61C3ZcZjETFrErTk6Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 17, 2020 at 12:40:35AM +0300, Andy Shevchenko wrote:
> On Tue, Jun 16, 2020 at 11:03 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> > On Mon, Jun 08, 2020 at 04:42:54PM +0300, Andy Shevchenko wrote:
> > > Some devices would need to have a hierarchy of properties and
> > > child nodes passed to the child or children of MFD. For such case
> > > we may utilize software nodes, which is superior on device properties.
> > >
> > > Add support of software nodes to MFD core and convert one driver
> > > to show how it looks like. This allows to get rid of legacy platform
> > > data.
> > >
> > > The change has been tested on Intel Galileo Gen 2.
> >
> > I am wondering whether we could move the {gpio_base, ngpio, irq_shared}
> > part into the gpio-dwapb.c driver and use either the ACPI-based or
> > platform_device_id-based matching to get the device-specific resources
> > info through the driver_data field. By doing so you wouldn't need to
> > introduce a new "snps,gpio-base"-like property and propagate
> > software_node-based properties, but still you could get rid of the
> > dwapb_platform_data structure since all the info would be locally
> > available.
> 
> The idea is to get rid of the driver being dependent on some quirks
> when we may do it clearly and nicely.

Yes, I've got that and in most of the aspects I like what you suggested
in this parchset. But it seems to me that the maintainers are mostly prone
to having some of the platform-specifics being locally (in-driver) defined.
So I proposed an alternative solution, which might do to satisfy their
requirement. Note saying that you want to get rid of the quirks and
introducing something like "gpio-base" firmware property seems contradicting
a bit. 

> We, by applying this series, make (keep) layers independent: board
> code vs. driver code. Mixing them more is the opposite to what I
> propose.
> 
> WRT property.
> snps,gpio-base can be easily changed to *already in use* gpio-base or
> being both converted to linux,gpio-base to explicitly show people that
> this is internal stuff that must not be present in firmware nodes.
> 

As I see it the part with "gpio-base" and the irq_shared can be moved to the
gpio-dwapb.c driver to be defined as the quark-specific quirks. Adding a
property like "gpio-base" seems like a quirk anyway, so I'd leave it defined in
the driver.

* Note I don't really like replacing the irq_shared flag with to_of_node()
because in general to_of_node() doesn't mean the IRQ line is shared, so
selecting the shared and non-shared interrupt request paths based on that macro
seems hackish.

> > If ACPI-based matching doesn't uniquely address the Quark GPIO node,
> > then you could just replace the intel_quark_mfd_cells[0].name with
> > something like "gpio-dwapb-quark", which then by the MFD core will be
> > copied to the corresponding platform_device->name due to calling
> > platform_device_alloc() with cell-name passed. That name will be used
> > to match a platform_driver with id_table having that new name added.
> 
> Oh, that doesn't sound right. It makes things ugly.

I may have said that a bit unclearly. The only thing you'd need to do is to
add an unique name to the Quark GPIO cell, like:
drivers/mfd/intel_quark_i2c_gpio.c:
static struct mfd_cell intel_quark_mfd_cells[] = {
        {
                .name = "gpio-dwapb-quark",
        }

Then make the gpio-dwapb.c driver being compatible with that device by declaring
the id_table with that device name and passing the table to the DW APB GPIO
"struct platform_driver" descriptor. The MFD/platform cores already provide the
functionality of matching those two device and driver. If ACPI node uniquely
defines the Quark GPIO with all that quirks applicable then you wouldn't even
need to do the platform_device-driver-based matching. Just use the acpi_device_id
to get the quirks flags/descriptors. 

The rest of the patchset concerning passing software_node's down to the
individual MFD sub-device and declaring "reg" and "snps,nr-gpios" in there seems
pretty much acceptable to me.

* Though indeed it would be better to mark the "snps,nr-gpios" as deprecated in
the DT schema and have the "ngpios" supported as well.

-Sergey

> 
> -- 
> With Best Regards,
> Andy Shevchenko
