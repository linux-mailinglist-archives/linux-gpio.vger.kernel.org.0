Return-Path: <linux-gpio+bounces-33277-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A4oCOjwsmlaRAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33277-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:59:20 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B227633D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68AA2301AFF6
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 16:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFF33D905F;
	Thu, 12 Mar 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SQ1v4f52"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B913F389102;
	Thu, 12 Mar 2026 16:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773334673; cv=none; b=HLBsb5XX/AP1FNl60uY/Cc8Ott+x8kg0WeRh3rJkcNfg357h3n+pSKaTkWLKeHxc6J9exR4kjCQ7aepPoXjLHTMQVZZCHYX0CDgM96EJlHeuT+TPNr9j/hn9vmQk+bK/O87imuJaE6ihYkrwgnUm0J2WiaCMHrD1ENperQFVQQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773334673; c=relaxed/simple;
	bh=quULCrgaVy74ulCzOnaMVUemMcBZcD8XT8fz8+dZQ+M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jpt2pI9LPiHcWqIdZNvS7Vq3CAiXGrL1FJm4G9Zhl58YzEb59ZZLP3FYTMYNXOjM3SKovETsMO9Z7xJ8bo1I/CdD8A3jORE81KMQGUyCoLRiwk3AKVYps3RKL06coOkToQeMU5PJ+GgSDWWdDpbyb4gpD9V8x59r7cyJgtfhssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SQ1v4f52; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B5364E42654;
	Thu, 12 Mar 2026 16:57:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CCEA76001B;
	Thu, 12 Mar 2026 16:57:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3F8F10369E47;
	Thu, 12 Mar 2026 17:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773334667; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vS8X2riZtgrHyxWXASjNfEHibRP7mKkHwfCf+Jt/BxA=;
	b=SQ1v4f52iXK3NEXVc/weoa4K/Lr9SChaeUnBKEpBC/kH3hVXJM5zdDVDOrsjhINrxX7w22
	xIqsp/HFai81vs5xKVxVDaluGoO7zHD6Vxc40WcwFkf14ZaJrxT1mTisZkvdkWd1LVtfeh
	KSuTGht3b4Du67wkimH2z8F6dF8BgSLGMnMR9P6yySITBdlgEOIqDlvx0nv4ats8RCCpHe
	QwqgaDv6CdMhm6Ls9KeSGkU9FcEEP7ewq8kwfSDJKjG5ckmeho5Z19ikuPVB/HpzmCnJZ/
	OSgRaWLsipqEAYw4DBjuQ3dLQ1jz8MHXYNYzpaeZhVlTXd5N6lg59dJGvO1GvA==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20260312085258.11431-1-clamor95@gmail.com>
References: <20260312085258.11431-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v4 0/5] rtc: max77686: convert to
 i2c_new_ancillary_device
Message-Id: <177333461371.2685487.13502330713409047469.b4-ty@bootlin.com>
Date: Thu, 12 Mar 2026 17:56:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=561;
 i=alexandre.belloni@bootlin.com; h=from:subject:message-id;
 bh=quULCrgaVy74ulCzOnaMVUemMcBZcD8XT8fz8+dZQ+M=;
 b=owEBbQKS/ZANAwAKAWOk3DBscDoyAcsmYgBpsvB4mskbF2LyV9MzarnuQhANCw4BF51L7RVBw
 BcBQ7Z1wmaJAjMEAAEKAB0WIQQGqwVVleHyz/Q7kmJjpNwwbHA6MgUCabLweAAKCRBjpNwwbHA6
 MqlwD/9qPfYJep66aTUNrqvSHobgG4YcpdbC1g6fiQDoIw3RB/56cOzEtrUZSuk3CIwQ3ufOsLT
 TvV7497LLMCqQnuYRzXjrH5o03gfkuLP6A2YfIJZXXrnsR3LpMeXAm//MMoblaagBf976UUxkNU
 bdaLi+PkihpjFiQSGdM4uofJlOuLvGw91vrRLtwUGdMaaTmV64la0wYd4G3ZNHaR5UsMDf7HKOa
 IDKtGsQyiidUYBZmqn2c3kmj8adOjNZcSnMrmvvrkaRphClZFsl8qAsPGjYw+EBr3LHuRKJpybm
 wpbcW+i7LQWpXVWXvE5sly174hxhWnTC5smFlkZcLVGnYO81WcEOgaQ8zfq23W0GoMeIzG6hEFU
 UShG+xkh9xdLjwL4z4JVhUYrVBr3iqEBlYJgXmCjF2MEDxrEUTvnR59w0wEPLZ9hPM5Bu3bNuJW
 vaTsvUCSywRSJSLTEHzJXtzU+ikO6RZ54c6RSkRWG77S1EQZL88iYMsB37jsC6GOlgTUrJtpInu
 IwkwisYrmqXvZ/plY/zFn4rBsuUUJcKhiP4+qrgHz2fEOzT2OwQ3HLpnqKAYXAoh6pzwOAmPAfg
 7y0xZdLz7XB346yiTsK3VHJmmqa14GF9874Zjna09nx6MuH9wzQ+wCov3vuQxzcLtrFjOhNpUFW
 4iueO5LOEJqZtVw==
X-Developer-Key: i=alexandre.belloni@bootlin.com; a=openpgp;
 fpr=D42657F65BEB9D45A004FCFAA6CD9F096F642CB3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33277-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,samsung.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 2D8B227633D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 10:52:53 +0200, Svyatoslav Ryhel wrote:
> rtc: max77686: convert to i2c_new_ancillary_device
> 
> Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
> i2c_new_ancillary_device() to enable the use of a device tree-specified
> RTC address instead of a hardcoded value. If the device tree does not
> provide an address, use hardcoded values as a fallback.
> 
> [...]

Applied, thanks!

[5/5] rtc: max77686: convert to i2c_new_ancillary_device
      https://git.kernel.org/abelloni/c/0d65a9d93d87

Best regards,


