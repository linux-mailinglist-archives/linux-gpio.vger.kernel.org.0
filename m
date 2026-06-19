Return-Path: <linux-gpio+bounces-38701-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pfiTBwrBNGoIgQYAu9opvQ
	(envelope-from <linux-gpio+bounces-38701-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 06:09:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6B46A3C06
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 06:09:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Szn3v5TQ;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38701-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38701-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89342307AFEF
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Jun 2026 04:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3581932B106;
	Fri, 19 Jun 2026 04:07:21 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B83740D599;
	Fri, 19 Jun 2026 04:07:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781842041; cv=none; b=iqLa7BNV/m5H4P5Ry+/Z96OGElERNvtUm5Z2WlpY+6FpY74gcHdTkO4IQCy/pBtXM/VVRpf2S2zkAraZyvnMHzQPx/ZYbhAGa2zsO6ta2s/AWpmlOCCyhXMQQIM+ZArg9bf7dObZHt/idSB1Cx+PkirkF2U12dL6lhPgYczHsYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781842041; c=relaxed/simple;
	bh=ZwgnbpDklsxwXA4ry9F/yu1NZqxf2MAnor86NXv1fJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmq1mqhF04I1ky8mxEZssWV3AWmNFoltKc201TDh2MkGz4EHPB5aqGNAHu/BP1A8ftOrbEP5oSNhu7xCVAx2vtdFbKUkhKnOPUjzQsDxd4ngrKvEcqkVdRh51f+IrN31L83Rhg8ocYTLScDBrMdep3Vf9Q5zHP7vw7xAhVcP/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Szn3v5TQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FC01F00A3D;
	Fri, 19 Jun 2026 04:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781842040;
	bh=VtPuNPA/UJihW+srZRi7+Fjr3nYVhEg97FUVJPDe72E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Szn3v5TQaYV+73mevsEBm3cLp6xY/HOROP58m+9fjCMAUqRdhzjmteKjUINVu11ok
	 ti0p2YN04VSIaQbo+tXX/HaonBLu66zQlLTRpYwmNt3/AR/FbPalc+0JySLndV7EAC
	 dYjkDTBcgYhTlu6M3RKpPv9bxYMdGZz2EOvJgTdL/IXh+dyfEvJteClCu8ogn6PSCH
	 8ITsoYi1AzY6scYPIHzOf8LHlTItEaaikdKhabOR8R2eXiD4/WCbTrmC4DtROfHOWi
	 qwN4UwKuhfetJZ1T/9LHQMt3SSkSNVfl6lAQBp8Hf5zObqnNvLDsgIr3rV1Tj1MIfH
	 bSRn4y48kksgA==
From: Sasha Levin <sashal@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	stable@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Quentin Schulz <foss+kernel@0leil.net>
Subject: Re: [PATCH 6.12.y 0/3] gpiolib: backport 16fdabe143fc
Date: Fri, 19 Jun 2026 00:07:02 -0400
Message-ID: <20260618-reply-item017-gpiolib@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618-6-12-cve-2026-31732-v1-0-7ca0d0b906b0@cherry.de>
References: <20260618-6-12-cve-2026-31732-v1-0-7ca0d0b906b0@cherry.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38701-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linus.walleij@linaro.org,m:brgl@bgdev.pl,m:gregkh@linuxfoundation.org,m:sashal@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@linaro.org,m:quentin.schulz@cherry.de,m:andriy.shevchenko@linux.intel.com,m:mathieu.dubois-briand@bootlin.com,m:tzungbi@kernel.org,m:stable@vger.kernel.org,m:linusw@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:foss+kernel@0leil.net,m:foss@0leil.net,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AA6B46A3C06

>  [PATCH 6.12.y 0/3] gpiolib: backport 16fdabe143fc (gpio: Fix resource
>  leaks on errors in gpiochip_add_data_with_key()) - CVE-2026-31732

Queued the series for 6.12, thanks.

--
Thanks,
Sasha

