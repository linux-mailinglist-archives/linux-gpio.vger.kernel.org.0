Return-Path: <linux-gpio+bounces-34991-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFY3Au/B2Gk4hwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34991-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:25:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 610063D4B1B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E696300AC92
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFC93431E3;
	Fri, 10 Apr 2026 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="Xe0MHdJg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7CC342526;
	Fri, 10 Apr 2026 09:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775813098; cv=none; b=mMGiO/abkO1cGmgu/BmT0+daj8/D/pajHpd+pXv9+7vGI22u5wLxH82sHJxH6Cfysw9qIbp70avhNFes94hEBmvtMN1yDhEBqPYr7OHqUIPAYxrhTjzR3mHjugTM3bAxqSqEwwKqh596eCyVSkyp6TetN0N4cO556D9leovxiTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775813098; c=relaxed/simple;
	bh=x55BnAYCiYc4Ou8winh9a1tHPbGxq5JqwjTCAarUD1s=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=j5r20k1B6HsNNKszDGDcqZrngbiLOnDJtMfosdaXYfppW6/wtD1eEI4L1FTeFJ5v9I5qUwB39ibE+DybQhPYtIjsE3NA35nrUk3D6iB3vUI1E+K69a7Awzx4tfsF4jXZ4EEj8Vp0GBGHIAugUlcOy/IR/jUUoPhN2+spPlSILmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=Xe0MHdJg; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1775813076; x=1776417876; i=frank-w@public-files.de;
	bh=x55BnAYCiYc4Ou8winh9a1tHPbGxq5JqwjTCAarUD1s=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Xe0MHdJgqMcToxHilpfE1H7P6QH+0YdonORUma+5xYG7s1vDEb6zGaBJ/2SCE7ZM
	 JBIRWBwtgpM+5WgGEcUbgEzRVlY06HDEXrSrFqCof5Cv4aDKRgk+di12RMQUDqqIa
	 8JWsyhrQwEyoVYr2sb7e/+ldN7B6V2WEarcPydxqDo943diy+qqmVqtSRC90INVlh
	 nPFsbKeGwTgA5FQ5/Z8L8qY3T7yShJB/jNbROLE08QL0PDXOArkem9ui71hIESuwt
	 qQQJnCY5irUpJyVsSlBnL2wPNU9LFdv2MHtPmyzv+AuivU9oYsmvTWBgOYd5tNd57
	 2aRzAUVT1IQKNV/lXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.152.0] ([217.61.152.0]) by
 trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5 (via HTTP); Fri, 10 Apr 2026
 09:24:36 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
From: Frank Wunderlich <frank-w@public-files.de>
To: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de,
 sean.wang@kernel.org, linusw@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, brgl@kernel.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bartosz.golaszewski@oss.qualcomm.com
Subject: Aw: [PATCH] pinctrl: mediatek: moore: implement
 gpio_chip::get_direction()
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 09:24:36 +0000
In-Reply-To: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:v+CtdG+miWP51FXD9E3ff9lKGyUuigRMCImtxUW3pQXoaVPjA/Tx6oMcjL/Su/mnSSsyy
 QJzylvbVtXD4DJrMH8LsSsJ6xsjQOcqPpzMlvfP1HErHMI1pvp6lb/P4JInZlX4oVxp93xWRTEa+
 slFJ6uLQY0t1lPHb7vPor4sieprsQpPP9Uo3Wi03tQ77+hmtOgDHOG+/w2/T9GqmTn/hCLxIsZPW
 zr5yQLtGVMzl5ZuW6/qfk8xOyagSPeUBiFPt/CTC5WmccMIvEQnz67QoiNFeJOYGLJqxNPLi8eCK
 G7wcalfbYHzBx9c5Bl27fQrN0fiebO2Ub+AWR+PyUF5iCcrxk6gUWwwfq7MdkxIf/A=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R2lLZiC8lLA=;cAt8Qw5xE9k3wOlNKTRacd1GwMj
 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
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[public-files.de,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[public-files.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34991-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,fw-web.de,kernel.org,gmail.com,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[public-files.de];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frank-w@public-files.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[public-files.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:email,qualcomm.com:email,public-files.de:dkim,fw-web.de:email]
X-Rspamd-Queue-Id: 610063D4B1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Gesendet: Freitag, 10. April 2026 um 09:09
> Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@kernel.=
org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthias.bg=
g@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@coll=
abora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, linu=
x-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bartosz G=
olaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_dire=
ction()
>
> If the gpio_chip::get_direction() callback is not implemented by the GPI=
O
> controller driver, GPIOLIB emits a warning.
>=20
> Implement get_direction() for the GPIO part of pinctrl-moore.
>=20
> Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::g=
et_direction()")
> Reported-by: Frank Wunderlich <linux@fw-web.de>

please use the email i used for SoB in my linked patch (closes link below)=
, the other email i use only for sending patches due to mail provider limi=
tation.

regards Frank

> Closes: https://lore.kernel.org/all/20260409132724.126258-1-linux@fw-web=
.de/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>

