Return-Path: <linux-gpio+bounces-32030-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LVjC1ApnGl1AAQAu9opvQ
	(envelope-from <linux-gpio+bounces-32030-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:17:52 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1CE174B5D
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 11:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E296B3044345
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Feb 2026 10:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7911835B621;
	Mon, 23 Feb 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVoGP29w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A81B343D8F
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771841617; cv=none; b=M1/jBgKUFWQbGXnjjZ4PQb5ud3b9pv2KQkUUS0DE5LQuEb1NuqA2YuFNfrpcmAtMo3GVvPIfPe2VqF/SmQoHuTuB1nUTl2ar9mHiO+cimhQXjjLjOXSGif3ZOVT8Rac93x02LNi0WcaJ7wJK9QlOpI6ioa5IwsrN9UvUQW/LJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771841617; c=relaxed/simple;
	bh=v29ysssbhKmUZeirXXTcQ20HRknXFoWNBCr+bHWeqP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p87tsGdab5z2agGtSSiTC24iI++C9WIipVY7T3Yl2VnDCGygQJlLJAMoIA2G6z1i7sd6gNOf+hXeDgWfYGMFWqerEVJArp63aoaZhTEcExO80DM6boAFqSHSMEHNUyHc4drD1910FG6tJaRL9NAAAlOfAMVcm82GXUjVz6dBymY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVoGP29w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC17C2BC87
	for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 10:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841617;
	bh=v29ysssbhKmUZeirXXTcQ20HRknXFoWNBCr+bHWeqP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tVoGP29wM/rCChhlDMzH993+IS6KJfnc8IvHUlYkHXHCo7omswn7H2irOUYw9Cjji
	 ntSgY0RvH2YHfdjHQ0l7iMq4vZ6qc5CMEsdeKwHu3hWA/z6fxkdPnXoAzVZ63vVVQy
	 JQU6knoBSIQzpgPwkRykS7IOa/ird3PVbnddEZlse3TBx4/8kfWD8FCRD6LR1Qzx3/
	 aXgaZsGl1sI5f281i86dPT/ZRiuY6evEoxGi1Rhqdb40NLb2kIuCuuQjm8mkSitf31
	 8EiRUNEce5F728tRjmdmohVyGa5faaruc4o4R9aYlAB6Ad4O07fQLEbNkNmFhG1v1L
	 l07UewvDaSSLA==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79801df2524so39203557b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Feb 2026 02:13:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKxcvRICCsEtS0ldflm4R3hiUju2bBL7UiJROy2LHLN4ZTacFFVe0mAcwTXWTwPDBhdYEWplmwOBMX@vger.kernel.org
X-Gm-Message-State: AOJu0YzF24BOPK+2FUN7UfgZ1Bym5avWuFFeW3ETGKW66M885v8xoAWL
	5f7zNM6PeAvlxdnIKh+SEXO9Ia/laY+j2OT3dfRAbCnV3YfvGKG/9SuTSyExp8Qko6ag4wr//X/
	POF9WwvtR/EZSHT1tpwoFlkVOiGt8myY=
X-Received: by 2002:a05:690c:c244:b0:795:123:5a21 with SMTP id
 00721157ae682-798291a3bdcmr71291517b3.62.1771841616250; Mon, 23 Feb 2026
 02:13:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209134529.725573-1-mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260209134529.725573-1-mohammad.rafi.shaik@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Feb 2026 11:13:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLm5K8j5i1L9-TiozmMpSVdO932yRLtKSLGrbTN1y6wBQg@mail.gmail.com>
X-Gm-Features: AaiRm53zHZfihajbGBV8iyuKSOus2OWjSO0GhGue1KGSnQjIgGWsvxNwaqLINoU
Message-ID: <CAD++jLm5K8j5i1L9-TiozmMpSVdO932yRLtKSLGrbTN1y6wBQg@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
	TAGGED_FROM(0.00)[bounces-32030-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9A1CE174B5D
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 2:46=E2=80=AFPM Mohammad Rafi Shaik
<mohammad.rafi.shaik@oss.qualcomm.com> wrote:

> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
> pin controller, fully compatible with previous SM8450 generation
> (same amount of pins and functions).
>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

