Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EE629859C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 03:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1421497AbgJZCpp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 25 Oct 2020 22:45:45 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36111 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1421490AbgJZCpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 25 Oct 2020 22:45:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5E01958033E;
        Sun, 25 Oct 2020 22:45:43 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Sun, 25 Oct 2020 22:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=spYZpkcjWH5b4RxjGtzyps7vpiTVhVY
        z5Hwu/hHZRTo=; b=gfg+YwTivQV/OI9oMXgq5jfxPFyMv0xFCJd1rsoh99T0jYM
        3kn6QirjM/mCeOxNYrNnQ8tVTrgZ+RE8/WYLW2J1DuGj9zxzvI0XUfm+HFXWINIm
        vam+sxI0p4jl6N7+YH0zLSOLwxUhBLQpVDVZyFFTKajLpYXQ/VePeXtkAP1xe7Pr
        pEFpFV4JSkBWMMKxulRfjfTUbqwvFRylmC8CbuItiZk72x8+nXq1Nfit2b+bGy3p
        tBMVVP93eHT5kcz+vKr8HVSQXi+ydnwpz+DCF6Yce/LveTfzliNePrXZ5KcpkvDf
        6rIho20nwEFvNCDFs64CNbbc2NuETvaX85A5+nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=spYZpk
        cjWH5b4RxjGtzyps7vpiTVhVYz5Hwu/hHZRTo=; b=mTkhON/gyiug/jhbbtcRDN
        yGqRrR13psbnn3bjiu7JaZ+hUwIJJEPsc9u1P1CZKBtpj8Z77ULha8VN2ZDZxTNS
        0ZW4Msl49qZVWsHWdNEB3IYpxC5iwBMQDIx/wHQvOizxgVGw1N0MnTbHJ8E/SSbq
        MCiOYzvVayrnuNdptS4OiuWvj/olpB2KP2IGHDL4mVUZ58ScxUApGDS0JEy9+Z6W
        5oV/xlxV4hNAeIaRLsz/U7lbKovDfYSg4KIoHZ/QK1a2JBf9W8XWt/XlsPUV9aNt
        fxBx498TKRTRIof0ijNGuDXYh+WdLpZPkSaDMgcgLrslbic7Zhk9XdhuA6ItYoPA
        ==
X-ME-Sender: <xms:VjiWX5a8m2rBD_vqpSlROQucNSrhusXkxds6sRhEGzCrbH8XSw8L2A>
    <xme:VjiWXwYs_IVIvYVZDfl2nw1PeFUR9UFozYNTCb4tBAsOkCI8JVHV4L5ujctBA1yRm
    aupKkhRz55NA-hHvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:VjiWX7961FxvQJlX_tNZkwQEr1ch3TvecVwYt3OvoTe4sraAanqkkg>
    <xmx:VjiWX3pJt3v72JjhULwbOXmGuMSgi6wgxr0QRWHgsnAHO6oqJfzHgA>
    <xmx:VjiWX0qpyR3S3mZrwDTMKyCoe17DK5mjJhrCvB71fpAbLsb1kewwVQ>
    <xmx:VziWX_DOwBa7GxZTrnwEF57ej63gu9YNsfqTNIx9CNIgyGwDIgLPZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 4A63BE0508; Sun, 25 Oct 2020 22:45:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <33fc9ee2-c588-4c1b-ab74-4f023469e3f0@www.fastmail.com>
In-Reply-To: <HK0PR06MB377943740366AB328247C452911F0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
 <HK0PR06MB377943740366AB328247C452911F0@HK0PR06MB3779.apcprd06.prod.outlook.com>
Date:   Mon, 26 Oct 2020 13:15:21 +1030
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        "Lee Jones" <lee.jones@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Joel Stanley" <joel@jms.id.au>, "Corey Minyard" <minyard@acm.org>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Haiyue Wang" <haiyue.wang@linux.intel.com>,
        "Cyril Bur" <cyrilbur@gmail.com>,
        "Robert Lippert" <rlippert@google.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc:     BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 0/5] Remove LPC register partitioning
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Tue, 20 Oct 2020, at 16:33, ChiaWei Wang wrote:
> Hi All,
> 
> Do you have any comment on the v2 changes?
> Thanks.
> 

Hmm, seems I'm missing patches 3/5 and 4/5 from my inbox. Weird.

Anyway, sorry for the delay, I'm looking at them now.

Andrew
