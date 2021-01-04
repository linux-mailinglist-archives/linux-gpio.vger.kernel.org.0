Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE162E97B9
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Jan 2021 15:54:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbhADOyO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Jan 2021 09:54:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:50554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725840AbhADOyO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 4 Jan 2021 09:54:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 84520221E5;
        Mon,  4 Jan 2021 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1609772014;
        bh=6cDGKM8nEu8BYsa8KY/klev5tWMRKU9jT3zWEyFDPxk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eiClA8Z/cu9IRaSugaZmBjtmDwWr9gRIrhkTRwZI+/7Na/Tf3jMXxbM+GvlZjGRRa
         qkzaMquRWV3knkqXV5nto7ev9Jv9un4KNv0LSmbDpHYJg/ruhgiXfFYOLRC/WDDCQs
         k3QUamyoT002oODuhLQx97rdc8BnxyKdmTznsSDM=
Date:   Mon, 4 Jan 2021 15:55:00 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jason Yan <yanaijie@huawei.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/8] pinctrl: ralink: rt2880: Some minimal clean ups
Message-ID: <X/MsRF5+cUryg5Gm@kroah.com>
References: <20201213161721.6514-1-sergio.paracuellos@gmail.com>
 <CACRpkdb8z8su9HPkSdnRitVe0unuBDtg0azif19LGb84F=m19A@mail.gmail.com>
 <CAMhs-H9ACwSbJeqRvVOy3w44mhUB9ij1s=idP6xnEDF4LVvQpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMhs-H9ACwSbJeqRvVOy3w44mhUB9ij1s=idP6xnEDF4LVvQpw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 04, 2021 at 03:45:36PM +0100, Sergio Paracuellos wrote:
> Hi,
> 
> On Mon, Jan 4, 2021 at 3:39 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Sun, Dec 13, 2020 at 5:17 PM Sergio Paracuellos
> > <sergio.paracuellos@gmail.com> wrote:
> >
> > > After this driver was moved from staging into pinctrl subsytems
> > > some reviews for bindigns and driver itself comes from Ron Herring
> > > and Dan Carpenter. Get rid of all the comments to properly be in
> > > a good shape before merge window.
> >
> > Applied patches 1-7 to the pinctrl tree, patch 8 needs to be sent
> > to Greg.
> 
> Thanks Linus. PATCH 8 should apply directly as it is in this series
> also in staging. Greg, can you take PATCH 8 from this series or do you
> want me to resend it?

Resend please.

thanks,

greg k-h
