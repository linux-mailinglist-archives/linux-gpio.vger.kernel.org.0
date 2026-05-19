Return-Path: <linux-gpio+bounces-37157-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD40L9Z2DGqihwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37157-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 16:42:30 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D80580B86
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 16:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF42A3028362
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 14:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F03104C77CA;
	Tue, 19 May 2026 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvSKJ8bJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32D040961E
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 14:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201555; cv=none; b=OevumYbl8UB3rXPs8vG/WT5SafGF4kPtfaARXxW0t3VmRxNaA+pCeT/eGHglGxWpaUdY7HdC6NZ6W2HB7CR2q5kZBP3hLBqyi5uZmy4Xh2qozvECRfDSeqykPXBkgfz+PmRt1p3DKdVOQRHduqfzKVPZwSmUZXPJ/o5t8oMyE+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201555; c=relaxed/simple;
	bh=uHSgj5HDh0k+KYAjBzazfDNRLKFkmF3zX6BBZ9bOpdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmPrrlFwRQG2HZgZQrgHuIQoKHpFKTG6PtTE+sv+GqMeJketyH6k/gtK/SEkP718tLH5nrXsxXWnNxt28sx4LDLUNI2d+05IEAmFr7qfUlmed+sf5AMKUxnLoRjsOcRnjJJc4Yl6glez686xuuDl2jBkzFF0qxUKI5Rai3cNABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvSKJ8bJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA1DC2BCB8
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779201555;
	bh=uHSgj5HDh0k+KYAjBzazfDNRLKFkmF3zX6BBZ9bOpdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dvSKJ8bJEfLvc3805/MYHmEyMlJUR9px5RuT+2NwPrSZAh3vFP3ajiCuk2g9w1W0n
	 FnTzS4gGjRA/zjT0/kK2BllR1tzjwVlrHQaVYOc6i9SIpexK4obZT0E+l3/NIDxzd0
	 v7sXPt5nEqIaxdmP/6hAH3CDZbqd+0YpyK73zrcR+Y0XBxYTONUXuCT5BX27/QRzHN
	 47hDhyVsQ3568+sE9D1NCCxSYEvqhlGzLzWKadXo5RuYzIsFNVEveWCMsLoIg6au5/
	 Te6mIDc2irSpia6naSszshbCNt1UPHU9mGsxqb6Ffdqym0TOFJLLEKUSb2inxeRsao
	 nn1pfYN/2gFdw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a884815606so4396616e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 07:39:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+QXJ6bVmejpIhxD0SEzgVlmWP1HWgnNiaKGqCHjv1nSVyuhk+dlDqciw3p0r6+PpZ9/BKTJb8lhwC/@vger.kernel.org
X-Gm-Message-State: AOJu0YzlNzbqV1cHaOL4gXwNKP9HEq4dVodUTZi6IHC8ZmbbRc1Bz8G0
	VpgOSlOC7MN8rqgCxaGn+cHjrtQxv2UPArwiLQeiA+MsQ6hsf8zW0cJbX2RoaSjja8jIeWHPupR
	Jk3oSmXBXp0QRFDbXi1LiFwKqBnkrS8bHVM6Ibdjoxg==
X-Received: by 2002:a05:6512:2241:b0:5a4:6f5:6c4e with SMTP id
 2adb3069b0e04-5aa0e61dbecmr6778725e87.19.1779201554005; Tue, 19 May 2026
 07:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com> <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com> <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
 <9d5da93e-bbe0-4359-9f17-e3c6b3a5cb34@amd.com> <CAMRc=MfT_WVMxPnYZW=mg52PHew0O4VQMGFrfo6G9vxZDDoArw@mail.gmail.com>
 <CANTFpSUX5rYhuTQH3dTTvzW+_yhW8Gs0U=A1t_8LDzKz4dzzAw@mail.gmail.com>
 <agsh652HlC4rg1_1@ashevche-desk.local> <CANTFpSU7XaNKwe_FPsTCkxQYeq78Tqusr-nsB-Ww0_teuiWdEA@mail.gmail.com>
 <f0ee2722-1e56-41b1-b70c-5503a2495853@amd.com> <CANTFpSWT+cR8Yxyr5jrB2MUidqKteWuPjHOyK_rpSkDUN6SWQQ@mail.gmail.com>
 <c4993bce-5d39-416f-90ed-d870f4ac9254@amd.com>
In-Reply-To: <c4993bce-5d39-416f-90ed-d870f4ac9254@amd.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 19 May 2026 16:39:01 +0200
X-Gmail-Original-Message-ID: <CAMRc=McSLEF_nrkRdJJu9=Bc_KmPWYKDHd6tOD9tJqs0fksv0w@mail.gmail.com>
X-Gm-Features: AVHnY4InVnYSq63BJ-iaOIhWG8RU-27KTOC34DtVfiCOJ59nAK13h3RM_R7kKVc
Message-ID: <CAMRc=McSLEF_nrkRdJJu9=Bc_KmPWYKDHd6tOD9tJqs0fksv0w@mail.gmail.com>
Subject: Re: [PATCH v5 0/1] i2c: designware: fix probe ordering for AMD GPIO
 on Lenovo Yoga 7 14AGP11
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Hardik Prakash <hardikprakash.official@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, basavaraj.natikar@amd.com, 
	linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,vger.kernel.org,kernel.org,amd.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37157-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 36D80580B86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 4:28=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
> >
> > gpiochip_add_data() at 0.285952 makes the GPIO chip visible to the
> > system before amd_gpio_probe() has finished. AMDI0010:02 starts probing
> > at 0.301454 while amd_gpio_probe() is still completing. This is why
> > device_is_bound() works and initcall promotion does not -- it waits for
> > probe completion, not just gpiochip registration.
>
> What is the boot time impact to adding device_is_bound() check?
>
> Bartosz, thoughts?
>

My thoughts are that ACPI could use some fw_devlink. :) It's not a new
problem, we've fixed it for OF systems.

Could we modify gpiolib-acpi.c to return -EPROBE_DEFER if the parent
device of the GPIO chip is not bound yet instead? When resolving the
reference to the remote GPIO controller we have an address of the
struct acpi_device. I suppose there's a platform device that is its
child and then the logical GPIO controller device, is that correct?
Can we check if the platform device in question is bound at the
subsystem level?

Bart

