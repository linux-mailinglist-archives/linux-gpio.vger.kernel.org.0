Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2DE2D1298
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Dec 2020 14:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgLGNx4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 08:53:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44379 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725822AbgLGNx4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 08:53:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607349149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=o2eDRpg2p3nscNNP24Y5Wwi2J4Ejtn5EoY7jP2IsnBU=;
        b=Sb555piwauIVRwBB2hC1xw2b/RNQm+JidT7PCSXHT8p7mPfUAHdJDEe7m6V3CJQg8GMLXT
        2OQQ2JBH9rhuneONRkyNasO2H+os27XEtAU8VywBlMsRhTCjz7Sndy+/jAjVSmZaJ2EyfH
        s63b0VWVTGAmJtwpE2Iez1reDfUSNxc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-BL1Js0AZNL6cshXHJ_P0Hw-1; Mon, 07 Dec 2020 08:52:27 -0500
X-MC-Unique: BL1Js0AZNL6cshXHJ_P0Hw-1
Received: by mail-wr1-f71.google.com with SMTP id u29so431807wru.6
        for <linux-gpio@vger.kernel.org>; Mon, 07 Dec 2020 05:52:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o2eDRpg2p3nscNNP24Y5Wwi2J4Ejtn5EoY7jP2IsnBU=;
        b=peiNdqpfaGXuyCrWwjpfyF56ntwBMG7I+eZa4pBQu4e7TbROTJXaEtPWTVdEGMxkbt
         ImFbr7fJDRgadpec/G2kxaxFfxCCCDa5zIP3VdCwoFZOoDw/wSRkEolyX7KreShYvDkK
         Fr2S8J7Z4P3P5EbsvjaC57hxaAnwRDlk1F8moL4xSaMFwvFoUmlCzjMOYFCTBOGHLITd
         +r5KbLtX00wZ54ztIfeP7nuqbiQrjW7XCdjmUhu86rPeEpoq1NuRt3/mYAxDdEypa/B/
         3GUvQEempnIQGHY0RoDErokavqEQbbEH2UvzSmjN96PJRSJiu/F5+xBkC5/sU14WLAzm
         eukQ==
X-Gm-Message-State: AOAM532QrIfIW5YwMgdlZbb5IhTn88IKYEMUmxq0NbjsFEJQ9qqvoGvZ
        A/CHih2JqJmIvHE6Qr+flrrvXxSlLrg2JVzRu31pmjhJLb+QX35yQ6xNLjEtNR9P6hs2xdOQhu0
        cEsPPzUGUQ/QocNOQr4y48w==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr19985950wrv.181.1607349145791;
        Mon, 07 Dec 2020 05:52:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxry8r99XfuZsd9xpT/D3HhTrDgujG2fkSVGb9ILMFpXGDKe10crdm3NpHJ20Ml9kS7Zd7JfA==
X-Received: by 2002:a5d:5689:: with SMTP id f9mr19985923wrv.181.1607349145521;
        Mon, 07 Dec 2020 05:52:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
        by smtp.gmail.com with ESMTPSA id h14sm13884316wrx.37.2020.12.07.05.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 05:52:24 -0800 (PST)
Date:   Mon, 7 Dec 2020 08:52:20 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com,
        msuchanek@suse.de
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201206075131-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
 <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 05, 2020 at 09:05:16PM +0100, Enrico Weigelt, metux IT consult wrote:
> On 05.12.20 20:32, Michael S. Tsirkin wrote:
> 
> Hi,
> 
> > It seems a bit of a mess, at this point I'm not entirely sure when
> > should drivers select VIRTIO and when depend on it.
> 
> if VIRTIO just enables something that could be seen as library
> functions, then select should be right, IMHO.
> 
> > The text near it says:
> > 
> > # SPDX-License-Identifier: GPL-2.0-only
> > config VIRTIO
> >         tristate
> 
> oh, wait, doesn't have an menu text, so we can't even explicitly enable
> it (not shown in menu) - only implicitly. Which means that some other
> option must select it, in order to become availe at all, and in order
> to make others depending on it becoming available.
> 
> IMHO, therefore select is the correct approach.
> 
> 
> >         help
> >           This option is selected by any driver which implements the virtio
> >           bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
> >           or CONFIG_S390_GUEST.
> > 
> > Which seems clear enough and would indicate drivers for devices *behind*
> > the bus should not select VIRTIO and thus presumably should "depend on" it.
> > This is violated in virtio console and virtio fs drivers.
> 
> See above: NAK. because it can't even be enabled directly (by the user).
> If it wasn't meant otherwise, we'd have to add an menu text.


The point is that user enables one of the bindings.
That in turn enables drivers. If we merely select VIRTIO
there's a chance user won't remember to select any bindings
and will be surprised not to see any devices.



> > For console it says:
> > 
> > commit 9f30eb29c514589e16f2999ea070598583d1f6ec
> > Author: Michal Suchanek <msuchanek@suse.de>
> > Date:   Mon Aug 31 18:58:50 2020 +0200
> > 
> >     char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
> >     
> >     Make it possible to have virtio console built-in when
> >     other virtio drivers are modular.
> >     
> >     Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> >     Reviewed-by: Amit Shah <amit@kernel.org>
> >     Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> > which seems kind of bogus - why do we care about allowing a builtin
> > virtio console driver if the pci virtio bus driver is a module?
> > There won't be any devices on the bus to attach to ...
> 
> When using other transports ?

Any transport selects VIRTIO so if you enable that, you get
VIRTIO and thus it's enough to depend on it.

> In my current project, eg. I'm using mmio - my kernel has pci completely
> disabled.
> 
> > I am inclined to fix console and virtio fs to depend on VIRTIO:
> > select is harder to use correctly ...
> 
> I don't thinkt that would be good - instead everybody should just select
> VIRTIO, never depend on it (maybe depend on VIRTIO_MENU instead)

GPU depends on VIRTIO and on VIRTIO_MENU ... which seems even messier
...

> 
> --mtx
> 
> -- 
> ---
> Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
> werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schlüssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287

