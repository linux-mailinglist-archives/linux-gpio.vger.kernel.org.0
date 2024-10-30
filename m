Return-Path: <linux-gpio+bounces-12294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22759B5BBC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 07:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B3FDB228A4
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2024 06:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB5D1D1E85;
	Wed, 30 Oct 2024 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aibMDmx8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF6D63CB;
	Wed, 30 Oct 2024 06:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730270003; cv=none; b=sqoHm4p84qJbhPfRRpqYtuYvN7zqBhQ2/LBaXtCkdMeiSpnuw4Q2BVzfAUELHD3nqd0xH9YY+qkGU+yRGl9GsYM6ULSp6t9c1IKrW5m3pfhqxVbLw+8/d55wAycTkRru73L0QnRRzA5zLXhiBTO5dLFRhxScAY/DqoHj+g4Feso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730270003; c=relaxed/simple;
	bh=JkKmcioEchHN6SSzjPu+rsMYp/BSELwDzX0MuJ3+zZo=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BOeyrSa6wafiof1m8QHCnM02YCrinWAaEZ4elZQQz2NmkRX2TEOxDevnC/L22Q8Ct+bFJhsx5X9ICJ5E1HBhLnk8Xble0eVCqR8qdTgS7YHmS9b8WUB1lDcpTTVfBb9smroh7gVkTbL87PV0GRXizHl1M/2KUjc7NPWos0324sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aibMDmx8; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0c40849cso1025553666b.3;
        Tue, 29 Oct 2024 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730270000; x=1730874800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tQB2skrqNyBBtXr9NvGq3k5U2F5Farr1AhF3+r/DnZY=;
        b=aibMDmx8YdW19MXdaR+LgkV+trkjCxP4Nno88xv1Jfbo5t6INgQXkK3kwux7z6waCX
         ioVi8YbuaZET0u37uIIG0FooGqu71SyBmKIqW9FN9uPWV/eADFu6sboLx56OPFj45Cxb
         tD6Bt0HF+4o4GjljgSDoig6RDU7f1CvW/gasR4INrp2g0oFRMVLNMQPuW1oZY5VFiVlx
         dnpTq+ScGDncDvd4zQGeB72kubddxgtnjuC1n7v3KSNqB3aJHEF1D+l1pmfvTZEZBig1
         IwKTbmuUaFvzw/0OwxZt4YprgHTq6puYxNgHZcb7OgUmO7uB4lrsxpWMfEfkuZzpDo3w
         EpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730270000; x=1730874800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:cc:to:subject:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tQB2skrqNyBBtXr9NvGq3k5U2F5Farr1AhF3+r/DnZY=;
        b=ws/y2dZJHjYXXcByaEdS93P/lTtXWbZAH5rJ+gO7V3Feq2H4iHXVe/tD5eDL7ACx1K
         tGceIr0lJq5OhhcRJ1VM9vhhr9Os6+JB2DrlLKsde0Ol7HgylDd9qOMP6K07lL2FA5zC
         +0H6I5SvGYMZqZ086dlam1ucDK1REvZ761zaesVImw8KrUmI7Bg21kKTY0EiTWdUn681
         PQkxOGsDe6N75VgrSk3n1N/2h6hRE36Odu8AhQp7uE5Qs4qeReRCygotSEzhfqQ0iucp
         1iXzeilLVSDe+9pn6SkDHMgfpTTqrIGsQ5xzxnOz3FcEEkYo05TAnEc/ASWo95G638Sx
         1KFA==
X-Forwarded-Encrypted: i=1; AJvYcCVqezj/AoPg21rnYyGAR/M3VDsu5zMdI/w3dpPLvSPsyKrw7Ln5HDT+VrXbImulJOd9Hto6uN16teSrc6r2@vger.kernel.org, AJvYcCXBlA9CBUlKA4QcrFD1s9+UKzz0sq2geQI6Gmn/9q5aunpOiDox4enMHZ5Xo6uWM5Ppb17zK1cchn3bUA==@vger.kernel.org, AJvYcCXpKxaJz/Ra4XUZAVuIxqccjZ77Ay7IZp5VIaW3dfnmXgKtFJ2/ILMiKgef7S1rrKvAyGHTQgE6HEap@vger.kernel.org
X-Gm-Message-State: AOJu0YwO1ao4RfUC8z6AzAVjwGoC0aKEB8auwfQqxkSh4M2tCWsPkziQ
	8yDVifxg0rQEXki3/Jk0BWjcW2IelcegpaTQGej/eHsvgW3H0Tqo
X-Google-Smtp-Source: AGHT+IGoO/JgCl6tIFd8tMOpxidHIIxUPkp1DnQ/++FPlMXZXQ2ix6vSKLM04UkK2EC6h5bxjO2Xow==
X-Received: by 2002:a17:906:6a0e:b0:a9a:2afc:e4da with SMTP id a640c23a62f3a-a9e3a7f433bmr177110766b.63.1730269999630;
        Tue, 29 Oct 2024 23:33:19 -0700 (PDT)
Received: from [10.34.27.4] ([95.183.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30c7adadsm544485066b.175.2024.10.29.23.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:33:17 -0700 (PDT)
Date: Wed, 30 Oct 2024 09:33:07 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v6 1/8] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Yassine Oudjana
	<y.oudjana@protonmail.com>, Andy Teng <andy.teng@mediatek.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Message-Id: <7VO5MS.DLTH7ISEUBUE1@gmail.com>
In-Reply-To: <CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
	<20241011120520.140318-2-y.oudjana@protonmail.com>
	<20241011165640.GA2475122-robh@kernel.org>
	<2608306c-da19-4160-b0c7-dbb8935abc42@collabora.com>
	<CAL_JsqJ864ZM8qgqfuyKsS5H=gsVm=nOrikQ4cuObEVBJX75JQ@mail.gmail.com>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


On Mon, Oct 14 2024 at 14:02:37 -05:00:00, Rob Herring=20
<robh@kernel.org> wrote:
> On Mon, Oct 14, 2024 at 3:27=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>=20
>>  Il 11/10/24 18:56, Rob Herring ha scritto:
>>  > On Fri, Oct 11, 2024 at 03:03:46PM +0300, Yassine Oudjana wrote:
>>  >> From: Yassine Oudjana <y.oudjana@protonmail.com>
>>  >>
>>  >> mediatek,pinctrl-mt6795.yaml has different node name patterns=20
>> which match
>>  >> bindings of other MediaTek pin controllers, ref for=20
>> pinmux-node.yaml which
>>  >> has a description of the pinmux property, as well as some=20
>> additional
>>  >> descriptions for some pin configuration properties. Pull those=20
>> changes
>>  >> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to=20
>> match in
>>  >> preparation to combine the MT6795 document into it.
>>  >>
>>  >> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>  >> ---
>>  >>   .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 38=20
>> ++++++++++++++-----
>>  >>   1 file changed, 28 insertions(+), 10 deletions(-)
>>  >>
>>  >> diff --git=20
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml=
=20
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  >> index 3bbc00df5548d..352a88d7b135e 100644
>>  >> ---=20
>> a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  >> +++=20
>> b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
>>  >> @@ -111,12 +111,12 @@ allOf:
>>  >>           - "#interrupt-cells"
>>  >>
>>  >>   patternProperties:
>>  >> -  '-[0-9]*$':
>>  >> +  '-pins$':
>>  >
>>  > Worst case, this could be an ABI break. Best case, it's churn for
>>  > mt6779. Is it worth unifying?
>>  >
>>  All those MediaTek pinctrl bindings are mostly the same, where only=20
>> the pin
>>  definitions in the binding header does actually change.
>>=20
>>  I think that it's worth unifying them, not only to get rid of the=20
>> duplication
>>  but mostly for consistency between all of those subnode names which=20
>> are wildly
>>  differing for no real reason... and consistency is a long time=20
>> issue with
>>  MediaTek bindings/dts in general (which is way way way better now,=20
>> but still)...
>>=20
>>  Besides - just for context and nothing else: the driver doesn't=20
>> care about
>>  the names of the subnodes, anyway... so while this is technically=20
>> an ABI break
>>  it's not really creating any functionality issue, and then,=20
>> actually, Yassine
>>  is also modifying the devicetrees to comply with his consistency=20
>> changes, so,
>>  in my own perspective, it's still acceptable.
>=20
> Wait, I thought there were no users?

Right, When I said there were no users I was thinking of MT6779=20
strictly, but MT6797 is included in the bindings so it counts too.=20
mt6797.dtsi is currently the only place where these bindings are used.

>=20
> We generally only consider node names ABI when/if something or someone
> cares. Most of the time it doesn't matter. For the pinctrl nodes, it's
> really just a question of churn renaming a lot of nodes.
>=20
> Ultimately, it's up to you. I only care that the implications of the
> changes are clear in the commit msg.

I'll mention MT6797 in the commit message.




