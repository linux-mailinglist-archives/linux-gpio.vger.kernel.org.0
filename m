Return-Path: <linux-gpio+bounces-39735-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IDvdHZWVT2rKkAIAu9opvQ
	(envelope-from <linux-gpio+bounces-39735-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 14:35:33 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD873109F
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Jul 2026 14:35:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b="VkQOnhR/";
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39735-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39735-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F5D230A6B19
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2026 12:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B7B421EE4;
	Thu,  9 Jul 2026 12:29:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99C8421F17
	for <linux-gpio@vger.kernel.org>; Thu,  9 Jul 2026 12:29:49 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600191; cv=pass; b=lLmEgAZui5l+sNWh6gfNcEL4sihMAC3WltwUkVAf6R2X1R4jLwzgWQkx1uTQRXWi9d8S/kPAlrfWAodKHA2EVUH43Abj5ZynY9vLiObD7Afnc1m14FrRtDjM+24Wrmfp23KI2xpvQx5d5mVZioVw7voB78lVLkXqrP0+Dqn7TAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600191; c=relaxed/simple;
	bh=G0PslGe3kpFCA+8uA25BtvnVDVTOwMzK2ZCHyS7DQRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iCr9kU2fcmVCWzCerZwUNDfuEP5Up0CjaE2ngJ64l2Zaw/b+5g24qgDkhR7f9dwtc+FX+HZsPfEdi1mcaSIOr5jXQDHy2Nvy/ctAY/ZzVlHz1jtWqlR5MMzGyFbPPtu0pLYMC1xAoWIvnHU6OMP6QapVrAoqueCRSFBAN81vPtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VkQOnhR/; arc=pass smtp.client-ip=209.85.208.43
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-693c51a8a19so1276370a12.3
        for <linux-gpio@vger.kernel.org>; Thu, 09 Jul 2026 05:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783600188; cv=none;
        d=google.com; s=arc-20260327;
        b=lv4Jgx9BhIJ1EDN32UocaeXL6+a6xudtC7gGuUctf/ICgd0Ht9dfsuGQl2+Zoi1QS1
         xVfzvsE+6NWesdYaz51HeTFPGhW4Pe6rTl7OgcZJ9KVt/Re+c4rpPDObzwYT8NU/c0+D
         ojb6JrzZpNYNjR1S9AOZefftvT/AqPsSsTqfsS9iLig2l46+Fgs3lcKNhmVxxprQLOw3
         aPsBDELZcRLb/CfVXno8l99pVcJGxOnF/UdyrQ/2TRtZN7ZQ98nAH96d8Nd7PcehDBJ2
         fF5SRbvrt8RllYAh+0U8tKJuFwHpb7pjMouTXr43Wsj3+ucxMMFRMaWsh12j8SdKBYeP
         YlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        fh=msXrqWYZiXSFKZJoBeUmHIlpyUG2ILzKP0qj9BeuIMA=;
        b=nzr5kEi96G+Pfi7em7dVBgHd5D6ItApBT8c7Vhw7oh6E/rW/uZj2iHH39lmtZ/RaZw
         peSTWEm3z4tTbvVZCI6+/1wLt4FP8oKdhYJOl9x2wSclHGF+nceXnmVGlA6Jx/2DYPFP
         vRJMtpnm8BnTcSMfUkonBPXqiYGa0qY8j6SggNyB9pET1LrNAVaNL29/klX13pmI3hwZ
         EBmGyDJBstYjFvTyexBAm6dbhHCsjhOvLIBd6NUrUD/K2UqRfvgfIfZTnc2Hs2mtYNvr
         CLK+hqPujbmrfA1gA52BhqsE/7v2pZtyOCOk/FFgm6HOzClhvPY19+eACj4hNJPiazTj
         byCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783600188; x=1784204988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        b=VkQOnhR/Ddqqw+wqT/cgWvKtcvTaxdqPtBeE34FXH54ESVC+TUiCOKcRczC6DJfC8Z
         xa7IxjSyjK4O6agALSuw5nGm/nx7pw5iqfJFyTdVW8vcsXKd7ymmi7s6nwF2r0zJtnur
         RniMKJRbgPWKjuYmXBe4Ya6hgylfzr8ssqvBRtPT9j5Nw/5xsQFkctGChmi9gdLSn3OJ
         M9ywrP0/EP64IMooBwbbluHgj67EAMykDDyiek0svAnuOx/mF/pSQeE2cMd4JYuf/6eO
         3/RKu+v62V49guG2P3Ah9JbWLuNM31qXW4SA61eCoFQxjs34g/sLXMHbf0aEqV4grSOf
         vBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783600188; x=1784204988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VMLchfcEUVirS3zhIYfhSQlUp1zsAwguNq8CHQGXS9c=;
        b=nyajaIFwvK5ws3zOUpBhrLcyZOHAeUKfx36kxLGmtcqL/blbg9zGdioelUnB+pDiGu
         s9pu9re5aZamkeRVkuOf9N6jNPZ33elD0pnDFats8yp9s5rzATSrrm/sGSv1RdoIklhG
         aSCmLtl4wViYgytyhIA4DvMgyHlCM2hHtYmKkxDLhO/8JC68jTbHzOcybr1VUVkiZbDZ
         a70hRlwQL9oieeooJsvmtKnNmA93OhhczYv1GW68KFr0fP9L3CzrteSAUmXaNVNn1tpt
         TP6FzyqZHgs84l8pcKhYL3NNszUb831rkCrtLPcVI5rXjikbK7g6VmiCF4Bu4cf/Amls
         A6XA==
X-Forwarded-Encrypted: i=1; AHgh+RrP4Cm5qS0mV4Sskh+YSF1FSsuZgKMh60y4PVihhz5zmty2LkRYOGHW6Aa4Xumnw1pyN7ijwuSXqh9L@vger.kernel.org
X-Gm-Message-State: AOJu0YzlJizj4E1XG84Ts6VvTQrToylySKlGdzLDrX9yNTcnWTrFrN2U
	Y7SJBm76Qjbf4dCKhEMgqIbdtEsqQUp+5XjWodDtiWpX9Vjo3+UZgh0CzTU3qhpJURH4VquIkWr
	tQwHzTj4JfmqRh6HVJILZ13ddM65YP5xgGTYA8UZFsg==
X-Gm-Gg: AfdE7ckm0tdyN3nbjxuZDdS0yQl65AP90S9UQyK/vu29tajPhKzah940nNBhGawsYWX
	SN5ujXixgNIZhAqjwXVSSvGXluhmrjxi+INH0/GohHt7WHdt7D90OrpXXoG5vYVRo1iyb8YwiJy
	a7BjNe5h9BbxNFnlYziU+FpkrE9ZJ6j2ELvXPtHyJxhvptUhF8egqBDzDlYlEAAGeFyI3u//ZcC
	FtPnXlW9a6XXTiTDnkSjYuY7ZdyIahRrLFVMjGVaXLRlTssqWYCwNbgbJJ0mZpbpTWnuqxxKdh7
	lD4PVvjXqBFvBJ+N7oeHzWMiq3QJ6W4=
X-Received: by 2002:a05:6402:3788:b0:698:3ce6:767f with SMTP id
 4fb4d7f45d1cf-69ab445dd6amr2888399a12.12.1783600187901; Thu, 09 Jul 2026
 05:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627171228.2687857-1-alim.akhtar@samsung.com>
 <CGME20260627165406epcas5p1be75af2010edfc57cad0f668a8e3568d@epcas5p1.samsung.com>
 <20260627171228.2687857-2-alim.akhtar@samsung.com> <4df9f388-2dc7-47b6-afc0-7a0cc6d15ca3@gmail.com>
 <08ba01dd0cf9$cbe0a4b0$63a1ee10$@samsung.com> <49883bf8-1c7d-4708-9d38-07767b6b229e@kernel.org>
In-Reply-To: <49883bf8-1c7d-4708-9d38-07767b6b229e@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 9 Jul 2026 13:29:36 +0100
X-Gm-Features: AUfX_mxLAIz9GenjSL4rKk7I5VYNpMJH1YlyVSe7GNzqspORApk7jhTGMyL-e6o
Message-ID: <CADrjBPq59s8A3Qp_RU_kabscafMZWUfEsGWNzKNxp0O1BSd4OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung Exynos8855
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
	robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
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
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-39735-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:ivo.ivanov.ivanov1@gmail.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:ivoivanovivanov1@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1CD873109F

Hi Alim / Ivaylo / Krysztof

On Mon, 6 Jul 2026 at 17:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 06/07/2026 05:44, Alim Akhtar wrote:
> > Hi Ivaylo,
> > Thanks for your review.
> >
> >> -----Original Message-----
> >> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> >> Sent: Monday, July 6, 2026 4:11 AM
> >> To: Alim Akhtar <alim.akhtar@samsung.com>; krzk@kernel.org;
> >> peter.griffin@linaro.org; robh@kernel.org; conor+dt@kernel.org;
> >> linusw@kernel.org
> >> Cc: linux-samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org;
> >> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org;
> >> hajun.sung@samsung.com
> >> Subject: Re: [PATCH v3 1/6] dt-binding: ARM: samsung: Add Samsung
> >> Exynos8855
> >>
> >> On 6/27/26 20:12, Alim Akhtar wrote:
> >>> Add Samsung Exynos8855 smdk board to documentation
> >>>
> >>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> >>> ---
> >>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> index 753b3ba1b607..273464400477 100644
> >>> ---
> >>> a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> >>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-
> >> boards.yam
> >>> +++ l
> >>> @@ -235,6 +235,12 @@ properties:
> >>>                - winlink,e850-96                 # WinLink E850-96
> >>>            - const: samsung,exynos850
> >>>
> >>> +      - description: Exynos8855 based boards
> >>> +        items:
> >>> +          - enum:
> >>> +              - samsung,exynos8855-smdk         # Samsung SMDK
> >>> +          - const: samsung,exynos8855
> >>
> >> Is there any particular reason for using "exynos8855" rather than the
> >> commercial name - exynos1580? We've already established using the latter
> >> naming scheme as a convention (e.g. exynos3830 -> exynos850, exynos9830 ->
> >> exynos990) rather than the development model numbers, so I don't think
> >> breaking that will help anyone with the already painful model number confusion.
> >>
> > The reason for using Exynos8855 is that it comes from the chip-id register, which is RO register.
> > And in my opinion it has to be chip-id, maintaining two names is confusing (as you also mentioned).
> > Yes, there were couple of deviation but let's come back to the "original" convention (which is to use chip-id).
> >
> > @ Krzysztof, Peter
> > Any input on this?
>
> Back in Exynos850 upstreaming, my preference was the chipid value, but I
> agreed for marketing name. Marketing names are tricky, because:
> 1. They change,
> 2. They might multiply (two or three marketing names for the same die -
> common case in Qualcomm),
>
> That's why for Samsung SoCs, I rather prefer chipid value. For
> Google/Axis/Tesla the case is different and we should use their naming -
> some engineering name for example.

Using the chip ID value for Samsung Exynos SoCs and an engineering
name for ASICs sounds like a good approach to me.

For gs101 I also tried to document the various names in
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/arm/google.yaml.

Peter

