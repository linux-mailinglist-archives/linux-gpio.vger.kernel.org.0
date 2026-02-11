Return-Path: <linux-gpio+bounces-31578-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDXbCYX6i2njeAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31578-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 04:41:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 962251210C7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 04:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 704B3305C3D0
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Feb 2026 03:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEDC1DED63;
	Wed, 11 Feb 2026 03:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qsgs8ycv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EDE17ADE0
	for <linux-gpio@vger.kernel.org>; Wed, 11 Feb 2026 03:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770780971; cv=none; b=g1ic/6onsG/o99FrNdcNlXKz+lqVFKICx/ZSnTttqUxHTakhNDiu9qElALiB8G9b4gnmkNOwiE8lDQ6bGJn8uDpDgyaFDpl2jvdiioQ9sBZFVXCWxtpcxMWuChW6XFgDg1jvBnS+5GiKWIzv+SHArWLgTAgYf7t5j3rPh6UBUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770780971; c=relaxed/simple;
	bh=Vwf6MwPNxwf5qH9YPjWuQA3HO9ZAlpcmhn5ASXwPvWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQv+SNn9Tteh+31oWVFi/69Bc4Lb/QhVlIoIOjhbAlll4Z2LdyAcpKM6L4pElCtwOg6Oj1NtQvvqlL5LrUzt+PN0KpWcd12pHgUVRY9RDvPs105Qb5yFF4B/h/QUdUJrQIfj+ppMTxfN3phkmq5cVtHLF9/mawbPa7nhu+/oZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qsgs8ycv; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35621da1a7dso1029696a91.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 19:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770780969; x=1771385769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6LkflCyXtk3W49ffamwBiKJAxUhYydXMVu3kci/fYZA=;
        b=Qsgs8ycvPs4AhxPj4kir1Y7rima4YTmku0N1sICZTTZfRkPZqGrBl9iEd21PvsBIu5
         mnxpxSUwzSmBfOkgweMB9AX4QE2MjhIG+ptomuV/kegEjyYKXTgimiKlDGsX3lS4vvdk
         o+PQNy/eVl63biTmI1XMlzAKKQAzsY4bUkB/b4noLRUlEx/mIrDHntHGUM8nffQAC/Xy
         sJGdPquULXW73CQuPxt4luXy/HzmwpQNsp6stfw3XrVQ5jHUmURAlIMNOTKZSCxKMBid
         EygXpKgEqz5VXzojck+SvkgwAvKgbruHnGmXv8tjYBEdo5NJMLygzBNWQFlvEwcKnCv9
         K7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770780969; x=1771385769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LkflCyXtk3W49ffamwBiKJAxUhYydXMVu3kci/fYZA=;
        b=deQioehcu10gYs+mLBlKUlfjfpPZJ7VidSo3zNgcLMRpzCLin7MIQHq47npe+BI2kg
         nLTF3XOGHhN90l8xj0jju2WCDV22Pb9cVCD6yRaE/GGTipB9yU9SwpkF+eA4c5nxHzXM
         JiQiIWvNgGRxIziCNh8AB/lyA5mIQRJXStpGg9X69kewhaiAsdJvhvJZGRR1K2gJoJ1U
         gh/U5dHAERH7+2DfADbqBkg/P9H7LjMIgI4txdCiZScP+u0zfCITrY4PHIvki21PdI13
         q+RgPVCI3Ew8Vfz8cV+lHr+3B9rhSxOCojRHrFrs0fwus5ATN53WNdDLi3jxOb/PEQUQ
         bU3w==
X-Forwarded-Encrypted: i=1; AJvYcCXaBdpHmmiiM3Yp64u8oLcmZzenODbG4feQFqYKIJRoxcM487De0qvXshA9aPaR14Mdk/u67LTSFRVw@vger.kernel.org
X-Gm-Message-State: AOJu0YwL52T5WgwoHbiWmX8xov5JQsuySWkyc0AtKXGG5mdphqhfTr2i
	RrrwpgftRvARDt95WJLP9EkItI9u2uOUg/lfSo+0YE0yK4Yw8FYyjN0x4Btl1Q==
X-Gm-Gg: AZuq6aL5fwEKdZq6B60C9BzprAWSsikKjLvmzNWaHy5qFLr0A2QQrG2KaqVB+3//rqx
	lw8aMemOHeLGRlY3ponRY0BuxgCM9QkGzLJPIaWK2kofREVviVN+xjQZ2ATw3lPnyEftBceRRHt
	T4OFZ8q+oapUMdAm+PHu2gRDbO0HhyOWjkENi98VBC/UCBq3DR4h7czjmIu/S6RCxfQkmpFK/m5
	csDIF5/rEDZtr3EnWBCjYXOeF/KHsXl/cNK4KTCCQrGN9XjNufbR5GSSb5gww7KEB54Yq6S+nqd
	j3MZqal+Q/+uxWqesZV2bDiRW870XjJPsrR1Fj3YhblYhD3Qcd8OBl1/U5sxHUjQHgwM4DXJJDg
	w843Fpke/QDGa4SKpBVRcL5fdSFz/nBIxEmuUio7KjXtjp0wU2Q4+7GkuTfplNre4q84P9rwjyd
	ias3HqK8jKxrOEIFKEvOb8wOHJjWaT7RT4icpWyBNAp+bYNxktlqYpuD1URvkYstFS03U5remsf
	V3uPyk8d0Bha0Y=
X-Received: by 2002:a05:620a:28d6:b0:8c6:ca30:fbe9 with SMTP id af79cd13be357-8caeeb510dcmr2216238785a.15.1770775325833;
        Tue, 10 Feb 2026 18:02:05 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc2d5sm11981085a.10.2026.02.10.18.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:05 -0800 (PST)
Date: Tue, 10 Feb 2026 21:02:42 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: qcom: Add SDM670 LPI pinctrl
Message-ID: <aYvjQjnBk9B5usOk@rdacayan>
References: <20260210021109.11906-1-mailingradian@gmail.com>
 <20260210021109.11906-2-mailingradian@gmail.com>
 <4f89cc2a-6e30-4ee3-bb95-f2df25b5b88f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f89cc2a-6e30-4ee3-bb95-f2df25b5b88f@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31578-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 962251210C7
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 08:41:32AM +0100, Krzysztof Kozlowski wrote:
> On 10/02/2026 03:11, Richard Acayan wrote:
> > Add the pin controller for the audio Low-Power Island (LPI) on SDM670.
> 
> Subject: Missing "LPASS" before LPI. I really thought you just add TLMM...

Added, but does this extend to the other patches as well?

> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  .../qcom,sdm670-lpass-lpi-pinctrl.yaml        | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..125f365d11fa
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SDM670 SoC LPASS LPI TLMM
> > +
> > +maintainers:
> > +  - Richard Acayan <mailingradian@gmail.com>
> > +
> > +description:
> > +  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
> > +  (LPASS) Low Power Island (LPI) of Qualcomm SDM670 SoC.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sdm670-lpass-lpi-pinctrl
> > +
> > +  reg:
> > +    items:
> > +      - description: LPASS LPI TLMM Control and Status registers
> > +
> 
> Hm, no clocks? In most designs there has to be HW macro or HW codec
> vote. I see SDM660 does not have it either, but I think this might be
> exactly the same mistake.

No clocks for the pin controller, unless the ADSP enables them on its own.

I see other clocks required for full sound support (including some
board-specific codecs), which are unrelated:
- INT_MCLK_0
- PRI_TDM_IBIT
- SEC_TDM_IBIT
- INT0_MI2S_IBIT
- INT3_MI2S_IBIT

