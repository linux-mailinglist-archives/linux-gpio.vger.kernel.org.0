Return-Path: <linux-gpio+bounces-28050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFCC3318D
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CCBAE4EC0EB
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4491C308F2E;
	Tue,  4 Nov 2025 21:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UVf5Ug77";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="d6ee5Rp/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FEA308F25;
	Tue,  4 Nov 2025 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762292483; cv=none; b=W9+dpDSuJc0pEIH3lsZpvz2RKOpj9HYm7BGXsRtxl3zM87Q/+TNHvNAC8SEkQm7wMomnZKVeSnhAcC/CDi2DjcsXjOZmEik84qF48+5fmvXrMIPGNx1F36KvxB4uqsHTe8qKwZDqhIUoYCr7vbqZPDDIhVhz7/zy2lZ2+BikDY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762292483; c=relaxed/simple;
	bh=R+uXzZS7et8jtPMvIVza2OCwfCozinUmID4WDU8hp0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SKTuB6SfBYfmNxTfYYeZio4ECIiowXNOQ80Yl4RTblHc3T5+Sl17Utrs4kmGDDFEdQcu5ciYYlr/tAeV94a52F0Mp3slYjO0OpKGFmuqWSbuQW2ElTSsmXgG2Tq+Cm+eDw8MwvMoJFEUBhMkhGeT4zeU+izjuk7hGaqhSoYz3vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UVf5Ug77; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=d6ee5Rp/; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d1MMs1gBcz9twj;
	Tue,  4 Nov 2025 22:41:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ga8pA6Z9Y8RsqRmUs7aEnRqbWo8RnG+Y/E84d6N1WU=;
	b=UVf5Ug772hy4P602BqQMOVNtOJHwWZ5W4j3V/lE6h2tnbCSNKevLPhvFaF/KWMB3/5VE9z
	i/Gx4HCVSQBmEZXw7+7ZiHOnZHdb+3DiJrHtP1LCKDb07E125ZfxH/MiAIOzEjvcj2g+qT
	UwQBHxmq5ZAF0UyX8FR+bIriuyGSYo6P7qhDFZgSOL9mGaENfMXGvXfvcZPaXEvGD2GZV1
	6a8egOE4Mi6VqokSKCv1FDcs3ReN3l/oHwpIUY7GMSPohiXQjX9J9QqqkcdFYToxSW8k5h
	07p+kkyMR/wgujS3YXU97qS9gr0sY1AfigePBSD+PFQQb+6lfgl9E3QiHep5hQ==
Message-ID: <c9646952-1789-42eb-b7d9-b12915f77f07@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3ga8pA6Z9Y8RsqRmUs7aEnRqbWo8RnG+Y/E84d6N1WU=;
	b=d6ee5Rp/Dlq6aDqgb7F2BsMXFaj37I3Z6oGRxMw0cgtnAz9y69mqLJQheAoQ1HR4VZH9s/
	H9U3LuB7yn1ha44mVMnI54ahL7xNe9l1NIY9H7mxLxfsFTqdc0YCa8Af6bg9qev9v3r2sv
	I8CNj4E1Uur2E865wu5jpKpz5iZgcfGpBp2kKeGKMD3sSDJm52U+uJNEBMpiAkZm//Rf0x
	wUEzKJQOPdLm65K3HCTEb8KGs5PBgLWRIhg5IIbomApzbCAj1aojswQKubMEVzYMOJzUbI
	xAO+Vo1SRcaADzLXVGq1MuNgR3deK123AdqlnoSoKmAgOoD85UI/adsGyrV8xA==
Date: Tue, 4 Nov 2025 22:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] pinctrl: renesas: r8a779g0: Remove CC5_OSCOUT
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 huybui2 <huy.bui.wm@renesas.com>
References: <cover.1762274384.git.geert+renesas@glider.be>
 <77f9efe5388f2801ace945b7793d4823618eeec8.1762274384.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <77f9efe5388f2801ace945b7793d4823618eeec8.1762274384.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 75cdxuguoagtef9ipr9ahgr3i6498trq
X-MBO-RS-ID: 6c0607277e073a5143f

On 11/4/25 5:59 PM, Geert Uytterhoeven wrote:
> From: huybui2 <huy.bui.wm@renesas.com>
> 
> Rev.1.30 of the R-Car V4H Series Hardware User’s Manual removed the
> "CC5_OSCOUT" signal from the pin control register tables.  As this is
> further unused in the pin control driver, it can be removed safely.
> 
> Signed-off-by: huybui2 <huy.bui.wm@renesas.com>

The real name is 'Huy Bui' instead of huybui2 login name.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Also, matches U-Boot patch, thanks !

