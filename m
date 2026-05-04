Return-Path: <linux-gpio+bounces-36045-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P7OFOB8+GlWwAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36045-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 13:02:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A14BC199
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 13:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27A693025F60
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 11:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A7E3A6B9E;
	Mon,  4 May 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHmPvoc4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A930C38C412
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 11:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892465; cv=none; b=UW0OF8ctnNiBUPG/aERhpY/7J3O2jigwTyEj0grkuz2Uh3nFZkG38KCwSRKgZgzOvKpatYhfvYgyl2qIMRPpcZoBr5fqXvqoB7rCxLhNdG4acubrxeseMewl/KJ81iqVRXYnYDKoOr23wHmsWD0biG9D1AJR4l+th2ybGX7IKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892465; c=relaxed/simple;
	bh=ouskFgDOEFnHYqrmvdT0v5kdL0uhmxU82mtpqCG5tqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUWKV1rimNYTAxT/mp56D39mb66s/8JPj+pOmKp1dfP/N9mz0d8Co6+Tzp9YCFq9o8zMYIJ9S9hrjy65rrFk9R7tt5FnjiqCPBKCIq7VsZxF3wos782AryMSej/LNuF6lcqF4jY7yOAZTeQBaSEOu5EMyG4uuQom/XeFsstQiB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHmPvoc4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E358C2BCF4
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 11:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777892465;
	bh=ouskFgDOEFnHYqrmvdT0v5kdL0uhmxU82mtpqCG5tqg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GHmPvoc4lc62QgQ03zIFpSWvkjWnjJGT61bQQaSHDTwvXERIPEvbrH/cwcNC2798r
	 QSQAoR2ZNEs+sD5329CtrniL63ChDvyjWoajAQqzdTLrOoYCEKgvOB7v/GAi3/O7Ga
	 GCLf7WKfGUw6eqlMXN6CbIj5tKojz+N/WPitZQ3irno8rLCYGmEI39410tgPd+CGCC
	 5NOpameYINQhNc4hAeT6q28mf3WxNnSFRdax25hwOgC/NvAgbxJBVaXMPu8jK9WEWm
	 Sbkk+ItFGGam29vU8rjhcxblc0y6QPREXeWXpB+JNtxAbKKqORlZJcKEM9qF9CyY7w
	 DmkSOmB6+xcJw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a860667fabso2767309e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 04:01:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+H0i/IbtUCcyT4r0K1pCZ+fleovKSsFuc8+vw47tAUXOBa1lJlU37PY8JqqnFC8YpM2U3vcSoENpQU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0PS/7wmzSW8ahjM5x50cBgbsMDDUX0vO/NSC7j4KpC6+8RFE
	MHKhLx1CkPOTbLSk0SmWNy2sOK+/yJx4miylLqBpne5BcvU03lri1IrPhdR93dFhZAH09mpC0HO
	dUqEr3DE8UEFNDfPBewu91rpVnLiBYDo4YRrRIHQdTQ==
X-Received: by 2002:a05:6512:1588:b0:5a8:763c:ab87 with SMTP id
 2adb3069b0e04-5a8763caca9mr678854e87.24.1777892463756; Mon, 04 May 2026
 04:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com> <20260504-baytrail-real-swnode-v5-1-c7878b69e383@oss.qualcomm.com>
In-Reply-To: <20260504-baytrail-real-swnode-v5-1-c7878b69e383@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 4 May 2026 13:00:52 +0200
X-Gmail-Original-Message-ID: <CAMRc=MekeGHdFNKdB9bxTOLHp+3eCH==ve9dhEwm890HzKYyfA@mail.gmail.com>
X-Gm-Features: AVHnY4L6wTAD8jRSt-eYWSlzfZvS1La2BhlvLMYMjtNMOHeofVqZ7Hnu9KJ4HIU
Message-ID: <CAMRc=MekeGHdFNKdB9bxTOLHp+3eCH==ve9dhEwm890HzKYyfA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] ACPI: provide acpi_bus_find_device_by_name()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: CA1A14BC199
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36045-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,linuxfoundation.org,kernel.org,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Mon, May 4, 2026 at 12:59=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Provide a helper allowing to locate an ACPI device by its name.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

