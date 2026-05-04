Return-Path: <linux-gpio+bounces-36078-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LGQK1Ww+GkdzAIAu9opvQ
	(envelope-from <linux-gpio+bounces-36078-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:42:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FA84BFE9B
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 16:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3A953033D0A
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 14:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00AA33DF00A;
	Mon,  4 May 2026 14:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="au9ugCWG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006E3DF011
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905687; cv=none; b=ukQGNkG3m5SSh/DWTIuXLP4TSa8MWWzIkV5s0u3fa36+DQ1fCN+wqjsHyNUj2a0hDz8aDeI2fEH/GweyNzcSpC2NO5rXAJ/cefITRziTi+W2ZNpUcKfSJYLD3iZZKLqXiI9ozMdG24fLQ8BAxhajfZUYB7DzhB83Bh6pysDQI3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905687; c=relaxed/simple;
	bh=UMk6gznEFWFtiMdbbQFFlZkrxCOoLWZWOTTFHy55KrM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bN8roMaE1JLaUqDvtoMOoCg9R0ci/7feY7Cesr5Je0MC45/vat6/murERLA/Vz8IHwQ9cSKUsZkvbsi92ud+v0x00G/jzcueG/uqVs2VR183SvGSdzY+UDx2XcFYdJuqawPQOSr3DfX/yMsl3IM8rQJcML0228ZV6mU38FOd/TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=au9ugCWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D35C2BCF6
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777905686;
	bh=UMk6gznEFWFtiMdbbQFFlZkrxCOoLWZWOTTFHy55KrM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=au9ugCWGP+Euffa/xDAni5La6kDaMHD3MzPLmvsA2cSuNuAf+o4NhIyD64zHq2L5F
	 h+PI/ovXIq2emAz/ynrnA/FBeHk5HmlCOtoWh7Qp0QfsYTCVv45/+APt/SmAMFd88V
	 lS3599qrrwPYRahD1ql0fBpfwcPX8tYnsiYsEWjeQDu3xFf2rDeqGVaZ3y7a36gMeM
	 M5blinNaBcqQQbjBBIVHx/Nn0vqmo306hGqCWut6FxfDktG2qRRH1YXFvWjaWqUrqe
	 yeKhOddkTzTi9FYbT7zDD/FtyLDPihheswgOQYSPctDlIAQ49afFArNNg2tIrrhHHT
	 c4fNrPaRBjI0g==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38e7d983f91so44312981fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 07:41:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/MkXdehSP9GSIagD9DzTpi2kMInZ6u9sNs2rAqKM62I8WJ6bVLcNL0lhh2PmGwNIGWOK+9Wxv09gST@vger.kernel.org
X-Gm-Message-State: AOJu0YwBBFfJqCV9aP02LJls7RX05XswzpOSFT+1RImObQ0B/nlILyzv
	YNd7RFJpC/S605bKBdx7ToLheRzzc1UXUKGmzNKa1+b7tjHr8mI0EJ/O4fcP57lIbkm8IqQOFIR
	VyGwL1QT93hJVNxITb6S+kWILkhZLF7qtpkxpyUczUw==
X-Received: by 2002:a2e:be0d:0:b0:38e:cab9:3647 with SMTP id
 38308e7fff4ca-3937842a16bmr37456631fa.13.1777905685320; Mon, 04 May 2026
 07:41:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:41:23 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 May 2026 14:41:23 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260504131148.3622697-3-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-3-khristineandreea.barbulescu@oss.nxp.com>
Date: Mon, 4 May 2026 14:41:23 +0000
X-Gmail-Original-Message-ID: <CAMRc=McqV7-R4b5D8Atj0XXt=BRVBPOod_=RQOyYuJk9vQff2w@mail.gmail.com>
X-Gm-Features: AVHnY4IwqOf1wd7u01HaUABcS9MKFWPCAiciyd-hECZ2A9Dac8kob5RJY_KsY2Q
Message-ID: <CAMRc=McqV7-R4b5D8Atj0XXt=BRVBPOod_=RQOyYuJk9vQff2w@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] pinctrl: s32cc: add/fix some comments
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 13FA84BFE9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36078-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com,pengutronix.de,linaro.org,bgdev.pl,kernel.org,gmail.com,suse.com,linuxfoundation.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,mail.gmail.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, 4 May 2026 15:11:43 +0200, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> said:
> Add/fix some comments and print
> statements.
>

Why the line-break?

You're doing more than that: you're creating kerneldoc entries. I'm not sure
it's worth it as these are not exported APIs but - if for some reason you
really need it - it makes sense to mention it in the commit message.

I'd just stick with regular comments, not kerneldocs here.

Bart

