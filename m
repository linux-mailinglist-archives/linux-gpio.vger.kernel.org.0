Return-Path: <linux-gpio+bounces-39424-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5uD+BPogSGqJmgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39424-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 22:52:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C787059E8
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 22:52:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VbGh+74C;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39424-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39424-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3BAD1300C7E1
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 20:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0717C343D9D;
	Fri,  3 Jul 2026 20:52:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8C2BDC05
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 20:52:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111924; cv=none; b=tTAUIi0TXpDFNHKElmQikdsGxGvDKQF3V1jcK5sSbH8kR4ooxr1bnXAdsXWpqQDTRSBEhi3xbufY+YI0JsyC4gQeGqwgGcwi3A69G2GTE8+9HFFks8W6pX+asEjMSOj8sHkrI4JgT6Hq6kMNxpxwEl3iZTAwwddtqbFtJdcj9IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111924; c=relaxed/simple;
	bh=DomrWvlT+P8Yy4YQqdPRfwEPtxQD46IquFZgVuDuGbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XU65kllIlCrcPh2vwYhs/qMDIwj0WKhESe9s2UDgjuh+GelZFQnuaJHP63/1dRZdCDgq1e3F/i8HLw2Orua0cgGZLJHRah87lnwhpR7Oc1wfXVQBwJEEvcV/dcO2wjM7UEX8n1Kh7ZUel3qliecamIAXZZbnhPXZfwCBWBQSa+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbGh+74C; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795E51F000E9
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783111923;
	bh=DomrWvlT+P8Yy4YQqdPRfwEPtxQD46IquFZgVuDuGbk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VbGh+74CIWVY6Ugs9RN8Gbj9163v88eFnptdONmS5++7nPP2uB7V75GE4DDhYRD2O
	 TVzO2QsbR+NpbbT0q0ccpInlakbbAFNPxOx4rZAZ3RSU01BW/Lrb39Oli1SKBTjSlj
	 V1EHBkTnUphQiMsZ6Tax/FEDOqDKRjdbWdG0Quv8dca/buBQgvf6/Qc5flR4tZH8QS
	 qf9Xi2pNk0wcGfJ1vKJxLXQD9vwLjUA8/QoYFVEypAicp2eROSMWgiTDHh/8SuzLe5
	 /ijahFvkJKVYRukhCqNn7PbGLDjz4fXMHPS0R+30qj5HimwdieyCoqEfhvmUIQ3FlG
	 9ZHFiQr7bRWhQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aebbeba529so863650e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 13:52:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr+iGELyJ7hl3Xwm1Vkw1BTiim8msNmb0SssKu8QV88Lq7Zl1m1ltXgeKwFd4GPdUTLfJ9ow/3IZWhk@vger.kernel.org
X-Gm-Message-State: AOJu0YyiH9V+7t0JDnJlc5SByLOARAJ6WPK5QkxB9qktk59hOTE1PR8x
	LXag9sfDXo2Dn3VnV9QwgiUA8Tn6Q2BRthMpvuB9lbIGYVEWaXtJWWVPBAw7V04601ldSHCFPkH
	OvWhHsML12qqvhWOQH6rNPtRAD2pdPPA=
X-Received: by 2002:a05:6512:3990:b0:5ae:b88f:311e with SMTP id
 2adb3069b0e04-5aed4f8090fmr92818e87.15.1783111922361; Fri, 03 Jul 2026
 13:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com> <20260702130903.1790633-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260702130903.1790633-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 22:51:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkTJjV-rgCH9Db3cCWi0BcY2M_GZxtMNCPu2Yj8htZXkA@mail.gmail.com>
X-Gm-Features: AVVi8CexkRAwt3JT7JA0ANlKCNAAR7w-QY5g0uaCKxRL9gXGlNRo2lIpYK6UW0E
Message-ID: <CAD++jLkTJjV-rgCH9Db3cCWi0BcY2M_GZxtMNCPu2Yj8htZXkA@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] gpio: regmap: Order kernel-doc descriptions with
 the actual appearance
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Yu-Chun Lin <eleanor.lin@realtek.com>, William Breathitt Gray <wbg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39424-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:broonie@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:driver-core@lists.linux.dev,m:linux-gpio@vger.kernel.org,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:dakr@kernel.org,m:mwalle@kernel.org,m:eleanor.lin@realtek.com,m:wbg@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 04C787059E8

On Thu, Jul 2, 2026 at 3:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Order kernel-doc descriptions with the actual appearance.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

