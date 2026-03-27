Return-Path: <linux-gpio+bounces-34269-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YN1KNlRuxmmkJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34269-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:47:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A60343BE6
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9266330DAE27
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501AF382394;
	Fri, 27 Mar 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BabSZsKn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E188381AF4
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611833; cv=none; b=PYaU9vH1vsG2k2SJYbuHxgwgZTDyDfif0KtG0qQX0cPfCXywFA/cY367bkU/3fppJwF1KPkJ7uTdgUZxLnrdXOR+qYMqIE0gkdDKHcXvKRFtDkMYYbsQCJNIl3gR2LUZ0IapGNOoYOy7KFvSjaMpokXm+4ync686U4p8glc4R6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611833; c=relaxed/simple;
	bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G+mjqZBfthfCg2YNcSi/Or/HYM47GmxgFIkA0CqmNB/nNcA3Vbsmwj51tvXEDHHlq3wkmsy55EyGoaAQmWVOio59Xw8ibLEOPZChFHyS1/bYhY0SLgdLHLOtgIVxV2lyvsQPGv22xdBdq93nNi/Q59sIn4Z6UNvM4827pcCrfNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BabSZsKn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fd27754bso18819115e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 04:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611830; x=1775216630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
        b=BabSZsKnOO99HHWQQXFoIzpAxk3giCxlB76Y+7KLcZeZmxpVZgmiW+YW9jCAXCgAiX
         AE3eDs+oS6YqW3cb/fXeIZPUlCUlxXrTk53O7vi0DzfloC+3IQpRzEDG/VbEq9DVfAtf
         SzWCrtjghdEXC/fe4cEjIPGvx4IxNX4TECqyKauorHzyxNiydYY83F6PbuSDbF1Pnk7t
         F/DR3Bilwdey/aBj5hi3h7LKMZ4967TXtn8ZG6+cbdl/ZaC8j8R9CYuvy+/wuBDxKUwm
         2ly+4iLa9+ZzKlUkMKkh8/gLYbdzKtJse9e43Dk7+j84OiwRzjFuiMjIujgnCwXYt6oZ
         EQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611830; x=1775216630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FEc9lT0BW2KeKXQ3ChIovGLpCHr9pq972Nq5Th8ooKA=;
        b=YQ6ExkoXr8SrcGqXOCA7QZDNvwFXziiJBsrmAyZBbp5jyCSff2xQnS3uVhUBtaJwnP
         8FdQUTmjLJPcTx8pXDlkgvfNRQzjDezb2AR/ylx/4RK8sT3EIUZH69rCViBnSDuMWZGS
         AFvbBMN1qYZV4fZX/FzhlUEiKRr05xeQ7AAj/f9tGMGJugNbdjD3RdxfNAyz2DXSx48D
         c0OAgmRyHumk1QbPhFw5gjfTh+J15B5+1bf+uDMV2Km/4cUc53E9D/BHLKHewFq6JxJd
         SRqNt3Z8rjNOccQeEVPZdXXGFLE49ez46nK3XnHvAh4p4VoTzapi1EQrOq2oglkKMyJJ
         fzFQ==
X-Gm-Message-State: AOJu0YwjB1EcSWVWU+ATsKfOegmKbnYdiq1MaG5Xy3N5exAecXTp15ZZ
	7yHuc2C59+SHS5O6aJQ7CQo8Wc7N3yuGtXTMuv11FUDsIda5UxKXu5vr7JZfRZaeY/I=
X-Gm-Gg: ATEYQzxkgZW+Lo21tcl7soWC6q1/CrTyoF+tdXHuWJrXoFvS3YGG3y1yVOgcDYiiF+S
	ndF9G9CfPn16yLOsuy//5AYLCYdOT0uGYZB99AcZ1zuwkmyECHfyJsHvAyFeTKMBk9xISWQlbVc
	uMJfQEUL+NsLVYL6Vo3MipmivipzaX8HfLxZArsLpNLIqNXts8Ct5F1GDQPQPyNJu2a+AomTqPB
	SVwA8uRZXe2+l5NEZpHUPxQHVhU7DAgc5EIJiqpsErMFb/Ev39npPU5cJiKWwPWjWx5UapEKFVU
	Xx5jQ+PGLce5bJI9wq7jn8Kp20jc3f46zA0p7UFAVnCFyFeiIdOZq9jKRF++3gPwJu18w8INNqj
	3E5ulMECxZEXjanD2tzVP6Jxhpy2GN1Y7seWZMzcG71sXWzyJqlqMMKmqdiyYrkNikXUtLByOm/
	uH2mSC5XszVurz2KOcv3O9TmOkN/qglLPKMh9Mi6toc45kH+XRV4LVIn9rPiJWz1vjd0+JEcsea
	cX82mQsVcYMa6ugqA==
X-Received: by 2002:a05:600c:a06:b0:487:1108:48af with SMTP id 5b1f17b1804b1-48727d59ce3mr37657225e9.4.1774611829936;
        Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm14813099f8f.30.2026.03.27.04.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:49 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 1/3] pinctrl: sunxi: a523: Remove unneeded IRQ remuxing flag
Date: Fri, 27 Mar 2026 12:39:42 +0100
Message-ID: <2822911.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260327113006.3135663-2-andre.przywara@arm.com>
References:
 <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34269-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jernejskrabec@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73A60343BE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dne petek, 27. marec 2026 ob 12:30:04 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> The Allwinner A10 and H3 SoCs cannot read the state of a GPIO line when
> that line is muxed for IRQ triggering (muxval 6), but only if it's
> explicitly muxed for GPIO input (muxval 0). Other SoCs do not show this
> behaviour, so we added a optional workaround, triggered by a quirk bit,
> which triggers remuxing the pin when it's configured for IRQ, while we
> need to read its value.
>=20
> For some reasons this quirk flag was copied over to newer SoCs, even
> though they don't show this behaviour, and the GPIO data register
> reflects the true GPIO state even with a pin muxed to IRQ trigger.
>=20
> Remove the unneeded quirk from the A523 family, where it's definitely
> not needed (confirmed by experiments), and where it actually breaks,
> because the workaround is not compatible with the newer generation
> pinctrl IP used in that chip.
>=20
> Together with a DT change this fixes GPIO IRQ operation on the A523
> family of SoCs, as for instance used for the SD card detection.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: b8a51e95b376 ("pinctrl: sunxi: Add support for the secondary A523 =
GPIO ports")

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



