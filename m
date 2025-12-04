Return-Path: <linux-gpio+bounces-29254-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 73956CA3E79
	for <lists+linux-gpio@lfdr.de>; Thu, 04 Dec 2025 14:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03DC030847A9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Dec 2025 13:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783E9345757;
	Thu,  4 Dec 2025 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="RhaxNrET";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="s+S7hscu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8918E3451CB;
	Thu,  4 Dec 2025 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855902; cv=none; b=irhtInCNl4lrHyPpmOtHVtygxKLn/GeFnlpSUAm3cKT4Xu8+llE+T73zs6/XsQLnfz8irilCEtVe1kBdyFPKz5/kRCcXa7EkXY0NgUt8b57hagsZwXwbvvsbazPBiezNA4QjtfQGspqZ9EgwQ3K90UZdwzZSrA3THk+dL8bDE3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855902; c=relaxed/simple;
	bh=pcnknaHYP4wTgQhHUF2zJVePxPtsvuWODAjwpYuldZQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=atB8kwfvihjOVwrAqsjoNr9HAnBD9fut6zfKHtLpShsA/krQBC4wjr5d3FLYgMq+ZcKFvMLyF0BJCWA+6iUx6K0XtC3EF7/Ijvb2mpVwx+qDJ89OE2JbD6AGzKd3fN7bpPEbu3ek50eG2yrlEzWnuBp4+rLpcyZ+A/n42IQPTN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=RhaxNrET; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=s+S7hscu; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id A27B21D0023A;
	Thu,  4 Dec 2025 08:44:57 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Thu, 04 Dec 2025 08:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1764855897;
	 x=1764942297; bh=HOB5wUMRnnJnQcRrPmvkFzbHper/bhBClESDp+mpL6A=; b=
	RhaxNrETHe90UuGFm/eOw3bZ0PQjF1gpa402jrLvbiTBpZwBttoox7IvHEE4FbRe
	Bdl+NioRFLOAjZbAEtECGgblsSSdI5q4z3gGBfxIDiFtMezTNYnsotjTxFfoLhfw
	De+EZrA6ZD3HcHfTRWd6P03r7b+lh9iDE0gA7SMRItRJr+g0l21MQASxilmfgcEM
	p+uipcgJaSNNNaxciOcxtWSloZzfyf9I3p2URs8JSwq4Jx0EDAHxYcW5GVnoj2Gw
	sHjMtGT+nlmpSBMxJmyodkjW9yoq61OU4c9Yy9bEBu69Axth4spY7up2Z8VWozuF
	JAwYvfq0OdjOiVIVDwltuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1764855897; x=
	1764942297; bh=HOB5wUMRnnJnQcRrPmvkFzbHper/bhBClESDp+mpL6A=; b=s
	+S7hscuPtvfqxcajmJRgzNqSFgdB0oiSCKFLH/eRZSbf2ghekRS0OqkmDzcon4GT
	EFFv0XjWmrpUOjVd/Jt+tJ4m0sfG7VsGt5mpJcECWStFH+mlM8qNv8TD5Z8nnaA9
	yflGcgUjPjUg3+JsGh6E+DgqxgVy/yvszGruWs9nSvsCSfF4J2PAYxROtaZAPcPB
	OVk3WKAtszFlRTVtl+ayyMSAolRTklmqEXVBzaIex+I8WkP/Cw85Opt8dwiGUZkT
	QJsxGB/gFbxfgzWYmxIW7q1m9+lyJvnQdMgTVeQ6+9i6LNuZRacPaV76w94gC0Jq
	/ZmJ15mDpU6T305RWRqZQ==
X-ME-Sender: <xms:WJAxaer5sBo0FYhOrj_HbwsGXG9MAn2Lv9BQ1Yx-4DopkGD-muBhaA>
    <xme:WJAxaXd4KYlmvfVDaYNuEeYbtV0ZO-mo5SIaS6bvW2VsOfFOOEbPilHS1L1zGHq7J
    nPcUTR_ukTzYQYuaNMjnD1kAQrxPCqk6VVhrEpUtJ1YZ2ipL495cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    ephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguse
    grrhhnuggsrdguvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtoheplhhuhihulhhinhesvghsfihinhgtohhmphhuthhinhhgrdgtohhmpdhrtg
    hpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhglheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkhhosehlihhnuhigrdhinhhtvghl
    rdgtohhmpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprd
    gtohhmpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:WJAxaVZh3R6qpvoLKRbl2IpabRmZfX3uybDZ_m0HstO0lKX0Tv6XHw>
    <xmx:WJAxae-VsYuJTN8nHlhZ0730MSylMFhugh8wduvibh0iChb6yb4CQg>
    <xmx:WJAxabllwwhOd3kV788QltDRwAIJAi5bKXI03Bjf4C2LBKeiA-zc3w>
    <xmx:WJAxaTw7r4ps7TMtsmgp5tP7KiSqIhTKdjXRKy47lSs7ecOSICPEWw>
    <xmx:WZAxaRVPAcqTQM3gGmr6SCvYHscid8yTHPObR5PKXbejFR6K4aUtoOi6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DED25C4006B; Thu,  4 Dec 2025 08:44:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATQuLOOSbBJB
Date: Thu, 04 Dec 2025 14:44:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 "Yulin Lu" <luyulin@eswincomputing.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <1722bf4d-2974-4b17-a333-515d4242fb90@app.fastmail.com>
In-Reply-To: <aTF6ai3PCK6B_EJI@smile.fi.intel.com>
References: <20251204095024.1031947-1-arnd@kernel.org>
 <aTF6ai3PCK6B_EJI@smile.fi.intel.com>
Subject: Re: [PATCH] pinctrl: add CONFIG_OF dependencies for microchip drivers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Dec 4, 2025, at 13:11, Andy Shevchenko wrote:
> On Thu, Dec 04, 2025 at 10:50:14AM +0100, Arnd Bergmann wrote:
>> 
>> The two newly added drivers fail to link on builds without
>> CONFIG_OF:
>> 
>> x86_64-linux-ld: drivers/pinctrl/pinctrl-pic64gx-gpio2.o: in function `pinconf_generic_dt_node_to_map_all':
>> pinctrl-pic64gx-gpio2.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'
>> x86_64-linux-ld: drivers/pinctrl/pinctrl-mpfs-iomux0.o: in function `pinconf_generic_dt_node_to_map_all':
>> pinctrl-mpfs-iomux0.c:(.text+0xc9): undefined reference to `pinconf_generic_dt_node_to_map'
>> 
>> Add a Kconfig dependencies.
>
> This will reduce the compile test base. In other drivers we usually put
> ifdeffery in the code.

I usually prefer the Kconfig dependency: It's still covered by
both allmodconfig and half the randconfig tests on the few
architectures that don't already require CONFIG_OF on all builds.

      Arnd

