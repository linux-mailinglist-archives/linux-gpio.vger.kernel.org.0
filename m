Return-Path: <linux-gpio+bounces-34267-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CrYD29uxmmkJwUAu9opvQ
	(envelope-from <linux-gpio+bounces-34267-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:47:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF46343C0B
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 12:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 158A0304F4BC
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2026 11:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E711337BE6E;
	Fri, 27 Mar 2026 11:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHTeKsec"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DB1377EA2
	for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 11:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611829; cv=none; b=cAymNyDa4vxq8xof8s7Dqj3qEUoc7H3YqnXw8aIlgZbzw1LBQc40vLqWMDvotrNtxp8cNnW3D8FgWAg//DpdMGKRc3Nm3948fWngNX2eNDZYxkiwaAoVd9i+FjZ8tmcKMnP3Fgqsp+AJd9qOpVmB9OqRF7QfR0pWxnZ+HMUUZ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611829; c=relaxed/simple;
	bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ttyGULVEqGwPEh4StTn8boTb13lASqJ+sb5i8EfRfV3RUc40T6psRuVRrOYqh/YWKmdDIkHtaLv0gPfR7lqiOxM1NSv5a+vxLOeoaeFlUxQmXfFYvOTKUg3TN8kVZs1tkHY6wcNmp2aTRbnD8N+EhsIWKpyOt8JOKswsVEuLZQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHTeKsec; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso19463585e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 27 Mar 2026 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611827; x=1775216627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
        b=OHTeKsecIQkofgPEK7D5yqApFCgHiJyxutEFFCgHUl7f5wz2/L7cQT4pXxSBbxenIY
         xOoxoIpHuoVb/jmnqfsfa4h3DGVTUI+3QEUwNBSFfnj+Yq+bQpOgsv67pwurvkoiaHyu
         xETxYmRTyFJ22nGqq1LT0/n6ataQB/dGzwh+9KZkp5obvTjC8MQFQZ00orgnQfsTxFcK
         RLOKlzi7k8Ofg8ASxtnXIaAg/28OHQRjmQHx/1D1uCM82cUDEGfMZyeRfjn65rP9t6/1
         DLxEWmrS1i+H+VWlSyU5H55Qoms5TRrE+bG4OW669d9dHkVYRwrhpr8tILmUP/0rkxUe
         LZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611827; x=1775216627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
        b=ICZeivpDWp1SNDgRaPX9WuAyj4FkeIT6DAmHbAM7fi2oLWOY40Rzi2+gF6LbWaJi9R
         5ibbbljpTbIZmwbDWrY5mHeobDlvhC71DbjZVC3VaE4PEkbeTu+yaQ7lAsOusIEqefOr
         9mIdwxsG/QEjo1yKQoOK8tPyTkuPuNEereW9C49ekgGkj/uxZW4yLvz7xYxxabUk3a/y
         WEU3JcrlGCTluFmt9NSxAwrQ32hxOH28PFgIS1aZpaVCGrxtQYPO3z5T1NuSceKoyCZl
         dHfQuJjomTvCq9vTvvki4kyaA4bIyT658trBI443C8FYQnvWX+CZqDXjGtFPVPyo4+c9
         XTPQ==
X-Gm-Message-State: AOJu0YzqbK87fP6FKdg7VMDzdOrFDDqfzAe8wvh9gBkEqOKojnAm+Oth
	pT3t4HWEGJFnkWoT3QCiCyQ7a/r+C4JoF0krvkFOfOxD5tyJ5vSKaVFU
X-Gm-Gg: ATEYQzxjWQPeAejR+/Y25izM0GOCrQfS5ilIEj1MabrOWdFMbC8sQfVCqZ8rC8qxPIt
	yWSa3J3NiqVHx1WSoBjjWvSSPHZULC7uCRLREIDUx66iw10vWmKgVZzCahjtTBampoVaFXWtCGC
	d4st7LxZxauthbBJCg+U52WPbjUqxYAFse7FeZDpCdwGVjwrgyXuJl0oqVHX01ryaQQ/ehIbLgQ
	tMuPa9X4dOAV9I7bkzWucJgvztgHy/9bf+P6nvJR+hPZ/M2tZ9/LMknLRrgrnFzvOlmTLmvgSUv
	nrGOweLnP+VXazp0AKkBHUEn9LqUphhdbTdKXi5txFj6JdD/aZYMqggqj2VRxMwn3yfMOKQMzg+
	b17DbwQfaBwYDVWuICxIIAv1+Sp5La/JzW0g9x5gfXsCqqexzgdMaWkC3KidxyvcpyDYzPssibw
	HKI2HkZhZWoXms6qG8KUwkHVLC/GO0D/Rif2ayTJxJClxWsgzmewhnElQkECg6qQChV4gAKmPti
	tFgf2FWOh0TjNpWBA==
X-Received: by 2002:a05:600c:8b6e:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48727e883c4mr35679575e9.13.1774611826618;
        Fri, 27 Mar 2026 04:43:46 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e265csm15142518f8f.32.2026.03.27.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: Add missing GPIO interrupt
Date: Fri, 27 Mar 2026 12:42:18 +0100
Message-ID: <5086436.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260327113006.3135663-4-andre.przywara@arm.com>
References:
 <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-4-andre.przywara@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34267-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4AF46343C0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Dne petek, 27. marec 2026 ob 12:30:06 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
> actually registers for 11 IRQ banks, and even an interrupt assigned to
> the first, non-implemented IRQ bank.
> Add that first interrupt to the list of GPIO interrupts, to correct the
> association between IRQs and GPIO banks.
>=20
> This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
> broken SD card detect functionality, for instance.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi fil=
e")
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



