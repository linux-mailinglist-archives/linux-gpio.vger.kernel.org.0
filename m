Return-Path: <linux-gpio+bounces-39741-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aT7uE9SkT2polgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39741-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:40:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB9731AC4
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:40:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="LfM5cbj/";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39741-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39741-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D153317A313
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 13:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905ED2E54A3;
	Thu,  9 Jul 2026 13:29:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFD02DF6E9
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 13:29:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603747; cv=pass; b=GJ0Q2aAup6OhjoeMz1VnBOw4aPVQDTdKtUY8FEDOUXAEeu5FOGKFw7ZvdXa6RSqrKGGkVfQxyd0oYYF2UPamvIZXAgeBDr6KCo45YFGnKxXEJDTbifjk6shT+6AP6gL8q3PdfQtrEuwlY7WCwiVKczpg3ga9ulSBa/LJ63M4/+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603747; c=relaxed/simple;
	bh=fy4AU9FWUyaAiS8Jr4lYhNN0QnZMjnaBoIWT5Ykot6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRYla5lO3QMZuYX1E5U67oVZmtrGwh3od4YrqdmqgNScsf4jzqV3NNuU8Zkg+qg2dwOV+YQrxnV5gIEyrRqGwqE6Nak/gc5hbsmGn1Zx43OCAjSf9umNXK7VphLwu/r1gn1UcX1KWfHfOwgA3VQHqriTRu7h8QZaNk63NK2giCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfM5cbj/; arc=pass smtp.client-ip=209.85.221.170
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bdd0779366so460702e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 06:29:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783603745; cv=none;
        d=google.com; s=arc-20260327;
        b=ARfYvAfbHUVleC53lgRBftdWIG3HtKBbJimMOCnJT9wFhk9Amr566dp4nLOzsNV+Fl
         LLSnQdD7JE3uU4oWymHb5XysWD/OgUGTqGWzijowXw6RKuDUYTv6eVvfK3p33/E9Zh4w
         7acM1nJMVg4a/eJtLdFKbESGDCAn04ms3ntAIr8FLtP/SDgz+f2kklqWqQV2fM5YKuaq
         RrGxYqhGwZid3krVXpBpOwMQWuBxKCAUMKXitOIEWoyTdtJkid5OarrbyPjg72DJQYDg
         bZIAXTulb28exjl9OLfgwwyHWjHu/p6oOmqQ4yYaonoLuejTC7BfGOVI6lk338fVtriC
         +2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sYnuvdL+MuprbAstUVA/KMXRVODde6kDTXIYHwY7dts=;
        fh=3Aln755x1S2320cxzvfqF+DqaKa4wGkroq3pdCBlRTQ=;
        b=kGoo3mS0QgI973DIJpFv90sgynSGF8WY8Sqs5p8aT1Ugv2Y/xtjc/rX8xI3Vgfey7c
         KVx7MEmQS1G4pkaO5HOWsFOfoT3FN79jan+/2OPphjdL8FJO/Zdwu0dDDVrjcH0RNo1/
         kiULTBuyWvdyCr23SvOwoNZQEgIcZUbKTPJww3B18ouB4DTHKA5EoGki6vA4rBpKp0wG
         enk/3NAIq/rYq+4dwsBKsn/Rws4epjSooo1XW2qhfGOCUHxft13QATZR8qAfFnFj0SWV
         vqUgkgaIUfB5Zl//+qYLKPHpT5jMkZ2KxOOirqkHgtfehluG3dC/M/quvQms3+M8khn9
         hrBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783603745; x=1784208545; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sYnuvdL+MuprbAstUVA/KMXRVODde6kDTXIYHwY7dts=;
        b=LfM5cbj/42Hh5pnG5nNvBgVwwxQWg7QlTxmKcRO9WUlXc7FzzOagFfyjWgisQJHFj2
         OZmzJyCpnLeFKMba40jkVd3p6DMynIZYmPZtrTVVn9fwMxAP0c0EnIBK1oVVUrJ2KUGc
         6x6nXgq4M8b7nibDwxElAq6Jl5Knq6USMQzGm8svji8FhbUA7YCsJaXWkG7yDCIv/bPz
         LYZmBn7OpBwRztnkLIfU/WARG6vtfpRRPum/2u+Rwo+VvFV8CQNMpU9M4tPCc0ZXRKOJ
         wCwe7ML3KjlVfdcioLYNU0/h4LPwD/QM3eQmzp9hGq5xTo+cwP1xkV2BNGJfJSD+HSVH
         /zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603745; x=1784208545;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sYnuvdL+MuprbAstUVA/KMXRVODde6kDTXIYHwY7dts=;
        b=URXM0jWyHY5Cc2YVcagqjUfSEktmRzsOxAy9nyAXQqWUwd29PtkZCVgVVXOnwOMsJR
         Bvn9TjC/Ji/weHozjJsPD9M/FlZLL8ddAxI40BqA3GvWgkdbYWL8tU/YLpYA3c9FnMw7
         6uXJFHDKcg0un+czMJ7BkbzCIyexhV9fm2B0qz9eAtmqBni0hePJBWTnLboX1wxdTaQm
         Wf57az/k8eKk3/3ZuXpR/DUReL45BLBkfCmQHDmc817BO3CFdvai/QIe57zlhQrQhoRF
         hfQCgp1JVertiq57gtGFDqF9f+TlpUHapWfBqcX9bwBNsJkV+/vYdE16cuRWfcNUCzix
         OmPg==
X-Forwarded-Encrypted: i=1; AHgh+Rrf8M/qVuJoRfdXMxfkVKLwW1n2FtuJ7Za6czTBP9KyxECPkt327c3MD3gUqagLHCzbigMQ1y+HUgIY@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGBfF3jhTzGESkHG5CIFV9Z8UOoBf8bz2Pll+lBGH5LpxfHs7
	zNh93oi08diX419klurng1IaDAD3VLQPrg5K7Hl7MkolsDlzftSeUC3r8E8UvJIS0DOS30QPTKE
	6Nfmk3LjEBwJjy5gjIxR/Tnf08Bf9+7Ysv23G4NH/iw==
X-Gm-Gg: AfdE7clDfKoXv5AWp7VkQQltOa2xthqEaIGWvCMDCYcc/o8sF/4EGt+7AAk3QD2bCm5
	iqTorh6sUl+UlhwgO5Mk6rmW/80oUK6FStg3xcCX/C+VpjMAHFsa736vYRZTOE98xvVXmKMY80V
	M846uDvqideMm5yAPgfMD5M2UkPN+sNLd0XpLIWmKWPnoyVTtonaZetuzfE/ftSmb7P7xr6+uiG
	vED1R5thtOIZ1Ji/9IMbp1CxFNB/pz5Ix+s/TstdG/qRsggw1e/L3qf8LcbVqNajtoeRT00WByS
	zmT1raAS4guR737d3Vy/cUamIDjy3js=
X-Received: by 2002:a05:6122:3790:b0:5bd:ba0e:1d6e with SMTP id
 71dfb90a1353d-5bf75eab5e4mr3740101e0c.11.1783603744635; Thu, 09 Jul 2026
 06:29:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165410epcas5p3567172b20a463006bcf3686b3771f212@epcas5p3.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-3-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-3-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:28:50 +0100
X-Gm-Features: AUfX_mxnCWBF3-jtSm-4vtEit0N4j6s0qQ7pEzHoCtPwv8N5Ycj70d6sCmI8TM0
Message-ID: <CADrjBPrR_N6SrCitTtWxa7JUM8816cCbTY1rae2qyqnRVWWd3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-binding: pinctrl: samsung: Add
 exynos8855-pinctrl compatible
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39741-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,linaro.org:from_mime,linaro.org:email,linaro.org:dkim,samsung.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75FB9731AC4

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Document pin controller support on Exynos8855 SoC.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 7b006009ca0e..c4773701c92e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -53,6 +53,7 @@ properties:
>        - samsung,exynos7870-pinctrl
>        - samsung,exynos7885-pinctrl
>        - samsung,exynos850-pinctrl
> +      - samsung,exynos8855-pinctrl
>        - samsung,exynos8890-pinctrl
>        - samsung,exynos8895-pinctrl
>        - samsung,exynos9610-pinctrl
> --
> 2.34.1
>

