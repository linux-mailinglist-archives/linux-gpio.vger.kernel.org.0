Return-Path: <linux-gpio+bounces-33199-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF03FQ3jsWksGwAAu9opvQ
	(envelope-from <linux-gpio+bounces-33199-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:47:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7D026A8C8
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 22:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8C07301F7BC
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 21:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7CD30FF30;
	Wed, 11 Mar 2026 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja8lRA5t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D36D29B200
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773265673; cv=none; b=avwFPV4S5irVbqnjYdMc/mFJqrVPYVj1D6TWQIQofCMalcs6SBus4TfpWD/E1qQZKciMn72kLnPL2KPrN1qalIkaQqTTkcNczoYA7URlO+xevkf5kbWby0bMPF10LPQJATyKA32p0Blhdu1DG/PBKUZDUICcxJtR1+3jIdJEVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773265673; c=relaxed/simple;
	bh=xZoGpIkJ+CcJdN7MjIqbK82BEmTEKEPE9Fao8R4QUkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pYCGumeNK89d6dsBnJQkDXT/EhVlaOiEq7T78gyvv+enAXZn0EFP9qQtVyo9uVmXL2/YWc+NY30BaTxXAIgo55UXC+q28Q/PtU784cnIG9Q2CrhPHrU/1v1MGe4lilKIx6RWIOQRuLnQFryMGh3FF8WmaaOIokvt7QgRapQ3esI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja8lRA5t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C97C19425
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 21:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773265673;
	bh=xZoGpIkJ+CcJdN7MjIqbK82BEmTEKEPE9Fao8R4QUkM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ja8lRA5taDgFBazbbM6nBSNNpL5WonKAIKQ2Ba24fGYgoSgEx95iFkFMfjB8ShIRU
	 xe+G6VDBtnc9PVA+I4TIsyEVzV9f46FTaERU6pq5FK+YpRiIDa/eYWXgxOIpEsT/wj
	 Dv1Zm84XD5boN46065TC5N2tkotTRzviT30GZ4dKuH4YpcoDktMZo8zrDGLTdvfkom
	 iXRzQyIfLc3inEJAYJmU+a9bth/Dy5tBsdGjDnAKZjZeIs2rK3pfye8cfYLX2Ilwo7
	 rZnTLMCGwZ45Gt9g31pa9muv8FBsefz6Nt8utmt3ErhrDHj5qcozqSs4iueAsknnPs
	 oKme5Ed7oFoIw==
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-64caaacb9bcso455042d50.1
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 14:47:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuRPJPBKys7xyeep8vhZCILFXTOewfgnCr0TXSGvPC+nKyeKgUNR7yk9C07ONSBJmZLvUpXLERcxff@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnIfEwi56/MoB7l06oMUPRj/caunA22yqFbfsNPLRxOj9BiPQ
	4tc25fMf54DCgSXjn8Oe7mep4xUwcrNazHI013RdNpzcUXQD+9lfCztwdD9f2X1DE29kVFMeJbo
	ugctNrQns5mH+SxaG4GllqmcEgH7p1Go=
X-Received: by 2002:a53:c048:0:20b0:64c:b395:17a6 with SMTP id
 956f58d0204a3-64d656a8906mr3058219d50.9.1773265672362; Wed, 11 Mar 2026
 14:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773150895.git.dan.carpenter@linaro.org> <350d922ad791ac72756caa91e1551e16d7f511eb.1773150895.git.dan.carpenter@linaro.org>
In-Reply-To: <350d922ad791ac72756caa91e1551e16d7f511eb.1773150895.git.dan.carpenter@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 11 Mar 2026 22:47:41 +0100
X-Gmail-Original-Message-ID: <CAD++jLnJmB9=i7rpJ9Dbazcb+gLjANT1aPk9aM9ywf2-tBTcOw@mail.gmail.com>
X-Gm-Features: AaiRm51I4iQ9iGQm2TITNqmoVbJ_9Vce4ddrm3EdaBTGh0HX-WqDMG8Ms1nqqKU
Message-ID: <CAD++jLnJmB9=i7rpJ9Dbazcb+gLjANT1aPk9aM9ywf2-tBTcOw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] pinctrl: introduce pinctrl_gpio_get_config()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: AKASHI Takahiro <akashi.tkhro@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,intel.com,oss.qualcomm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-33199-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: EE7D026A8C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:

> From: AKASHI Takahiro <takahiro.akashi@linaro.org>
>
> This is a counterpart of pinctrl_gpio_set_config(), which will be used
> to implement the ->get() interface in a GPIO driver for SCMI.
>
> Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

If you fix the kerneldoc as pointed out by Andy:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

