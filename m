Return-Path: <linux-gpio+bounces-39437-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M6yBF1yYSGpOrwAAu9opvQ
	(envelope-from <linux-gpio+bounces-39437-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 07:21:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB775706AF0
	for <lists+linux-gpio@lfdr.de>; Sat, 04 Jul 2026 07:21:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EP5Uch0S;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39437-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39437-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A03C300EE8D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jul 2026 05:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6926334F492;
	Sat,  4 Jul 2026 05:21:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0B2DEA64;
	Sat,  4 Jul 2026 05:21:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783142489; cv=none; b=l6faLAeXvfV/zzhLKuF/LrqTk7eEjFM2nKlshjEmnWpHave3t/VhyJ2pp/M0RSFW2FjXF0gUF3VFRzbdjyJtqKWm4cG0D2Wou7WedR115yw/qMA/GfFlM/927sX4fg70ulRMdRO/puotkcVVlBjnvTaZkpxM++1zpmGpMeL2VeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783142489; c=relaxed/simple;
	bh=jEggrTol82OUXPf6ckt8EgEimMY1MYiuNQnTfMbjWlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PreJxdG2o+pi8lMXZyOYGh7NUQOe1Hrm1vsx3p3P7MSMve2pwjFbN/RRVaXfSorWOBxMj/yA6jXafrA45/DXzkNvlSnJd/Ui5GiWYsk+vJgXBFvZGi3/aDK7WrX9SvsfyGVFcFKl+BQaK5Le9dDEnzpAM9dwH3BP+OLzkGgV2Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EP5Uch0S; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1861F000E9;
	Sat,  4 Jul 2026 05:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783142487;
	bh=CYDOQJsjhk530hF90YdapxyKM5jfGqkWjC+R6iH89QE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EP5Uch0SRUZ0ZvOUZvgSHjR4VJX0W+cI6Z4o48IG7MLaMhlZcHOWKdeIfkrC+jaes
	 TmrHnTkPTSAvBztrW/s32vsUv2/esnZpsPDwpRF+tDUtKbTzDzUl7X2OHWH+4f4e0f
	 YPgvnP4XOQYp2Hn8fml8/m9B7fZVmeKX5NIPZ9nnh3SWO2ySSGdB/iikdQUsM7l2dR
	 SQ+KJvvFtuZrWJKcMELzIBSjj9iWSzuAvKiUh10dR0FBK0SYS59fsBRDlO3S5SURfF
	 zl3AH0lltF5ulfkjcWHecy6VcWjVeNgrgzA1Df+36vfa6vS0kvB+HLv2uACU+g4zdL
	 bVs8F1kl4RzYA==
From: William Breathitt Gray <wbg@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: William Breathitt Gray <wbg@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Fred Eckert <Frede@cmslaser.com>,
	Matthew Mohn <matthew.mohn@ishicorp.com>
Subject: Re: [PATCH v1 0/4] gpio: regmap: Keep tracking IRQ requests and releases
Date: Sat,  4 Jul 2026 14:21:19 +0900
Message-ID: <20260704052120.798323-1-wbg@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2371; i=wbg@kernel.org; h=from:subject; bh=jEggrTol82OUXPf6ckt8EgEimMY1MYiuNQnTfMbjWlQ=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDFkeM3jm9l7I322/o3DnEQllyezUzX/OfVqXH5j7LejQk S/HDhT86yhlYRDjYpAVU2TpNT9798ElVY0fL+Zvg5nDygQyhIGLUwAmYmjJ8JuVk+/tQq9bC648 3TThwgIJs5c1WntuPjPMs/3qVL+LR3kXI8MKFdnMnSZKzR/FegW2Ot9eeIZhMWP0Yy855ZL9ydV rOJgA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39437-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:wbg@kernel.org,m:broonie@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:linusw@kernel.org,m:mwalle@kernel.org,m:eleanor.lin@realtek.com,m:Frede@cmslaser.com,m:matthew.mohn@ishicorp.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[wbg@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wbg@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB775706AF0

On Thu, Jul 02, 2026 at 02:42:53PM +0200, Andy Shevchenko wrote:
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
> Most of the affected drivers if I am not mistaken are the Industrial PC104
> ones, hence I Cc'ed William to look at this and perhaps even test.

Hi Andy,

I'll take a look at these patches when I get a chance. For now, I'll CC
Fred Eckert and Matthew Mohn who have tested these PC104 drivers in the
past and may be interested in this patchset.

Thanks,

William Breathitt Gray

> 
> Yu-Chun, can you give a try with your v3 based on this series? I believe
> we can use regmap approach after all.
> 
> The merge strategy is to go via GPIO tree with the immutable branch or tag
> provided for the first patch that can be done by regmap tree for others to
> consume. Of course, there are possible options, I'm all ears if you think it
> will be better in any other way.
> 
> Link: https://lore.kernel.org/all/20260512033317.1602537-1-eleanor.lin@realtek.com/ [1]
> 
> Andy Shevchenko (4):
>   regmap-irq: Provide IRQ resource request and release callbacks
>   gpio: regmap: Provide default IRQ resource request and release
>     callbacks
>   gpio: regmap: Apply default resource callbacks for regmap IRQ chip
>   gpio: regmap: Order kernel-doc descriptions with the actual appearance
> 
>  drivers/base/regmap/regmap-irq.c | 22 ++++++++++++++++++++++
>  drivers/gpio/gpio-max7360.c      |  7 ++++---
>  drivers/gpio/gpio-regmap.c       | 25 +++++++++++++++++++++++++
>  include/linux/gpio/regmap.h      | 21 ++++++++++++---------
>  include/linux/regmap.h           |  2 ++
>  5 files changed, 65 insertions(+), 12 deletions(-)
> 
> --
> 2.50.1
> 

