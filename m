Return-Path: <linux-gpio+bounces-35624-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN1oEXbF72m4FwEAu9opvQ
	(envelope-from <linux-gpio+bounces-35624-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:22:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD57479F49
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 22:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78B3F303789F
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Apr 2026 20:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1D736606C;
	Mon, 27 Apr 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqUnmZVb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D9363089
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321126; cv=none; b=DdHJV1k13Khq0zS40HFGaqN8GH8ymhLQt5Y1v8jW3UlHIa+JywRKhmlTqELOhANqtLv0g212VOVrvN2ckWNREYbxLLDxeYNdxUhl2dVky9qqOVmSXBkJ+LzWBWTFEanKVeQOKH2cPpjLxHpiMAS1a/yGkr0++fmOb+P7bkz/zI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321126; c=relaxed/simple;
	bh=2m3w2eF3ySbCRlzKKfWno16CUj5QKOxf9WIS6YvqOy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACupyL5Nh/axFcb+tCrlBfmYgCFUuxSDLYrJCE+TrxQAKY4EsynKIZ+sPZnbCjSEZx58ftMC3b9OChIreChf9UXSJCOBd9cdg2tQZfrY0xO8hd7MUL0QVKg/iFne4paJi5nMP6zOKVe55k0OQZihlO2vFYgW/jvJX5/Nkq7663w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqUnmZVb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47482C4AF0C
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321126;
	bh=2m3w2eF3ySbCRlzKKfWno16CUj5QKOxf9WIS6YvqOy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oqUnmZVbutl6/yxt4+cqgVCczSJIkB6dH3yocAbV7lESi32RXPrsTItrwzCKOPd72
	 fODgAQ2MNlBIEL02i7IDfifh/70W4gi2Frh0dYSuM0l/Q9eX5q18Yz34gvLsUTbJm0
	 bbBgft3QlAAk2KNmM5roTtXH2E54BW+N2o1QLTyZCsDu5MHxUqYCbBvXMvd3aMLRJR
	 Zj1rMiJKGkLUdYuriT8QUZblm08tyhtlwKK5ijvF8y7YeST+clqIh9D7et9mbssvDy
	 cTuBuiGw7GVbQX1GFUtGV7ND7JdXE5ldQHQ6E+gUuwBAlupevbdGwSRNoIdMLRVa2C
	 j/plYrbnR/ABA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso1572232e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 13:18:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/lpLhGBFZr2eIeBxE49wiE+JLB+4BPje/SYbJVJfy05wOi95GqRBMfSc2KxQNijubRhFpeQgwgF0nH@vger.kernel.org
X-Gm-Message-State: AOJu0YzFI9wfe5OOMZ9FrKeH0y913O0AVZRxMVebm/LVcTJV5C9ehVA7
	AsJuBGovCgEvT6A7GTA3ax8dw5W2b9UDw2RK2FXSxJijSrS1sXFDy3dnuuAfU8UOG8GL0rZQTv+
	yyHNmXPuGoHm6lNB7FfW6fUXq3Ckxs4k=
X-Received: by 2002:a05:6512:3f18:b0:5a3:fe5e:3d49 with SMTP id
 2adb3069b0e04-5a746626a7dmr91838e87.23.1777321124983; Mon, 27 Apr 2026
 13:18:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:18:33 +0200
X-Gmail-Original-Message-ID: <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
X-Gm-Features: AVHnY4JDVHbJjkTqLXSL4th_cNweCpaDB9wF_OCiODgBCzqsZyGQqWQgB4pLxPc
Message-ID: <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Russell King <linux@armlinux.org.uk>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: DAD57479F49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35624-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mail.gmail.com:mid]

On Sat, Apr 25, 2026 at 5:55=E2=80=AFPM Krzysztof Kozlowski
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
> 1. arm64 defconfig: enable PINCTRL_SM7150 and PINCTRL_HAWI, which were
>    not selected before but should be, because these platforms need them
>    for proper boot.
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
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Way better like this.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

