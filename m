Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F439AD1AC
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Sep 2019 03:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732536AbfIIBx3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 8 Sep 2019 21:53:29 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37587 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732468AbfIIBx3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Sep 2019 21:53:29 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 10CBF666;
        Sun,  8 Sep 2019 21:53:28 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Sun, 08 Sep 2019 21:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=heMFjdjLm+JvFR3BTNKLlq77Ee6tOAO
        N0xWmiX14zOI=; b=YmI8WuX1c6avsekUIqvUMCvoL5nWhFoFIH5/qo6lETy4oD6
        QJpJ+hZaKzUjzYutk7BvrTcJrJAiz93NZJ/fVza9Po0xCYaBw4Zf3GA1dPE2DdH6
        /gLiU9I8M+/+QUjWk1dRId5eI0qvyTgg528yon0CYwj+/Hxj82NMI6d47KWydh9g
        GmloJFgP1dXiKXi0MH3N0NUBojzpk+CKg3jUABf7KikhUMIq+RXmqSoWv2uwtW4P
        xbE+Ho0JMt1gbWthpGd5o0DvOMpqa3pZddM8a05IXvcljURRd3nkbZI68bEENRT/
        WmUay8+80ZZh5evknhzJV+X027qKRNZ4NM1X93Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=heMFjd
        jLm+JvFR3BTNKLlq77Ee6tOAON0xWmiX14zOI=; b=gSGn1BhJpBwVTeKbLSPJA1
        nxu2WvzJEwAB8CyiOc6NZ229kLL8jDpaxwZgQZ1ouxjdS9aho3AONtviggLXosSJ
        ipunIvNZWwYyQe+Jg37Z9jVK5ct9kT9NhaJnHMm1956cX5w2bjm4PWnd3w1C6eTK
        TVYGEUxIt2vSSDYAY08xtcJgMZ49qY1GX7ksbvjLRZVHfDHHomrllhDMMPIOqKUi
        JiVHQU3hKHZV+7s1M/CWmOxw4m3HPzetsIDxgwc3Vh3VStHvrX+oD5OtALPwHjBL
        xSWVM5aKfqvq96DN6BAx0t8IUjlg2WOQrh/5qpDNDeETBVT6N7m/bWlYQA7Ivb7g
        ==
X-ME-Sender: <xms:lrB1XScWpoS1AmB5PU0MLKUKeiGdl6CYlDuLyctnMRi9XZstGYI6eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudekhedghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
    grihhnpeifihhnughofidrqddqqdhpihhnghenucfrrghrrghmpehmrghilhhfrhhomhep
    rghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:lrB1XQdut5HhPiTBXjQBDcD9DwwNfNIczAWlXMW_KvqFBtXjmcs_Bg>
    <xmx:lrB1XegPExrUQOkXqQV9GHlrPEzlgxNS2Omg0jHhJZvmMiFNtxUtug>
    <xmx:lrB1XUQ_RyOIpSfLtN_-cNbLBFPNM5u3GafpvVUsTFXrmMKqhUSCdw>
    <xmx:l7B1XSvhSHVcRDCU41Ecxe_h3Db164lAofWbrkTrQC_qRQYnbPmK1w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 87B75E00A3; Sun,  8 Sep 2019 21:53:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-188-g385deb1-fmstable-20190905v2
Mime-Version: 1.0
Message-Id: <5f66333d-1621-4e36-b138-52453f61cc68@www.fastmail.com>
In-Reply-To: <20190829071738.2523-1-andrew@aj.id.au>
References: <20190829071738.2523-1-andrew@aj.id.au>
Date:   Mon, 09 Sep 2019 11:23:57 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     linux-gpio@vger.kernel.org,
        "Linus Walleij" <linus.walleij@linaro.org>
Cc:     "Joel Stanley" <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, "John Wang" <wangzqbj@inspur.com>
Subject: =?UTF-8?Q?Re:_[PATCH_pinctrl/fixes]_pinctrl:_aspeed:_Fix_spurious_mux_fa?=
 =?UTF-8?Q?ilures_on_the_AST2500?=
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org



On Thu, 29 Aug 2019, at 16:47, Andrew Jeffery wrote:
> Commit 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> was determined to be a partial fix to the problem of acquiring the LPC
> Host Controller and GFX regmaps: The AST2500 pin controller may need to
> fetch syscon regmaps during expression evaluation as well as when
> setting mux state. For example, this case is hit by attempting to export
> pins exposing the LPC Host Controller as GPIOs.
> 
> An optional eval() hook is added to the Aspeed pinmux operation struct
> and called from aspeed_sig_expr_eval() if the pointer is set by the
> SoC-specific driver. This enables the AST2500 to perform the custom
> action of acquiring its regmap dependencies as required.
> 
> John Wang tested the fix on an Inspur FP5280G2 machine (AST2500-based)
> where the issue was found, and I've booted the fix on Witherspoon
> (AST2500) and Palmetto (AST2400) machines, and poked at relevant pins
> under QEMU by forcing mux configurations via devmem before exporting
> GPIOs to exercise the driver.
> 
> Fixes: 7d29ed88acbb ("pinctrl: aspeed: Read and write bits in LPC and 
> GFX controllers")
> Fixes: 674fa8daa8c9 ("pinctrl: aspeed-g5: Delay acquisition of regmaps")
> Reported-by: John Wang <wangzqbj@inspur.com>
> Tested-by: John Wang <wangzqbj@inspur.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> ---
> Hi Linus,
> 
> The timing of merging the AST2600 (g6) driver and 674fa8daa8c9 ("pinctrl:
> aspeed-g5: Delay acquisition of regmaps") caused a bit of a rough spot a
> few weeks back. This fix doesn't cause any such disruption - I've
> developed it on top of pinctrl/fixes and back-merged the result into
> pinctrl/devel to test for build breakage (via CONFIG_COMPILE_TEST to
> enable all of the g4, g5 and g6 drivers). All three ASPEED pinctrl
> drivers built successfully, so it should be enough to simply take this
> patch through pinctrl/fixes and leave pinctrl/devel as is for the 5.4
> merge window.
> ---

Ping? Was hoping to get this merged before 5.3 is tagged.

Andrew
