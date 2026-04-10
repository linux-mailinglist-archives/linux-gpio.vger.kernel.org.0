Return-Path: <linux-gpio+bounces-34985-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDNEOdGo2GkhgggAu9opvQ
	(envelope-from <linux-gpio+bounces-34985-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:37:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 683D83D36D9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0D503012BD5
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 07:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1563A168B;
	Fri, 10 Apr 2026 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0/Zms55"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD104387598
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775806668; cv=none; b=lvE0diEq2/MGsKYR+rpB/2GyXADvcj9FaU3nWjcZLW6Q+OzbrvTJRVcWC424OshCaF6pBnuywcfagIsKFmXGrSmxgwC20EYq+OgTDHKRQOW0UDXeJ75z0eWlHqjaaYPFehlHBBnsJBAsSWsF9KS809xdWAVnkjDjgMXXEc8isKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775806668; c=relaxed/simple;
	bh=prNhPUxjlC9KTZLbbjkr41gU0WNMiDfRO5w2mPaA3+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NL6zhtNVm+Av7DPgbsH/yJoj95FPevmfQCI2vPSnLDjeLPV0eMiOV0+eJfvP/tZiSg/2lSTQ+2McPg8SeznJ81dcV2aIwY4EtUlcQFb8dfI99xi5AXcVLHLkDePKKLdycIcMzBkPgODFJH5LrMJDc9ZlBXR4g7y9ObICxsA1SNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0/Zms55; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51CD3C19421
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775806668;
	bh=prNhPUxjlC9KTZLbbjkr41gU0WNMiDfRO5w2mPaA3+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f0/Zms55ickfGRIdD6cuuOLeTsSWaROWdDBArUkbLFVWONI0jUcE0SCw2LWLhhJ8M
	 kgmEQw0WOvkJC39OXeX7qYeQctvGNeR5nzwCIx9eLUyL9JbgjsgRbJGQt30RVoHbCS
	 rmmG908ZLTWobBWk2UcfU5SZaKtPACW2S0LKmGjV423Qeko6Rn80gVadk44R5ItidX
	 NU8v/1yLCPinSQO90GlwS77i2Yj7vOdToguSnj9yWXLr41fxVr14x7hh8BuQzZWo+/
	 AUpS/cEcF4MzyGOKquBmTylaOrE+XKSldeLfLEPk0ZKKUhIX5aaBgh/ydgNlJIW7Hf
	 Z8KS8WstxWfwA==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64eee7b83cfso1197064d50.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 00:37:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXtdpwTnftwpSp0EcPzSDJVz00d3cTesP5D7rvNuH8UNyE08wV6WBP4JdONt7Ia/jt1dhhjx5F0Oy8A@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq36h+Ep37G4pPlHVu5k4yN6xZLumPaT3bqNgnYb3xuwZliKqi
	Hc7OZZ8dCFTpMySsQ5ZIDuyVw8UzYZvTXye42anIfpoSip2DWhxJtRVemN0Khp3I/1eXSlyMnGP
	w2nAkLiWyPap2e30mh00fUPwmt2QBTl0=
X-Received: by 2002:a53:bb84:0:b0:650:38d9:a0a7 with SMTP id
 956f58d0204a3-65198b9b922mr1436588d50.52.1775806667759; Fri, 10 Apr 2026
 00:37:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 09:37:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCrqa_eMCCPPnAKTDug0Bj1ZktrEckOfs-H6+FzqtZcg@mail.gmail.com>
X-Gm-Features: AQROBzBQm9AmJG_DbEyKwcRWAwaHWROrcg26pOOQhOFD9Ipr2DjT-YjcixGXSLk
Message-ID: <CAD++jLmCrqa_eMCCPPnAKTDug0Bj1ZktrEckOfs-H6+FzqtZcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[fw-web.de,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-34985-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,fw-web.de:email]
X-Rspamd-Queue-Id: 683D83D36D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 9:09=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> If the gpio_chip::get_direction() callback is not implemented by the GPIO
> controller driver, GPIOLIB emits a warning.
>
> Implement get_direction() for the GPIO part of pinctrl-moore.
>
> Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::ge=
t_direction()")
> Reported-by: Frank Wunderlich <linux@fw-web.de>
> Closes: https://lore.kernel.org/all/20260409132724.126258-1-linux@fw-web.=
de/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

LGTM, but it would have to go into v7.1-rc1 right now due to timing,
then from there to stable.

Yours,
Linus Walleij

