Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62654432B88
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Oct 2021 03:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhJSBnG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 21:43:06 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45602 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhJSBnF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 18 Oct 2021 21:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=FhlfOCbg3MmNuL+I1U1nD+p7uQpYMASB7+aM/nTmKR8=; b=J+7is9zKDDyOEXbyJ+X/0ITW45
        DH+IVYNQe9xvfhltXKoyK9DHdHz8j5EkoDrMweTyb7vnw7Vx6r8n7BvJAAd4guSZB1K6ECYwA1HAu
        pfLPJBfnqqa3jDYCS4TxgHC874nL/w0aTuiqx6izO2jeQ5LMEjRl0+ShRELNW6oiU2pI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1mce7U-00B1i5-Ve; Tue, 19 Oct 2021 03:40:48 +0200
Date:   Tue, 19 Oct 2021 03:40:48 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>,
        "Jonathan M. Polom" <jmp@epiphyte.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <YW4iIP7jpRj4qcNN@lunn.ch>
References: <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org>
 <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
 <20210719225906.GA2769608@robh.at.kernel.org>
 <CACRpkdbq6Jow6AT9OpsR7Q0JVCWVMcmamh9KHPXMtUnkoe7ZFw@mail.gmail.com>
 <CA+HBbNFEs-=5XTK7PUL+LsgBCcPfwHsCPe4v6byK0x=O_7TRPA@mail.gmail.com>
 <CACRpkdZfZLQMgpMAF2FwSVt1YAzhQJ9ZWkVUjVc2xpmWL7yEvQ@mail.gmail.com>
 <CA+HBbNHZyYnnyz9=4Hgav96ZH8-R-nYoi300j2x3fgei8aa4zQ@mail.gmail.com>
 <CACRpkdaBUrgnyFnO0Tdae56PKR4pLN1boLpK0FMCk7eYshZ5LA@mail.gmail.com>
 <CA+HBbNFeTN45cz8G75V94tF9cBcOGNzeenTMjdJ-4oKFCvHYLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNFeTN45cz8G75V94tF9cBcOGNzeenTMjdJ-4oKFCvHYLA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> The SFP driver requires GPIO-s, it only knows how to use GPIO-s, and
> its a generic driver,
> it covers any device that has an SFP port that is implemented per spec.
> So, I cannot just extend it to suit my devices needs and I don't see
> how can I extend it in
> a generic manner so that it controls the pins directly via a regmap
> for example, especially since
> each switch has a different number of SFP ports and thus pins and a
> different register layout.
> 
> I have added Andrew Lunn as he is one of the maintainers of PHYLIB
> under which the SFP driver
> is, he may have some input on how to proceed with this.
> 
> I honestly think that we have some kind of misunderstanding here and
> look forward to resolving it.

Hi Robert

Can you describe your hardware and regmap in a bit more detail. What
do these registers look like? How do they map to the SFP cage pins?

	  Andrew
