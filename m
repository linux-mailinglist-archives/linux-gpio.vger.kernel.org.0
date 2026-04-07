Return-Path: <linux-gpio+bounces-34780-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFe/FE/21GkjywcAu9opvQ
	(envelope-from <linux-gpio+bounces-34780-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:19:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5223AE392
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1405B303183D
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AB33A3E7C;
	Tue,  7 Apr 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oibdKk1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6403947A9
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564182; cv=none; b=rLR8h8FkrdQzkkhKNDpXVFsyagl0OB0BERNXGQ7gf0gJNmI3r8twXlN7Fs68piMpzaJR1p15NRVOgwNx5mjZeKpSZdk2hfiylMdE+PBZVcNfHmhkNbQVEtkIX1KV2QYC/ECMHk88X0L+QQFXepiG+2nSIq6ugtnonYZdEru3cP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564182; c=relaxed/simple;
	bh=b7zqNQzPGOrHrc7suMZPmm5DGb6ULEs3+2u66vRRIuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAeSvML5cBM+Alch7y2+tyZSDtSRjf56aUgJMIEDqza9qWWTCxJ6XYDs+hNTu1aIvJjlb7VAhY4m3bJfasHPno+wPWmHzmWkU6QKKtoNbqzzMyUYMJ8GlxLKKcjPKSVf3ok1FOrUUkjq+6NqAXDWlpzvimW13d8krF7R0clkH2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oibdKk1d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B77C2BCB3
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775564182;
	bh=b7zqNQzPGOrHrc7suMZPmm5DGb6ULEs3+2u66vRRIuo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oibdKk1dOvFaGxu4xMFmpeHq4ZGMgm0hArYuNLHXsuPzFhQfiDnsO6sll+SAsbu49
	 h/L+ADvKix6/Ux9tSPzur8GrSEkkFeuxQKc77ahhBh31fMkHkkc5MttjyZ6dU1LucS
	 Wxs96rNsQrjGsz87tiqc3mZ+1I4C+XxbW8bcV+9ox4/2wYZ1YaOxHgdg+KaF3daA+8
	 D7u8bRsh7qcov9hNT9OlzCi7alQcvmt3UbAlB6rjwtghiYHblvHhpZu6qU0mRnQ2nL
	 Byd09Q0PycizgrLsoFyHci2WE/UKUIVVlAUtTpcsECA+DvaEe4wcWSVD1H1wY+pvld
	 MytSJRKYUM5dQ==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6501d32b04bso5298886d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPQ7hmJYMPCoT+Wh90PGHyPB2qHIUTio7ig9klHMpgu253qj0DIeoMxCX+p7XsU4+42l86a5cy2axL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8d7vnsnGavuB2w5VzRjwEWV76taHH046Oys/Fh3o9RHwJ2JLz
	hJ/FpU8JuBJdXmC6Gwl/p3dsvf2Dv9/3m3tNmWi+9aIscJfW92JMp5f4LA3MvBrdvzgCB0akM3N
	Cb3B929wk6ANItW9IgbOtQJaVNbzeptU=
X-Received: by 2002:a05:690e:1517:b0:650:3396:52bb with SMTP id
 956f58d0204a3-650485269d7mr15687989d50.0.1775564181521; Tue, 07 Apr 2026
 05:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b1ecb31a37f8e35447122554a38985cb6240eb11.1775556619.git.geert+renesas@glider.be>
In-Reply-To: <b1ecb31a37f8e35447122554a38985cb6240eb11.1775556619.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 14:16:09 +0200
X-Gmail-Original-Message-ID: <CAD++jL=cRjWiHsKYBri9s=a_+80j2XmUkiTuerpErBFDVPhWWw@mail.gmail.com>
X-Gm-Features: AQROBzCx8iFot0c13Io9rLgPEYoU4RnBy8Jylyd5MB0_GZseXKGB2hU_rHk7hCU
Message-ID: <CAD++jL=cRjWiHsKYBri9s=a_+80j2XmUkiTuerpErBFDVPhWWw@mail.gmail.com>
Subject: Re: [PATCH] gpio: gpio-by-pinctrl: s/used to do/is used to do/
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, AKASHI Takahiro <takahiro.akashi@linaro.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34780-lists,linux-gpio=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AC5223AE392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:11=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Add missing "is" to the driver's help text ("used to do" has a
> completely different meaning).
>
> Fixes: 7671f4949a6c9111 ("gpio: gpio-by-pinctrl: add pinctrl based generi=
c GPIO driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

