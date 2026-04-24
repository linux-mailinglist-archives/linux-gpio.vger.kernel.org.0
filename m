Return-Path: <linux-gpio+bounces-35514-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFePIBLV62kASAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35514-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:39:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940A4633B0
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 22:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0FB19300B2B8
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 20:38:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993153FB040;
	Fri, 24 Apr 2026 20:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYmZ6VEE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0703E928A
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777063130; cv=none; b=PMJhvH9ez39oeCfmeoTveniBBQnqlqusIXfLLnX3PkDR57ttoTZkuOGbclc5/s1+1G0EfhBENIHwrlaFUw4NH74bO5i81RDZrL/3zoizGSrC0iClUKdkqXDAhlKg9P0vQHO797xgMstR+NYR722Yp/NnrnrSbFndGYJ6bs8ENkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777063130; c=relaxed/simple;
	bh=EGZWobRDd1pQ2qAOlqgF79jWqIefJzqPKT5YQuglEmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FtAB6CTjP0BAvD5DQr6nsUA4dQZKl9TxTH90o2Q7cglOSxvb1QZvMHBbDJbMds6bwt2KBTOjYjRf3lLeIuAp4B1zZEgsFBNAJt2cjOYYqeiALIucNl/PtOQoL6d0AhN9oh0uNWxL2zcpIHONQOVF2aGXd069w5Unp7NWAnJuzqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYmZ6VEE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B00C2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 20:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777063130;
	bh=EGZWobRDd1pQ2qAOlqgF79jWqIefJzqPKT5YQuglEmM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bYmZ6VEEm6UNUb+khHlbfkSd9okr5pwLNILwKbbCkQ8DJIsR+H96hAH0xM+fDS+9s
	 GzWsDNPoO8yghaLzjRQLmxNif9f4LywDUpVxeU1ap59ovoBWuNCgge4/aAi+sfAhNI
	 r/CXn6y8AlMBaihSRij/GIsPWRx1f6zrJ3M0rCaYVw+Mqwld/iXsZQ0XP4eHRvEjNt
	 1SgoHj0EDKrZgw0mwYekd8pUcXix9mXRr7Xr0dlyYoMFaBDEomeMLWuvRLTJ5qR6j+
	 myaV9kI0hRHF9yW6rQLMfjf69csqMrTFcZkVUHFqM3JsEjpp5uGlRScZGcqDA07vkV
	 UVzhCDEfGe3Ag==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so8954297e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2026 13:38:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LDyVwQ4DbUWIzvXeLmZyA3STK6BPb41Lczm/gf68a2P/OEt9gQNZCUKbyyKU2q79s3wpDsDq0oS9t@vger.kernel.org
X-Gm-Message-State: AOJu0YxChPE1KRqnXIPEwhnzIeraRsrbfOMPqjRXL3OulfU6KEAICfRI
	l3yoz6rgy0MYMTsqSw8wGmcCxTgj1g2lrotIUaujWLHVCh59ajpi5OCXPClTt1UtFqqQCWgerKN
	k3jJKXF9JkAaDJpcgwBhf8yYBQR+YMgU=
X-Received: by 2002:a05:6512:6193:b0:5a4:1cc7:f744 with SMTP id
 2adb3069b0e04-5a41cc7f91amr9828104e87.6.1777063128768; Fri, 24 Apr 2026
 13:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424115920.54707-1-mohamedaymanworkspace@gmail.com>
In-Reply-To: <20260424115920.54707-1-mohamedaymanworkspace@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 22:38:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnKNUS=VONsgFwX7s3Uze2Dps9C7UX2f1g+0Vu6q5Gn_g@mail.gmail.com>
X-Gm-Features: AQROBzBPDbyXgYyf-AYvDLF8jPftmP7znr4goFmliPg5OUP9f0ac20UYzZXLdi4
Message-ID: <CAD++jLnKNUS=VONsgFwX7s3Uze2Dps9C7UX2f1g+0Vu6q5Gn_g@mail.gmail.com>
Subject: Re: [PATCH] gpio: ep93xx: use handle_bad_irq() as default IRQ handler
To: Mohamed Ayman <mohamedaymanworkspace@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 8940A4633B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35514-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 1:59=E2=80=AFPM Mohamed Ayman
<mohamedaymanworkspace@gmail.com> wrote:

> Replace the temporary fallback handle_simple_irq with handle_bad_irq
> now that the driver operates with a proper hierarchical IRQ setup.
> This ensures unexpected or unmapped interrupts are clearly flagged
> instead of being silently handled.
>
> Signed-off-by: Mohamed Ayman <mohamedaymanworkspace@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

