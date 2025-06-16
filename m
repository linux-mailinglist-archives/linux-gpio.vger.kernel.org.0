Return-Path: <linux-gpio+bounces-21656-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24DADAB2A
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 10:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA35E3A71F1
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Jun 2025 08:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10E526E149;
	Mon, 16 Jun 2025 08:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jrHj06No"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210411BF58;
	Mon, 16 Jun 2025 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063916; cv=none; b=OobsTB2PfvZamgahAGbZdchIxwAI63Wp15ojSXEaEonz2EJFjfDSxSZjPr4B3YNyophIyrpyEe7feMpJpoHYfTlkCOgFNV1rCIPFJRRVsLckX4TBW1IPFIqzaGlkwiG/n3TjA/W/nffKHoXDjKHroREfW2CBJ4ZUI7gqZcaiMAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063916; c=relaxed/simple;
	bh=inXjClZ8KCAtFIEJ83Cvg/hIv2lal3GwBdS/NVkTN+M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FjuZBRaa94fY7IA8JgbK4RMpCFQiuZUUpCFipLueSVq85DH9iZfPvNV26GK2RM7h+HTYgjLh4Z+0Gw+24E/14M8iOHIEIMCNg2R7dlbYS1x9prGPTPj8RxFNaDr2Y0ZtnyL3d+3nwkrShdUH4zsII44tmb+uStVkGD7+jnW+Syw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jrHj06No; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB22543288;
	Mon, 16 Jun 2025 08:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750063905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8vR4Mo91o9W5Rfe7HfmnM13FB8xa17YYmej7HRSfPgE=;
	b=jrHj06NoqICbL4eSH/F0XmoLjMCcX8qYiJkPp8/S8yBzBsIDdROZHs1rGW4B+shClDr5w5
	4RWRcVwWqVSO0PfHdEvLs5hsWzKMc7vDEiryjiC2VVpeEfxzqacLra8GQHJifQsKwef24G
	lOb/OfPm00KTLCVwFCDYY49oISkgbZC3Yn0WPaanz39h0eevLhgMFf7yi66ob+fpIe2UZi
	3TCnJ6LYu9w//ZzMlHckkQm0odx+BU/c/h9/cpGWkAZxqKxYDbj6dvqHeeOTbPQPlCAUWE
	swSjsHxPZH96i/qiprto9lJhdqxJZ8pFDBehvlDOmAsgQuuu57tfv+TFqIhHoA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>,  Shan-Chun Hung
 <schung@nuvoton.com>,  Linus Walleij <linus.walleij@linaro.org>,  Steam
 Lin <stlin2@winbond.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-arm-kernel@lists.infradead.org,
  linux-gpio@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
In-Reply-To: <CAHp75VcfaU41FV-uN=82GdUqRadxYc6XaLX2Hr9x-4RfAV8CEg@mail.gmail.com>
	(Andy Shevchenko's message of "Sat, 14 Jun 2025 00:07:51 +0300")
References: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
	<CAHp75VcfaU41FV-uN=82GdUqRadxYc6XaLX2Hr9x-4RfAV8CEg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 16 Jun 2025 10:51:42 +0200
Message-ID: <87tt4gnk69.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddviedugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepledprhgtphhtthhopegrnhguhidrshhhvghvtghhvghnkhhosehgmhgrihhlrdgtohhmpdhrtghpthhtohephigthhhurghnghefsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepshgthhhunhhgsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhmpdhrtghpthhto
 hepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqghhpihhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Andy,

On 14/06/2025 at 00:07:51 +03, Andy Shevchenko <andy.shevchenko@gmail.com> =
wrote:

> On Fri, Jun 13, 2025 at 9:13=E2=80=AFPM Miquel Raynal <miquel.raynal@boot=
lin.com> wrote:
>>
>> As part of a wider cleanup trying to get rid of OF specific APIs, an
>> incorrect (and partially unrelated) cleanup was introduced.
>>
>> The goal was to replace a device_for_each_chil_node() loop including an
>> additional condition inside by a macro doing both the loop and the
>> check on a single line.
>>
>> The snippet:
>>
>>         device_for_each_child_node(dev, child)
>>                 if (fwnode_property_present(child, "gpio-controller"))
>>                         continue;
>>
>> was replaced by:
>>
>>         for_each_gpiochip_node(dev, child)
>>
>> which expands into:
>>
>>         device_for_each_child_node(dev, child)
>>                 for_each_if(fwnode_property_present(child, "gpio-control=
ler"))
>>
>> This change is actually doing the opposite of what was initially
>> expected, breaking the probe of this driver, breaking at the same time
>> the whole boot of Nuvoton platforms (no more console, the kernel WARN()).
>>
>> Revert these two changes to roll back to the correct behavior.
>
> Thank you for the report and the fix.
> Can we also add a comment on top of each of these if:s to prevent from
> blind change in the future?

I believe it's fine like that, The difference is subtle, it is okay and
unavoidable to make this kind of small mistake sometimes.

Cheers,
Miqu=C3=A8l

