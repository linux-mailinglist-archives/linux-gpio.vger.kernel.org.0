Return-Path: <linux-gpio+bounces-3748-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44279866A1E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 07:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75CE21C2088A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Feb 2024 06:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABC18134B0;
	Mon, 26 Feb 2024 06:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Z3gzH9lQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pUYn9xku"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF9518E27
	for <linux-gpio@vger.kernel.org>; Mon, 26 Feb 2024 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708929327; cv=none; b=MzJ3ujlhz7iK3OIt949R3qAxJSPkAxfpIHABZKfraMzLJN0td3CyleamjJW9tEe35oRUl0PfgtU2Q1SMV11+e5ASJ/qkuknPFBvIYLQb8Mr8MkqJksZZh706ch5AccM12twK339gZFnAtg+cedjRgQovWC80NJSAwXe+1XkhAro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708929327; c=relaxed/simple;
	bh=oUmmi1SwAiA4SVohGACR2V/2JGP0UqDmLuKcudUC6jA=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=pNv9tnxBxeAH5lmJSQtE/8AGfNzFsL58Swr7U2CpbXIEgCG+qLWDD+n7FJccbr7y66MVHoQnqDsy8bnok1/5J3Q/kzBUsE0MWVzJ4u/afSik7o/mHeLh7hNtrV7N0X/I+hSwEYatz6appaSZnJ6KMt/0ZgqG7BIBLOuqXjCUr50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Z3gzH9lQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pUYn9xku; arc=none smtp.client-ip=66.111.4.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AA8F15C0070;
	Mon, 26 Feb 2024 01:35:24 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 26 Feb 2024 01:35:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708929324;
	 x=1709015724; bh=LPAbmAl3kb6WZrPI/1vhhjF2CKz9qgASEVElOq8Fx6c=; b=
	Z3gzH9lQTHjUNk7jLK2mzjo8/KBlh+AHl7QWFCec3dFjW1OlBLeraZatCWyyLtLv
	8HrXeVRjUQl0mrXxD27nEq14iE4fLD89IRbohD8jDkLlsOcUy55jDUOYSoqLOPOY
	3xV0Pi/MT6Idfq9r29qwoAFIxm+EMLqIqQ94cLKPN5CGALPjMEGPOUOVYqsBQBZc
	vLeTS34th4mAn2E87wZmIupJgHRlF84EHNKhh8ZJ84fTTADxQtbC5ZOBb7sL+1Ze
	vOws3PJCRtXUOY8z3ZM4+sXDyt0B6c/9g18U8kVTSLAkny5Vl1Ys3s6Ribd88DJN
	OUXfUdXTG9Z8dGJfpUPavw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1708929324; x=
	1709015724; bh=LPAbmAl3kb6WZrPI/1vhhjF2CKz9qgASEVElOq8Fx6c=; b=p
	UYn9xkuAtjwGQ+bzjW1xg/KjaZOPO+ntyO+AzdoCf7EKHPZf7/JZbPET3/dOykc9
	lrQKtFfsE0/0dOinYwCxmZT4GJYifM6OZuPtO/C2mNTPZS2HMLLP5UkxbpuOtxBC
	ug0t4+2YXPGv1y6KuMPCcVK+E0W0nGGQAGZr2DHR9huFoESGZAiE58jyruQ3vWKE
	mGuIlijgyGJiRpzleJZsxxW4xr5iOxK7XYV68WfNnBj3g4JZiTumfkpr38rQSlF2
	/fpB4yKeEcntP/00Xrj9tiW+tgqDaUjALNNaCr6quHg1ViKpDziizT6FalmykuXv
	UlqxQqAQo0IYXJqwTvxKA==
X-ME-Sender: <xms:LDHcZV5iokro_WlSno1jUq8GgjGHjLjLGLXymlL0-VZ4MIdG8S4Ymw>
    <xme:LDHcZS5yIiaAOI1A6t-KhUyAcuFTOz8wIPfPBOoQgLvzVllO7mOyPUB2n069TwaIg
    KPqXUR5G_ZlaMzord4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgedugdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:LDHcZcdJCE0auVjg5Pdbqh3Ivf3XvmH7r8XKbEx74B3YxJBtPBWFow>
    <xmx:LDHcZeKfJxnd_F1S2JtfOJykMSjaY1tceHl2MdjWkx-mOhvYjQdZQg>
    <xmx:LDHcZZLjH-xeCYG3m4g1EGlY-x0-qaQT0W8OFSGV9c3K7WbPu1wdhQ>
    <xmx:LDHcZXirhGX5ck7J4k8VgyVZJODx4iAmKeUMQOyrtwL6wFjr9U0kbw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6493CB6008D; Mon, 26 Feb 2024 01:35:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <f0628cd3-3cbf-4aec-8657-74cf0ac3606d@app.fastmail.com>
In-Reply-To: 
 <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
References: <202402232058.4eDf4GRs-lkp@intel.com>
 <CACRpkdZtwvZPB2=xW_SoV9DmjPQJZXyWRnwySDkEL1cDvoeGRw@mail.gmail.com>
 <CAMRc=Mevhd4b0kUi-FrWkWUxSDkpcSb9NW0+JJJbkMmPyG-RZA@mail.gmail.com>
 <CAHp75Vcm7wFKrUnt4qnRkUzcMqyqGVOsam-y6rHbYDjpPnSzyA@mail.gmail.com>
 <522ab6e6-97b4-472d-8a1e-a495a263dda3@app.fastmail.com>
 <CAHp75VeSJ62oYBTpt4a80eH3tuyjJ_mRZe=P2w3yKKattmh1vg@mail.gmail.com>
Date: Mon, 26 Feb 2024 07:35:04 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Subject: Re: [brgl:gpio/for-next 42/47] gpio-mmio.c:undefined reference to `iowrite64'
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024, at 03:17, Andy Shevchenko wrote:
> On Sun, Feb 25, 2024 at 11:09=E2=80=AFPM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>> On Sun, Feb 25, 2024, at 00:23, Andy Shevchenko wrote:
>>
>> readq()/writeq() are not generally a replace for
>> ioread64()/iowrite64() because they can't deal with ioport_map()
>> type mappings, though the reverse is true and you can always
>> replace readl()/writel() with ioread32()/iowrite32() if you
>> can live with the performance overhead on x86.
>
> The driver in question by name assumes that it won't perform IO port
> access.

Do you have a link to the driver? Maybe it can just be
made 'depends on !GENERIC_IOMAP' if it doesn't run on x86
or um.

bgpio_setup_accessors() already has a special case for 64-bit
configs to allow bgpio_read64(), so it wouldn't be any
weirder to also require !GENERIC_IOMAP here.

> Perhaps use of ioread*()/iowrite*() is not what we should even
> consider there, Linus, Bart, do you know if gpio-mmio was ever used
> for devices that want IO port rather than MMIO accesses?

It looks like there is only one PCI driver using pci_iomap
with bgpio_init(), and this one is x86 specific:
drivers/gpio/gpio-sodaville.c. This one is little-endian
and 32-bit only.

    Arnd

