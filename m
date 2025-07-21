Return-Path: <linux-gpio+bounces-23591-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B2BB0C66A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 16:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F30613AF254
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 14:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D521C5D6A;
	Mon, 21 Jul 2025 14:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="D8gMn+Uk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dqpzkqFJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24A7176ADE;
	Mon, 21 Jul 2025 14:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753108332; cv=none; b=lebVywO4grqesaHB/lMqp9qutBXkE2OP0/+Yy52ppLSvrp+pl+/VcX/sC2Ew13mA7uM3pbRcffTh9ymu77B4Z7dHTlNNoDVQwK64ulU6JyVzWsabbSp2UJHvSnDcCNRCLCkm68jnXb1Ue+wNjybv4OUIvjCR4ckJddJTNI5vARk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753108332; c=relaxed/simple;
	bh=pE4d2LeBSURR3ZsVuztA3qO4aVwxujLn3qVhRl01dLE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=iUZoQK+gFt/qLzW6xVl5GnT7JH6yQQx2dhny9EsTA+S7YTOjYwhGnvn3+nmf/zvcOrVlEYTdmH1tGJH/DctFQybo0stKYaUIKgIqBNJBJzZrNJGb1RY/OHDuguD+TCL7kUrl0idDikfuQuFrQg+xqP63MjGedGcm1kdLWDee104=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=D8gMn+Uk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dqpzkqFJ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 4693F1D001C8;
	Mon, 21 Jul 2025 10:32:08 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 21 Jul 2025 10:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753108328;
	 x=1753194728; bh=gMKNAupfMStz/V14NuXYIcF11MwYemPMaLcl28atUqQ=; b=
	D8gMn+UkuxGqmrnLQ8bKSYVeDWgcBIbWu6AQ3cAH8vk5ZZeoHYrQ2Pcez4NqUHyW
	keGowtEEmy/h+fGLJZB7U6oVrgjYq4j1f90Hdeg58Wiv6yS2D6kfWQR3hbjNyW9/
	SOWX53LBxhRhVUKVg3WsWwIOLj1L88dvT1nEN9eL+P+V4MYg8716mIUz4JjH6Zj2
	6zJtMfcWOd7afHBeYULRaqT0HZXAfe77NiqSKoFcrUffoGAgHuMXY4J5EOxDzrl+
	powGW0OTCDyRnzj4F20Rrq6QwrfkMFeYb35nwSMM/TVEBfXUXBSdu+/TbJCUnZvb
	duE8X8xA/x1gs6j7xq/5bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753108328; x=
	1753194728; bh=gMKNAupfMStz/V14NuXYIcF11MwYemPMaLcl28atUqQ=; b=d
	qpzkqFJ4nN223b4dzhJW/uWLduEPQJOVtqauWsi6LMG3z18YOFf8da+Thgqs6hpP
	H4TwLWJ1qt8hspX7c7MG/Nq9CK5v9ST1pElq2fjgAiXEWCoyWaF9u475yxVKcam5
	EtK9YvcUBVRKpYtVeojHMWOM/5kpxMRqq5kGAhyzc/+1A3Farq5qOE1Atz1uwEmW
	WOcKHUuf1AweS5eB/w7QDllMGUa3GnhG+rmsqYMZLT/eoR65aPpKzCdATaQxJ/6n
	lUkyXAG8tF4ePsMx+rDOVS7JzlMd0AYtoM7UBxt+fuWLiAHNl3HjSQ1eJQOe8mqY
	1UkTPfUY9le4me4oRoNog==
X-ME-Sender: <xms:Z09-aDjoAtbt4oz_hquLOelYW_hgx3M6__B8GSSDGjYt5jVrjjJLtw>
    <xme:Z09-aABMdafwrWxno0W-vFk2Iet2VVNakLnH87WDZ27kI6n0GCygNLSskDXRMwCj3
    q43b51q_U9LmU6re-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejvdeffecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeekvdeuhfeitdeuieejvedtieeijeefleevffefleekieetjeffvdekgfetuefhgfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihgthhgrlhdrsh
    himhgvkhesrghmugdrtghomhdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghs
    segrrhhmrdgtohhmpdhrtghpthhtohephhhshhgrhhesrgigihgrughordgtohhmpdhrtg
    hpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegrlhgvgigrnhgurhgv
    rdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjhgrnhhksegtrg
    guvghntggvrdgtohhmpdhrtghpthhtohepphhgrghjsegtrgguvghntggvrdgtohhmpdhr
    tghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Z09-aCOaJXULvBvv--IOW8a2yzp5R56DSAKQvyjkEmnC22NyLjA_wg>
    <xmx:Z09-aKAIMXXASTcUjjEauq50E7V1A-C-J-4qyc57zycYXV4qJifdZg>
    <xmx:Z09-aCXJjKsNb0OiDfTt1jzNPILfa04Qfx5G5aQCs8B2TMvOSZ7IiA>
    <xmx:Z09-aOdhpyzR93WWZFbPrLM4vIdzDHha7ZGCG6DUIfqgNQ5XWWh9KA>
    <xmx:aE9-aO3UqGV5yUTEmzfniPMEzUG6vhDrmrVmbYvdXHAs_euJ3YD_4gDq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 598F7700068; Mon, 21 Jul 2025 10:32:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T10195641ff6473d7
Date: Mon, 21 Jul 2025 16:31:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Harshit Shah" <hshah@axiado.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Jan Kotas" <jank@cadence.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Message-Id: <4f836d88-80a7-402b-9af0-f0d002e2145d@app.fastmail.com>
In-Reply-To: <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
References: 
 <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
 <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
 <06f00d05-b8ca-41fa-9e5e-9cee3cfcfae1@axiado.com>
 <7ddb77bf-173a-4117-80ac-d0f32bf067ee@linaro.org>
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025, at 14:09, Krzysztof Kozlowski wrote:
> On 19/07/2025 03:09, Harshit Shah wrote:
>> On 7/17/2025 11:14 PM, Krzysztof Kozlowski wrote:
>>=20
>> It mentions about the special case where "Introducing a completely ne=
w=20
>> SoC platform." we can submit patches to=C2=A0soc@kernel.org directly.
>>=20
>> However I see two different points in the doc.
>>=20
>> 1. Submitting patches directly to soc@kernel.org with email
>>=20
>> 2. There is also mention about the "Branches and Pull requests"
>>=20
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/maintainer-soc.rst?h=3Dv6.16-rc1#n186).=20
>>=20
>>=20
>> I think if we need to use this approach then we need to create a new=20
>> branch on soc and create a pull request based on the same. (with the =
soc=20
>> tree[1])
>
> You do not create branches on other poeple's trees (like soc). You
> create branch on your own tree.

Yes, ideally the base should be -rc1, as for any other pull request.

> You can go with 1 or 2, up to you, I don't know which one is preferred
> by Arnd for new boards.

Separate patches (1) tend to work better for the first contribution
from a new maintainer, since there is less to know in advance.

      Arnd

