Return-Path: <linux-gpio+bounces-38135-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QD01L9ZGJ2oUuQIAu9opvQ
	(envelope-from <linux-gpio+bounces-38135-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:48:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5465B141
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 00:48:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VfTZBMqs;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38135-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38135-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF757300614D
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2026 22:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AC23B4423;
	Mon,  8 Jun 2026 22:48:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE45399365
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:48:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780958931; cv=none; b=XoL1jYkA7+BP4+kK4C0/xAuVDDx/VBVn3kKeB+wXuVKu8LZ05sTDnCVhkOhr+xkylVDXgPxZEXDxDO6MoAHwGA2vcfZInbFypFv0rJKHxelpf0R4vArQurIjY2y5chUuGvJ11dr3Zvydxp+j0qeK09nuMJd7PEjg3MNgDJmDvc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780958931; c=relaxed/simple;
	bh=94cmPWlvUu42rtnKwVRSkimUl+Wb75QanUd2ZnZoBlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5vOGPyQHHEx1TrdhmZiOxIiV8Me8NNXD4bgyaDC6ZH8N5EoSiDHayozYVXzqhi8PvnHPrxdBth2gRJ0VeovTM810opFGDaKEkozUJCexB4NZus4URALJS1XSy+MndAICYhrp66/inXlbBPGPbCZ+xTGsUQf7T43XxVmevOkxNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfTZBMqs; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE101F00893
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780958929;
	bh=bQAA1gkC5D0V10yngr42XwECHgAK+Enu5D3WxKr62aE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VfTZBMqsyZblYPJnlx2w/a/TfOvCdWabOsabfB6/9Y2uL9qgLwLI1rzWVFysb7OwF
	 NfbdD3n9Bos7vKE9nUNXiPVNJUQw+Y5EotvbIxDWvba/M+S4lZAU+GJHOC+V9ODA7L
	 BOHQTAWLu5PTvOeFeA2Gmx1aKrf0TFJLgwOuFLc+rM0z+yYwA4qaXUXffI2pLRfI54
	 GpczzrYCnmstrOo65oFAZsUNhBw5Z7e8kqW+xsl5ShaT1cJbouVi5ASu0Yq1HWnsw6
	 2iSTJ7Dr7CbWZJLbRddstpSWdk2EjdvdunGtJeCu9XpMPtFPmxRFbxjI3YO4UCpZmt
	 BQVumCOm+emxw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so5239400e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 15:48:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9pc42392tyESj99NHw6L84S7AraH18EHivddgphyHT+kkh+doh0E+OTOhOdHw47/mJop0+ySl+PJs0@vger.kernel.org
X-Gm-Message-State: AOJu0YymflZGz5a1vozYbL1pRRitAvdR+Wkv2RbEW+ZO946sBnX2Lpfs
	o/GgHgx+V0GYDBksMwTAwNDERX6JWmgfDrUc3ObOKWbjb971It33uNY1FMkG0yoHsLfvZc6Z1xa
	/EBivvqC2+YZ9isVgQO/mjPIXdWEzd+w=
X-Received: by 2002:a05:6512:a95:b0:5aa:671d:9960 with SMTP id
 2adb3069b0e04-5aa87b62b68mr4213767e87.6.1780958928520; Mon, 08 Jun 2026
 15:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602211116.2033792-1-ttabi@nvidia.com>
In-Reply-To: <20260602211116.2033792-1-ttabi@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 9 Jun 2026 00:48:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXpGjOPkX94ALTqQHmiePz42mRuZaNCvBYdoK7SYMf-A@mail.gmail.com>
X-Gm-Features: AVVi8CcOkAXd9haiS5dH5BD1HvnzBae7JR5zFP8AxRwp5rcLc7SpGcmCkfKq2wM
Message-ID: <CAD++jLkXpGjOPkX94ALTqQHmiePz42mRuZaNCvBYdoK7SYMf-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: PINCTRL_STMFX should depend on CONFIG_OF
To: Timur Tabi <ttabi@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	amelie.delaunay@st.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38135-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ttabi@nvidia.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:amelie.delaunay@st.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52C5465B141

On Tue, Jun 2, 2026 at 11:11=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:

> Commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
> on OF_GPIO") removed a redundant dependecy on CONFIG_OF_GPIO for
> several pinctrl drivers, but this change also removed a dependency
> on CONFIG_OF for some of those drivers.
>
> Normally, this wouldn't be a problem, but PINCTRL_STMFX also selected
> MFD_STMFX, which does depend on CONFIG_OF.  This conflict allows
> MFD_STMFX to be enabled even if CONFIG_OF is disabled.
>
> Fix this by also having PINCTRL_STMFX depend on CONFIG_OF.  This is
> okay because the pinctrl-stmfx driver actually does depend on CONFIG_OF
> functions.
>
> Fixes: e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on OF_=
GPIO")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Patch applied.

Yours,
Linus Walleij

