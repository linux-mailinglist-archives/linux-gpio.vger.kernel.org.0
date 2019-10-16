Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82DDFDA21D
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 01:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406101AbfJPXZv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 19:25:51 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:59849 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726595AbfJPXZv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Oct 2019 19:25:51 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id E4BBF71D9;
        Wed, 16 Oct 2019 19:25:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:25:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=PyvonOcPHFz8rKcmNUUFHGzSVRwDPRH
        8KZMA87K8oiQ=; b=fKdKzNRokgPjUVrX9f1xJPPL5FlrS4plG8on1QguhO/iuAm
        Lo5Bj90672xyJdYbVyUa3VgU+Y+2HxL9CkP0vDPDXqrFPk+HkdlPyJ4zBZOv6xbR
        AC06UzWdsdc6mXOjcwLUnmdpUOsjkr4FOvdCxovZ3hqBTA0w1TGdN2G30G0VO3RL
        y+DaHnPWZIefPFmx6XBoejbEezNpp+qPUdeq4tbizZE0+K4cemSW7YXaAZ1uQ9J6
        8Va/knlMgkD3GnObd56nZ5XAmwW1JTMe+VDA8wFrthzeujiwezQhlsCJ5LH0EZHV
        ajOg3EZJo/sEcpxTujDRiODK+6fjOKw7+beFf4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PyvonO
        cPHFz8rKcmNUUFHGzSVRwDPRH8KZMA87K8oiQ=; b=omb7k96+2VHVf6VjCeeafg
        0siHqz/O6s1Oy7hU2nmQ2wlCw8vd3jsuThXLkkCGtgONeG8jLeNFNxXPzZe7+OKn
        T/7e/jEO//cUsQpRyq8dul+GAUJ3agO093ZnPtkKuf73btmkch0y6Efs/TIK6gtP
        kVQZpB24Tnqbs+4tnsWgzLDWBwGCUPly78dIr64T4MDegNqzj2pE8BaAug0Fm8OK
        bv6VUc/RuGRqXlPU+DPQzz2eLqBkn0NHbCZFSNi670PzweDU9nYRrT+Od8LsXGTL
        dx07/zq5jEtosWNBfLbr8XI27LOg+bN/6TW0mlO2mGuCSkWtAjN9cFveoc2MyShw
        ==
X-ME-Sender: <xms:_aanXUngCArMrXAA7-s9c4Qrm5auYWXdza9M0WOYns1PrME8q-OgOQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
    hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
    ufhiiigvpedt
X-ME-Proxy: <xmx:_aanXSOwracCb3LzQKBJVZOovmxxNA0-0f4Zw9_sMVL51RQo6XuC5g>
    <xmx:_aanXat8h366CpTcUuN8cE1t1VuiwpVN_HSoPB3fEVwg1In-bqXS2w>
    <xmx:_aanXVw3N8k8rS7lIIEsu9nO1S99HVu_3B09uTkoA1XFM6F3kpdcWQ>
    <xmx:_aanXTz6edeXMD7h5uZtGS_XNOlxgfyiI49h0Dnq5VCKKbB13GyWCg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E351AE00BE; Wed, 16 Oct 2019 19:25:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <5fc76c3b-4727-4c4b-88a1-59c9618ccb30@www.fastmail.com>
In-Reply-To: <CACRpkdbmbyNmW8tL_L0agBajomPybXsjn9ix_F5-B3fZnfuW9A@mail.gmail.com>
References: <20191008044153.12734-1-andrew@aj.id.au>
 <CACRpkda5cWaA7R3XzyiERCCgwUrjnXd+wCBeKvt-wtjex7wNDg@mail.gmail.com>
 <2de90789-c374-4821-89f9-5d5f01e7d2d6@www.fastmail.com>
 <CACRpkdbmbyNmW8tL_L0agBajomPybXsjn9ix_F5-B3fZnfuW9A@mail.gmail.com>
Date:   Thu, 17 Oct 2019 09:56:45 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        "Joel Stanley" <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Johnny Huang" <johnny_huang@aspeedtech.com>,
        "Ryan Chen" <ryanchen.aspeed@gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: Fixes for AST2600 support
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 17 Oct 2019, at 00:30, Linus Walleij wrote:
> On Wed, Oct 16, 2019 at 1:42 PM Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > I was hoping to get them into the 5.4 fixes branch: I consider them all fixes
> 
> OK I moved them all to fixes.

Thanks.

> 
> > > I need a shortlist of anything that should go into v5.4 if anything.
> >
> > IMO all of them should go into 5.4, as above.
> 
> OK
> 
> >  It's there something I can do in the future to communicate this better?
> 
> Nah it is a complicated process, things need to be done manually
> at times, overly obsessing with process is counterproductive.

No worries, happy to carry on as is.

Andrew
