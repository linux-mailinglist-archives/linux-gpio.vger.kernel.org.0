Return-Path: <linux-gpio+bounces-36525-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDxmKWy2AWr2igEAu9opvQ
	(envelope-from <linux-gpio+bounces-36525-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:58:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A9450C631
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 00FDD30451EB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 10:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A9873D6CDA;
	Mon, 11 May 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zc7Yb9mB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3DE3C7E1B
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496975; cv=none; b=oTAUQF7PKdGYGdsw4naqU3dDXGPKgKygdlLbm8yWAJhNqP6rkkMbr1KAQLwW8C+07X4a0DnDolbQAyYCliB7tBCdD5/3LcMXHzww8mkoccQyiJeLKnMQ5EIod3UOp+j6N1bcVAZ8b7pXGsLmiE2mg6QDy4Fw7R0e599dtUnPxms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496975; c=relaxed/simple;
	bh=B5rcVpLHsTmSGJPaJtBEOANpM73Tb/5UpXJ/220E+yQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMgT+Zt+RCM5amIhNa7DIlnIVCPdR0l4iJqor48nPLwZ8bg0Z3C7iTS7SseyiNuDxjNCsvrNiLYrvFl3BtI6wDR9H0MlP0OnNXuHSMrfPUNs4IGZ1lenDZm2lzl6xRvdLyOYv5PSA7VwsJoDZDQlre7h2mlehujjGpNJS2X7FWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zc7Yb9mB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DA9C2BD00
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 10:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778496975;
	bh=B5rcVpLHsTmSGJPaJtBEOANpM73Tb/5UpXJ/220E+yQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Zc7Yb9mBpoO1sZKyvVzsqPvqMnlB/8PPjPM0rjND4l3OcguLw9glGQCJDWg1iakpT
	 xfR0JH/JDSXff+hzXrmTZHrasJ5xu6V4OpEhHozgaaItmJeQ73NoYVSNZj5oJtjXzq
	 HiW1KQrT70fUH9WZR05XjU7Av9eK1qeaXySokFeL8d4/MwrA3IZvKDTj/41et7Fk3s
	 NFAmuEkyIpEMCZvB7Hv9O9hqq6g1j73bo8CojagQ1DP92NzekmcHy8tjEoEf3D0M4A
	 SpSmb03/Cj2KC3PwsEZbwz8L8FYQXHgkUlppNaTIqWdqXGZWlvddYvCwh2CZGia9G0
	 ZRv+koj5x+TfA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393ba0616aaso45006971fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 03:56:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/zVj7UNbuE6QYt+HZIiqkDd1fPW256GdMVBDfHwy40zxME7AcCcR3UsLEbNZOI0fQ+iPqOqcdnKCJq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qk3vEDj9qoueTUu2hrjhemKHhboba/06m8ntD8tYzEs0sPqL
	at0LUiR/NY+JcOJhGmZ+SbZlCgoaKsEpMtT8XZA1zImf7l7/zQ2Z9FCm8hArfziL05VRXnOedkx
	r7UnExJXDtd6k4Q6kUAPA/2Dtwt2tmBYOjeQ4YJWLIA==
X-Received: by 2002:a2e:bc09:0:b0:393:cb61:17e9 with SMTP id
 38308e7fff4ca-393cb612598mr76212181fa.17.1778496973563; Mon, 11 May 2026
 03:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
In-Reply-To: <20260511-wakeirq_support-v10-0-c10af9c9eb8c@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 12:56:01 +0200
X-Gmail-Original-Message-ID: <CAMRc=Me7SDOm5Fqr+_m2=5UoOmR24u5+KwabOtMN-BXtMK-kHg@mail.gmail.com>
X-Gm-Features: AVHnY4I4FS4H2jeAaumSTCasprwQaeZndX-NNiRoFaNF_xkiOWzjnDuMdOoXvtU
Message-ID: <CAMRc=Me7SDOm5Fqr+_m2=5UoOmR24u5+KwabOtMN-BXtMK-kHg@mail.gmail.com>
Subject: Re: [PATCH v10 0/2] PCI: Add support for PCIe WAKE# interrupt
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com, sherry.sun@nxp.com, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 27A9450C631
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36525-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 9:26=E2=80=AFAM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> PCIe WAKE# interrupt is needed for bringing back PCIe device state from
> D3cold to D0.
>
> This is pending from long time, there was two attempts done previously to
> add WAKE# support[1], [2]. Those series tried to add support for legacy
> interrupts along with WAKE#. Legacy interrupts are already available in
> the latest kernel and we can ignore them. For the wake IRQ the series is
> trying to use interrupts property define in the device tree.
>
> This series is using gpio property instead of interrupts, from
> gpio desc driver will allocate the dedicate IRQ.
>
> Bjorn,
> Can you take this series through PCI branch, once other subsystem
> maintainers give us ACK.
>

Actually, it's pretty early into the cycle, I would prefer to queue
patch 1/2 myself, I'll provide an immutable branch to Bjorn.

Bart

