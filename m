Return-Path: <linux-gpio+bounces-28765-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E06C6F433
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80BE24FFC40
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 14:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3FD35E53A;
	Wed, 19 Nov 2025 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9e1t6jf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7AC3538A1
	for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763561400; cv=none; b=Y4ICVN2e+HodHKmDxjeVTPYBajrIQanT0/0FaaUADfSZ7vzmH83Y1qpOzIf4GSb0UF7R7E0HlimFP97jwGB3g7w99joUQgst2s3GYqfDOYviOD8bL2PWnJeu3JgwIUhIqKr9jWqzXttQxZk4nc/qXl4YyK28p5etpLV5mauaPBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763561400; c=relaxed/simple;
	bh=sAF6O44vT1Mi7jeJcCwnvWvkPvnj9D57kUtkjUGBZbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVsRYdCLxosKT8NyL6W4lK5gRIu7IoUnt3dQ4ZKPcnBYC44RV332AlgtJDpxCU3Pa2Pq1Aq+HJ+1YMr8gUSDisKsy/CQ36yDu3IRZ0h1C0h+35PXtuI40Id0LvjUGrXio93Oenrk7cr2Y7WJeEzNuMxdMdGqx0Esy7LjCQcrv2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9e1t6jf; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-787f586532bso63836617b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 19 Nov 2025 06:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763561397; x=1764166197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAF6O44vT1Mi7jeJcCwnvWvkPvnj9D57kUtkjUGBZbs=;
        b=n9e1t6jfYj1+9mRB4uuDOZCFO5oTLN6s18NhdvTN7N8Ts4iCsAQIYq1G+txvpeKWd1
         nnZsZ35FeI9N1gYQxi3G+L6+lRqrIcyPdHoOW7SMJBShgm9rMxyc7c/S+w3gJ9NsFp+I
         x4AhiP0aw/z5rPvwq3Vm9XCj/qo2NnV0kwtnTblWtvlbEy9wylP4N6jXKMmUI5sX+sJ0
         EEU1TMpK6xDYGZtrQQpb+4V97HZlTCuA/JB4XZeZCy1zzdW53TIDyhKYWWVN0xp5MASF
         64DRLhIu5VHj18VjXU+o2KTpDxamwts0bl1GmF0ihaIIxegW6WKh8jUyGvjXFwdZ+gvT
         jnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561397; x=1764166197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sAF6O44vT1Mi7jeJcCwnvWvkPvnj9D57kUtkjUGBZbs=;
        b=pPy/iwAjwDZHfLwjaXpdlEkKQLvvkkioyqKgTfCgfC+cqCFkZBI7Wcu6fiovAjzjlf
         K5UpICPHWNOo2HXwBQb8lqA4Z/In9816SMet/JajqnVYWpPLjE0bz/XPKB7Oqb0uvgKq
         DN5jBNQx36I2SPgXtWTbqeRcXHkhBNN1PQamZ0wXxSP7qoA/tQCffj8n9MsVb3nk2RtM
         KIRrCYrO6Ub+tbGOIKWKBa0fThIqysQ0d6Q+EPyF15FTtV2hK6pFolhfrFOKcyP4HHoi
         wQHD9qNpSp6+gvQDQNlujpqCCVrzavWQTZdQ21HPQSXVUeoJN+2Uk7Q63//BYM8igznx
         uj6g==
X-Forwarded-Encrypted: i=1; AJvYcCWoxMQP15tzUzoXbxvLl+8tJFldILv3yEnFm3RMN0ZgFe3DJrV6Hl9UlHym43x+hw8Ik2FHkWt+GGAu@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQXDfz/G0m+WCvbxZ/Xwn0nFRZodCY8X4fKWvHUBY8Ch1afLZ
	xRp3rIcXgf1knU1dr0EutQr01d/5AurVZsiKalmiEsPxz67wkGKnhDx8IKO6YiofQbkwaID/z3U
	TOwYPFhJ1oXNxISyFQFKVVVDCPiQ2aeEtS6WDKifK7A==
X-Gm-Gg: ASbGncspkgV/JucvveFixtYTYcg+x1L/30NOhTl27xfLyC290L70lzjyl39h+i4hIqL
	LE1Xa6wEqDHDkH0YmgruRa8OADqnanUZGLoM5rKJ249NDI9cJz+LZ7Ryun3BOZZmz+/eTjGWqzH
	oM5EWe9IY2AeHILjUD7YQz8vEhlk0XUIP9IkrdinOwb6so7+CvPcIbCiioQiWrx7tEeA0+nGgKP
	qB37yswnNkhZ9Qk0nvdsa3JF5RRzdFZavAMkKxoE9ulsvSYGu+GLR//JLKz98MDL2TTI0Agobws
	Uc35jA==
X-Google-Smtp-Source: AGHT+IHP6E49Qj73d/B4xepPnYRr8fxGgO50zw8XTKBQCHoFhJrGEfuTzbCQ39L2P4YWRz3nXJpXN2/2sI7cpVjUQRI=
X-Received: by 2002:a05:690c:2784:b0:786:58c4:7a21 with SMTP id
 00721157ae682-78929f4b0efmr168702047b3.69.1763561396960; Wed, 19 Nov 2025
 06:09:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118121148.88165-1-marex@nabladev.com>
In-Reply-To: <20251118121148.88165-1-marex@nabladev.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 15:09:42 +0100
X-Gm-Features: AWmQ_blZTI0HEONzvyhOKKH_YzW5Got3D8XtC_2fvaieaZ5gnpDbY67xf-4Il70
Message-ID: <CACRpkdajTFSyabCUy-jG5M4bYXBCobvmQxAwy6dND_dkCon6Zg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: cix,sky1-pinctrl: Drop duplicate newline
To: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Gary Yang <gary.yang@cixtech.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 1:12=E2=80=AFPM Marek Vasut <marex@nabladev.com> wr=
ote:

> Fix the following DT schema check warning:
>
> ./Documentation/devicetree/bindings/pinctrl/cix,sky1-pinctrl.yaml:68:1: [=
warning] too many blank lines (2 > 1) (empty-lines)
>
> One newline is enough. No functional change.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Patch applied!

Yours,
Linus Walleij

