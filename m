Return-Path: <linux-gpio+bounces-38829-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6zwKGJA7OmrI4QcAu9opvQ
	(envelope-from <linux-gpio+bounces-38829-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 09:53:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24C6B503D
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 09:53:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=R4PNThbm;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38829-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38829-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C38713012278
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jun 2026 07:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 843B53C584B;
	Tue, 23 Jun 2026 07:52:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E2359A81
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 07:52:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201170; cv=none; b=r7lX9vZRZJq9VoQo340KB8h8YVXWL7uL6XgzIsyVj9Xrjgje9j6/w0NexPlMM0by231E8GoYrar3BRgFgJqoW23dytU/JhwPY5hzNjXI6qBhWB3F3nR5rl55lndJHsaaiIaCJ6okNOev/F8wf38+dS1OOnQtgdjgzw4jbs1sHrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201170; c=relaxed/simple;
	bh=AfmCVy5Txrt3CeAZvYzW7mAjRq+/7/ecn7bO87qZmTk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VW4zu47p0ve8Wp5HgvXtGyXc2iTOu+nLfDm+nNvORSzcBCHg0ULDSh7mc2BaUHMJJmvBiomxcAZFLmSFio5osw2V0YWqb5dQGZMG4y6VxEwPde5dwSX7/SFyOH47U87ct+uAK8B9lXZ422WwcYWWbg6N213g7HUUIZcR6sk5vYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4PNThbm; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E2F1F00A3E
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782201169;
	bh=En92Xu5VLi1svHldSuzAI88prm+hCaPJPFR0YvxVC3E=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=R4PNThbmNppeCXkKfQ4G4iSn78iVwtE8eaGB2P62ksTdJgJNB1cRBNFTAX9AV2yI0
	 LOrZVeB2dFnEVQuwNWyHa6kYMDsDujBbnVUoplwZlWjapv+hKngWNWEzpTsPAx9ub7
	 thO/RVcGuUbK2E+d6WOuwTDUY20RquTCs9KZOQo6YdZP1tr489NPKpQ5LtwLLaykb4
	 LQ7KVT9NtnS3XtMI6uiNOm/Oluv5oMx/lMBo1yfmxfZ52MDsh9FCKvQOCjoQov1OMl
	 yMK7xPgcKoS81m4gik7VfR6nYx+mpOWf6MDIaom5ErKw3oZxxMALq4HC5G184+0F9z
	 GE2vrELuueXKw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ad5e719157so2668655e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 00:52:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YzNrKfXttP/HYa5N51j0W0CbAI+DFIUz86eXGwqZG39mhFM6l/N
	R0thfCbDl3Przsxw9lq0seTWAy3ndUCPoha1C6gR9YN1ycyrgs45cUQQ03BMW0cCiSDU0FFqx0P
	iSZiaRMEj273SwDCblrWR8M+ut0KRHswGBDjfE7711Q==
X-Received: by 2002:ac2:4e0a:0:b0:5aa:6d0f:d765 with SMTP id
 2adb3069b0e04-5ad576e95b6mr4857251e87.20.1782201167935; Tue, 23 Jun 2026
 00:52:47 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 03:52:46 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 03:52:46 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260622153137.69065-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622153137.69065-1-pengpeng@iscas.ac.cn>
Date: Tue, 23 Jun 2026 03:52:46 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md4zrvAHxAy8e4scCQBtHrjDVYNiXO0uGaFxQk3gys4dw@mail.gmail.com>
X-Gm-Features: AVVi8Cf3fubtqg3XStMKPJDafJK8IM_c6i80RwcRlmbfv7nhnE48j-5Lxj3OFvU
Message-ID: <CAMRc=Md4zrvAHxAy8e4scCQBtHrjDVYNiXO0uGaFxQk3gys4dw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mvebu: fail probe if gpiochip registration fails
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38829-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,iscas.ac.cn:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B24C6B503D

On Mon, 22 Jun 2026 17:31:37 +0200, Pengpeng Hou <pengpeng@iscas.ac.cn> said:
> mvebu_gpio_probe() registers the GPIO chip with devm_gpiochip_add_data()
> but ignores the return value.  If registration fails, probe continues and
> leaves later code operating on a GPIO chip that was never published to
> gpiolib.
>
> Return the registration error so the device fails probe cleanly.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Can you add the Fixes tag please?

Bart

