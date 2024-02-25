Return-Path: <linux-gpio+bounces-3743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303A1862D0E
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Feb 2024 22:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F340E1C2090A
	for <lists+linux-gpio@lfdr.de>; Sun, 25 Feb 2024 21:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707F01B81B;
	Sun, 25 Feb 2024 21:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SmvtRbvu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d/skpLJX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C5D610B
	for <linux-gpio@vger.kernel.org>; Sun, 25 Feb 2024 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708895368; cv=none; b=UI1+slpgNSxzM2iG3R5uMLOcYyQUPXvdmJNAt20HDzzZP792RQk+PZFFa1XlNh41gwAln7Sy4ldNCfDhUiyl9RLigW1KY7qKRQckgi9VQFxNOlGfYXIrO4zyS/HaHsYI9KDxNE7J6WVGUfdGqL0Iv/My939JuqCOQbzp/mT4I5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708895368; c=relaxed/simple;
	bh=KxLjjiPdO5BSfpHwmwQBh+Es11VYdAo32mAuZXv/VO4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=XN/cNZyFXftn3u/MPuAQZXUlnM90XOdzQbg/cQPOR5dAkBBV67iSYBw4OxiPRjpYG4z0RTeg5tzs9K1h4RA0Yht7GOkhCpOt+tFp24sBR5lso05ZiG3GBMynGC+S3j7qHDQm++gpNSGNVeQvWVSrRpRRhYVJqVw1qHPf7Mv3Qhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SmvtRbvu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d/skpLJX; arc=none smtp.client-ip=64.147.123.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 7DEF63200A11;
	Sun, 25 Feb 2024 16:09:24 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sun, 25 Feb 2024 16:09:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708895364;
	 x=1708981764; bh=OY2i2EUDC+ZAaeIXy8EvVGBWlezkkXmkf/G2a3j1Roc=; b=
	SmvtRbvukAYq0kUAHn+53clW0pNmPX2ezigl98pVcAdv/E6gzxdOSgota8scDF0o
	Jtvp2NMnDOKIuPgf4T3WUYkEvzD2L8/yEoW4S+0stvsIGxW1dU+0hQoUCRTk6Pz2
	7koMEjELKzvnzHRAuMmhLn1CTcnK4Iag8+Ha8YayvC6C/Ipfs6I7nBqimeXSZz4X
	aMQjvnqFHaoWZNzk0DcUjxjIcS90s7KR4nvuR6xMVt7GSNP8mEHXWcuI0fHdu1UE
	mRRyOq9BnLfg1VQeSe9GMV6sXxmJOp3NDWmMtPvlN0B5dnfbkbcsltJau85vlAMP
	axDKjdwE0A91YzufDneLAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708895364; x=
	1708981764; bh=OY2i2EUDC+ZAaeIXy8EvVGBWlezkkXmkf/G2a3j1Roc=; b=d
	/skpLJX2AxsI/qmnr70gv8Zev2nbsfPFIp+kWqz/MUEp0DJ10Gm8ruLmD/EdwB7Y
	Zltyn31mLyk0lX919YySS+peNk+ZP32Wti97NdkY6R6APGJCSKDnoeNqqf5o0MDS
	kjmNxZI/EJNe9i6qgzaZy2eGCDjXANzg+KwFdP9I5a5VrDXupS+2LwBX5URWSxxP
	XDnoZc8azlMSx/e2C+47A3l0lCgG2lRpnHPg16WKwF6gk2BGc6ioEubIjO4LAz2E
	DtwMsdvYFEL9Dsfc0DamNcP1QiVAD/aECuROjxlL8pHju984KalDXUg2T5Drswye
	D2X/vrM4rVpnYoLKF11tw==
X-ME-Sender: <xms:g6zbZWXm3Rof2mqy3MDc58Drdg9Kc56ild2K-syoMPOiKzaFPfrQZA>
    <xme:g6zbZSnzixD1Q8LhDrYxGlMJCKueNL1IjZoirN2dJaolagDWekp1GXmB8a84rDV4Q
    q8htkXDm3Yu7BLNHL4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgedtgddugeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpefhvdehteehvdeltdegtdektdeuudeivdetjeehgeegvdetjedvveevjeff
    geeuvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgu
    sgdruggv
X-ME-Proxy: <xmx:g6zbZaa2OXcM06uiGt8FGX90dTs-SYV6YQNJPfg5z6jyvt-M4BgmnQ>
    <xmx:g6zbZdVUlzdmWw4TvOxO0WcJqbZrifHfvfNrHCoQQEenaW0-WB2udA>
    <xmx:g6zbZQlBRsh0BPVKiIqZhVAHt4br2twC-avuacw-QhkzGB2vKPfdWg>
    <xmx:hKzbZfu9E7lp7Rj9fyHLx5rstk0U_S7KDZTcTi4LQ13uv13k6REj9Q>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A841EB6008D; Sun, 25 Feb 2024 16:09:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com>
In-Reply-To: 
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
References: <202402232058.4eDf4GRs-lkp@intel.com>
 <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
Date: Sun, 25 Feb 2024 22:09:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024, at 00:23, Andy Shevchenko wrote:
> On Sat, Feb 24, 2024 at 8:57=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
>> On Sat, Feb 24, 2024 at 4:58=E2=80=AFPM Linus Walleij <linus.walleij@=
linaro.org> wrote:
>> > On Fri, Feb 23, 2024 at 1:44=E2=80=AFPM kernel test robot <lkp@inte=
l.com> wrote:
>> >
>> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linu=
x.git gpio/for-next
>> > > head:   7bb5f3a7ca8856c5c1fa26a6e3f58a1254019dc0
>> > > commit: 36e44186e0badfda499b65d4462c49783bf92314 [42/47] gpio: mm=
io: Support 64-bit BE access
>> > > config: um-allyesconfig (https://download.01.org/0day-ci/archive/=
20240223/202402232058.4eDf4GRs-lkp@intel.com/config)
>> >
>> > UM Linux now again.
>> >
>> > gpio-mmio depends on HAS_IOMEM
>> > and UM Linux has set HAS_IOMEM, but
>> > also claims to support 64bit without providing the necessary 64bit
>> > io-accessors.
>> >
>> > Maybe UM Linux need to be fixed?
>>
>> Nah, there were other reports for the same issues, at least for x86
>> and alpha. I hope Andy will have some time to look into it early this
>> week, otherwise we'll have to revert the offending patch.
>
> So, the problem is that those architectures do define GENERIC_IOMAP
> which does NOT have implementations of ioread64*()/iowrite64*().
>
> Arnd, maybe you can shed a light on why it is so?

The problem here is that x86 cannot do 64-bit accesses
to IORESOURCE_IO() mappings, so neither inq()/outq() nor
ioread64()/iowrite64() can be implemented for it without
splitting the access into two 32-bit ones.

If you have the specification for the device that tries
to use this, you should be able to work out whether
the top or the bottom half of the 64-bit register comes
first and replace it with a pair of 32-bit accesses that
work on both I/O and memory space, see
include/linux/io-64-nonatomic-{hi-lo,lo-hi}.h

> And we have dead code like drivers/vfio/pci/vfio_pci_rdwr.c (the
> part related to 64-bit IO accessors), which nobody tried.

I could not figure out what that code is even trying to do,
with its extra byteswap.

> P.S. The workaround is to open code using readq()/writeq() [with
> swab64() for BE].

readq()/writeq() are not generally a replace for
ioread64()/iowrite64() because they can't deal with ioport_map()
type mappings, though the reverse is true and you can always
replace readl()/writel() with ioread32()/iowrite32() if you
can live with the performance overhead on x86.

     Arnd

