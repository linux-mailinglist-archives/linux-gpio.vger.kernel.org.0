Return-Path: <linux-gpio+bounces-39379-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i4r/ODf9RmoSgQsAu9opvQ
	(envelope-from <linux-gpio+bounces-39379-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 02:07:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 455816FD8A1
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 02:07:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PSsdANNI;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39379-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39379-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5255D300F5F2
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 00:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998501E4BE;
	Fri,  3 Jul 2026 00:07:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFB2EAC7
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 00:07:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783037233; cv=none; b=WsJFia4ICejIWRPkLBJ/u6n4t+taRqwYQ+cZ7ZT6AjRgZETavE6UBDj9oSBYgQiNGIDLXCXW+SfH/aJJFKJvvaVjQyS9W8wHAdbYnNilaZ1ndJD5xNy4hdi+fA2IBB1unm26QMIkfSE+ldr6QkE24an2Nd5fMX4xUojK1EaUm0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783037233; c=relaxed/simple;
	bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVqdQ9rZCNNw8Ztv+J4MpxUcBaizuLMxXv3/0MCo5tcH/kJZ41b62HM+qF08KMEmU4FLNYNCFd/hozgJEDCz2yBkY75n9HlRotX4tDIcGnVsSK4EH5mWizlIfZa870Wg630GamRWBRBkV4GbdzLA9c1Sj4CLwj3gH3zUIQnMzCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSsdANNI; arc=none smtp.client-ip=209.85.222.182
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e663c828dso726285a.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 17:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783037231; x=1783642031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=PSsdANNIF4OPI+tfso6z8T4Wo8zFkSdrveTCsBEU5wBd3266P57N1wRjBng7jjaDOr
         X8garHzxlrq3DHFyeiNF3HLtN7ko5eSPRIj5fFu2kq0Mr9K9I2StmfUWD3sdjDli5JHa
         tvaHImwY18yv7CnMKbPKiFhYsrBPHPu289tYRegUKGFbVTn+3vvND8q0+HOuamJjtgq2
         KIMQl4dJrPdsJ3QgRXl0Cu+ZsZ/HSpyQKqzpFV4UuLXK6yDK54FVcUlqeA4CX5w/KS38
         dnY7hPaCgZY839pki7XX1DMt8rOx5EFRUeKYPfPYib6S5mqoxcpc/0WO1DTE9dZFnJaL
         mdAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783037231; x=1783642031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yq0MUliYbLm6gjsyJNyBrL0lWk6bgalG+E+xG1Xl7sM=;
        b=bso3SOfRiAIYYp7PqEli14FjI2G/UX/JHj+XBrEnJqayymvscYwKZ3XMsveEQJa6Ck
         1mA1dSpFWW9hgSpq+YOAsykOJWUAKUD1e2GugLT+n8l3q5+dj8o3rGqZEMazYoGVFjZg
         508koD5cwOqXof27YkCYY22azcI7u5VPfvB/6vgRRqqBWJgksRLald/csa4NQpTTgZPL
         PBa5Onlmczf9MMmksH5EL63YIMmN/QWpWVY+OYXUx+Ya0/zqTVST041Zl5JR9CqkCbQf
         CukuRinuyvtTiY809+nSan7KapfrF/trqFdqzXo1JDEAvYDUoi4pcfPofxht5uSItYBi
         8UVw==
X-Forwarded-Encrypted: i=1; AFNElJ92ojta+TAxYQZgNRjfNpf8gTat+EkRRYv/tZ0WcWpPZhmh4LiL9Ya9eqP06gr6gf11jKBMDAvFlNLM@vger.kernel.org
X-Gm-Message-State: AOJu0Yywa3p+g/U1ptPDolm2j914K+1wHpvsEtF/4COunXL++bjVdp9k
	g1vGSkW688J+5eIp+z2PkrXx3TRR5o0E15itOwsxgxmgeiHhiNwYLHXp
X-Gm-Gg: AfdE7cnMqTT0bZ6m6aJs2Dr6JKM2mU95y9UBGBekVuYuCvvzEFwn9VhLHTGPDxfQsWm
	G/hgv9ek6/13Udy7Dikz2p7wyzhri0PP2/tsJ35wdb52D0WsK9+H26YjP5GQ5s3Dvu2m9roB1YX
	KSZbpfskrczIbtCL8/tQ1vwewyz3uMXLG8iwehHgKvwLFQy7mXpYKWDtdTJsO/2iOCcxXMojrVL
	5HTvWt02zZqMUOm6WpztAFU68sYn6M+BBLA1ZkTfqI6FMpfjHYPMK7LVKyuzid5q5AGDj9ecRWO
	3nmmX5ONZpEm6L/pPJ4rmONF5I1PvGzq/YfJfZlLB+4gaJVPiShrzgruocFv7+nFin8aK8lxI0P
	xIMP5ZBoQOr0lQkKKr8zpQTgbNtpY5fXzSduEk8B1qwasHespe7eQ2UqZ3a9+wtXvuO/xj6908B
	yJBf9dvRmE77P+E50U3+CUTfmKIT10Gm6j713qv8HImUFn+W/h640npSv2XHpK
X-Received: by 2002:a05:620a:4044:b0:92e:650f:c392 with SMTP id af79cd13be357-92e8b275355mr264263485a.17.1783037231297;
        Thu, 02 Jul 2026 17:07:11 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cbd6c9sm12190085a.33.2026.07.02.17.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 17:07:10 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Yangtao Li <dlan@gentoo.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Thu,  2 Jul 2026 20:07:08 -0400
Message-ID: <20260703000708.1238530-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-39379-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andre.przywara@arm.com,m:linusw@kernel.org,m:wens@csie.org,m:dlan@gentoo.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[enzoadrianocode@gmail.com,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,csie.org,gentoo.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,gmail.com,sholland.org];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enzoadrianocode@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 455816FD8A1

Hi Andre,

In case it helps when you next spin this series: these patches have
been part of my local A733 boot stack on a Radxa Cubie A7S for a
while now. UART console, MMC, LEDs and USB all sit on top of them
here and I have seen no problems attributable to the pinctrl driver.
Happy to turn around tests on real hardware whenever a v2 shows up,
or to run anything specific in the meantime.

Testing here is AI-assisted (Claude Code).

Thanks,
Enzo

