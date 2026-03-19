Return-Path: <linux-gpio+bounces-33846-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DjIAW84vGl3uwIAu9opvQ
	(envelope-from <linux-gpio+bounces-33846-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:54:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB322D05A9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 18:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5BCC532AAEAA
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3808438D689;
	Thu, 19 Mar 2026 17:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8RCdVqF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7591A38D6B9
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 17:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942154; cv=none; b=FXaEyQu9ICUcyVvi3ZaT+NN5L01+hrQcM1ZKapzJTVZFH5ctpe3o0s2pXu8dHfdiOdfx5q+ITHWFi5Rno8sYr8tUbckLvqQji1/f5y6lo2UL9oe+JK7aH3F6/pVRBmx/SRP5TvU2gsTW5z5Yo8R8qQ2BNLkjt+Dud2XaZto1JzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942154; c=relaxed/simple;
	bh=Onzzq7oy1lftP7IkujFnMbCJMSMTPD9HBxhnZj7Sc5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbKLc8JFRmSTTzavmXbmlPz+pzDdiUfnmPibjJi3PM58jRtBQklgkoo7d4Wos4tiLbDQJd+2uxT3fNi95d4xhCyNERK20d9oqw2gr5TLqZ3QPbrgHDS90Tj7mA52IU3o8fMUkg50ddhiSoEKdIC4XuFLp+6FRpInBNhUrNeL3Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8RCdVqF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FBAC2BCB1
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 17:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773942154;
	bh=Onzzq7oy1lftP7IkujFnMbCJMSMTPD9HBxhnZj7Sc5E=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=k8RCdVqFhBOGyF7c4rIFijTXollYxB5aVkzCF4SFduX+XgyRXWggF8Bz9x+59Y7BI
	 ZuClGhKkrLEJP5mv/IZ/vgufDxz4SNe22m+8sbkSL/Z5aBaC5ItNnkM/b4owV/L7sp
	 3TdihfzVecDaA+vEDojIh0LZTk0eKfFDj/kqBcFneH2Ib/YpPOJmzhuE5jJoQMJ8br
	 PVmSwTWjC/4pmykPZoH5sKlNiaWkJIhD9asubARIM0pq/7IVo4wfkWvHsiw0d/WSN5
	 fsquXVjG5cEUu5ArLVWx6DkeNSRMcFpUBTcczaN7+iXxjSP3fHYiKNMoKo4H1coTzE
	 pMi3kbgYm9EBA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38b3ee785a5so10603271fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 10:42:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/PeuQZUuLuGiZ9wko3y6dRJlxdruyIAeMnpMI6v4qxBb0TH0D1RmBhzNHwfswF6JCCEKN5qjisRu5@vger.kernel.org
X-Gm-Message-State: AOJu0YxMLICCInbCj5an6rOfOZocA505VBXcUHlvPCiNQ3CYQnQyEfpo
	nnObqXCtlXo/ukbqcPlLjXdFItZBYusgVK3knvsFsN0bUos7uy1ufvEIIc3PVBcJ4UELWafKXjY
	MioHPNOb7BJLobWvQr9Y1cQZYsyZB+lw=
X-Received: by 2002:a2e:a9a6:0:b0:38b:f0f0:e39b with SMTP id
 38308e7fff4ca-38bf9dcfffamr543791fa.10.1773942152347; Thu, 19 Mar 2026
 10:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v5-0-092834a882b1@mmpsystems.pl> <20260319-rc2-boot-hang-v5-1-092834a882b1@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v5-1-092834a882b1@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 01:42:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
X-Gm-Features: AaiRm51RH75lnRJn_EBMohEogUERC_EJc127jS4qWxRj9yZmVAMa-2MWjYOn-TI
Message-ID: <CAGb2v64BTnUO-iR9G4b1PsX6TB4+Q_a0Tm+sj1dhFJ6a06iJkw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] pinctrl: sunxi: pass down flags to pinctrl routines
To: michal.piekos@mmpsystems.pl
Cc: Linus Walleij <linusw@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev,arm.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-33846-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,mmpsystems.pl:email]
X-Rspamd-Queue-Id: 8CB322D05A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 1:19=E2=80=AFAM <michal.piekos@mmpsystems.pl> wrote=
:
>
> From: Andre Przywara <andre.przywara@arm.com>
>
> Recent changes in the Allwinner pinctrl/GPIO IP made us add some quirks,
> which the new SoCs (A523 family) need to use. We now have a comfortable
> "flags" field on the per-SoC setup side, to tag those quirks we need, but
> were translating those flag bits into specific fields for runtime use, in
> the init routine.
> Now the newest Allwinner GPIO IP adds even more quirks and exceptions,
> some of a boolean nature.
> To avoid inventing various new boolean flags for the runtime struct
> sunxi_pinctrl, let's just directly pass on the flags variable used by the
> setup code, so runtime can check for those various quirk bits directly.
>
> Rename the "variant" member to "flags", and directly copy the value from
> the setup code into there. Move the variant masking from the init
> routine to the functions which actually use the "variant" value.
>
> This mostly paves the way for the new A733 IP generation, which needs
> more quirks to be checked at runtime.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Please carry tags forward if the patch is unchanged.

