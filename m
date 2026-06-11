Return-Path: <linux-gpio+bounces-38336-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 23jRMeykKmoZuQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38336-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:07:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C4671A87
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 14:07:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=aSBYio2L;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38336-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38336-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4865330EDEBC
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jun 2026 12:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB0B3D47A7;
	Thu, 11 Jun 2026 12:05:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1903B3D5226
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:05:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179520; cv=none; b=Jfs8Gi5HWwox73tSg+leaH1IMvvqXONrybsZvssdNvVIxrco3/0BHZyo5w1QcJBce18OXBO0JHVXl2FvJ4/Q09Ivl6fxvftJJo8/y085zVM0+8NjK9vcIiLJ+yJIcxsqtu0v45tkNS+qm3JYFKgjUFUUk9Fvy09bW5fi5iIBYtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179520; c=relaxed/simple;
	bh=0ox/fqkWsVCdzpGqz0ilLvGi8+8qWbIpBbT2MLQ/xzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B53/1qjhLUWlNof3OoIh9WTsgBvRmC97TxLq4UUEXlf/VoB37WqFZUXPRDPOt/uIIj1deUWHFnd+6GKhhROChS4th6nIDcuDRDtAlbrnx5NOddKiLCyesBp8X1gciw3JE9LXZ3kycakw5mkDB0562xeKzgS/AJEDK+P5sbeveYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSBYio2L; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC02F1F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179518;
	bh=tzwPLZ1uKPc2EO+74Kx2DEzweWGuSsCcDEj8J61jBjs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aSBYio2LtxGa/VjLJO8JIr/qvAwztQ2XmJUHD7qYW6sdm7ZcF4/KFnMFg4cZG2qwM
	 ycCauTRw3BvBgUOT5iGedjnuHRGUsJVn5MqxYepvvgZoDUGGPIMFtJ68V/yZsTyTT8
	 P0plHseWQdkXwOwa13EDFKbR9x2ie1vOvl1RFINQFkjhgOR7GDwB+FwSa3BGaZx3ER
	 NUWz+ai4bVzPrTTRjz6wNFXsYSHruj5L6uZHDA0XI3YsF25sbK5Q7HQk6Sn6F9VV9F
	 yM1ZDf9dlzTk+P8NGHXGHgeRJIE8PxrqMPwVC9rtymrbGI8E9IRNBMhLchSXbUbRRC
	 IglpZCT1halyg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3965bc493caso73108491fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:05:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9782Kq9a2m8HTrdtTlhvGJSAvj2hwJaFhSGJpkORDrAjtIOSyKhoy/DNmKpmY35xNscJJl8Y/SBR19@vger.kernel.org
X-Gm-Message-State: AOJu0YxGKT+q/++RIIjMd1GROuLiFG0RfJgfJ7xjH3+/mNv573JyVbGv
	f9SxjT5ubS6lXyY20yzArcG+5O8GDUOZZqhDafGU6Zvke7MdkRzSkRHSRBuzMK4sp5oPZ/8N3s6
	rMbl79meQp004hiMsscjdE90foNThMo0=
X-Received: by 2002:a05:6512:3e20:b0:5aa:4ca4:d396 with SMTP id
 2adb3069b0e04-5ad27ab9c66mr776867e87.11.1781179517535; Thu, 11 Jun 2026
 05:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
In-Reply-To: <0643b689f0f4a453d31183d9f598a6f53574ecbc.1781017599.git.geert+renesas@glider.be>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:05:03 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fP8OTgqhkTOacsCm7yRVSWi1juVrr_X32i+bx9AimBw@mail.gmail.com>
X-Gm-Features: AVVi8CdgWWkNh8u2LrT_7NUVxyvv9pybax-QmXRHly_PivQ12R3ZEvISgOVx2BM
Message-ID: <CAD++jL=fP8OTgqhkTOacsCm7yRVSWi1juVrr_X32i+bx9AimBw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: tegra: PINCTRL_TEGRA238 should depend on ARCH_TEGRA
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38336-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:pshete@nvidia.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:linux-gpio@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 143C4671A87

On Tue, Jun 9, 2026 at 5:08=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The NVIDIA Tegra238 MAIN and AON pin controllers are only present on
> NVIDIA Tegra238 SoCs.  Hence add a dependency on ARCH_TEGRA, to prevent
> asking the user about this driver when configuring a kernel without
> NVIDIA Tegra SoC support.
>
> Fixes: 25cac7292d49f4fc ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

