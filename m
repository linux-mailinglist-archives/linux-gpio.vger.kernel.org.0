Return-Path: <linux-gpio+bounces-23844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E4B12CFE
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Jul 2025 00:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 096C57A6F6C
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Jul 2025 22:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2172D215198;
	Sat, 26 Jul 2025 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Iih954LT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gL3wCOhj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37954A93D
	for <linux-gpio@vger.kernel.org>; Sat, 26 Jul 2025 22:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753569629; cv=none; b=D3ueBZ1Ou+s76vE2gj0zgCyTGiRjwqkof3l7G8stIsDrp5F4KKyGPJMuYxEM0lzzDPM/wuwLZsYmDpg1PfzxnFVHXXGXbxBxBT46QmQ1DsNebcgBVUvrPoVJrAGkIiKVBuFaP6dnkkyAC2NueHvg9xa+Y7rnDbp/Zw8YGoENGS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753569629; c=relaxed/simple;
	bh=Ob+g+dH0JZ8uIDC2KJzbhGUkLQr8BDya2ZnLxrBUIkY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dtPYf4xgoz+djLo/+eVRsH9sFwF8w0bWkNLbrEZawb1mzoUzX5OH2qcQg/EQ3Ecn8D22PDEzU3pm+u6Grsb6bthe+lwUZvJaYh83K9n/+kgmyyelUt3kIvpCEMRK2+hDRK7JVRZ+X2as3cX2bnFIZyCcupHjzW0CdIwgC5o2WDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Iih954LT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gL3wCOhj; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3653D140009C;
	Sat, 26 Jul 2025 18:40:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 26 Jul 2025 18:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753569626;
	 x=1753656026; bh=7TOyFViWa+YlDiIbVX3y0uajUcD4spFTnW1FKMUui7c=; b=
	Iih954LT2369awhdra+2ARk4a8svGrXRkk6XaedIdVRUjyBUAWaytAWcDqfbLpHB
	ifNQeXWbOKEmJVqYIqeXZgvlQi7eyGAYW9Xhb6U295rZBXe/E8UNB4ijV0QmjfCV
	eFIeRF5yC8MvU5fT1cXdpJI1+xt9AWdoEXP5NfvcuBUuSV0BH8HIvtLPhbEaOoyw
	9CQUl8N/eg2kZCKrfx3RW2SH3de96Mzu9wUdowYX7w6LRkgBhkt+IqGVJZS8wmWw
	h7fHwrjaGLDvFQpcXNRhm3ye7+Y43+V6plNJvvA1M0iVZUZqJi0CzjBugM2p4kHX
	kaTXd9rJhZoQj/dSTF2XXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753569626; x=
	1753656026; bh=7TOyFViWa+YlDiIbVX3y0uajUcD4spFTnW1FKMUui7c=; b=g
	L3wCOhjwnRET9HgcQnALJUuuR0+DkshbJzIQbKOJrYWDYTpkeb2PoIkW/Un9vRCO
	kTZhZBBisWhL7gw0UFoB4KxE+Ann/A8pHTnCGGoKFr/P8BYxFRdeqfBiqWHtQETm
	ASIN62qDt3ZzJEIEOpcdABdKXZPVuV0Wd1ZwvGheDz1hY4RHk5bHyLlL5DZQGOB2
	zB3p/qhbLhfVP2CaT88nm6GcJeJl8ijmWQDklMVEDptCHDruFmWoz0LkD+MIjqtq
	SvZOXVsvnBGmlvKVPCIfIxaSXezMB324WyeIFZtKKgjt7+Uf6oeL51LQ4Zx1kwUa
	WYCx/09HPtBWqEkTinGcg==
X-ME-Sender: <xms:WVmFaIeLPpEfWHAHdTUg9BaU5E_RmNU1GOhTHIt72SIbDmVbWnQmiw>
    <xme:WVmFaKPOZgPEjkJ0AjHInoZydm0l2HAe1mKT5qidO1YaMzvA3H1OrIgwVDZgrCnuH
    pNOTAKyxbmJsqjD2GU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdekjeeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghlvgigrghnug
    gvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhkphesihhn
    thgvlhdrtghomhdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsiigvfihskhhise
    hlihhnrghrohdrohhrghdprhgtphhtthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:WVmFaPk9X5whA185rK7PRklpvlBETHwTdIKvIv1kq_5y-skAuFTIZQ>
    <xmx:WVmFaKOPz0N2AbJdFNiMft4z2o6KV1yCPH1X18HUhrhd2WfPtNKj4w>
    <xmx:WVmFaLOefh3x5YDA1rSupw8SpZkTOyHFpWTI9_8XSG5RCMNWqyKUcA>
    <xmx:WVmFaDhAxsNvCMunvOKapDqAAy99EfwbhaMuKZc85s4W9HFkr4uzsw>
    <xmx:WlmFaFpGxIKBXDvsjKnWmRX04i96-N3W-vwhLZdkkR08LtENqH8dd4ZS>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A7DB6700065; Sat, 26 Jul 2025 18:40:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T488fc92982b340b7
Date: Sun, 27 Jul 2025 00:40:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "kernel test robot" <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>
Message-Id: <8e74e833-87f3-43dc-a80b-4be7ff3b9ed1@app.fastmail.com>
In-Reply-To: 
 <CAMRc=Mc95SMBBjndi9EPUd+d0AftGaovfn0-uhoWQ+cf7SJ9Bw@mail.gmail.com>
References: <202507261934.yIHeUuEQ-lkp@intel.com>
 <CAMRc=Mc95SMBBjndi9EPUd+d0AftGaovfn0-uhoWQ+cf7SJ9Bw@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 4/5] drivers/nfc/s3fwrn5/uart.c:147:15: error:
 implicit declaration of function 'devm_gpio_request_one'
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025, at 14:23, Bartosz Golaszewski wrote:
> On Sat, Jul 26, 2025 at 1:10=E2=80=AFPM kernel test robot <lkp@intel.c=
om> wrote:

> Hi Arnd!
>
> Will you be able to address it quickly or should I drop this patch
> from my queue? I would like to send my PR to Torvalds early next week,
> Wednesday at the latest.

I've sent a fix now, but feel free to drop the original patch
instead if you think it's too risky. It took me a while to reproduce
the problem with arch/um allmodconfig because there are so many
other drivers that turn on gpiolib and end up hiding the issue.

I also saw a few preexisting bugs in that config where drivers
already fail to build when GPIOLIB is disabled.

     Arnd

