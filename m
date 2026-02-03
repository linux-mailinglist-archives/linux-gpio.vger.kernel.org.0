Return-Path: <linux-gpio+bounces-31359-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFuNKlY7gWmUEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31359-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:03:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250ED2D1E
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Feb 2026 01:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A11130065D3
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Feb 2026 00:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B94125D0;
	Tue,  3 Feb 2026 00:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvlFrWct"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565D3EBF09
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770077010; cv=none; b=KcJ38aNSg8aD2CRoPD7ZlVgsvqHodPQsqKVu0Edri5ED86C4FQDUgX8nExXSQH+75GcD0uOii9Ou6zlH2CYy1rW5GweZze3RR/qwpc+iz8q5j2WHccoAColpXHSNXPr7v2jWIFMXLPgD/nFDP+PEVs/tIbgWLn/AufVJXEsqK2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770077010; c=relaxed/simple;
	bh=R+XmdlXD3AUYobe1qNUVM3PT1GGIPFJhHK6Jg1bczqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHTNmbRpkbCSgOIvkL8Q39NEJTnmjhWGSB7KRbg8oiwfr8NeFSvXAGZr2A6fDAltI4Hlr6B6DpR6qchtMtOeCJxEdyadU2gYyF90yem2NzaDU84PJGBK52DayEiXYEsgRrCWBwODvS/jU2XqJ6/BE77sIGGJwm2VersGAeKLuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvlFrWct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC54C116C6
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 00:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770077009;
	bh=R+XmdlXD3AUYobe1qNUVM3PT1GGIPFJhHK6Jg1bczqg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TvlFrWct8trC69aCAn48IilLeYFRAr8q+1w0SnzLXdZCe9iPsaPswGjfG5JmG+LjX
	 27G/hM7UvF2BYALA1ePcSRvGDzfSwHnNSGIxiEjkLlemZbYikTta5kmA7wD1xvLE0O
	 MWVIekdLEoORQWDAXceDBot1j5rhtDwFrYE2HHgl4HAvCBev0/3kxFI7YgZLjBwU7V
	 WzkTXLro32aKOfMI11YlosAMACcgoIX/8grARTVNXR3sZCtjUJPW900ZzAwxb1d6/W
	 JRdzzA8XL7xOW/l+J8JNd1RQx7PslXYBWhCdF0TI5qGE5Mbb8PeZNqIyu2wsg7sEy8
	 RC2BpVGrrY76A==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-649605d3664so5683784d50.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Feb 2026 16:03:29 -0800 (PST)
X-Gm-Message-State: AOJu0YwiK+N71OiKJhM9Di6Pf2Fc6ysRq3aziceXkHodRh79Aouau4sS
	9n4/Bf4TlceH+rtNHF8l8h4ZwSOCfxyt6l03Th/bnxsaDTEtwtTBtauJtZ8lgIIJfdDS0EhodpN
	DnMztwjBKu9cfmpSB4b9sBeynhqyxTpQ=
X-Received: by 2002:a05:690e:1348:b0:649:ad8f:90c1 with SMTP id
 956f58d0204a3-649ad8f92f5mr9436462d50.45.1770077009043; Mon, 02 Feb 2026
 16:03:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-stoop-gleeful-29f2c525bd48@spud>
In-Reply-To: <20260130-stoop-gleeful-29f2c525bd48@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:03:18 +0100
X-Gmail-Original-Message-ID: <CAD++jLnQCnto+bJKOEP-rz_Fq3aYBNT52Dsr68S4a6MaQRhOtw@mail.gmail.com>
X-Gm-Features: AZwV_Qi4bZ8zo5qWHVsuAkQ52EJDMgpcilTSbv2eGiNse9zlBUYFNaT8pDSZT7o
Message-ID: <CAD++jLnQCnto+bJKOEP-rz_Fq3aYBNT52Dsr68S4a6MaQRhOtw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix kismet issues with GENERIC_PINCTRL
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-31359-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,microchip.com:email]
X-Rspamd-Queue-Id: 4250ED2D1E
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 12:55=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> lkp reported that GENERIC_PINCTRL can be select when its dependencies
> are not. Swap the "depends on" out for "select", as is used in other
> parts of the pinctrl core that are expected to be selected by drivers.
>
> Fixes: 43722575e5cd ("pinctrl: add generic functions + pins mapper")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601271725.gqlQ8Jl7-lkp@i=
ntel.com/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Patch applied!

Yours,
Linus Walleij

