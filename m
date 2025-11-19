Return-Path: <linux-gpio+bounces-28758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19455C6EFE0
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:46:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 2545D2EB44
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 13:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5D035FF6C;
	Wed, 19 Nov 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNqrXIg/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852E35A13F
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559958; cv=none; b=HAswIltnEiNGzIJ9//nukqs6cr4vFQmuXrl384MC4UxwBlC6b2yUb91mPpTk8DKH8MNQEPCkk+w3xZRM0WpS029YkgRdhMNOerpy5/4UALF//oHvH6dMVVdYtsI/cM+35DSr849m+UdEfb/lzOMmseE6bJismTLL0EZJKeomVF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559958; c=relaxed/simple;
	bh=Iw1IbTA9k7P7Eqb6cVyD4QyxkJcMEsmsz+D3jS9djWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhOe45LKyFbT0EMBQqpn1EqR57/C6rmIy9+DLLVPax8HMN545sUkMw5dXHWWiQ50Ga+8txQ0avzSZ2xNkF4OHalqquHRkg/sxXtVk36n5HybsNXcfDOMdesksckKohchJAeKsmn9c6c27f2oKSJEyI3OyCF4wF877dv69/dH4mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNqrXIg/; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59583505988so1383856e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 05:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763559955; x=1764164755; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1l2z/VREV/OGSRWFgMDmn4kGnAaKe77gm/9lQK3iBA=;
        b=iNqrXIg/IFIeYcgUC4NVqrgdh1jtEexXjeHh+fyvVHuWhEvCdpe1asJ3vEVZuYBUbm
         L3OnuZlmKWnYLDOkP3uVZQJ25KQv5jWj4nk2BFf6kNhmBs8P+xhmGlLftLCADjyh3vt1
         KYstK0aqdE6iUUryEsw3VZeUcj9Tr8JJDmqpM/S53vmGLCU/ZbeDqbtm3vh/m7u0UGv9
         lmybBJC9VH6R/iuubFKGAKCnfmGXYp7NmuHj0DgxGhrL5ARfIleawB/jCTQYFCmRvP5u
         OXdj6oirUOayuCaINelZlcE1rf+VF+QfupjJigrC22sPTYr/K5/lYjrYjuWZbYPaYoGa
         Z2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559955; x=1764164755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1l2z/VREV/OGSRWFgMDmn4kGnAaKe77gm/9lQK3iBA=;
        b=sTsqM4nr1BKvjKlDnOC88anVTuZvco++d8nq6sT8GRlqmXlKVbIdwik043ha7hmyBF
         4CYeXwLVwqxY/AiVhPlHMnS9tD7WJCsRvBu9ByVhyyOOup8h+1jnn/otJxnvPyz8Oawy
         Am3JAN9GF0L+I+fFXSPrMafefTasn17Slrn4C10gS0DDKkjlszgPzH/Emy31nCSRiFRZ
         V4EsuLHQTWgm6AtFCSpQKaHzOJxYoZVtreLylw4OxLHnbRlUulypdhCiyJuqN/P+P7BZ
         Szt2huj7z+cY2HLaL3bWw42T5wdHnGgWu8uPbDepgtg1Q7Az2/ewId0ZWn+bpo0KqzCh
         73pg==
X-Forwarded-Encrypted: i=1; AJvYcCW3OaQGo+z6HdRu7xBR3ib5Pl5VF1X5ioOlCkyU5RVMrSAzpA5tQ5+0vHKCfpHzlhbiiAqJzScxf9qv@vger.kernel.org
X-Gm-Message-State: AOJu0YyxXvsBT96nK15RI3SobB7Ozm65JB2aChqMHdxfos0a6Xa1ICTw
	id6mHPloJVSyg/9nF7pZTCT8IEuMI5qI+QehTn7vtEnt5hviR+Rdof8eh+dzs122vchDl2FGu5J
	ED0Kewzu4YMQif+TeO9KVWlLWh47fYJGUifhTDNG9pvjaK2VlC/PsAss=
X-Gm-Gg: ASbGnctT2bcrRIvsyNi5NtpoghkskKljOE7Ms1IOpBVr+v9Ig/8AxPKEfjdIbATNKEw
	CsYc27XTrrO85TecVlVd7c/OxTfvKBIkM/PKuG7M1Tuotcx3nmECzAjnagWMOyBdm4P7gp/VveT
	Kmo/jd9Cew2jXTG693zpBAWTtbWzQR0pvA9Y+l/PWG5EyScbCGtoFHWFty7GcKhSucmfWyYnFn6
	2zGHupXIPoId70qoO+Cet6ZeDZOSYy8hFDZrgW/52MnOhNjDGyu/BDwIIAEjqqFL5wEsato82Xo
	YnhySg==
X-Google-Smtp-Source: AGHT+IHi46MJUsWVgKG97zvzBmctPH37ez7biiVDWReMD3gtNWbTOlbOcaiB9PFyYiZpqYGbAnTU/qHFubT2adEieWs=
X-Received: by 2002:a05:6512:1541:20b0:595:91c5:3de1 with SMTP id
 2adb3069b0e04-596432521bamr735676e87.0.1763559954606; Wed, 19 Nov 2025
 05:45:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117091427.3624-1-antoniu.miclaus@analog.com> <20251117091427.3624-2-antoniu.miclaus@analog.com>
In-Reply-To: <20251117091427.3624-2-antoniu.miclaus@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:45:42 +0100
X-Gm-Features: AWmQ_bkJ2p2IaEyURBIT9I33r_u7IzpUPkMo9HREbt3jJevxjDJx9Uz8HFl3ag0
Message-ID: <CACRpkdbdsqLnqGeOVtNJ_N2Z+rfpON2-B=YV30xsN3iN2Wb-KQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: switch: adg1712: add adg1712 support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Antoniu,

I like the looks of this!

On Mon, Nov 17, 2025 at 10:15=E2=80=AFAM Antoniu Miclaus
<antoniu.miclaus@analog.com> wrote:

> +  The switches are configured at probe time based on device tree propert=
ies
> +  and cannot be changed from userspace after initialization.

Please drop this paragraph. The DT bindings are for several operating syste=
ms
and this seems to be Linux specifics and also not every operating system
has a kernelspace/userspace separation.

With that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

