Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81AF269FFB
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jul 2019 02:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731589AbfGPAjr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 20:39:47 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:51171 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730383AbfGPAjr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jul 2019 20:39:47 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 0C6E5218C1;
        Mon, 15 Jul 2019 20:39:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Mon, 15 Jul 2019 20:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=h4lyw1ckqr2NsnVmVrOHlFNltSVlShU
        XUZlbmu/yAvo=; b=nA/XJjh7eKpE9zZB3wjvRz0KgEovPjrsdFfyE8Lsv/MnNru
        q+KzxQwRBZ5ZkU26CP0Myhs18TtKNe0qsTMjs0w+fFtGHhSVFyQfVMfJ5IxymITg
        HZPNZzLszXPNz5pm7Pt/+Y1dhXaieTjK5OKCAla90rENCc708cMOV9ckgCKhBJjk
        TVUuBaaKwJ4V/nYzVMJlLA9I6ZLEFly0rAqKESdkS0NI5Ao3K5uRlb9L4w2DPIVi
        FGj81uEyt8UxzBvTAoAfUlzE9qWdLTnCCBB7tCTB1MCxLel+ChXecLzDCGsEsHAU
        Ng8B0YxvZ3nuauqpHSldJh8SM6Cq+Y41bo5CW9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=h4lyw1
        ckqr2NsnVmVrOHlFNltSVlShUXUZlbmu/yAvo=; b=c77O8R8J9MQVcy0S97WVVs
        cgYZ6mLuXzQfT0klylrIK8UEwIyIxGVo9XPuKW6HUWAE/eH0ebCNAJ0fThKo7uYX
        x2h/TJvnb1aRlysGF2NgH9MSRys3eZdgcf+JqLlP1bch2bYoQ9BsUzwox7Sqw05z
        rvgcKZYB4mIKJQQMvub6Bcdh8jBxx1J9A+I91ya0czQbzwanEq+gwsbUO99TXNZA
        lJsUQkBdkCXvciWbvrfySwpe5JAVXLuZ3s4eEom4iUdMcf1oq2oP3kVeTtSxwOxP
        4Rs4lSwDpTHqOc25rV8MyMsJYOZPe9j1DN7D0HdFUYyLlwTdiBY47i+SsO+jAJBw
        ==
X-ME-Sender: <xms:0RwtXYIrXtUpuNL8gxuU2eQdef0Mm3SGqxaIjaaGSm19xB3BAQLr0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrheelgdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedu
X-ME-Proxy: <xmx:0RwtXReEZT2H-RGf34PvnZWEpkO5AucxK_eFS_-sqA2P3UFMYQi0xQ>
    <xmx:0RwtXQtR61mbvJi2E0-W-KNhvCTYxokNbvsDjmHBx7Pq8oQki10-7w>
    <xmx:0RwtXfHCNDgw_Ovr5mkyttfXbRcJLA4vnT6euo92rkl5wVKmONjq0Q>
    <xmx:0hwtXcY0BkKpboEJGhZqV-EwKHgZEENyb4Xr4phADP5nZTsdlwQtJg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3A815E00CC; Mon, 15 Jul 2019 20:39:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <ec16c833-371d-4dce-828d-dd99dccc43ee@www.fastmail.com>
In-Reply-To: <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
References: <20190715223725.12924-1-robh@kernel.org>
 <CACPK8Xdz98CQzgE2KCjz8eOhPtx=H8jTe1hVT7LvP77U_gGASQ@mail.gmail.com>
Date:   Tue, 16 Jul 2019 10:09:55 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>, "Rob Herring" <robh@kernel.org>
Cc:     devicetree <devicetree@vger.kernel.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_dt-bindings:_pinctrl:_aspeed:_Fix_'compatible'_sch?=
 =?UTF-8?Q?ema_errors?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 16 Jul 2019, at 08:47, Joel Stanley wrote:
> On Mon, 15 Jul 2019 at 22:37, Rob Herring <robh@kernel.org> wrote:
> >
> > The Aspeed pinctl schema have errors in the 'compatible' schema:
> >
> > Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml: \
> > properties:compatible:enum: ['aspeed', 'ast2400-pinctrl', 'aspeed', 'g4-pinctrl'] has non-unique elements
> > Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml: \
> > properties:compatible:enum: ['aspeed', 'ast2500-pinctrl', 'aspeed', 'g5-pinctrl'] has non-unique elements
> >
> > Flow style sequences have to be quoted if the vales contain ','. Fix
> > this by using the more common one line per entry formatting.
> 
> >
> >  properties:
> >    compatible:
> > -    enum: [ aspeed,ast2400-pinctrl, aspeed,g4-pinctrl ]
> > +    enum:
> > +      - aspeed,ast2400-pinctrl
> > +      - aspeed,g4-pinctrl
> 
> Thanks for the fix. However, we've standardised on the first form for
> all of our device trees, so we can drop the second compatible string
> from the bindings.
> 
> I think Andrew already has a patch cooking to do this.

Yes, I have a series in the works. Will send patches soon.

Andrew
