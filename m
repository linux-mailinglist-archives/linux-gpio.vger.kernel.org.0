Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D05D61191E1
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2019 21:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfLJU2f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Dec 2019 15:28:35 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:59857 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfLJU2e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2019 15:28:34 -0500
Received: from mail-qk1-f179.google.com ([209.85.222.179]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M89P1-1iiKUE0lgh-005KcS; Tue, 10 Dec 2019 21:28:33 +0100
Received: by mail-qk1-f179.google.com with SMTP id k6so17641251qki.5;
        Tue, 10 Dec 2019 12:28:32 -0800 (PST)
X-Gm-Message-State: APjAAAWN0jcFRxy70ZS5Pbt2Dt+hbgrm8lRcFMX/xbUJCc/mA19gE89e
        wOkP4w5vx/wSuh/N3Mq/Gdn3WhRJYUXZ1rhQ+II=
X-Google-Smtp-Source: APXvYqwt9caxIUrIQ2NdHcG+cD2q94bydYJ7whIaffA5PYvMfQleMpxvcQxJOlg1tgvDnanZiobaAJqL4Q0Twu9SfCk=
X-Received: by 2002:a37:5b45:: with SMTP id p66mr6225717qkb.394.1576009711991;
 Tue, 10 Dec 2019 12:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20191210195414.705239-1-arnd@arndb.de> <01669f6c5d0e40c7a410da2dcce6c9e825e4a1d4.camel@alliedtelesis.co.nz>
In-Reply-To: <01669f6c5d0e40c7a410da2dcce6c9e825e4a1d4.camel@alliedtelesis.co.nz>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 10 Dec 2019 21:28:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a35xz_ZDN=5ZLjy6nniMtpJLwxmNmjr7d6NrOq1TU989g@mail.gmail.com>
Message-ID: <CAK8P3a35xz_ZDN=5ZLjy6nniMtpJLwxmNmjr7d6NrOq1TU989g@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: remove __exit annotation for iproc_gpio_remove
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/o7CudpYHFP0rDjHiqPJCJgRGCgB9HvzhXdeU3v+nhQ/O99Z0sR
 4sO9+1w4cKFImpI4I5w9WYji6mulKAuIbtv86682+z21ft1bg7N0ynRlfe9xljtP9Hq1irW
 KRRMppP5BstRLVCuOsRejAJ5+ssvjAEPhbxGHae1nFzOHeBpbEG1XvtfSqgEUPh5Af1BCGq
 NTHsOY3Zz8eRxJyhRk/2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zAmb2zOHaDg=:onB4eygwOw8tQBK2DbnZ9z
 tOqkpO4IYhi9qqodNPRK9zByp8XScvBvIbik3ieseDjoo0uBsbQo8B90XEVwMXJDCn92vEHDD
 yqHsEI39EW19iQMnSNXcMcMf/RuHD39PGM7317WqO8MOk4D9VUkT85SrOZB+OMYmqHXdInQJv
 OZiM7h1G3CmjifR0/NpW0XuX674QwhDLZQDUjTd/injBq+UvG3ZzH0+FwUDsytDYmgipm+Lob
 tY50lsl4YfU7MWRcCCiI5+8z8F82f8RB6gVhnevd3WkIs+5fOw9jUHavo3dUll5MOu1IyGaih
 ANoHoI6HBV7BvAipFc1VaA9a/K+GVOAoL0n+1DL9u4fOl0dUff4AeCwUjx5lKhx9RUBHRbslI
 OxcoPKFTytMfIEnJz2jvIHLhOrvXECO56KlLXYAdh8K8624gLJrEThyTYptJXeeZIPFAObZvV
 iRCHoFgfsTNbH+bm/q98IrjFG/5dFoQe0da/7FegdBEUGmIHqNUVU3bJnCexJyRGQsok+bD9P
 bRZ+o5yqZWhp64O0VLiobYAONKLBvr/Py0JllQqTwm/sfSbVdEABHMTx94PssOCyZ7mwJe47L
 quranFGST4PUk2cxWuvEBw1vJQxPKqWKBJ43QQrAsMnE6PZWfJq4Cr/W0tl/DPMZoJfSAD2IR
 VCkeZAUCh1kHvyE4wPhNcW7HZooTB+hZgtSc9bSvEl//RDHgHrXGtmqK8M7WX5de4D3as85hw
 +EKwyYU+qucdybel8huHQ+jTHugsmHGVoq4q6FcxNutDSFmklYReG48/fdxJK4x5fQL+Nxgvm
 WIInG9jvHi1A00jNcmN/NwJjsm3Uv723deYWujYeyYG8l/OA+E4nGT3kj3huAJcn1yq7Jd0vP
 QR3drhE+8c9MP2n04ZPw==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 10, 2019 at 9:24 PM Chris Packham
<Chris.Packham@alliedtelesis.co.nz> wrote:
>
> On Tue, 2019-12-10 at 20:54 +0100, Arnd Bergmann wrote:
> > When built into the kernel, the driver causes a link problem:
> >
> > `iproc_gpio_remove' referenced in section `.data' of drivers/gpio/gpio-xgs-iproc.o: defined in discarded section `.exit.text' of drivers/gpio/gpio-xgs-iproc.o
> >
> > Remove the incorrect annotation.
> >
> > Fixes: 6a41b6c5fc20 ("gpio: Add xgs-iproc driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> What's the current best practice w.r.t.__init and __exit? I seem to
> have messed this up on multiple fronts.

These are used for anything that is a module_init() function or a
module_exit() function, or called from one, but generally not
for any callbacks.

In particular the probe() and remove() callbacks of a device driver
can get called at runtime when the device is hotplugged through
sysfs.

       Arnd
