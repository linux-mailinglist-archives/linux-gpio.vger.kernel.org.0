Return-Path: <linux-gpio+bounces-35370-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAdjIccX6WlpUQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35370-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 20:47:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D7449D84
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 20:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6A593076163
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Apr 2026 18:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2772DC357;
	Wed, 22 Apr 2026 18:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjpyRkox"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209581A704B
	for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883648; cv=pass; b=Kme4IKihER6HHH3+SxcSceEwXowPKdE1eTjDqga3evWOxYSjISs4bEbG5jUV/Vh+b6Bd78uiWeP+Me8gbguFN6vIgz57iJiChu3rbcGP08ggXK4jmEqKTFYiLI/Q/K23vgO1xyrE+g50UCRbdtf4VotBESh9EGwOKZ5d3GZj8ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883648; c=relaxed/simple;
	bh=koO1gTzJVerY/oBMbjuuST5CEbfWNHXW583XAUNa55Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAHPlApnLzr2AyArx1Q0Zw4J+O/juQTkSUP9er8ix5CNHnULJbCsIV52hZ9diSDvKqewzS+Jbr4D6vSdfBPkDgt/FUou1qDBGKX64M4v5NoTBzfULHrVvtXW/oaT0mUxhpPZ4ByfqJ+mSbkMSfzr5l4Mc8U5BlH4nkxpxG55uX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjpyRkox; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba545100a13so354396866b.2
        for <linux-gpio@vger.kernel.org>; Wed, 22 Apr 2026 11:47:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776883645; cv=none;
        d=google.com; s=arc-20240605;
        b=FWPXw8HiS2S9oiUJ2N3oNVqlLo5YVOvQgt9079XrRxFru81t3rAeNBYFJ+Y4Cjb9ST
         8aF44dqmW9FdftZwJms8y45zckP+k+ye7KT5XyFNFjwe1zUjVpzIFQr7kOeH+qOTuuKN
         Fv6vQOcm8lszTwgg3vq8+VYxYjtb4dSD9vgAOHOgSI/E0000fOqwVnrvjhs6TK69F4cA
         vFnNQYxwLQIvmalkgJsxlUa3XAumxKp1NDZQ2ax9v3SJCpoNIbO658wk6bNHXdfoj6Yq
         E5O3uQLo3YVigTcVDcAPLdnsy6MCei28I0RoaK7uuaEF9NNA8m0g0u37nowbQbKWSz9B
         tCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a4tbV3vnwAWI1orS7bjpXKGapwTuCv+wj00co1PEd0U=;
        fh=UcFZxoY6gWszHYKlBdwOZtuuL7+x2l1irkHLnE9uho0=;
        b=emJ9/RMY+PCbhO4/qSSmkOWWBZ2iZ5tgjZ8lISA2nRv4N6ks7IB9OhlOGMrcngaKKp
         yCdifHbBfHSoMcbsTQC+u+NPTiDaEfCRc+z6mH+xI5tgGfP65ca4c/7Yr2iRezG58ZiG
         R+rzzpOHZYpNpOZjvF9G9Lw3sXB4HFs8nJlBdnMjq17Kep9HjNTByTo//xLpV8UtUOQA
         Bv6M6sLtG+myAPXDvhB1hs7XHfpICzR+bzjwXpMTZWl2Xon9BgWne7/0tYaGL2BZvBlV
         FEb0OY67hd7bRcNQgnHsbsnAYU2MADCiUCY8zTUO/zrlrBRm2PRZHndZew+DIPaMLia2
         paBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776883645; x=1777488445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4tbV3vnwAWI1orS7bjpXKGapwTuCv+wj00co1PEd0U=;
        b=BjpyRkoxTEP7pMYuUq3XWTKQFJeerQ9pGmGo4Ns+SPEvAhZBepfcNw/5n2hUgamtnz
         fMMsYRoMwxFi7YlkSD2VJ3/JdAiNSWi4svOUYJ2BDWZXFYaFM0lInUolSYt23EN5PrHQ
         lCQlaJoZI1HF4j+kThPWs6AJCbuDuGUZ4XhiGorSGMsR5pi4HpoWvht4RsqoQaM/zbuz
         uTzxeYo9Re8ew8h0J1gadmA9TgVXOzeGticFkhmvO3+G1FYTgbRYOnagMz+L4MHbTKjH
         4k1jmx7/3SZXPehEaCzm7FO6omFFG4LedpGInmSpUx71tQvZFssKT8Hz4XZ5UtH9PN+x
         dQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883645; x=1777488445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a4tbV3vnwAWI1orS7bjpXKGapwTuCv+wj00co1PEd0U=;
        b=pFpyoW186yOda+b+IXIraUL9/4Zfxp54BRQpAuli9zb2T00R/t1548g36fx0Jz4BYw
         ci6DSY+dYf6hETX9GPNAn0m+TyTZtCKoGR0PP1iKHfMJeLkc4aSOfEXeWX8tgZUwqcrh
         7MYkdE2IrqQ3Nm9uRTd4uQi3Q3VMCkgW7K6BrM2yCbZeodAIsjPaVyuotPEWrorwBhsU
         mtTGq4cTWxZhOlUVowreIs9/wcjfoScDGo3wsxWzP/iU4i8gTxR0wsLZxiKqpeoK+DNf
         R347IrKwweEvjmOipf96wHVoKQJywNNldO1p1GvaVWtoP0yCPBEiCipVFCosviTpyhUV
         Kg+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9v4H5xYSjEd9y9+OR+Mrf7gq/mbpR+Cg9pj0Pqddq6hi+FAH5RVWcevGy2sgIbaHrPb/U6bN2l3Xr+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd28900Q3zEUMeqcGc770YRMwPFoUICuUnLZh3FrtuPskfK7w1
	lE+XSydqvTAFNpb0CTbgZ/yh56UM4KI2sKcPIm7gIpdBHaYveNm5wYzSAWdo1foWJG7+1dtQJfw
	a/SqRO0sPiL9Ve/+doSzrHKjuZGdmUKU=
X-Gm-Gg: AeBDiet+ow1gd8aYKT++qg/1SesaqyMIfc6W6m6SawVA3cJfE6Srg9T0VXKmAQGqu01
	CUci9xI8vPjT6vJeyDMLTaUvz7U3qre/iweiLIqkiJMaIOS6BPTimfFG4L09cWg3RwX2DYDZpNi
	LFXRdHY69QP31rnEbnY1hThsmYaEQIzPJmbYRD0LO9xjKpZ6HpdRCD/UsssUATK4it6+90tlCd/
	JDnkItp8NGFvOcmB/OvP+DubGHcxLOB5WIgwgcTFU24VLRXJo1f4EiEMz4SOsm48EVjRp3G0Uk9
	c/F5prFfkR2ouuXVv3HA
X-Received: by 2002:a17:907:3f12:b0:ba7:f5fd:ede0 with SMTP id
 a640c23a62f3a-ba7f5fdf234mr730503066b.6.1776883645234; Wed, 22 Apr 2026
 11:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD++jLnk_5KG_q1aCtpOrTCbhtK-FxXH6BhPFSwukyt2F4uxmQ@mail.gmail.com>
 <20260201111812.18945-1-jie.i.li@nokia.com>
In-Reply-To: <20260201111812.18945-1-jie.i.li@nokia.com>
From: =?UTF-8?B?5p2O5p2w?= <lj29312931@gmail.com>
Date: Wed, 22 Apr 2026 20:47:13 +0200
X-Gm-Features: AQROBzCdqKXfgmKgxFT-Yi_N4yfa0Tzd0YRSe3TdEhbBeGIcCvxPNLhWMlBLtbM
Message-ID: <CAO3NRJjHRoEpSE2YRCN3XFC+oF4w-heCfpQStKQEkgZhO61oxA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] i2c: improve bus recovery for single-ended GPIOs
To: wsa@kernel.org, linusw@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jie Li <jie.i.li@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35370-lists,linux-gpio=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lj29312931@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: E38D7449D84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Wolfram,

I'm just gently pinging this patch series to see if you have any
further comments or if it's ready to be picked up for the I2C tree.

This v3 series already includes the Reviewed-by tags from Linus
Walleij for both patches.

Thanks for your time!

Best regards,
Jie Li

On Sun, Feb 1, 2026 at 12:18=E2=80=AFPM Jie Li <lj29312931@gmail.com> wrote=
:
>
> Greetings,
>
> Apologies for the delay in responding.
>
> Thank you very much for your review and the specific guidance regarding
> the return types. I really appreciate your patience and time spent
> guiding me through my first contribution to the kernel.
>
> This series (v3) updates the helper function to use the 'bool' type as
> suggested and includes the Reviewed-by tags.
>
> This series addresses a limitation in the I2C bus recovery mechanism wher=
e
> certain open-drain GPIOs are incorrectly identified as input-only,
> preventing the recovery logic from functioning.
>
> Following the suggestion from Linus Walleij, this version drops the
> previously proposed "force-set-sda" DT property. Instead, it
> introduces a generic helper in the GPIO subsystem to identify
> single-ended configurations. This allows the I2C core to reliably
> enable recovery for open-drain lines regardless of the
> instantaneous hardware direction reporting.
>
> Changes in v3:
> - Patch 1:
>   - Changed return type of gpiod_is_single_ended() from int to bool.
>   - Updated return values from 0/1 to false/true.
>   - Added Reviewed-by: Linus Walleij.
> - Patch 2:
>   - Added Reviewed-by: Linus Walleij.
>
> Changes in v2:
> - Replaced DT-based "force-set-sda" with a gpiolib helper.
> - Added gpiod_is_single_ended() to drivers/gpio/gpiolib.c.
> - Updated i2c-core-base.c to use the new helper.
>
> Jie Li (2):
>   gpiolib: add gpiod_is_single_ended() helper
>   i2c: core: support recovery for single-ended GPIOs
>
>  drivers/gpio/gpiolib.c        | 22 ++++++++++++++++++++++
>  drivers/i2c/i2c-core-base.c   |  3 ++-
>  include/linux/gpio/consumer.h |  5 +++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> --
> 2.43.0
>

