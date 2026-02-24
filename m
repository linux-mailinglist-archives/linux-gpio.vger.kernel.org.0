Return-Path: <linux-gpio+bounces-32110-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGvOAFxnnWlgPQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32110-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:54:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28F1840CA
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 09:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B444A30E0252
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 08:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1944136920D;
	Tue, 24 Feb 2026 08:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdZLfJFY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AAB36829D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923146; cv=none; b=Jwwvh8t8xWxbopDOrAQS6CPgTar0xFzdfKAlG4da4B2fHxqTBQ88E9cZ5X7b8St8w8G4jl2yYwLqDMufX3wOgrRxwH/6cigeBBD+UIBfv6cKqQRieTZA9KurhwLsqtrquW3p8MU+QRjZO/LWjhXqRa83HhsoNqFDMYyozOzZuDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923146; c=relaxed/simple;
	bh=ZyS0H8QHSpm79D9MEZf7/yBV87yLDH23GUMf+3RQhgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9SLObLE6vR4FMfglYzryoR/eBTMrc2c7X6Upjwodggjasx+KsdE2bpMrI0kzecXM/RudKwEoX+1TA89rKV/5nBjKEaFnGel7otbYYWHfzqwHMkIpwYEybrlM88MDrts9Co/CfZO0BMiluDxg/BQAZwgX3LWc/UUonqkluslLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdZLfJFY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F80C4AF0C
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923146;
	bh=ZyS0H8QHSpm79D9MEZf7/yBV87yLDH23GUMf+3RQhgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bdZLfJFYe8+5f4w5dXjUq9zEPQylxyYsRi7aQI4Yxc5juIhLOBp520VtFeA83PFJd
	 GVwiB9H4EWldl8WbHU250eVz8ODEGFRMNYw3ewblcpqchUwYmA1q8k3cjpydaXVyDm
	 NRMlWc7PSCLznKCKUKrQzEP37Nm8pTMwxIEiffhvLab5Wq1Ve/rRm1hO+XNvR0NLy0
	 chmQteHW114LSglO1tBEG6GRYYM2Z/vyWAjDvtimBlq1J5xHBpv1a0bt3yGAiEL7nN
	 qjshPEk7p4V9BEel6nsvxOaSZVKi5VOFQFXkpwWOBYSHYVpi+TUXff+LhqfX0wILo3
	 S8Z1JbBSNq0Jw==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7947cf097c1so48402697b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXCvENN8V8PkNt5TdNcYh86wjegIAbe7xlFtH2w9tMAPfm3yKRz1wux7xnEQ/VQFwVn/AYGiXdG5n+i@vger.kernel.org
X-Gm-Message-State: AOJu0YwlcYlg+f/Ept2UIKgaQpm80bHzvmGMSOjzd91pwI7ms+E3LFZH
	XUHrBdogxs4ZyJ8i1kk3kXMqsalB56eWspBWZ7NLXvyb3CepSKUoEKcO/0wpGzdjVTgKwwQDr0r
	jr/vyRTqMNuR1G7j59f9FCbuAJyUK7N8=
X-Received: by 2002:a05:690c:6d12:b0:796:55b1:a141 with SMTP id
 00721157ae682-798291429d7mr103365377b3.55.1771923146101; Tue, 24 Feb 2026
 00:52:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com> <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216085838.71518-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:52:15 +0100
X-Gmail-Original-Message-ID: <CAD++jLnBNSMC2i2JSZaB1bYuJxScjNNB1A46hQbcxoJ1wzP4PQ@mail.gmail.com>
X-Gm-Features: AaiRm535ELoqE6GjQBWumJZZYU3O-QZV3s4JmiiXSufeK5gb-Em4xaITPZHJBsA
Message-ID: <CAD++jLnBNSMC2i2JSZaB1bYuJxScjNNB1A46hQbcxoJ1wzP4PQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cix: sky1: Unexport sky1_pinctrl_pm_ops
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32110-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 6A28F1840CA
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 9:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> File-scope 'sky1_pinctrl_pm_ops' is not used outside of this unit (and
> it should not be!), so unexport it and make it static to silence sparse
> warning:
>
>   pinctrl-sky1.c:525:25: warning: symbol 'sky1_pinctrl_pm_ops' was not de=
clared. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

