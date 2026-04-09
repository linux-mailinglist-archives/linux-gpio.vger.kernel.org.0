Return-Path: <linux-gpio+bounces-34921-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C5dL4df12kCNAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34921-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:12:55 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBB93C7927
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C67E33026AA7
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:07:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7552396B6F;
	Thu,  9 Apr 2026 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHcbuAbi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9733988FD
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722056; cv=none; b=XnpRlfiEQr+aD/IUb6wBBfFKsuxnIft7spl/r1e/dtw2S9onp3bxwP2PDdJITj2qHBmSVWaJRVYKoBu/LTpDPQBx/7tzgE/6jX/rS9swDyHX+5NcuVlBR9VCf5B9nu8ui3waroVk/IzJmqiOspXY7Xk4M+rjiynHgyQFYOpSHmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722056; c=relaxed/simple;
	bh=LZBNqEFB1NNAudAGb3yCp5RdZJ1nCcVNqjcBmjGFoJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=srzNEsywWVPcteV+VxgcNMAQUpgIf7qeN6EgEfCKTHlPgpyxSDfmpXFsdNVhz6h3bJjCDZHQBrM7g+PrnhKxpx/oUYCKfvsXJD3FJC+sG6LSWqH94ruu8kimsPg/CE758z7va+4WdUdWk+AUKiorelP2y+1CU9hSgxxvkUghrCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHcbuAbi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648E1C4CEF7
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722055;
	bh=LZBNqEFB1NNAudAGb3yCp5RdZJ1nCcVNqjcBmjGFoJo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LHcbuAbiWLfPq1Vx9L2xZz1mTbFSAv6AJj+1rEUGXxeudhYS0mTPSWgK4HqINM/Fo
	 WMYfGBdb8eblI3L8OXalo8cE/XV/xIvbk/mA3ExghaaD74lmOC7t1R6MkDX/EZDUpF
	 H7jlhtVtTj43/X2Wy2aoP8qUUJBjuaSyzuuXRcc59uP+0nrfTWG9SV+/0XxvUeBCWB
	 OQ3XxkbNLiCaGNypLSbQD1Txy1Nd3UyBWzKhWy22+wO5QBqugDL1shiknQuzpTkGWy
	 ksy59ppSUlROkcOEgSc2ifPDGn6iSpV5nhCJ9X50VAnc2auLz6UkIvfKJNx4F6VOvV
	 qSJSSQjkfEE7w==
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6501547d7edso659975d50.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:07:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUQt7yHFno9E775AcZwhZXwjydig3ZK6e1nGMAjXMz2QI7q5IlcTUnu4UMZSodFqG/u1GgDaaIzRBaX@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2r9vnsMx/gfmfxHwo/Zxoqh6Di9tnXo9xtSU42gYRn9J9LNIJ
	bEJibmpldo6YkzMEV75LbmJBkCxSwMLEzNip4B4qrVoU8DIQg7K1idTv+fKpj19R494B7nUGvWO
	W7fmPUVsByReBQ4AcGjKtDolQHluA3ug=
X-Received: by 2002:a05:690e:440d:b0:649:bbf4:121b with SMTP id
 956f58d0204a3-650486bf82emr18263002d50.2.1775722054841; Thu, 09 Apr 2026
 01:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407184805.807328-1-dev-josejavier.rodriguez@duagon.com> <20260407184805.807328-5-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20260407184805.807328-5-dev-josejavier.rodriguez@duagon.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:07:24 +0200
X-Gmail-Original-Message-ID: <CAD++jLmeCMAGmLjpSok7ouX080tQtGH9_jystGgh7RASTSrzEQ@mail.gmail.com>
X-Gm-Features: AQROBzBkavb26-WDDLAuTxTNJd_i9vbiGYa7-KJ0vQBl_oWlwFNtOPje7S_8hmw
Message-ID: <CAD++jLmeCMAGmLjpSok7ouX080tQtGH9_jystGgh7RASTSrzEQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] gpio: mmio: convert accessors to generic register descriptors
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34921-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,duagon.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1CBB93C7927
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jose,

thanks for your patch!

On Tue, Apr 7, 2026 at 8:49=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:

> Convert the gpio-mmio accessors to use struct gpio_chip_reg instead of
> the previous MMIO-only register type.
>
> This allows the same accessors to operate on both MMIO and PMIO
> registers and aligns gpio-mmio with the updated gpio_generic_chip API.
>
> Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@d=
uagon.com>

This should work the same fine with a union as described per
patch 1, and this is where that will start saving a bunch of memory.

Possibly squash patch 1 into this patch? The new struct/union
isn't used until here.

Yours,
Linus Walleij

