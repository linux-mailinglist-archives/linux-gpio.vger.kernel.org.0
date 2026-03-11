Return-Path: <linux-gpio+bounces-33204-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJDZJPjksWmcGwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33204-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:56:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0396026A9E7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:56:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F2E53054B91
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF0D635839F;
	Wed, 11 Mar 2026 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smYkHPYU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BF923ABB9
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266156; cv=none; b=lYw18uz5ER7TSZ0BdTXP9v9e5xexKM7b6Nf9XwBJcudpsOTa3RAZxzofpH1JzQZJDE71BFYPXhWLEWqnLRWpdmVn2IKGpi4XT2lRaqfqKaCr5yt7m1EzV+4ekLRD9A3J0yZ5s/M2aWk8npSO1/oojoTGmzhzXUFfFxG9pTZJHoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266156; c=relaxed/simple;
	bh=MYtvZO/BbGRyaUtiW1CaWPpzpku2kkMqM5HlcgVgoSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZkZmU8xzFqbZDD6A1HGMUamgCPTjyQ64Ide8m5nazycEBNAdvIPGMKkarYh4Eek4oyCyKQti5SuJVsxLHq08QJw9B4ubhDROE9UVEDqoQCbDqUF1PTUHB8WLLIzYA8Y6606B19i2R3o4bPN6fsWt/7i8bkHiBp1Z0Qi08vdJYZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smYkHPYU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B96C19425
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773266156;
	bh=MYtvZO/BbGRyaUtiW1CaWPpzpku2kkMqM5HlcgVgoSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=smYkHPYUlFwTM5QRETvAHmwsCpK3apejoNl7mKwM0p4/MMt4yeU/4yodIMc6VTu7/
	 0adoupBbz6pWT6lQ5/tRQ4AzV8vWljqiBu3Mw+BGNjXY/WcetVmqmNI4r1B1//a3mN
	 /i8zM7s90CgWHe3l+RmwFv/YkYQwxRHDaaFJqaik78TFfl1l+0/PI7z+nROjlg06wE
	 1SXYvNIhOTfrf7qyI/+a8WkYXbyZgpIyQmOJFxlkHutfv0IoUul6hYkCyur+LcNJ+0
	 aTTM1B8iDQwF1V0p4/NJMcDfkWalcfIfgsiNTfx02z7IoYJpzp+ohkzf8GelVY/cZn
	 0hRVRPoGAO1NQ==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c9fcc24b3so368911d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:55:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXko0x46YRye/YFj/V5G6joGJxUyo/nPO1jSHyVBYR80fooOMC5qmDTrDJ+fQGzniKq394k3Y2z2nlt@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3LiQVFOUllnNJpFlBPPXa7wTdSYvo3mBkxnpP2dkKBcyYSPm
	2y2S8VSAJRA+AHYGWjfu9QkJQzcseFo6Sw7wTRcGs0t43f5/XIyAdFicT1DNDVB9bxzO+hffzhX
	UkxJsSZUkGE3XAZw6id9hX8nZhRyNlgw=
X-Received: by 2002:a53:ac94:0:b0:64c:b7c9:dffd with SMTP id
 956f58d0204a3-64d657857e8mr3936645d50.58.1773266155816; Wed, 11 Mar 2026
 14:55:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <93920f541564bc4e6aaf0f2b6df2f5aca721d452.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:55:44 +0100
X-Gmail-Original-Message-ID: <CAD++jLnxGiObvKanE37GqNutfb-tuND6yejoBX1vU07OfXGMZg@mail.gmail.com>
X-Gm-Features: AaiRm52MUn3UfXYMxhfr4nz1DHo7Fg3cEkhE01vyGrUyMO2BVykJE1yhFqO9Bq4
Message-ID: <CAD++jLnxGiObvKanE37GqNutfb-tuND6yejoBX1vU07OfXGMZg@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] gpio: add pinctrl based generic gpio driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,intel.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33204-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 0396026A9E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:39=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> The ARM SCMI pinctrl protocol allows GPIO access.  Instead of creating
> a new SCMI gpio driver, this driver is a generic GPIO driver that uses
> standard pinctrl interfaces.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

To me this is as pure as a GPIO-on-pinctrl can get.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

