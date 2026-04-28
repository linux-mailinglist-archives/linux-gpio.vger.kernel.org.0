Return-Path: <linux-gpio+bounces-35667-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K7rHUeE8GlwUQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35667-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:56:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B7481FC5
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26E0D30D5838
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D818E2DA757;
	Tue, 28 Apr 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1bFoL3O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9833826A08A
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367741; cv=none; b=XPcpUgXceZOyV4i10rHuwvIpSnuvl0+88yVAYmRFh+rhBbfrUB4PrKI8p6pEyHpcmwRnJPNJkntvhnagYWzfKUzS2cVcfjMXscKMqxQmiQ6ZwRGnDMl3xzj+29hDXeVDWojhbOIBuOwaa6R1JzJTouLU2yEd4cXStYOhSbNW8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367741; c=relaxed/simple;
	bh=awpELMqLUdC0kYnkjNOuts6q9isGcctAxwhBeu23+34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MIX1/iM7B5wdNiF/KnYkpe7zMoowp8t/VhKPlqFH8PjWsBMKBHDGlaf8w6Jhb2WekIcG5sun8Byg25MwTKYb6XjZ+ozOhxF21Z2zoN4sDeL0mmDXANJhTq7PJj9I6NAft5Pk3iGqUzeXBDNuBemuM8qV656E0DRuvM57YIGXZWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1bFoL3O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511B1C4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367741;
	bh=awpELMqLUdC0kYnkjNOuts6q9isGcctAxwhBeu23+34=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=p1bFoL3ONb2N9LyVXGx6WTlxyeup27+PT+AG56WKrCC13lT0zePBhzWossmwclYJN
	 WAj7ssur5Hfek/KJ8bFn8DkUvMun1O4+g21SFNzydG3z2PUMdnfqy6D1ETWKnVGuIt
	 P3twbD2h0F1q/T8hEYkJvhyh+zMBWUIxwbphzP8qnd+PGYPHRwjsDCe7Z0MmFrZnVN
	 W70VMbITlSt0nFSVo+i56iumi3+D9DCizEJVIPyiV8J+2gvNpDcKgZJG5kq9b3jOmm
	 Sjr6Etwcy9W17VNnHvNsmf8auoiZWIlyy1/tynkmUAHKkZj0o39ZzOG+xGQqLoiwJQ
	 mbAF4fY/M4nwQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so16826014e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/mGEv3KJMhW03Z5/zTcmWgiKehPKVvvoJKoiO7TyQmI1NAhwebKr7WVX4PuMe/jSQaFPdhpxFZsPwx@vger.kernel.org
X-Gm-Message-State: AOJu0YxTTBZH/H2MQLO4HuAfpoFkAErQpA4BkUdgQVeyK6N365vP5/UY
	QWnWIEBaFre2D4j3qvs9nW0C0aiHTM3I9TJEuAFoFWBqaM3OvrF/qsj1/Bw0WojhN6KAopzdPWa
	DpyE4B9DgAldatI21+IUd5wrzLNNsZaI=
X-Received: by 2002:a05:6512:3984:b0:5a4:ab6:81ac with SMTP id
 2adb3069b0e04-5a7466229b2mr713237e87.34.1777367739994; Tue, 28 Apr 2026
 02:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:15:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLk6e0mATHVKdCifmNWxercHeAs8EZWmC_BNLuNWagk2gQ@mail.gmail.com>
X-Gm-Features: AVHnY4JjDqOCD7g_W9kH7halVekL6hGvEDu2BPCJ-xFboqoZ_gLn0TH30VkPJLk
Message-ID: <CAD++jLk6e0mATHVKdCifmNWxercHeAs8EZWmC_BNLuNWagk2gQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: nvidia,tegra234: Add missing
 required block
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BB1B7481FC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35667-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Fri, Apr 10, 2026 at 1:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Binding should require 'reg' property, because address space cannot be
> missing in the hardware and is already needed by the Linux drivers.
> Require also 'compatible' by convention, although it is not strictly
> necessary.
>
> Fixes: 857982138b79 ("dt-bindings: pinctrl: Document Tegra234 pin control=
lers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

