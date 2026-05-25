Return-Path: <linux-gpio+bounces-37463-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIdqHkdOFGqnMQcAu9opvQ
	(envelope-from <linux-gpio+bounces-37463-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:27:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4025CB183
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89F443028B72
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 13:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92D638551A;
	Mon, 25 May 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9j3fmI+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCD37F758
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779715475; cv=none; b=jT3nAPjySp2QApNVA6QtJlWQ5+3CgE6VlsXTyXitqQDEQNsuEe5KMrpGCxk1lodCqXnLyXuIjNp3EqUWC/VL0Wbi4875cXrTE2iQuc6heN28gImnzyyuPhAn5mlcUs3EmHUWcNQYVkeczuu2T47AHRL/9Ym/siwY26ear4VWKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779715475; c=relaxed/simple;
	bh=nPAqPw5/2NPZRszJCy4GnSz2zITQHJ3m4xhchJkWRZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JIuELgd4Xi2KxJPx+t/EFuXq1bTZ4S+awzYUMnWl6KiYX/la4G2beoDftlcldm54ebQ30OX5OJZMT7C7jub54QA8EDz10d7KeZYNdiJxAjsjMbWc9ZSCTk0U3cgpX4sl3SsUUc8U2ggjLXe3j0qx2EFw6ojJabl25ORIPOnhH0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9j3fmI+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81FFF1F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779715474;
	bh=nPAqPw5/2NPZRszJCy4GnSz2zITQHJ3m4xhchJkWRZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a9j3fmI+ZxNVvGV1yHVSsplrI4Faw/Uy6OZYV6VBC2tR3N2Tpu3/JBB2Zyzwwg+wh
	 7vz+Nfs+/ugdlHmCYMoPcJ8so8Vh+czzBUGBo6L+cy+lG5OnumBMk6PcUJWUOW1u3W
	 MnU+BPQSjzRrLBvj9whtZqoZ3PH7EaXquQ4al7Mp3B293b/nHsdJjPmryBaf1suFWd
	 58URGV7+7iHd377S7gaOA9X6rcXo2Z0IT6iygeZGT2J6YeY/r1guQARicfNORayvwe
	 QAy2Ufw74ODOajGQ1W24UzVlrzDeaZ/bqkN6VNHYUaErqL0smKyRpe17bKZYYGPXpB
	 q5wMVhXsiszmA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso7198083e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 06:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Gzd9/hjKiCfVCWglOM65tF5HI0OzXf8TwR/YfqC7QuxhlS7dVDeipAQOykddKqIs3tmqNZaqfrVRT@vger.kernel.org
X-Gm-Message-State: AOJu0YxA3olh8L5amGQa+rI18CKUxQALgEq2IvdjSx1ZPEBoT0fBeouW
	dwfjwt5sL9KzAB0aQnucx1Id+f97+itU9Gu3NhaKJsMeNoHxF1h2DNc9/BDJN08yOHGRBdaOkXg
	AR2mm7BhDNxMRjYVgV5Fk0pZXYvr4UkY=
X-Received: by 2002:a05:6512:3c8c:b0:5a4:6f5:6c4e with SMTP id
 2adb3069b0e04-5aa323a499dmr4665842e87.19.1779715473344; Mon, 25 May 2026
 06:24:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522073527.9812-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260522073527.9812-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:24:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLnpKtcXuHd8Z3dT1qkq++zLeCw+uf3iKeC7Rtys-0xSLA@mail.gmail.com>
X-Gm-Features: AVHnY4IQZwk8lSwOSkxtZBc3sAoo-AnqCNuJmuquxOFiFqx6t03-7_B_fztWUto
Message-ID: <CAD++jLnpKtcXuHd8Z3dT1qkq++zLeCw+uf3iKeC7Rtys-0xSLA@mail.gmail.com>
Subject: Re: [PATCH] gpio: adnp: fix flow control regression caused by scoped_guard()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, julia.lawall@inria.fr
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Lechner <dlechner@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37463-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email]
X-Rspamd-Queue-Id: EF4025CB183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 9:35=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> scoped_guard() is implemented as a for loop. Using it to protect code
> using the continue statement changes the flow as we now only break out
> of the hidden loop inside scoped_guard(), not the original for loop. Use
> a regular code block instead.
>
> Fixes: c7fe19ed3973 ("gpio: adnp: use lock guards for the I2C lock")
> Reported-by: David Lechner <dlechner@baylibre.com>
> Closes: https://lore.kernel.org/all/cde2abb2-4cc8-4fc9-b34a-0c5d2b95779f@=
baylibre.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

This class of bugs would be nice to identify with tools, both AI
and Cocinelle.

Julia, do you know if we can make a coccicheck script that warn
about scoped_guard() { continue; }?

Yours,
Linus Walleij

