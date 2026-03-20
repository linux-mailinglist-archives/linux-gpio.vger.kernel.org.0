Return-Path: <linux-gpio+bounces-33923-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB2OBkpNvWlr8gIAu9opvQ
	(envelope-from <linux-gpio+bounces-33923-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:36:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7872DB0DB
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 14:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ED3630838C1
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Mar 2026 13:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B9AB286889;
	Fri, 20 Mar 2026 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2DM6v6L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED8286881
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013752; cv=none; b=ijgDCrXVoQbUfS3fr5bFgMpBsZHRks7kvrPzcDjV85XkRXiXAuqtCpg1r5CTjDW52URTooE5PWNuKNrv5BVSEtynJNb+Cm7F17aJSqPud9IqJbRZt+zX/vIV3r11TKRXghp1Gk4yqtd6Cl07YZuW6uGdkM6koYAwHpn5hYQCySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013752; c=relaxed/simple;
	bh=x+Q+mpwKpWdfkCJjdjeyoSi32p/Cj9EkuzDU7dEgYwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sf7LJJdKmFtZ4MdY7EvLqvPCkY0zkX+Ea03KvSTz/eZPt/LARVtOvD4hGqGiiqIIksleBMuGkpsWx2J4mgCuGIIK2+x7LxW1hr6WgYKE1bKeNtnaLb9vj9GmShJrWIBxzsX+HNawAAfgMLjoy+VsoIJrsJgkrrZ4kAwcIT6ZB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2DM6v6L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6E1C2BCC4
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013752;
	bh=x+Q+mpwKpWdfkCJjdjeyoSi32p/Cj9EkuzDU7dEgYwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N2DM6v6LQAGOwaxB/tWrgoPPj4Vt5j9wHVhto2/PrIBxYnksi6O5jeSWw5Q5cOlpu
	 1/nEOk7uY4TZ0NoIVRa5Wp1gAyGfP7go6uhVPrHo4rjBgGdVinqw808/0blFBZ2CRk
	 8XzrEVuoSS0sVXhOsQNJxlqaM7y+SHjdvgrq962c/a9AGw4fiCTyXbl4Eb2qS1sGSt
	 AV8mMvwjJUGgwT0P6QDI9gY4B5dikgqWb+lqLy1AnLSFfY+5KKb2fwn9eDAAuW4ChI
	 B3wMv8L+5g+ksGxHGuvW9me2EQlmOIeLWNNlNTxeg/6nRuk4HxGs4dynEoCYr4ImYi
	 PHMKquc88ztzg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986e0553bdso20459937b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQJttpLn7eDD0EDtFbHOVzryeq+9Fp+HobqegxG1bAr+UcEv1MrcA5bKr23ZnleZOKTpgy944svXRG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQOfWm/Jlgp7iTl3EvRfvVtjLJo8Yd2MPfSjkA/wFWj6OKJcmu
	4YjTg7L4ibqDOK7WlWGvvJR5Wru12zug9OHMdirdLNA7/S+a097cSCsqEzS74Fr59KtwxsVy2la
	LbP6qdafe+Hew1hCQTx5jGQcYyqW3jhw=
X-Received: by 2002:a05:690c:6d81:b0:794:6fa2:a037 with SMTP id
 00721157ae682-79a90a92a96mr28577437b3.8.1774013751143; Fri, 20 Mar 2026
 06:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:35:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=5HyZ-Z18iJPzrQY70dYq==z-nofx+O=wfTxYrfynZWQ@mail.gmail.com>
X-Gm-Features: AaiRm51wCIQ4YFUApl9fDukQ-YQ0efzADwWtEvQ8dtpStZjJJL077i4VFyJ5keU
Message-ID: <CAD++jL=5HyZ-Z18iJPzrQY70dYq==z-nofx+O=wfTxYrfynZWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-33923-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD7872DB0DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 3:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H SoC
> allows configuring several electrical characteristics through the DRCTLm
> (I/O Buffer Function Switching) registers. These registers control bias
> configuration, Schmitt trigger input, output slew rate, and drive
> strength.
>
> Implement pinconf_ops to allow reading and updating these properties
> through the generic pin configuration framework. The implementation
> supports bias-disable, bias-pull-up, bias-pull-down,
> input-schmitt-enable, slew-rate, and drive-strength-microamp.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

