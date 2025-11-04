Return-Path: <linux-gpio+bounces-28049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 005C1C3318A
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 517FD4EB57C
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E88F3081D5;
	Tue,  4 Nov 2025 21:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BM7hfVP5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="q+GbOyBB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68B5308F02;
	Tue,  4 Nov 2025 21:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762292481; cv=none; b=l+I4N9VOSH88GY9XI2WnlOeo5RPedK82duzCD8x32SYRbVuu9KcVB9XD5HUqhJohjZyMoKNakNIaHM00L8FsWLKW1qqnojCyXPLjzGf10VuIHCmb6PmJXNTJnlzg8kkQ+HRpzRpmMY7AL+9savSc44rRM7DRyRCmvjvmndnVoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762292481; c=relaxed/simple;
	bh=g83/bToTOsooBRq9JXS5cOqV82JgHzDfQGzZytyDDbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoWbfxn57CBTjh3OUS3GB7LLtCRFs3EIKw+KLC4Z1j9Vi6/uxF0pWkYvN+y9UXDGk37KG7gJyx1w1LWABFsTlyqd7wJzVYngF6uPYaUotRIQz5Q12X3VXc0NLOHwsr3GF88hqkPw4miFL7yGuZIhWAegGCLF3ibRKEm5fjGSPSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BM7hfVP5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=q+GbOyBB; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d1MMw269gz9tg0;
	Tue,  4 Nov 2025 22:41:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9Go0ZoufZ5BxVDcxkMkj1K68/2rVPtRZobKBTruWCQ=;
	b=BM7hfVP5GxP3blNuRK0VHhIziymPBFnXLQcb7tT9qFtOPKCss6tHXEP87WE0MXmusRarBp
	euMg67mlRaPzoh94Gp/bOr7BJ+Ojl9/jCuAd+5QdErUlYzo/3WjxQK0InvzgRQBztgd7yx
	GUG+WMHem2uMTS66+Irack1ABir89D/ASnUJ2H/dnb4fRZ0Gsjkj0N1ivOR1sMQiiF1f0K
	BtQOS4q7/OQS5KQdX5ozsqVDX2doLJXdARhedxFFCblTrFRtE8zZrUwGxV8qyiOVrr33MX
	NiJf7ci+TMcZi3MC81vKmZ88BP5tpAp+G4umzOdFzAY5HQS5Bjjr67ySzI2ppA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=q+GbOyBB;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <ac7b6231-cc61-4a8b-b124-29c822ae5fe7@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9Go0ZoufZ5BxVDcxkMkj1K68/2rVPtRZobKBTruWCQ=;
	b=q+GbOyBBkHLgTIOoJ9718q2att3sz/UckQ0XuVIGBO5C9LrFDUIi5q9MR9lCLTho31G+pb
	Vla+XBf+kE6FxsEowbesMQRAxbZrUNS9agG/BPET/5KGRUC9qNMdzLiGgEDg74a79IAuWn
	hGkMhRYagJqkIVyeuFrP+jmk444vLA2RiWLUtkKe5s5I5YW1pVRBnqgBcD/pozVpCH15gA
	8o3aqfmDsGXwWJlrmIxTBLC6VkZHNZYjxw902Izy1MVZwXYONQd6ox1ntYpk/pF8wo186z
	h9SySZaQXYYiso8ORITMiRWVFy28LZch84WX6eM+HpEKb/GAx9s6Y8YpvDwKgg==
Date: Tue, 4 Nov 2025 22:29:01 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] pinctrl: renesas: r8a779h0: Remove STPWT_EXTFXR
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <cover.1762274384.git.geert+renesas@glider.be>
 <f849fa3b9b516e9dd04b45462b69f52225259480.1762274384.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <f849fa3b9b516e9dd04b45462b69f52225259480.1762274384.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: sstj4atu1hx85jajkr6jxrpiiwp1kpdg
X-MBO-RS-ID: 60f14b15e6306fb75e8
X-Rspamd-Queue-Id: 4d1MMw269gz9tg0

On 11/4/25 5:59 PM, Geert Uytterhoeven wrote:
> Rev.0.81 of the R-Car V4M Series Hardware User’s Manual removed the
> "STPWT_EXTFXR" signal from the pin control register tables.  As this is
> further unused in the pin control driver, it can be removed safely.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

There is no matching U-Boot patch, nice.

