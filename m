Return-Path: <linux-gpio+bounces-36175-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCxiE13G+WmmDwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36175-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:28:45 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4674CB43C
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 12:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 509EC3003827
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 10:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7D433B6D0;
	Tue,  5 May 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+XBGfQj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E67430C637
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976914; cv=none; b=f0JuGnzKDIhb3jNqB7RwAibWzGMmm/JFwitxdVdyaZkSUucsONjUDrtLtbWvyXHgYL9SfYdLKWz1ME4hISKLl1gXMK6XBPe/FLBPjaZxN3aQj1OI6JVhq0NZCU+zBBr3152mituja0D9koH0zZWcgC8PwbUjVvSlvLhToIfxMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976914; c=relaxed/simple;
	bh=zytMuWjG0fiHX9INaamnKiHfY1coYLUKlKEAABYlbWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oc7r+OueyCPjcrCGELGl2ZvB/6MZnR2xygi+r3dI42FGyTgTVk88NzliI+wOF/6RPw4qKuUHSVjlFPGcKOkvziQe6Sz69OpZxH8jMGuT/+WokQtS1OD4NevEVesamvaELCJFogXfoKQlgz/IMFjVUSl/8kVACUNGXV0Wss+7+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+XBGfQj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20847C2BCFA
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777976914;
	bh=zytMuWjG0fiHX9INaamnKiHfY1coYLUKlKEAABYlbWw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r+XBGfQjmEqlhCRyhvawLxMRxMqfQ8vs1qaoF8H1d1Lq7A3CvsSLHSsFL1d6EziXr
	 fiqGCfi9rsnhRQ66tMpjqRGdlT55Ygdecf9N90TSkgSMcpAnkHmjJLypsC4G2Z8IWT
	 trh3QJ0/ypwMnrf/XlqEij1u8tEEvFdUP2RcEALI35f4/Qwy+rc7EwGQJzSPWShQnE
	 NiaFvFE5PxYCTv2YMmt3t67fQJTMdEq6vw9Gs+KAJkh2vDtgjse3sVynfJZlG2Dsrc
	 7rueWHjaVpD2fIq2BIfPWlSJPv1WcBFw3TYlkIonUmYoygWBPNSs8CJoK5NobZnsVQ
	 Z7taWD5BsRoZA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so3872730e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 03:28:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9cG98o67FQa0WExU++BXuwEQlKG5Goa733EIhFt9eN+qkxs0PrtkW7HCJelRi4Gq+6uHnzbhAWGaQx@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJ74xPENM4TfpRRnaGSbN2BnArpsEB6gFYTXNjWcPqBiyXQfR
	51ZlJkycQCxc8f867XN/g3mAw/Ci2EmROluG06oHZBheimX3mrgSZ/5PyAUnfPAkDR9a8OuGIxz
	5vFEzVfGvbIq9IPqCqMh4KenYn3byLCc=
X-Received: by 2002:a05:6512:1091:b0:5a8:7652:9258 with SMTP id
 2adb3069b0e04-5a876529284mr2605579e87.0.1777976912811; Tue, 05 May 2026
 03:28:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
In-Reply-To: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 12:28:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLnX5J+GncH1U6zE40eErQ1LeNiPmQqZe5UewR3S4VhBOw@mail.gmail.com>
X-Gm-Features: AVHnY4JBZ0_aB4B7_nUxwn9lnfxpk_Z6f18SRCw7UeiainLcID73YORf9XCZVRs
Message-ID: <CAD++jLnX5J+GncH1U6zE40eErQ1LeNiPmQqZe5UewR3S4VhBOw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: ED4674CB43C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36175-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid]

On Thu, Apr 30, 2026 at 7:54=E2=80=AFAM Sneh Mankad
<sneh.mankad@oss.qualcomm.com> wrote:

> The wakeup enable bit needs to be set irrespective of the SoC using PDC o=
r
> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarde=
d
> to parent irqchip.
>
> This is set only for PDC irqchip using additional check skip_wake_irqs
> making it impossible for MPM irqchip to detect the GPIO interrupt during
> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
> false.
>
> Remove skip_wake_irqs condition when setting wakeup enable bit to allow
> forwarding GPIO interrupts for SoCs using MPM irqchip too.
>
> Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_presen=
t/enable bits")
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>

Good work here, also super-dangerous so if some more Qualcomm
engineers could pitch in on this patch it'd be great.

Is this an urgent (-rc) or nonurgent (next) fix?

Yours,
Linus Walleij

