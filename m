Return-Path: <linux-gpio+bounces-38337-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VFC/M++kKmobuQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38337-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:07:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B7E671A8F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:07:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=j6DFO0Ps;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38337-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38337-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 440A93115BA7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D7E3EDE7E;
	Thu, 11 Jun 2026 12:05:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8379E3D5226
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:05:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179538; cv=none; b=Qe+3eoEmOYPhQzFnd672Ma359D2OyNPlo9QVqP7riZpOj3qu/JoIkwpq3SBgYXWqQBzW7dFW34ZOWr6igOWkred9JoDQRm8qDXUPMI7yZ5+7gjnFWk1NhdFkJZYr2TFbumbCz4LOfdd1f2Ku7gSaXS4yil+RXNWCx6bpA3eeN58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179538; c=relaxed/simple;
	bh=wrcsMxZyls2p4tlqpc+Z/HmNrwOrVTky2cP+fRV5G94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubkcatA354Me+X+OjSwEoT7j8UHIcF4fQT2QiZ/iQ5A4dR6Mia4+s50o1OtyVshSJuP1TiF+0k21tzn2W2LCA/zBFwHMVMyzhBO7elmigwmUsm1T+jInf7WfRZ2UMnwR092tUmq8NOjEIgpwILZJxH1omQTnI/do6U8rxH9r32s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6DFO0Ps; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9051F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179537;
	bh=KRRC4RojRLjiKneXTP+E2iF1MikLDxHMKlltZfryQL8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=j6DFO0Ps1mv6ikzbpJruypHied6aqLV7ollyxhogeeJqqI6wvTh0BXfdicIj/jnOv
	 Du4W3bJEOW/hmyT/17x/4yVYxQD+euL4pfN254Lin7SUx9f85ad+pHY/VVe0XPASkF
	 nOMVY8UJ/DxyRwdTpoRAU20ijtSdn6Kd2o9yl1TzbYn816k/A91aVdGm5yU3t/Uw6p
	 2Nvi+mMJeIUdLu40iK93jyO51KcNDbBbxGkiBadnBZIzokeu0lhOM2ocLj84y3XXU/
	 Qh/DRhGZytDYNF8y92QyYk+AMxbqBwQBPj3uXqiZH9paSgwoeGlcfsjfE+JH3IyPCu
	 XzSidcvIBu/Ug==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aa68cfc182so7245819e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9OBhJuaZdHt20DEND0pyWFJcmhPWxPI9tGloPjmXOjrvgHssRAlmaN3gPzxWHLfSQEhpiOMegqih3M@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlMcoMMboyezYbd7O1DeYEUg/IK9jp5QokGeXTIJ4oBHoXfyv
	TGG27blRobHvQmkr8Pra/wTZn8nO9ndRdCH5e67INXjldsJA0qqboG3qxRrlX/vLhOGJvQr1+u4
	ov5gUoLSE+5cyhWhnoe0YzdeGQXONkQk=
X-Received: by 2002:a05:6512:3a84:b0:5aa:6e86:55c8 with SMTP id
 2adb3069b0e04-5ad27aba5a0mr838729e87.12.1781179536005; Thu, 11 Jun 2026
 05:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
 <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
In-Reply-To: <1a90a36a1f939406bdac6ac84c8f0b3ddf313bd5.1781017599.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:05:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLkoBb7eEbJZ+DdxWpkAVnrLwx21GzekHsGRvyBCdWkAXg@mail.gmail.com>
X-Gm-Features: AVVi8CcLgX3V7qKUW52gA7DHBmVxuiO3m77TWfE0PQxfnWVp5PktdfNSmd3QdaY
Message-ID: <CAD++jLkoBb7eEbJZ+DdxWpkAVnrLwx21GzekHsGRvyBCdWkAXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra: PINCTRL_TEGRA264 should depend on ARCH_TEGRA
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Prathamesh Shete <pshete@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38337-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:pshete@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55B7E671A8F

On Tue, Jun 9, 2026 at 5:08=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The NVIDIA Tegra264 MAIN, AON, and UPHY pin controllers are only present
> on NVIDIA Tegra264 SoCs.  Hence add a dependency on ARCH_TEGRA, to
> prevent asking the user about this driver when configuring a kernel
> without NVIDIA Tegra SoC support.
>
> Fixes: c98506206912dd0d ("pinctrl: tegra: Add Tegra264 pinmux driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

