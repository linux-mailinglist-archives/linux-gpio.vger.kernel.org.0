Return-Path: <linux-gpio+bounces-39422-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NSjqJZYLSGqwkgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39422-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 21:20:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B3170515E
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 21:20:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EYpzH0Hw;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39422-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39422-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37380305C137
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 19:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A7BF32860B;
	Fri,  3 Jul 2026 19:19:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E23264D8;
	Fri,  3 Jul 2026 19:19:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106368; cv=none; b=XSOFI7AS+RxhJet0AuNkdK1iH9iKTWiDWOgaGivK+WtNtNGdeG1k2b6AvHh5fJA6XrUUKl4RyFD1aK0ADV7e/MoSGtkSxWsV16Pwur3HA3iKATHzUP3/Wyu71dxt2Kp5KsI4SqVhTOUdCAQAlVL9O570tz/Na5tW9+GZzl5Tsks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106368; c=relaxed/simple;
	bh=HSAC5/nMEP6Slb2rGTY7bKLJQONDl0RVvDxg7fUQw9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ss0M6+HM8xzy1NKOcLTSqUwesNY+VQk4XZumxw1eUhNXx+6ZKWEWEWfgUJex3pVLV6SfMBZzvC6XMreSIaxjjP+QtOrrotF4UU2sVwhWMNOvErMHfPkmWbjLYrQx4Hv6GIAiUT0+9VQ2Phn9OT1xjak0Mi31EegUBxL1Z1jCrLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EYpzH0Hw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDCAB1F000E9;
	Fri,  3 Jul 2026 19:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783106367;
	bh=ue0U9IrP0YVIunQgyG+C4mydhPBdKQxV7dUp1GXpXC4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=EYpzH0Hwy3xKW2L4khD/GWIAXQCijjEXl3bld3eLUqypKgWsdZWq8dG1rC6azEmg5
	 OJxxhCa2B+u0pWZjGjzaE+HghbBNTAakzHn2ZRVI6uvREB11rX6BhRVwNhAD8Rlhzq
	 qVSI3o16MQ5TuLZSazBpzMVQYw2GvfFag86yj36qnFZWJqxw4cMNbakZeOkkYM61+t
	 V0c8dSMxEDJ3KVHRji5yxZI6kUoxRrmb5Zvpnfy1hJyAbW7c3Otk1cK7s/h8Gj7o2s
	 n8IWPJGE/KNVfnuhazgUnuxkSeigXPrfjjyWjlf0aqNmNTuoTa4RCAOAgGWb10SVZB
	 34YkJdFzTfIjQ==
From: Mark Brown <broonie@kernel.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-gpio@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Yu-Chun Lin <eleanor.lin@realtek.com>, 
 William Breathitt Gray <wbg@kernel.org>
In-Reply-To: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 0/4] gpio: regmap: Keep tracking IRQ
 requests and releases
Message-Id: <178309254924.53103.7161454484858197335.b4-ty@b4>
Date: Fri, 03 Jul 2026 16:29:09 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HSAC5/nMEP6Slb2rGTY7bKLJQONDl0RVvDxg7fUQw9I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqSAs7qXI94Z/V987rVKP/qZMHi46jTawLkKaDP
 fcTnm3FbfWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakgLOwAKCRAk1otyXVSH
 0HF+B/9UFKne3oT0zWPrYdtn4E8+T3UU+5fMmwpcFifEnrnjFzfjNFvhmI64ht70VXzWveavhmW
 c2rvGrL256FgCAgUabOEy4zKuGv6B6WpEDePB6/13rIXjactZtj5LPWU+UpGWjcVUaF/rzi8/hH
 IGc7xge8hyGC7hsHlh2u4PnhPDuCZrkVVxZQjqUDm4hSJrXrP5My9T13K/VIyy9p7YjCDD0livr
 CRfACGWzh6pORezB3G1WW5IWm/B5O5wuBvTbVKbkKbmFHHEGSb6BTVpgn9BcxWKVUz9/dGJNN+z
 /CqVBUFIqOFNIReUD9ufWEnWt3vLch+9hKI2D+vIPBlRU15g
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mathieu.dubois-briand@bootlin.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:mwalle@kernel.org,m:eleanor.lin@realtek.com,m:wbg@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39422-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11B3170515E

On Thu, 02 Jul 2026 14:42:53 +0200, Andy Shevchenko wrote:
> gpio: regmap: Keep tracking IRQ requests and releases
> 
> During the review of the v3 [1] of the series that adds a driver for
> Realtek DHC RTD1625 SoC GPIO the gap in the GPIO regmap implementation
> has been discovered, id est the IRQ chip that is created by regmap IRQ
> doesn't have IRQ request and release callbacks and hence in terms of
> GPIO does not track if any line is locked as IRQ. This might lead to
> undesired and most likely faulty behaviour. This series is to fill that
> gap. Currently it only fixes the only user of the automatic IRQ chip
> creation facility provided by GPIO regmap, but also provides the exported
> callbacks for others to be possible to call them from customised versions
> of the callbacks in the respective drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git regmap-irq-reqrel

Thanks!

[1/4] regmap-irq: Provide IRQ resource request and release callbacks
      https://git.kernel.org/broonie/regmap/c/9bb4c0b37d54

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


