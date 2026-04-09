Return-Path: <linux-gpio+bounces-34950-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOIvMlGq12kMRQgAu9opvQ
	(envelope-from <linux-gpio+bounces-34950-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:32:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8323CB3FE
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 15:32:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EBF2309DFD6
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C93285CAD;
	Thu,  9 Apr 2026 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkIxN/z1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA930148B
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775740894; cv=none; b=EenjRiGp0TdfgPNMCDb11EMRHmprVZGkheP8UnRRV6055RNEStd0aaAicXCmkP2eBEKh79CbwhTX9u6l5ukbdkhru5kzAgz16DIR0187tNqlYrowMu13DtbfNN80FL77iksYVd0+nhD9+q+pWwddBiBQ66cBqHFBWJ2sf+EMQ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775740894; c=relaxed/simple;
	bh=3Yn4q606DjOJUZbdDDB0e9pNUeWm+Eo8E4HFU6sKIts=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZiVub0wLmNdRDAtCSnFEoUeeXnJklncQSnFz+JMNPSrqIwRrlhdG/WXDKZZh54QkzzpML+ngT0tK4bpFRTQURcOxiwvFJZ/c7Zfn51kemOYEBup+4qaywMsjS+yqWCg076cZDIWpgXW1sfaJozdfCy+8Jr8iy4izlJQHCLR2DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkIxN/z1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E3BC2BCB2
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 13:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775740894;
	bh=3Yn4q606DjOJUZbdDDB0e9pNUeWm+Eo8E4HFU6sKIts=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=jkIxN/z1U7U4WQn7cyQqwrdi/5xpgTWrEVURK13HSaRV0GPiWeb3JluVZj8a9hQsM
	 eoCRIVEE7trk2TpbbFexSxRFKbs6pwrM6ZMVEjg4ttJR1CqjG6DGvs7EIhkqoLswJR
	 K0sDGU99LQctfwA/fbTnLqftjZx982UWZvNl063PUFZATOc4JXJ8GF+/EWtOERwrEO
	 8Sx2bd69FO0OPQeDbtq7l4vm7AM01PVprd7snLH8yLh8BIKM57+qTnZwC55jkYEJJQ
	 X15KNZTntX0DPcXFGHTB0vwE4o2Qck+NLata91vfS0uEFIcgZkcJd/U9iKoTCClov+
	 pBA+VYT65OStA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so886896e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 06:21:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnhQ7MgpWgHxkfeVNOihKhE443bJf1GtkWX7DVgjH5CMv/Tp/REdTHTunyen60WCxt9lHUPEZvZfHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKqLAWN4oWgV6pKVycrRuMlPxP29UMV9kFWTH5RKNCpG9D5iR
	YL3bjQdXOQI1e0BwrL8pTdCaeaWJPJzdJoXmSV/98PsQuAjXqYsjDc5AsGY4Cq7scrFt0wtxVvN
	EqIlenZL085nLVCsIfhJhtDIbNxcoW1P/F8KMUVuzHg==
X-Received: by 2002:a05:6512:ad4:b0:5a2:86a3:709f with SMTP id
 2adb3069b0e04-5a3e7a29e66mr1450988e87.17.1775740893204; Thu, 09 Apr 2026
 06:21:33 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 13:21:30 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Apr 2026 13:21:30 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260409132041.GC3290953@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-gpio-timberdale-swnode-v3-1-9a1bc1b2b124@oss.qualcomm.com>
 <177574072110.3341478.15028296329332074230.b4-ty@b4> <20260409132041.GC3290953@google.com>
Date: Thu, 9 Apr 2026 13:21:30 +0000
X-Gmail-Original-Message-ID: <CAMRc=McV_fsxVK8VBJOZSV0=Pw-WzZhqSVU00LfWUENqpKVP4A@mail.gmail.com>
X-Gm-Features: AQROBzBV8HlzfMxNfXIyxOOcrksFT3QmNTMXXryf4JAxLRYrkT3Jmx1wyB1lFQg
Message-ID: <CAMRc=McV_fsxVK8VBJOZSV0=Pw-WzZhqSVU00LfWUENqpKVP4A@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 1/4] mfd: timberdale: move GPIO_NR_PINS into
 the driver
To: Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34950-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CC8323CB3FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 9 Apr 2026 15:20:41 +0200, Lee Jones <lee@kernel.org> said:
> On Thu, 09 Apr 2026, Lee Jones wrote:
>
>> On Fri, 27 Mar 2026 11:49:07 +0100, Bartosz Golaszewski wrote:
>> > This symbol is only used inside the timberdale MFD driver. Move into
>> > the .c file as there's no need for it to be exposed in a header.
>>
>> Applied, thanks!
>>
>> [1/4] mfd: timberdale: move GPIO_NR_PINS into the driver
>>       commit: 13f5997f2bbaee976e1a4a6873d6bd40df9b2637
>
> Ignore this - I actually plan to take the whole set after -rc1.
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>

Should I resend it rebased on top of v7.1-rc1 once it's out?

Bart

