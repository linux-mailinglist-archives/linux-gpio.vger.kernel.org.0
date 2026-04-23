Return-Path: <linux-gpio+bounces-35442-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADlGEpal6mmi1gIAu9opvQ
	(envelope-from <linux-gpio+bounces-35442-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:04:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 991A145848D
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 01:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE576302D098
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 23:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982C63D8119;
	Thu, 23 Apr 2026 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4OgTslK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82EF3D8122
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 23:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776985469; cv=none; b=fIljFxW62hSkJ9rMCnI49AIlPXphb6KtkZPcaDeHI5wlcwY4/Xb8woOFWvIWRxqh0iEVeKpCVjLiuNu5UEkUQ+nhaGBxE3WmOR3Pc0luHO0PMmfVgiB5QRe1pL8egjVIjJmUb5H3ZKDOhpAgT6zri1bxRvNzAgzbCV2d8dnckxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776985469; c=relaxed/simple;
	bh=2K5W+DeoSAgIGSXPuf5OIFDLzAS3TzoiorNSKxhGorI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DtFSSUgMYMrK1H2LMFq4eCpDpCDaTb0nkqillcS//DH/oBWm8WhkDgBLQL9zkgsLtkzYpSl5MhaZoSF4JMkALJnldqvhVCY2IkRhECF9JhGAELX/nr1wB5OcRHiI+GSW/gNLV9UQcnMuLLSs0xKLsW49lFA6U+lK+PHKRrh24M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4OgTslK; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a3fcb2c718so6149979e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 16:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776985466; x=1777590266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9RlDzCHwvVoLD/T1N26pKp2/i9mgbsKP9KFqAoWnRc=;
        b=Z4OgTslKEdqAZ9n7DvmNBaMjbNx8tN29ilbosYBtFHjoUC97Og85RS3TG+0K37QVtr
         GGYb6/f9a9bh/T0RDNW6WnIR953P6mofi/U/Rv0HK81G935pT6bCs1bcMrS4M+qFOAli
         mj3iklNkikHuF/Smfo4SXd8zawPugJ9d3JVkzG6/U8bjWqinnQDRW47rciA9+jlrUzj7
         zF7cxvGCmLbk9vyeZ383lZRNFNyGccNz/HZqLpqeVmEyBOIub6fLkQG8aXDSPWl6+YpG
         YWP/BCu0hnU0m/2+eDOG/9TwmzbeXFCgMiGGRyiqHCf3QlIRF3kvScncjIoGAnv6KcJO
         jclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776985466; x=1777590266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9RlDzCHwvVoLD/T1N26pKp2/i9mgbsKP9KFqAoWnRc=;
        b=XFkpBWPgT2Qb+Q8yFDGOTdDk16FzPm4kDDsr/pBiadqQ0Q3n3Tm8/dbiLqFlMGnnMo
         UXC4X27ZPk17u3AwRgz0ysUlijsyswUAptRQ9dXLxmGgMgJRdYwMOdVqJuWSChsbAxoZ
         88QRUogFeoibbBjiW54viqFl672BdLCJTte/xIBYruXfaWeouIIwmFS3L25oFM/6WbXq
         V0xh1BG+HBdJpuwPJQvfoWwcIArrJT0HhCrMwZZQcixxWZ8BYjdxbdt2BxNMn1nAQiEx
         3MyJJ9Fy4APOHLZf1pVxuX+qrgViwvcyL+EgisjJH8n1XW8hL5fsw7aycZG14w+YxU+x
         xWaA==
X-Forwarded-Encrypted: i=1; AFNElJ9tCqoP99O1oxGnBc2AeqTbMJG87ovqQ+OBo7YWW2VQnTMVXk35uRCuEi/OEPF9jRpwHJmZjmylxWxr@vger.kernel.org
X-Gm-Message-State: AOJu0YycddmTp/tNvQ37NmWfouyealny+NhWsVneHiXy2meBLrU16KaY
	XRukzRENndN4aR84Iv6Qieffv95QmYPPhOLCeClOxcjmh5Fj13bksDA/
X-Gm-Gg: AeBDietD6u7W3Zwwchaf1MYWmMIxGRLTOHpYu0eDHF7auO53+LVvxVLkcQp70umv+3s
	V4nyluDh32Mn5h5g1Y9BplHYvBri3Tnw7xFLNTZi2RterhMR1egWri4A0kPvCPX3v6fiZCD0A6S
	7LWM/QwZA7JOidxajvzgBmG21jdii2d8JItJYXUuy4TBEeST1NF+c60eqmnzfcY/kNq/hNKwIq7
	Ah3yVb/EdGD1d8wZRgdDesiK+LUMT/7gsGax8iZn+m0t6NgFzOKGdyyPxLQZt3u6AYgfVR6vUpP
	ctzpKF2a3Mt9SlwOkp96eDtmwsTD42QhuynRe+0MnNQtMzDKIdNrI3xTF7MYWXtT5fZ2cAvzQ7L
	nBEQ5TOhblvvlZyrryc3tAj7jB16cQVuF0MDa4mXXT02rE+WgmC4qCjPxwTSVHNRLskZUwECo6j
	tFctDMTDdrwF06NkkLgyBrmy/Dt8c5No6B/hquVlLB7dvyYIlKd7A5r7Wq
X-Received: by 2002:a05:6512:1282:b0:5a4:6f5:6c4e with SMTP id 2adb3069b0e04-5a4172d389fmr11928940e87.19.1776985465575;
        Thu, 23 Apr 2026 16:04:25 -0700 (PDT)
Received: from wpc (host-95-152-45-178.dsl.sura.ru. [95.152.45.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc58fsm5567888e87.30.2026.04.23.16.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 16:04:25 -0700 (PDT)
From: bigunclemax@gmail.com
To: linux-kernel@vger.kernel.org
Cc: Martin Botka <martin.botka@somainline.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yixun Lan <dlan@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [RFC PATCH 0/1] reset: gpio: Add support for GPIO providers with #gpio-cells=3
Date: Fri, 24 Apr 2026 02:03:34 +0300
Message-ID: <20260423230338.442497-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35442-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[somainline.org,arm.com,kernel.org,gmail.com,pengutronix.de,lists.infradead.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[bigunclemax@gmail.com,linux-gpio@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 991A145848D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maksim Kiselev <bigunclemax@gmail.com>

Hello everyone,

A little background.
I have a BigTreeTech CB1 board based on the Allwinner H616.
I decided to try upstream Linux v7.0 and ran into the following issue:

[    0.453297] pwrseq_simple wifi-pwrseq: error -ENOENT: reset control not ready
[    0.460472] pwrseq_simple wifi-pwrseq: probe with driver pwrseq_simple failed with error -2

This error prevents the WiFi chip from coming up.

I started investigating and traced it down to the function
__reset_add_reset_gpio_device() in drivers/reset/core.c:

/*
 * @args:	phandle to the GPIO provider with all the args like GPIO number
 */
static int __reset_add_reset_gpio_device(const struct of_phandle_args *args)
{
	struct property_entry properties[3] = { };
	unsigned int offset, of_flags, lflags;
	struct reset_gpio_lookup *rgpio_dev;
	struct device *parent;
	int id, ret, prop = 0;

	/*
	 * Currently only #gpio-cells=2 is supported with the meaning of:
	 * args[0]: GPIO number
	 * args[1]: GPIO flags
	 * TODO: Handle other cases.
	 */
	if (args->args_count != 2)
		return -ENOENT;

As you can see, a GPIO from controller where #gpio-cells != 2 will cause
an error.

Unfortunately, the Allwinner pinctrl is one such GPIO controller.
It uses three arguments to describe a GPIO line: bank, number, and flags.

Here’s the DT fragment that describes wifi_pwrseq in
arch/arm64/boot/dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi file:

wifi_pwrseq: wifi-pwrseq {
	compatible = "mmc-pwrseq-simple";
	clocks = <&rtc 1>;
	clock-names = "ext_clock";
	reset-gpios = <&pio 6 18 GPIO_ACTIVE_LOW>; /* PG18 */
	post-power-on-delay-ms = <200>;
};

Potentially this problem could also be observed on other GPIO controllers:
spacemit,k1-gpio, microchip,sparx5-sgpio, and many allwinner,___-pinctrl
variants.

I attempted to make a patch for reset/core.c (not pretty in my opinion)
that adds support for three-args GPIO phandles.
But it seems I’ve fallen down a rabbit hole, because next I hit the fact
that gpiolib-swnode expects GPIOs to be described with exactly
two arguments (swnode_gpio_get_reference()).

I also did a git bisect to find when wifi_pwrseq broke for
the BigTreeTech CB1. It turned out to be commit
73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset control")
in v6.13-rc1.

So, in theory, a patch to pwrseq_simple.c could be made to fix my issue,
but that wouldn’t solve the underlying reset-gpio problem.

I don’t know how to proceed from here and I’m asking for advice.

Best regards
Maksim

Maksim Kiselev (1):
  reset: add support the GPIO provider with #gpio-cells=3

 drivers/reset/core.c | 33 +++++++++++++++++++++++----------
 1 file changed, 23 insertions(+), 10 deletions(-)

-- 
2.51.0


