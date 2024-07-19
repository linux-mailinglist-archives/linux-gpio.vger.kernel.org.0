Return-Path: <linux-gpio+bounces-8301-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580F93792C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 16:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21078B22931
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jul 2024 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5575D13C9A9;
	Fri, 19 Jul 2024 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="AYVua/4p";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a5DOEbLo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AD213A276;
	Fri, 19 Jul 2024 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721399323; cv=none; b=EL1GQxPuzvq4RKGY7m+WwcEZ719GK/oeZ7OEew3HBgiHJJSZZkgujTm6W2mMfTeilocQNBHEGpEO7PHcy0iBuhB9+ZfVG7GPJBYVbuN3KRwt9q+OTjQpM7dLJ+CZ9xjfcYq0GUvo4Cfh8nQpo8V7MwLfSqf954P55VgbA/bZoIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721399323; c=relaxed/simple;
	bh=Q5pEgfoCAEfPn65D1Edhv3nv4mJlq8u/D5GWu9IsaMY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=e4jaLw5S8EXsyV51OfGj2SjqQXEpcOMPKf90NZ4F43dAz1uWYe3G5hBuT+DVqvDcvYYip5nWqfEF9yK6vL2AHvwx6GRz3SPqQ0j+E6tNe8LsP2YTPNgKDT1OSpoiJMFmkSVh+NKY4jFurOCCfsKw5veYNx/56AgILGErbk1r2Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=AYVua/4p; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a5DOEbLo; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 90E79114041F;
	Fri, 19 Jul 2024 10:28:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 19 Jul 2024 10:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1721399320; x=1721485720; bh=bhvSkZSHl8
	ADtIu3P4Tnc12yAgEbjmTwX2H+8v6xK5o=; b=AYVua/4pR4+huSwXu2x8e9J0h2
	I0Shqnp2P4oaMtufMbd4j839HpyjrFuoaZzXepBydFpO79bJ+mDMjXqOaTZqK1Vw
	LQ6x3+62dydl7UnAW8Cl6ID51sXhd9JmMJwfOIRQRSeSY1HF9WQG6kjO1p4ArM/v
	aKu7PNDrRIHw1J9LCF+6+BJrRd11LZRgUJDA/KSyHvVH0A4UdgfKJ3T8B+rdYJR5
	NKQ9Izz40afwzg6ArTJiDZsEO+wJlehaKmDDUtLKOForgehwq3lEbZF1E96N0m1L
	ZD1SeW+R+y5yuiw8HIMzs9kkbkaDMUzD/t/WwNdZsPx7ms1k/dvfxuS8TzXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721399320; x=1721485720; bh=bhvSkZSHl8ADtIu3P4Tnc12yAgEb
	jmTwX2H+8v6xK5o=; b=a5DOEbLoMU++/MDpGNMdlpYCoQon5kQwSYSR+tBWmT6I
	nV/JbxJV/n8hu5JzYDiyOD0cq+Ul3hLH2YvxQkkfT+NGYwOvZfhZdJ4MymZ2C0Pd
	CWnawY+8ExxO2ZovLxS95tRPLmCG406rjHTgoKuztDCZneHtvLotyyB+/xrMoVRk
	UYBNGE2/WKS4aMzp119/xnfwLKq2L7OQhfDLr4rTrXe/BZhxNIvkY7UWaqKHnuMc
	yvcFd5PbmDWty/hB7B2T6neaU2EwJ5e7URVsT62+DDmaRebdA4Pn+KyTuOKMMrh1
	6TVwi0Td6qgSizU18BTn07OOHhaPkZ+h3GbobyNSdg==
X-ME-Sender: <xms:GHiaZugsc5u7p67lGPL5GN3616P51zDMtg5g_mkvaaM2hPilh6DbkQ>
    <xme:GHiaZvCqOIhYsmOEpfl5qa--gF53e0UFlhQoZhE9lAVzgc-NhqUYazvetdpyEwbfB
    Nkvr-48ysJlCmqEW_o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrhedugdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:GHiaZmHAVJbd2ccc1RjN_KGTeKtj7Xqe8DLF4GB0WrV8wP4ArUKFjg>
    <xmx:GHiaZnR7POP1Rln5DD5KK_rWaP4vuBTQ9YRrxA7wW-Z26iBZHi2tZg>
    <xmx:GHiaZryM3rreny2hpCfLBYwiMlsE73oihYUvWWLaB49XnnGzvTkdoQ>
    <xmx:GHiaZl5wackd2Cad3uj7yVsbsutYUuPUcv93AdQli7piEFAh86xhbg>
    <xmx:GHiaZtsRwscn9wjSN_T12BV1y7nWBdDalGf9BG88Z0Gw7awfWTcKQ5DA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 47519B6008D; Fri, 19 Jul 2024 10:28:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <6eb7d811-5c0a-4d0a-84f4-57323fd794e0@app.fastmail.com>
In-Reply-To: 
 <CAMRc=MexLwZqoc-ymuu3OSu5YXcqdmfLuX88kK0uR_6WqHgp_w@mail.gmail.com>
References: <20240719114650.1551478-1-arnd@kernel.org>
 <CAMRc=MexLwZqoc-ymuu3OSu5YXcqdmfLuX88kK0uR_6WqHgp_w@mail.gmail.com>
Date: Fri, 19 Jul 2024 16:28:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: avoid non-constant format string
Content-Type: text/plain

On Fri, Jul 19, 2024, at 16:10, Bartosz Golaszewski wrote:
>> diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
>> index 0e0d55da4f01..c55b72e426c7 100644
>> --- a/drivers/gpio/gpio-virtuser.c
>> +++ b/drivers/gpio/gpio-virtuser.c
>> @@ -805,7 +805,7 @@ static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
>>                 return -ENOMEM;
>>
>>         data->ad.desc = desc;
>> -       sprintf(data->consumer, id);
>> +       sprintf(data->consumer, "%s", id);
>>         atomic_set(&data->irq, 0);
>>         atomic_set(&data->irq_count, 0);
>>
>> --
>> 2.39.2
>>
>
> I know this should not happen as the string is checked for length when
> it is set over configfs but while we're at it: maybe make it 100%
> correct by using snprintf(data->consumer, sizeof(data->consumer), ...?

Actually I now think this should just be

     strscpy(data->consumer, id);

There was never a reason to use sprintf() here at all.
strscpy() does both the correct size check and avoids
treating it as a format string.

      Arnd

