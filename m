Return-Path: <linux-gpio+bounces-32894-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOJJN2Lhr2nkdAIAu9opvQ
	(envelope-from <linux-gpio+bounces-32894-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:16:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7B2481F9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 10:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 45D0C3081B76
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF18743C07C;
	Tue, 10 Mar 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+xKuF5f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8056D43D4E6
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133759; cv=none; b=trHlKIqTmTlp66uHgUcphEZjm4ElFdgWX2NcuLhozfpX6GmhYhsDGQHr3Z9iuGnuxvF49FJY6xPMS1P4gOrWOh6IoqZ/BdGd+hOYx6PVxRMuQbW/sS6lByqOd6ObWiiHhdpLJAv2Nl0cXGzRE7c1HQoNZguwOYjV8B+TfL2ESww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133759; c=relaxed/simple;
	bh=lmIVJg2dvi3jHArlXyjrxCfuPpgOkYqyLwhO40XECRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PadtlxaM08/9Tjidr4tD6A1ZwtHCYqc/fiWn0EClDLtpwC6CYKoMGjkpUXuiJpGEbN4k4wmCe3geXti9QUcSJqlz09oTgyTCPWENJ0T3BIkQQjAJ4SUqdXtgLPBAJlpC6U8JFV9M58XXEgfacLMyAzqVcqjD9wFZzniilqYv7xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+xKuF5f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D1FC19423
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 09:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133759;
	bh=lmIVJg2dvi3jHArlXyjrxCfuPpgOkYqyLwhO40XECRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i+xKuF5fmZrLzHlG7Wvk6ofZ7I50JYAfBxe9oKT21LtBFAPEPHef4BfIbd3F4KWzL
	 EOJ11ivDYvUpUlpGILyNj8zqTSDP9J42BJ6tV9W46i0/iAzUmWQWJE0guS8Dr4LXFv
	 72W04g9Cvs4L4SnEQZfFjhQWg6nEKvC0QU7fxjQLSJmE5Wji/jHj/qbONXLviKk1YU
	 SCBDTbCj/0e/plN+oH/U//qeuXFfY2mK0LzsEeBfwgV+yAzd8OSkIgOn0fAq7hNIMh
	 Pis0xbdf2o4ts6939U162rPmEmVjyWt5CAOKpDSy60JXDokSoJGuLP69yl8yohb/XV
	 XMBcWUQUpAbYQ==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ad9238d8fso12427414d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 02:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWCXmnd9tKtTAXqcIQyN66JrPZzb8zmX/zBR+eepwSLIP82tTLfNIXhwZJp90edMAIAXUUE38Pa31Dl@vger.kernel.org
X-Gm-Message-State: AOJu0YzLDaLeUD+gvzFahin0RETOnfd56CEQzRoI67EFfnNmCznygoe3
	IFDUb4A5NAkbWxsqVqswJ/fIibDhpPp/wTajzi4erxnYg88zSz2O/AvHfhu8QJrtGXiVzrSMB1A
	8B8YVQ0D8f6gLtoVMw6aUINKmombiV6g=
X-Received: by 2002:a05:690e:68b:b0:64c:ae9e:1c43 with SMTP id
 956f58d0204a3-64d143bc02emr9879057d50.89.1773133758548; Tue, 10 Mar 2026
 02:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de> <20260309134920.1918294-6-o.rempel@pengutronix.de>
In-Reply-To: <20260309134920.1918294-6-o.rempel@pengutronix.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:09:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkHJbYR3niEqfXwQxT_V5-n-jCDwgevEJ5K18fhZQNP+g@mail.gmail.com>
X-Gm-Features: AaiRm52SylYAFE0cGtD-gPjeVJYdR_gqaNV7fzfvvtJi0fB-wkplKOM7GV35OT4
Message-ID: <CAD++jLkHJbYR3niEqfXwQxT_V5-n-jCDwgevEJ5K18fhZQNP+g@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] pinctrl: add NXP MC33978/MC34978 pinctrl driver
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Peter Rosin <peda@axentia.se>, David Jander <david@protonic.nl>, kernel@pengutronix.de, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C1A7B2481F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32894-lists,linux-gpio=lfdr.de];
	SURBL_MULTI_FAIL(0.00)[pengutronix.de:query timed out];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,pengutronix.de:email,mail.gmail.com:mid,protonic.nl:email]
X-Rspamd-Action: no action

Hi Oleksij,

I'm officially impressed!

On Mon, Mar 9, 2026 at 2:49=E2=80=AFPM Oleksij Rempel <o.rempel@pengutronix=
.de> wrote:

> From: David Jander <david@protonic.nl>
>
> Add pin control and GPIO driver for the NXP MC33978/MC34978 Multiple
> Switch Detection Interface (MSDI) devices.
>
> This driver exposes the 22 mechanical switch detection inputs (14
> Switch-to-Ground, 8 Programmable) as standard GPIOs.
>
> Key features implemented:
> - GPIO read/write: Translates physical switch states (open/closed)
>   to logical GPIO levels based on the configured switch topology
>   (Switch-to-Ground vs. Switch-to-Battery).
> - Emulated Output: Allows setting pins "high" or "low" by manipulating
>   the tri-state registers and hardware pull topologies.
> - Interrupt routing: Proxies GPIO interrupt requests to the irq_domain
>   managed by the parent MFD core driver.
>
> Signed-off-by: David Jander <david@protonic.nl>
> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

v3 solves all issues I pointed out and makes excellent use of
the hierarchical IRQ facility, cut down the number of lines
of code and just overall elegant.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

