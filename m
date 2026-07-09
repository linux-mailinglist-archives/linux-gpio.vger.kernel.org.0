Return-Path: <linux-gpio+bounces-39742-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hLU7OuykT2pxlgIAu9opvQ
	(envelope-from <linux-gpio+bounces-39742-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:41:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829E731AD3
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 15:41:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=yoxF8EoS;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39742-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39742-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 524023182D4B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 13:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5162874E1;
	Thu,  9 Jul 2026 13:29:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE4227AC31
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 13:29:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603783; cv=pass; b=qNSJK/jl6lQdEWRNG1DrLXO8zSSuoclVrfizG8RB3QWA71RovFK0weEbRdD7T6cUZBmdxAIHSrw6VD1bs2hKk5ivM7GdC/3eM+QmVTsa0V29+Mkc6nK1xbkwITbXJ/AUcn8WLGev5ElpehMkjrV3MRO/vz2RahLx8S9ApNcpZ58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603783; c=relaxed/simple;
	bh=p+tyeRHdcrJH/grqiasUdaqVBUFH1iUrR+0FMBQ5STw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V19lgIr+P9wkfDKqWmu/LCmobgBR9qmZcFMV47Ty9my3TLbkR9Uc52axUHPsVa1gUJ8rNv2R1ZZE5/hn17h4/ims9R68gqLUCOiXOZcu1+ZeP6nokaoe8w2U2VAOKNdzIFSESyJLx9tl/x66GqdHoWOwULkIZjd2ehzxLy7v/TE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yoxF8EoS; arc=pass smtp.client-ip=209.85.221.181
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bd8efccd11so745084e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 06:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783603781; cv=none;
        d=google.com; s=arc-20260327;
        b=DeOOGuji8CnfLH5eYefI+4lCeYpHzr/1zJUwAAenX8TdVpOrb/dL6vB2EVQMuSApBK
         tilIQrqTSRqEAy2NtbaGhXB4+YAUeNw0DA4RApg1gTJSDllrAJGOdqw2xsHYq7Q+FP8X
         DEmbAxzStFZr3ZR4UqhUyjrBncCutw6WQ6YamS9PkyHwYESczzI57fBZ7lT8tFuz6kLq
         yB3BO4H5DElCoGIhSPHncD3BB2/CJoRW3oGbd/5SC9WpSCrS6WQHLNuG3B9NW99Ic5cx
         AUXoEVe0n24bsY8TPhp2XI3ujR+DjwyzlRzkGXTvZ9PrPilkpi0NaGURmNnDHAB+wRq3
         R+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        fh=8xR0ebHOkju/E1yHU+brPqpE2wALwIDrLNS5YY3ynLI=;
        b=Xe+1ZkoDu5VkQWGLoHx+RpXV/Gn0r2YI+23ETGOcIpivg/Kih/tE/Kj1IphOMdoV1E
         YHfKmMCWlSFN71lPN6lt0ZnZkfqLjFMsHgzYFcl79/vm7424yRgm8Xz9KbzrlkrwTH+l
         T/Y4XxiC0UjgaVnkNdkSvpqb8moXZXO8kL4YokmG+48rpkhwVkLYztBtGPVwshw22Z9g
         zh/u9afwN2Qaq884CbkKLFxrH7Oq2TlEIrC0UV/5ExcBG59bGaXxbR5grgeWfSr4bn4T
         zOI1jR38m8wsQu8Y/w8fhy/JlGu6GB5ZARxUc/ydXZB0G7yVQlKkRcz485qtCyazVShk
         PJbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783603781; x=1784208581; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        b=yoxF8EoSbV8scfOWmYgH2Eu/Q3LHmI7R4pm48qBBvdkN73cBwIyoRydVTgE39kCFGn
         lsy9xG37KQAIW/9p7o99rvbQA83bV/+yoiXCOHtJQb+ROVxOCl+rLtjNKfihwHGLCYac
         hHv6+ATXcJDT1/mioXOrfOeTQLZfjPXrG6sLuHVXLnCY6/p+Lo/vTvSu0MdNxQ082Fjt
         ZEqITPvd/O7hjZemzKSRAqkEEi/D8X2k4jMS08LWXWtJlXQ6crR0iReM/4kEMam7ScjH
         EHYC4xoDN+SskrBa4Gfj8Vts7A5WevtDlHrwmTWalL/8XD8TwAGp3hPU5AvLRpe5ZgfR
         f26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603781; x=1784208581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oNX1ervj/KF2oRQpeTTfCUe0ApEWaxy2q7nI/otl7sY=;
        b=deZKxcORF12OSaI8T1MPvss2OEGxiIdimGMIfQVsEYWVg7duY85oLw4J947rwHFZqq
         +HPMz01HxN6WPOpEGlyEMjQykL8tL2uD90wyBS1Dh26MmXkMJ3AB50sR3EJ37mgjB2J9
         ILODJoanYrwk8MUeVhOQhmzaAq/k/G5QU3tXZUDCIEJ0SGMLBO2ecfKicySura+P4lF1
         /2Cqtz6zSlkm0PxBQF9SeL/j3md33M6o0PaTeJLpyeP5feZXM5TCadsmjR3NnvRuUblB
         mGZXO57c9/ZrdXtfaiOgNZRZtXvPdioJca+C1Fj7kXSZKhoaap8kTiAJHxEV2D273WDD
         //ow==
X-Forwarded-Encrypted: i=1; AHgh+Rptyf5YeOzj/SL3QzePv32asF0ZsSrjQEhSXNvpNy6qluzbCy2mzIi+vJQpib+TcQrMcTUtd6uuQsed@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFtM9qEjEG+WHU7IRA7EMyihRFdZ0kzFbJPzKTHmqdWCFW3mx
	elJGC4jzwVfIIsNd3fhorlooaIFuQhtMOourRWQpFUBN2V947YasIWcmtqA4lxeupUKU0HCYdTP
	UOACdeJNQkIeQOz4FcbWjIIggllANnJk0mG1AK+PP1A==
X-Gm-Gg: AfdE7cmseRrRdlAvLJ90hOt1cy7fdtfEf77oxreQZKotjSqmCzQdvPpCoFNiqBGdUNx
	1YEACIq5lZFdAtu/6ld5hT6UIOGZrV2yTUB1EzN0PsP49cHJzF7J7sYsv8/tJBTe81F4+snCDiZ
	HSKdSHYwfRWcOmtgiHOh5DJmmZ2NkAcpq1LbXV7VwOHQSd6jvG/FnDtFJC4/O/gz135wPyMRTgh
	6VOxk3FgP4UGeE2Elt+lyDA7tQmTWxhjubHHen9i7N5VprFLPn10z8j9DzozvlbgEMB+iw0BP73
	9TwjdxsH88cMEbEjS5zWm1WgJVo242s=
X-Received: by 2002:a05:6122:134f:b0:5bf:889f:e7da with SMTP id
 71dfb90a1353d-5bf8b2c347fmr1647495e0c.2.1783603781466; Thu, 09 Jul 2026
 06:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165418epcas5p1186eea5f8dc54d16a88b8298f6cfcf61@epcas5p1.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-5-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-5-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 14:29:26 +0100
X-Gm-Features: AUfX_mxliiRsSAvZCzqebmWMkvyd5ICueczJtcvNgbCxgBSP3Az_wOh3qvEDkwA
Message-ID: <CADrjBPoqcUs7YQtQMMRuagQMQGfLA7OE9M+Fe24DFJQusx0bGQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] dt-bindings: pinctrl: samsung: Add
 exynos8855-wakeup-eint compatible
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39742-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:email,linaro.org:dkim,samsung.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4829E731AD3

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add a dedicated compatible for the exynos8855-wakeup-eint node, which
> is compatible with Exynos7 implementation.
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> index 2b88f25e80a6..802911e23aff 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
> @@ -41,6 +41,7 @@ properties:
>                - samsung,exynos7870-wakeup-eint
>                - samsung,exynos7885-wakeup-eint
>                - samsung,exynos850-wakeup-eint
> +              - samsung,exynos8855-wakeup-eint
>                - samsung,exynos8890-wakeup-eint
>                - samsung,exynos8895-wakeup-eint
>            - const: samsung,exynos7-wakeup-eint
> --
> 2.34.1
>

