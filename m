Return-Path: <linux-gpio+bounces-7430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D35907513
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 16:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFB50288619
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 14:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4A2A145A12;
	Thu, 13 Jun 2024 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="zjyxAfm9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="l6Fhe4CJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA412C530;
	Thu, 13 Jun 2024 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288458; cv=none; b=qkpv0cG6nIObuf2tWfVpfZ9IP4J0nC6cF3g99qOmWYtCCbsO7gZ3URO/OObFhLmwNFur47rSYlPYYbzbxH/P0SV3OOy/3nYZBNNcbEgmmejfIqlDvtgJu1ZAHPaLtDLZ8CC0JefSjj7WaowUv7LzZBgfICNM7MyL4rXZcFWLsRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288458; c=relaxed/simple;
	bh=gOepHru+/EFmlPSQIh9I26p7iOh4irfzA8xkM0Gj5N8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=diOdz9yCBFaxC44Eiu+CE6GxwnW+/8Uiay71tFmVtQ9q22T1ClGxqp4LDqMBpt3StFi6pAjkp7clleoLzHF538dRNCioPZIfwZKGM9I7vpAyJjg+u0o1L2BgB2kzwgb/u9lTXGemLVddyw3lvJXui5/jJY3Xb177O5fNjwkUXRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=zjyxAfm9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=l6Fhe4CJ; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 464DB1380198;
	Thu, 13 Jun 2024 10:20:55 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 13 Jun 2024 10:20:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718288455;
	 x=1718374855; bh=X1wXGY8fY6VS092pn7rTbaQrNyXNXzEIWMfaJZJaLSk=; b=
	zjyxAfm9GQUxpC7XjcqZ9lM0/MsYJTm+1xw6djPAV18PPOXFUl+RkC1+1xbcqttf
	sw+QphvEvbpcuYUVc6anrYDF7+CbM3eBAyffyA9IJsJDK51oOrjDRXCja2GlEbIC
	Q69xZv1YJUGAK05jrMxM1tJ5FboueV6+4SH1yf82vkNoqiazMQzntIvhrkdQXokt
	HGas9//U7yA/3YOY/Eijsega7ObtY8NHO9XkC6SvbbzNJbrCOXWXd8oGU8QsLroi
	DXUIvyIXWWZ/hw6YtPAy3cwHeYtQGRbooc0eS44axhEy4lZFa6vEbURGHjLxjxSy
	Bd83QPfZQF6Hr0nHLbWg9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718288455; x=
	1718374855; bh=X1wXGY8fY6VS092pn7rTbaQrNyXNXzEIWMfaJZJaLSk=; b=l
	6Fhe4CJ0rRpOpyHTeBPthkqTdK0adOo77CVimUc9Sxy5Z9TDzDNKck1cgiFse1US
	rbJUBh0wpBcFYj4OD6dK4YxO55A1adlud9i3gx1O6kNm/xnHtBeqex9dK3MalRqK
	fDAWJL3RDQCXYpiEIoYMNAHZJ/e/+ZhUmuMsfzRd8+dN3ddSkvqftb9Ei+qxnZQo
	qfCYAlLwizmlOkxp+5cIw2/GBm1mvLgHGUVyyCQ4OJ9fuEkBshmreJek95VWaIMD
	MSXT/4T7Gq9tMsk5t7dudKUSrWHFgBo6p/3yJr0lOiv18RA+IXTcdkvTD+h3ZFMd
	VKPQQ5rqLYRPL2U8MizRA==
X-ME-Sender: <xms:RgBrZlMdu8-tv8UWHLYBj0JTsGMAFiSCg5giNedmBvMrJMQoRP_O7Q>
    <xme:RgBrZn8qftkkxq7vnKUTkQ0C2imAWPgxqu17wtj0m0a_LqENFTXN5CKhSE69CFEHr
    8NY24GGAIZFzhmVfcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:RgBrZkSKWjv_yY_cwS2UN2pwPodhKZTDwwKjl5ihgcv5n9ZX1KnVTw>
    <xmx:RgBrZhtjWVEHqrKsF_Ro5O6DGH8V1X2Cv3ZuGHxejINV9dAP9Ht9tQ>
    <xmx:RgBrZtc4QfXtqdZyU-fScnUru0u_EaSNzUeT-9URqGPsc4zL8x853A>
    <xmx:RgBrZt358F5sttmCeu8qEi4V7wMQ2AEBgvElqmqJjuZZ3I50fvFX4g>
    <xmx:RwBrZsyLkCWqCOna_CLxF3uxGtLHcUu7mwThfdbFJYjtuqZ14xMYeJNt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 55B1AB6008D; Thu, 13 Jun 2024 10:20:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <a7463c6e-2801-4d0e-b723-fc1cf77a04ed@app.fastmail.com>
In-Reply-To: 
 <CAMRc=Mem6HN13FOA_Ru8zC-GqGGLTsQiktLWs5bN4JD1aM3gHQ@mail.gmail.com>
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
 <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
 <CAMRc=Mem6HN13FOA_Ru8zC-GqGGLTsQiktLWs5bN4JD1aM3gHQ@mail.gmail.com>
Date: Thu, 13 Jun 2024 16:20:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Kent Gibson" <warthog618@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024, at 15:51, Bartosz Golaszewski wrote:
> On Thu, Jun 13, 2024 at 3:47=E2=80=AFPM Linus Walleij <linus.walleij@l=
inaro.org> wrote:
>>
>> On Thu, Jun 13, 2024 at 11:43=E2=80=AFAM Bartosz Golaszewski <brgl@bg=
dev.pl> wrote:
>>
>> > To prove this point, I even moved the gpio-virtuser driver I'm work=
ing
>> > on to drivers/misc/ too as it isn't a GPIO provider either and mere=
ly
>> > a GPIO consumer with a one-shot user-space interface not conforming=
 to
>> > any standards.
>>
>> We *could* just create drivers/gpio/consumers/* and an entry into the
>> top-level drivers/Kconfig to have those appear right under the GPIO
>> providers...
>>
>> Yours,
>> Linus Walleij
>
> That would just add to confusion. GPIO consumers are all over the tree
> after all.
>
> Whatever, let's keep it in drivers/gpio/. Greg KH just shot down my
> idea of putting gpio-virtuser in drivers/misc/.

I could imagine treating both gpio-virtuser and this code as
a gpiolib extension rather than a consumer (which is usually
part of some other subsystem's driver).

It would also make sense to me to separate gpio providers
from gpiolib in a way, moving one or both of them into a
subdirectory of drivers/gpio/.

It's probably not worth the pain of moving files, but at
least in Kconfig and filenames, they could be named
gpiolib-virtuser.c and gpiolib-sloppy-logic-analyzer.c
to make it clear that these are not gpio provider drivers
but something else, more along the lines of gpiolib-cdev.c
and gpiolib-sysfs.c.

     Arnd

