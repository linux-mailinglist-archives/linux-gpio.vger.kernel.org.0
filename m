Return-Path: <linux-gpio+bounces-40092-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6yKhCSEpV2q0GQEAu9opvQ
	(envelope-from <linux-gpio+bounces-40092-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:30:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D2A75B10C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 08:30:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmx.de header.s=s31663417 header.b=tW93u6Bw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-40092-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-40092-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=gmx.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6DAD7300983C
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jul 2026 06:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFB6A3043B2;
	Wed, 15 Jul 2026 06:26:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17242BDC26;
	Wed, 15 Jul 2026 06:26:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096789; cv=none; b=eQ4s5Uc0yNmsb3mJrGSfRZFWq7H36AkDmSD3tv9ijCARl6cYC0YK0VrYi5P/5+sDwtoG2I2rvPX6cZFyhrfqsMOKFthjGDAKHQgRtKPYwzAiJbKw+fNpropranpqfyDrsx+blSOY0lNYaHRv/b9/0goTK9SMrP9mYGCvuZzD9qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096789; c=relaxed/simple;
	bh=uGVteq9jn2q+1OVkNIRgj3BHrst0YaEZwsHqBhESLc8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=BxSMkN24uuQb4BBItXvU34ZqwechILhTPtdk5FS1Of1zifBORkeNz03NAbvkAZefdoQX4vG1XQajvr34MMdIMPOuPEa7Zjosmsbl9j6+qZ97ZmOd8Ob7C2y1GZjfLemXyovAj7QvuGM1OJP513yvH9f5buAqFmXJgSI/IwmLXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=tW93u6Bw; arc=none smtp.client-ip=212.227.17.20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784096780; x=1784701580;
	i=markus.stockhausen@gmx.de;
	bh=uGVteq9jn2q+1OVkNIRgj3BHrst0YaEZwsHqBhESLc8=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tW93u6Bw52aEZcbxP4Z58iyY4PZrZMVraGdXwuyUex4SP1zYEPBOJIRLwz8TurJw
	 DQIuGB6NHFnXM8Bu/AF9Hn4E73JO+YOUSSd8Kb1T/Mtx94+w3V5kefp7meK9wFYu7
	 hy/FtREm4zjfxNx1/drOep6AeA6w+dyxO69eudpFWwCKCqchz3U5gjGLEzQ3u7spD
	 nkatStjLKeB/dlfz8zemQ/7KjAs863JgZPbjfl/fNKTK1GOUgdBz5rf0cKSj6Gj9J
	 LqHJG28DYzJ6hozL4pA6WSDha4gm/ITcuq04KyQr+9tt2V4McxY9HYBzxvoTUF74K
	 90eErgtzp2R0mNEWLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUUm-1xOhXs2q44-00mYri; Wed, 15
 Jul 2026 08:26:20 +0200
From: "Markus Stockhausen" <markus.stockhausen@gmx.de>
To: <wsa+renesas@sang-engineering.com>,
	<brgl@kernel.org>
Cc: <linusw@kernel.org>,
	<andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
In-Reply-To: <20260714162915.3018703-1-markus.stockhausen@gmx.de>
Subject: AW: [PATCH v7 0/2] i2c: i2c-gpio: Enhance driver for buses with shared SCL
Date: Wed, 15 Jul 2026 08:26:20 +0200
Message-ID: <008301dd1422$da3ce390$8eb6aab0$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJGMuk2z0FmlZO/0VLrX74B947go7Wb3OeQ
Content-Language: de
X-Provags-ID: V03:K1:xfJkfA95VSwmhv0oAceYkS+454ktbKUUZbz4Kss0EHb1Lb7rSQG
 47pMpHY1dxDRNKeUPCCgcuXyqjIJENdqIItgzd20GBQktz05idT76gtycz2dA4DhwBXDHPB
 uNaJLN84hpRvbe4TulwdifEJLJMNWRVIeqg848gzzMJpZkNjscv4HJIHfBld3xKmY1tK6M+
 ingG5NH2XAC2R+EdSmKHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Au2RyYB4UVg=;PCfRd4XsbYd5+pLJXAm8dMZmYA8
 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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-40092-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:brgl@kernel.org,m:linusw@kernel.org,m:andi.shyti@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmx.de:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmx.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.stockhausen@gmx.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,sang-engineering.com:email,0gmx.de:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09D2A75B10C

Hi Wolfram,
Hi Bartosz,

> Von: Markus Stockhausen <markus.stockhausen@gmx.de>=20
> Gesendet: Dienstag, 14. Juli 2026 18:29
> An: wsa+renesas@sang-engineering.com; andi.shyti@kernel.org;
linusw@kernel.org; brgl@kernel.org; linux-i2c@vger.kernel.org;
linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
> Betreff: [PATCH v7 0/2] i2c: i2c-gpio: Enhance driver for buses with
shared SCL
>=20
> This series adds support for devices with multiple I2C buses=20
> that share a single clock line.
>=20
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

Thanks for your assistance and feedback. Finally Sashiko seems to be happy=
.

https://sashiko.dev/#/patchset/20260714162915.3018703-1-markus.stockhausen=
%4
0gmx.de

The core logic of the implementation is still the same you reviewed, With
Sashikos feedback the detection of sharable SCL pins has changed a bit.=20
Maybe you can have a final look if i2c_gpio_create_scl() is ok for you now=
.

Thanks in advance.

Markus


