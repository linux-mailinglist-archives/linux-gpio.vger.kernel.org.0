Return-Path: <linux-gpio+bounces-38400-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NEi+AcP8LGomYgQAu9opvQ
	(envelope-from <linux-gpio+bounces-38400-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 08:46:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA4567DDA3
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 08:46:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cpDne2OE;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38400-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38400-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05AF530819E1
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 06:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414A138836D;
	Sat, 13 Jun 2026 06:46:23 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86635DA5B
	for <linux-gpio@vger.kernel.org>; Sat, 13 Jun 2026 06:46:20 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781333182; cv=pass; b=WzeYOKgFuQ8Hs5PbirJnOAj3GFnOAoHXiBlbMLJYjxwgluF1BxVVDdjn15PFKmVOmfPYopZh7IeBNJtg+EMkMUQvSgrLHG9MwJ8VBknNAk1pMoyWFhaBzRm+jGTVw19QzMw5vuna6mfggW9f0cqUCQJJ57zqWepfH8EqPtweFG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781333182; c=relaxed/simple;
	bh=tZfVoPBmk3Y21JvcgAvm0GaBLRd1bvbAe8InDftuxuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrljxH1ngGnPQt4Nh7F0FVmKTWtdtvtGIno3u/oDQXjLTvn7hA+CDgwPNjwzqg47v9PxlsJq1prOMo9oD5uy+DBL8pB++gvMe0Bs0pF8ICapX7mz560SZlfLrrANnkEMeCJLugG5S3yVCrdahhyLEx1ptB45cdbrhRugQDutBPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpDne2OE; arc=pass smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-693c69b97e7so666882a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jun 2026 23:46:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781333179; cv=none;
        d=google.com; s=arc-20240605;
        b=C7aXLgi1efEWYsMBdgTZY6llvhtSRlusO4QBYvgTZH9mpiBSY1axB6iyI3u2hXtW4V
         npI3l+b6iLa8/zaeyXUPFlYCIS547fw+AsJ3azTERRjjWkI6Pp02XPJ5pRz+eJqqnzdE
         Hn/qPz7Z6ywDJ40lC3i706elatc8Xpx3CN1dojESUOKmXr7wsrknL5oyrkygvEyp5Z1t
         7ccYOdHBy8Mz4e0xvKsxj3g8Wp3XKaBJh8RMPWzToxYy28E982/V1AimPmAf2XG6MqxO
         /mIxTnryNMitxh/F+sBd/iuNCUVcRVuptCqqIh72QZ3vOSLOtXF0BKJYg+aaic1BgNmJ
         dr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        fh=H767MESY2R9A0idEWmiEB3Arb2I3H0PoekOB84jwnDw=;
        b=ERFaOzEJgG43ZQtri3395lUzIOmV9eJji7IgsqketVUJou09LhgzHN+mv9eZ9kBn6p
         Dr4QyprioLpaE9fIM2Je+yfdLHoILVQ5ZP+E1N6ujEMtH8jaU3Wn+nZC6RkcjGDYGkCj
         EMopsw3q+44eE5h+terpVv+BDfkNBgKarGiSK5NLjmxnp8X33ngqtUPh9Rm+R8sjlCZO
         mIH6kY8LT2UrtCpQNDSwZzuNce6SUveXhAwvsYc1krIPXFAC+ijxhru7VYBZmAMof+aZ
         a/ZpOqVnnkFXMBlpxQKZG/eoVdDHjPvGd7CiYSjaAVsR6eRTU+dsEwoJ0zxkaFEIrlhL
         dYFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781333179; x=1781937979; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        b=cpDne2OEqyWaMAImgAFndpx/Lm1DfkhxzFH6v1fGANkIktqCUiReeJUb/6kgSKVjDV
         pZ3B5VcxPnVgtoG3hTn8qE6G4waLNaP38AEaKqv7oYY+P3CSW36ZLJDlPFARqgHsJXjY
         Yj7BaL5hvmsDD1uRV7k3v19T9S1tcWaXp/U+f2R3msr6hcGwetXvdCZLnhfbBs6UPGwI
         SygYaDbHjnIXPC826gOC5MTK8R2b5PVE4scUpKNEjnUtzQtO/yq6nH6ooMo9bnSXgxsO
         QW/pR4d8VIdoIKjE1uCy1NIi4v8LQiNJ4DW8Zdsd1HkfVqSlUbYfsaKCM5P5Qk4c7Q7Y
         B/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781333179; x=1781937979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3Zaw0q13XlwMt/D9vZ2oQHEjwluxKV2bQEyoZSCaZI=;
        b=e5cv7mhFfc+Ez76teTVFX6crBkO0uYFYRVNJLz2S5OTdyYZbhExOmVv68WjBngvfoh
         6sH+cKcl+rSZBocScKOaXexxUAYfPaISPABXWEeylMVUFdI+2fGIH2R7wDq0nbfjHNtl
         yazEI8orhWNer+goM7oEyBGS7uJ4Y2GWo1c+11VIYmBbj0thlwvTeQHug/1XkfxFzs5y
         SvpfobnAbDFuok7ETA3tK2PAmSyUQwYjOQur+l4Hr/b15UymFPzMykmWk8b7V1w/VMaT
         AXM+CeZfWLoUFAvEZcbK+cYEVu/pAY1VwFdKJ/XUxn9IQzoz0vE1/YDZvGZkxsYRnFT7
         G9SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IEl2J0SkpQLIFgoH5PfZ7FNdrziCFaQ6qv0ALwUeRtp0IpSA0A8Tw08b36CfchXd5+uC0lxMGX16S@vger.kernel.org
X-Gm-Message-State: AOJu0YzuMt2y6npFF4hFybYvpiDAr+Lz0YauzIxQuBDLvc0wVPk8/3yx
	pdz4+KIZbume40wMfFOXnIui/+6bS897t6na67XldCJ7qS/Yw51qsry9zUlTdMboz3ni7zUdFWe
	0zik048TTmcHtqJ8KvuKUWAooDDoBn8g=
X-Gm-Gg: Acq92OE14VDq9oqsz5i2A0oW86qQqkuYuKB/bgAZ57lLNdcKwTI9gxcyVWO+uLU7ImG
	bHYJR4F7VuMQLaq8U4x/AUGdt83i6I0Wkpi66hLL2h43dkuNj3fkiaKn6iTH5aAYO3pcRLkB3j+
	oVczHNm+WjeJl3LAx87MhxBrf1tcXazDh7WAcS5K6OiVZ5yJAEfjwQ0urSzNo1tqA02K+bGIJiq
	lz0sstEGgR2UDrg7WI38NlUTBFhBbxMzYLXrf6j4G1D3zL3g6WRldkpFm9GN8kzv0KqHYzi+SyV
	SDrwTqZw+vDdGF1r4jqfLJrQj2DfXD4SBsIdRBs=
X-Received: by 2002:a05:6402:11d2:b0:691:956a:cf64 with SMTP id
 4fb4d7f45d1cf-693785f9535mr2788429a12.12.1781333178678; Fri, 12 Jun 2026
 23:46:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260612200717.361018-1-l.scorcia@gmail.com>
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sat, 13 Jun 2026 08:46:07 +0200
X-Gm-Features: AVVi8CeFuX_UIHrrQxcpZMFblszx1DO_NPnUuKDdU-CWG2K7N00GECZfmMGjMUg
Message-ID: <CAORyz2Jv70NuKNJbaG6o9Evm+3LcCpq+6qmOp_3Q=vf2CFCQ8Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] Add support for MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38400-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:julien.massot@collabora.com,m:louisalexis.eyraud@collabora.com,m:val@packett.cool,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DA4567DDA3

Please ignore this patch set. As correctly described by sashiko-bot,
the binding with no regulator node would not be usable, even if it
passed dtbs_check. I need to complete work on that and then resubmit.
Sorry about the confusion.

Il giorno ven 12 giu 2026 alle ore 22:26 Luca Leonardo Scorcia
<l.scorcia@gmail.com> ha scritto:
>
> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.
>
> This series is mostly based around patches submitted a couple
> years ago by Fabien Parent and not merged and from Val Packett's
> submission from Jan 2025 that included extra cleanups, fixes, and a
> new dtsi file similar to ones that exist for other PMICs. Some
> comments weren't addressed and the series was ultimately not merged.
>
> These patches only enable three functions: keys, pinctrl and RTC.
> Regulators and speaker amp will follow later as I still need to further
> improve those two, but getting the main PMIC in will make the series
> easier to review.
>
> I added a handful of device tree improvements to fix some dtbs_check
> errors, added support for the pinctrl device and addressed the comments
> from last year's reviews.
>
> Please note that patch 0005 depends on patch 0004 as they both need the
> registers.h file, but they belong to different driver areas. I'm not sure
> if I'm supposed to squash them even if they belong to different driver
> areas of if it's fine like this. Any advice is welcome.
>
> The series has been tested on Xiaomi Mi Smart Clock X04G and on the
> Lenovo Smart Clock 2.
>
> Changes in v6:
> - Dropped the regulators driver for the moment
> - Explained the FCHR key name origin in the commit message
> - Introduced the MFD_CELL_* macro in the sub-devices definitions.
>   A separate, independent commit introduced MFD_CELL_* to all the
>   subdevices in the mt6397-core.c file for consistency
> - Replaced of_device_get_match_data with device_get_match_data
> - Removed the mfd_match_data enum in favor of the preexisting
>   chip_id enum
> - Adjusted the error message if the device is unsupported
>
> Changes in v5 [5]:
> - Double checked regulator driver with data sheet and Android sources.
>   The data sheet I have misses a lot of register descriptions, but
>   Android sources have been helpful to fill the gaps
> - Reintroduced the required attribute for the regulator compatible
>   in the bindings
> - Fixed the missing reference to the MT6392 schema
> - Fixed casts/unused vars reported by kernel test robot
> - Removed Reviewed-by tags from the regulator patches as they have been
>   modified in this version
>
> Changes in v4 [4]:
> - Dropped usage of the regulator compatible
> - Fixed commit messages text to properly reference the target subsystem
> - Added supply rails to the regulator
> - Reworked the regulator schema and PMIC dtsi. Now all supplies are
>   documented and the schema no longer includes voltage information
> - Removed redundant ldo- / buck- prefixes
> - Renamed the pinfunc header to mediatek,mt6392-pinfunc.h
> - Modified the MFD driver to use a simple identifier in the of_match
>   data properties
>
> Changes in v3 [3]:
> - Added pinctrl device
> - Changed mt6397-rtc fallback to mt6323-rtc
> - Added schema for regulators
> - Fixed checkpatch issues
>
> Changes in v2 [2]:
> - Replaced explicit compatibles with fallbacks
>
> Initial version: [1]
>
> [1] https://lore.kernel.org/linux-mediatek/cover.1771865014.git.l.scorcia@gmail.com/
> [2] https://lore.kernel.org/linux-mediatek/20260306120521.163654-1-l.scorcia@gmail.com/
> [3] https://lore.kernel.org/linux-mediatek/20260317184507.523060-1-l.scorcia@gmail.com/
> [4] https://lore.kernel.org/linux-mediatek/20260330083429.359819-1-l.scorcia@gmail.com/
> [5] https://lore.kernel.org/linux-mediatek/20260420213529.1645560-1-l.scorcia@gmail.com/
>
> Fabien Parent (3):
>   dt-bindings: mfd: mt6397: Add MT6392 PMIC
>   dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
>   mfd: mt6397: Add support for MT6392 PMIC
>
> Luca Leonardo Scorcia (2):
>   mfd: mt6397: Use MFD_CELL_* to describe sub-devices
>   pinctrl: mediatek: mt6397: Add MediaTek MT6392
>
> Val Packett (2):
>   input: keyboard: mtk-pmic-keys: Add MT6392 support
>   arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
>
>  .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
>  .../bindings/mfd/mediatek,mt6397.yaml         |   8 +
>  arch/arm64/boot/dts/mediatek/mt6392.dtsi      |  41 ++
>  drivers/input/keyboard/mtk-pmic-keys.c        |  17 +
>  drivers/mfd/mt6397-core.c                     | 294 +++++------
>  drivers/mfd/mt6397-irq.c                      |   8 +
>  drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  37 +-
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h |  64 +++
>  include/linux/mfd/mt6392/core.h               |  43 ++
>  include/linux/mfd/mt6392/registers.h          | 488 ++++++++++++++++++
>  include/linux/mfd/mt6397/core.h               |   1 +
>  11 files changed, 840 insertions(+), 162 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
>  create mode 100644 include/linux/mfd/mt6392/core.h
>  create mode 100644 include/linux/mfd/mt6392/registers.h
>
> --
> 2.43.0
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

