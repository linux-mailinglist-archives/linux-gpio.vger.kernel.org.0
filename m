Return-Path: <linux-gpio+bounces-37582-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPwoDk7uFmruvgcAu9opvQ
	(envelope-from <linux-gpio+bounces-37582-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:14:54 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D91A25E4BCA
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 15:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6D6C3024913
	for <lists+linux-gpio@lfdr.de>; Wed, 27 May 2026 13:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9FC405C3E;
	Wed, 27 May 2026 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhSV9zBr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE2C2F531F
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887681; cv=none; b=WaEyE66V47vi8IkF54q12ds4M3ZUFV/mQ61ia6upnYcm2h9CQpyIySVTZogWQ6QusF+HmTYQ6shBmFDFXFR9OY27FfyS7xXpNaJHkJGDt2ECL7apquJTxU+l4zwQk3GV7byniYJnufHopIk9gnOl98nXpcn7HPuqjxXA+uAmZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887681; c=relaxed/simple;
	bh=1vrgp85owHu1dL6Z8Ia4FmtzmMQ9yTg7BB6WjyWhTFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X/k9r0tcDNAMeOyXylnnxBzdkR2Psx7cYMq+1gUWeoEyq9whcgn3oPXFmAC5JFKj8blL7qmtrn4Ym/hSdDnpb6atU4fIkZCrQD9OoHRFPodhsVGH/lqQ8QGNnZ09Myxe2tbqHrYDmWY7rrEDEKLFj9sqmVve2/nt68qytUBLAEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhSV9zBr; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491EA1F00A3C
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887680;
	bh=1vrgp85owHu1dL6Z8Ia4FmtzmMQ9yTg7BB6WjyWhTFY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PhSV9zBrI2i/TQiLcXQuLrA1lzubGFxrBd1pSvj5AgcPTf9QuAubVOnrJrdV+JpI9
	 gNhykdWzTuXzpLv37i24Sc1uDDaCwTsy1qlCcE1eCV+PVBAwqqcZkeUqiMHtI6DQjy
	 UD4/2kHGO0l9legA5jVR72MkKxcBdBONm034WjbR5WITom4NGyiBQjd7DGTWB2wkc+
	 CM+E5koABCp/j81NC+VBux+/7964o13Fvd793abybgxQK7QMCgq45hjO4d5c+CZaKl
	 qFul8iUg7eZpoQi/3qETUxqn0haULLkzD79NcYgr9HGm5Xnsly3IKu8fTO8XGh9ieA
	 wqaRVmqzPbl7A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a8f9841616so9616031e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 06:14:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eGnBH/toJBHaYErJ4tnPyaaOY+x0JW7i1kqaIOpXs6nC358hruNkU8emaJAj3PYaVd+JaveQgqFC5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr9O/nDneNfI9xU/8y8uBcDwECQRCZBB24ujNVw2fQR/lcnb2z
	oyNFECMO8c6W5mobyuYLx05IbXliIaeeoK3jnawI4yseSCx8Zh6Y+mCGw1OiZ4P8hv1MtH4U41G
	oRffbiZL08f7OybIZE5/Sdh80qxUUqmg=
X-Received: by 2002:a05:6512:3ba9:b0:5aa:fd2:ae35 with SMTP id
 2adb3069b0e04-5aa323c48e5mr6937859e87.44.1779887679035; Wed, 27 May 2026
 06:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511182943.228154-1-kmayur809@gmail.com>
In-Reply-To: <20260511182943.228154-1-kmayur809@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:14:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=fDH4i8citFqq5oJ+8XmjwTQuJwcx9jb=Xk87Lbz1=sw@mail.gmail.com>
X-Gm-Features: AVHnY4JbTRgP44-fCqdEeS1UxF1yE82Ud4fqlzZdp7QmX3gb7_seMluRj3XBoU4
Message-ID: <CAD++jL=fDH4i8citFqq5oJ+8XmjwTQuJwcx9jb=Xk87Lbz1=sw@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: bcm: fix SPDX comment style in header
To: Mayur Kumar <kmayur809@gmail.com>
Cc: kuba@kernel.org, alexander.deucher@amd.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37582-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D91A25E4BCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 11, 2026 at 8:29=E2=80=AFPM Mayur Kumar <kmayur809@gmail.com> w=
rote:

> Header files should use the C-style '/*' block comment for SPDX
> license identifiers. Correct the style in pinctrl-bcm63xx.h
> to satisfy checkpatch requirements.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Patch applied!

Yours,
Linus Walleij

