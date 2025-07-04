Return-Path: <linux-gpio+bounces-22805-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF678AF9388
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 15:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EA1A6E0E3A
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Jul 2025 13:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADCBC2D7805;
	Fri,  4 Jul 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDBe92Te"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79F1E4BE;
	Fri,  4 Jul 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634252; cv=none; b=E6lQw7icYRIvZvo6Ihpp3pDlSPNcNTdtuTGhJ8it1I5sPcqGDtMn8E4tt+bRzVrunp1mDYPzV1n1IrFZe0OHpLZHGge7Vvq4IoaW9Snebp4P+7phjATjL2Os+PpHLCNU+9iWcbgh853yVXQ7tAuOlSWQzgJ2VL477KGAbEu/D/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634252; c=relaxed/simple;
	bh=x/CqZOqLup6xvIywqoPIxhoUTzY2HWbFRMD0iQbgjd0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DI0AKKPcFSZQSCNLyOxDKx28QQtgLy183IPHgX0OQfRjuplsQdPRZFWcvYknbsRVXCjolV+P1PaI22W8wmfkzOzGOK3/UKj7EwF5ADWYRYia5w9wK3lsUAeyxhtwsyEpeyPyjOLKYkLGoJ2QIkBBKPmSl99B6Bi6bZu9PCDVQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDBe92Te; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D8FC4CEE3;
	Fri,  4 Jul 2025 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634252;
	bh=x/CqZOqLup6xvIywqoPIxhoUTzY2HWbFRMD0iQbgjd0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=sDBe92TeqC8U0dKA+Oe5U3ieTeydPr4vY3w6hCzpJmIliCeSYLjwG+u2zWPxaNsBX
	 2cHebfcN3ub9I6TEph6/jpqRlCVKZA+4nD44E0W3svSq6IPemXex9asbfwTmk79T1E
	 s42ADdnPwF4/uACxB2KNkOKT40oQlC4RnceDIub8GXFWgT+1LNXgZi2zLMDaXk+IcS
	 BtSj2VFBM9S04nNp2cFYQnHxMxybjlVlt0FT3DWJyLxpnduvk9BlR5BNeMJGqR75x5
	 g+qA45kuPf0lHVyGJGjNg+e/3xHwvaz07jw8bv2a3+DYW8mg/djM3Ze7v7lGQPq7fv
	 QO2SqWI9JYUEA==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BB6BAF40066;
	Fri,  4 Jul 2025 09:04:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 09:04:10 -0400
X-ME-Sender: <xms:StFnaKnZ01qgJVhy9xusnFs3BikKvutLQCFeEVtnU_Uzkw_5GgmQWg>
    <xme:StFnaB2fg3_xVmGwiCSJVMEUeTbjmecqFFSUTKj8P9Ci5kusMjlGPrMvDiMYRZMgw
    c0E8fRy5x3L_yXfYfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhn
    uhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepsghrghhlsegsghguvg
    hvrdhplhdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsiigvfihskhhisehlihhn
    rghrohdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghroh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:StFnaIolG1hLWgDLhV3R3nYQfoPpa3nJxUR0VyMvVkmQ7eud9sVwww>
    <xmx:StFnaOljZHP28NXdUbUIRaSTcOI4A8dODPjunuewcTJdl6h6pT_rqg>
    <xmx:StFnaI2kkbiBy6857EKmo5TZh4bHu4asvmbhe0xW5gEXgkB-PqREVQ>
    <xmx:StFnaFtavOjlWA6ryCafcJZ_bkd5iAKxjBp6CRKRo5eW-QrpSxIZOA>
    <xmx:StFnaEXM4fkXbs65meQ7inGwdmq8jsJfFw6NCXPbIMrrkChjPIjpb_YM>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E2DB700069; Fri,  4 Jul 2025 09:04:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T32a3380a6a3c276e
Date: Fri, 04 Jul 2025 15:03:49 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <0d5be287-e11b-405d-87ed-972a198f00e9@app.fastmail.com>
In-Reply-To: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
References: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
Subject: Re: [PATCH v3] gpio: reg: use new GPIO line value setter callbacks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jun 23, 2025, at 09:57, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the legacy generic
> gpio-reg module to using them. We have to update the two legacy ARM
> platforms that use it at the same time as they call the set_multiple()
> callbacks directly (they shouldn't but it's old technical debt I
> suppose).
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This is the
> last remaining patch from a bigger series that already went into
> linux-next. The idea is for the ARM changes to be Acked by Arnd or
> Russell and routed through the GPIO tree.

Acked-by: Arnd Bergmann <arnd@arndb.de>

