Return-Path: <linux-gpio+bounces-30288-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FCAD05427
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 18:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D4073439F23
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 17:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC60C29A9F9;
	Thu,  8 Jan 2026 17:01:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC25271464
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 17:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891713; cv=none; b=LlBgryM9C9T8Es+KRBLnmxbJNGS1d+VCGNflvPx9ZuJMW2IhHkk1B8hgBeUP/DZYlD/urbjzK8NZ7BmjWBYzX8JpubyAtTkEVH0Pi0BfZ/fxuiXCEGb5yFyrCXNtUEladX8HtgLqzt22Eitm5zcxLoXCluJH9olIp0p5Nwwxfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891713; c=relaxed/simple;
	bh=l/hatv9g6YZh7Jedhcdf7GctsSHL9xJ16ZgcVa0bhbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqXZkMRzfMcpkopDC49OMT6Hz3jIJy4zpgsY1b5JXQB1+aOMebUpUwh1cwyvqnhSkcnWBKWLXvlcd4/arr2ci28FV5qFDdyS8ZyNAxgvKvuKzZ9HUg1JJPQ0kzmaRo5dKm59RWtbbvXVRajdCLd5BG9Gsl9Jjv2DqyxbMNWcb+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f194.google.com with SMTP id 71dfb90a1353d-5598b58d816so2492250e0c.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:01:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891711; x=1768496511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3co9hJKBOyWFmQg9PlWXAOMJY35oVbLhgGmADuHFV00=;
        b=E1RPYdcAgTmB0XZ5x34rJ/Xz9wwhipdjAjyLLbtX/vU++JRGVWgHfLVU/+ZqmJOLQO
         vj4Ym95a3B0qKmMXKDpuCb26FIKwsVuhzc6UfRqEAp13BRJ6dJcoyRZOZQ/TdcDIH/o6
         irAJNuIIKDG8fTKjOD4CIr+umWx4j9Y9lMAJMeQUSuj2KQHedkIMbhFou9jcjKh+swPq
         GPZ3YAuYrbwfSD4RpWCSxeQald6rfwY67PGVGAJFpDpCiIqpIMRCRcYSsMP0yYzmw3RE
         TIPH341y+giVYdlhPbsuf4QU7YRMtZNyrRiwS6DsP3kfM+l8ynaIbX5jB2BEEO6sSBa6
         XQeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9g8dHGb1Q0WPffuWBugLsvWRFQ2zFQftqhExoClqo5nw1yTt7SQBmC8bRUUiNujhY85PynLLulICn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CuPpm87inM3J7IifQ2EuPJCdiVLh5cI0ZaWQS1/xjuK8h19H
	km20H7HMzaPyftTth2Cx7vjGBXZqP1UaUhrZAC92LF6DcB0e0b+v/AHMggABbcZARwo=
X-Gm-Gg: AY/fxX4Y+0tzEwSx8ld2Jg1Kg+VlZ5GHfXiWqXUWxEip8U9Mvf15uCLQaJDnzlEfATZ
	9T+MNWKrNNdAPjKBf5W7DjbRfiQk5rvIiImKDuzXZ43VVYBDoXhNUhrp42ihGqQehkVWnPP3knT
	Vx627LIrteAy68mxsrERIUyyG25btGyZR879duJ81wYNXLHCKIsqngTIxaFGn+MvJUorVHPzn9x
	RYF5jdZqIeGTQ/vfWjJ6xIqlMuRUFpJHnxasUmZviR+RR9bNbMoBamqLRvK+Qn2j5G+m/xApLM0
	4BGd+/sfJxnHPNwLr3HHgbssUMqg3uI27AC9R0rntj4q+uGoP8xNw+qSA2the87qBWAxGPn8fQ7
	kYLr+WhFqrPv01w8coax+lM/HJB8fGjdf/xzllRd0YPO4xrUj+KWHfui90kAdrQtZ6lVdmEwPpN
	qx1z66g/gO/CoIJx2aF3+z272j8/uZhgtYx12h8sbwjhZm5S2bD4sW
X-Google-Smtp-Source: AGHT+IGhP6JMwlLW9QjMpXifhhnivyh0IaMCisjtGfguVG5MRqqVsqu21jGPWF/kPzawkGWCJ/2tFQ==
X-Received: by 2002:a05:6122:8d4:b0:559:6b7f:b110 with SMTP id 71dfb90a1353d-56347d3a261mr2806075e0c.2.1767891706180;
        Thu, 08 Jan 2026 09:01:46 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a440198sm6913076e0c.21.2026.01.08.09.01.45
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:01:45 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b09f54e98so1087239e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2026 09:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgAqxOUiFbr1/CXMhiP7q+wbdZTKGxWSpwAwixk2rLdwZtTaedtmjypD8znP13uIOu81+qQtNsJjtz@vger.kernel.org
X-Received: by 2002:a05:6122:d26:b0:559:ef6b:1efb with SMTP id
 71dfb90a1353d-56347fd756dmr2483847e0c.11.1767891705232; Thu, 08 Jan 2026
 09:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251205150234.2958140-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:01:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWg7Txe1fm0XOaT9FB0pDq0SehoXHWrx2g=j26g80vnHQ@mail.gmail.com>
X-Gm-Features: AQt7F2rYWZ2Ei2cs0E8SVTZUjMSM-px_qYqN_ex3GD4Ez2BxiCY01zZUOkvmZgc
Message-ID: <CAMuHMdWg7Txe1fm0XOaT9FB0pDq0SehoXHWrx2g=j26g80vnHQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: pinctrl: renesas,r9a09g077-pinctrl:
 Document GPIO IRQ
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Fri, 5 Dec 2025 at 16:03, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
> IRQ-capable pins handled by the ICU, which forwards them to the GIC.
>
> The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
> and the mapping is not configurable.
>
> Document the required properties to handle GPIO IRQ.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> V2:
>  * drop interrupt-controller and #interrupt-cells from required to keep
>    compatibility

We can make these required once all pieces are upstream.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

