Return-Path: <linux-gpio+bounces-38187-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z0XiJfkmKGqn/AIAu9opvQ
	(envelope-from <linux-gpio+bounces-38187-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:45:13 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E312F6614BC
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 16:45:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=OfVTyKOb;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38187-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38187-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4211531B6247
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 14:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7FD3590A9;
	Tue,  9 Jun 2026 14:34:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99648342514
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 14:34:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015654; cv=none; b=e5m7n3qM5j2Ki2Q97atlZ7S+4nvQTZRww0FrtOYj7d9rLBpeD8sk1xPJoZSO11F8bvjwLgErR2JgrpNMMnTPPCMigExESU6tYZyw08IA9uhZ2aEA0gTz8gFQMtI+TcX7oei9hT2U2hfc+L2B2rmNIgSXAL+0/CEn/Qv+q1Ucy30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015654; c=relaxed/simple;
	bh=ut2TK6s29w6D1DwLsTxXjuduEiJJ+Vwc2Mi9GgU+v2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqedDxVJJNjIrMdWQ1lvwKoDte/pTQSt+NXS6/mOw1IyHaj5Ai7b21z56LxUkbgyRLQ1v2+5F+2RvVDggSH0fVYenBsI5t57QRsAC2P0Fbm10dIEdv+329DqXfC/ResSfqxFuSmXHXpqPxBxKmGpGgnEdZlF9yO14oyCZh67W5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfVTyKOb; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9251F00899
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781015653;
	bh=ut2TK6s29w6D1DwLsTxXjuduEiJJ+Vwc2Mi9GgU+v2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OfVTyKObj/5jiwP50OsfU1PBNkF5vTRhY/QXoq1pWVF93r4gJMKjV6wkZHftbfEKR
	 wvev/HRV+BBLUgEboQHeqKnaC/Om0cZwlfxk/zbxzLCklNZXlbrx6ezdFBbRzrwgqR
	 w3e9we/oVCQ0xXu3WY9iuoW299mes/ZhPAKVtYBrgIrLPXCiaEnfPl5xVZ/4SC2jew
	 YWWNxarqr5LpAdT0F93vgDa+UVcIUDCDAS61hqPnHkgWYXZRpa71XIRy7QvGI086GW
	 hzrONFzGzFqOWvgas3sWtml+fdmX+dOrdTo7Qo9fafBX7qQKDn8+RBPR4TyucF4BGw
	 H5h9Zr/cnqtqQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso5630651e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 07:34:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8dHmHg2rOVb+cafsK3upFSFzkCALldecu+K2P07KoDBtytuu2wPwVqXjYgEld5glnp/2Q5O8r9a+fX@vger.kernel.org
X-Gm-Message-State: AOJu0YzwAeVvVATH5ExLD+GI0Z53pDW/ktuSpOsKoJRlgakwqH6c/ZUC
	JC1FMBhfnta1G8oiz8mg2rUDe7Dbw+ucqgU0SH9J8AN+kxOV6LYe5F9WBe4pW5kPwUAGo6RM57P
	VkJgH57+tXd0BI1/4rU/8m8N2biwE+bnufJS3ZOlW8w==
X-Received: by 2002:a05:6512:a95:b0:5aa:6842:7a6a with SMTP id
 2adb3069b0e04-5aa879e43f4mr5410341e87.0.1781015652025; Tue, 09 Jun 2026
 07:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-gpio-hogs-fixes-v1-0-b4064f8070e7@oss.qualcomm.com>
 <20260609-gpio-hogs-fixes-v1-2-b4064f8070e7@oss.qualcomm.com> <aigiQ-KR-YHiult_@ashevche-desk.local>
In-Reply-To: <aigiQ-KR-YHiult_@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 9 Jun 2026 16:33:59 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mc3vYpTepkjaPnK11rxveHb24X8O8gX6f=judZW5KGhAQ@mail.gmail.com>
X-Gm-Features: AVVi8CdczvoRp3GRcEC537KYcFMuqpl8PZpPBOkC0_h7v0x0wMUnTj1nm386Oh8
Message-ID: <CAMRc=Mc3vYpTepkjaPnK11rxveHb24X8O8gX6f=judZW5KGhAQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: fix cleanup path on hog failure
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38187-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linusw@kernel.org,m:mika.westerberg@linux.intel.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E312F6614BC

On Tue, Jun 9, 2026 at 4:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jun 09, 2026 at 02:17:50PM +0200, Bartosz Golaszewski wrote:
> > If gpiochip_hog_lines() successfully processes some hogs but fails on
> > a later one, the error handling path in gpiochip_add_data_with_key()
> > jumps directly to err_remove_of_chip. This leaks resources allocated
> > earlier for ACPI, interrupts and hogs that were successfully processed.
> > Use the right label in error path.
>
> This seems legit, but there is still a problem with implementation of
> gpiochip_hog_lines(). Ideally it should clean up the crap it left when it
> poops. With that, this one will require a brand new label just before
> acpi_gpiochip_remove().
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Let's get this to stable and then rework it better in v7.2?

Bart

