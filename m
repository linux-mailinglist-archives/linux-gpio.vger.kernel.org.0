Return-Path: <linux-gpio+bounces-35119-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CECEKTAn3WlpaQkAu9opvQ
	(envelope-from <linux-gpio+bounces-35119-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 19:26:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56A3F15F9
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 19:26:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B436F306440B
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 16:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C3C31F9BC;
	Mon, 13 Apr 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZtzKKlNr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0595B3264D7
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 16:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099586; cv=none; b=FSxPcHkrCLTEjX6zgsihe1x0GSWanOXFi1aq29mYL6VYitx+qmzX4E9OijVa0o6fGIhEiOJ6EbnGb4NhmUkW4F/aEPAwXpCk3uQ/OtmSBFJWer1FnkHb/uFGSk441BZkO+4Y6c2StGhpDMH87oLSkZ4ROXODwLEG3Gu8ClsiPx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099586; c=relaxed/simple;
	bh=xMRlr+dvauWYLp4fhg1oiZc7pSG83xFpP00YLKYxv/4=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=tLJkDD5L9EZfs6fBBERLpgzJ19JnEcRRMTxPq5JFfj/0btDfpGqdMvzq1NyqiUo+B6ReUUt1JDoEY1qsyV3WBTw9Q5IIl06nJ1Jot5Fq0BstrqBGsP3hSSnG4YNfUaMtUP9mimJqPGReFi3cO40lSqNSCR+uihu4Ku1LuuyPqas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZtzKKlNr; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776099582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyv0AxehRNOQolYCuoB+pRa5GzYKrq0BCQrOiqbyjL8=;
	b=ZtzKKlNrEZvrY0siISgE/Ud2mhjzBo1yzcjuC4tb9MyBLjR73qQtuDvHQlCLosiqRhdeC5
	MvippeHIVM5I6tQO6RpYzDwoa5PnPUAhCoWXcYCyF6Q+pHYs6/d3pBxwgK7CY6dQU4Ttlu
	Y/+WANgaGegDGnl4JCDWZwnxsBNfhZQ=
Date: Mon, 13 Apr 2026 16:59:37 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Frank Wunderlich" <frank.wunderlich@linux.dev>
Message-ID: <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement
 gpio_chip::get_direction()
To: "Linus Walleij" <linusw@kernel.org>, "Frank Wunderlich"
 <frank-w@public-files.de>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de,
 sean.wang@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, brgl@kernel.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35119-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,public-files.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,fw-web.de,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frank.wunderlich@linux.dev,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,infradead.org:email,fw-web.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,linux.dev:dkim,linux.dev:mid,public-files.de:email]
X-Rspamd-Queue-Id: 0E56A3F15F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 13. April 2026 um 10:01 schrieb "Linus Walleij" <linusw@kernel.org mai=
lto:linusw@kernel.org?to=3D%22Linus%20Walleij%22%20%3Clinusw%40kernel.org=
%3E >:
>=20
>=20On Fri, Apr 10, 2026 at 11:24 AM Frank Wunderlich
> <frank-w@public-files.de> wrote:
>=20
>=20>=20
>=20> Gesendet: Freitag, 10. April 2026 um 09:09
> >  Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> >  An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@ker=
nel.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthi=
as.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregn=
o@collabora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> >  CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, =
linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bart=
osz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> >  Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_=
direction()
> >=20
>=20>  If the gpio_chip::get_direction() callback is not implemented by t=
he GPIO
> >  controller driver, GPIOLIB emits a warning.
> >=20
>=20>  Implement get_direction() for the GPIO part of pinctrl-moore.
> >=20
>=20>  Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> >  Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chi=
p::get_direction()")
> >  Reported-by: Frank Wunderlich <linux@fw-web.de>
> >=20
>=20>  please use the email i used for SoB in my linked patch (closes lin=
k below), the other email i use only for sending patches due to mail prov=
ider limitation.
> >=20
>=20I can't fix this up because the closes link isn't working right now.
> Is it the same
> as the one this mail came from frank-w@public-files.de?

yes, closes-link works for me

> Yours,
> Linus Walleij
>=20

regards=20Frank

