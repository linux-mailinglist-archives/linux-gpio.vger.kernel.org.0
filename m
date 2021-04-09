Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632FB359482
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 07:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233217AbhDIFYu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 01:24:50 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53447 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233253AbhDIFYr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 01:24:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id A0960580747;
        Fri,  9 Apr 2021 01:24:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Fri, 09 Apr 2021 01:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=Tsg8t/mJg/l7Xo3qIgT/COuJ+KimOhQ
        l4GFUqpSEKJU=; b=aSXk2orPauSq4IpUw+9+U8Q+/ZS2pBnkJOqeVdwgpSBrKH4
        rwavWdTu3RER4VS7ec2GKaKA3VBup6i5FRgceSmosDEpNhR3yKU3Q9k1Z77gwZMq
        fMuDesrezZk0YDWrY7h5n2h24EtV5hXgtSNcriyPmIW5FXNfXAXnKbuKx6E3EmFi
        j4y/y5m2pg4ITm7HkFDTZitQ0YJl3fwHl0fSsGao+U8lB2V3H/G/H9dZj+KD9ImQ
        sV8T6R9FdYPLjzxVsFhD6AFW5Dd6144sISzIv3e7Auyv4KKMTc35BcPjLpP8ZIKo
        9iwvRqIHFtjEXrFzmQjYRp7iSFMEc6i6bP25Dzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Tsg8t/
        mJg/l7Xo3qIgT/COuJ+KimOhQl4GFUqpSEKJU=; b=LLq6rlxZTo+gKhwAqZOsyR
        oCA7427BBoQgCiUa3Vhu8hbEm+n8C8IcPqTyFsBmg6dvtdlxGRSdn2l4YhGgpp2M
        TEbAin9Abtfcf+PSvvcJTVuneaDzSRcDb2tZDKuY9bfMWflUgo+yoOv122yelZKe
        YX6GCr7VdccJr2l1tBYQmTVqTHT0x3HDIIJl5r6p4RWqC+vmyZC45kuLYkQaLAf3
        02wf4KYGtPtH9eNskdObT2YEGBzjiOiVeU9aWoSH3NkDT4DGxflX7E3ZsB0HGSzV
        40qQpDIGnIQ6U+FZYs4zJEv/sjjAWo3NJbfmlJYhebddUB9/FVIXErgRhOzksX2Q
        ==
X-ME-Sender: <xms:DeVvYCwFb7EEdjbVyV8_qSuW2T-zLc_alCF2XdjjD1aVQ6-7v-G-bw>
    <xme:DeVvYOTXcH-ajixVXiFwdSUnsvGkX7Z0IICsypUksj9EN2wT8niG2Guai-fx11Bab
    rQsAD4Tm5NN-kpsCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:DeVvYEUck1pddY3R2NbSi-oYdazQXk0ZImdpcmIscJsJP402DUNc3w>
    <xmx:DeVvYIhziOZvZecLSXydXe2nG7op-y_qEsHyO4oFUhPDHEjqHH0Syw>
    <xmx:DeVvYEAliW1uFjF-Tk207fuTPbYMqRv_vfB04OVmG8dcEPq_4HcldA>
    <xmx:D-VvYE1AxOQX27pz2YOcLMaHbrSy6fojo_ag6CmEfA9FsEwyl_7Xtg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7ADBDA0007C; Fri,  9 Apr 2021 01:24:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <a181f404-ea59-4956-abe3-60d0bee917d2@www.fastmail.com>
In-Reply-To: <CACPK8Xdw3+2Rt=tQ-ciusyK=W6BaP_DR4FSFp0qDuPq5z8MPBQ@mail.gmail.com>
References: <20210319062752.145730-1-andrew@aj.id.au>
 <CACPK8Xdw3+2Rt=tQ-ciusyK=W6BaP_DR4FSFp0qDuPq5z8MPBQ@mail.gmail.com>
Date:   Fri, 09 Apr 2021 14:54:08 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Joel Stanley" <joel@jms.id.au>
Cc:     openipmi-developer@lists.sourceforge.net,
        "OpenBMC Maillist" <openbmc@lists.ozlabs.org>,
        "Corey Minyard" <minyard@acm.org>,
        "Ryan Chen" <ryan_chen@aspeedtech.com>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        "Tomer Maimon" <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Avi Fishman" <avifishman70@gmail.com>,
        "Patrick Venture" <venture@google.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Tali Perry" <tali.perry1@gmail.com>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "Benjamin Fair" <benjaminfair@google.com>,
        "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH v2 01/21] dt-bindings: aspeed-lpc: Remove LPC partitioning
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Fri, 9 Apr 2021, at 12:48, Joel Stanley wrote:
> On Fri, 19 Mar 2021 at 06:28, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > From: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
> >
> > The LPC controller has no concept of the BMC and the Host partitions.
> > This patch fixes the documentation by removing the description on LPC
> > partitions. The register offsets illustrated in the DTS node examples
> > are also fixed to adapt to the LPC DTS change.
> 
> Is this accurate:
> 
>  The node examples change their reg address to be an offset from the
> LPC HC to be an offset from the base of the LPC region.

Everything becomes based from the start of the LPC region, yes.

Andrew
