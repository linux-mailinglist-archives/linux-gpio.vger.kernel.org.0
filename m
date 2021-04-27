Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0D036BCE6
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Apr 2021 03:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234598AbhD0BSN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 21:18:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35929 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233916AbhD0BSN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Apr 2021 21:18:13 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 23BC75C019F;
        Mon, 26 Apr 2021 21:17:30 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Mon, 26 Apr 2021 21:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=EqlXC5QCJVyxuYSkaKuNoI5/S7ZixI8
        WET/kD4zMQE4=; b=t67BWMxBZ017WFGgFfktYcx8B7O3DWtPM/56AW+b1bGd5pw
        DqWs6NObelbDErvGiu3zSwLhp6Qz4CNnQNSzTE0Y/Ds+IjCg6JQ2y0FhH3aC9Gng
        8gCXF+FSCoTblmZ5FTReBJTpxfys0bubU5u2Sp/nMXAz9xgh9Q/SrJC3V3g+p4Yv
        xTzr5UQa9OihhGz3EtYYKsYleYuNbF9BKWrRMtY6UsF+Cy+AbqAnG15InBg1J89a
        DkXsC2XrNCemgv+XKexDLVyyWLPygkYezyG263QbPalc0WwYufm6AAcAFPMX0auh
        NC9VcTSvrgP2H3BnSDr76b1egBJexusxLovXDMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EqlXC5
        QCJVyxuYSkaKuNoI5/S7ZixI8WET/kD4zMQE4=; b=jov++051zpecKsRF+8iRbE
        Uq2IQ9hZ7LKJ42RakyYDE2XxH8pivmDVPWZNZPkhEHkHdgA9uG//MDAeXPO3N0Yd
        5glFu6E6ftzt6Ks31ofV4H9/JfZBQTjv3/Lr7lYkHrIiI8IokocmH9CRzncFGM4P
        aDIlH0UR9JJBfKfLb90bZd99zU3CYQQm5W+tNERwS5ZjrUlQ2+nglU0M5lQ399Wa
        H2or/VqRkXYamzeNPSguiX9HOvhNH5cKBoErFNfBokFcyzmVOv7jgJYjElHTaspo
        vwezyUkU2BNereIwif52uXwrGkinbasmu4yfV1oRypsE240bqZaR+8YPuxzeweBg
        ==
X-ME-Sender: <xms:KWaHYGfeHH6dLgi9rDU1YggPko1zFQLTnLQRh4VnPFuAf6GksPSJ2A>
    <xme:KWaHYANYBUOvE9mOg4pm1beDhujfwO5e9QUU8SRuEnin9_zO1Ol1dyVX7iwJcR-L_
    UNAp63Zk6Ae93vn9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduledgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:KWaHYHiDfQrZvxWOqR0rfIkENTlzx5N91sTXn8rvlUVlfte79WHvWg>
    <xmx:KWaHYD82EsPVpynUiGR45s0UjrIJQjxP8bMXSLXo_Uu2EPb78LEshg>
    <xmx:KWaHYCt31Ushe1kXvbPdZ6Yj5UxR6jmMA_oAaPZeMXr2gxBvMptHBQ>
    <xmx:KmaHYGirKlGQujUPf47_1n5CNkjLlnmdNBvOv2EyfbYJrvvf1ar8bQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 57E85A00079; Mon, 26 Apr 2021 21:17:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <3cb5cc18-fc03-46d7-be3d-3d132b42c82b@www.fastmail.com>
In-Reply-To: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
References: <1619353584-8196-1-git-send-email-jrdr.linux@gmail.com>
Date:   Tue, 27 Apr 2021 10:47:09 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Souptick Joarder" <jrdr.linux@gmail.com>,
        "Linus Walleij" <linus.walleij@linaro.org>,
        "Joel Stanley" <joel@jms.id.au>
Cc:     linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        "Randy Dunlap" <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pinctrl: aspeed: Fix minor documentation error
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Sun, 25 Apr 2021, at 21:56, Souptick Joarder wrote:
> Kernel test robot throws below warning ->
> 
> drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c:2705: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c:2614: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinctrl-aspeed.c:111: warning: This comment
> starts with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> drivers/pinctrl/aspeed/pinmux-aspeed.c:24: warning: This comment starts
> with '/**', but isn't a kernel-doc comment. Refer
> Documentation/doc-guide/kernel-doc.rst
> 
> Fix minor documentation error.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>

Acked-by: Andrew Jeffery <andrew@aj.id.au>
