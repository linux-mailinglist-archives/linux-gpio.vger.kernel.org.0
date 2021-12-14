Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8DB474C5F
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Dec 2021 20:59:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237547AbhLNT7S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Dec 2021 14:59:18 -0500
Received: from mail-oo1-f44.google.com ([209.85.161.44]:39896 "EHLO
        mail-oo1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbhLNT7R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Dec 2021 14:59:17 -0500
Received: by mail-oo1-f44.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso5229497ooa.6;
        Tue, 14 Dec 2021 11:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=VVTV0jMBRXeKBNUdDTq/PhLrjt7B2KXoSyoDyz5SpTI=;
        b=GRd5icl5FeXlr6k1m1d7KqAftAWzAedocM3/G5Ryk/a9y+CsywSGFSIJkJ4DR+rVOy
         apAaOHqwcO/EWsJlhGmDCsp5ohCsVLA1ZKVtkOm9OFnSq3LlAuL5tbkH/cTtYjdgcOlr
         Z4uN0WOoqGzNt/38CAH0775kL/a669DVgU0uurEEfs4A8mG+hcEvq+5DsVukhjyzdaBT
         p+5Kq0xvmBRsdwTE2m340Hwm2p7C7773sG5cxdsPGVMEqY3upCkLN65hx2S+EgDObVcK
         7LuVWAXNZXnVt982qJ3RKMXNRCJlU0eXIs7QH6BiUBtpxAT+DrmrrM1oojZetGNyarVm
         nzGg==
X-Gm-Message-State: AOAM532HxkgHYzEDumX7KbhNedubHnWvdfZT6Gqdy7Duc5ke5ymuwF78
        9tOZPap3APNYKz8tRNrM7g==
X-Google-Smtp-Source: ABdhPJxCl+0ltbkCyzvWMYj/rkKJG8KkWCWFH/ftnv7hq+wWz3bKrvkVgtqGaSMx0Z1LIfZeW5TaOg==
X-Received: by 2002:a4a:ea84:: with SMTP id r4mr4816086ooh.13.1639511957126;
        Tue, 14 Dec 2021 11:59:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r22sm168192oij.36.2021.12.14.11.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 11:59:16 -0800 (PST)
Received: (nullmailer pid 3812039 invoked by uid 1000);
        Tue, 14 Dec 2021 19:59:15 -0000
Date:   Tue, 14 Dec 2021 13:59:15 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH V3 1/2] dt-bindings: pinctrl: support specifying pins,
 groups & functions
Message-ID: <Ybj3k4BOcc3IKs0w@robh.at.kernel.org>
References: <20211210114222.26581-1-zajec5@gmail.com>
 <20211210114222.26581-2-zajec5@gmail.com>
 <CACRpkdbsb63EN5hmGws1eLaARg2VRXXhz+5AM_x7OhaS_ceGow@mail.gmail.com>
 <cadb38fd-a193-2706-b20e-2a1e5e64f9ca@milecki.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cadb38fd-a193-2706-b20e-2a1e5e64f9ca@milecki.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Dec 11, 2021 at 12:16:25PM +0100, Rafał Miłecki wrote:
> Rob: please kindly comment on this idea of storing pins/groups/functions
> in DT.

I was never a fan of stuffing pin mux/ctrl into DT for what's mostly a 
one time stuffing of register values. And given how many things run 
before getting to the kernel, doing proper pin configuration in the 
kernel is much too late (or redundant because it was actually already 
done).

> 
> For a sample Linux implementation you can check (incomplete):
> [PATCH V2 4/6] pinctrl: support reading pins, groups & functions from DT
> https://patchwork.ozlabs.org/project/linux-gpio/patch/20211124230439.17531-5-zajec5@gmail.com/
> 
> For a real life DT usage you can check:
> [PATCH V2 6/6] ARM: dts: BCM5301X: add pinctrl pins, groups & functions
> https://patchwork.ozlabs.org/project/linux-gpio/patch/20211124230439.17531-7-zajec5@gmail.com/

What about h/w with no concept of 'groups'?


> Also see below inline comments.
> 
> 
> On 11.12.2021 00:26, Linus Walleij wrote:
> > On Fri, Dec 10, 2021 at 12:42 PM Rafał Miłecki <zajec5@gmail.com> wrote:
> > 
> > > This binding change is meant to introduce a generic way of describing
> > > pinctrl blocks details. Every pinmux block is expected to have:
> > > 1. Named pins
> > > 2. Named groups containing one or more pins
> > > 3. Named functions referencing one or more groups
> > > 
> > > It doesn't describe how hw should be programmed. That remains binding
> > > and driver specific.
> > 
> > So what this does is to take a large chunk of data that we known to be
> > associated with the compatible string (names of pins, groups and functions,
> > etc) and put it into the device tree instead of the alternative, which is
> > what most drivers do, and that is to compile in the data into the
> > operating system and just look it up by using a compatible
> > string.
> 
> Correct. It changes the place of storing platform specific data.
> 
> 
> > The DT maintainers have already indicated that this is not desirable
> > and I don't see it getting merged before it has a Reviewed-by
> > tag from one of the DT binding maintainers.
> 
> Tony pointed out that it was back in 2011. It's worth reconsidering.
> https://patchwork.ozlabs.org/comment/2786915/
> 
> Rob said it depends on whether "data be static (complete) and correct"
> https://patchwork.ozlabs.org/comment/2786688/

I haven't seen an answer for that question...

That and working for multiple platforms (from different vendors) are the 
main things that matter to me. 

> I find it absolutely required to get Rob's Reviewed-by before we merge
> it. I hope we can get Rob's opinion on this.
> 
> 
> > I think we need to know what the USP (unique selling point) is?
> > 
> > Would it be something like not having to duplicate work across some
> > boot loaders and operating systems? (Well they all need to parse this
> > type of description but that can be put into a library.)
> > 
> > Or something else?
> 
> There are two reasons for me to work on this binding:
> 
> 
> 1. I think it's cleaner to keep pinctrl details in DT
> 
> DT seems more natural (than C code) for:
> a) Translating info from datasheets
> b) Storing pin/group/function custom values
> c) Defining relations (phandles)
> d) Handling chip differences (adding new pins in newer revisions)
> 
> Last time I learnt that pins don't always/usually have numbers (in
> datasheets) but are rather named. Still in the "pinctrl_pin_desc" we
> have "unsigned number" just to enumerate them and reference in groups.
> 
> Adding or removing pins/groups/functions in DT is as simple as
> adding/deleting nodes. That also means less logic in C code.
> 
> 
> 2. It avoids data duplication
> 
> It allows me to keep pins/groups/functions data in one place (DT) and
> use it in both: Linux and U-Boot. No duplication & easier maintenance.
> 
