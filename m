Return-Path: <linux-gpio+bounces-37062-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFzsBKMfC2q8DgUAu9opvQ
	(envelope-from <linux-gpio+bounces-37062-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:18:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A526956E90B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 16:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84DEA301486C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 May 2026 14:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84BF046AF24;
	Mon, 18 May 2026 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1PzgXB8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CA83C76AD
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113147; cv=none; b=kFX3KaHsnCQWj+KjSJwCYoUvWwhe4458aYnQ8HpkeL0YwqkH02hAhhYhrnWZvKXKeVnTIuHViKBJ0kpxYSNXuTCFViWs93Ga5wcvJ/217HzvGZ1BFucT80kChe57Yg/+d4ifuWZ3tVgjiqnpBR3j/NH9uBBHdG+1sL7Vriac39c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113147; c=relaxed/simple;
	bh=FzwYa5fwYmVjdkVxZSUjEoNeU7VgcRFX4nzFHm9Tu4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GyBCHAlsBX17SFdN9o20yWgKwhrejzEWZuljUgXbqnfluDxGxB86vpJzy+86CoKWzEL8+1zZjKfoJf+nvmKOaRj9bV4ye+HlPG8kz4IiQeYanhEVPnGl0lgdxvD3mNllteTjo2wTTRWY30lP8eWpsqIQ6tDRTYmX60uB4Qm9M+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1PzgXB8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DABEC2BCF6
	for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779113146;
	bh=FzwYa5fwYmVjdkVxZSUjEoNeU7VgcRFX4nzFHm9Tu4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H1PzgXB8fwKez1GlgeSCa2GcJeSqoJFypd9gwduetQI0aCZEjRYwwZgiE/RK8k1I/
	 tOJvpY/4geXlHOfLieLeEcf8nPnCAnSXXbsvoVDrh1itmG6wu3dfUzssAP2LlWQ7yv
	 QIWwO1vzafnvpq/tltLGBhJnQoHT3OrO/rqe77+YdnkiO5tZILPRW6fcER0eNmsXh9
	 O8fN9rxk9DxKpre/8QxH1/nSoWgNLT4+axZQLZBYJwaabpgInvNH8s1g8/qZmn9jRk
	 s+AeAGiuW3tlOkox+qS1LNwiQbXWMdXdWUYQjELrm2yvit60uB6DTxn0KfIY1MQjH5
	 MizE3sqMp85og==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e7c3a2deaso22259351fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2026 07:05:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9MaZUuBAzWZzOTxEi3P4wEkXEMKceSmYqQYNI7Z+zmWrJ9klwO5qCnpRHXD1SyzBZBmsJrZc12x1Xl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+URETH2znmTyJkTyvM9U8zh8iWs8SuarQWmUVwih8yADPxZxE
	SBFPPgEfnBFx0Lh1chcdtd98jHOjWe8Zh9uAauvjDjbikSI/FNwAubZycF4codOBT9cyRfQfkeG
	eoyZtWBd3az9ZGhpXO3WeMtnZ8b7DvKMA20zKj4jxig==
X-Received: by 2002:a05:651c:1584:b0:393:e571:277a with SMTP id
 38308e7fff4ca-39561a478f6mr45005391fa.9.1779113145240; Mon, 18 May 2026
 07:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518122814.8975-1-hardikprakash.official@gmail.com>
 <d57dd297-6be1-43a9-a38d-e40c8949e23a@amd.com> <CANTFpSWGC7GsAY-3UvPtBZzqjNek-T5haiDb59QYRoRgwuQf1w@mail.gmail.com>
 <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com>
In-Reply-To: <7d0f0cf9-1936-4cf6-a425-228a37f83137@amd.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 18 May 2026 16:05:32 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
X-Gm-Features: AVHnY4LMSKNNO7ouuMhRBPWlrXwz9IqtMTUXof_A2zP9UA-Wx-ZastFasA4Bp2o
Message-ID: <CAMRc=MdS_BVKb=FQLhky=8dpghBSoHeBhUk0LM5hROFxmJeyGQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,intel.com,amd.com,linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37062-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,amd.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: A526956E90B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 3:46=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 5/18/26 08:40, Hardik Prakash wrote:
> > On Mon, May 18, 2026 at 18:17, Mario Limonciello wrote:
> >> I'd still like to avoid a quirk if we can.
> >>
> >> I know my proposed patch to try to probe at an earlier stage didn't
> >> work, but could you perhaps try pulling pinctrl-amd even earlier?
> >>
> >> Maybe fs_initcall()?
> >
> > Tested. fs_initcall + patch 1 still produces the same arbitration
> > errors:
> >
> >    subsys_initcall + patch 1:   arbitration errors persist
> >    fs_initcall + patch 1:       arbitration errors persist
> >    patch 1 + patch 2 (v5):     clean boot, touchscreen fully functional
> >
> > The initcall level does not appear to be the determining factor on
> > this hardware. i2c_designware is still probing AMDI0010:02 before
> > pinctrl-amd finishes regardless of how early pinctrl-amd registers.
> > The explicit device_is_bound() deferral in patch 2 is the only
> > approach that has worked.
>
> Please try arch_initcall instead.
>

What is blocking the pinctrl driver from probing? Does it return
-EPROBE_DEFER for some reason? Pin control core is ready at
core_initcall() so it should work in theory.

Bart

