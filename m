Return-Path: <linux-gpio+bounces-35907-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNPPCVlC82kGywEAu9opvQ
	(envelope-from <linux-gpio+bounces-35907-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:51:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66F4A260A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 13:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C4CF301951D
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 11:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE603FFAD2;
	Thu, 30 Apr 2026 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rO9fc7Mj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACBB3FB073
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777549884; cv=none; b=mXaozhurjbBHA4BbGat1/9QoiGV7U3mOameuCzavA3lUbhO64gaCtBKW0S/SnPrYrMLqN/Jv3vjBShdHflHPFFlP7pP3dK21wCorwC1UDZozS3PwamPK7LO76/aknItJgss4PCf/RZXWnIAOsQcNeJJdIzmx5hLHAvFm1qXBMZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777549884; c=relaxed/simple;
	bh=U4/1urlTNeBpK43lmI0V/Clwh9lBOlfo2x4tV+QItjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dM2Mu3WdXs9fphIcmmnvVTCEsXEZGuVmOulvmnBqDPSQM2NOzsG4DocTUwNru0ZQXIHnT93rXVVitux99Tq/2dZ14VElHgH06Ib+sheFgGfESixsq2WLkm7FXbn9a3q7g4R2wfdD0wURV3/Zyr4JRSbkhIj04coroWnOKGiAug0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rO9fc7Mj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E2EC2BCF4
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777549884;
	bh=U4/1urlTNeBpK43lmI0V/Clwh9lBOlfo2x4tV+QItjc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rO9fc7MjBJmjMitsNqALbv4OjEzhJF71HnKG0XMbPw5jWNf0BuICfdmkGbWlmE6Pm
	 /vFVcb7T43/e6QIkLnd6d1Hjk6H/XhDgoKaOw/C23pPthqo2LmoqyJPy9JK1Cagpjg
	 KUf1TP2R7JmE6kczJGts8L14sPI5jXmfo5hsQliEdc4oETPnwGOj1HxAKS35B8FGyF
	 bJehEAcluqup0gunc7zgdG9ogcNItnPbZGUxMx4AkYPZ+4+y/aaE8bzBNUjLvM5DRS
	 Zm5V3VBF6BNTl0GiusZjCn9Q0rRWgHV1Thw570ISUnF4qxFnhO3smQM8y1whIVSOh5
	 4f9khJJ8DAwLA==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38be5e86918so8737061fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 04:51:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ADGvigTA7cGVZbD8QzGsdjj6wwz+5ZqvJxuHu2UtOzrFY+DHa094sJZtxQ//qbayIycJrZ73kqHZK@vger.kernel.org
X-Gm-Message-State: AOJu0YxgeroDGqe/AUJKgQ32SSrfxCN6w1Lx7Embm9qhghS0Ha1MHTX9
	nVXRH/23QsOL86EBHxIbBA8mPBD51hZ079t5H8+KS1sEynrT0vp2cJAQSLGB9EA/I2XpCLoOHhw
	+u5UR8CsrGlBlVhPup3hQ0a6fVQDuHa0=
X-Received: by 2002:a2e:8a9c:0:b0:38e:2445:fca2 with SMTP id
 38308e7fff4ca-3934e2a170dmr10566591fa.31.1777549882847; Thu, 30 Apr 2026
 04:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-shikra-pinctrl-v1-0-1b4bb2b3a8d6@oss.qualcomm.com> <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
In-Reply-To: <20260429-shikra-pinctrl-v1-2-1b4bb2b3a8d6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 30 Apr 2026 13:51:10 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDc_Myjt4TKUHZAqYqVwO37TaRO6t23ABew0M5VnzJWg@mail.gmail.com>
X-Gm-Features: AVHnY4LPoIQvx_jLzlrhRwIRy-fNju1N_G-lNduChl95Or_lqe2kRzVHAk86iLI
Message-ID: <CAD++jLnDc_Myjt4TKUHZAqYqVwO37TaRO6t23ABew0M5VnzJWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Shikra pinctrl driver
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: BD66F4A260A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-35907-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Wed, Apr 29, 2026 at 3:12=E2=80=AFPM Komal Bajaj
<komal.bajaj@oss.qualcomm.com> wrote:

> Add pinctrl driver for TLMM block found in Shikra SoC.
>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
(...)
> +config PINCTRL_SHIKRA
> +       tristate "Qualcomm Technologies Inc Shikra pin controller driver"

Those descriptions are changed in my devel branch, should be something
like "Qualcomm Shikra pin controller driver".

Yours,
Linus Walleij

