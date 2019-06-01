Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAEF32004
	for <lists+linux-gpio@lfdr.de>; Sat,  1 Jun 2019 18:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbfFAQgI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 1 Jun 2019 12:36:08 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:46135 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbfFAQgI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 1 Jun 2019 12:36:08 -0400
X-Greylist: delayed 375 seconds by postgrey-1.27 at vger.kernel.org; Sat, 01 Jun 2019 12:36:07 EDT
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id C63301D34;
        Sat,  1 Jun 2019 12:29:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 01 Jun 2019 12:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=G6joXSFpHr+xnj1AE0zs7wKpYB9
        XnoEfEGHkoMcid1w=; b=nRY6su9IGsDoiTe9tsxFg667lnKPfE7bbeIx592as2E
        em7dgml8pmc/pwKeUgSSxDHV4YRUE5iHljoVEX7GwRqUVrGqRVJkDxsFfQA30YNx
        KAg+vCy3UqtEA8q+fvNg10SCASxR1++3b7VtYzJYC+N1OpR7dwMlIFWnvd3amsNv
        Svcl/IGHc7g6aMVf2kFMIXlX7fD9mqL1hUcPRxNY4cX2VDdrexj6V4sFosvqQqLB
        4QzWd5PIE2iO4hyQ8H5YfT8CtVcl1yoG2xcYid/UFIJHsE1B7gaFquYpVfosEu13
        VwfxIFeXKA3/ohtuXL7ry3m+5gE3ZXXpLXrUVd048rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=G6joXS
        FpHr+xnj1AE0zs7wKpYB9XnoEfEGHkoMcid1w=; b=LjTxODYr47rpGdziuqBMg7
        yzbx/pWEF8iqPYcSzsQUplRekJ5IrYNM+xmL983a3mf1SWpfxq3F7DR0iT7mPgeU
        STzQullm7rLdvtyZIdH+WJpqeOD1ad59UZqYzemwryvZYYdMk6CZwJScn4TborJp
        w6/yKs/RQw04Ww1niMzCezTy4/CfQDFX6NW9a9nDjT34AoDPEMxKO4MQXCnAIWvZ
        HRj6oHNnNzqVEvFuEVXb2M7l+VA8FOfffWcG2Ehe07LmrALUZbx2SQtKNDkyGsoU
        lhowFvWgeklx+BHL5sQIdBAKZwINajJLVc6FlkH/Mh8O/5JavUzd90IErunoJcYg
        ==
X-ME-Sender: <xms:_KfyXKCkChUD_dQe1UjZ39ztuPNZx9Mh3Q9HiHrIHQzqyL5Ydgpyyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeffedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrd
    dutdejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhen
    ucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:_KfyXAKecZrq_nTMfU6kDLNs03MzA4OO4ALIlZVWyuGakKuhVf5kBg>
    <xmx:_KfyXPup1dsrtKWSgylv0Ee6FekAGQ1T4Z2Xd_hJll_YFTxvMa7hKQ>
    <xmx:_KfyXHIylZ0NZn-20E8FiO40B12uzL1ENnef06W7Z-EnIcHIVC4M0A>
    <xmx:_6fyXFdKdLkEhd6BO8Vrb93mqDin6qbJozGTQ0UtET7KSfRiWhncJA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id E14418005C;
        Sat,  1 Jun 2019 12:29:47 -0400 (EDT)
Date:   Sat, 1 Jun 2019 18:29:45 +0200
From:   Greg KH <greg@kroah.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-spdx@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Joe Perches <joe@perches.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-renesas-soc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] treewide: fix typos of SPDX-License-Identifier
Message-ID: <20190601162945.GA6395@kroah.com>
References: <20190601032242.10405-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190601032242.10405-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 01, 2019 at 12:22:42PM +0900, Masahiro Yamada wrote:
> Prior to the adoption of SPDX, it was difficult for tools to determine
> the correct license due to incomplete or badly formatted license text.
> The SPDX solves this issue, assuming people can correctly spell
> "SPDX-License-Identifier" although this assumption is broken in some
> places.
> 
> Since scripts/spdxcheck.py parses only lines that exactly matches to
> the correct tag, it cannot (should not) detect this kind of error.
> 
> If the correct tag is missing, scripts/checkpatch.pl warns like this:
> 
>  WARNING: Missing or malformed SPDX-License-Identifier tag in line *
> 
> So, people should notice it before the patch submission, but in reality
> broken tags sometimes slip in. The checkpatch warning is not useful for
> checking the committed files globally since large number of files still
> have no SPDX tag.
> 
> Also, I am not sure about the legal effect when the SPDX tag is broken.
> 
> Anyway, these typos are absolutely worth fixing. It is pretty easy to
> find suspicious lines by grep.
> 
>   $ git grep --not -e SPDX-License-Identifier --and -e SPDX- -- \
>     :^LICENSES :^scripts/spdxcheck.py :^*/license-rules.rst
>   arch/arm/kernel/bugs.c:// SPDX-Identifier: GPL-2.0
>   drivers/phy/st/phy-stm32-usbphyc.c:// SPDX-Licence-Identifier: GPL-2.0
>   drivers/pinctrl/sh-pfc/pfc-r8a77980.c:// SPDX-Lincense-Identifier: GPL 2.0
>   lib/test_stackinit.c:// SPDX-Licenses: GPLv2
>   sound/soc/codecs/max9759.c:// SPDX-Licence-Identifier: GPL-2.0
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Very nice catch, thanks!  I'll go queue this up now.

greg k-h
