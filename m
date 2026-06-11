Return-Path: <linux-gpio+bounces-38340-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WYoGHZinKmrWuQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38340-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:18:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC75A671C05
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:18:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a8EeECZu;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38340-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38340-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAF08303F05E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40982351C2D;
	Thu, 11 Jun 2026 12:18:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12C33A71B
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:17:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180280; cv=none; b=DOAMr/twREnRyjAQQXhtGQRjyU2BKJgQBZM/MimwPDqIAWxjUFi3UcqGulRXPCOb56TdKS/ZLUaGD4ZtnS+8n6of0ffIvLubL6nzN+/2Eh/390dTemlGoWfBf6gCHxdKgj/efDQt6zHj303cuxG/a4f7nnIRSPyLgSNxitk2k0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180280; c=relaxed/simple;
	bh=T2fvxlOvyzqFwmbiIi/WNiQRyhRS3OG8inuNWUXrY28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YJAYleBIjQ1KTxrOPM+cOZkjgjNlOkq7i0ob9SShoc/RvU3Z6Q+brMVNLdAQ7ad+WMhRGSrB6cyyeZB+mL7al+XGKxxyMYfTzRb2u3nnsTsvQB9Y68AvkR0l5DLvYza8i871S0I1q1c3Mi1KAoB0QuGabRZaUqpHMO7vHcQI1n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8EeECZu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B0D1F0089A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781180278;
	bh=T2fvxlOvyzqFwmbiIi/WNiQRyhRS3OG8inuNWUXrY28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a8EeECZuDAlrC5oBAgvR1hzA5xezuA7BijF8qDYki2ipN/xh7btF/G0KbYL1yZOv9
	 9Z3BabfVYMkcHspspLvW2NTPOZeOi8IR17AdDq07lQAituYsYVkCNg5QsL3b3VuXII
	 hdPBl6enGVJp7Qhs69GKTLWQwho8Xe75ceKDSU5THA+E6i2FOPtm0+aKeQocHO6eiE
	 2QoD2ud5CkF9PJSOQPR4VDJxEWVAlCRBdZysdi5MMqUDvG8zjhWbf3uAEwiiMzZCfs
	 eq2L0kMJkjXXBzNTdlqfsc2yMiKu8iLg4maeSd1N7e9w/bFH0kO3M2863vgLePH99z
	 t/g+nmoGgptuw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa619653e4so855721e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:17:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1yT1mM771Sm4bAgxygtxhLJ6e8aDjNRyaRZvhs8pYG6GXGcZIQkuPve1rfaB3boeQ8DPtHcw1vlHd@vger.kernel.org
X-Gm-Message-State: AOJu0YwdKzQKNO8lymkHfkBBKiZlRvvZFDiJaPvwVsWfqcm1I2BdhYwQ
	nl0nGEWbzuPTVl4kZtEt76ou5TnMXcaASEBnDur6nK/hZSl+Nmw+kFL57H4igKRYua+6g8h/Y1T
	pjFjZdaODeesXoFECGKD504WtBzbG9jU=
X-Received: by 2002:a05:6512:118b:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5ad285daf65mr662871e87.2.1781180277617; Thu, 11 Jun 2026
 05:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529100838.8896-1-hardikprakash.official@gmail.com>
 <20260529100838.8896-3-hardikprakash.official@gmail.com> <20260602185339.GA404948@ax162>
 <CANTFpSX0Ehpno7b=xrnqzmENn=sfKj1UcyRzXvMyy4Rcyr7NhA@mail.gmail.com> <CAD++jLkx_zx_w_rSm9FxzbPOFMgMrq8NvfZecANLkmrMv=19fg@mail.gmail.com>
In-Reply-To: <CAD++jLkx_zx_w_rSm9FxzbPOFMgMrq8NvfZecANLkmrMv=19fg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:17:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1yVs7sasB4vxO8_ebxHG_Pc1f3ZpPa_eYc_6oOeqnAw@mail.gmail.com>
X-Gm-Features: AVVi8CeGxSPjS-HYngKq-xAX3JQnF3SLm_mVMUy1FDJh_FcgDRO74I4qqbBv8T0
Message-ID: <CAD++jLm1yVs7sasB4vxO8_ebxHG_Pc1f3ZpPa_eYc_6oOeqnAw@mail.gmail.com>
Subject: Re: [PATCH v8 2/2] i2c: designware: defer probe if child GpioInt
 controllers are not bound
To: Hardik Prakash <hardikprakash.official@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-gpio@vger.kernel.org, wsa@kernel.org, andriy.shevchenko@intel.com, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38340-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hardikprakash.official@gmail.com,m:nathan@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@kernel.org,m:andriy.shevchenko@intel.com,m:mario.limonciello@amd.com,m:brgl@bgdev.pl,m:basavaraj.natikar@amd.com,m:bartosz.golaszewski@oss.qualcomm.com,m:superm1@kernel.org,m:lkp@intel.com,m:hardikprakashofficial@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC75A671C05

On Thu, Jun 11, 2026 at 2:14=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
> On Tue, Jun 2, 2026 at 9:50=E2=80=AFPM Hardik Prakash
> <hardikprakash.official@gmail.com> wrote:
>
> > I am preparing a fix that skips GPIO resources with no resource source
> > string (string_length =3D=3D 0 || string_ptr =3D=3D NULL). I will test =
it on
> > my hardware first and send a patch shortly.
>
> I have not sent these two fixes to Torvalds yet, so I will drop
> them from fixes.
>
> Fold in fixes to the two revert+this patch series and send the
> fixed patches again please!

On second thought I kept the revert and just dropped
this patch 2/2. Probably safest.

Thanks for working on this Hardik, we'll make it all work
in the end!

Yours,
Linus Walleij

