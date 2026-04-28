Return-Path: <linux-gpio+bounces-35678-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDhkJcyE8GlwUQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35678-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:58:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B4C482062
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 11:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96E9A3059AEC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 09:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4667D3DCD9A;
	Tue, 28 Apr 2026 09:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAcqiV6k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B673B9D80
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777370075; cv=none; b=M9J3QoBng0C/CG3VC5SY+WZFLRyWanvliDWgP/qWZuszFLw6oC9CTq2F2FMcZne1pIhabe8sxykiteflt9bsVf9gxdpGowMhBow5K3uK2O/Pr4LTpftqmz9NMJLs1sHvuh02ZO07MPJlP4NApEaZ/ZyTmhQg5xMUsqwbkmhrb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777370075; c=relaxed/simple;
	bh=K88HCE7LjRSJzIbjOukDD4CgZzpmyANXCRIvyILilCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ET5em/q8AIS7z523GV58yB1YP31oS82T2UcpIEVa8VK+6Q5We3E4xd+OrjdXaP86LA1HFh6jrtDz093jU0zODACLlneZKec9CfgBF2abMezvD0121W1Fej7vJ5pojTgkW9iky+RUGGkLdymrE7tnB/mFdFELadH2D2sylH3r2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAcqiV6k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F46C2BCB9
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777370074;
	bh=K88HCE7LjRSJzIbjOukDD4CgZzpmyANXCRIvyILilCg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DAcqiV6k/pI8Geqmr0bTi37Go5lGCECEfklDTq8aqlErDLRT7bqem25u06Q2TtIaE
	 g1ZzqML7Qx3oRPN7XMWQrUAov/K7pjwX0Wspv199eoFuZRlSag0i/lICiv7Pf+Woxi
	 uf2sBIhx/vrzxyKw0pLHr6pUa0N/EHyeMIHRYEVqROnjRDNnxGKL1TtRk8tqJpLbct
	 /rPZJEoCnQJx4o0wpBfo53CtZnFaR/DafMUy6wFGJOLaYwIQGW/X0Nj3eK+U67SYBI
	 HSOTR49VQFTYYqBt6pytXGUEFY7zhFZx5zizK5UuYaIva6nYIcvSr4BZ6JfSHCMIDk
	 blYTfFLOEIvig==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38eab6cf7d8so106694381fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:54:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9ZJOXkqOboWHUptHn5UJ8bl9vQ5MJlRwQMmfS+fn2hodkWDD4lgQ9QBdy0ZUzM6975Kl93bCerwL3T@vger.kernel.org
X-Gm-Message-State: AOJu0YxPJaMmob8c17XUso3bFLLMdryTn+HoRhem0/9tg+uBJj6dkU4w
	8wDD/JK7//mB+H9FW2NOvL91AU5xCRsEdW/Fu+5H7FQXh4T+M/E+rDo9WN6ggkguYXgP3xiuodI
	PcvxiwXmRaCJdqgoYjjfT8wPpPscmSC4=
X-Received: by 2002:a05:651c:f02:b0:38e:55a2:db7f with SMTP id
 38308e7fff4ca-39240f7ad83mr8237431fa.16.1777370073536; Tue, 28 Apr 2026
 02:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
In-Reply-To: <20260423-qcs615_gpio-v1-1-f2d5a31ea3e1@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:54:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLn5yOXASR61Cw2yOKRAs8T42jhBaT6ZdCnKzTThabBvKg@mail.gmail.com>
X-Gm-Features: AVHnY4KaQH3bvV1-GQNVBWY8Tub8SynQl8FztFzy6YWlXTeXjQXA6Q2unlHEkRs
Message-ID: <CAD++jLn5yOXASR61Cw2yOKRAs8T42jhBaT6ZdCnKzTThabBvKg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix GPIO to PDC wake irq map for qcs615
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 04B4C482062
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35678-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]

On Thu, Apr 23, 2026 at 1:25=E2=80=AFPM Navya Malempati
<navya.malempati@oss.qualcomm.com> wrote:

> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
>
> PDC interrupts 122-125 were meant for ibi_i3c wakeup but qcs615 do not
> support i3c. GPIOs 39,51,88 and 89 are also connected to different PDC
> pin to support non-ibi wakeup. Update the wakeirq map to reflect same.
>
> Fixes: b698f36a9d40 ("pinctrl: qcom: add the tlmm driver for QCS615 platf=
orm")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>

Patch applied for fixes.

I think it's the right thing? It's a bit confusing with different Qualcomm
employees not being fully aligned, but it's manageable for now.

Yours,
Linus Walleij

