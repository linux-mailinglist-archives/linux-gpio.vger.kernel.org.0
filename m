Return-Path: <linux-gpio+bounces-33493-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB9tNe/Qt2n0VgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33493-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:44:15 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4770297444
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42BAF3024437
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CC5338E13E;
	Mon, 16 Mar 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvQ9/GKc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5DF38CFFB
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654067; cv=none; b=EAEX3Xp7NkLkUCBXF49mgyf2c6zvyDNT6hMDOU6aWvxldCyfQk1A50rHyKA0+Cowg5QZlqso9Bqv9Qevd4PlbFEmDn2mfMVuOpPDYYEPWvdUYnct9DiGladiktQ03B1nx4MG3sH9vsPA18/QfsM2cnpJN7Wu4QzH/8wQdR0vhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654067; c=relaxed/simple;
	bh=Z8msOfxeowllRcJq32bZpSujfByu+DcMa2B+qOK1z6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnEq9fsnOAIE26XZMVOFeVyKW9ZIBGY1GG09BGWfP3X+TkPUl2rAUZWVqAYdUu7cXh2njhm7aA4WJvvksMjgXplAzL1kw88mxa+ezJ5d7B4Z05pqdu+KVoi3tfhGxHtt6rT2q81TkHeorivpoRBEw+RZeudbKkVh/eFCWiM+9as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvQ9/GKc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5D7C2BCAF
	for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773654066;
	bh=Z8msOfxeowllRcJq32bZpSujfByu+DcMa2B+qOK1z6c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FvQ9/GKcDqmGgAAoj077c1EfOGahXoK21ZWGDM8QElN4LpnNTYOL/79aWdo1ocCNY
	 O4q0TAWCYbxe5zd/TFjruAxbPxv8bqde+79DWLjmz1WA1/+TJK/F5bjhtNKyn+GOiM
	 h6Gw9962LjAHSeqpxD9KGWF1iYJHowE4y6ndlSbKv8stNc57gaEeOG7mgqIKuD9cnB
	 J4Ws5u2lcwhh6cTFi/yd0APiFFeGeyefn33EZ4B9AXQzfVvqRb6zm5gWY8sW6C+Ebt
	 zmH0FW7rEWg4agRa8YZEVD8wQX2AFSjZ1s6zaFay3csxXCPFbo8nYoebmLH8zKzFwh
	 wM9Wkp/CH9UYQ==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7985ce90542so39792287b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2026 02:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWL5DINfWKdzS2DdLzQQ0TtZ6Rp6FXP5f+GsSc58/fLvlNXWOD9wvxft22U2pp243izR92DMKErTZE6@vger.kernel.org
X-Gm-Message-State: AOJu0YzQcVtl6x3jyUUo8O5lrlDBcbJhAM+UQ5ZzZDy3fyBcVgZseBrW
	BphafsfyJSR0y0d6T9IqTo2P0si8FfQGlXrQ7RehiRDOydzP2amgpKbl5SLsVs7zLkNuOydSnG8
	BPYeKCZEsz/XtdQj+Y62nrrWPwKt9icQ=
X-Received: by 2002:a05:690c:1c:b0:798:34a:52de with SMTP id
 00721157ae682-79a1c1ddd0fmr123816337b3.51.1773654066057; Mon, 16 Mar 2026
 02:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
In-Reply-To: <20260311-pinctrl-mux-v3-0-236b1c17bf9b@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 10:40:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLkNdc+jc2+c_ageDAbw7ASCDf+6CKTaU4nMt68LhpuB5Q@mail.gmail.com>
X-Gm-Features: AaiRm51CGq6AEM0GTX8yXQmjUc1clr3otpnO-iyM1eZa4K5fUJagwOZsjTiiBjY
Message-ID: <CAD++jLkNdc+jc2+c_ageDAbw7ASCDf+6CKTaU4nMt68LhpuB5Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] pinctrl: Add generic pinctrl for board-level mux chips
To: Frank Li <Frank.Li@nxp.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Haibo Chen <haibo.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33493-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[axentia.se,kernel.org,milecki.pl,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E4770297444
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 8:08=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Add a generic pinctrl binding for board-level pinmux chips that are
> controlled through the multiplexer subsystem.

I really like this version, I had a minor comment on refactoring the
generic helper instead of wrapping it (plus some random ramblings
from my side, sorry). With this fixed I feel I can apply v4.

Yours,
Linus Walleij

