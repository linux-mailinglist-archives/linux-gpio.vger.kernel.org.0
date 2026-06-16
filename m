Return-Path: <linux-gpio+bounces-38594-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NQYAA1tuMWqcjAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38594-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 17:40:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19B69142B
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 17:40:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Onak4tcL;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38594-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38594-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 425C731F6B6F
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Jun 2026 15:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13B2644CAC1;
	Tue, 16 Jun 2026 15:32:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5371A682B
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 15:32:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781623977; cv=pass; b=NIBAw59EhDhQ5oJ4xfEbA95vdXmc+a1VIdBQeUvks/Mzv0ER0BPw6mj+nxfmyod9DTWFvs8lCDXvVdhHBKc7BZogFKIjHGIfY91vIsevjCXI65SVuwvnZucLFggZ+AckRGBoi7zMZ9ddOx6AJS7AN+y8ftXzSjJBhnof8fbkObw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781623977; c=relaxed/simple;
	bh=9ryEeEKN34qoxZ5iOwtkmdOLrQqqwl0md2Lu6yLAkww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZuvRuqqpxDvzpxnECpy1DrFhGR+Mul5gIP87mo3HhLBCpknLQ2vV8FafqDRXj6BNZq1vxO9DfqSBKVwJqbM0EyVSegBhPvDZjjXjVbUJXzKAXLRyh1ZlnVz0P31UFa5iC3wBEv16XLk/ZZR7b7DLcF8reW4G2c2o6UoqT/3O604=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Onak4tcL; arc=pass smtp.client-ip=209.85.208.49
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so8003846a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 08:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781623975; cv=none;
        d=google.com; s=arc-20240605;
        b=RGgXGMFH3wvuKM6Oduqd4OCy4RBcMUA00XOYG0QneCT9sW375gwCgQMZTmKl284uA+
         j+RZ9y7wByruGzAI4H9LudYgxh05MVd7QC7dnkTj8MvJycdopb2rpsbfoq0JxB7u4szb
         H5mD3YdW4Yl+bX5V6rwCVgNTj9awEKqWstN81ysFJ/y3GhPbg9nIux8qxXeZcDydC4Z5
         9GvC+EHx7eGYf0jB1vF4oZZ1PXvmZ8H9HjbOC4mhCsTb2IHpSb1LgRsQ51T30W4en8SB
         2iRXEBRpURsav3ag05+K0BTQORXblKD8qLIXffCdPsET8+ToVP+VHTRhTF/MlSW4Dd1r
         AiNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        fh=6AjcysqtCoJF014T7jGSO4TiBEIoDTzO6tNbYyAU8F0=;
        b=fFo4d7Z1ZgK0YUJClt/rEce11t66mYre+Kf8usjOstQXMqylBUguL5qxJb9SBV3Yan
         ROX7DJIgjj8zi78uF9rall92UvoSGxvatJUKUw3CtHAZXOkuFLPmR04nngIUAm6qnp4A
         Cekzd7kuGuV3sUpdcQsLq23J5ocRkR/mx3Pd2kWRmH8lmh8gJlIHDXK+sRs+RxlbXwRh
         Z0iA5cSDlt1aaCUeUHU4ePkZ1FubWmILawhGsscFn6+C3PYH2SVu1sYQ4cHwNmbJj9iU
         dxRaF1AFyNow76Dg1iLS0MPCfVYVYJRBZqKJxHBEUznfPGku2AppHz6bnMHjPsgNb0g7
         6ZwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623975; x=1782228775; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        b=Onak4tcL5vSFVX9zbAMb5EL2enSwZMolN7dPWdBSvZ1YfGpRrRAmfSvARvhFef6wof
         cC1Y57VJB8c+fnIbL1ggRxC/ShwE7AfDkiBBgip58TToDiFW3fA3wUAG661aMIgBZy5E
         SvYJygCDWsbciA7gnkRjAf0+6qbp5J+oDrUfJJ5CuV89vaDeClKgzEYShVIN39M5na9F
         MtV6ZOalGVHYMCzSzsjn8b7nV/wOPpSRMDIDsiqHMOOnPd5gw80xGoQ7oxiDqIn59UeP
         HaACvImgUJGUu0jZ1c9ookZx7k8MQ1W9qy14X226sVAmTI1chWtEuNtxtyZhbUXP+Wvc
         exyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623975; x=1782228775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        b=p6A60prHZaWmCyR4hvFgvNkOku6nWKaeoVYjb8ynW8JMin6VWGPBu29R23kUBKzpbb
         UwHZ4l6lvemTZ/Hxc39Z8Go33FGhQBMK4VaqbUUoZEoulQKKntw+TVOfCjXg0+OVCmcE
         lQSgbsh5t2e0NdwX4cuxiXXU3eAcyKfySQvdLvW/96z79QmZCrE4mkQqtiuNpHYeDm85
         HBkmrGsxmEcr9E+hY3xv+PvLpm28iDYxOiJmxy6vPxKmSL3LGUT2sThbmLj1UmtZ79T7
         o20ggErMc9l6LZwKKZCijQvVNXpoy2ReWfugB3e+sra6aB9JvWigi34se/8V6MGAxBwH
         LBTg==
X-Forwarded-Encrypted: i=1; AFNElJ9op1y8Vg7u1x/1gD1v4+orHxmtSwHeCMYsL5oHgkpBLWbbp6Bb4B6lXde4Oi5gxl7gAFvHYy4wuX+p@vger.kernel.org
X-Gm-Message-State: AOJu0YyERq/u1A87iUPUjWKtQQgr2KRqjdVAWmqHgsNClqD7+Ymk7NdC
	d81tu8KI3IVnitihTlXrUWqVYs6f5POUxoXBnoP+gdOY9xv+3/XIc7VlY5QpvdLFSpbmI26KBNe
	8OOetA8GXs894yu+CYs9lU+ngFEtpixU=
X-Gm-Gg: Acq92OFOcBsk27zdhcUL4IXozPghE+fm02hXF2psdVqVAxQOQHzZiV0zugB41KD6df9
	A4BuI2A4ET/ELhQilwifwF7XH8cwxjgQlOyeBTJXrdqqkpYdq4bPq/hy3Aeu99c4gy4bSR4Phd3
	jYuspdo1/wT40ghj12m2AdhyXWxVR7Akp0nZz2Pn4o6ha7Z5zyR89UNtsRf7fwbDcnsM9JhFITX
	8kiOIuEqyIwRWZ9GeSntPDwmBMwgnH12I4Fxe0TmgrhfzxXk/5sFELLnY1AiGjnZLsGbpMRVKQ1
	5Wq58g==
X-Received: by 2002:a05:6402:3488:b0:68a:c8c8:bf70 with SMTP id
 4fb4d7f45d1cf-6950875d069mr2423072a12.26.1781623973864; Tue, 16 Jun 2026
 08:32:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615071836.362883-1-l.scorcia@gmail.com> <20260615071836.362883-10-l.scorcia@gmail.com>
 <20260616133918.GA2335264-robh@kernel.org>
In-Reply-To: <20260616133918.GA2335264-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 16 Jun 2026 17:32:43 +0200
X-Gm-Features: AVVi8CcxGgSJDcwyWDi8AM7eUTYUD6802ufCx2_1yb4EtV-skFio6HexhMd5f18
Message-ID: <CAORyz2LiMHnaTK6QnsLxJDtw0fZ_N9LELw0iCorOZwHuWXus0g@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38594-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:linux-mediatek@lists.infradead.org,m:val@packett.cool,m:dmitry.torokhov@gmail.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sen.chu@mediatek.com,m:sean.wang@mediatek.com,m:macpaul.lin@mediatek.com,m:lee@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:linusw@kernel.org,m:louisalexis.eyraud@collabora.com,m:julien.massot@collabora.com,m:parent.f@gmail.com,m:akkun11.open@gmail.com,m:chen.zhong@mediatek.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:parentf@gmail.com,m:akkun11open@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,packett.cool,gmail.com,kernel.org,mediatek.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F19B69142B

> >  arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++++
>
> Nothing is using this so it is a dead file that doesn't get tested.

Hi, it's not referenced as the dtsi inclusion was removed in the
original patch from 2019 for an easier merging of support for mt8516
pumpkin boards [1][2].
If you prefer in the next revision I can add another patch to readd it
to the existing pumpkin board.

I am working on a few boards with MT8167 (Xiaomi Mi Smart Clock,
Lenovo Smart Clock 2, Sony Playstation Classic) that reference it and
these have been used to test it locally too.

[1] https://lore.kernel.org/linux-mediatek/20190323211612.860-25-fparent@baylibre.com/
[2] https://lore.kernel.org/linux-mediatek/20200229170401.1287324-2-fparent@baylibre.com/

Thank you
Luca

