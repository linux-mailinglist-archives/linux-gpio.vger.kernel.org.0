Return-Path: <linux-gpio+bounces-22395-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47384AED61D
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 09:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87E0F188F06C
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Jun 2025 07:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1922367B9;
	Mon, 30 Jun 2025 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SNxOXlQZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a/d4+f4m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197E1E7C10;
	Mon, 30 Jun 2025 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269744; cv=none; b=dsHV8HSBfUI50s/24T4M1fxQ71ELGivvqj/GJdtEBJzH5yYPPqX9PtOWd7s0+MhpGSQ6jYEnBsYV66ZFJfhvviJYSCnwACgvhOadQ42UbrqnhftSCaVKEnfx15y4SNwLWzk2UL45ueaDyP51jHCFW7J980dpEXhAdqaPlDWKX4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269744; c=relaxed/simple;
	bh=2ZqCOQCDU4e20dlPkgw2JsI4HO3iLuuInFCI+rMWS6s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=S7b1cKhpBaXGNSFiNJ20lU9IHVomQCkcjhKb+a0Hr8PmIHUIcK9w3RZMtWSgESZjM2dqbDDMImbwbOykKluvFiELkgIc8lwVXwDDxdzQmcVwlok+cqBAWQUcI40z7BVyvrgk4uFz9KI0TnRc7Jte1VPjpOhW9lNPaQ2VI0h86lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SNxOXlQZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a/d4+f4m; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6D01E1D00161;
	Mon, 30 Jun 2025 03:49:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 30 Jun 2025 03:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751269740;
	 x=1751356140; bh=2ZqCOQCDU4e20dlPkgw2JsI4HO3iLuuInFCI+rMWS6s=; b=
	SNxOXlQZyL9Oq2I4GRpokV8scZvw8Z38mDYuhwKSD99bLH7i0Pueqw86g8BW410b
	YIeN59Aa6Op9VWU9QbiRMEpTl/Rbz7svK7a0DqS4eJgl8xVSEj60lh+daJEVo19i
	+d5DFxiCxVn98MWLneFfWiUaoN0mIyk8A7bVSY2a01e7IuftxljMX49qWMvNpZUk
	oeLtWASOC4q17oNfrzUoAEkSaZgO0aGu9dQuUxzL4tssLyvaxeGIP+TY2CAx7fIa
	JQjac1mKzK8Qh7IUdTXiCn/AEIaSC/ekHxEXcuxxsn6/TCRN/xJbDmazBMcDI5T2
	YKCt9oeri3Bx+OCfkGQQAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751269740; x=
	1751356140; bh=2ZqCOQCDU4e20dlPkgw2JsI4HO3iLuuInFCI+rMWS6s=; b=a
	/d4+f4mnM79Y5T+pzVKY9v7swzfASLL1RhmWw/fmy99YfsLOdqecBMd2StFIfbr2
	fkmAqFDMZyi3bA6B9a4C+J7B7kNGRH6BvpRjoLFYCrr53VNjqDkVp2Bsb5KaClsp
	eyr/jPYmXchvIjU5USKUws6lFizcsnUp1ruC94dVyM5VBCMcY3QDjDAgnBrV7+D0
	Fhri/sbpMIOdT/kCoQctNStsJ+An9ahL56aAg5V3D2/f5T6ka0sXkoxTIpTzW0Vb
	Tbl84RB6qhy/3F1r8WempqEXkmlwTmTfpeg2NxubtU/HmPh6YWiWuznoSsCuXUp3
	9/Sa8ZPhomPBKtEGUjKIg==
X-ME-Sender: <xms:a0FiaGTNjN3ACZ9D22CF-KPIfVnbRFg0yOTF158rjy905thge8t70g>
    <xme:a0FiaLxnoS1FK-x8eTLoWBlkXNXr7U0ZwOLjjvCvZIIAY__MvfEjcWhIOnVBM-dvD
    KxD2Bs7a8h08-4nyHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduuddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedufedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhprghnihhssegsrgihlhhisghrvgdrtghomhdprhgtphhtthhope
    hlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-ME-Proxy: <xmx:a0FiaD1rnBFWt5xL9tPWpOAN7t2DBqECvzHvLM_dmWOU02HPAeaWBg>
    <xmx:a0FiaCDjEQ_mpBPR5EYgnc4qf72UqASCVQhcio_pLTBs3LLgIx2Kuw>
    <xmx:a0FiaPg4cNpmsoDZO7RGwQ6CcT7Xf7pyP_yNHFsdJmQ06AdtgBTIUQ>
    <xmx:a0FiaOqtfepci8NWB5LSgfmMmys_s6N4UVyKH-tVMMWnTqbkw6eP5g>
    <xmx:bEFiaAei7bwcu6KxSqfZASuYasaVExh6rkRioyW2b6qStGYue-yvhl7B>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D3B23700068; Mon, 30 Jun 2025 03:48:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T53991f9249d0193f
Date: Mon, 30 Jun 2025 09:48:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Walle" <mwalle@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Julien Panis" <jpanis@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <c07229ed-d4b8-4e5f-a518-ea9d703fa617@app.fastmail.com>
In-Reply-To: <20250613114518.1772109-3-mwalle@kernel.org>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-3-mwalle@kernel.org>
Subject: Re: [PATCH v2 2/7] misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 13, 2025, at 13:45, Michael Walle wrote:
> The TPS652G1 is a stripped down TPS65224, but the PFSM is the same.
> Thus, handle it the same way as the TPS65224 in the driver.
>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de> # drivers/misc/

