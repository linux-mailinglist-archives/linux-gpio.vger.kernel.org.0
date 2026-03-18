Return-Path: <linux-gpio+bounces-33774-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBqCFV0Yu2k+fAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33774-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 22:25:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E82C2F5A
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 22:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD9030C3D87
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 21:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CB737D105;
	Wed, 18 Mar 2026 21:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Re2OHwjP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7742066F7
	for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 21:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869141; cv=pass; b=oS0zhYNjKyinS4yQP79MhQB+7iHX4hAZ+5JBXUnJ0GNTCnwUgHV6yzL+6Nma4jw6b94j3+RYvTcbq9CFsltY8/S56JaMBm+3Cwkdtzh/t7NtbZw9t5xUZko3KSpXdxGQP7HS4lJjPRGh1baJqeKunvFNeaL/MDbmClCKoafJ63c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869141; c=relaxed/simple;
	bh=EQzldedRTpvLua9RqcprZmThFLsNIvG4JO/73zahzZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GzvGPvh1jbtOI9c5qVm8RrV5lwtlwVoJPnaWnh6DySqslcaWbbJaRComx54cCh1OIkAWVMmDb4ST6GkM9tb38zotlunXsb+U6ITXBYM/K13ptomB9J4znJ+k/JS9Lf4sjhdwEBwWC7kUgKUebr1VLKsyP9A8ZrdLB4hDDClpcN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Re2OHwjP; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8d7f22d405so44194366b.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 14:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773869139; cv=none;
        d=google.com; s=arc-20240605;
        b=fycjwsPHAxUwV5jws6dr8wYuNqrjiAanu/ODDea7ONBYkKwlfBkwv4LqtLbWLueLpp
         ARlJD5V5j7lTuW4VOOiVtWxyW89lhpAdpEuC+p5NGxaQ9dVtpw4WbJF0YfbHnmUkTquK
         isRDBhFbRCHfQYpAJuO/rrUU1D5rauj8Rcfz+p8biHFeRfAQWJj1lHzYWm8GhjjdWCrR
         ZKK1ZdMgswa483JwDrjfT5grBcdruB++aa+gqdZK/WSENqmB3NFgpO5oINAsugA3c09K
         1/1BTpCgt0MCHFVm5/E/U7QeXC5Mx8gperUjFe74zVDAB186fieUuC0uOCF0znCzfMw0
         WYmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        fh=42a3ydt7AZ6/mcbKPtChXZrDok11guottv+f0pFk3/Y=;
        b=fkgtrnb5dQ11sgUIa4xL06KinZ50NdPIkgCsrJb91Kn4nfexxYOYQnPdR9avpvUvhk
         jFVG+B0qPNLUbZGOo/x8QVHvEHLvh0Pm76ijMXgBiVt9Hie4wl0m8heuFNq2cqFbXaH/
         uQYkTiv2zhcHPbIUGyCsr2Pu9/lS3efASitwtVro5BLhBF+9M9hdE/jk8Ffy50q2CAS5
         a+nRNV4Ufiz2HedsyI88iDcFvtEKpV+wuJPcN7wrYVGDc7VZtvabmCrp9ZH5FkfCOhTj
         IhtlS4TPRAqTMKEuAgCZz207ORE4v0TLK8ULEVVx5hYDaBAviGIBbMOOkhCVCwE4x43i
         1cDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773869139; x=1774473939; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        b=Re2OHwjPI/wDcppVPDTGr/Fitxq6TGT4tDY56to6JnJhMTzzYCnafDK2PCKKqDSUhn
         BsEOrJGmt853phtdlbowPRteBqyNBP2j/wLp2BNDngQ8Hr+WDtb0lfJTnLWr8J3xSMFv
         M6J6232/9vpMujn96uwoXZjGFD0Mvgz7BE8MN6bSibhrvytfifEJT/eGz63qWwHHuLYi
         YrUA0/dWuACmf31FnFD1Na/MNCDQ7gFYhTyFqTPVoSiNmt6c6Qpp7TClWNTea3UMaECd
         rWXoYYF793tZZfc3i3TgpUr5JwMODjualvrvBQTo5Fyfgcc+6nUn9WM3fkL17AaQ+Md5
         i19g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773869139; x=1774473939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6f1m8W1umobQ+ktMqqvSwqw9J/2mgt2skFeEG9RxsI=;
        b=aML0AFPmDPl0/qNH/AgrWTON+u8zVskv0ep6BgnL5Y6iAlMSURRJrjAxhS6NqRnSDd
         jpe2IT8N6+QtaV+OfAioiW1zPIlU3T7W4BFHDMVcnJJVelb4AXKmqqt5t560E/NOV3Mm
         1tFmlX6AN6PSBYJMhTKzeUDt9h+PfCl1HjI6DZCunKMqMKKImJ/Y6PPAjjGID65pR5Xo
         lccehdGgvVPZJk4q3MIxSRqRADPHk2eKC9O9zu+rJk77UM63TbrDv/kNzyqSAwummQiL
         lg44G9oDpn7WhEL7u05ry55QLsbNXuDBpVXoSvQYhJbnlIob2qC2n+BMRPcUge1oTlPr
         YOEA==
X-Forwarded-Encrypted: i=1; AJvYcCVpnATkkGcFT4FaqMl8H5BJ4EU9cxnWiXINBsyu48Wed5mV3K08W46wzKQDm9boVKEhusBHkfFKqwHQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/tYuZ1VE/eZFQn53i/hPbmUpm/zD8R7AkMGIs9t6vwXJpm3l+
	SMe+REmczkTlEkcUHg81s75/LN/WV2OtRAgMPFNedUnXjC5QOScCgdNGhDcSex2cNFFAutpOijQ
	E6q34dOcWVPxSkkQOoV+w6tu+8asZu9Q=
X-Gm-Gg: ATEYQzyd3xJDJA55DJHzSbujP8ZwLaFH3i7tKgrA57mnaGfm66tkHt8ii2gFnHAakeJ
	G45XQ2ndQ3+cc4RFt2O7ATGhoBlXWihMGzmU+BXe2a51jytYBrtojz1KevN4ppxzZFpWk7BpGVU
	MKxl15+5Rh6SPwdW8p6c+lq3AsfUtEs2mqt5XCzLFSw6V6UMZB7vOOROb0JrBVa5lyl6P3ZY1Gc
	v90drvety1MjzLQCrKZAmHSeYreWeife2qEAbHx4BiI609VL5BmGqGrl16SEbM4TVRTbmuj3udA
	9bSrBQ==
X-Received: by 2002:a17:906:99c5:b0:b93:9407:ea5c with SMTP id
 a640c23a62f3a-b97f4b70e51mr342818966b.57.1773869138582; Wed, 18 Mar 2026
 14:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
 <20260318-nickel-serval-of-tolerance-621bad@quoll>
In-Reply-To: <20260318-nickel-serval-of-tolerance-621bad@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Mar 2026 22:25:26 +0100
X-Gm-Features: AaiRm51yI9RGCvrRh7GVNMdJwfVjHSZ_bJ1ljw9KDUXHaZfxU7GvIWfUsRzyb80
Message-ID: <CAORyz2Laoo4EiLcHZ-ygLiFGW_h8qV7QxqNsMbueM=nov5zH0A@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33774-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.823];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD9E82C2F5A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il giorno mer 18 mar 2026 alle ore 08:43 Krzysztof Kozlowski
<krzk@kernel.org> ha scritto:

> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> You already received this feedback from Mark.

I am sorry I missed these. I will revise all of them in the next version.

> > +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
[...]
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: mediatek,mt6392-regulator
>
> Drop compatible. Regulator nodes do not have compatibles.

Thanks for this comment. It took me a while to understand what you
meant as most of the MediaTek PMIC regulator drivers still require the
compatible node to probe, including MT6397 that was the template for
this patch. I compared the driver to MT6359 that does not use it and I
am now working on the driver to not rely on it.

> With this, you can also drop example as it won't be used.

Just to be sure - do you mean remove the compatible attribute from the
example, or the whole example section?

> > +
> > +patternProperties:
> > +  "^(buck_)?v(core|proc|sys)$":
>
> Nope, underscores are not allowed. Use only hyphens.

Got it. I will actually completely remove the (buck_|ldo_) prefix
altogether as suggested in another comment.

> > +  "^(ldo_)?v(adc18|camio|cn18|io18)$":
> > +    description: LDOs with fixed 1.8V output
>
> If fixed, then encode it in the schema - min/max microvolt.

If possible I'd like some clarification here. According to Chen-Yu
Tsai comment [1], dtsi shouldn't contain voltage constraints. The way
I understood this is that electrical constraints are a matter of the
actual board layout, so if adjustments are needed they have to be in
the board dts. But you also specify "If fixed", so maybe there's an
exception to this rule when the constraint is "absolute" and boards
can't actually set a different value?

[1] https://lore.kernel.org/linux-mediatek/28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com/T/#mb1473bb5515f3e5a1bb3ff20c717b387c42373ef

Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

