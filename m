Return-Path: <linux-gpio+bounces-32108-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE9OKYxmnWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32108-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:51:24 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D7183FEA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:51:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A4C2303088B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75429368299;
	Tue, 24 Feb 2026 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgQ3Eo0x"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37122368285
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923077; cv=none; b=C1YkYySIWQMEMYseRti8q67tV4CccK5yWt7d5Gt8AAhR0Ucdb0E8lYzoVX4EiS0j+fMf532m2boT+PAEDPOqScOWP70u9JAXfSgRSr2zd3JbPX7pz6NsDh4rx/iEusO5CE1HB4OKbMVgh8JR/sKYrRfxwf7t8OBZu0WT8NtO7p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923077; c=relaxed/simple;
	bh=SlyKi3PltYg0C6T9br6qnLTOjZ1bmmAnmMrTY2CyUdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I7T71ETL6IL/pFw494fYeMDEe2+PCGdTc3NlAkXSzM+FC/6zjMkDVjPe60JbeWRO2Sz+xlwvEjULhz42BkbEidurr0CE8cKV4xuXpCvhN/6Cd+oTpY3/d/ufzwIsy4xSmQU4jij5tgP6ixx1Rn2kM5lSC6zmXt55VN1CEPQWsu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgQ3Eo0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAD8C19423
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923076;
	bh=SlyKi3PltYg0C6T9br6qnLTOjZ1bmmAnmMrTY2CyUdc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FgQ3Eo0x7HDW87WGBcCrmSqePtSYieHO4PPs7tysnDBy/MyQsQ9lgVHyxAy0Gwu+U
	 XRYwrguJU8QVtwq6Bqjw5wtnxqJ0Es46bfbZrz9BCBVoAVh9/Ya3GJjBk6+Ssd5Sdy
	 h0qxBRmXfpb0CB37PgLfj2P70JJbrtfKuTHh4imW8RK2M9z3iucMemCRAZz9c319bM
	 klCqRIcmcDammCxvAdR9RI4i9iWzs0k2GVmfjDT9r+cb5U9KLhRvA4xtB4sSik0VDi
	 bA0bktZcwxfyfEtXiH+TEOm7uF7EJaMMomtxWxcJXzfuR76YX2wvKYKoWepqAx1VxW
	 jMgp9zmeLWaYg==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7984d30f2a9so16228837b3.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:51:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXHxlyvuUu6YxseGS5GupG9tyz8c0Qe3oMYoO0AUXySNvKdG1e4inCV+m582b40OnuozvxA/edPzZf2@vger.kernel.org
X-Gm-Message-State: AOJu0YxVpJ46AazE+RUAi/awI8B95KDH6iNIN1cwNjXP0BnRwEuzEE0B
	+AeKQ/j1syV/zNh1nDC8ms5Yj4+eLpGtUEY+VBz9mZvp3N5+VrNYo1lAjUum4LHL97ZsX8Hgk9o
	/JzmYxAXcZ/6CEmeKodqDVzupoE3C5HI=
X-Received: by 2002:a05:690c:4484:b0:798:58be:324d with SMTP id
 00721157ae682-79858be36femr21901107b3.55.1771923076301; Tue, 24 Feb 2026
 00:51:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260214-pinconf-v1-1-e515d35a153b@gmail.com>
In-Reply-To: <20260214-pinconf-v1-1-e515d35a153b@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:51:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJNp03v==CHJpjBgRsphqwezgY2UsSRK+V6qWPs=mHEQ@mail.gmail.com>
X-Gm-Features: AaiRm505-ICjQiiLT76VoLapnLf2OtT2PLeI3PXdHHghNlCHVk3Dle4Nk1fYkKk
Message-ID: <CAD++jLkJNp03v==CHJpjBgRsphqwezgY2UsSRK+V6qWPs=mHEQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinconf-generic: Fix memory leak in pinconf_generic_parse_dt_config()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Antonio Borneo <antonio.borneo@foss.st.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32108-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C22D7183FEA
X-Rspamd-Action: no action

On Sat, Feb 14, 2026 at 4:14=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> In pinconf_generic_parse_dt_config(), if parse_dt_cfg() fails, it returns
> directly. This bypasses the cleanup logic and results in a memory leak of
> the cfg buffer.
>
> Fix this by jumping to the out label on failure, ensuring kfree(cfg) is
> called before returning.
>
> Fixes: 90a18c512884 ("pinctrl: pinconf-generic: Handle string values for =
generic properties")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied for fixes.

Yours,
Linus Walleij

