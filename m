Return-Path: <linux-gpio+bounces-31085-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIXELQ+Fd2m9hgEAu9opvQ
	(envelope-from <linux-gpio+bounces-31085-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:15:27 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E645789F9C
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 16:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CD50303E2DE
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jan 2026 15:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124D633C1AC;
	Mon, 26 Jan 2026 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ItxsCJ5z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8041EB5FD
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440468; cv=none; b=nNNYSrCfPslTv7F1R1nZHDWyxfLoylxTGInVafd6/sPWCcol9HlLmiTuc+WgF1WVLXa577DAYgPKhL6b5J4VVfK1FT1BIBLyJt6LW0G/K2MqJ2MgazY85N+qyQ/c2XvEO0/+nQn++DmBS9MwVEUjxfydAsiLRaRz3T9yblT7/0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440468; c=relaxed/simple;
	bh=Znc+qa2ijQ0mpaTGkgKRpaUYo6xAkTTNqXk3JmS8VTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ap+O3Uom0o9XoM3O6jUJ+Rc/ENhtQaitundoPws/07IO89pT69SyKY0X8pw7OgjfpGQFZgpI6h8kVn+/FuDiihoYHDXkJedGTDASeVlOp46PefoyvRUVcEKwRio4alzrFQ0x7drY5AYmrNHZmVB3tb9giJQMhOxEUqF8DlXp1Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ItxsCJ5z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8CDC2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769440468;
	bh=Znc+qa2ijQ0mpaTGkgKRpaUYo6xAkTTNqXk3JmS8VTQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ItxsCJ5z+nwJfqwqrdBuN6Yetus64YV1Ks2G0wlvtLDejAgvt4drgTyM5pKyKcxsc
	 S496PBLkdy1QYU9CBVWkIIj2GCWGymyYe3kIgdtdj7nsNlMuewh5iEyGkz0F5MKgyF
	 algAHpS/IjEBWop9nd9/qCKv1qmSZNhLPbguO5Vp5mgdE0rDJoXCuDLdopUJcd/SAp
	 ix/0g4zl4oj2YGSrRq1JP2tgvraYMMSXW/Oagf6VIRZPUOM7Khv/LpIMCrF8nA/9ZK
	 6yyuaOEamFS0491nHvtNUai3rZ+zGFSzofEYHDTdj7rempMYzJqto5vgT4S8bQOkAv
	 S/eOWvR+4VGLg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dd22b9895so5453207e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jan 2026 07:14:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5qmcp0d+6xfJ3Mz44ZG/eHN51UoSLsKYYUbl3qjGAB9Ju9TmyReBzTyOfDWJZYavsTVO9CvU0W+Iz@vger.kernel.org
X-Gm-Message-State: AOJu0YzxMhdogj4KHKFoFbj4iEbI9zqfZE4kqd+c+3Ggifmg0K2nvbxM
	6EkTxaKyqeKJM2UcGvJa0EsJUSrfChcDYFhk+4DkKdoAwoFfu7at1Kt5aLSf5RGzCkY/PS3pqVk
	/sUac593v8JMkAeH1VgOg2sqsltasv0xeEHf6E1M/CQ==
X-Received: by 2002:a05:6512:1089:b0:59b:b478:f160 with SMTP id
 2adb3069b0e04-59df39100e8mr2266000e87.14.1769440466902; Mon, 26 Jan 2026
 07:14:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
 <CAMRc=MebQF3P=Tp+65A6o4TDz2txYH0c832mbTV+250-6JRi=g@mail.gmail.com> <4ba68a0e-f603-419d-8162-da66f8755542@sirena.org.uk>
In-Reply-To: <4ba68a0e-f603-419d-8162-da66f8755542@sirena.org.uk>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 26 Jan 2026 16:14:14 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf-YJ4_N9QphXbxZF2CzevDbHiG-xjdVPujz1D7_X2GNQ@mail.gmail.com>
X-Gm-Features: AZwV_Qiwmcz1OzLh4Pfdu2SpUUZRrKapJVA-NXIyR2TaV4hIR66YD2so1lGbVew
Message-ID: <CAMRc=Mf-YJ4_N9QphXbxZF2CzevDbHiG-xjdVPujz1D7_X2GNQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpiolib: introduce devm_fwnode_gpiod_get_optional
To: Mark Brown <broonie@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31085-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E645789F9C
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 3:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Jan 26, 2026 at 02:50:27PM +0100, Bartosz Golaszewski wrote:
>
> > If you can send a v2 with added kerneldoc, I can queue this up for
> > v7.0 and Mark can then queue patch 2 in the next cycle. Unless it's
> > urgent, let me know if it is.
>
> I'm happy for you to just apply patch 2 if you want.

Sure, just please leave your Ack under v2.

Bart

