Return-Path: <linux-gpio+bounces-39806-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jBFrMKTEUGov4wIAu9opvQ
	(envelope-from <linux-gpio+bounces-39806-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:08:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58311739767
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 12:08:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=ItQXTRZb;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39806-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39806-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C53E63011EA7
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E73400DF3;
	Fri, 10 Jul 2026 10:08:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015B03D1A8E
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 10:08:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678112; cv=pass; b=Nv7+49Gvyi5mv+it11yKXLacs37DQUgz+LZENiM+kl3NS15LlN0XJ9IXB1eD6qZP//fUkSBCbT41lPlvnh7m/dJvUJ2l/gfQqcHXRu0jXOvMW+Z79kB+Bp1EiSvPbbKuSYBVc2c3tXfy3yEkCghHEsX5h1AlULGnY2u+jKYIRAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678112; c=relaxed/simple;
	bh=pRM2rNgd9MBRVIU9n/6jP1Ntus4fUi+4/1OzQi5Hjs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dfQJOW5lYfz4s0w8fzxcrDbq4tp6f1bpczX0khcGQC3q2BV2fPhAForM311DHbsnvKwGa+rQW4NsWjzQIPKVYJ4cP8FCvbUIvBpm1bYLSOMOzEcBGOpbM4qh3bN1WtEI7ejLQWwu1I7hjrXlyzqhgAKZOGdLKpK/yFmF2hQhdKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ItQXTRZb; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so1027906a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 03:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783678109; cv=none;
        d=google.com; s=arc-20260327;
        b=j981UmfshH1Z9vDAcjd66ZDkcaS60xWycI71OrqtHo6+7LP3Ys3pu++fAh2Uo8Su5b
         BtRKEh8lrxZkycM6RbDZGD5IOScLnr8p4rt3Bkw9sT0d6LK3yTlTO16F+9QYg2My/rSZ
         cRKrVzKiohygBrIaMsVTORWLT/pG8+F9Nj9MmSOKVJtj/3leVN9h67XUZ19ZNDInlH2A
         lEZf5uNMvbSgWev+Mhdq5E6SXkLs31twEdqn9xhx+ptET9CyShcnII3eBdULZxxNMf+P
         XksbQMjMmUVPPXtn0J8jS+0lOluc6QY2tzZWbQJZ1pJ2mxHbObK9BaPEQ9Z2WShjZaje
         ATrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        fh=qFPcOhjP8bIvBFcjjom3S/U4bCLm9fjMKoYcRI4Xr5g=;
        b=oql24XqfbAsqlqwGPW2b86iHM989DAcrPxdDqzk9K6/DdSIVbp+CwD4h/Tp9pMLoFs
         jf0mTniifYRio/00Sqa3BDdKzCDFULsNhIa59cdpswe0WxMRyiaJJyQeUmzupxftE8bB
         DkI+TDXG6etIRXqU2Uiccr8IB/Pqdi9FlF7sB79eCjXo5cYhdrUdzALIOYL9/0YW4SWo
         K0TEL30+hzyxfS4mMm/91VXtKfCFU8OUaU+yateAGTNUjuTN086M8T8l9ylZ2GGwqGEw
         xOHOS4r9eQORdYeIBTOr6Zs0LeJi2nJ7A+strwHzhVHURqY2bx0y/2nsbAH5oJtxy44e
         0zIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783678109; x=1784282909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        b=ItQXTRZbsEq+Y4Iv2yFAOj62T9Cq1YaKqMlbce2lP6q7WO3e0YiRDdP+KePeMwhqMO
         +fEvbYmMeh09kOTWtVdRc9se4h62qM0u+PzZRRqT/Ei/I+swGGpPVa+0Ji/UQFQ8AYMA
         Gd3sG8rukUgnIWYfb1TmukZ2Mbt2wMzU6LC8xn4U3IcqOFe8wY9dlvuV2vJKjnikz3rS
         wh+f4jaZRo4IbgQtWJsLJG/HccqwDY4SAB+GUuL0SOD8z07LxFocdKDs41qwePIf58eb
         ZUEcfPN4uaM/nSn0eebe1ZJyo5sG0K+m4gd9Amam7qXr+wm1yJlZNrGug7gZsyjPLKH7
         Iuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678109; x=1784282909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XQ09WvOdFm9bzQk3hIkyZtzTyrw6fuB4GwRwRjKXZBU=;
        b=KQ92h1ODl5o8RuMUzzr3w4uiwHTrdPUO5+SzSTXWoKjQQ1Fci/qFmw+i1DjsIUSjY9
         7pKnJkBC5nHVMUv4Q1xLAAW+97BSR7mbpHuuazLZ4UmaYARfz2b/fzAdRX8RhNtNLk/b
         bSlvWMEsQkC1d9rO2FSms5K14QAN0e0B9qyewtIB0TIKawUgOVpQCKbMUm7LBAHzi/Ds
         CNyvj13K40+uhvO4x92kodVjbm+dj23tZsmviD7vlxmPj2vFQPi3ffwEtRwYlpuoLoXb
         a4QovodAN8j3DUYcWDh+8XhykLKgZexwSMKIbw0ZeAGEA0yxm9BHTqJJ9nigIF4EKBJK
         0BUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYUZaUajZy6JIHy+nuiyvwnh8Xvg7hy4V2ce+hKb8j7s980k91cWMNPE//PfO2+Rc1FSc/tSrzmOVO@vger.kernel.org
X-Gm-Message-State: AOJu0YyM7Csxf8vE3KlNFg3HAi0AS6wB54jMOEac9MrvZCLPSvHCpCAR
	Q9ydTC0U892ZtdpxWGd7JVOQoOjZDvtg6GGDSa91rskOESAnVeIH4XEjWJDxwB8GZMNTG81X6Vl
	qhgBDvicm/XZF3vSHQ9ebb+bb3+1WTglqVhtmxD7fuA==
X-Gm-Gg: AfdE7ckeMMaY3zhuh3paJRAyipV8c7eY7QJub+Ngw3lCbiEgP+lBHal5AUu4u60AhVt
	MJ2NqKKky1q+XX+zXEQpB7dVCb7vKydj/SyJSyk9UAd4V4idBlXePPgRQOVqiZLLLi+gojtrWz4
	49/sQzvIkJD6SHEddc/UiGde3cvV9OmeZUMAG/RJtGe1D1494tG4SAheCzHh34/Bt7+Stij3yil
	XEciSwYlsOOT49+lnMXtuuRjMlz2JEt+6hXHfshXge4cWa4gFjjVC8A72IliOuWNmPhyWQ5glNK
	BllS9FRCv0NiEQtjFu2HQhbTeBKpH9Y=
X-Received: by 2002:a05:6402:1f0d:b0:698:52b4:c2c9 with SMTP id
 4fb4d7f45d1cf-69ab449f56bmr3763583a12.31.1783678109402; Fri, 10 Jul 2026
 03:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165422epcas5p4e4c6bce0e2daa6d08a9ec18afde9ce0e@epcas5p4.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-6-alim.akhtar@samsung.com>
 <CADrjBPqYSTDExrBrYYf2z=23Ci8VqF9zXvbc+njDm1d4Ojrjrg@mail.gmail.com>
 <14cf01dd1052$4de88670$e9b99350$@samsung.com> <9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
In-Reply-To: <9eb6b0ef-cbc1-4b2f-b607-986f28ec46ee@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 10 Jul 2026 11:08:17 +0100
X-Gm-Features: AUfX_mw_MQovWgLm-SNbZiYq6L-o37seq6gSN5GX96bbQr3I8gkT7hwklMnJXyA
Message-ID: <CADrjBPp54oxAfJ9i7VTqCVuCJLq3X5mZPh9wMOMgoa-N1e1Ghw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, robh@kernel.org, conor+dt@kernel.org, 
	linusw@kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39806-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 58311739767

Hi Krysztof,

On Fri, 10 Jul 2026 at 11:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 10/07/2026 11:55, Alim Akhtar wrote:
> >>> ---
> >>>  arch/arm64/boot/dts/exynos/Makefile           |   1 +
> >>>  .../boot/dts/exynos/exynos8855-pinctrl.dtsi   | 574 ++++++++++++++++++
> >>>  .../arm64/boot/dts/exynos/exynos8855-smdk.dts |  32 +
> >>>  arch/arm64/boot/dts/exynos/exynos8855.dtsi    | 204 +++++++
> >>>  4 files changed, 811 insertions(+)
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-pinctrl.dtsi
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> >>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8855.dtsi
> >>> +       };
> > [snip]
> >>> +
> >>> +       oscclk: clock-oscclk {
> >>> +               compatible = "fixed-clock";
> >>> +               clock-output-names = "oscclk";
> >>> +               #clock-cells = <0>;
> >>> +       };
> >>
> >> Small nit, but I believe oscclk node should be ordered alpha-numerically by the
> >> node name. See https://docs.kernel.org/devicetree/bindings/dts-coding-
> >> style.html
> >>
> > Thanks, will update in v4
>
>
> The node feels ordered, no? clock before cpu?

Yes, good point. I was looking at the label not the node name.

Peter

