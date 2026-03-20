Return-Path: <linux-gpio+bounces-33929-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAoSKORUvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33929-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 15:08:36 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4A2DB989
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 15:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83AF7300A524
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61162DF138;
	Fri, 20 Mar 2026 14:06:19 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8674140DFC2
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774015579; cv=none; b=EdcPdVJWvscuLoWeVLxfcGouhxT2p6ZxhF1rSUE47rQ7OxV+LNN3ov+OI+QQ0q6NUcIEju3uyzpnboRL617BGDb7n1ZLa0f6nYu0f0XxDBy4wZtZooVKwv9JtWouKzBW/JBUXqyZnpB4f1MFvLGrTgIuNPZjXgIvrmYoeeRWlvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774015579; c=relaxed/simple;
	bh=Nx8bQBs95SJZiGV9sxDUOjb6cqnHHMShwIEg031kToo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cIRk+N7UCFhabwkKrUtazSaHGwKKPPaxkVqnmqwiSJJcLDPj69wmoSyCq3Fhfm7SLTo1mEHP8fheo+qHcnzDU4V/3hQQYK+sr/FpRyCFZE2fsf/4yDQ2l5r5Ql8PUu4zEendizWk/MEuks6Q1Vp106fzPhpkrAuLfHvPkFnVwqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12732e6a123so269146c88.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 07:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774015577; x=1774620377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txsLO2jkdNhN6oBkuArfXNgiBSygoSMNA3GUMB3p1q0=;
        b=On0mn0toUQXAxztwboP7W2MSupMlpqiZD3wMnBNm7GOAX4CEidyZxYWGqshDp0efbI
         kEKjwGmOYAoR1pLWXbsMRBGp8FWy2VIvx3dS8nQgTbeTShAWOHg8LCkn0nkCSg9fHyIg
         cO8VvcFEgZRU3QVq8RQgFIHXK+1VF1wzl4Eg/7yBNCoQZSFiqN4Sp+hNfBUtLADyB0BD
         +txZq+OD8hP+LaJXC6Jx7qlSWJ9ZJUQhjg/kSTJIXy5b7WpJ0p5eKyt3Orm4T95iO1Y7
         ZFCI7NDEpZ4InJEmZ2nXUU+ikIQg3MgwLHZHIWypUGiQ/gZ2mztxFpb01AN23wP0hF2p
         qKTA==
X-Forwarded-Encrypted: i=1; AJvYcCUkAKHwWDROD1k2nWoMWoz7oFrle91Uehg9sK6+aRtmZkhlblnk5oHOggAJ2oMP7VXVfbcf3T4yoLvc@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBFPozrOXtMF1SK9N31mFSrd1+u4AMmd1nwVAbdIUCe4BgNFB
	20T1K3y1Hr0TL19z3hu7esQN/XX80RwWXCXMIhbtG8V7jYt/m+gOD5auRGExiqFH
X-Gm-Gg: ATEYQzy1SjBpfkZGInDDgucLM+9u0VCusAb5rIV8hT8MsUtLk62oUsECzooAxqW+rbA
	qQYvFddCS1oo1IoKu3EkL1Hwr2x1UvEOoBWAC9CqLfi9k2rW0DedMNuiVIXTBqXv8W2xjoWLDFZ
	SwP+iy5+9ZKpFrJzNAxiEzlkbu9aC3RjpwuBI8/bU0xBWe44ZSQtb5Sf0ETccKSdy0UckFIeebk
	EzrmWKG4td1meFUwrS9gsJvGQVhEsAbmrIoGA22/7/qPLN8+wFnSyDjBEyR8mPdCGzqLAQuILs7
	zfITKtAPWeygsAYAG55RJ1kdPN3umf00l13ulkWwD9vlbziFhkqvknDxZJHZyLfLwVWjyK40+GF
	lq28ydj824TPbKnq2oMYpPOQc0mmwgT8R20lLIiggfE3Dr7IU3Zs1MhTur6wSxumI6XijBLDNI+
	2t5n5AkLMEK2aT41Y0Q9xjQO+7WaPYinHBk0i4Jil0QqxuYWloE0I4SkBrdi2OVciOJoZhZuO89
	fu4yOnRkC2YLGusNxdnDnn/vqSYo0DwBfOrN7OCWTZGowsMCkrdhW0qoLpxYRES9AoNwXnY4A==
X-Received: by 2002:a05:6830:369a:b0:7c7:6558:277a with SMTP id 46e09a7af769-7d7eaeadcdemr2055517a34.15.1774015266159;
        Fri, 20 Mar 2026 07:01:06 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eae62322sm2179170a34.26.2026.03.20.07.01.03
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 07:01:04 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d743cd9e5bso1320862a34.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 07:01:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVp2wGnFltiWLIGdfCUmvVlxxX1ACm2re9Zkd5VfzVU1Fi5u14eM39ALrZV1NOfolSo//AcUpfamQkM@vger.kernel.org
X-Received: by 2002:a05:6830:67c5:b0:7d7:d15a:ce8e with SMTP id
 46e09a7af769-7d7eb04feffmr2015751a34.32.1774015263260; Fri, 20 Mar 2026
 07:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
In-Reply-To: <20260320-apple-m3-initial-devicetrees-v1-0-5842e1e393a8@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 20 Mar 2026 10:00:26 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9b1VujkHCVdXowQs+BXA0+DL=6sdoP0wuSYpau4T31XQ@mail.gmail.com>
X-Gm-Features: AaiRm53Q86Nf9dVOSTKn0cYEE4xmDvp3jUYoCfYFj-SX9hFNk_weUYFVfwHr6Ok
Message-ID: <CAEg-Je9b1VujkHCVdXowQs+BXA0+DL=6sdoP0wuSYpau4T31XQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] Initial Apple silicon M3 device trees and dt-bindings
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org, Michael Reeves <michael.reeves077@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33929-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[gompa.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-watchdog.org,roeck-us.net,openbsd.org,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neal@gompa.dev,linux-gpio@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.430];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,gompa.dev:email,jannau.net:email]
X-Rspamd-Queue-Id: 18F4A2DB989
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 8:23=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Hej,
>
> This series adds initial device trees for M3 Apple silicon devices. The
> device trees contain only a minimal set of hardware not going much
> beyond the minimum required for booting kernel and initramfs and
> verify via serial console that the hardware and drivers work.
> The hardware with the exception of the interrupt controller is
> compatible with the M1 and M2 SoCs and the existing drivers.
> Changes for the interrupt controller were sent separately in [1] and are
> picked up and in linux-next. The device trees pass make dtbs_check with
> the apple,aic2 dt-bindings change from that series.
>
> Link: https://lore.kernel.org/asahi/20260223-irq-apple-aic3-v3-0-2b732807=
6b8d@jannau.net/ [1]
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (9):
>       dt-bindings: arm: cpus: Add Apple M3 CPU core compatibles
>       dt-bindings: arm: apple: apple,pmgr: Add t8122 compatible
>       dt-bindings: power: apple,pmgr-pwrstate: Add t8122 compatible
>       dt-bindings: watchdog: apple,wdt: Add t8122 compatible
>       dt-bindings: pinctrl: apple,pinctrl: Add t8122 compatible
>       dt-bindings: i2c: apple,i2c: Add t8122 compatible
>       dt-bindings: pwm: apple,s5l-fpwm: Add t8122 compatible
>       dt-bindings: arm: apple: Add M3 based devices
>       arm64: dts: apple: Initial t8122 (M3) device trees
>
>  Documentation/devicetree/bindings/arm/apple.yaml   |   18 +
>  .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |    4 +-
>  Documentation/devicetree/bindings/arm/cpus.yaml    |    2 +
>  .../devicetree/bindings/i2c/apple,i2c.yaml         |    4 +-
>  .../devicetree/bindings/pinctrl/apple,pinctrl.yaml |    4 +-
>  .../bindings/power/apple,pmgr-pwrstate.yaml        |    4 +-
>  .../devicetree/bindings/pwm/apple,s5l-fpwm.yaml    |    1 +
>  .../devicetree/bindings/watchdog/apple,wdt.yaml    |    4 +-
>  arch/arm64/boot/dts/apple/Makefile                 |    5 +
>  arch/arm64/boot/dts/apple/t8122-j433.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8122-j434.dts           |   19 +
>  arch/arm64/boot/dts/apple/t8122-j504.dts           |   37 +
>  arch/arm64/boot/dts/apple/t8122-j613.dts           |   35 +
>  arch/arm64/boot/dts/apple/t8122-j615.dts           |   35 +
>  arch/arm64/boot/dts/apple/t8122-jxxx.dtsi          |   48 +
>  arch/arm64/boot/dts/apple/t8122-pmgr.dtsi          | 1149 ++++++++++++++=
++++++
>  arch/arm64/boot/dts/apple/t8122-usbpd-i2c.dtsi     |   32 +
>  arch/arm64/boot/dts/apple/t8122.dtsi               |  444 ++++++++
>  18 files changed, 1859 insertions(+), 5 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260319-apple-m3-initial-devicetrees-5c546ad977a2
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>

--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

