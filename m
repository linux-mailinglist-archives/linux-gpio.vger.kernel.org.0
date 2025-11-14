Return-Path: <linux-gpio+bounces-28466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A45EDC5BD21
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 08:41:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D3AD13555CE
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 07:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9466E2F6567;
	Fri, 14 Nov 2025 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BzOzY0cm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBEF2F60A3;
	Fri, 14 Nov 2025 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763106091; cv=none; b=mkZigQZ0AFSbyLQUv63kQT30rp8+NZ2fomMVrqfeqWue9UCV/zsvC3Vjwu9gVpEJX9pg9PMKBtcyl4D1ZkdHf7frQKCT7STYSs3W4xbPQmPcUWfMdEzK1XeovcNIaSSaAmjRvcR75T6VPlwKCTxbZAnoOXrWcn5oPhj/nfCdHVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763106091; c=relaxed/simple;
	bh=OiMeu0tamg27GyEN4OqG+CIznFFE/vebWRAa4Bsb4VI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bt4Q2SfwKEnoBhu/MKVHixOPOdLSalii7W0RuoVlHjZ/T28sWw/Zg83MUkKBdOgb0Djd/ijn2YXLdgH1xx9oQu2KRJS5NDGPkU6qU5pSEEb6DC01zQ8nQZLU5jmZFb/UsLuaCb02M/9vC3I0MJ9yhkcC8IMSSOKDMFkBrexXCuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BzOzY0cm; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D03E91A1A95;
	Fri, 14 Nov 2025 07:41:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3AF36060E;
	Fri, 14 Nov 2025 07:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1818D102F28CB;
	Fri, 14 Nov 2025 08:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763106086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CxtuouY15dmqdz/kBa2p3jgenEqmkhSb6ARS2BjXY+s=;
	b=BzOzY0cm5XVVH89LIadrgngMECdCBiRxbLBEJgcSAaZmZD4jIpm2NHjdxuVBrPEaEDMBEt
	85x2yfQs77oDEr0uVNJ1KOBWPFwM/euNkH5svXR1EgZJxX6xTGo1rR3hBTnOIMOt7LrGC4
	EY23c2JsZx79g7GI+1jZctghMUk9pGsirtwGum0kehtRsVCsHwGiZTnZJKCCwk9gg1X2vp
	2DQv6g9Eb/Ch6auJFZnAZ1GmK9VGEG01QhO0Ru72gvSY16pVHNZd+txE8hsvWt5Bx7daT9
	8oRAFs7yCwE++KQDQ0njMZU13yig2BsQ4qIwH8GIILqJNkORxx+6WlLW0MQQ5A==
Date: Fri, 14 Nov 2025 08:41:22 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Saravana
 Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, Herve
 Codina <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Hoan Tran
 <hoan@os.amperecomputing.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Pascal
 Eberhard <pascal.eberhard@se.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v6 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <20251114084122.01a0d281@bootlin.com>
In-Reply-To: <20251027123601.77216-1-herve.codina@bootlin.com>
References: <20251027123601.77216-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Geert,

On Mon, 27 Oct 2025 13:35:52 +0100
"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com> wrote:

> Hi,
> 
> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.
> 

The series seems ready to be applied even with the minor feedback from Wolfram
on patch 6.

Do you expect a new iteration from my side or do you think this v6 iteration
can be applied as it?

Best regards.
Hervé

