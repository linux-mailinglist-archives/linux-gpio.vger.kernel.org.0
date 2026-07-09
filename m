Return-Path: <linux-gpio+bounces-39746-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tEYvDpiuT2rDmgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39746-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 16:22:16 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD53732294
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 16:22:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Nk0eJQ6E;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39746-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39746-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA6C630AEE4E
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 13:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CFB42E8DE;
	Thu,  9 Jul 2026 13:51:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06C368D7D
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 13:51:04 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605066; cv=pass; b=KhR/k4HL6HeP9C7pkVavyjHV1kxwrkle2KSQqQqs8MbS+26PpNRrDAsNSIfCegIiy1rylABa9rkhXBKlGfZsJKsbbA8TpkDpg8WH8TXT6RZn/FsfTqcdPC5Plp2VOoV85coft6wg/hnPAavfenZ0AgN2oGlvIKnk7lVbZ6CLKqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605066; c=relaxed/simple;
	bh=SihmFjkWEiEO0qH8JlrA4KwYnVS+DiBZnDYthOxMe8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTtbG5M37xPptYMv+QSU2rceKwmrSkv6IrP9s/fBsOQv7Bf4V3jA920NKwtPdReaTIorWPKfTGEoo+G9htx+LSCOqZQ+u80eIckXCoIm4H0iM07sZMRtHblVHEyhZriuPLc8zAOkbqDZ+nlUwDewyB4MGFDgumSz8QQqsBqhrSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nk0eJQ6E; arc=pass smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698b6c87884so3194442a12.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 06:51:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783605063; cv=none;
        d=google.com; s=arc-20260327;
        b=lCkuatl+70vTaJzn6tijcovQr+q4fs4/JHD7b0aq5WNdPgGvH9JV7vROK1X7LV4/nu
         okJdSMGrLM6pTH17UoNTnOnpI+HmTUJLUYNnbELgz4a+JFu+OtMm0GHVE9XSjOi4UUnr
         1qWcsNnI3Ku9Ol4ZRVue+24819jr1jIX19gOPjzo0YhKC+B0kPpRE6HqZPKNtIoh7IIO
         8fEgP0fMzD5XKNVqy5dAEq3doJfw0qzckngLH2bzl4ziKr0m02Y+meaS6l1kt+eW0qLD
         oWbcesa8XUgoVhGRLibpG8/j1+Al04SITPp7TtjPYrZgJJtf42YWejqNOptRHnqGfsZd
         6n3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        fh=hrDYH4/nVP+ku0Oiga82hXWmFpzxhh9j0UWfOlpwjtk=;
        b=evTvD3/8eyiUBj7HqO6v47x7cwoGusdeWG2ofdUvO6TgSiPNX1iQzfo1uIroxJFPG2
         RUfZD4/rlP0UWv0ZwB4Tkqvpc7lNL3r6M6DxyimL2/x9ETkWFf4O+WAqfgTPJ4X++XO0
         s6EMC1FccslJN9CThMmvex/LpiIeY6a5t68Vvm5QKULgbmrmuStqJKcR0KUb7RLFV+lS
         xZMF2DpAMAThATC85vjQWFbaDa3ddEgtFrpgtiVtdgAetYWGy7Ev4PSlVfuTNErEzdQ5
         LPADMbfSRvTFSdu2Uoy3t+fE3tfm12k34vbntET2wqdE9NtlEYQ5J5/pYB7e1Ejdbinl
         TOBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783605063; x=1784209863; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        b=Nk0eJQ6EVuL7xN8ec8R2tlT/Bmc2hTLUuQS12j1Xyv2G3Obd6YLe9lTp8O5nmBuo4e
         CxGCwyObkmt9MvOA+Hm29UDNJx1YxvUIadDmS9BedKhkkeLroUdKjUK/9aVV3PYTXSK2
         KPrl4yjs81nErQFG364M9kBGcGRm5cK91ZorCQT52iKnL//HuCURDlYmGx7kBB14D21K
         4lUQgLgfK4a4rSUVl4xFtvGVAzNSADXgBy6+NRRXSOnuA2xdaBIrXpYC3IAoWPcLbNOO
         5sO2IFT6KJM+wpdT9LVEDnje1fMoxRX68s9SB3BVattd5AQD4B//ZCrg9CrJtIX7tVLK
         PE6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783605063; x=1784209863;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ybzojlHD40xTUq3ZfqVQQgO/h3HFfouo+/UtgZR9PKs=;
        b=Wn3VnDzmjbYpcM6URpcJfjSd5aFZLdk5t3j7HvbsJ9y0ndYWNOV0GLjhA5xNe+Lacd
         gQI++7nlh11KGsJB8x7lALViGYIhJuWSU6zsSDV0Dgc3IwhPPsTUUVbRU2BRCjif/sWy
         yMdDv92g7PEgCuMgMxW+760VeEl3p/7U1G8EpMAE3loZSpMSpZ5HbSVoHEa/B2o82g0V
         aw4wSu9L6icym774NBc8HQ6CcuVw8XJfrry+ICULCMTpgY/YKBit6p6C1CtWhAWXJTHR
         eazlfN4OdtcVJUsfyDoj12ADJVTq9L7LtTQO5aH9a3GwO8DDzV4tbT+YFNNZ0HDuSGEJ
         qjDA==
X-Forwarded-Encrypted: i=1; AHgh+RqvwctJp+BQG6Ep7EtJuhGX8gXyi2Wbuwu3a6cdG4f5xnIBiVx61+6wqI5/OSZuFLgrXJM67+HWs8wa@vger.kernel.org
X-Gm-Message-State: AOJu0Yw013uPa473LUrDSGCxmF/bAMT1tdglI8MYa7bFAhWddB6x950a
	BA8hjn0A6IHn1feQYkmkG1HdqCIEHcYiO5QW1DJppCTHMtRGmaB0PGUIfwlQ5X6bpKOKveuvzv/
	dg0yo2UdWLkJWEZtKfazzFSreEZ5GE/x+ccX2Huxr0Q==
X-Gm-Gg: AfdE7cnqPaSbD4In2TLHCfUNXbYXbFcizHauF9+Wm6b212c1VDU4gGWsgt5B9kkovsm
	3OXRd6TX8gYVKl2BckF1iVX8xZ39myhbjUEMWd1wtLRxwMhYfgQfs854sOH5j/SXlTQpHMCbBVD
	pZn8HYM/1yWA8n/8SgNAr2qspDjJj2m/FMC6bgYmcD7xATTJPKXzwivr40QDoTdWz79C07Ixwrp
	8lzIC6aPWFaZN4W8CibsJJ1m0d/Is3aSrVwjkwO+HNlfbqZH54KEFkv28stSJuuoouvXtVGm7nF
	cLZBAZZ7gSNuxBhpCxcA2k/1A7v37/4=
X-Received: by 2002:a05:6402:428a:b0:698:5610:76e5 with SMTP id
 4fb4d7f45d1cf-69ab445ea87mr3046587a12.6.1783605063166; Thu, 09 Jul 2026
 06:51:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165426epcas5p205bd4b60c6f1dba68f4f1125ad29745d@epcas5p2.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-7-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-7-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:50:50 +0100
X-Gm-Features: AUfX_mzbOQE90wbcU5W8GA5XzSbsGokNAuCSRvh_hJojsQkyE6XqvwM4U1XHkcA
Message-ID: <CADrjBPrPi_x-ppDtQAMHC4akqhzpT7i66Dz86uCzopdbW88MBA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add entry for Samsung Exynos8855 SoC
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39746-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,infradead.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACD53732294

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add maintainers entry for the Samsung Exynos8855 SoC based platforms
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1705eb823dd0..f6d9e03d3370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23996,6 +23996,13 @@ F:     arch/arm64/boot/dts/exynos/exynos850*
>  F:     drivers/clk/samsung/clk-exynos850.c
>  F:     include/dt-bindings/clock/exynos850.h
>
> +SAMSUNG EXYNOS8855 SoC SUPPORT
> +M:     Alim Akhtar <alim.akhtar@samsung.com>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:     linux-samsung-soc@vger.kernel.org
> +S:     Maintained
> +F:     arch/arm64/boot/dts/exynos/exynos8855*
> +
>  SAMSUNG EXYNOS ACPM MAILBOX PROTOCOL
>  M:     Tudor Ambarus <tudor.ambarus@linaro.org>
>  L:     linux-kernel@vger.kernel.org
> --
> 2.34.1
>

