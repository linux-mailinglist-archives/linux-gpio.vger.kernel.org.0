Return-Path: <linux-gpio+bounces-13649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 816B29E9435
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 13:34:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FDEF18820A6
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Dec 2024 12:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17917228CB1;
	Mon,  9 Dec 2024 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="HmsVggyO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1CB228CB3;
	Mon,  9 Dec 2024 12:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747559; cv=none; b=fV63zZnBuuVMBdn8Vxfgiqf+IbR0w3lVbTyCZWFL+Zi7MKAN4HLzizHaAO5CXNx9lJ4VMaoqXuVXAYJtvHEzayU7vmldzpEaz1yOw6IK9Fyhi4DFE3R/GP7aEK3QA+f9GSDCKif5ZDoS9t9OFa1H7Hvyoghsvsilc23n12jrdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747559; c=relaxed/simple;
	bh=eTL/Zz4CgiLwSVDJJZSIvMZWl9IFMTtE63Ql03tuA4c=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=pts3+k7XAHj/gsf8yVwINoB6EzKowc0BCLe2btwZAKTTE7EMn6Wb+nlZKBJhn7lMGZ6qA3TbJDCpws77TjdrgoUfiFW8RNmEbSnZUdumozyKrqk+4+KYmuoSuQ2m68vYrlfAx477MajVXeBr3EWeOnBjvoUVpSYd+yguPt1T1LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=HmsVggyO; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id 82C55605F0;
	Mon,  9 Dec 2024 12:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1733747548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fNQK0VC5hmdkf5xB9w2EQXUei7uJNRsiN8mjKgCeDE=;
	b=HmsVggyOYb4b6hCgAOoZTRkTYjnu9X2Mj1mGgv+WcHtMf7EKAtJCqImI3UsGf6tXhGFg+t
	yPWIWYJFPaDQFS3dBLz0v0ImNUHd9OA/hadfZ4wSk8zROQZA1WP3y0nrw8YRG4uUlSTcXy
	NiatFxMY57d2z2gD1NYj0tuRadkkGwo=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id D6DEF4003A;
	Mon,  9 Dec 2024 12:32:27 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 13:32:27 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: dts: mediatek: mt7988: add pinctrl subnodes
 for bpi-r4
In-Reply-To: <9b1a385e-da1c-429b-91b9-d5b5d6d5abb7@collabora.com>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-6-linux@fw-web.de>
 <9b1a385e-da1c-429b-91b9-d5b5d6d5abb7@collabora.com>
Message-ID: <4e0ace7c5a0766395f8801bdd2fcdbf9@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: b6b2de20-0394-48f5-9719-e7ee90c90504

Am 2024-12-09 12:52, schrieb AngeloGioacchino Del Regno:
> Il 02/12/24 12:00, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Add board specidic pinctrl configurations on Bananapi R4.
>> 
>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> Can you change the title as suggested in the review for the other 
> series?
> So that we stay consistent.

already done in my tree (and fixed typo in commit message) ;)

8e566779ee82 arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes 
for bpi-r4

> After which,
> 
> Reviewed-by: AngeloGioacchino Del Regno 
> <angelogioacchino.delregno@collabora.com>

thx

are parts 1+2 now ok?

regards Frank

