Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC88420464
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 00:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbhJCWuS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 3 Oct 2021 18:50:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhJCWuS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 3 Oct 2021 18:50:18 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1806CC0613EC
        for <linux-gpio@vger.kernel.org>; Sun,  3 Oct 2021 15:48:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y26so63997622lfa.11
        for <linux-gpio@vger.kernel.org>; Sun, 03 Oct 2021 15:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sW+crIeDmhAMH4pK5GASAaCZE8D1VZtdK5/sygrAG2k=;
        b=lQrEOA0euWiU9H9sWtnhFM9pj1nGUVTgMmT1inlS8kcAIcWUCFr349N1dSAz2SVqFj
         T7ORD7odD/G0eN6Z706ABNk23F2RpNaz9XiITGtS4a/oLqxc8vuWRXMazGo3kVH7nEhf
         id6efAjoCVCJj4EHeoDcPwnvEdhdrZYcay0MmicPuvWvTC2tTU4WHwu9kmjVm1V4AwTR
         u6HEKMibBBBYXjB040lkOfpApeYAiOmDVboF7H14zEQd2CgkvyFRV06wLTn0go2HgEcm
         q5Ki3D4KVSRrkUBia9z2Nc7Z2wKuTuJ7Xo21FCTQ2IL9079vG1F49SrZu+4+Y7LN8iJb
         jIIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sW+crIeDmhAMH4pK5GASAaCZE8D1VZtdK5/sygrAG2k=;
        b=JExxB+iu4h8Qo0e5oXyIPKwysSoH87KhLR/syN4zY+uYozxWeJ/BPEq5wXflEjt2/S
         112WyNKfRbW06kW4JFQoERFXBWIhn9Er2WiotsSaS5OY6VwHaIeZW/97pEQ5IqYIt0Ah
         a2lvEd3JT3W2BYT+Z2NYU4wkY434LsgkoaTI4BHnWUh1RPf+RO2SN4qBl9Mg2jAcZs12
         b1hQYKEPPjdfPcmw2RlTeU1wUWuMhs9kG84U3r/GP+Xy8cVd/2ktUicvSPjPKUJeRqdh
         1LJtREV/RYztjxelsBQKFLRgm/sH7iyy8ROZysvr7/ppk29nCipOpg7tC09X9bfmBNnG
         ol1Q==
X-Gm-Message-State: AOAM5318UTwbxYBGelxI9bsVTC9YlWp2a9RLAXdbUCLtv51r9cMrOM+5
        MDV6STHJgrdJzNGTc/aax23svJbc59fnDIjhLfUn/Q==
X-Google-Smtp-Source: ABdhPJwlIO3xJmMne7SA3V9EP6o49YZWJtcqreYaPVZa30sqz5Vxc/CuLZ5GbJ4uqeokuIsg0281gvTYxIzcMfCsea0=
X-Received: by 2002:a2e:4e11:: with SMTP id c17mr11819356ljb.19.1633301308432;
 Sun, 03 Oct 2021 15:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr> <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org> <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <20210719225906.GA2769608@robh.at.kernel.org> <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
 <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com>
 <CACRpkdZfZLQMgpMAF2FwSVt1YAzhQJ9ZWkVUjVc2xpmWL7yEvQ@mail.gmail.com> <CA+HBbNHZyYnnyz9=4Hgav96ZH8-R-nYoi300j2x3fgei8aa4zQ@mail.gmail.com>
In-Reply-To: <CA+HBbNHZyYnnyz9=4Hgav96ZH8-R-nYoi300j2x3fgei8aa4zQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Oct 2021 00:48:17 +0200
Message-ID: <CACRpkdaBUrgnyFnO0Tdae56PKR4pLN1boLpK0FMCk7eYshZ5LA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Robert,

sorry for slow reply, I am a bit busy.

On Tue, Aug 24, 2021 at 10:03 AM Robert Marko <robert.marko@sartura.hr> wrote:
> On Wed, Aug 11, 2021 at 2:17 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Tue, Aug 3, 2021 at 9:23 PM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > > The pins that this driver wants to expose are used for SFP-s only,
> > > they are provided by the Lattice CPLD which also does other things.
> > >
> > > Linux has a generic SFP driver which is used to manage these SFP
> > > ports, but it only supports GPIO-s, it has no concept of anything else.
> > > Since the driver is fully generic, I have no idea how could one extend it
> > > to effectively handle these pins internally, especially since I have more
> > > switches that use the CPLD for SFP-s as well, even for 48 ports and 192
> > > pins for them.
> >
> > Which file is this driver in so I can look?
>
> Hi Linus,
> Sorry for the late reply.
>
> Sure, here is the generic Linux driver that is used for SFP handling:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/sfp.c?h=v5.14-rc7

So this has this:

enum {
        GPIO_MODDEF0,
        GPIO_LOS,
        GPIO_TX_FAULT,
        GPIO_TX_DISABLE,
        GPIO_RATE_SELECT,
        GPIO_MAX,

        SFP_F_PRESENT = BIT(GPIO_MODDEF0),
        SFP_F_LOS = BIT(GPIO_LOS),
        SFP_F_TX_FAULT = BIT(GPIO_TX_FAULT),
        SFP_F_TX_DISABLE = BIT(GPIO_TX_DISABLE),
        SFP_F_RATE_SELECT = BIT(GPIO_RATE_SELECT),

        SFP_E_INSERT = 0,
        SFP_E_REMOVE,

This does not look general purpose to me at all?
It's just some hardware engineer that thougt "GPIO"
was a nice thing to call this.

> > Maybe it is not a good idea to look for generic code just because
> > it is convenient? I have had this problem before with GPIO, along
> > the lines "lemme just do this dirty thing this one time because it
> > is so convenient for me" (more or less) and the answer is still
> > "no".
> >
> > Can you either augment the driver to handle a regmap with bit indices
> > instead or write a new similar driver for that or refactor it some other
> > way?
> >
> > It is not a simple solution to your problem, but it might be the right
> > solution even if it means some more work.
>
> I understand your position, believe me, I spend some time looking at
> what would be the logical way for these switches.
> But I see no way how could the SFP driver be extended in a generic way
> that would allow supporting different register layouts when it comes to pins.

Why do you think you have to use the GPIO abstraction and bindings?
Just invent something that satisfy your needs, the bindings are just
strings. Why does the consumer have to use the GPIO binding?
They can just use phandle named anything. Some "sfp-foo-resource = <&...>
or so.

For example I created this:
Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
It's handling out a resource using a phandle. Nothing different than
GPIO, regulator, clock etc. Just invent something for SFP?

Yours,
Linus Walleij
