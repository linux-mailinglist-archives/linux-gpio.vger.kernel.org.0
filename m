Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F021850A2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 22:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgCMVHF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 17:07:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39163 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbgCMVHE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 17:07:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id r15so13853992wrx.6
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2020 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ctrrvsauAYuF+5TZRvlwZdq08mz1JQ5bpHPFrWuBNr4=;
        b=Svo7zeocU6WeReAJ0ARsPwMuvSxptIHLhgPIFefBnZPEgG3FnK7tlqkWb7i3HOx5vL
         VqIJixbFQCwfd8MGlA7fSHwwWQNaHCqOvQ9m3WtJIB+UnsMRMYMZKMn/00sakmoj55Xu
         Z3/TNEbyJZzM2ZGXSyR73sB/2Nk0vJcW+6GyPWiNj7nO5yA9XRhdmKNWsopYUJtYt4QW
         VV9bGGawnMGRYIRVN8R4lXD7VyZ/Xuu0K7XeOBl2nODRTmHtzKpY5GY+42fn66+vKffB
         VfdATghzXSOLKiTo7jvnVseKl8R7tuI2mE+U+32kp57yPJ1VQV/w4ar6oX00nmofuiwC
         6Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctrrvsauAYuF+5TZRvlwZdq08mz1JQ5bpHPFrWuBNr4=;
        b=hboZjVupzaFKka7h5SIwp6ZhbhSyzoQb67dguJGNsgoE75ocbKuIe1hmVFNyFZsqAx
         oM6DWhnLKzK4uCdd5QD72WSMjzQedi9ZJh6Q0f4gQcdMQaGo4LlAO1xFE/apYmur1a/e
         d/CdBf0ilBp3jd+I/7p2ue/hAfYYUdaMNN+HICJgGq88VROug4g/lJIMs3dWQ801e0Ad
         Yh6v9X1OnidU5Q+TDzNTjfVOiZCjw4DjKBKijRN+1RjObNalcCH1DWaVz8E8lqHB+jbq
         qra+tI9FoUJrXFvKjhRMkXLGL2fOMG/+2Az1D8JSESYg2PKDz3G9IkULh0Je44P2jG15
         IOSg==
X-Gm-Message-State: ANhLgQ2J1450lfG94kYQmC781i2Za6tbThE3dDdlItSM474ujgxWoOep
        XNAm6Sl3kbXDZRrnSTLxqsyHEAuLG944UCcsCdHCzQ==
X-Google-Smtp-Source: ADFU+vsIUBmJY+qJUpydM7cUlRZIlWdsbcgH0EazC9FLlBHdfGb9NDjL1C/xJGV9L08jQ8hdqvDculuC7IAjSKJD3C8=
X-Received: by 2002:adf:91c3:: with SMTP id 61mr6714394wri.384.1584133622854;
 Fri, 13 Mar 2020 14:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <1583941433-15876-1-git-send-email-tharvey@gateworks.com>
 <20200313153151.e5nmsbr6yrzchdxi@rric.localdomain> <20200313191230.qrrlo7ht24fhfhvj@rric.localdomain>
 <CAJ+vNU0q7wW8JPC8FjEkD4a-ZJc1QAmVNne0w1T4MX9pd4bCyg@mail.gmail.com> <20200313202444.vdfdowbudlsxmqsf@rric.localdomain>
In-Reply-To: <20200313202444.vdfdowbudlsxmqsf@rric.localdomain>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 13 Mar 2020 14:06:50 -0700
Message-ID: <CAJ+vNU1S+z1xLAW2nxpGTZN_6wzr0+t=4q5NDRVpCc92d_98hQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: thunderx: fix irq_request_resources
To:     Robert Richter <rrichter@marvell.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2020 at 1:24 PM Robert Richter <rrichter@marvell.com> wrote:
>
> On 13.03.20 12:41:19, Tim Harvey wrote:
> > On Fri, Mar 13, 2020 at 12:12 PM Robert Richter <rrichter@marvell.com> wrote:
> > >
> > > On 13.03.20 16:31:51, Robert Richter wrote:
> > > > On 11.03.20 08:43:53, Tim Harvey wrote:
> > > > > If there are no parent resources do not call irq_chip_request_resources_parent
> > > > > at all as this will return an error.
> > > > >
> > > > > This resolves a regression where devices using a thunderx gpio as an interrupt
> > > > > would fail probing.
> > > > >
> > > > > Fixes: 0d04d0c ("gpio: thunderx: Use the default parent apis for {request,release}_resources")
> > > > > Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> > > > > ---
> > > > >  drivers/gpio/gpio-thunderx.c | 9 ++++++---
> > > > >  1 file changed, 6 insertions(+), 3 deletions(-)
>
> > > Looking at the original code, the parent resources are requested only
> > > if existing. So the change is ok.
> > >
> > > On the other hand, the overall change using irq_chip_{request,
> > > release}_resources_parent() became pointless now. It is unreadable and
> > > more complex now. Thus, commit 0d04d0c should just be reverted.
> > >
> > > The function interface is limited. Instead of letting the child device
> > > deal with the parent, parent requests should be handled directly in
> > > irq_request_resources(). Another aspect is that the code for this
> > > driver has been already removed upstream and ti_sci_inta_msi.c is the
> > > last remaining user of it. This speaks also for a removal by a revert.
>
> > A revert does make the most sense to me and it works for 5.2, 5.3, and
> > 5.5 but the revert fails for 5.4 and needs some manual intervention.
>
> v5.4 should additionally revert a7fc89f9d5fc ("gpio: thunderx: Switch
> to GPIOLIB_IRQCHIP"). v5.5 contains this revert too (a564ac35d605
> Revert "gpio: thunderx: Switch to GPIOLIB_IRQCHIP") and the code in
> that area is the same then for all kernels from 5.2 to 5.5, which is
> basically a revert back to 5.1. I think this is ok.
>
> Do you have a particular test case to test the driver that I can use
> for my own testing?
>

Robert,

The hardware I have has an interrupt controller with its upstream
interrupt to an OctoenTX GPIO (and its driver is in progress and not
yet accepted upstream which means this issue in 5.2/5.3/5.4 doesn't
affect me). I'm unclear if you just need a device that has an
interrupt on the OcteonTX GPIO or if the device has to be an interrupt
controller to trigger the issue as is my case.

Tim
