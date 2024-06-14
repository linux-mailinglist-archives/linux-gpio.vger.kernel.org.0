Return-Path: <linux-gpio+bounces-7452-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC58908B28
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 13:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54CFE288BC2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Jun 2024 11:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BAD3195F0D;
	Fri, 14 Jun 2024 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="0BOFF8xk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="khq5QuRQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469911DFED;
	Fri, 14 Jun 2024 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718366354; cv=none; b=QNT2PZsC1zm2ZGynN0uwyYdeBqNhwjuIFT7u+yvNOcB/MhQU0WSn1hcRlX90Izv6HwIQSsfZW+bUNPujBQr88eD2SxgN5ircbgkFrOPF3W7poSH75fKE8pj1lSetJvGMedpbkVj/ZY1RAakx3miHVEx4js4efuf+7sw8OSr01Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718366354; c=relaxed/simple;
	bh=FZ7oU3Tvb+cR/zcsfVum+Isg4olsT4e3Ap9YPQa4Pgs=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=LcZMU/t5ZIAeogyVb1TabfwRASOKlvpjEJsVz9yUiTHTjkHR4QldEM/c0PcrmBbbYvjr0FGRGtS60x/coOOzoohJGTG+u1lmiKknxDGIW7cWjoODjjnK6O4LUruwK1zlvwKIjPA0WWtVuqUXPldOHcjAdH0UQKeP85bC/6V6CAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=0BOFF8xk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=khq5QuRQ; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 3525713805E2;
	Fri, 14 Jun 2024 07:59:11 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 14 Jun 2024 07:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718366351; x=1718452751; bh=7b44UsTTnI
	wI+o5WpcLnCvfHXK4AEkMV5k8wm0K0jxg=; b=0BOFF8xk3KuQzvyKSCxjq7MNh/
	SFw5xQ8D0C5Ida9m9tVEQjF7KQ002CChQSu+d/jfrvyjdQqITLpt4CBntFrsiKRt
	uGa8qN+pjEFO/QafVsLVrKjRugqwPehfFKkgCPBLsPKpBPI5Xu36DmKeqp9A+HrI
	82gwTv8Vcsox5Ko8T1CHYuTrsSEaGtNNmmYwdssz8FIMuNYRAu0PrZypueoDjy9V
	u/EWrgYyCpsGNESNemOs4Zx4DZMESjq8xny9yPjVNjpef1FFvdNAzZL6xX7v7Qvp
	L3tvL52LFWYFeMMNO7doShLnQUEz4nWFOAKnLrGYUKde9Ks5Ba5L+VttnLJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718366351; x=1718452751; bh=7b44UsTTnIwI+o5WpcLnCvfHXK4A
	EkMV5k8wm0K0jxg=; b=khq5QuRQ67A17Cqm/uDAbYb/2IxFAYYxcI1a/yN0VIzI
	d70yYdP4osCGVIYzhB4Jz5xwY/hC9+Po06loxGvds+8I3sFox5X4N28+aqK0CA3P
	FjpwiuprjIgN4cGWwmsfTivEUE9AhAu0L+M47kZ90/+ffEFb6aVWIR1BkllvO/Ro
	aECLXQG5FU/1M0krMTKRYObFQTMAzoKsEb/x12+2l+y54ZCvuOt+o6x9f8uu9aZR
	rEK9fKnFw7HKuZjpDPhCBUPOWn9Bgi00H77v4JIhotGdhrDX512R9Pz7NKg5mxho
	LnidyQjT0xpy7OcdJ4SC71+vubwMAkWnvJz6rn/FDQ==
X-ME-Sender: <xms:jjBsZgt-hMXVDwEQnW1-snDAT8hIBeH3mjvVy5bdJTeF2B0CSS88kg>
    <xme:jjBsZteowSYZjFrOEHKR_YX8N_xv12tDNgusTXhMjO9mjY3KR0dMoE9zW6bD3PLM0
    aLQ4wMbpXnKeSbUtk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:jjBsZrxluo1xiiOY3bSI-FgBhTAceQ8BGRIACqNEuVM8f4ao3dPAew>
    <xmx:jjBsZjOl9-X2GlsX20lMpl4_CtnpHbYRzOhODyCKKx7UhngaI8RWzA>
    <xmx:jjBsZg_tJCqPx2rboY0j48ROw2PQN_0Wz9ii_QhOzNuaLMWwtZ3yMw>
    <xmx:jjBsZrUFbyvV3IB2hLbcJ-RVbPTHITG0d5vVh_NsYzfFx2F_5H8u3A>
    <xmx:jzBsZkQ1_kH-hdIS-568YWEaXxPBv7Lu36z-ZHOVW0xGP3lavId79nVc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9CE1FB6008D; Fri, 14 Jun 2024 07:59:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <3bb9b39c-c15f-49e3-987b-26cd47e05f3e@app.fastmail.com>
In-Reply-To: 
 <slpwvai5q24qwymh7nktihvykmlhi5j3nhqjxruxb6yacruu47@27b7rhykw2f3>
References: <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
 <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
 <CACRpkdYtLDA3518uSYiTpu1PJuqNErHr9YMAKuar0CeFbfECPA@mail.gmail.com>
 <CAMRc=Mem6HN13FOA_Ru8zC-GqGGLTsQiktLWs5bN4JD1aM3gHQ@mail.gmail.com>
 <a7463c6e-2801-4d0e-b723-fc1cf77a04ed@app.fastmail.com>
 <slpwvai5q24qwymh7nktihvykmlhi5j3nhqjxruxb6yacruu47@27b7rhykw2f3>
Date: Fri, 14 Jun 2024 13:58:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Wolfram Sang" <wsa+renesas@sang-engineering.com>
Cc: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Kent Gibson" <warthog618@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Content-Type: text/plain

On Fri, Jun 14, 2024, at 12:03, Wolfram Sang wrote:
> Hi Arnd, everyone,
>
>> I could imagine treating both gpio-virtuser and this code as
>> a gpiolib extension rather than a consumer (which is usually
>> part of some other subsystem's driver).
>
> I have difficulties seeing this. For the analyzer, at least. It does not
> extend gpiolib in a way another consumer could make use of it?

That's the same as the chardev support in gpiolib: it doesn't
provide functionality to in-kernel consumers but does give
an interface to userspace.

Arguably, integrating the logic analyzer into the chardev
device itself would make sense from an interface, as you
could define it as ioctls and mmap instead of the debugfs
interface.

Of course we don't want to make it a first-class interface
because of the reasons you explain in the cover letter,
but it would totally make sense to me to call it a
debugging feature of libgpio instead of calling it a
standalone driver.

     Arnd

