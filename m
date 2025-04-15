Return-Path: <linux-gpio+bounces-18898-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC069A8AAF3
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 00:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFCD8174B13
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Apr 2025 22:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC4D256C77;
	Tue, 15 Apr 2025 22:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EJTVGZLJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF32512EC
	for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 22:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755058; cv=none; b=OeB7T8kMuLfEyC4NtgA4EE5i67wc1sy5dq1bX2BNdWaSofmw/kiCxRnDePj/mqcxitiBvSU99kUxD888FXVOEHZ+r6nB2GTrqBRYuDv1iIz5TwERW/TOPn2gv0WwsqNzNJd+We/bhhP3iBNuWbOR3A2OimYeaYKYcfEDeS7E1dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755058; c=relaxed/simple;
	bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrN661cPkHbsmK0U4Won9pa5OrM0ZG2r99ADmZTxVSD5pkK5r/BzZ5Vhvvouqd0Fq05f/BPRRl3sPOVD8qOtb55EXV64irkHOtUWevk/59cDbSCiiA6OuU1S0ZCzDJg2g/UHW4vm671B7aFVuPZy0srlQaA3PW3JEZLKM5oFKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EJTVGZLJ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-310447fe59aso52963831fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 15 Apr 2025 15:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744755055; x=1745359855; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=EJTVGZLJ8CTfHbwcvmzhtwULAtv1VDVkrAv9dm59ChB9/5Kr80ETqGBahVAHzEzC5X
         CtRBLvE5gx+xezCbjbQVTFn4tCFe/FhiB4uGeJTsbu6cnZuIUooFwTDGwCW5yTif5dJG
         YcSm6nOB8vidGKU9D8sTJXJ+VONPIS9CjpnZEY1ZSitrE27X8jP81Bt/ZL4qHNPDzk0d
         p2p+KhmGwcJEScEbtm9wr0IPRTbiVkfbUuRmCJABkBifgyb2anGolfOx2e73I6eaginh
         08USbbqTWDvDFKF1UmRoHhNNq/+dhPWZK2HYWrVN7ytjnmT9dEKKx1NnA/C5E4Tgxc+v
         fP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744755055; x=1745359855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31qWf8KQERvl8g/dbn9h2rj4EmG6eTFJ1VCVzlLhv5w=;
        b=BXMecEXzNutdq19jq5V0wQF55Rc9TeWgykir1G6VXmtLk9gKSrjmeBJuJWIJX4UCKn
         i5bEWyTnfRHzyYsYIjgnHu6M8O4IOxjFhFoZRNY9cmga7sVeDVq0HdX0zmFyKK4YKwll
         hMnOtdZdXW9qQoPyABFDZEhs0lOg3XsVYwlEH/FluXY8zg7UiXyudbA0Ybl1DWio5gXC
         xHMkCS+J07i6Tugqqw/Y8bOLkYqkEJ0tJZ8ppKs+Y56rMVu0W+9P8yq+W9ENvVxgBbC1
         mauOOlrmgD+1AnT50Ye/5noCsxepv/wSS8ZDJDb7tHpFdwCfpx8fxQUZupZC2EddoxG+
         1kCA==
X-Forwarded-Encrypted: i=1; AJvYcCVRN90KDGqOjRfCCl9wm8plfoLsRRPyZ0/lA6WG9mcRsM8vYf6qSxSkIeOhFV43tejMBGxj/DccNxc3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1tGjBEFKbRlgeKEweJb/2FCyDw2Yw1ovreNDyoccjKZMa2cOZ
	jrhl+nB+z5ytMe7nRvBXyx5COJPSttD2CV0uQGujnsk97lGHRqIbqKyPvyFBMd0bphOltgX4m/V
	3jI1QHTcRDqA5AKzffwTJITkIEiw+6BXruO/qpw==
X-Gm-Gg: ASbGncurjt8yvY7jAtgFSPzwsEhlVMB4KxwxML7JW4YXWGVDIe3jbFm1vfnIXKGbfhi
	zcCBvEH0yWQAeDaAs5ZdKQ4knpCcQnhvobUL1V6V/ilWWREDv7ZOfS/tESlGEf61+VEWJ+Ykuo1
	9oC5SUJnDjmYeHDbT/yKcirA==
X-Google-Smtp-Source: AGHT+IGZJzLOwnZ9qpiWHcIF+V8TMR3nGOqkOptHc/Gl4TE7Nw9LgOL4ju4wMFEnKHYqcQfWgSEgPkmfn705OlR6U1Q=
X-Received: by 2002:a2e:be2c:0:b0:30d:e104:cd55 with SMTP id
 38308e7fff4ca-3107c35dcf8mr1584751fa.38.1744755054882; Tue, 15 Apr 2025
 15:10:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250324125105.81774-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 00:10:43 +0200
X-Gm-Features: ATxdqUEUFUOJ2tt2s7fnA8fXcqPXcCQqJSFMlzS_sbWB5FOT4EwR_LV0iDgZ9D8
Message-ID: <CACRpkdZC40M9p0VsygE4fWeybdHYD6OJ2b4BJufbCA4LVW1z5Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: Drop unrelated nodes
 from DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2025 at 1:51=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Binding example should not contain other nodes, e.g. consumers of
> pinctrl of, because this is completely redundant and adds unnecessary
> bloat.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Both patches applied, thanks!

Yours,
Linus Walleij

