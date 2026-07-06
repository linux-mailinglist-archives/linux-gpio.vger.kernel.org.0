Return-Path: <linux-gpio+bounces-39543-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /VNvJlkyTGp1hgEAu9opvQ
	(envelope-from <linux-gpio+bounces-39543-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 00:55:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 536837162E5
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 00:55:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nabladev.com header.s=dkim header.b=N91q2DVr;
	dmarc=pass (policy=reject) header.from=nabladev.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39543-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39543-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04CBE302D303
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2026 22:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECFC3DD536;
	Mon,  6 Jul 2026 22:55:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DC73C3420;
	Mon,  6 Jul 2026 22:55:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783378510; cv=none; b=nGcr69MUMEI89HzeINLlNMQ8qbptIrBRwpayMB8KdY+iegK4szdrBLZXoGYxKDJh41e4t8sdQ58Pc3yPVZoayK7bA5ShWYHq0v6KGOB0mW6svLKwX9KCRrokh1qXh8l8ldaTjeTl6buKb6loMgPuM02C2MacoLk5tzALw3U4OXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783378510; c=relaxed/simple;
	bh=yqOChaSZ5mNzOHjnrSQyl4fbvGS4SDgoUW14pbM5IrM=;
	h=From:In-Reply-To:Content-Type:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=bNaCe7syKL6fourLeVGMCSxYftoiZk3gIj7Trjw0f8n5tLcOm2a24jBB0EMQQQi8w43ErkLx/NZpw7I/zQBitgU/TmDg8lTTu3vhjSB3gRpRELOjov2ypjqOhdp+omVHYGNdjJi74zbJnW0HW3o1ZaRQkvHVr+65YtdP8spV+XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=N91q2DVr; arc=none smtp.client-ip=178.251.229.89
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id A6517118E9C;
	Tue,  7 Jul 2026 00:54:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783378498;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yqOChaSZ5mNzOHjnrSQyl4fbvGS4SDgoUW14pbM5IrM=;
	b=N91q2DVrLhVhaY1zfNR7RwfRtnj3hnyquGke4MS17FCPbX3MDC1NPENUl8gIPyS2ir68pu
	GgskTiNDkSOU27umVmvh3sZgOXjWOx1S1qcfhEiRprC5tTBDEQSeFcTyhg6OtcfSl5QDRP
	Y6AGozqKXTV7SaaJczcFbneu9i/QrAdQFcAbz5op3wzvCwJT/XH5RlKYa1czGLbFVMy3ee
	DHQQxdb1eohVsJrjMn378/bsPNcLIlf67fbMyk+Fj3GEiS6Mr+j1lR1ecsJHZxwtWi35ki
	h7faeL/UF1XN6SEw23+jcYlADtsCJUr6m+9XvMHkc3AAGqYzp9zRmfsjZ0CUGw==
From: "Fabio Estevam" <festevam@nabladev.com>
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
Content-Type: text/plain; charset="utf-8"
References: <20260706195818.3906949-1-sjg@chromium.org>
Date: Tue, 07 Jul 2026 00:54:44 +0200
Cc: "Heiko Stuebner" <heiko@sntech.de>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Albert Aribaud" <albert.u.boot@aribaud.net>, "Andy Shevchenko" <andy@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>, "Brian Masney" <bmasney@redhat.com>, "Chukun Pan" <amadeus@jmu.edu.cn>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner" <dlechner@baylibre.com>, "FUKAUMI Naoki" <naoki@radxa.com>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Guenter Roeck" <linux@roeck-us.net>, "Jamie Iles" <jamie@jamieiles.com>, "Jeffy Chen" <jeffy.chen@rock-chips.com>, "Jiri Slaby" <jirislaby@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Jonathan Cameron" <jic23@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Michael Opdenacker" <michael.opdenacker@rootcommit.com>, "Michael Riesch" <michael.riesch@collabora.com>, "Michael Turquette" <mturquette@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Rob Herring" <robh@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>, "Ulf Hansson" <ulfh@kernel.org>, "Wim Van Sebroeck" <wim@linux-watchdog.org>, "Yao Zi" <ziyao@disroot.org>, "huang lin" <hl@rock-chips.com>, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org
To: "Simon Glass" <sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <882555c4-e1a3-0a0a-6830-b824b93cf3ac@nabladev.com>
Subject: =?utf-8?q?Re=3A?= [PATCH 00/12] Add support for the Rockchip RV1106 and 
 RV1103
User-Agent: SOGoMail 5.12.8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	SUBJ_EXCESS_QP(1.20)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nabladev.com,reject];
	R_DKIM_ALLOW(-0.20)[nabladev.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39543-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:albert.u.boot@aribaud.net,m:andy@kernel.org,m:brgl@kernel.org,m:bmasney@redhat.com,m:amadeus@jmu.edu.cn,m:conor+dt@kernel.org,m:dlechner@baylibre.com,m:naoki@radxa.com,m:gregkh@linuxfoundation.org,m:linux@roeck-us.net,m:jamie@jamieiles.com,m:jeffy.chen@rock-chips.com,m:jirislaby@kernel.org,m:jonas@kwiboo.se,m:jic23@kernel.org,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:michael.opdenacker@rootcommit.com,m:michael.riesch@collabora.com,m:mturquette@baylibre.com,m:nuno.sa@analog.com,m:robh@kernel.org,m:sboyd@kernel.org,m:ulfh@kernel.org,m:wim@linux-watchdog.org,m:ziyao@disroot.org,m:hl@rock-chips.com,m:linux-clk@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:sjg@chromium.org,m:conor@kernel.org
 ,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[festevam@nabladev.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[festevam@nabladev.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[nabladev.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,chromium.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 536837162E5

Hi Simon,

On Monday, July 06, 2026 16:57 -03, Simon Glass <sjg@chromium.org> wrot=
e:

> The series follows the structure of the recently merged RV1103B
> support. The clock driver is ported from the vendor kernel and is the

When I submitted the initial version of the RV1103B series, I received =
feedback to split it into subsystems.=20

You should do the same here and submit it per subsystem:
ARM, clock, pinctrl, serial, mmc, watchdog, and iio.


