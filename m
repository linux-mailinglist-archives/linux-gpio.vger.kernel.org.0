Return-Path: <linux-gpio+bounces-28051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD2C33181
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A6E2346A38
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168A43090D6;
	Tue,  4 Nov 2025 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l7yYbptw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="L9dn5kfr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83DE308F1F;
	Tue,  4 Nov 2025 21:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762292486; cv=none; b=o2ISkKoQ/FGvNEe4dS4RCRvhb9iaqpsSwsYBSVCWpUHxnTDQTOhYLRIuJRwlwW2whrEtq4zvmzRXkunZorcEYDue534oWRUNieCut9SiMl4lqqQjXKa5ER4nEDZSQywrvZcElx8RdVjf8Q1NQL6s0ohbmGEYB5SQHNt6+g5YLVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762292486; c=relaxed/simple;
	bh=11gmXSqpLN3kGK5vTcUD8uyC2O/GOzIeyB28RcB2GLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0himLxDGT4HaB6QhBExxuq5KExnQLIF3E7PQ+qnVjBRwF9mrOGobA0UnXdr9Rz3uMsNc52OvW9Sd7QoqjOQn2v2wZUSeYTM3MG0NUNpGhdHARcTnDx83Pi73+uswUQGOJN1TXgnEdviJKO2rnCXHSVCABDcTJqcQHY7wpaT5WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l7yYbptw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=L9dn5kfr; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d1MMv2CSJz9tpH;
	Tue,  4 Nov 2025 22:41:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmkBlEC0NAzEk1anfTl4bZTTwlok0JGZTqXgBlFPVzQ=;
	b=l7yYbptwmjFaBvpfDcNmw4BmyQHz+bkstMK8J8ofYbNk5EVmD19oTyyTbYLZeS0AdUagRm
	xUab+3m3VkoLeoipTFMrrLg2NTV0fDnbMfFFym2FPMqMG4i0Cn25//qjTA0JmM7i40Dnaa
	CrQkR78gco2dGTm4o6JQfkhUAImij/QsclJeNYMHvQftJ4xJ6qWgB5Z60uwLKxhwa7gH88
	Udkshup/YCiA0Q124Wlauz8CdU7bPEUPsxYt3ke6dTt4dIFVzVGgT3didJZBcLQW5b0mDj
	cum+efrlP6BNv66JmGbWbGRxK/ihKsdTMcqEc77yCTaeEDYhYJw+umWOJg9xNA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L9dn5kfr;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <97046d21-d594-4fda-943f-153c6b75e963@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MmkBlEC0NAzEk1anfTl4bZTTwlok0JGZTqXgBlFPVzQ=;
	b=L9dn5kfr/qBxU3lwhYtMV3jGF4EpglgT3Nm48DXcHv7Pwo2vinWuhx+2hobzsEkk39VcJK
	BB9lxwJjy2uqEcvWA0x/Av05QlIHZm3jkp1cSrVUUo+XDOvKTExSD8bm5ATGBleQgkK7eu
	aLklRRq6ZNLr6SMQOwxFpRx3dMoOJQ2mksbtyC8C7VL+CoB5TxTddVlNiRoI8cRI8PibmA
	7QrNXNAo6MSkBjP5WqqoA9cR1wTkNO5czlUq9uRTLJGBlXDTBQfs50g1o0ZkEn+lyArO8y
	ObMmgxH8XCG/jE64hF/u6Szq/IVP8C3SdkOXKAdC8wr5D4ZhkoNHYc0r1qFecA==
Date: Tue, 4 Nov 2025 22:28:16 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] pinctrl: renesas: r8a779h0: Remove CC5_OSCOUT
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 huybui2 <huy.bui.wm@renesas.com>
References: <cover.1762274384.git.geert+renesas@glider.be>
 <895bb560467309706931d14aeea0e063ad0e86eb.1762274384.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <895bb560467309706931d14aeea0e063ad0e86eb.1762274384.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4458c7d3fdb519d6b2e
X-MBO-RS-META: ej9ry7o4axckpp9s5xykx67ys4jpzfyb
X-Rspamd-Queue-Id: 4d1MMv2CSJz9tpH

On 11/4/25 5:59 PM, Geert Uytterhoeven wrote:
> From: huybui2 <huy.bui.wm@renesas.com>
> 
> Rev.0.71 of the R-Car V4M Series Hardware User’s Manual removed the
> "CC5_OSCOUT" signal from the pin control register tables.  As this is
> further unused in the pin control driver, it can be removed safely.
> 
> Signed-off-by: huybui2 <huy.bui.wm@renesas.com>

The real name is 'Huy Bui' instead of huybui2 login name.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Also, matches U-Boot patch, thanks !

