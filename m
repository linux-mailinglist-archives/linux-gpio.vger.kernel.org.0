Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5665AF058
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 18:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbiIFQZf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 12:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbiIFQZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 12:25:04 -0400
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7772586C2B;
        Tue,  6 Sep 2022 08:55:55 -0700 (PDT)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-127a3a39131so8419245fac.13;
        Tue, 06 Sep 2022 08:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2Fy4H2MBwjVVVrFLZsY4ti38bj+tXW/iTfIXfNTv+3g=;
        b=Yqo71z8zjeM/uNGobvsoVqCytaprahUWvxxNvryotOI1xlm6+4uh6tiqtnf/kiecPt
         ySfB67OYKXf6jT0q8hYTtn5dpXlovl0LqPH0DDuKizoNj7F5yusVz0iBRkujozeeaqFs
         kSVqUp1rS18q1odEpvo2oEEB4/AdFKh6Rw0w4G+aEEFndOEHwGlrbqQOl1uqt1zMZsJL
         hgsfdVZjh23WOGXlka5BeHgVAjmmkMtD6RYdR8lCpB7MGreofW2vByHNZHEKPBhjSNIl
         XfZa0i7VxZNF0HnK+2ggHoY5sIrkKRc4jO2VGMcCx2fhpkMyeYWTnPJ3rB8Qaw1T26L3
         ibtQ==
X-Gm-Message-State: ACgBeo3xTE+CvP8c8SywhnW9XDxAKQiyolu62MOl2KODZlL+pxmX5BKH
        qIYKwFP69sGIDCipeiiuyA==
X-Google-Smtp-Source: AA6agR6qziKVqiJIw7PdgqemkFs/WLC9+0abUzjCVXa8LjJdoJxpx0czecK1Nr0cIDU7nnpcz2j3+w==
X-Received: by 2002:a05:6870:6195:b0:127:3394:9c with SMTP id a21-20020a056870619500b001273394009cmr6323369oah.218.1662479754538;
        Tue, 06 Sep 2022 08:55:54 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b20-20020a05687061d400b001275f056133sm3074236oah.51.2022.09.06.08.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:55:54 -0700 (PDT)
Received: (nullmailer pid 594109 invoked by uid 1000);
        Tue, 06 Sep 2022 15:55:53 -0000
Date:   Tue, 6 Sep 2022 10:55:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Mark Kettenis <mark.kettenis@xs4all.nl>,
        Hector Martin <marcan@marcan.st>, linus.walleij@linaro.org,
        krzysztof.kozlowski@linaro.org, arnd@arndb.de, lee@kernel.org,
        alyssa@rosenzweig.io, asahi@lists.linux.dev, brgl@bgdev.pl,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        sven@svenpeter.dev, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add binding for Apple Mac System
 Management Controller
Message-ID: <20220906155553.GB534217-robh@kernel.org>
References: <YxcNLU+KGEolrdfT@shell.armlinux.org.uk>
 <d3cecee5edd24f67@bloch.sibelius.xs4all.nl>
 <CACRpkdaSRcczEF8QZ4aO+-HDVS+n-8MXvn6ysnjJfUEabwUJ=w@mail.gmail.com>
 <909bb4e7-5bd2-2903-5bba-87ae37f3448a@marcan.st>
 <CACRpkdajhjpMzjMooDduu0jxrp0uDNJ90VfBPpHx+P14cFfskA@mail.gmail.com>
 <5b75dc7e-5337-73eb-450f-b72f479793c4@marcan.st>
 <YxdOafCWnDUNourH@shell.armlinux.org.uk>
 <f5bef359-3abe-311c-3521-136eb5b54c4b@marcan.st>
 <d3ced0ffaec45e3c@bloch.sibelius.xs4all.nl>
 <YxdfOr6WCZiR3W1c@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxdfOr6WCZiR3W1c@shell.armlinux.org.uk>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 06, 2022 at 03:54:50PM +0100, Russell King (Oracle) wrote:
> On Tue, Sep 06, 2022 at 04:25:49PM +0200, Mark Kettenis wrote:
> > > Date: Tue, 6 Sep 2022 22:53:47 +0900
> > > From: Hector Martin <marcan@marcan.st>
> > > 
> > > I agree that this is something to think about (I was about to reply on
> > > the subject).
> > > 
> > > I can think of two ways: using `reg` for the key name, but that feels
> > > icky since it's ASCII and not *really* a register number/address, or
> > > something like this:
> > > 
> > > gpio@0 {
> > > 	apple,smc-key-base = "gP00";
> > > 	...
> > > }
> > > 
> > > gpio@1 {
> > > 	apple,smc-key-base = "gp00";
> > > 	...
> > > }
> > 
> > This would still require us to add a (one-cell) "reg" property and
> > would require adding the appropriate "#address-cells" and
> > "#size-cells" properties to the SMC node.
> 
> Yes, and at that point, as I suggested, it probably would be better
> to use:
> 
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 
> 	gpio@67503030 {
> 		reg = <0x67503030>;
> 	};
> 
> 	gpio@67703030 {
> 		reg = <0x67703030>;
> 	};
> 
> Then the "reg" has a meaning that is directly related to the SMC.

That's certainly odd, but if that's how it is addressed, then okay I 
suppose.

> 
> > > But this ties back to the device enumeration too, since right now the DT
> > > does not drive that (we'd have to add the subdevice to the mfd subdevice
> > > list somehow anyway, if we don't switch to compatibles).
> > > 
> > > I'd love to hear Rob's opinion on this one, and also whether the
> > > existing Linux and OpenBSD code would currently find gpio@0 {} instead
> > > of gpio {} for backwards compat.

Node names are generally not considered ABI except when they are. :)

Generally, core code doesn't care. Specific bindings with defined child 
nodes often do, but finding nodes by compatible is strongly preferred. 
Linux drivers can bind by node name (w/o unit-address), but that's 
really only ever done on ancient h/w.

> > 
> > The OpenBSD driver does a lookup by name and the "@0" is part of that
> > name.  So that would break backwards compat.
> 
> Oh, that's annoying - and is a different behaviour to Linux.
> 
> On Linux, we only look at the node name up to the @ when matching (see
> of_node_name_eq() in drivers/of/base.c, so it doesn't matter to Linux
> what follows the @ when you try to look up a node named "gpio" - you'll
> find gpio@anythingyoulike.
>
> > Maybe just name the slave GPIO controller "gpio-slave"?  If we add
> > compatibles, the compatibles for the nodes should propbably be
> > different such that we can switch to do a lookup by compatible?
> 
> I don't think the DT folk would be happy with "gpio-slave" because
> node names are supposed to be generic. Also, "slave" probably isn't
> a good choice of name in this modern era given past history.

Yeah, not a great choice for both reasons.
 
> Rather than the above, we could use "reg" to indicate which GPIO
> controller we're talking about, and lookup the reg value in a table
> to give the key. So gpio@0, reg=<0> => gP00, gpio@1, reg=<1> => gp00.
> gpio@2, reg=<2> => whatever next.

Keep in mind that for any level, there is only 1 address space. So if 
there's anything else with multiple instances, they share the same 
address space. IOW, you couldn't have say 'rtc@1'.

(Another example of why I want to see a full picture.)
> 
> That sounds like it won't break the existing OpenBSD.

No? Isn't OpenBSD looking for 'gpio' which wouldn't find 'gpio@0'?

Rob
