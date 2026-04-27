Return-Path: <linux-gpio+bounces-35552-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHgOESs872mD+gAAu9opvQ
	(envelope-from <linux-gpio+bounces-35552-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:36:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BBD471195
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 12:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FF5B30210F8
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 10:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D573B19A1;
	Mon, 27 Apr 2026 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0XBdBb6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C233B2FFF
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285987; cv=none; b=cyb2Z0Dir41es/asemf1KR6LtAhptJh6MAEb7fBf+BxV+64FMtaZyQALT/phDjVIeUrYhxNc3KrDo7tizeRILz2QA4mgICKO84Tf8h/JqRic+11inEf+YaEYCteIX/qBK6hmwpeSLkbWaHqDFV0+rGLS/AwxmWqH7o0SgxqoFTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285987; c=relaxed/simple;
	bh=sZdY/36jbKK4QMgRBN3Be3QYPzzEjzIo9WdGSHUOuZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BolqsAozKp+BPMtBR9Cez6Z3f5QoQGWeVeTvZowGuV+FOZ5oOUm9iEbxQsRZ2Ao12bwnOJpgkvsipML95idYCyLUILOPX40LOlSqDndwt7PmeQ4rU03rhcsAeZwPgvCSe69lonM8yCn4QevxpzxzIDo3B7kq+05WTx10KcOsSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0XBdBb6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957ACC2BCC7
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 10:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285987;
	bh=sZdY/36jbKK4QMgRBN3Be3QYPzzEjzIo9WdGSHUOuZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y0XBdBb6tsh/ct062e3s+3bE94qJ7F0kHpyLoBxLkCN+lfEar/pvjFUd/RKMGyheD
	 vFw6NYZCVZwYZgk2dntGAr3q/a3O4D0X1ZYamoL6uv/3fjk/449FT/AZ4mFdKBAVLA
	 nGpH723lrtieknWZbvSUM0wyrqUxqC7B5BO4Eir4/errEGTlMlSvRE07ngkuYcdcu1
	 NYe3pbVngxZA9cdwKycU7w4eBTBiawdIh5bWStdkIBtrAFuawAifW2OnY2/x0T+BE2
	 B4XTykxZYm0/rAc5TkD16t7UbtyWEasojnVV55gbxpyzfDyCQMxRq5C/E4ORal1Sv2
	 3CEvHOLViU28A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so10098091e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 03:33:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9vxPbqbNEv760hlen7B9JVWVG3jSohoqiC75EInep5kLsdJqPutkvils4Dna2wrEJaqTC9xE0Q+t01@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8wDBJr2IyVpepgzw7W4rcR9ewaL9iFAmjfBgAyhRKAjCW7cbI
	qYam5B5vEtIQ0bXWygTUlirwhz/f7Xu/f7At6x/BsMqYBBNqBFwEfI/6FsDUC+9QSwM08voHpUh
	HmDRvyQyS71NyhekI0vYfS8bWID8Ce88Z80KV3Ueyuw==
X-Received: by 2002:a05:6512:3b91:b0:5a3:f2ed:87cd with SMTP id
 2adb3069b0e04-5a4172d0085mr15446256e87.10.1777285986242; Mon, 27 Apr 2026
 03:33:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
 <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev> <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
In-Reply-To: <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 12:32:52 +0200
X-Gmail-Original-Message-ID: <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
X-Gm-Features: AVHnY4IwzDLYhHPbIaUAVZBlf2N-kg8RzncpCvZK6axdzsTP8InukubITrev7X0
Message-ID: <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Linus Walleij <linusw@kernel.org>
Cc: Frank Wunderlich <frank.wunderlich@linux.dev>, Frank Wunderlich <frank-w@public-files.de>, 
	bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, sean.wang@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B2BBD471195
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35552-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,public-files.de,oss.qualcomm.com,fw-web.de,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sun, Apr 19, 2026 at 11:25=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Mon, Apr 13, 2026 at 6:59=E2=80=AFPM Frank Wunderlich
> <frank.wunderlich@linux.dev> wrote:
> > Am 13. April 2026 um 10:01 schrieb "Linus Walleij" <linusw@kernel.org m=
ailto:linusw@kernel.org?to=3D%22Linus%20Walleij%22%20%3Clinusw%40kernel.org=
%3E >:
> > >
> > > On Fri, Apr 10, 2026 at 11:24 AM Frank Wunderlich
> > > <frank-w@public-files.de> wrote:
> > >
> > > >
> > > > Gesendet: Freitag, 10. April 2026 um 09:09
> > > >  Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > > >  An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@k=
ernel.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthi=
as.bgg@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@=
collabora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > > >  CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org=
, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bart=
osz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > > >  Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::ge=
t_direction()
> > > >
> > > >  If the gpio_chip::get_direction() callback is not implemented by t=
he GPIO
> > > >  controller driver, GPIOLIB emits a warning.
> > > >
> > > >  Implement get_direction() for the GPIO part of pinctrl-moore.
> > > >
> > > >  Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > > >  Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_c=
hip::get_direction()")
> > > >  Reported-by: Frank Wunderlich <linux@fw-web.de>
> > > >
> > > >  please use the email i used for SoB in my linked patch (closes lin=
k below), the other email i use only for sending patches due to mail provid=
er limitation.
> > > >
> > > I can't fix this up because the closes link isn't working right now.
> > > Is it the same
> > > as the one this mail came from frank-w@public-files.de?
> >
> > yes, closes-link works for me
>
> Fixed up and applied. Will be going in as fix for v7.1.
>
> Yours,
> Linus Walleij
>

Hi Linus!

It seems this one got lost somewhere along the way? I don't see it in
mainline nor next.

Bart

