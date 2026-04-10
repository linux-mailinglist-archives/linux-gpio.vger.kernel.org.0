Return-Path: <linux-gpio+bounces-34993-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPCkOu7K2GktiQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34993-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:03:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDD13D55C8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 12:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2C48301573D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 09:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E21B3783CC;
	Fri, 10 Apr 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6+n50wf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D437756B
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814912; cv=none; b=oxfGZiLfG8640ulgW9QYrXCvrg1q4tyYvDLxXXiuuNlpDwz1eKQ3tbwrf4hkpcGRIFAyMj+Ui8RtFzVjzJKRKZxcwbZTyEc27xqWcxQniqYDTII+ZWNrA0W+WMo+scYDQqhKgxHDBFUdxX9/sbFKbajKjhAnPogH6vOcywvjuSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814912; c=relaxed/simple;
	bh=Wr5+DY/r74XrPI08rq2r+6e8S4vo7PRdMxQwpUoapWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFhAmSTyZHP3x19InffVRnFp3SboTvpaJYImlvuQVtH1YelO2aA0/CxmfLuwtse5ZMbwIoz3Qtgbtk9LB83DxSBD5/0YkI/dmDgkKQlzuOHjqZadGfIIjcvsh9a8dUgb9li5PI5B+IyTZYbqC+WhHB2ZpCcMO+Dkmrhbg1k6rPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6+n50wf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88C28C19421
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775814912;
	bh=Wr5+DY/r74XrPI08rq2r+6e8S4vo7PRdMxQwpUoapWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T6+n50wfxhA0Z3X4fXSdHd+0nckQVzmfcE6pJnKliP4yUr5vzgO3pZC7NCZ1WtO+B
	 EW5O11mjHqwaUIaPkOIk7+AVVyk4T4kJugmboOcrdvo32jf0wypts7ySU4AmBTBlnB
	 owolzVGoXiy4ck1U0vS3oOCY1gpWkoZkj3RIWY0oZmGNMPGKgZd0MDe1K/ymiSCmLM
	 WTzdFQWXc6h/mbUwNoO44DMth3PuB8z7hKqr4WFGPE0TahLa4HOF8YoObqToRd6mnU
	 ZDTsl53cCud9kPvEgNB+gm6mcYARk16jJs7+AiohMl39rsMO8wzyW6BaUzLWtr1FcJ
	 f9r7pobV/ePQA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2967e5de4so2747849e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 02:55:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWq0n6VpiU1iZ1baBZGgVDThcGLgt5YuqVJl0fTedFY/nUDAwEN+UPxxDtKdtX+J+y29FURCg/s0S1D@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmm9xHDkBhTqIXu0VvsqtkbGfQTHJDEIh2FCNYxf5a7BSyEavr
	WAdPSrz1phRIl8KsOgq7Es3qnyCgFy0TBz5lpsUgwoz40McoL6Oq1TOyKvZF4EAlcyBp8aBIpZ7
	69lzBAg3OAksKVF8qD9f7NsnHJnxrgzPScV38Rgnzxg==
X-Received: by 2002:a05:6512:114c:b0:5a2:afbe:4aaf with SMTP id
 2adb3069b0e04-5a3efb2c6c3mr909348e87.21.1775814911289; Fri, 10 Apr 2026
 02:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com> <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
In-Reply-To: <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 10 Apr 2026 11:54:57 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md1pC_a8zSQqWWcubNG-1ret8Lf9sajVDnU8nw2gnXZiA@mail.gmail.com>
X-Gm-Features: AQROBzCP-_fg9A2t_Kbkm4--HVao78r-kjo5RBoGRmmLlahvEN3yRZA61_WNy7w
Message-ID: <CAMRc=Md1pC_a8zSQqWWcubNG-1ret8Lf9sajVDnU8nw2gnXZiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Frank Wunderlich <frank-w@public-files.de>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, 
	sean.wang@kernel.org, linusw@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,fw-web.de,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34993-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[public-files.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid,collabora.com:email,public-files.de:email]
X-Rspamd-Queue-Id: 5FDD13D55C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 11:24=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> > Gesendet: Freitag, 10. April 2026 um 09:09
> > Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@kernel=
.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthias.bg=
g@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@colla=
bora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, lin=
ux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bartosz G=
olaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_dir=
ection()
> >
> > If the gpio_chip::get_direction() callback is not implemented by the GP=
IO
> > controller driver, GPIOLIB emits a warning.
> >
> > Implement get_direction() for the GPIO part of pinctrl-moore.
> >
> > Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::=
get_direction()")
> > Reported-by: Frank Wunderlich <linux@fw-web.de>
>
> please use the email i used for SoB in my linked patch (closes link below=
), the other email i use only for sending patches due to mail provider limi=
tation.
>

Linus: Can you fix this when applying, please?

Frank: Can you also leave your Tested-by under the patch?

Thanks,
Bartosz

