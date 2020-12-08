Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75162D1FE9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Dec 2020 02:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgLHBVt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 7 Dec 2020 20:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLHBVt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Dec 2020 20:21:49 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8F39C061794;
        Mon,  7 Dec 2020 17:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=vXfBmV1WtpQrMd4/iEKqvXO0wvtb19cUUXMuUNVtQi4=; b=Rjq77hcRxkpyBdxp7o+bgrP+kA
        qmjJgvrrF1pNpYJwCTCyhfePAXp/wWm0Pkcb/rp5IQ2dVh7XfivNR2zy/DJ0odUFEht4kfP0AqWk0
        6um4Vrip3g+f4C2/F4gCj7mBfTG9BsHVQDgylUSAmTu8/UTyCKMKyJHHXWU94nWCCtu14BOXe0hMt
        MNhseyweAsJyePULtVrFbONLqF2H96ys1T1axJl4x3EzSJADMtoNC2HMp8N5lCA2nywHr54Sh9tQR
        ZRUqRZelOOWhInu3zWEJOEqUr5XH4mbGiB7c8xP9ZonpIY7BlUhf+6Qar+jbLgWOS97ZXbI0lQ5O3
        efwRnr9g==;
Received: from [2601:1c0:6280:3f0::1494]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kmRgd-0007VO-4E; Tue, 08 Dec 2020 01:21:03 +0000
Subject: Re: [PATCH v3] drivers: gpio: add virtio-gpio guest driver
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     corbet@lwn.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, mst@redhat.com, jasowang@redhat.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
References: <20201207204838.21406-1-info@metux.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b550dcf-7e4d-39d2-bcaf-3f6cdb688da0@infradead.org>
Date:   Mon, 7 Dec 2020 17:20:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207204838.21406-1-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 12/7/20 12:48 PM, Enrico Weigelt, metux IT consult wrote:
> Introducing new GPIO driver for virtual GPIO devices via virtio.
> 

Oops, I missed one thing:


> 
> diff --git a/Documentation/gpio/virtio-gpio.rst b/Documentation/gpio/virtio-gpio.rst
> new file mode 100644
> index 000000000000..e7bf01ec1ce7
> --- /dev/null
> +++ b/Documentation/gpio/virtio-gpio.rst
> @@ -0,0 +1,176 @@
> +"""""""""""""""""
> +Virtio-GPIO protocol specification
> +"""""""""""""""""


In Documentation/doc-guide/sphinx.rst, it says to please use the
following heading adornments....
and """""...""""" is not one of them.

Neither is "..........".

Also, only use an overline for the document title and not for
lower level headings.

Here are the expected heading adornments:

  1. ``=`` with overline for document title::

       ==============
       Document title
       ==============

  2. ``=`` for chapters::

       Chapters
       ========

  3. ``-`` for sections::

       Section
       -------

  4. ``~`` for subsections::

       Subsection
       ~~~~~~~~~~


> +...........
> +Specification for virtio-based virtiual GPIO devices
> +...........
> +
> ++------------
> ++Version_ 1.0
> ++------------
> +
> +===================
> +General
> +===================
> +
> +The virtio-gpio protocol provides access to general purpose IO devices
> +to virtual machine guests. These virtualized GPIOs could be either provided
> +by some simulator (eg. virtual HIL), routed to some external device or
> +routed to real GPIOs on the host (eg. virtualized embedded applications).
> +
> +Instead of simulating some existing real GPIO chip within an VMM, this
> +protocol provides an hardware independent interface between host and guest
> +that solely relies on an active virtio connection (no matter which transport
> +actually used), no other buses or additional platform driver logic required.
> +
> +===================
> +Protocol layout
> +===================
> +
> +----------------------
> +Configuration space
> +----------------------


thanks.
-- 
~Randy

