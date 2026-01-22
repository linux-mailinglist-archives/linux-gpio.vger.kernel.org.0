Return-Path: <linux-gpio+bounces-30906-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPMBJmVCcmnpfAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30906-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:29:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EBC68D4B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:29:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F16630021E0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 15:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2D842314A;
	Thu, 22 Jan 2026 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nsx1ywyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9582840F8D1
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095144; cv=none; b=i39vEaPMhPS4JkU3ODO7t9UNfbQSnlQu8RT04vMUGEqTxKMra/c56ZWgQ9nmj68+H4keoExZcB/KzLBCrqPGvLa6ddtyRoSSeZUujvwuvplIFeYTSNYkmIoVuQZLlwH0H0tuIFCk/7Of9f25XvAC1jy6WFE74kTyKvWmCpPHMMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095144; c=relaxed/simple;
	bh=QO+Klz71nnsExe6hmzmUDR1fZn7FWwQeBhK8j1pFyL8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GtCTurjXHYbXdvcYWLRuMxLwrtNEnO+pes2s+Ja2hi2GFTgwV2ZfJit+QFwOZOlA2nDUdkgXiwLFVXOCVbpKd2CN5+/GTSoOhpyQrPzJOhD9822pMldW4mi5mr91FUpv+zqqHDnGUJybt8ROEOVjQDM4svjqpi3PaagVCx9ksYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nsx1ywyU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a16a400so1001486f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769095139; x=1769699939; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QO+Klz71nnsExe6hmzmUDR1fZn7FWwQeBhK8j1pFyL8=;
        b=nsx1ywyUu/VuWsJG+fEnqT2mceITAqNclHFvCfeb9TLI77+WZoBfxlS+iUe2IBpXZM
         s/OVYHuLewBVoRidTnBxu/QyhP2aeoDfA51ngpnwlwQoQ4C+qulMAZx3aYP8egPyvUGk
         /7bSEIXtEyW2mBGcgnjK9rwtArhJYqyc1g/oMykhGGnZqiMqaYhZdXeOYOUA2f4I/6eN
         AzApDLHhgKW+/Iy+K4nbntcl7VLOd8woC95eJAWcuid4Qh+piHp1cbHB08z1QH0F7B78
         ooM/0ZjbkfrgdjnZOg8UakIfv71CcfQfLNH5ZTW8FZatBVKTR4FASEhoCX/Tz5NywLnG
         nCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095139; x=1769699939;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QO+Klz71nnsExe6hmzmUDR1fZn7FWwQeBhK8j1pFyL8=;
        b=eCyLiRfYTPugbb78bjSRw+nMhRtn5cjnLm7pNFDIX5lL64K2jikXTtzWSFVMkpXgxk
         17dLbUmc9Zp8xuxZXVytSH7PWAcs5/2tCqe7R9blLPcpOz8HBhwxElPkiY31g1eBpR6a
         zhWmk5wJUmHUenX2BIz5DT/kqwJQeSszk0zPFYAkYpGacCg3xu95a2KUVhwxK0h9ccTG
         NrkgwJW9eM6OoSu+AVUi+s8yKd+bEolyHPRsiUYHwbOZJwEQLJrPRVslka3rVU7xzwmg
         SjajIh9ueymrIDebOFtNCw4CjtgWxsi8qeUYFn0FtySRL3mzRXlgBYsrAQCTJo3emCN3
         7wPw==
X-Forwarded-Encrypted: i=1; AJvYcCUJwNHMNuU7lT2ZkwSx9d0cNspeiZMAEv821gHlagElDrFYxrqS8W7ejXFLb1vZvMG6Ont5gGaJZxpJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8y7ZqfNnYtShPr3R+9rXLAM2pCPKYkHYnwMgu2YTuzYm/+0pv
	ipfi2xmFXrKnmaDTVkg7WSxPMTFdTDlM17pwS5mvqXfa5tfyeT+5hBWwt9mXPOgoRcQ=
X-Gm-Gg: AZuq6aJmzFaVNslMwnq6B/LdZyG5HJ7ABaehE4x3DG1XocOKu0wGr4meACZTuviknKg
	MqxWfAiy0OW+gaj8TyNGDnGHQbl8e8bW6/DgPoAyMOrP7SBUkGgDt0ymy14xlhf9n1JmsCD/U9y
	ZxnXlnzEt5DgW7Kv1lYLq5WG5zIG4fcRzVKJlGJKAic07TBodAGdzq5eJZKK1EzmllbgsL17I34
	N4t2xSF3cqWIC2FIHtOKr+KH/7LdFjDYw2DsHGru0M3lt1FYOerTArNXwaPeWLN5eHvINf8tmdF
	v5FzTM3P0Vmp82G+T0Om4LSmqu5HLIAI5XO3SWRQ8ySaKirbfHfSoQZvqL85WCRcgL+PUMORp5g
	eQYZURyB6+/dHAVfLGjprpm+blYNAxQorlWEgn5Tw1+7m4r56Fe8kSzX/UUhBRbLoxH3NiwIJ0p
	apKYTVcyRcYfU7RrHRTw==
X-Received: by 2002:a05:6000:2012:b0:42f:bad7:af76 with SMTP id ffacd0b85a97d-4358fed8000mr16686929f8f.15.1769095138525;
        Thu, 22 Jan 2026 07:18:58 -0800 (PST)
Received: from draszik.lan ([212.129.87.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4359314bbc6sm20083983f8f.12.2026.01.22.07.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:18:58 -0800 (PST)
Message-ID: <1df01358fc8e5885e20c24b6cf983be695acc479.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski	 <brgl@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker	 <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>,
 	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski	
 <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 15:18:57 +0000
In-Reply-To: <20260122151104.GL3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260122150634.GK3831112@google.com> <20260122151104.GL3831112@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30906-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl,google.com,android.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 18EBC68D4B
X-Rspamd-Action: no action

On Thu, 2026-01-22 at 15:11 +0000, Lee Jones wrote:
>=20
> Also, FYI, you may wish to run some per-patch more tests:
>=20
> "[PATCH v6 17/20] regulator: s2mps11: refactor S2MPG10" has no obvious st=
yle problems and is ready for submission.
> WARNING: Argument '_r_mask' is not used in function-like macro
> #102: FILE: drivers/regulator/s2mps11.c:759:
> [...]
> WARNING: Argument '_r_table' is not used in function-like macro
> #102: FILE: drivers/regulator/s2mps11.c:759:
> [...]
> WARNING: Argument '_r_table_sz' is not used in function-like macro
> #102: FILE: drivers/regulator/s2mps11.c:759:

This is mentioned in the commit message and they are false-positives due
to patch context

Cheers,
Andre'

