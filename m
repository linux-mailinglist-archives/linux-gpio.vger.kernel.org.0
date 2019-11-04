Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75DEEEE377
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Nov 2019 16:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfKDPSi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Nov 2019 10:18:38 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41337 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728634AbfKDPSh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Nov 2019 10:18:37 -0500
Received: by mail-lf1-f67.google.com with SMTP id j14so12535016lfb.8
        for <linux-gpio@vger.kernel.org>; Mon, 04 Nov 2019 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+E7LWzV2qXCNRIBtcAIV+W0ZCP1K/HQKiWB7nT2TOy8=;
        b=D/cI3U9xqryIIgDDI2eBVyrOv6zSDY4Pv+f328Xd9w0FWRKPL9SepMctPo8vzhaaXq
         JKh/YWLF8H8HIBlZDPxh1/vPfUusVLkKj9OZoYWNzerJtUMNPqKhjNTdpnRpyqslruwb
         CegL3eXGFM1VOu/QZKgQ/twCosf0mPtB6Kxb9u42OOC+Ssqzahiso82Zdjw2L1L1kNgH
         IcnrI8vlT9QbPm3Y1rddZ4S8y8GqiWg7CJ4+g2TaNNPSbjKt8VyTvY6valcRjKybX5Vs
         5ePdycM5TguOwltalFWXkyGhlR5maH6n+maZG1hptHww/xI9mWVeSA391hIKB7dsGeTZ
         J89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+E7LWzV2qXCNRIBtcAIV+W0ZCP1K/HQKiWB7nT2TOy8=;
        b=Xkc8BA3iGvoFNvCy+/GswsqnTas9zUoDvMzBrdzIpll7UkXS208x+y9B7cJcuMmL0x
         LIpo2iLzAwgs3NgReRcqinTGW+SWkP4bBtMzEKq0wRIDt8Kd+pxy7T7pYBB7K7a5VrdN
         T6Ezkve2RB2Qsysp9E6w9yaRJIvGlE6PHDXu9gbfqG2FP2YY+Wr8P2JdaymVH9NLjWIF
         UmMYctg7RGtQJUl6k0A+whi3XqQprdKfmUNuiALY1wpyCoroInD4zfNSWE61bWfIJ3IE
         tpKX/qPyZb3ZOeSwuA1ppd1O+yqhFjRsyh7JtgscO8o6J4rvYuNtlui2JXz3cSBXtG36
         KUWA==
X-Gm-Message-State: APjAAAUOiryubcjPagEMz6DuzIuhZDjUeuiwSWBbZuwtsZoriT2OkAXH
        JPJ8Pa/jytJ7rqKIayIJJqlkFsM/fkODfCJSKXSM8w==
X-Google-Smtp-Source: APXvYqzj/twzOpW0JzQapnFO7QVDw82naU/CokfBf0anIa43kxBTcOQzzxx1Ne85jRVyIt1xkLGVqg4MTcpngDB6R7k=
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr16950975lfp.5.1572880715670;
 Mon, 04 Nov 2019 07:18:35 -0800 (PST)
MIME-Version: 1.0
References: <5dbb2acf.1c69fb81.54ce2.2f48@mx.google.com> <9d1a6cba9687f94b2d36a82f42f5d4be2b16e7a6.camel@alliedtelesis.co.nz>
In-Reply-To: <9d1a6cba9687f94b2d36a82f42f5d4be2b16e7a6.camel@alliedtelesis.co.nz>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Nov 2019 16:18:23 +0100
Message-ID: <CACRpkdamE_Zyein+6x70noJ5Z6RJpV2qJEHOVwPxysONH+-Rag@mail.gmail.com>
Subject: Re: linusw/devel boot bisection: v5.4-rc1-31-g6a41b6c5fc20 on rk3399-puma-haikou
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
        "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
        "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
        "mgalka@collabora.com" <mgalka@collabora.com>,
        "matthew.hart@linaro.org" <matthew.hart@linaro.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "bot@kernelci.org" <bot@kernelci.org>,
        "khilman@baylibre.com" <khilman@baylibre.com>,
        "guillaume.tucker@collabora.com" <guillaume.tucker@collabora.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "sbranden@broadcom.com" <sbranden@broadcom.com>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "rjui@broadcom.com" <rjui@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 31, 2019 at 8:35 PM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
> On Thu, 2019-10-31 at 11:41 -0700, kernelci.org bot wrote:

> > Breaking commit found:
> >
> > -------------------------------------------------------------------------------
> > commit 6a41b6c5fc20abced88fa0eed42ae5e5cb70b280
> > Author: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Date:   Fri Oct 25 09:27:03 2019 +1300
> >
> >     gpio: Add xgs-iproc driver
> >
> >     This driver supports the Chip Common A GPIO controller present on a
> >     number of Broadcom switch ASICs with integrated SoCs. The controller is
> >     similar to the pinctrl-nsp-gpio and pinctrl-iproc-gpio blocks but
> >     different enough that a separate driver is required.
> >
> >     This has been ported from Broadcom's XLDK 5.0.3 retaining only the CCA
> >     support (pinctrl-iproc-gpio covers CCB).
> >
> >     Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >     Link: https://lore.kernel.org/r/20191024202703.8017-3-chris.packham@alliedtelesis.co.nz
> >     Acked-by: Scott Branden <scott.branden@broadcom.com>
> >     Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Hmm,
>
> I don't see how this commit would have caused the oops. The new driver
> shouldn't (and doesn't appear to be) run on any platform as nothing
> declares .compatible = "brcm,iproc-gpio-cca" (yet).

I think it looks really bogus as well.

Could it be that these systems are memory constrained such that
the kernel image just exactly right now collides with the upper
memory limit or corrupts its own ramdisk?

I suppose I can't ask the kernel robot to do any more detailed
debugging.

I can't see any problem with this patch.

Yours,
Linus Walleij
