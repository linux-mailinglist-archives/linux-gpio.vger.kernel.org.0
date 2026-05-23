Return-Path: <linux-gpio+bounces-37401-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CB6hMwNxEWq5mAYAu9opvQ
	(envelope-from <linux-gpio+bounces-37401-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:18:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 733795BE259
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 11:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3951E3016522
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2026 09:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FD4384239;
	Sat, 23 May 2026 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmP5Tzr9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34823845BC
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527930; cv=none; b=KOHt3pfI2bCOHuGG27YvAuPkxDqqmJVhlQKAD7hqGtnYzKEXgpsUUAPhC/ziEN43xBU21+g3igUhz/QON8WSHbpdludxof536pmonw1pYW8FDVETMooSPnS100Q+IjQzhM4JHXPXt9BnzAAYVQHb9vO9BZXYJ9pnY1cUa1kv03M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527930; c=relaxed/simple;
	bh=TQ8x6W2VkQNawhKHTtSrP2jT7BvbDzctIfpRw7ijmfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLm1LkL0RNyb7DgYUw95zPwQybGeAquslxM3n0HY53kWcnGedU6TqxF+OjHXRit8QNfR16gQ7RvUwHhB5MDmt5R2gbdijEM+kx643nHZiiuIfh+9J480SFTYVNawz+foFQMkotozf8IUAyVizeFjjoocRdI6oaMSQtxSHGFVR1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmP5Tzr9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DAB1F0155C
	for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779527927;
	bh=TQ8x6W2VkQNawhKHTtSrP2jT7BvbDzctIfpRw7ijmfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fmP5Tzr9npguHZm4IZxldm2XUudECehSbZBMvoXNtrw4Ix0inUdagBbXgUYfC9D4B
	 sxagbtyGtB9hmTpGlq85xKhP9dLMp084u3tzJOdxVK5LU4nx69ufMXIfpftcPpF2n6
	 T+Tf/kCv/7Bwm4iQDyaB2gN9SY72Q0Pl62hZTyxaJzXl/asG416+dB1qfGHW34jHEu
	 kvN121p1QYIOTAvgrNwFtrjSq7Zraa0OvU6Q+GDru3fa2goxbQ3pB80oRRIGzyS5D2
	 LeV/iPV10ApSIn2kSD1zGhkYZhQCcRmXW8rMTJhxiUaN5/psOSyHRskXLC9AdYrNw3
	 +DNLJ+WNNBFhg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a877510541so9275111e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 23 May 2026 02:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/DqEv9Yk48sVCpx6WXAM5bJ2JzRKASRBUlgM4B1kuxW12fAj8MLdj81+KHay23gFIecbwHHn2YzUFm@vger.kernel.org
X-Gm-Message-State: AOJu0YyZOcWwws4FEdt/31oymvUkQLT187/1p4BSPK3JYwth0aiYBMVU
	9rxsZJtlSvQ9UlgnG0e7Jcp2oUM+WpfIdpIkdUrAlplqR95MWJtTALCm1QxWUXcNyeoq8RtDNtJ
	YWXIMgad+oH8fkIyWzC4Svmq/Clbw5VE=
X-Received: by 2002:a05:6512:61d8:10b0:5a3:ffed:8443 with SMTP id
 2adb3069b0e04-5aa323bbfd8mr1664992e87.23.1779527926425; Sat, 23 May 2026
 02:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:18:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
X-Gm-Features: AVHnY4ITOyxIjMQnX36Ad3zAiWdBbfyUfI5jUIQb0t2xoh5_kwVjSKEq8ZFTExw
Message-ID: <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37401-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 733795BE259
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 6:44=E2=80=AFPM Alex Tran <alex.tran@oss.qualcomm.c=
om> wrote:

> The SCMI pinctrl driver does not currently log the number of pins,
> groups, and functions discovered from firmware. This information is
> useful for confirming the firmware exposed pinctrl resources during
> debugging.
>
> Log these counts after a successful probe to align with the existing
> SCMI client driver logging pattern.
>
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>

Other kernel maintainers want a minimalist dmesg, but not me,
so I just applied this.

If someone is upset about the noise they can send a patch
changing it to dev_dbg().

Yours,
Linus Walleij

