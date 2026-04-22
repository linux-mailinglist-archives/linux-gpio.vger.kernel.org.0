Return-Path: <linux-gpio+bounces-35366-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IpIKav66GnLSQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35366-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:43:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F42F448D19
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 47FCE3008D72
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 16:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074CE37FF7A;
	Wed, 22 Apr 2026 16:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WucEkB2n"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD74637C0F2
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776876198; cv=none; b=nOwBCnTejdd6Nd6NKca9GAQAMXwW+F8KzwFRxcpLET4Rscnr7GmkRHekuvRyojFqpbC+UiDDkDBcwJtXhisVOigw5qmEJ8xLJN/LcNhSvL3p7wROpSFrsRFonLfIretDBGnApzOOm1mCfww7yoCFzSntXlMQS0MBTuIA92fiLMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776876198; c=relaxed/simple;
	bh=ki7ctX2Txm7d7ZEc99PkVh8KlJFUEtHlN9kAmelJoSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A61mGguKu8B/CaG/9GXWhv2NWlN5nJ8Lm9fnSAqd6b8boR+iscd5uuQ6ZdkZBx/UtH2ShavXA70huU6Y3stkJKXVgK4Qu3tk+9xoSjESgzzw1CruBe4mI2EmFxMkaSNcMtbVQpaO3q4DyWaIXR6WWEAeeKFlfrHvmImunpp3JCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WucEkB2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 684FCC2BCB4
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776876198;
	bh=ki7ctX2Txm7d7ZEc99PkVh8KlJFUEtHlN9kAmelJoSo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WucEkB2nXHMf3JGXkpu4TuvUkFUPxRcQ4FmIOo3cLWiTlRnjq/bwJdJhDVnO4J+lg
	 qbWl230lowxPzs8YqMVDqMJBjGmpZXRqwpyJQWdKSEy/IpNupzoBhPt0Ofgxv/Hsi7
	 oY6gNoab8S+89z0KDxzd+Are5fNvwgjkFsypIMqVeQGZY9XjWA+3r4mUhq6TMLTnwo
	 oeB3GxeM82SkQ9LT8MbHAg3o+PzTIu8ptGjqER0PGQBD6l9jzjW7VjiSyXI80ZY+is
	 VzffIYWCTzXwGj0c/+iB5k03TBf5eijkfQtBhjSSJmzZGL30tVL80VxeZZumc4wRp6
	 TdQHppXblRbQQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59e4989dacdso6249171e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 09:43:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/uD6QBqDZwpGRKZnCYOzvglAwZctdLr2CGMDy/MCF78CdtvHTk3RSrG/PgVZlQ+R/VLx+hB/qNe6Db@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ecbZ1UxSlFtsOjMMDhmBYeOT/BcE4Nfb7WdNG+2cePMqDRUh
	MdfVcUFulqaYHfeuTg1Zh7kNX5XrkeAOm4RKbltFDxpMQWqdXBNwVWbRbU3cDX+BJGuDqQ8y0T6
	EvxrWKg+vZcJq59hnArfOrHkQMxDqzJo=
X-Received: by 2002:a05:6512:6193:b0:5a4:1cc7:f744 with SMTP id
 2adb3069b0e04-5a41cc7f91amr6365794e87.6.1776876197106; Wed, 22 Apr 2026
 09:43:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413102326.59343-1-dev-josejavier.rodriguez@duagon.com> <20260413102326.59343-4-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260413102326.59343-4-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 22 Apr 2026 18:43:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLn-+KMYwxM6xRJi2BT-c1gBHHp_4qPMAdMSpv-MjEXL9A@mail.gmail.com>
X-Gm-Features: AQROBzAAJx6D6w16YtyUS9T1hgK6MR3tXisedCrCmxuKxaq5FRq3ou8rLvVVqUw
Message-ID: <CAD++jLn-+KMYwxM6xRJi2BT-c1gBHHp_4qPMAdMSpv-MjEXL9A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] gpio: mmio: add port-mapped support for gpio_generic_chip
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, wbg@kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35366-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,duagon.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F42F448D19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 12:24=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Add a new structure gpio_generic_chip_port_config for configuring
> PMIO chips. A new function gpio_generic_chip_port_init() allows to
> configure them.
>
> Add an io_port field to struct gpio_generic_chip to distinguish PMIO
> from MMIO chips during initialization and select the proper register
> accessors.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

