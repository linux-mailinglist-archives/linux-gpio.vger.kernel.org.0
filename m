Return-Path: <linux-gpio+bounces-39736-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AUe6KWiVT2qukAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39736-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 14:34:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5810973106E
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 14:34:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=Lybu6eBO;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39736-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39736-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 493A830331B1
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 12:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6C44229D1;
	Thu,  9 Jul 2026 12:31:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355DF4218AA
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 12:31:36 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600297; cv=pass; b=R2rNLQr1fWnGtWE+J4lgHUgroLlwiPwK9AzGm4GJZOV2HyUO5FqXMmeILJLgrzNLlDtDXTAXrdVuuQFxdAshbInNWZNjwlH7ujGgEAbC/kt8L5JnEMFYpqPmtUiXn/zXHFN1Rf6Ef7rQujt7S9LqOw7LzjGsMViGMCIz64fN/lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600297; c=relaxed/simple;
	bh=OPrV5O0AAcEk4Ax1DhMdeaFznJylTqQuB7qh4wuvTLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C48i3SqXHB7wFK4zGSe3rD1PhWFNRLM6/WJcXmpJXy7vUYdF1DXj8i8WTArKFZ3QdGBDQJN1YMixgHGeBNE5B5EtqInoacf9jzOMWE2BFJXZi6oVateYmdTzlewFtsVptrTrDiwgITKsiZeG6bmdhqGlZSzYUKhGqRwp0piwEUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lybu6eBO; arc=pass smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-697564cb69eso3228850a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 05:31:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600295; cv=none;
        d=google.com; s=arc-20260327;
        b=BQUBhnQLwWwqWgNG2DF7oy3u0xwf0wfykSxdgknFpLxUOc+8LZJcRhTuCCgPbelK+Q
         KTz1gzFNFtvFpcAwPaUmxWy1V5iGbmhMwj7C747cp/azWlqGi+2nrb/3ZvkX37nQW/aI
         DQHG7+ncWUQoUiBz5WVuL8JqeFH8Ah5Be8u/x8A8HosO/3t2IdCHViP2lwfdANUJjFCw
         NRDr/IRVwOI2/87f6bjgNQUnKio363rBYYRZH6KLvSBvOdLEhdRthKpMAm7inQFTKQc4
         jrb1PxT3OffksdRUyOHYa0Nzg41pZAjonIDW7XzfNqn9ERwsaO6QBBCoQk4xoCziAWvL
         +p+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        fh=N2L2qb1AQWPuYr0CP7ep+S7n1cuQDHJkgKcb2JaSRqc=;
        b=e+mOWVYfPgMybsxLKXn47QtY5hCmd9eq0bOiwyg6XAIWsyTD00WQzqLvZC0tKPhgmV
         hYoIUiOqRFUrBWwvytf/fTW0BcGxFMz743qkixJSmV7ng8pIH8gHLlIWpRx+M5xXyqjP
         iQu8Usb0dwXLObN+U+blZQuvokF6cfCSgihWuSlx34UiwEGJE9JQzvt/DCAIzUqHF68D
         xWGoJmWWjGtw+B93bFMSI6Hrv0mh+vBNEBST9YiyJOaE699DdA98mwOB5YFsvXoGyV1l
         XOyAh+FMJrFCC2sWKTOM2Mnn8J/P4OMont8v+khJhoTkezZKKcQmLr3JuBQA4KXnIa6x
         NESw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783600295; x=1784205095; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        b=Lybu6eBOtgswFf1z/Qb/FpNL8v+ECK2mB/Ui1scFkiF3v4DdSbYLlY0raLU6q5HHJd
         dOIYtkgqN/dCmNmThdPScpA/0x+aZlL9r6fydWZ3EWhYVzrEtkrhnAlT9UNX3f7W9kEo
         Ul3tOtgCLrNtxjf6YaBvYHsI3EpY7Bf4odWIQ9NrrMXVkpJ+rtpydfdHo+rapddjSnzy
         JXaLA0M3k5SJTkaMn6kBay0gllHxm3lR73hTOL6hzzAz0pqZd4LG5zMqjTfhVjQTgG4r
         lizjkMxbWbeMhNij3cQ3yRj8IGPYazgQWsCJZCwz2mQM1UgvhkRVSMDABN+Hk8q1CxW4
         aG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600295; x=1784205095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ENt0vCJ86VSVtmPtsqolSmQ32o9OY3OwpjaSyzCzfAI=;
        b=Ct5gg0eDKPe4Rbtv5ShEUGs+5bGNhOxdAlsYw9yPLXP+SX4J9fiWRNSXS8t/D0pSdF
         GYGhbhbwkVrW5ntemFo3NDa0JanOeClVG4JTYOH8PBgpFab7C6EiTy5QfpeN6T24XMBC
         kHP+JE6bj0T1ywD//Yk49RhMJfKo+AjVFkVChxTq1tWMwdPfSHwEXPVn6Zv5fx8ifYak
         +w2FSPRStyvoUbe0uogtzPbUrWehBWK/mfIs/TVgzVeFtwcDmyXN8KUxIm3Ry+Lff8VO
         TBMSAaCUzd4WJuIk06DwYJBAanCJiI0qNYfcBspwnN/QQHxD/ud8jMXHRoVHdgIEJLtF
         10IQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9hE5fOG4Lic3dqrz3EGw7aB1axefL3SsTfz36EyNnScyIitZkzlr4j9FOUKbI5/jGOkb954UHPc4J@vger.kernel.org
X-Gm-Message-State: AOJu0YwjYiVPZj1sdsmOePmNB2dmHcpB4oijXNyOgFvQs+KLesKLoQKP
	Xo6KGE1tarccUpkNmiiQY2x0t6TuK2UYHyPlSxIQFFv28uI9upoFNwULvYnGOx99fggPw/S+mVh
	4lvpbkrc4XXB+MXIyF8JhKzkcPPz7U/xUMKPWHPpPNw==
X-Gm-Gg: AfdE7cmbvL4TKgPxeCmZwDIqN+LioRecbL6P3E/g4qtlmyTFaNqUXLYldtaDGKlyn3D
	DM7ZSSPkZToapqNOzLSBlobXkjyzuERHqsuSHz3g8z3sNjz4f47saTRgsaoWTuGdvnjrbs09wo4
	Uxb5GQVhzi14Mn6RpTnymfJRC8bm/FtJix5rcbDJxQRu3+OgTQuFmk4JmcoZe01dDRH/eIRAwvh
	RfxKRg1LHN+BGTvH/kOo1X57aYYnJykeOOMGqDt0SSx0NncJlsGCr+VOc78hIUPzM0pXynKtpZv
	1box/iHY2BJ0utpFNlfQHUclHdCIw2w=
X-Received: by 2002:a17:907:e153:b0:c12:e178:9e84 with SMTP id
 a640c23a62f3a-c15ce105e4fmr233958066b.49.1783600294225; Thu, 09 Jul 2026
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-1-alim.akhtar@samsung.com> <20260627171228.2687857-2-alim.akhtar@samsung.com>
In-Reply-To: <20260627171228.2687857-2-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 13:31:19 +0100
X-Gm-Features: AUfX_mxCKOFC11f8Hhbav9vKUyI4ziXGCV1o3lFI4ikoQtGzaYsKy-SJPukLiaE
Message-ID: <CADrjBPoERcP+G_wqCUx2=3cbwniqiBqrtBAUuSxwBbisJWqQ9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
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
	TAGGED_FROM(0.00)[bounces-39736-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5810973106E

On Sat, 27 Jun 2026 at 17:54, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add Samsung Exynos8855 smdk board to documentation
>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 753b3ba1b607..273464400477 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -235,6 +235,12 @@ properties:
>                - winlink,e850-96                 # WinLink E850-96
>            - const: samsung,exynos850
>
> +      - description: Exynos8855 based boards
> +        items:
> +          - enum:
> +              - samsung,exynos8855-smdk         # Samsung SMDK
> +          - const: samsung,exynos8855
> +
>        - description: Exynos8895 based boards
>          items:
>            - enum:
> --
> 2.34.1
>

