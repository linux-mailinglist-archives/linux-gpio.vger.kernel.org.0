Return-Path: <linux-gpio+bounces-37402-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DdjKG9xEWq5mAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37402-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:20:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F75BE2AE
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:20:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99F01301E3FF
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A65D383321;
	Sat, 23 May 2026 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfxBsi7J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1695F340DB8
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779528025; cv=none; b=kplb2HlkQ85uLc0q2zlpgrumpwne+YFL5XcQmkkc6vaRgEXs8B+sldl37UC1TVc0MQiNyBiqIhOVorL6regPl6z9NOO4bjob+C/Ze2DKyNYENeeIw0Ql1ivU/VyLCanDQENqEl0RPTTQYXbOblNp36UoQ8B3V5hk4DdkJaj9W78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779528025; c=relaxed/simple;
	bh=t+aytgWJYWMrIeGAWf/uE60NzkgJIffFPhmKzk31inM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzQTutmJDR3yLqVLoETAoVdwwZ/U38Q6bGmU6X0Q+HYi6amAzatllbsiGFvW3GRsJOTdrEL176Rx7hFutuDtZxruiX7TO8aY3ezsPOGIYBWawmZiBjaoqR5H+YaJheXjEXl/eHIg7WzU8xs20pnDegvl5cSA53dieXES8v0dYhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfxBsi7J; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEED51F01560
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779528022;
	bh=t+aytgWJYWMrIeGAWf/uE60NzkgJIffFPhmKzk31inM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cfxBsi7J9fsxEfsgvFmd2NVs986Q+ome4emmk8XKBW0g0Vb4bFRCXh3k/gEInSN8Q
	 wEXuaXm6WH4wWD/NmykWGGJpFREKgCOdeQKCh67hcMtBLIaQX8g4xf6Fj0YJaJrb6E
	 0KkeYumHzBE0gW2aIVVaoAPL6MsNZAVaieL5jDJ98UnLoSi/slwePbTpTNRRuCtkdo
	 oilPK8HHNaAyy21qLXJqkYqQiaNjU/7QbTVFL/kKpraNgzZP4FeFSD6emYDCnGFOJs
	 r6bIrTI6lLYD5KEOFKQaAN034CwriA+B+X8bZ8PfjNeuBeHNwWRDanNTFWv/061nE7
	 oe3vN4O5udvEQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3938cc204a7so61827811fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 02:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/AbjDYuBOYzl3BKrtAGDZBpqlisFRXyw3ITe0jRWn3JeqNXpNwdm0v8e9L/sdVBUfwKVqo9URZPWHd@vger.kernel.org
X-Gm-Message-State: AOJu0YzFi5q5l3bSfO+LeoGx4nPF+37Pc02BFa8MTeRMDO7YZt8H+nXb
	u6fd6+H3j3uL0walks2jUQ2rib5RI3F0Rsu//jXtTTgA7Insw5Pb/9b4Pn1Tzcm0NteMgQk/KXP
	EoY+rhfqf3UC4q7IjFMRuYYx0TA6PpOw=
X-Received: by 2002:a05:6512:61a:b0:5a8:ee42:c131 with SMTP id
 2adb3069b0e04-5aa323cbd13mr1605975e87.34.1779528021498; Sat, 23 May 2026
 02:20:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com> <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
In-Reply-To: <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:20:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCiZVOWYcN3yqLu6fOqjQhSkM0aZAbzVuoL-5hj+Lnzw@mail.gmail.com>
X-Gm-Features: AVHnY4IWSrFsqHQpeusKv0ApoYMxulT_ZRdAj0wPbeYFZEu1mlSyB-OxmXrnTAU
Message-ID: <CAD++jLkCiZVOWYcN3yqLu6fOqjQhSkM0aZAbzVuoL-5hj+Lnzw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups, functions
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37402-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: 1D0F75BE2AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 11:18=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Wed, May 13, 2026 at 6:44=E2=80=AFPM Alex Tran <alex.tran@oss.qualcomm=
.com> wrote:
>
> > The SCMI pinctrl driver does not currently log the number of pins,
> > groups, and functions discovered from firmware. This information is
> > useful for confirming the firmware exposed pinctrl resources during
> > debugging.
> >
> > Log these counts after a successful probe to align with the existing
> > SCMI client driver logging pattern.
> >
> > Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
>
> Other kernel maintainers want a minimalist dmesg, but not me,
> so I just applied this.
>
> If someone is upset about the noise they can send a patch
> changing it to dev_dbg().

Ah scratch that, Andy made a fair point that it is available
in debugfs anyway so I dropped the patch.

Yours,
Linus Walleij

