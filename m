Return-Path: <linux-gpio+bounces-36621-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J4/IzM8AmrmpAEAu9opvQ
	(envelope-from <linux-gpio+bounces-36621-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:29:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AECC515DF4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 22:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE3CE3094AC2
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 20:26:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976A9381AE0;
	Mon, 11 May 2026 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LldN6Z98"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8C33803E7
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531188; cv=none; b=P2YfJsYMt6nAsWNvO6+pdqpvzbMlMLY2q0lAcKdxK5zBUWof2OuPe+/0SlDOjel4ZIej4i1H0IvbCjSRwAEYBtxF+DtZXLqfOtBEoYd1OAwMG7ChjgkoPWRCF2g0IAQ+dl1g61ph5pjS7YqCK2KpVBItxHsPGV4iJIXosTRz298=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531188; c=relaxed/simple;
	bh=p0T1y41gsuJUzACGoRDlevBaHaCBq9uhq73rg/Jmuv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M99JLmC43H3LZ9Yp419VqJJ2yLOxz9z+IoclMSypMEgS5OdwsWQLuKDxKHnoJy2Yrf4cJDLY2spIJJo80AqrIcGT+Nt1uE9CzWF4OsonfetGG5+uN5eWdG9/FjOZcvJWr/Jr+gsLAIYmdfKlAih6zSIrEJWKt7gnv0K+unranW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LldN6Z98; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BF6C2BD04
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531188;
	bh=p0T1y41gsuJUzACGoRDlevBaHaCBq9uhq73rg/Jmuv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LldN6Z98cIgedoQ1TaLfLMP/zwRW1yu3s8fnf+NqB5fpUaJErnQj/LdGUHUIbsrw7
	 fQJSFVSA3VbmVbWbuzpebSy3C2ayRDTjSSVskDWEdZcE5oZNLVgN3hKYpMpiwAndkm
	 njYHMEK3UlEaazRrFCPyKJGvCOsbaMUNRoAX2hc8n3Pud/3BuKD40vr4gzZqcZMnp9
	 nXDo8nlYrOMj8wD5YeGWzIox+ALVpNi8mr6c50USXyVzOVrO98I7GC9UraE9JcZaSp
	 DGGVXsYe8iMsscqoWnr798QNy375S5qz2GKMaz5KybayrdoWwTHEcEQMtNv3JA6cyA
	 JEnFk+dVB0gig==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1879626e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 13:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/17ZiFiCNX4lVxZ4FLAxYGWpLKl+s2rU6PxICxEKry+lJOaJ2CIqlDh2Q1R51xSqUUQTzdgQabZigi@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7rj/PSnHLvVUW0yRvHhrjGuigunOQ7aAdgt9JdmFbkrtCvIJ7
	aFcqH8meJ8TuNIUnm4btKHeYrnDX0Rdw8jJUcKmMw2ZysHoFIAshoEGZd1rgWDpoQe8Wp+Hyttu
	Jxyis53TwX+1ZG3TwOplD5BSZAnuMKB4=
X-Received: by 2002:a05:6512:3c9f:b0:5a7:46e6:74c4 with SMTP id
 2adb3069b0e04-5a887adfc92mr8322271e87.9.1778531186735; Mon, 11 May 2026
 13:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
In-Reply-To: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:26:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
X-Gm-Features: AVHnY4LSYvXrv4DsxJcvRd4oAMpQx2wvvbKBiUjGdIh3JcrN5btqHfX-VZZ23tw
Message-ID: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: add support amlogic a9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1AECC515DF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36621-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amlogic.com:email]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 10:21=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> Add pinctrl bindings and driver about for amlogic a9.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patches applied!

Yours,
Linus Walleij

