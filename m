Return-Path: <linux-gpio+bounces-34934-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAvUC6Rp12moNwgAu9opvQ
	(envelope-from <linux-gpio+bounces-34934-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:56:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D273C8134
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Apr 2026 10:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DA4A3008339
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Apr 2026 08:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D9338F945;
	Thu,  9 Apr 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+I0iEqe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A704D39183A
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724959; cv=none; b=FMAihDWt5pE2ZnXNrCGqcsebYc2Gfoj5wz2a0REKSI1/cTLrP4mr5VEbYRK1zkFPS+b8wUyKma5J8ngwiKyi3IGkwJqbMkF8PFTEe1MZp9J79ybRN8aCfZgDnbwS9a49fOPkQcarEyzNFPCDzSK++kXgqkNiTzVq00hUi42j2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724959; c=relaxed/simple;
	bh=NF3CUyvqEslN3aObPGJxyj9WcwsImXGdgGhPpcpwHTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KabGXZ1SFs0eBOjC9+WwuVSmBKtSeAwxStqffBf9trRYEPQJKaY9cVz4TPEex46lyLKtRuFV1AB0foFgD/I1XX8TxivcbDLC5ZD4MEmEgsqNqiLmnLmmEdBnrAkl1G4cfjUxsbo3rDdbTdalrd1b04eYl2AWqgHVPQhg3NtQTKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+I0iEqe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5C3C2BCB1
	for <linux-gpio@vger.kernel.org>; Thu,  9 Apr 2026 08:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775724958;
	bh=NF3CUyvqEslN3aObPGJxyj9WcwsImXGdgGhPpcpwHTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r+I0iEqefF3AP0tMNA2d+KcJ64kOSTnPrpggsB+Yb1LDIp1Cw5n9EIYVWFBZER3Mw
	 kRV8jQ6aefjOT4hMAS8c/qSK/TEBGNgcNAFYO5I46T6pfAI6am6AN3ti+5yigGFV6i
	 /KFZU3GCCIivKlJQHSBD5wqHdxP2m59vwGZ6s+R0DjNBG0kI9ZXpeNJNzJL5coXvB4
	 8pFPq4os3cSwP9nTIBIk2ZCVh28IW1Djf+EOXE1mDiqxphQmmBrMVPhsJTbH/E23m2
	 olrotCjqKixmWwdNvad4FqdFqh3cH34s1Olasu08+Wn7w99TdOKO8WCuym5+tQCXv5
	 m4ZY2CZfH/Pbg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7a17bc5745eso5966837b3.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Apr 2026 01:55:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW858d4TB/MZdA5c366krZplABFMus2SyAvvcXK7oIPCU5yMnBWwQj/JEaAdxbhZWThxrh6uJIzjPfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRcZeMqgoCHdYlMiRZ68BZxu8ZrtTOQSqshUPaun09gTY5cz8V
	monSqTufm8zsf6FAS/rJdym62KrW5IPvvLoCS887BrtTc1M2O9i+swybbkfFJ1UJXp5U1Z0LZCq
	tyfJldOgFeZemt7gzyHUYFZO+q9AJZVU=
X-Received: by 2002:a05:690c:81:b0:798:cf16:1c6e with SMTP id
 00721157ae682-7a4d3bd7d7amr243494517b3.21.1775724958284; Thu, 09 Apr 2026
 01:55:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
In-Reply-To: <20260406-eliza_pinctrl-v1-1-52fbf0ebc56c@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 9 Apr 2026 10:55:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLkLQMLOhhZ54ifV0YdXdGp1yg5ReF2gHQUBsEiDF6M5=g@mail.gmail.com>
X-Gm-Features: AQROBzBjsuKMpK23woKhjFABPMxI28LWUeRVpLvhrEIc36GbEsp1oRKa401QDyI
Message-ID: <CAD++jLkLQMLOhhZ54ifV0YdXdGp1yg5ReF2gHQUBsEiDF6M5=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Remove unused macro definitions
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34934-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B9D273C8134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 5, 2026 at 8:34=E2=80=AFPM Maulik Shah <maulik.shah@oss.qualcom=
m.com> wrote:

> Remove SDC_QDSD_PINGROUP, QUP_I3C and UFS_RESET macros as on some
> platforms they are unused.
>
> No functional impact.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

This does not apply to my pinctrl tree.

Since it's just cleanup, please hold this off until v7.1-rc1, then rebase
and resend it and I will apply it.

Yours,
Linus Walleij

