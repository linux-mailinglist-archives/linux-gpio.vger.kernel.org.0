Return-Path: <linux-gpio+bounces-21940-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0516AE1C85
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 15:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69DF318855EB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 13:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA32628E616;
	Fri, 20 Jun 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Asz7yFT/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W4Ra1mMU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6B28C2AC;
	Fri, 20 Jun 2025 13:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427180; cv=none; b=YSqOEKtWQvd/39MSgbYSsNoHCQowwYWF+UgtORykXTtNRUW09pK52mr2v7/BSw2S45lwkISmCxEgDX0c7fvZnVrUbKL2rUdj/av0UgV0pSxgdGt7LQgmZh3dcvdKoMN/uwmQfjF10k1TiMkgX8LB9tMkuiLpOklztEBvVo/okik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427180; c=relaxed/simple;
	bh=XFnJI+jkVHicJA83XmZae83406UJsPlBA/QvhqR3Lfg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QryXcW6ALPZedOWQsZ0YdeCRuTOUG06z2Ee70oYm2Bg14xHwB4OFe1WMTZM8rzFooCzyplVypoekLnbTHkfA2KHsXtTtk/VBRkVGsBFrbev+dUTyKw7S3p3NExzEa8HkQh1Mfck0T52bCm+JpjmugqOJCY6pB1Cqv7ewh473I3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Asz7yFT/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W4Ra1mMU; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1E251254024F;
	Fri, 20 Jun 2025 09:46:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 20 Jun 2025 09:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750427176;
	 x=1750513576; bh=uPA0d4jxZfT9jB3d7/2sVbEcChtqdmsIkrjwO7trSbw=; b=
	Asz7yFT/WuWPbJ7tReXbQmMhWXWpzv7ZHXH8cGMYh7vSD4hNBGxzdeKw6zb+DAGl
	xx76RPkrcsYHlVmaxBdFl6sbpsd37Cgc8w2e4fVLhjZCreWRiUnSYOHDMTB1TTeC
	5hXIXJ64EZG34hAH8tU4RUCOVIMCmGOalqPp3HX4LVmFBZdHn8gTBWDsoRPo4n6/
	9J86807ZgxBU/jQ9CsnDOJ0y+KQ1JhbRkYzvHKn7mNsVdhimdiChg7LuRJ1Kq/U6
	V6CV0QPl70GzpTzCkonZvJF8rtlKHmY3/JQ3v2K9xm9zOJ8oULsJ7aKtITZRQ6nJ
	s3+jl9FivnHXg0g74GtPvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750427176; x=
	1750513576; bh=uPA0d4jxZfT9jB3d7/2sVbEcChtqdmsIkrjwO7trSbw=; b=W
	4Ra1mMUQXzScnInVTsrnli5CBa35V3s5TJ1n2HQDGTehxVe6cIitlAlBNYV4TuA3
	+vdshjbdYCkFmaZzBMffQpOKqTkaO/dPdaYZuj7lQHK9wjbJE1kPlYSR12SAV+C7
	YD+PSbL/D0KsXfgmvpQGf1xkpBDVBqjfaBk/gCGmjQK8QWMD8dPK5HY2stQACi+i
	CnY++jYvuNMxIX8yGbT23u9gr8bQW3gequbE5CQHcSxxPqzMByYvON/TOAPNR8dU
	BfqpIDRR1FJEKKNGlMiMkDq9u7brUFlD2BwnA5/AF/Y54qMLgWWWcAyLE2kw5Rcq
	FgBWy+wZyKtrnPUF7f8JQ==
X-ME-Sender: <xms:KGZVaHXt-GuedSZhDpObtlxrzeLkyn47odLjPpSgT1TOEw279chpXw>
    <xme:KGZVaPlUJkQhnytmd0RY7qeRprI13pvIKq8benq19GnQCUVr_EJbJB_tPgeZP963q
    KOHkK4GxdEdagN9kK8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdekheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epffdttefhleekvedvvedtvdfghfdvvdeftdehudekkedvffdukedthfefffefkeeunecu
    ffhomhgrihhnpehprghsthgvsghinhdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphhrrghtrghprd
    hnihhruhhjohhgihesrghmugdrtghomhdprhgtphhtthhopehsrghirdhkrhhishhhnhgr
    rdhpohhtthhhuhhrihesrghmugdrtghomhdprhgtphhtthhopegsrhhglhessghguggvvh
    drphhlpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsggrrhhtoh
    hsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtohepkhhr
    iiihshiithhofhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoh
    eplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhi
    nhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KGZVaDY8lq9kYVgKFhAh73kGn0AZryLOYIX3-AZuSLkFLjtBDQ5g-A>
    <xmx:KGZVaCWTu1fazW0ztw369jVkoZHhZUBr4-eKhfnxyzZHLx5JJmaC-w>
    <xmx:KGZVaBmpcNnZdIb_imd_rq321-as3fJZC-1Of7QJ_rnVWF_X79mJ3Q>
    <xmx:KGZVaPcR195NGVoAZPhLiKeuiNbEKb5dxTujQBKXgD1UfR2VQbj7zg>
    <xmx:KGZVaKAlH2Goq8T0C0bJD22FZpw2u9hy75xW7pZ827J2BgB_7niAlFZa>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 94FBC700062; Fri, 20 Jun 2025 09:46:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T76f8dc934b1dafa9
Date: Fri, 20 Jun 2025 15:45:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Sai Krishna Potthuri" <sai.krishna.potthuri@amd.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Pratap Nirujogi" <pratap.nirujogi@amd.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <d05578a6-eedc-4c2e-94e3-e00fa293e4bb@app.fastmail.com>
In-Reply-To: 
 <CAMRc=Mep0SNj6anWcmaNh4v8Z=J7eomujU69Gz_exuG2Wsd=8A@mail.gmail.com>
References: <20250620130814.2580678-1-arnd@kernel.org>
 <CAMRc=Mep0SNj6anWcmaNh4v8Z=J7eomujU69Gz_exuG2Wsd=8A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: zynq: add CONFIG_OF dependency
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025, at 15:36, Bartosz Golaszewski wrote:
> On Fri, Jun 20, 2025 at 3:08=E2=80=AFPM Arnd Bergmann <arnd@kernel.org=
> wrote:

>> --- a/drivers/pinctrl/Kconfig
>> +++ b/drivers/pinctrl/Kconfig
>> @@ -603,6 +603,7 @@ config PINCTRL_TH1520
>>  config PINCTRL_ZYNQ
>>         bool "Pinctrl driver for Xilinx Zynq"
>>         depends on ARCH_ZYNQ || COMPILE_TEST
>> +       depends on OF
>>         select PINMUX

>
> I don't think this is the actual problem. I can build (and link)
> pinctrl-zynq with COMPILE_OF disabled alright. Can you paste the
> entire offending .config somewhere?

This is from a randconfig build: https://pastebin.com/ism57RPe

     Arnd

