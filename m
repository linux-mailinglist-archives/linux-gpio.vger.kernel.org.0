Return-Path: <linux-gpio+bounces-37132-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G1rOpkoDGq0XwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37132-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:08:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6661057AEBE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 803D03140603
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 08:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9EC3EFFD9;
	Tue, 19 May 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpvzYAJO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD23EFFBC
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180998; cv=none; b=FRLfpMHZNMb5RWB9ncKZbwzdq/C/SDW1zRrRG5UoogS6gpVB94s41mAT22/2zk4U7/PygZpS/koUladLYCtEK70ELtHGnOmUpxUWcWOdkAq3BF5HJxsY62h/OGv4WxFOE96qCZfF/R8H2J7hTh7DrWpa1kvsK7pVfajEy+8fkX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180998; c=relaxed/simple;
	bh=DTO6oQ3UWQu7nWcb7xh4ej01bSLnP6c3NCUp9jbOkuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEsAPUq4iyoaF5waQOB4sVEj3Prg0a51/BzDB47ch5bH+vj377lsa8udxiWVG/hxkb2a5ZFMpigQbMy6nIBuWQNEnVS/H4HVpLIoW1ztznP6a6eEraIwxZYG3xtRGUgkF++IyKYQqMohbB8BwjgeOaPSJe/iYvuj6yHIGUx2DOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpvzYAJO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F803C2BCF5
	for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 08:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779180998;
	bh=DTO6oQ3UWQu7nWcb7xh4ej01bSLnP6c3NCUp9jbOkuc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lpvzYAJOFI8GPaQgxUFmASHSRktxbO3KHVjDEHnra6umMYqObeWTIu1XT3PxUXqWr
	 VrKRmXwLqBDsz2nSnZE9x3B2d1XWau1L3kiqiRTpa6XwjRNyhqb5eQFht3X4NbxuEh
	 Rhz1kBPMNSX2g723mFjvcc6+T/1fkdCDDNplYQpLTNvm00JrhKJfgX+qqYl7ql58M2
	 A4Eozc4krWYnkw97EkC5Mf1RIxJC0K1HKV1VCXCEg6xJoIYcuLrSwDdA1/TVEUf6Lq
	 yAWQPYGwYHpJRo1vmMroQzrsjWafwwD5VuWokzGleVf4c3RNUtS+YeRWTe/+/9uyst
	 r/Yew2zAwIX3A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso2436815e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 May 2026 01:56:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9cXyUkxX6/wztLkIAFGZhXg5GAftrAb1yevJehlfcDFf+odr5xcky4xkvD5m0wp1zJT0aWG9vQNu2Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0oOp9+k1chvkC7E89m7nEPzNmA+ReZhiw8lL416VS/D+CiT0j
	V63mRXgKagN5B+Mo2wijD7ePvbXEm2PURCfedIDQeRyF5h1nYhcRPuyVO5Gqd27uXjCtTpS3irm
	vzdD88b94T0IzHP4BjhUyWabtWylgMZU47IYWzkE2yA==
X-Received: by 2002:a05:6512:2393:b0:5a8:9511:b906 with SMTP id
 2adb3069b0e04-5aa0e769bc1mr5674355e87.33.1779180997192; Tue, 19 May 2026
 01:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-gpio-shared-dynamic-voting-v1-1-8e1c49961b7d@oss.qualcomm.com>
 <CAD++jL=jL=YLOTy2JP8WfXZw-7K8Tf3KoJQz0+e353JCYxBx8Q@mail.gmail.com>
In-Reply-To: <CAD++jL=jL=YLOTy2JP8WfXZw-7K8Tf3KoJQz0+e353JCYxBx8Q@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 19 May 2026 10:56:25 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdfhTkZRH_sx0S-v0UuAPfj8RT4HAZS4zD-5HF3r_U_Sg@mail.gmail.com>
X-Gm-Features: AVHnY4IlaM9NWMSgBNuVtPeZCN56KULZcaBOFqvEg0GBt1sfX-3qo_dP0zLk4Lg
Message-ID: <CAMRc=MdfhTkZRH_sx0S-v0UuAPfj8RT4HAZS4zD-5HF3r_U_Sg@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: make the voting mechanism adaptable
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Marek Vasut <marex@nabladev.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37132-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 6661057AEBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 10:34=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
>
> On Wed, May 13, 2026 at 11:14=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> > The current voting mechanism in GPIO shared proxy assumes that "low" is
> > always the default value and users can only vote for driving the GPIO
> > "high" in which case it will remain high as long as there's at least on=
e
> > user voting.
> >
> > This makes it impossible to use the automatic sharing management for
> > certain use-cases such as the write-protect GPIOs of EEPROMs which are
> > requested "high" and driven "low" to enable writing. In this case, if
> > the WP GPIO is shared by multiple EEPROMs, and at least one of them
> > wants to enable writing, the pin must be set to "low".
> >
> > Modify the voting heuristic to assume the value set by the first user o=
n
> > request to be the "default" and subseqent calls to gpiod_set_value()
> > will constitute votes for a change of the value to the opposite. In the
> > wp-gpios case it will mean that the nvmem core requests the GPIO as
> > "out-high" for all EEPROMs sharing the pin, and when one of them wants
> > to write, the pin will be driven low, enabling it.
> >
> > Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO pro=
xy driver")
> > Reported-by: Marek Vasut <marex@nabladev.com>
> > Closes: https://lore.kernel.org/all/20260511163518.51104-1-marex@nablad=
ev.com/
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
>
> I like this idea.
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> BTW was this "voting" system inspired by the hardware "vote" thing
> that Qualcomm is using for power management? That's the only place
> I've seen it before.
>

Really only the name, it's not much different from what we already
have in clocks or regulators IMO.

Bart

