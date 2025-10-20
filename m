Return-Path: <linux-gpio+bounces-27319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EED69BF39C1
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 911C3188CB38
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2673D334C03;
	Mon, 20 Oct 2025 20:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmI7eBD7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ABE333749
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760993881; cv=none; b=bMSuZHjHeLt4OO5AknuEDR8aXsqv9rWUmeHXsRFIRS+SVihoxnEp2UHphC45mQzGTUQK+cgBAeUeYnKrxejZTOC+GoAmOC1VgywLHBzsw9azlqk5qqivmSSBB1qQLCW7WTY4jmPvEisCmn9MRvkYcIurcPU8m9lFeo+1FTpuiWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760993881; c=relaxed/simple;
	bh=pnGIELu6O3HOFz98MQJ52a4u31e/dW1FZz/2rCRONDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBObYRxroX6X99PSmk2iHQnAJz1HkWdNa8b1L9SbnaaPNZw94/IRrMVoeUIe8KjX9A1NUrCft+VfaLu7Nc5+GFMT1Vfc2bznHKYYZaJzSTxNZ6+zWc79jpoZCGvNkvpDvcg1uLZ4t5QzE8TLwzAmZYsKIOvKCt752tfSeCax1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmI7eBD7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-375ff2b3ba4so53105901fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 13:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760993878; x=1761598678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnGIELu6O3HOFz98MQJ52a4u31e/dW1FZz/2rCRONDA=;
        b=WmI7eBD7c/kbXiyRvGUJzFnOd1KS9mNgkAx/wKoeAQB0mlgqIA2U1xsZkEDYK7cEuy
         9WAU+Yd6tVz5yRhqNE5nuKCffhDzR1DSbC5SHojwi9bzoGt/Pjq0nvggRco8qIFUjl2u
         3xPDvs3lqvMTnlQt8VnzJOvzeNIsp56+c+JWaUjc6yfZXcUqVz+as9sMaU2M6IvBCOlc
         BIxXVpS/S7CHaFj8qXiMLDHzxNbzdI2jJr6Yh+JZ/KHa9biHV+IrviCYLHvT9lPU6m1E
         1h9ZSuo5ay4CcPysAivrLy6ECwNdqzD6y9A+5Kl+sdbfci/dpZShoouIoUuYlNoPcejN
         f7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760993878; x=1761598678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnGIELu6O3HOFz98MQJ52a4u31e/dW1FZz/2rCRONDA=;
        b=Rqk86ucju4TXsbE8ATPmdC5iVJ4gSa1DNPFMGHDp6WO6n9wYRx5ZQ9Nx3F5HAAaUH6
         M/HVoBDO9KDh6TR0QRdFY2g6sGglvskYQ/chTt2pPsuTI0x17kmef0OOt7L19AOdA6su
         FLC2/s4RmzdPzm02GBLsW7ZxK2V1RYXE998Giwo3PIQn1ZgHrdok93baB693jvlOf0T2
         J6zEzNc8YtcFR1UkMqRUb7YtvtV60OvK6vFg+XYIL8D7yZOXJOznga/xmmstLLaJN3iA
         mvFrjwwn6fbSR2RYnDugrSdcqq4u8G+Ac/s38472fQOGI9h/LYMIlSSxj57Daouv7cAi
         O/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdHe/14JV70c2RV54bmnaGIFIq2+3J2ePx1e28R90fSdBAY8OgDgfAVjyza1MKi3PzuR5ru/PYyk9W@vger.kernel.org
X-Gm-Message-State: AOJu0YxWiuUhdURuy7bsEsyfmUdLMoJneLtn/M0Ks7TGENp1Duem0i55
	k13OD7Aefa/bbaNilinhsbTAWyeUBq07FguDZTXZNcDbKFsVgDg6npsIiJfC+Ve15xKIDkjohbv
	Qa3n+Aww8K7WOvDUpe44gLcSUGOKwS3TZQ85VOTETRA==
X-Gm-Gg: ASbGncs5HVO9v8ywjNuiycoldY4PeIMmbBSmX9cxqXdoG2rNaO5ZZ7ccIaMrEvWyFRh
	Ku5LsIPFhp1+rQnOziyDSIi0Xr/sRKX/micsiJQE8ewD70nqu3IuPJgv1Iwt49ON3zuDjVtQGZD
	fTx7PNgR+gMVJfzBK2l3wIRMpNfk0iEu4gXOPZZFzil0Ta/ORRaZtrp5Qooaf6RdlL3nQ5jXU92
	EM6i95OmGfWBtlTAShtGUVaxXSaumv/PPqTgd3XvJKwCOZGA/gW2nPUK6L2
X-Google-Smtp-Source: AGHT+IHiYaMFIB5h1IuCc0gpYw8kK+jaVWftl0vp6vdhycGk4jXf5AqAN9UnlLAvcdiDy+MzLOJyJ3cRLt227uwuZLI=
X-Received: by 2002:a2e:bc87:0:b0:36b:c7d2:3aec with SMTP id
 38308e7fff4ca-37797a3b35bmr47819151fa.31.1760993877917; Mon, 20 Oct 2025
 13:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013191226.4137995-1-robh@kernel.org>
In-Reply-To: <20251013191226.4137995-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 22:57:46 +0200
X-Gm-Features: AS18NWDSPZhI5en_XfH6pnJ7MLfO5Ag8k1dsw9jH3twF_H6jQqdTj7LeE7PJz1k
Message-ID: <CACRpkdZR+vTDcC-F1=bMK20hJm8g4gs3R5Y=APAyANKS4btAXg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,ns2-pinmux to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 9:12=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:

> Convert the brcm,ns2-pinmux binding to DT schema format. It's a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

No comments for a week so patch applied.

Yours,
Linus Walleij

