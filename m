Return-Path: <linux-gpio+bounces-33847-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AROLlM2vGl3uwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33847-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:45:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 333412D0394
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E64F303C84A
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B8E38AC99;
	Thu, 19 Mar 2026 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVX6estH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7582D5C71
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942228; cv=none; b=VFORhN9rni7/XPlwcGWyvgnmRxQrjhBhmC97CJ6vVq/BDz5Vn639tQ3DKqbcNI+8SMLc02ybDy+evu2K0i63jLwbUFR/EwzDiAyhWQ9iWOPepxbs4yUGI3kH6mo73EYkDGEBIzDPMeO2U3oiXyIBh8XMAnb3FhAcRQbJyyGvLqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942228; c=relaxed/simple;
	bh=lUs1LFiocDSLJFYRCglr5yRLcWXadIjMCj6syvM+x6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eds0lcJwvXxDtEyApCT8TThSFyNMJFIIBLmK1WcNQAIeJuqmXg6ke6Mer3qDSpZUdxDujhDeTaK1BgELSInDq1a20SUZmWPcDItNb5GVZS3xHX5pi+729fzSDdKcgM0zCQIiCKEDqENxJ9AfyFrwBXqbtENQFdosKYAew7rikbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVX6estH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6DCC19425
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773942228;
	bh=lUs1LFiocDSLJFYRCglr5yRLcWXadIjMCj6syvM+x6Y=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=dVX6estHJo9qPEoIG21q8FfHANwYkL1J7akZ4LRkOXESQ18e3UD5wT6Wfbjy26kGT
	 2eXRjI3il2ZuPBAjJuFiV8/ImRqXO5TLF8hjfgP5k/It9hJdMJthKJfYtmZJsJ1CXa
	 feawkEs0x5DyrSizEecKYFMF36E/H0+QLDqywt15cmAggWXvIyasrE8yesptcCuOem
	 8quWgY97Jl7SCEeM9i8RZ65I1b0f8A+HT2733Ve/w/Zv7LARKyT107ytlN0qUAE34Q
	 rfiOP1dJZf1VDnnGFU8ZrmWLtDQ7n5hbuLvFeimMzX0l5bVo+csnECGqsWMSJJB8qI
	 U5+61m89iluSw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a01c80c34so7697341fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 10:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxqzEKAGDky3JYsL7B+dQWA6n8g2m9d9haiRQuF+Mis8DUL0i3AzKZseSyH7HRIjMJmagojElXGuTd@vger.kernel.org
X-Gm-Message-State: AOJu0YyJEsBzECsH55rg1Pq9DLge2+CLd/5NHx2hpYkwG0jEofe8p60C
	wDVQ317rDeHw22Lt3x0RpumCAE+mC/z3wKkA23s0c+lMTVo628qP0D9MKwq0XJywoTJ4haVooa/
	RDwqKYP3zTyRyfYcHKLIlBkFhWv40BJY=
X-Received: by 2002:a2e:878d:0:b0:38a:a77a:b0b2 with SMTP id
 38308e7fff4ca-38bf9736bf0mr900671fa.30.1773942226753; Thu, 19 Mar 2026
 10:43:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl> <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v5-2-092834a882b1@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 01:43:34 +0800
X-Gmail-Original-Message-ID: <CAGb2v65E0ySMbRadvDLFk4rDT0=GVzZxSbxj9dxsu2m+TBwbdA@mail.gmail.com>
X-Gm-Features: AaiRm51XS9DJV3maNeIBiCDDt1obC7vcOgUI0Asztz0Dh1s9NssQ_vC8bOgjeY8
Message-ID: <CAGb2v65E0ySMbRadvDLFk4rDT0=GVzZxSbxj9dxsu2m+TBwbdA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33847-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.937];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mmpsystems.pl:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 333412D0394
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 1:19=E2=80=AFAM Michal Piekos
<michal.piekos@mmpsystems.pl> wrote:
>
> Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
>
> The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> is in uninitialized state.
>
> Solution is to set pinmux to GPIO INPUT in
> sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> earlier.
>
> Tested on Orange Pi Zero 3.
>
> Fixes: 01e10d0272b9 ("pinctrl: sunxi: Implement gpiochip::get_direction()=
")
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

