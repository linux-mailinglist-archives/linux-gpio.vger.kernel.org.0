Return-Path: <linux-gpio+bounces-32123-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uK9rNr5wnWmAQAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32123-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:34:54 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14241184AE2
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 10:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B7E8306804F
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B26A036C0B7;
	Tue, 24 Feb 2026 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsHy57iB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7503436BCF2
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925384; cv=none; b=B7qr4/M7yKKPoyxeTAdN0IyKPtpiGnx+TCb+u1LKzDZxECr7T41Puts3rrJi6WcSGOr2JFndWKD2dEMkhFxTrxwhxd7x3zAJmW0k/SE2+T0kfjM0pjw0L1U8qe1oQzkYxyzUAP8DJBxOm72at/VBasBewE5YSNqM0UcYEGkNFJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925384; c=relaxed/simple;
	bh=h6KKRUfDW566ul4h6cXZgCRbTIiUl8O0y3KUv9cSNeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAy6N6o4IOQzrvOfkp/h2ni/WE+C8qlUThcR89Km8fYd6TodcCkAehqlgpyIL4gtvYp19FyTYOl4lTHYyhdgM9JG/VGpte8+rukbgCkhAclhawVOos6uyAGQdJjuRqO4oVkS8VXgVUsOoa1txQ4mcd6gz8YWjUfRiC3X+1lJZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsHy57iB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC00C2BCB1
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925384;
	bh=h6KKRUfDW566ul4h6cXZgCRbTIiUl8O0y3KUv9cSNeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LsHy57iBMpo013UlQtALDRRVdykGnh1kRilOVuXxeXD9MLhQuHhBaJ/Yl2mE5695V
	 I1QFvxxqZIbMJyBczZ5jQNNCL0aOM2Onl8kZtj+91SNAqsa6iD5ESTex4MJ39UbmTc
	 yD6xDQIiFJ+fd0g52I/VdLQf6zQ+urTVv6iGiy8e6QoMhPRrtsSG4K3T8GZFjc7KDf
	 +dVmv2asnE4ONHSwrMUG3Wh1+uVk1wE5Zyk9Ni5cYUIfe9LswbU05vACKja9jDX9Tn
	 klpkqkGFSFFdDiKuK6iRkXPlwPqoPhXe2PEMeBOreN8pOvo7MHDeIGR3lN2PYGR+HN
	 V3gHZ54sz4wdQ==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-794719afcd4so54182337b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 01:29:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1LYAZ80Yh7w7PcdFLcAjhlYQAGUpkspLwaa43epTP3aqpjl8VTKzo1WSgnpVzq1iPtezX1ei/cfxV@vger.kernel.org
X-Gm-Message-State: AOJu0YzG/UDPMSXWQc7/pv/2dxiLuznZonswS4NZgzxkQIWpXBv9mbtL
	zSnq/WmzG5pSXVWOSuJ9tZPsy1sxFKDO9R61SNXripD2FEzwB63a0a/QMNjbty2YIbH918v5vot
	HEDlLtwcAvwn4ZHssRhSsnKxHcXJFXQU=
X-Received: by 2002:a05:690c:387:b0:797:d386:44e3 with SMTP id
 00721157ae682-7982d4d880amr98624577b3.25.1771925383461; Tue, 24 Feb 2026
 01:29:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-cs42-v1-1-431b01a6f537@gmail.com>
In-Reply-To: <20260223-cs42-v1-1-431b01a6f537@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 10:29:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Niqy2u6stTbgDUgv5byafS=KCV4evc8vkLbZtdXKRKw@mail.gmail.com>
X-Gm-Features: AaiRm528PqLfsivU1lCwG1PzrRQA8pS2qMyI7VmlAhF7-qiOU1-s43Rny_INO5w
Message-ID: <CAD++jL=Niqy2u6stTbgDUgv5byafS=KCV4evc8vkLbZtdXKRKw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cirrus: cs42l43: Fix double-put in cs42l43_pin_probe()
To: Felix Gu <ustc.gu@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Haotian Zhang <vulab@iscas.ac.cn>, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32123-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 14241184AE2
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 10:39=E2=80=AFAM Felix Gu <ustc.gu@gmail.com> wrote=
:

> devm_add_action_or_reset() already invokes the action on failure,
> so the explicit put causes a double-put.
>
> Fixes: 9b07cdf86a0b ("pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_pro=
be()")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied for fixes!

Yours,
Linus Walleij

