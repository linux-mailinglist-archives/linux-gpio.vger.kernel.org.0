Return-Path: <linux-gpio+bounces-28048-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C406C33178
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 22:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 891F4189E291
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 21:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D38CB3081D3;
	Tue,  4 Nov 2025 21:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lyGCJduA";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="a+7QEveT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4523081A1;
	Tue,  4 Nov 2025 21:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762292479; cv=none; b=D5QU32BdMx0oea19W2/IzqCUMksSt2K0eCIo6x/rhjqZxolAe3GRLsSSD3QdiYrvH0cmQDx3EvQI4DTp2KY9lhZUgPf/V3m7AoKuX4HSmZHKKLoluCUfq8zTnCF5hbesIWjjCZ25/IfPeF/wuvIwnyRGrFen1py8RQZcK9jeH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762292479; c=relaxed/simple;
	bh=lNfEVma/lURC8xJppfxrtD8Mfx//5qyeP21r4uf6iXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2S7SR7ntCXqRlTMQOFfACpv/FSgbLvGobYDjy6QPagoH54pv5kGj1THThrnnIMunGtGFHx6eaHnlFKkpftHsjnoPo1yKJ3JmMpvHIdRxBvMUQH6iZ8PQFmMXoJWwa9TA08IpSc99lZXrCjsjMMmKkbxuAByRCssFpaOENC+1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lyGCJduA; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=a+7QEveT; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d1MMt1zvSz9v6t;
	Tue,  4 Nov 2025 22:41:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQHQpchzb9fGGc97Sz/QlrXrNhxFD8EnhEgkqx0WZgU=;
	b=lyGCJduAsCMCHOaPEUaUqhmC5t0P2AjKZO/6f6kvgOEB0aAfgmNZdjLcPBjTtfJz8y+431
	ocnxuV08e1BdVB0J7/I4j7VcUU7gJElPrkyRNtbVwJsMWx+GAZ1eQcBdrLXaiupcGEqBgr
	AEA/VRYJKl+i5aiYxOdx3MbDABgn79id2Th1p3NGCvlyEQhUqyKhQtgPft8t+rixwfS7O3
	tcA1Gu3U7F5YJq5upTWQF0EKoiNcymbust4G2pvrbaVu502ptfuTdUD30VX6qixYAcjmiA
	mF6Rrxyd9UjMqSbwJMkqhiEptHTdqZt1DKHYurpWBjbczPoCTLdw0+Q3NMqmfw==
Message-ID: <428a59e8-2c18-4bf1-841d-3ead2c2c1cb0@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762292472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQHQpchzb9fGGc97Sz/QlrXrNhxFD8EnhEgkqx0WZgU=;
	b=a+7QEveT4abK0Ei5jrcVBMxn3agRcRlnDplkk4EtH0shTyaSu8N8wA0lXokJq8Aa1lQeDO
	L0D1PIrYKkHKGkNwWbJ4l21Ay1s8txmBZWDUUx/Wi2vCM2Mb6fBHlJu7NvlIGP4PYFzPSP
	MK+UG/3qY0/vKxkGYktTagU5JGHp+atJe0zR9C1unpOO7OKmQXTzf1bh2Qhy28cw1W0Avn
	GjDtgsDl6VjVmMNn+c+RE3SujOxgWHccNhr3porLazNto0FFZY5T3b+nhpze3enSbHP6Q+
	o49QThWvBM4D1HErQ+x/L4WVDglxC4+8Rb/E5EM/MNgc0HZZqwgqbh3D5MAKWw==
Date: Tue, 4 Nov 2025 22:28:12 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] pinctrl: renesas: r8a779g0: Remove STPWT_EXTFXR
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 huybui2 <huy.bui.wm@renesas.com>
References: <cover.1762274384.git.geert+renesas@glider.be>
 <f6cfdbbc024d85e87583a1d57ea01582632f1216.1762274384.git.geert+renesas@glider.be>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <f6cfdbbc024d85e87583a1d57ea01582632f1216.1762274384.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ubk88sj69h9gudypgs7a49faiiikhr4b
X-MBO-RS-ID: 11699eb1432590068e6

On 11/4/25 5:59 PM, Geert Uytterhoeven wrote:
> From: huybui2 <huy.bui.wm@renesas.com>
> 
> Rev.1.30 of the R-Car V4H Series Hardware User’s Manual removed the
> "STPWT_EXTFXR" signal from the pin control register tables.  As this is
> further unused in the pin control driver, it can be removed safely.
> 
> Signed-off-by: huybui2 <huy.bui.wm@renesas.com>

The real name is 'Huy Bui' instead of huybui2 login name.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Also, matches U-Boot patch, thanks !

