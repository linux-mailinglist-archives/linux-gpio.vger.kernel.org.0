Return-Path: <linux-gpio+bounces-36127-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGhKBzK8+WmTCwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36127-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:45:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7EF4CA0A8
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 11:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC1C0301C506
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 09:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DFCF329E4B;
	Tue,  5 May 2026 09:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWo0v2t0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5394326951
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777973940; cv=none; b=XPqx2dXRxQ1FuFs2bYaC1dvK8c64xvhfA6FhMMffOxWUVEhLH4tiMbgvdSkQvJ20tYA3FQQBit/PKwuS9Wi8J+5xwGG42bVvyPq/HZg4kpv9RFvd8lmaj+liP737IDOGTYQygbcmM4X3GbPCVF3U99PnDJ4q8RfqwlR/vQ+jPT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777973940; c=relaxed/simple;
	bh=Z7pBTNXW5udugu29L3PKbm5GuTxdmBMTA6+euj+Fv08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgbWx+U35nq8x3QZg91CzGqbPArKr1luj3ufQzM8zOizEHr/L8+L4Axm6l8LzS2LC+rqHSmk+RZN4gvI5ZpxThiwLGkE7h25sMY9WW/HM6VCqmbGYkPFa1EPNNaGfKsG6VJSCHRLh1gSnv3W2yHfhK6fCTUWtALUkICBJUGmnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWo0v2t0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2D8C2BCC9
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 09:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777973940;
	bh=Z7pBTNXW5udugu29L3PKbm5GuTxdmBMTA6+euj+Fv08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eWo0v2t0y+N9u6yxGvGUS6uZxPHVFo9v0wAiabELbSb+h1VIKHFR8Y0rOJM15clsu
	 JeVWug4wSVMkmIdYwNJbcR4My5n6kgzNbfAGAxPDdGP6qR/aBQDoVxYoq+yRNKF5Tc
	 YPuZraCPbN3E8SMiMGTuym1uSh/aE3IgulQMwo3mun4KAlgPFcQLp+qpM62irgsCl9
	 PAMBSIB06EHga/7Kk/ZBSkvy/CuxOc45mhFTZEACykvKg4oqDSiyM7iGcSg/aWyZf3
	 7rgmRvUCIiYpTO7baNr6v3yeA7gWVZWorIRcU+zC+H1nzzzGjrCtxLadsnBstvbLgx
	 RSk2YqdGTZOGQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40b2bc96dso5542627e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 02:39:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/tvEyrX9CEkxkQdS0I1rlx1/+XvAcEnSHr6cdJytOh81703Q1ui7Ru9c/lhtyJCJ0+0m0h8wM/3+l7@vger.kernel.org
X-Gm-Message-State: AOJu0YwneRcmV93V87oXrKGDGFwPXH2G+9IsC7GZX8ookvOx803yFZQe
	VqPsiG8O7XoSesN1RK/6GtBLiCqYvpWSdb60yd/3UebGqAO0TT29bHHuWda4juWqTdChNxEhE52
	YDxrId90BsJc9l/vOMBDqBOhHroPtw/w=
X-Received: by 2002:a05:6512:1150:b0:5a4:1798:31ba with SMTP id
 2adb3069b0e04-5a8631bdb0amr4506124e87.21.1777973939184; Tue, 05 May 2026
 02:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:38:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnnZEnF6HbWRsJZyN4Jodfna31n=RrfZ_1nKUz0mq=_4g@mail.gmail.com>
X-Gm-Features: AVHnY4Jzejsx6nrPML2iTQxMvnqJ1x-tq49MkT39GYfcLcZfEV2KLJUsaPiKL7U
Message-ID: <CAD++jLnnZEnF6HbWRsJZyN4Jodfna31n=RrfZ_1nKUz0mq=_4g@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 1A7EF4CA0A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36127-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]

On Tue, Apr 28, 2026 at 6:35=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
>
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
>
> 1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
>    PINCTRL_HAWI, which were not selected before but should be, because
>    these platforms need them for proper boot.
>
> 2. arm qcom_defconfig: no changes.
>
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
>
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied for v7.2!

Yours,
Linus Walleij

