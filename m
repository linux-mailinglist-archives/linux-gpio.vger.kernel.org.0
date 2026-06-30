Return-Path: <linux-gpio+bounces-39197-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IuNSCQWyQ2pCfQoAu9opvQ
	(envelope-from <linux-gpio+bounces-39197-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:09:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 856056E400A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 14:09:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HxWnekzV;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39197-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39197-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 87CC6301C96F
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jun 2026 12:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56081409627;
	Tue, 30 Jun 2026 12:09:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B703EFFDB
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:09:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821375; cv=none; b=RjTi1o5o7y9E4EbMYYPu1YqgO6Xz4JcK4segXTAYA19bOhw/maGL3n9Z8QSyW3jTAodzEaOlAy3mIhFcwgbfhgSvch6IByZHOKVCylk4KrmL/5hhzL7Yx+kMBakUFvjVXr9sPz8UAxx9VKP3DNvyU5iZ2PXfYN65hL87reI967I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821375; c=relaxed/simple;
	bh=fPzNnAUjaXPzKEMaUAcXnvgXNPOc9WW46i0l8nwtZhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=END3FFFGshT3nPiAWURz224ZujFz6dd4k/3OqeKYTUx1ia/Oev5tozS9xNbKpBR2vdI59RWC8jVG8NZZTo462Wp6hQ7qt0/0+Rja0jz9Aolg3l5rEVwW2kPgyfZhN8W/+HH/gzlsHEM1He2KcRgK3QjcfCpzjurHX7wCcmpnoN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HxWnekzV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C771F00ADE
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782821374;
	bh=N7yjC32RZFO2zeCVufXjAZbsnHlmLLdCxMY1qn9+twI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HxWnekzVNrYHDVq5CRoGXxbLwYY4KtZLZOLecdyaq/k1YKa4y6Fg5/QG5m5QeVuku
	 9+RKOPqLQq1aHvAu2oMNtaTiHZZD0IwnuIAmumlHR+YsKqTF84m5970Q9QBGIcbg7O
	 6xDFmWi321X0qArYS/gMEFR0bd+rhtt2veTxQfJwIHRsef/j9teZztjsoBCjE4RvtG
	 odITAam2ud5YAntDzR5vQx95Jn4hQAQ7YTTpmBCfoXZ1SLtnT3qFMq0wxPkL6YBK8W
	 7+pIzHTZ2t64EIN4Bq9MhJzAvPjvw0UoLSQ1EFkUGg9s0vKArAaMode02EugIxGoL4
	 eGKXx49+ILBxw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b26e2ad5eso2585521fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 05:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqx1nkeqko5dJU/XNriInUE0TCGTVBBLElMQc/e9sSAQuWHmQ3hn4zTe3P5W+I9+33g1OkWVU32TFM9@vger.kernel.org
X-Gm-Message-State: AOJu0YxeBp6LPLYRqJ1oIoi+QTnIEdgGKJpBorD1kYzHPVFUIQz13NEb
	5szMwEdSngAWxCyLMvu7LThifcYiKkHWbzANs88h/VO264PeFkJ1GhXF72RqUXIXU9mXHGlF6Xw
	mYFK6V6wSe4SexainMyLMATKF7T246gg=
X-Received: by 2002:a05:6512:a354:b0:5ae:b7c4:d2d2 with SMTP id
 2adb3069b0e04-5aebdb8dd04mr655348e87.12.1782821372740; Tue, 30 Jun 2026
 05:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:09:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
X-Gm-Features: AVVi8CeqvdqmX1k7t5vMa_RRoP0ZutCzLez8z7gtB59RFtVfKunQWvBDYQA20dM
Message-ID: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39197-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,genexis.eu,collabora.com,vger.kernel.org,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mikhail.kshevetskiy@iopsys.eu,m:lorenzo@kernel.org,m:ansuelsmth@gmail.com,m:benjamin.larsson@genexis.eu,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:srherobrine20@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 856056E400A

On Wed, Jun 17, 2026 at 5:37=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC

No comments for two weeks so patches applied.

Yours,
Linus Walleij

