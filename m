Return-Path: <linux-gpio+bounces-35075-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHGRL6uk3GkEUgkAu9opvQ
	(envelope-from <linux-gpio+bounces-35075-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 10:09:15 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B083E8DA5
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 10:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92E84304C104
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 08:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A740F3A256D;
	Mon, 13 Apr 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVL+C4Zl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44917358387
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067278; cv=none; b=o7KuXOH0tcepKRwJ2t7E0pr0ayTrHj6zSNSZ6hwsKqvL2LFPHeIVbY95/na2QnEb/YVZSNMk4McVOvNrpIZg4bLDZSufUtPV2g2VaIHiitWB+vv03Wr5CQSNnNwt77cXPtJ5IDvdxTk6d8O25AaMkQMSYSjV4L9eAXr+d3Q9v34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067278; c=relaxed/simple;
	bh=hP1el5xOJ6rC5eOpWPTnKPIlVHp2ZUXrZ+j7CVleAq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jr1VxEsa+Any2N1FQ1N2JAc1mKvYR/279WI90Oyu72ZwEQMwljpDmLXEOAr53sYzrv2A6OrFKqpY/ZajwW4HJBii0Q2x0iYL5Jvmxzq379r47E151QIbEJerhvaUZC7+oS2BmzwYNVFpXBFUfpa+Oup5BFXObmhblFnMBSWSn8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVL+C4Zl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F078EC116C6
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 08:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776067278;
	bh=hP1el5xOJ6rC5eOpWPTnKPIlVHp2ZUXrZ+j7CVleAq4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XVL+C4Zlx2UQ+13koLXQcEPQGEYAoHM+f0LLebzDe96Dwb480JRfo4MTchku3dCTW
	 tBITlIPs0vJiPMM/IcM1utoDatp++soq+yU/OBW8rP657qOO/Um+Bw1vzea9K0/sMM
	 e8isoJqw6QJ1XzoI69f/4RW3I+sojwEV6MmZXeF9oM4HX2u4Rhj+wZUwDLBj9oNMVB
	 lfZPSCWll3xebdJ2uP5P3ykgSg7h5pa9dx0NBarNfmiVMFYgLOjEVZWyNj4jciBJ0e
	 SyRRNNrnhMnz0zgec1XVgwfnbVmeIRxM7mYfmMkuqdHzQ+pd2hcdHrX4BMM3Gwgie4
	 1zDEbHlo1Po5A==
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-651c7ddf514so647890d50.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 01:01:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8uK+HaKzMrpVtKuZmWbiQxMLiXvD3Espbtr+p3BqpYXPiRiqNdtGuSRcjzfL/cefBJ0Leeq6HProKj@vger.kernel.org
X-Gm-Message-State: AOJu0YwZwY2gEVd2mhXdBn8r4fd2nbgp9KqHgfV4oacZ0ZqiIsyViOUL
	h1tZiU9CQJxxoGK6+eYNFsckaEprvlv6OWdyb8sYuVD63sqIha0gyX8UVxpXwoAPyusgsUdLAfA
	LX+NP/s57Ddir02wnMa8l2bRBjg3/Wiw=
X-Received: by 2002:a53:e1f9:0:b0:650:1d3c:2ae4 with SMTP id
 956f58d0204a3-65198a7ff99mr9464905d50.19.1776067277379; Mon, 13 Apr 2026
 01:01:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com> <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
In-Reply-To: <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 13 Apr 2026 10:01:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
X-Gm-Features: AQROBzBVbNkZQd5M-JIcoCwBqTnfC8gpTQhwy0nP69ggr9JlXF4NUsZC_rYcX28
Message-ID: <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Frank Wunderlich <frank-w@public-files.de>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, 
	sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, brgl@kernel.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,fw-web.de,kernel.org,gmail.com,collabora.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35075-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[public-files.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,public-files.de:email,collabora.com:email,mail.gmail.com:mid,qualcomm.com:email,infradead.org:email,fw-web.de:email]
X-Rspamd-Queue-Id: 13B083E8DA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 11:24=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:

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

I can't fix this up because the closes link isn't working right now.
Is it the same
as the one this mail came from frank-w@public-files.de?

Yours,
Linus Walleij

