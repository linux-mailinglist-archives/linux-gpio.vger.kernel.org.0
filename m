Return-Path: <linux-gpio+bounces-37066-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MQyJN4fC2reDgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37066-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:19:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BE656E96E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0811304BDAC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB063624A6;
	Mon, 18 May 2026 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cq1yNLSH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2336C5AE
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113461; cv=none; b=qKkMuqGKqoBb/rwtnYNxlhrledr/5dxIlnBX3MfxRSzOKH65uG+8jajT8TY5J0PT7wIEif7b37hXBiGjD+ASUrZXQesZPTBge5WeuOUWMNA3H6FBVE/RMdO8Uvqma311IGqdI63ct3oLhJdjCYpNFJJuDZr/O1OyFFCfBKb4R8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113461; c=relaxed/simple;
	bh=K9hMZpYvw1rxvjA0enJgFlFVIH3Cqk9/ckH6V+39prM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukMulSBflhv3HidV/+n7D0jiFdjT1fe76HZm5KcdlJGvBqY6IsF8VncZ7+V9nc6ov+/B/UMEzncJ3UTy4P5M28GStB6VJ8cEcmOXHeJnjSHJ5gt4J3swc4M5/YdxPC0iupCMRkCex/WDozlqJxnCEffXA1eQ4DPXlzvagBXS8sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cq1yNLSH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF20CC4AF09
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779113460;
	bh=K9hMZpYvw1rxvjA0enJgFlFVIH3Cqk9/ckH6V+39prM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cq1yNLSHE+yq5o5SgMbQG+x+ufqYkUCSJZbaz2O2OJBdK4Ck9DSZKTYUAQzaft9Gs
	 QJA1lPNW9f3tEc0KBSaXgjGeySdAsiNTDxOCV73N6GAYUqv9+/oKcrcm2cK0Oe4jRw
	 ULVvFu35UkY6yPgEngA627HDOc/mmuDyhpv+bsRGNjnNBeyVkNb3vtzX8N/E/HRkBP
	 m5aVZ4k+WFP9FO3D2q8PTFoYYov69Vki6SWP9j9h0SqQgB8fnffTTaVNy0E5RE3H5d
	 Q8P5lx7RZnMvoop+bOxiL0VbJxtY8751BTwr4T4VVkQvk3HHqdSalXfmXTKOr6bQjB
	 LGXgA0HVPZ8cg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so24959121fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:11:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jemWqps4LzR6WdAT0kEX8a4L0KegiHWucoIiNtCPxfCced/eeUZju6mRSJfxEroPIZr95IsLF/Shq@vger.kernel.org
X-Gm-Message-State: AOJu0Yys8ePC3dXNrKzgkVyPPmkj52xbBJkL6dsXOjAeNi8kQqQfyI+o
	uPUTGqXPFZCgRZJmDr3eZCd1AAXwCpDLUsg2W2Siq+SbySPcItXBHfoh3Tg5fl2eUkPO7uGEHI/
	8Wo7oS3lGnLUFlsddGgvCwIqk/hyurjLNbA3JFCjo0w==
X-Received: by 2002:a05:651c:3259:b0:38c:45f1:1eb7 with SMTP id
 38308e7fff4ca-39561c35f30mr42686801fa.8.1779113459461; Mon, 18 May 2026
 07:10:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com> <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com> <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com>
In-Reply-To: <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 18 May 2026 16:10:47 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
X-Gm-Features: AVHnY4Jte9rkJ-P9RUr1lkkHNxfcCSv_4Qr1IpPohc35wl8Qp5kM3VnQDU4BNb8
Message-ID: <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	basavaraj.natikar@amd.com, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,amd.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37066-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E6BE656E96E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 4:08=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 5/18/26 09:05, Bartosz Golaszewski wrote:
> > On Mon, May 18, 2026 at 3:46=E2=80=AFPM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >>
> >>
> >> On 5/18/26 08:40, Hardik Prakash wrote:
> >>> On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
> >>>> I'd still like to avoid a quirk if we can.
> >>>>
> >>>> I know my proposed patch to try to probe at an earlier stage didn't
> >>>> work, but could you perhaps try pulling pinctrl-amd even earlier?
> >>>>
> >>>> Maybe fs_initcall()?
> >>>
> >>> Tested. fs_initcall + patch 1 still produces the same arbitration
> >>> errors:
> >>>
> >>>     subsys_initcall + patch 1:   arbitration errors persist
> >>>     fs_initcall + patch 1:       arbitration errors persist
> >>>     patch 1 + patch 2 (v5):     clean boot, touchscreen fully functio=
nal
> >>>
> >>> The initcall level does not appear to be the determining factor on
> >>> this hardware. i2c_designware is still probing AMDI0010:02 before
> >>> pinctrl-amd finishes regardless of how early pinctrl-amd registers.
> >>> The explicit device_is_bound() deferral in patch 2 is the only
> >>> approach that has worked.
> >>
> >> Please try arch_initcall instead.
> >>
> >
> > What is blocking the pinctrl driver from probing? Does it return
> > -EPROBE_DEFER for some reason? Pin control core is ready at
> > core_initcall() so it should work in theory.
> >
> > Bart
>
> Currently it's module_platform_driver() IE device_initcall().
>
> That's why I think we "should" be able to move it a lot earlier.

I mean with fs_initcall() change - what's blocking it now?

Bart

