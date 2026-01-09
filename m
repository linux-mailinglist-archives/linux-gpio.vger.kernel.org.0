Return-Path: <linux-gpio+bounces-30306-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97716D0727F
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 05:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A46FF301C937
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 04:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310F42DB7B7;
	Fri,  9 Jan 2026 04:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="cUzQzed1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EFD1A9FAF
	for <linux-gpio@vger.kernel.org>; Fri,  9 Jan 2026 04:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933782; cv=none; b=MF1zEAsjDmsK7cHH0AZYKn9lWPo1EqwJJKDsMrvfLx5ddl1OYPUWLkEZCy/whiOb1ugOjDwzb/MhSIgXgJgcc/zhMt9xC3WTEhXd2/YdovnaIzRLX2NbKBvv4R2ZjZLGuLJTtfqtpVf8wWhNWa6bmuvPQoSHEJFX9sZdcpGcQ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933782; c=relaxed/simple;
	bh=cDneNoCFN2NHmxddIcc/AQdk3UagosSbIU6XVkEQ2nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qS2yjSqy6aZPzzXQ8izAQuW3Ux3aNh0qrckl+15Hgvm3DYZmoOpiPCxuusT+t39vUqU+mwXwRPZTllOpgHsjX3GozFvkwEz7H0YFWUknpN72IoK6Rvv7Bxvp6K/WDQGmglA5w4ShgBk1Cd9Cag0c4MzpAEj7Zizck0XtDsKeH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=cUzQzed1; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <2dc9a9a3-2af7-475d-bfb6-9741ac0f2790@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1767933769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ONG0/w04+VGe3YstfLMfJo0O9OcN1H5ybNV55QqrJ9s=;
	b=cUzQzed1CwEqPqkLlNZsF4jKYG/kbLPEBa8qE/LOOtZzU+A0LUzfYWq6TNX7grj9v6YOLO
	JIzAknWIfuGlbsYJG3mLHuB5hoZNEn/IdPPihbFZhaXGtrxwbDyXsYpAyNtSvaG0uqCYoz
	cKAc4WsivF1edNppSA1Gd6xlocMbDapnuiyFz5+HJpAxYjlfe1NLSWTg304lfFuZrd1kZg
	X+piNf8H9vaZC536Hynob1zdYyvDUyi0q2FdG/syIlxcxpxt5nvcDgCkZF/jhG3YeRiHRn
	IJJl1W2xvzhu+tHs42Wr5fLZwqC32dlKZvScVZpPGS1PoOvsbBbQxfvWObstMw==
Date: Fri, 9 Jan 2026 01:42:43 -0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] gpiolib: fix lookup table matching
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260108102314.18816-1-bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 1/8/26 7:23 AM, Bartosz Golaszewski wrote:

> If on any iteration in gpiod_find(), gpio_desc_table_match() returns
> NULL (which is normal and expected), we never reinitialize desc back to
> ERR_PTR(-ENOENT) and if we don't find a match later on, we will return
> NULL causing a NULL-pointer dereference in users not expecting it. Don't
> initialize desc, but return ERR_PTR(-ENOENT) explicitly at the end of
> the function.
>
> Fixes: 9700b0fccf38 ("gpiolib: allow multiple lookup tables per consumer")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


Tested-by: Val Packett <val@packett.cool>

This also fixes things on Qualcomm x1e laptops (same NULL deref logged 
from snd_soc_wcd938x wcd938x_probe, but as a consequence the display&gpu 
subsystem also wouldn't work)


