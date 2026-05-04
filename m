Return-Path: <linux-gpio+bounces-36079-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOpaFt+x+GkdzAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36079-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:49:03 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E858D4C00BB
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 728513034A3D
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 14:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A013DA7EC;
	Mon,  4 May 2026 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alX7WODp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F133D75BF
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905716; cv=none; b=ce/MhZfjHBUWKuC3rH/NpsnkY6xD0CVbgW2NLOe8JxLeqaWOS/IdXkSwm8R6VC5qCYMEpKeKxU1FU7Z0uoKdB4ZAsjWNE2UX2jCDqDI/mbEiKKknIyazYNOadlPopQwBxJSyAj79mHte3Lrdxpn0aIPjzSLGkzy1LEIgcN/QD3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905716; c=relaxed/simple;
	bh=z4ClDao26narGkpzxkxbLuuYZwnOiaOwXZxQ6iS/WOA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRGW2jGwI9dF5K01fWLWpytVtIpT0XOn+U5KfMzbyVwSOD+Gp0tEkh2ScSgy6kvQRAiwABuEGrVDH4WV7b4Ajj23quu5iSpURLQI6P9nDKfoI/wZN+NvnFhBQUd3pyi20M6t3Aa4NoQiv2P7a/5ljVnhhEEdgy+WaVzo17L2mSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alX7WODp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22245C4AF0E
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905716;
	bh=z4ClDao26narGkpzxkxbLuuYZwnOiaOwXZxQ6iS/WOA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=alX7WODpN39KoOyojy/Sn2eOaaGm3GLiOMwz2RcB/jqkwxcINgZfKWviHQDstClJ9
	 nUhsuoUZlT7eF42W/+GRFswQCg7f93GWgohx+vV502YLQPkr5XKN++fq6c3H5PPor+
	 i+M6ORB/yu0ulmIH67jb43WD3KIkZZC9xy+8qqa2J5pW/EUvhBb93gE2yn09rc+sBk
	 szM+FgokpOAAOxhc0ik/DsX3mmjP2RwJhPEtbwJtFFcyFjoMdwG8GuytVYY8XNXx2g
	 NP6U6P6IlPhX/2H1B6gwQRoxk9lt+cbC+q0QPpA4OZplk2fNy4ewP6VWOjMaydYCYC
	 LI1oPK9Mrb+uA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e97e73234so40530331fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++5/zWkkuAxrOLp+70jhXc1jqHtFGBXsl/9E4zIz6RwS5r7v5uSJ6SezN+Tjj+3zCkd0A5Cl6AAuqR@vger.kernel.org
X-Gm-Message-State: AOJu0YzRlsCeBkZCKoradckhKo2gDcXKPdIOsHs31ME9alzQAU+6ZsnJ
	SJeLGp6O0QnFu+CgzkFJFY12BYiX/DIMBEuNGEY95Q2s0lS7le5UkVkLzTHeQ7V9oJ+FP49kXbH
	+9KCLVmSrFPq0kSz8z8wjEOjtJbyzXBipSrBqeXksUA==
X-Received: by 2002:a05:651c:b13:b0:38d:e977:5533 with SMTP id
 38308e7fff4ca-393785b95e0mr37146491fa.26.1777905714769; Mon, 04 May 2026
 07:41:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 07:41:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 07:41:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260504131148.3622697-4-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-4-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 4 May 2026 07:41:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfgv-OD0cFZAmMROk40pgpT4xT6wJxnEWvqkVN7wX9CQQ@mail.gmail.com>
X-Gm-Features: AVHnY4KioxtFWoxvVcXY6wMzFf0SRwYI0OQ6liv2xdIp_Qf3oiOkJNSF__25P2o
Message-ID: <CAMRc=Mfgv-OD0cFZAmMROk40pgpT4xT6wJxnEWvqkVN7wX9CQQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] pinctrl: s32cc: remove inline specifiers
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: E858D4C00BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36079-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 4 May 2026 15:11:44 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Remove unnecessary inline specifiers from
> static functions.
>

Again: breaking the line too early.

But the change is fine.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

