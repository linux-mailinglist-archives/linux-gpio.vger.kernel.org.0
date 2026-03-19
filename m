Return-Path: <linux-gpio+bounces-33838-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAe2LEspvGkxtgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33838-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:50:19 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA052CF1F4
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 17:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B08EA328D676
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 16:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430C93ED5DF;
	Thu, 19 Mar 2026 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSEgDYZT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3973DB64A
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938247; cv=none; b=BJLLbt0JMx3Z0m4vDvzO/lh7O2nmOM4BSCssz34mptBtt23kLMFIMs92H9kV+GjJpi2rupdS+1C7VPmO+oeL9L66oiFfUM7gs7yuoNkMjWUxHlmcuz9Ve1CAeSXWjCe2zRPAD/XLBFbJrpqkjRTRLnAiJumSzbVJxbproCwqXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938247; c=relaxed/simple;
	bh=HJUbYvJfq+3IC26kd8KWdP3fbF+kMteQj038PWadu5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfGPJ4wa88l34f0eSAQhMx9eUiJg51rltdTv30ZExMT+Tk2KI0pfDIHx+QiHSSaAQhsss1CzlWCXt8SMI0E+Wq66gwFIKj0z69cB3ZiV9vKuHcazfTAycbwwpuP/M79Y2N2hYtGFTvaeEhrXXarbZlVM4YxxjcETJezRxTJkHc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SSEgDYZT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A3BC2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773938246;
	bh=HJUbYvJfq+3IC26kd8KWdP3fbF+kMteQj038PWadu5g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=SSEgDYZTXSkA8lW378Uz8fMBQR7smwnoyt7OmQUPyW/oxs1s15KIULELkdFunaioD
	 VK9p3dJBguoG3mOkevyG+GsLgd8RvOltH12EC8uRkxk6OYLGMnkOvY+Cg6lQOz+BiT
	 6Ynz8/ailoncLxKjGcLlNuv7l40L5RM7idz5JMh4chIX7VZPfZrI8rN6VkEoGkO2N9
	 Gmg969LFBhNyw1rxUB/xx61ywu5k2vl95i0G4TP0wSS6OODmVI58QzTI33HYzQ0j/Z
	 tBP5Y4lX2NXNPbBe54eBgdhDpzNHvHNonD6ahC6vzEGCtGjNz7SgV90IC20uFCI+1b
	 sMlUY7kP2Cpcg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a32d36396so10002111fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 09:37:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXIAgAeFeSlnT4EtdpdLeIil9ee0uoPxDtCfthxoLC+TE7NxqtpzqCIKt/9Cwy+3YQHBxJnHF964mVP@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2uqxoss1je3qCTeuIJ/RuaZbkOmET7I6c3zrp9AAkEztPS+j
	wKgSTITeSQ+ZTbW0lWI2mHs/CCjV9qZU0DWetueEKDyMLxH22FOrxMI+UMYpWglIMA5norooIf4
	GAs2IAQZ5ZbHPxkIV1w+kibDhk8LfHHs=
X-Received: by 2002:a2e:a60a:0:b0:38a:d2d8:ff5d with SMTP id
 38308e7fff4ca-38be5f88870mr9495851fa.16.1773938245262; Thu, 19 Mar 2026
 09:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319-rc2-boot-hang-v4-0-4372f47cb6b8@mmpsystems.pl> <20260319-rc2-boot-hang-v4-1-4372f47cb6b8@mmpsystems.pl>
In-Reply-To: <20260319-rc2-boot-hang-v4-1-4372f47cb6b8@mmpsystems.pl>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Mar 2026 00:37:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64i7TVKr7m9StcPMLTj=zuyn-GnxrPJO=HfGVEhQp5yBQ@mail.gmail.com>
X-Gm-Features: AaiRm523wOClQT2OuM3ghYiz0iYiL8-8Z_HbZWazzqkJObzfX4ME4RRi3z4vRqo
Message-ID: <CAGb2v64i7TVKr7m9StcPMLTj=zuyn-GnxrPJO=HfGVEhQp5yBQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] pinctrl: sunxi: pass down flags to pinctrl routines
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
	TAGGED_FROM(0.00)[bounces-33838-lists,linux-gpio=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[wens@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email,mmpsystems.pl:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2DA052CF1F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 12:10=E2=80=AFAM <michal.piekos@mmpsystems.pl> wrot=
e:
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

