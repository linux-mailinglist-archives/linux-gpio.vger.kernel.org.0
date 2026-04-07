Return-Path: <linux-gpio+bounces-34781-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFrbEOr21GkjywcAu9opvQ
	(envelope-from <linux-gpio+bounces-34781-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:22:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1213AE400
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Apr 2026 14:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E42EC3029E46
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2026 12:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C983AA516;
	Tue,  7 Apr 2026 12:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qLrrIbPt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10003A7F64
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564377; cv=none; b=tgtD9Vo9v7EKjblnoiBrf+sBH3BOEj/HLRWqKOW/JUZKsMiMEvMflaewqwJ0JAmhcn7XkMh8nPw8enu+EOuA+xFhk4MVQrqgK5cMasRvkXj4iUsT/MsfjkymhwfWhiXFwMvRoskDD6jfXO2HGjjEZhQOqANPl0mCI7Q/semyyYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564377; c=relaxed/simple;
	bh=1c5la7jW3HK3gF97OtM6GfLE8oFAaLIEYMk33mp27dY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Elbuw5b+aak57B5RoGc1v0TorxY9WGcBCoTuv46OMwW30FgK54ntEGc3PXW/DlI6GhLPdsnBd5iRmyePS0herLT0p8YSAoVmV+RhWUNQpLF19/ZmjgTF5hjuWgNo1cU/xSplrZDFvg2CLYnGO7qhNpBKgR/YgMFNyE1lDCM8t0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qLrrIbPt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DDEBC2BCB5
	for <linux-gpio@vger.kernel.org>; Tue,  7 Apr 2026 12:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775564377;
	bh=1c5la7jW3HK3gF97OtM6GfLE8oFAaLIEYMk33mp27dY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qLrrIbPtHkYIJmyGmzo3jt4ySZ1Ok88NT9lCp5L0KXPUV3kqQD9O7Moididr/Gc0G
	 BudIBX9uBTzUuQl447jvHTNNzavjCeJUucoyifvogzvsSWzW1yuEbR2RoLKeI8xd0D
	 RQBqvBcycO7b/ozSFxYTZw1kk95lz8P1ylPJIbBm737GN3aDEIoyerJEOGF70oS/8A
	 sESKDh8HB5gXk/xrbGhc+a91KmoYN0M0wpdXWEq1IBbLsyG5KbcWjuLUCgl4CoqIGj
	 7r3+g5yj5eStn8wSw2oDONLAMxqNdQQ+QKw1/6CSc29BXD//BXHwriZsz+qCWce/mb
	 gScFD7f1Tmflw==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6501725d888so3812544d50.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Apr 2026 05:19:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL2Bm63VogNA1FFhPQNpR2k+38JUqX2fcYZ8tnrL996BRWdCD6SMfSBrfRNeckEQ9zocQ4Lh13bFo/@vger.kernel.org
X-Gm-Message-State: AOJu0YwESkVoraJO14CVbngzYNIEfPKobFxL+ONb9KM1l+p2ttPNkHTI
	UmDdz0wUwQUXIKoWaDXVfuVsU0sZ1g29dvDNovrXKdmddr/n9j2NlcbPFdUwRQZILtsh3Q95C30
	hs4C6g/IqFhI9chRIhhDq5kNI+dwYvhk=
X-Received: by 2002:a05:690e:169b:b0:650:1b68:874d with SMTP id
 956f58d0204a3-650486f471amr15894844d50.18.1775564376854; Tue, 07 Apr 2026
 05:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1774283146.git.dan.carpenter@linaro.org>
 <edd789f8fc87f294211adf84b09c2af9f4aa6a6f.1774283146.git.dan.carpenter@linaro.org>
 <CAMuHMdWRgkAE-eSzRif6DSqRgOySiN48vcogESN1s2gs2k7bJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWRgkAE-eSzRif6DSqRgOySiN48vcogESN1s2gs2k7bJQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 7 Apr 2026 14:19:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=EHrgDiXS3X+49MPZLaG7+WiPFaich0Cf6EmD8eGTrEQ@mail.gmail.com>
X-Gm-Features: AQROBzDcs91SP9msOOYh23t_2WceF5Zb13bPz-OsJOPeQmVMS6t1TQZeKeJLTUs
Message-ID: <CAD++jL=EHrgDiXS3X+49MPZLaG7+WiPFaich0Cf6EmD8eGTrEQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] gpio: gpio-by-pinctrl: add pinctrl based generic
 GPIO driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, AKASHI Takahiro <akashi.tkhro@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, arm-scmi@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>, 
	Michal Simek <michal.simek@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,kernel.org,vger.kernel.org,intel.com,oss.qualcomm.com,arm.com,amd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34781-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AC1213AE400
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:21=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:

> > +config GPIO_BY_PINCTRL
> > +       tristate "GPIO support based on a pure pin control backend"
> > +       depends on GPIOLIB
>
> Should this depend on ARM_SCMI *|| COMPILE_TEST)?  The driver only
> matches against the "scmi-pinctrl-gpio" compatible value.
> Or do you envision a use case without SCMI?

It can be used without SCMI but SCMI is the only current user.

I imagine any firmware protocol (e.g. rpmsg, heh) implementing
a pinctrl driver could get GPIO "for free" using this.

Yours,
Linus Walleij

