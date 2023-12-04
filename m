Return-Path: <linux-gpio+bounces-977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3CD803862
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 16:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC5521C20ABA
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Dec 2023 15:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1223E2C190;
	Mon,  4 Dec 2023 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nWBU38NG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rITqltm8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B7FD3;
	Mon,  4 Dec 2023 07:11:34 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 1405F5C009F;
	Mon,  4 Dec 2023 10:11:34 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 04 Dec 2023 10:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701702694; x=1701789094; bh=EX
	CwC2QO1UvSxQX0tDRiqh9sUcZIzv34aR65e3WonXg=; b=nWBU38NGX0jmRlEgMU
	nJ5L2yOjTVln9/4gN9a1EhCFkY2yXZPbf+ispfUlXLSAwXqKofPteRHJlmOVCmxj
	2JfXkyzjNtUOPRvzx18xNbpFgdWRjaIQXhioKV9nx8TEI5Ok7R/wQPCXANzCUGej
	5/v//zFjG5GtsYSRzmh31yF+bYXdn2Bt288AYV4X7KRxgsRvVofrY3TsnNCmSe3Y
	nVilt4OnJIckD2In9QAlAprPtmJCeo+CBna7pI8FWymtKZTMPp8BVYzdPX+4jAn4
	ntLWoCVw/PvR2FoShYuWMnveCjj6MsEq0giIIL+TX+tp7/emh3fg9cXsVy8er1eb
	6GhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701702694; x=1701789094; bh=EXCwC2QO1UvSx
	QX0tDRiqh9sUcZIzv34aR65e3WonXg=; b=rITqltm8gzItjnKwd450G09/lyWvs
	9H26qZDmz3u6QoUJYPDIhksn8sh25F+ttyx4jpS/L322xxWp8TMd7hlLNolYjeWZ
	EHwzK8PrmOeZkd7z2QYA3WS7849PH0ISCyPoGqNTH3GfBXd9pGg9gW+TACfDam4N
	adbpm55UI8x5zU7ggrhoJH3GRE6svm4YpAgwzi6cCQ2U+NNPUOoxtZzXnwCk/iQl
	vdQ5df8GNSZacKQ8RRP7Hkb5SCxUvVA7HjGiQIjEP4OxZlb7OKOMOnzGfA3CBvVB
	WjJuNpPgcVT8Syz9KM/pUYAZASgPjMvWZ6JB2tdomuhycaUoZEcJXcLcg==
X-ME-Sender: <xms:JextZe6Hx2lXS0g19VPPjgsWqx8gFJZQybZ0ai58qqlfgaOm5dngJA>
    <xme:JextZX7QcknLCl0Ydt1YjFJGQghhSpIlZw1lg4iSsTxFnlZbumCioGrOlVmB3XQY9
    0JY9oMUCb2SLdWBnmo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejiedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:JextZddRvNyWGthTpjDj3iDLQbRg5A8oX3xbukrRdReUWwuxp4oSnw>
    <xmx:JextZbJuzVbMyZ3bjXwI1GogKPLvGrLhqsyN6evl-acU0XobtLtjAA>
    <xmx:JextZSLSRytw9mi494nYmFAJ-52FKES-kctrY1HLKLvBxkKWQRQ6Jg>
    <xmx:JuxtZR9ej3Fua_SZnvMVBsXXIm_d-U6mw4xo2yr6Z_ZR_ydGpfhucQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 046DBB60089; Mon,  4 Dec 2023 10:11:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ad6afb94-e221-4adb-a942-af59f5d7b92f@app.fastmail.com>
In-Reply-To: 
 <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
References: 
 <CA+G9fYs1g2Pt=DQeaJC+3ZJTeMwKAs9GuGJ9k6BcwKwEXcn5kQ@mail.gmail.com>
Date: Mon, 04 Dec 2023 16:11:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 "Linux Regressions" <regressions@lists.linux.dev>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, sean.wang@kernel.org,
 "Russell King" <linux@armlinux.org.uk>
Subject: Re: arm: gcc-8: drivers/pinctrl/mediatek/../core.h:211:21: error: initializer
 element is not constant (struct group_desc)
Content-Type: text/plain

On Mon, Dec 4, 2023, at 13:08, Naresh Kamboju wrote:
> Following build errors noticed on Linux next-20231204 tag with gcc-8 toolchain
> for arm and arm64.
>
> ## Test Regressions (compared to next-20231201)
> * arm, build
>   - gcc-8-defconfig
>
> * arm64, build
>   - gcc-8-defconfig
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Build log arm and arm64:
> ------------
> In file included from drivers/pinctrl/mediatek/pinctrl-moore.h:21,
>                  from drivers/pinctrl/mediatek/pinctrl-mt7623.c:11:
> drivers/pinctrl/mediatek/../core.h:211:21: error: initializer element
> is not constant
>  (struct group_desc) {      \


This apparently comes from c0c8dd0a7773 ("pinctrl: core: Add a
convenient define PINCTRL_GROUP_DESC()") and following patches
from Andy Shevchenko (added to Cc).

I also checked different compiler versions and found that the
new code works fine with gcc-13.2.0, but not with gcc-12 or
older.

      Arnd

