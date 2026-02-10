Return-Path: <linux-gpio+bounces-31557-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEKOMtxbi2mOUAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31557-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:25:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4BD11D1A4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 17:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA33730071C9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 16:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEE2389DF0;
	Tue, 10 Feb 2026 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVhgTGdM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75579389E1A
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 16:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770740696; cv=none; b=g24UJFyjCZpusxuJux+0DqMRI/5rhWIas7TCSwZe6anb8WEeNs1MrL4KH8N+7UqWH4CvjLNr8yb7Gu4Y1FrIzNYZFPcGJXppcl750Dsiv6nODUvZnQWBeQAcByVZOFmxoxVc0lSSM4eSpg51u2pGXpslgh8ilI2jTbKaEBSgrvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770740696; c=relaxed/simple;
	bh=/Mh5W1nog8AvncmOU8xAQYxpIsKMJy89rOS8qySjzl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kEpWN3pfYGnYPmgRa/ww+WiqyPZd904g8NFkOYskqm3+4JGgpMdInySIdInp5+Gxz+c4fC5+c/KYdvXISQJ+SZF/odBOoa3vZvcNmELamPDIKGXTTLf4Hg4x+KJGNkPeE56Rf/CW7e9BTuySne4XonqrkCigDFvmLoZkyzam4m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVhgTGdM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB9AC19425
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770740696;
	bh=/Mh5W1nog8AvncmOU8xAQYxpIsKMJy89rOS8qySjzl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UVhgTGdMS1MFnJfWUdSaTW5/+6vNPykqvoomFFFex36uqS8ZzI/jWOIQNT4T3hBo1
	 8SJFMyuikn9JUZXv5H89QM+D9pSVsm/vNtxUgNHVJlbTkYZbemB5CJxObxOtRDj658
	 x4xFWRzxyT5k/TS4g7TTEpH1jogHqLh9TQ1v0IHhkU2kiZW/sXQb7uTXnn0ouse5WD
	 T30LjV7gg93mQLE4CYP0t1Vcmg40Z52xIbC/TMSeRI/XJMlv+Zd7KZcU9SIKosrCjb
	 Skj29aDBGrEcsCgYobISFg8ZhaGNbul4peP9LatX2mJmZ6E8Tck6lkhDaxP1A/5Ny3
	 adFcOUNvoBW0A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59dcdf60427so1085162e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 08:24:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXBeHSgsKDOCxPCzDPVw/C0AWZvlStLr0og0TnVPlH/6bI3IXHLpJezD0t+mPrrz98v8nrMrujbydlB@vger.kernel.org
X-Gm-Message-State: AOJu0YzLs1FBTUuIJIoi8b3p0guZ969eVk94iu8xZDnsyqkUpxKkhiGb
	N0Q/0JzYkDATTKI0Gm+22o/PnYjZmylYtBEe+pngr2rHCvTY3XqJE801lhIZkhZpAKlQRzQZnfh
	emjye1lTw8W7aD9Ueka9FEFeKYwffEs4IrGj6qG65pg==
X-Received: by 2002:a05:6512:39d2:b0:59d:dea0:34f5 with SMTP id
 2adb3069b0e04-59e45161caamr4762458e87.36.1770740694696; Tue, 10 Feb 2026
 08:24:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210-speling-fix-v1-1-c980b9bf873c@kernel.org>
In-Reply-To: <20260210-speling-fix-v1-1-c980b9bf873c@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 10 Feb 2026 17:24:42 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mc=GgJNzYaGtSyY+fUpDXUAe49Kn9Te_x36i2srMTVN5A@mail.gmail.com>
X-Gm-Features: AZwV_QjmLYUf9qAPrp-DMPXtXL2auzKUUyl6skGwmaLTNv1hBJ8Et6gWMmWjAb0
Message-ID: <CAMRc=Mc=GgJNzYaGtSyY+fUpDXUAe49Kn9Te_x36i2srMTVN5A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Fix spelling problem
To: Linus Walleij <linusw@kernel.org>
Cc: lijiazi <jqqlijiazi@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31557-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5C4BD11D1A4
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 5:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:
>
> The grammar is off. This fixes it.
>
> Fixes: 6e4f3db8dfcf ("pinctrl: just return if no valid maps")
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

