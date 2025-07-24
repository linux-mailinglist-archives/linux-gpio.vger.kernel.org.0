Return-Path: <linux-gpio+bounces-23799-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 135CDB10DBD
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 16:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E794E188A35E
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 14:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A3F2DE710;
	Thu, 24 Jul 2025 14:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XNJ3Fyu+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J1++5O+R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6471991DD;
	Thu, 24 Jul 2025 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367806; cv=none; b=l9kqb8ET3c4QUZn0nLSgXuF1Pc+9n/Su1o+urmEXyL7E7VSkAdcM2XFMKwzzxmgxK5kujzq2TWe7lMnzUq2zUAvjEQ+euj1CvSeG2ZstYTvU82bKejKgvuBQj2EOgo4+6EcmKADljtrIwgEAGse2EvSflAtrcouPK7CUl+gMnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367806; c=relaxed/simple;
	bh=77TBTh9ABtAAEq3tsuaWocaxu9QneF+toyez+6ZSLQk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KdFMbt2YHpayDgctUgLOpAGwKJWvuOq5n6H9nYE8YLZi+Mhqz8DLzULtK0DkrtGSHQQBETq/PYkiy45fsdlHZl6vo7NYgUrsjvc71ukHRSOiW9Bumoh2ezbWZSVrrKfvQKpp1cdGhHgy80oumjnMWjbz2TSzuCM9PaAho2rcnNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XNJ3Fyu+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J1++5O+R; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5376D7A07DF;
	Thu, 24 Jul 2025 10:36:43 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 24 Jul 2025 10:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753367803;
	 x=1753454203; bh=bM4y6d61jdyy6y1hRa3LUsatLw1ObMUGIZ4gnUWcA/g=; b=
	XNJ3Fyu+rYjmZimkRlBuiG9TzEoj9/08d2r5q2BLST8mdFLd85Wpz9YzmjTJov8d
	k2po54+dK4OZtGmAujGXpKMvDk4saH062GBGs+V1NtQSByVPH9rlSQsWeTlR4Lp+
	Xxu6AjQe0HuqXdi4lACM/IfNv4P7MZdmqXbufmawKym2AmT3hk7I62b4oXdL3ndk
	ZVYvMkQhETtdi8Oyq/uRzoFQdHTylz8MalnFCDw/jBvKkBIxS1+1CGI4eom6TbCk
	pevpt2hplnXMzYR3DQcHxE0RqoUEKHdsuOMBvui+9EiZAXKwXoA1WRDIpbjL1pTO
	VabojYbHQyGcwddYCuucSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753367803; x=
	1753454203; bh=bM4y6d61jdyy6y1hRa3LUsatLw1ObMUGIZ4gnUWcA/g=; b=J
	1++5O+R/qmVpGl0ZhHYRRREjo1e6zJhMhFjOklp1c3BWXEB83ZcKbUWXhcQgFO71
	SJ/fF0vkPpFSxoVlBdllxQihIu0iDOmHjwCpJD/KQMPYk7msClFd4LwBwRpfk8qC
	/TFLdqd882mklQzkvAr+SXwRXiuchWj6p/XbLAhPp9f2ekFDTNJo36OtKe/N6z4c
	H2ypIvSfsfGnSEdBGHQK2C0i9n9N2JdEihuze5Vj/jZcFE4BrI6FKS5mpLhDP8vF
	IPtoVFqasM2pw8MwlYYfc4Gim7X3HwqCdVdnTwgsLJdC+zLh4MFYnR1bKDdMTDTn
	CoCICxnp4fs2bLXe3RIgA==
X-ME-Sender: <xms:-kSCaCBR9dn7QvbNGt6M_L8jTVTckt31scXU6lkiibCQVN6Z82QwBA>
    <xme:-kSCaMhmzAV2qdtzHBOt-1QH0gzp40GUyjZ2iGA6BOW34W34qPLxLElEVUvGS0gcj
    X4lLwchEphqPA1cWhM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektdeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehkohhitghhih
    hrohdruggvnhestggrnhhonhhitggrlhdrtghomhdprhgtphhtthhopehgvggvrhhtodhr
    vghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghnuggvrhdrsh
    hvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrnhgusehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hukhhlvghinhgvkheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigr
    lhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvh
    gthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:-kSCaGy5D61IbA5CAJE7alxhXNC6XDVTTCIjX2Pi3deCNFmnh8S5eQ>
    <xmx:-kSCaIMcyeTIDPxrSB9oUhMItlKZZvLL1RODjU2nMY9uo3aFW3tGXw>
    <xmx:-kSCaFd1cGH4duRpTmxK8Hk5YCbs2No7Mnr1FxfpR6HLjka2697ljw>
    <xmx:-kSCaNQqbL111HfJ4Ca6XuiHNIwv6yJfvnMhgbZytjlHRurhTbRSjg>
    <xmx:-0SCaPVTp1iJWZOJfHzoUfC0FReHTz2S0DU_k7cVrQY0jGqbu2XDozm9>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B46B9700065; Thu, 24 Jul 2025 10:36:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T94b7864e561602ed
Date: Thu, 24 Jul 2025 16:36:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, "Peng Fan" <peng.fan@nxp.com>,
 "Lee Jones" <lee@kernel.org>, "Koichiro Den" <koichiro.den@canonical.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <88b2b76f-ab02-4d3d-9503-1122e9c2b538@app.fastmail.com>
In-Reply-To: <aIDu8McZRsk8xspV@smile.fi.intel.com>
References: <20250722153634.3683927-1-arnd@kernel.org>
 <CAMRc=Mejnr8UzN93X=CWcV5jDTt9-U+Nxcm3qb=6uVV0PMiZVQ@mail.gmail.com>
 <aIDu8McZRsk8xspV@smile.fi.intel.com>
Subject: Re: [PATCH] gpiolib: make legacy interfaces optional
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025, at 16:17, Andy Shevchenko wrote:
> On Wed, Jul 23, 2025 at 10:39:32AM +0200, Bartosz Golaszewski wrote:
>> On Tue, Jul 22, 2025 at 5:36=E2=80=AFPM Arnd Bergmann <arnd@kernel.or=
g> wrote:
>
> ...
>
>> > +#ifdef CONFIG_GPIOLIB
>> > +#include <linux/gpio/consumer.h>
>>=20
>> I want to queue this ASAP but do we really need this guard here?
>> consumer.h already guards against !CONFIG_GPIOLIB internally, right?
>
> I probably missed something, but I do not understand why we need this =
include
> at all in the gpio.h.

We've been thinning out linux/gpio.h over the years on both the contents
and the inclusions, but I'm fairly sure that out of the 173 files that
still include it, the majority actually need the consumer interfaces.

One thing I've considered doing here was to make this file only contain
two lines

#include <linux/gpio/consumer.h>
#include <linux/gpio/legacy.h>

then then replace all of the remaining users with one or the other
in order to remove linux/gpio.h completely.

I think both approaches are useful and can be combined, but the
CONFIG_GPIOLIB_LEGACY patch seems sufficient for now.

If you want to experiment with the other one, you could try
my whole series and drop the #include <linux/gpio/consumer.h>
line to find all the instances in allmodconfig builds that should
use that in place of linux/gpio.h.

      Arnd

