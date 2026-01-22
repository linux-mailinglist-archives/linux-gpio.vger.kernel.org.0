Return-Path: <linux-gpio+bounces-30929-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOrfLOxXcmkpiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30929-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:01:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F36A9B3
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BD94A3002F6C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 16:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74AAB4D90D2;
	Thu, 22 Jan 2026 15:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLc348yH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025874D90B6
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769096994; cv=none; b=PlCLCAnlKVUzk0X9bcBsks/WZJ12e+f+cAT9X2nINhWzbMUSu+38n1uBjXpC1ggO/5JB4bVKVIzDcVJBseRGpvj01QEMGgHkYt9i6D5DtKHp5ckBa7nKr+H/MHwKBepu4vrrlhCEe23/VqFqhH1ap7SInSup17/e3111tk3L34k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769096994; c=relaxed/simple;
	bh=+e6wsl5d67gepE+dFjWdKbJ6vjQoBdZjQhDABfPMTsI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZRMHKYtN9CaB14Ja0JLCm0YPg+RQE8zjxUoYS4gOstIBnCO4B/a5e40Bq5a29gTVf+lCXY01LiLnnf2fm73xtJvPSsLRGG/TOaEvYFWh38QHAthFxY6NwfEHEFhWNh//3QchbpQgDqUVfeQCZTD1eajP6j/4zkVV6rzDkRJES8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLc348yH; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so9051755e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769096985; x=1769701785; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+e6wsl5d67gepE+dFjWdKbJ6vjQoBdZjQhDABfPMTsI=;
        b=SLc348yHoHg26UnNunRhyrescOI5qvVkN5xUjhfwkyu4I3hisalmDptiYWkPbuxWtJ
         C6sFMS23VUuNv8VvLfd5eeMaCOk9lGo8crjO5IJx5T/+yoMItEl/hDWJMMn3w9vVJBXy
         0vY/RrMvEzOZF5hq60fpAekJtXNJBP4zN7/RD/vaPBgPqGud3Ei06hRh4tLVABYgibaq
         HaT14NjVQqYN5/DPr+o3jP/Z/bcAoJWDTYpajNx2/v6IBd+s138l4erRwnHkdXr3zVrR
         gcSUTJvGKpn7e9W7PbIEw5b6Vb04jx5rpMZjTvglYNWkTg7Y7M8RdN3/B0Verz/IdpFO
         ckew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769096985; x=1769701785;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+e6wsl5d67gepE+dFjWdKbJ6vjQoBdZjQhDABfPMTsI=;
        b=ZEPT7Uarv1ovZcQwbSUCYqXUmSZKyVztGtSEWOfYgPbbtlqCM5Y2+K9rfd4BLfI72M
         ib7vDCItY9nYXmOgjl7is2IG+LrfK4mLzOEg6cH9hFF8km/gjyT2zbEPmYbh6yRxx8Zm
         +RHj7KXku4sBriKxl3/U7xxTtX+NUHsr32uga0CBOxcOtYjvhE2Li94Ro0GtpfVpNEr2
         7vr9OrcTrJ5vdEBiUWAHTyucPSzeQ+YREXCLLJhfgHkLrt6VNVRcsbXu1Gvspp62KpXS
         1VO5pIAuLVc7PwEMiuRU1wQ+F9+aM8+JovQTNS7ui7NxLXPCn+/b2G2/q3FelfWNsP3g
         K2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWZHj1M93ahnhIbQ4+QuQA9+V50kZhorLhxPQyWyvKV3igcWeX5JEgaQNt4mYWWbInyx32ra/Hgxs2r@vger.kernel.org
X-Gm-Message-State: AOJu0YwdzoxLNHoP88Ssf+Q+XlWG2dX1OivY3eN3vyrHj1TLFTLFJDV6
	HVw+gJWi968LxukDUgD0+0TPsBfLg35JGPPtFyKG++cSJpb3ySNbhYeqfpyNikAFSGU=
X-Gm-Gg: AZuq6aIjPIGoptgmKxR3BMTEyrOGbnpHdxRcAsX5fhrS8b1ZB3X612GkyT+S4XcfV4N
	5F1unLyqDP2n3OOnfyPEzBltYZgatKGfEVx4eP4iWzvjJZz2jt+g0HWoaarhRCqTr3W/1jWcoHp
	b+0V/kqMVO3GeW0dBhhZ7LD7dHmILAdv48BH56nf429FTztIT9wY7rjDBylAs/tevRwGw+3D6FN
	bllaXFDZfQdnXbSnmIWrbSOBeYCzsq6pqeYGE62CLSrvGASFuscf24bHbc7jksXO7zTaMzAHVeK
	ldcXhVgtDSFlpPpnFP9IQ5E+b2xQKa0AXaEPkFpvtF8FuNP4+jReKn39aPoSc2vMafk3dT5GGBH
	YyJSVUU5WPBsuc9NLrs2FFe3V/plUr2h5lymtnFnJLX2tFOnyKeLdHGVz2YE/fIuDcXAaz5IfM1
	MM2ZpQs1Lp+xPu3TokJmiAlAOFPikx
X-Received: by 2002:a05:600c:8209:b0:480:1a9a:e571 with SMTP id 5b1f17b1804b1-4804c9aff3emr1043695e9.22.1769096985161;
        Thu, 22 Jan 2026 07:49:45 -0800 (PST)
Received: from draszik.lan ([212.129.87.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480424d4912sm56957665e9.7.2026.01.22.07.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:49:44 -0800 (PST)
Message-ID: <d6f25eb87630f2ce6a155c8ba758a131187b5aa1.camel@linaro.org>
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
Date: Thu, 22 Jan 2026 15:49:44 +0000
In-Reply-To: <20260122150634.GK3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260122150634.GK3831112@google.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-30929-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl,google.com,android.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: BA6F36A9B3
X-Rspamd-Action: no action

Hi Lee,

On Thu, 2026-01-22 at 15:06 +0000, Lee Jones wrote:
> On Mon, 05 Jan 2026, Andr=C3=A9 Draszik wrote:
>=20
> > This series extends the existing S2MPG10 PMIC driver to add support for
> > the regulators, and adds new S2MPG11 core and regulator drivers.
> >=20
> > --- dependency note ---
> > This series must be applied in-order, due to the regulator drivers
> > depending on headers & definitions added by the bindings and core
> > drivers. I would expect them all to go via the MFD tree.
> >=20
> > The MFD patches in this series also depend on my Samsung MFD patches
> > due to patch context:
> > https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro=
.org/
> >=20
> > While these patches compile, regulator probe will only be successful
> > with my deferrable regulators patches from
> > https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@l=
inaro.org
> > --- end ---
> >=20
> > The patches are kept together in one series, due to S2MPG11 and its
> > regulators being very similar to S2MPG10.
> >=20
> > The Samsung S2MPG11 PMIC is a Power Management IC for mobile
> > applications with buck converters, various LDOs, power meters, and
> > additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
> > a main/sub configuration as the sub-PMIC and both are used on the
> > Google Pixel 6 and 6 Pro (oriole / raven).
> >=20
> > A DT update for Oriole / Raven to enable these is required which I will
> > send out separately.
> >=20
> > Cheers,
> > Andre'
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> Applying patch(es)
> Applying: dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into sepa=
rate file
> Applying: dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
> Applying: dt-bindings: mfd: Add samsung,s2mpg11-pmic
> Applying: mfd: sec: s2mpg10: reorder regulators for better probe performa=
nce
> Applying: mfd: sec: Add support for S2MPG11 PMIC via ACPM
> error: invalid object 100644 11a56154d36d251d40b40e91da514db0faa15ae3 for=
 'drivers/mfd/sec-irq.c'
> error: Repository lacks necessary blobs to fall back on 3-way merge.
> Patch failed at 0005 mfd: sec: Add support for S2MPG11 PMIC via ACPM
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am --abo=
rt".
> hint: Disable this message with "git config set advice.mergeConflict fals=
e"
>=20
> Doesn't apply to `for-mfd-next` or `ib-mfd-rtc-v6.20`.
>=20
> Please rebase.

Strange, git rebase onto for-mfd-next had no trouble. I presume you used b4=
 am / shazam
above? Just trying to understand why the difference.

Anyway, rebased v7 is
 https://lore.kernel.org/r/20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@li=
naro.org

Cheers,
Andre'

