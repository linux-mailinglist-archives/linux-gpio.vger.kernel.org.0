Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60ACC1E0F96
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 15:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390754AbgEYNfg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 09:35:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388794AbgEYNfg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 25 May 2020 09:35:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8BE842073B;
        Mon, 25 May 2020 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590413736;
        bh=/72aYS03PTgitMRbLEoL5VA6pHsNsvFhgWo3DmnTBUk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M7rUk/qH6pK6wkXGpKOMB88gQbPwbxTegUUWc+4soZXGF7fZEIcCa2GiTtz1GoNXG
         V0FCUI9SbMhnNEe1S3fODwvTXeE+5/+AelvaEHTZKHKRs6Z+/1F2CnFKi8C3jcZwPO
         piHAKD7HSFePdX1nmuBdHKrUQKITLBgW1pxWHhtI=
Date:   Mon, 25 May 2020 15:35:33 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/2] usb: serial: xr_serial: Add gpiochip support
Message-ID: <20200525133533.GA872869@kroah.com>
References: <20200428195651.6793-1-mani@kernel.org>
 <20200428195651.6793-3-mani@kernel.org>
 <CACRpkdZ3b-VLvxN06H_4cDOtUEQTVbe=Zw+NA=YjssMzK2d2sQ@mail.gmail.com>
 <20200429124918.GC6443@Mani-XPS-13-9360>
 <20200519085703.GB27787@localhost>
 <CACRpkdapMuMs_mEUHheGtaKYg97=nL1bH3zq4Tc3cnX9Jbw-Ew@mail.gmail.com>
 <20200525111203.GB279021@kroah.com>
 <CACRpkdaQLmZEDm4nFxtAiyOJVgUMp7tDgAv8-Bwk=G_SV5jf-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaQLmZEDm4nFxtAiyOJVgUMp7tDgAv8-Bwk=G_SV5jf-g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 25, 2020 at 03:02:15PM +0200, Linus Walleij wrote:
> On Mon, May 25, 2020 at 1:12 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > > I remember I even referred to this myself, but I've been waning a bit
> > > on it recently, because it turns out that userspace/users aren't very
> > > good at parsing sysfs for topology.
> >
> > Which is why they could use libudev :)
> 
> Yet they insist on using things like Busybox' mdev (e.g. OpenWrt)
> or Android ... or is Android using libudev now? I'd be delighted
> if they did.

No, Android is not using libudev yet, they seem to be reinventing the
same thing, slowly, over time :(

greg k-h
