Return-Path: <linux-gpio+bounces-28052-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C7EC33193
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0CFBD4ECA3B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B203090D2;
	Tue,  4 Nov 2025 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cTNemU+C";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="YA7larxS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147783081D5;
	Tue,  4 Nov 2025 21:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762292489; cv=none; b=rrfI1j/BuMo4UaLG0I8PXIUtFsxeYsshqQTopYpoijUIZ4GqpT2DTeJWiKFyTJcKp2NLl96/2hRyuQYq08bv2TJVDL7vdxQD08nmoFksd1Nv8ioezHFX1A1ahwctoLcIKgTEYZiJyNCV/W8cS/ajfGv/3LqRGbAoFwhocaJpdEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762292489; c=relaxed/simple;
	bh=HdvOwTURcN+Y0jIPBnPtNvf+ZF1Eu2MKTIufBse9KMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cO+fNkr5VRy5Dks1ENAEDBh/N7+4F2o/gglnStijBzMq6+Fi0CXv7qN6xGv4J7teVqKHaT0ov/vqz8IYB0OCRL2MVhkxNuKYFYlI6K5u5G3SYOxqpxn0L/DlL5SZyz7+BaQABGlhPtuTh15cq1bKO7qQ8EVcOGN4T41mWEJ+LGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cTNemU+C; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=YA7larxS; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d1MMy4M6tz9t7P;
	Tue,  4 Nov 2025 22:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwISxsiZIpgo2JruIptJC9YsN/Gjx63l8rUlAYpsLss=;
	b=cTNemU+Cpoq+sOMVuN5xsoHhNJj31mPQ24J4Iz8p4HB2t1vymosxaJuV7fVOCvYSZh9ioP
	w1UU8vhuOVFS2PwYrIFIgBXW5R20ngMk98boqYuChfMZ8mIDkAaEFsQpP1mJo2tV5j8z+N
	1MVzI/3QH4aZqVz0X0pWOdP/yJ01BxAThfVLck8N+MdocMeg8XkECyFMI0O8XmrDzJSNbk
	2oe8mn3mbrF1GqPILWAsuIBlEVuWi+KM9QCaiMmU3vOER+Bqw6AqDMQ+TUnQD4GnomzVRU
	C1z6Ow5rzI1hKF+BKGs9h/BfsEv+3MFLolj9NGycGKzdzzQd4Mnva2U/WLkCoA==
Message-ID: <bd36edc8-2a74-40db-a21f-d420ef7f49f6@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QwISxsiZIpgo2JruIptJC9YsN/Gjx63l8rUlAYpsLss=;
	b=YA7larxSED8z6ixIQmL9rrL2maBhGbsppYvExCCcYUn8WNbVeB6HHseLlkpJozyheqT9wD
	UYQgnZnXyw9q0xPDO6eJs3nup9BgZvonpc5qHTAIK/+N4tNEAa5SzagP+BI7dLgB8EzHGH
	l3wESP7+UmBUMI7DXwAvGaA+0fXFsU8K58JwURkiJGkxggeRGt6qvq0e+AKVVf//ZPySBV
	FcBmy5GsHftAvw2R0voVNCcIxJB0IYzTUCVcsf+fgH0Go+cCQtMNuAZL7ZeBbM67TK0EKY
	DKslk/xCgRuY6869u2ba21Epz9bJ6LorMr4gRycgXs4uJA93uboB6ECjT05N8Q==
Date: Tue, 4 Nov 2025 22:32:48 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] pinctrl: renesas: r8a779g0: Remove AVB[01]_MII
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Thanh Quan <thanh.quan.xn@renesas.com>
References: <cover.1762274384.git.geert+renesas@glider.be>
 <58662f50136280532bcc8bbe94741d82425bd118.1762274384.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <58662f50136280532bcc8bbe94741d82425bd118.1762274384.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8bn7j1ynpmmyjqsronqg857gpg8xk1wb
X-MBO-RS-ID: b92e1bee4370f0ac70d

On 11/4/25 5:59 PM, Geert Uytterhoeven wrote:
> From: Thanh Quan <thanh.quan.xn@renesas.com>
> 
> Rev.1.30 of the R-Car V4H Series Hardware User’s Manual removed the
> "AVB[01]_MII_*" signals from the pin control register tables.  As these
> are further unused in the pin control driver, they can be removed
> safely.
> 
> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Matches U-Boot patch too, thanks !

