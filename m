Return-Path: <linux-gpio+bounces-31105-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFzEBud6eGnBqAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31105-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:44:23 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9F91348
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 09:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C9B53048000
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 08:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2ABB2C0F78;
	Tue, 27 Jan 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="KeSVjp4U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8D2C0F75;
	Tue, 27 Jan 2026 08:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503440; cv=none; b=AQ5ZfnSvtscEuINjJ4LuTFi5zngKqQ8mlsF2DCUosJZra5DNnCCHK5wfBVBJdtxv95K7B4OpKYcc6LF42EK4uDubodbmsrzh/bWZ8n9y1t2YsyoHNgOIN4VHw3qoOpDkdVuSZWIMUB5OcOq6Xi6ysXIXFIoxebT+qKIg3r01zBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503440; c=relaxed/simple;
	bh=OhuL4GnTVFlBbzmyO6Y/9GVwzYIwIHzhUztR87iIeso=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=umlV9HubM4Tt9TxvxyLRCSj9FwX6Pa588TQ56rKWNOU7HWRf8yBCxrwVI/gLvdmXmyVwEE/spe0R7kh4nN/zfkTbs1YqiUv1YBHGB0sTVKh9RUJPee0mQDyA885OOqC29HIlc067XSyl4Gx5DnhtMR0mmo49dOPGfwvzKUrLc8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=KeSVjp4U; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769503411; x=1770108211; i=markus.elfring@web.de;
	bh=XBpRxxk4mS1poL30jYwAHiqZVpwRB7SDDALxwri6ILE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KeSVjp4Ux9b60mVCjbYLzgu6sIaZBwR7mcyJKkNkAcZS4SiUeHXOkcKN5LFeetW7
	 8qXODhcsImERC0YDJadQX4eHOdiOVwOxXsHor8ovBLSY5iXLoGtX4MQYeftZ4chC9
	 olTNgY3SaWOioMx0YDSGlDTiAFAhULN0A4J2UoNyrrPAl36AgpYd7PGZ4Lgc7ireS
	 MsQP53IW1CE6sZB7fN7Tp0XAvaUlM2Or8GyuHLfxSw5Ott4JwLfef30LkG09oAKxC
	 1176SEF9p3yS5EN8j+3B326zMBmu8PjchE94sCe8nml+FcrDGMVGqRysDO1Iwg+ZV
	 WtQU83XxLUawtGtV3A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.251]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgub-1w22fM1PA7-013euq; Tue, 27
 Jan 2026 09:43:31 +0100
Message-ID: <83b45da4-53d7-4fb3-8099-77ad7f6bf5c0@web.de>
Date: Tue, 27 Jan 2026 09:43:12 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jianhao Xu <jianhao.xu@seu.edu.cn>, Linus Walleij <linusw@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
 Zilin Guan <zilin@seu.edu.cn>
References: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com>
Subject: Re: [PATCH] pinctrl: renesas: rzt2h: Fix device node leak in
 rzt2h_gpio_register()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260127-rzt2h-v1-1-86472e7421b8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iJShoBkAfBxZp+mDT5yvO8EYMaDGH9hit1n5Frvgb7klI7UGupg
 M/njEp0MsiZHb1D7SMJHH/aIyWuXZbBR1yxNx0N75JT49vG5/6MW3ugKByHBRgP58ChTvC2
 4MMvpthmsZRn1T+O8+JxJNj7iMHsE9OzPflMRAHxRTui83jPUh48ZE2wpcDZU+8uWrj952O
 RpiTDsMqpw3mg4kZg3ZvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ryfITqY3yvs=;mGQnYJ5mFNA+vleINoMffQ1LSXr
 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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31105-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[web.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[web.de];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BCF9F91348
X-Rspamd-Action: no action

=E2=80=A6
> In rzt2h_gpio_register(), the driver fails to call of_node_put() to
> release the reference in of_args.np, which causes a memory leak.
=E2=80=A6

                                                      reference count?

* Were any source code analysis tools involved here?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv6.19-rc7#n34


Regards,
Markus

