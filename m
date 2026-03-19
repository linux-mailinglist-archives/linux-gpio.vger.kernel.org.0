Return-Path: <linux-gpio+bounces-33787-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNs9Ly6Cu2mOlAIAu9opvQ
	(envelope-from <linux-gpio+bounces-33787-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:57:18 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EB12C6133
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 05:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE05C3017A9C
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Mar 2026 04:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6B536920E;
	Thu, 19 Mar 2026 04:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c5cW3sJa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4284F2D7814
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 04:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773896227; cv=pass; b=FtC7l/Vv+Qaw2+5qZcsUDmAvwDF+30WGLe9CLZh3ifj/Ck9wOvD/I3DAoMCMqlRgtMj2KJTxP7N0uvzp4LDmePvMOKgPoYCLMUQL63DvdFRj1UzYeV7c6ZSRiXOcDW78RRn2PrkL8Nn+idFHJb0VJ7Fnd4aV4JyPcgLof32468Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773896227; c=relaxed/simple;
	bh=RJ3zkOU7L58sRoFvbytTBsvFQBnd1tM3hTUu3UJnWbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQjpQZ0grPG6FCugBu7ebE6tu68CmPOHB5JNSxZ9e0n/uGDdMfIhH+7IhilIOHlbjOPp7s547h4g+mjyhDiTPTeIH6EXMVvEazJbvW20/L7/H5GtpMTbzhhzFYIHyvPE/E6i1AglwreoNpRXWjR/Wl4/ggWR6pu5bbXOcX9qKbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c5cW3sJa; arc=pass smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a278e0f7f6so701631e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2026 21:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896223; cv=none;
        d=google.com; s=arc-20240605;
        b=ACIYUXiJsiZc5Ir14pO9bn0CYJp9wNoKpHixWb7d9FMh2WEy40W6HdpFyxp6tExRdh
         rp1QDj7SNywRXDqvNRN/z7MjsG/6cAc9AzWs+w/dwoPbR3F29o5vvlSo6Wcr5u4wORsk
         4ISAnM28OvHi369xQtZbHvlNqXNNqlZvfeEJZ6rAvGVxMUMT/amy1HKWnePQFvZhoLuF
         ZBh8uZBiUwz0PPih6jr2wk3XJXizlkABSLQSNPXUxXin+lfXayGUKEutFCkQAunBqVlY
         q/bqXLj69DeaPCi1RaCSgITbovpVNP4eJ+HpgaDserRIEJAO2TenIN6s/pL4gLqO0XAD
         +zDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        fh=/zqGKSPuCWa8geMCuEm79xAYlCTz4wVQZYhXWFuB/fA=;
        b=IoohchPiVQceaosKbUVdMETZ8fofg0PtEdSW7QNO7G87O4OtPpTw670wxHfqlmOYiZ
         c3w5xxbAa9LhraHUSp3oooY+4pWI4RMY5n8QvCImmbsJOJkp8ywOXFphWnmo81ffH2yv
         NEQHPx7Zgs4/pOJIKcgvdgZaOBOY9oUfImvBedV1v8QXWISb9r04L8N5uVA3e5TM/QTo
         FGopIKwybPc6Y+5f/666LSgbeM5jnLwbO4dFoImy8mg/LPbLTg0JC8Hn3WY0qt0l8LeZ
         +H7+g3fo1czoePafmCLQYDVjNgQDoObE6vG1fkqSJRT5ZmwKwCvW/rEgUOiU5zTm43NR
         S2sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896223; x=1774501023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        b=c5cW3sJap+sGtxnrhL3MefVSVt+9F1u6gmHQ7cPndo0veI049W9uS4/57N0ivvWF+M
         OlIh1AyxOkI50DGrbjl28V7X+2kaxXSaAuwpZL+46FIwvRdLOzvs6f1yEiL98ZE84jiJ
         UN4ceoFLzm8NvOP2yD0hwEKGqQngNx6q2b5sA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896223; x=1774501023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        b=arwQ6ZonT1Cx39ka45Rh42cRAPDg0GXaF2WP2hLoAQ5RtSYcH8/VuoPBITzYoxIQt0
         b6WxkpIDC+9t1/KRPl6uKIbG8uRiYSIZujfLavZdynrb4BIcir9tl3poHauC+91P1Rei
         6sCOMA80MNfmUXP8rF+TNkTH43hxISgyCXQrZgdd8exMSVbgDm/2+AGqBYl0AXcXjzhx
         f9N0Cd0UKwHnIHYKj8lEXfD+QJ39V4jQGHnxnMZ15+U0Sz//byOS0EvAJGozOa/hGBac
         JElPpMZHVhhY8VjodoiUhxIVuIN7MceRDGvLezlnd3fIvQ7vZFF3yHm+uUBw3Z/9GcYX
         aOjg==
X-Forwarded-Encrypted: i=1; AJvYcCXMOJ5qQzutOmiWkDE7A41oLgjsDodQwIPwYAAbi3awF71xb7EBSzCoBaxG/ddGrgG8RDZtKi3E1byy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw743dsPNHgK+pIJFHksK69gnQK/cXhjDKYZGIv+u84eaF0FYWh
	2f48VXmqrVbZA9dpdIspBgue4te48XqNABhYGjQa4kf6Ba9726ykQLlZxhM+VCH3N+xpi6s3We/
	zTm1pjpGzKZSujyfzDZsb9KOymrydQ8S8Hi/P+IIO
X-Gm-Gg: ATEYQzxOH5ea8bYIJ/L1NmwfsKzJiQ+vFaFkOfk9XqeWCdS0gydmsAHbZSwC1unetJZ
	J9ERYGVSpIQr64bYDRD8Usv1iTYsKAlCk8QhY+WnJtAZxgK1eCghQvIKLpcRnSOhbjk3y3BaG/0
	l9AIipieWR8iFKkmh5aks1q7R5hWbqEW0K6jB5V/8Jfa4zp+dapjUtZt9qvNwhBE9CF2yzX6APY
	A9cJAzp3NpHThFy5P7Z4+fa+MmUDTEMwPgByLw9KUUftk1YxE+FR8QskWNq/UcMBL++NFTeuPOu
	N+a6cT4L7GgJsmSQVKaPO7Er76c8dUqJnHXlRw==
X-Received: by 2002:a05:6512:1598:b0:5a1:3561:de7d with SMTP id
 2adb3069b0e04-5a2796bae61mr2319165e87.41.1773896223417; Wed, 18 Mar 2026
 21:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
In-Reply-To: <20260317184507.523060-4-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 12:56:52 +0800
X-Gm-Features: AaiRm53ZcC1_5GBB68m3xy0r3oGl-8GEHHuCoUTvKM9klv1nQiqkqQTd8EeYleI
Message-ID: <CAGXv+5Hz6JHBTX1ftxRuD0pJuhxGJnAkGUO7=kUh3fErOLtXTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33787-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wenst@chromium.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,chromium.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: C3EB12C6133
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 2:46=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     |  24 ++
>  2 files changed, 342 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,=
mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulat=
or.h
>
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-=
regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt639=
2-regulator.yaml
> new file mode 100644
> index 000000000000..fa4aad2dcbe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulat=
or.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 Regulator
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device n=
ode.
> +  All voltage regulators provided by the PMIC are described as sub-nodes=
 of
> +  this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6392-regulator

Please add the various supply rails. This allows you to properly describe
regulator dependencies and have a complete power supply tree.

They can be found in the datasheet.


ChenYu

