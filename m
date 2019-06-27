Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E987578DB
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2019 03:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfF0BIs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 Jun 2019 21:08:48 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:51011 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbfF0BIs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 26 Jun 2019 21:08:48 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id C99512212;
        Wed, 26 Jun 2019 21:08:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 26 Jun 2019 21:08:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=ZiI3xxfYKmvDILJvqB7fVk8L/I2NP9d
        zhcO3iE+B9zo=; b=BrQd3vXrWK9cQIP8itJI4yLnYhOACmlwPP91fUYKHYbtLHN
        0ogcNMGV9W8splCz6t+XZdCMVtGizKYBnKF6spbmNMI1eNJ6r+zmg0k/+6d1W4q7
        +k6I7itFCu1bItE/yvKsMYtBMQbyf7ltQhuQNYElu9gTFj+zsRAICpm4ZS3tjhSO
        8KyHLX8mudpz7eKttQhCLCyBwkrhEGeoJnAWoKEEPhEBLvIUpP4H96wTd8IEJ2ZZ
        LX5xaOVrj7Rhsd0+tt7yoGhVBceeevSXkUP0PmG4wUmk0duMN1c4jl9K34kW1Pta
        3zBsro14GpbO11VWv70wehz/6gPZQ0EQNjl1Piw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ZiI3xx
        fYKmvDILJvqB7fVk8L/I2NP9dzhcO3iE+B9zo=; b=x28MdS6aAMJjnWtjtB7WWg
        2siByivl2x8w5XEtXmNUvuYl+f7lY2HcDQ86cOF1asYgl4kcNcg1cZt4i7zxB5jt
        QLsmQfxgwN/OVfIho5k3aZXV16b3jTI9CGMsq+mLV2Mw+Cru7l+nAhf6g6scykvS
        CyOmU//+0e1r94HNCD1RhlilF5TDfmJxqfxE6RufpkkVCZOakaa4O1t0F9bog91/
        dsylEeldN0KuO6YCmLCDGMdG5MVJSV7fIU6bJdjmwrepQbWMvRtZOsjWqPt5BYIe
        Tr2y1WFdqUMW48LKh7xQOcYHCDELGsFjj0dIFABn9Z9DM3Z8p7qh4W+IeQt01QsA
        ==
X-ME-Sender: <xms:HBcUXX9FfhoRdrZDn36epoq77XF1EsuU37NtY6YFC6mM-c415dWkyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:HBcUXUa9j9KOY8Ak6gZmtFfiRtd6UUY3gCF_-AYMovCK0o5If44DJQ>
    <xmx:HBcUXQHivyoiGtCZ9rm7PPsGCC4-WmZYREdnJi8mTclO6S1TV9k9Yw>
    <xmx:HBcUXTfyfDK7LxhQ-rnDeLeXIxlh1SBIgW46klopWxzc6IF3JiH6uQ>
    <xmx:HhcUXdmMuLkZk_6WEw1ZXYe924zdtpZ1RXGCq9Fe19peV19V36hFLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CAAE4E00A2; Wed, 26 Jun 2019 21:08:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <fa54f9a1-481e-4146-a4c2-7c43cf9a26e8@www.fastmail.com>
In-Reply-To: <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
References: <20190626071430.28556-1-andrew@aj.id.au>
 <CACRpkdboxjMmeb8feffyG5JJ7fGPR6hqC8sc+XV5We3TC__LXg@mail.gmail.com>
Date:   Thu, 27 Jun 2019 10:38:44 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/8] pinctrl: aspeed: Preparation for AST2600
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Wed, 26 Jun 2019, at 17:25, Linus Walleij wrote:
> On Wed, Jun 26, 2019 at 9:15 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > The ASPEED AST2600 is in the pipeline, and we have enough information to start
> > preparing to upstream support for it. This series lays some ground work;
> > splitting the bindings and dicing the implementation up a little further to
> > facilitate differences between the 2600 and previous SoC generations.
> 
> All looks good to me, but Rob should have a glance at the DT bindings
> and YAML syntax before I proceed to apply them.

Thanks for the quick review. Rob's responded, looks like I'll need to send a v2 at
least. Might need a hand sorting out describing generic pinctrl dt bits (subnodes
with function and group properties).

Cheers,

Andrew
