Return-Path: <linux-gpio+bounces-30385-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2B0D0D6CF
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 15:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E852D3012BE4
	for <lists+linux-gpio@lfdr.de>; Sat, 10 Jan 2026 14:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8A62E0914;
	Sat, 10 Jan 2026 14:03:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com [209.85.221.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A221E3DDE
	for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768053818; cv=none; b=lnvSPpQxn+EoYNKfe4rbX0/90bMlgqt6nTSlXGb4qGlOLU3cfc2ysx11M00xZBG333rWZwY4DtoQ4+trUqt4aXEdLYUHXid4gkySIHAaPzVaVZghq/fY18xi4dSRzV9iz9k7/KY4cj/jwB04t8i/9mSjzLWq9kisxA4pC/pW0lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768053818; c=relaxed/simple;
	bh=+hIKWxEFnKXhpOi0CDirFiYYoKezYuUhhk82dtboigg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njzobXt8RXDq8XEqPZS3qWVxdNPRCKdSokwgBGNcB+qfNaxO2tHQ8gEw8t7fwfcNMPJcKPVP44wUSsl+g+juA4ahp4C1JxflE3rbNwneoMuJXysBhMP/3QyE8JoxoDQnuBjEd44Is0P5sQCq3PfDPX6rnaKzhlpzxgWfUbC917I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f193.google.com with SMTP id 71dfb90a1353d-5635e6b80easo752185e0c.2
        for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 06:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768053816; x=1768658616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/+nQPBpahPuTRTHglEM863xOzb0uRGdbVA+VJIFHvc=;
        b=MB71UoMqPv0/J3Dcyv4PUTnKVxO9bKgll963YzaKlyTBSbeSPWh3+QmHM9D8TYnI2/
         6CitaFZbC2cgLeciEOGcXeIfMFXQB5eDuOM8J4aICvWq6yYMqSu/xjo0hhW8bC7YDflA
         7RMJhwR+znQv0ANj8rNJDqdTb8MkDDW6lbw6HxDrw1sVdn45z0Ws3pxbnoblQD2WORtQ
         efInv2GgQNJ+2WiKvL+qQkjf0h9JzrTefr8sW/2WeCmHocRDrAMEQoFd/1KjXlQj+aWH
         N6+iOrneKkMOrUoAX4bpX8na319OZd5u8xSK3xvt52hbXEBSY2I2dxnQg1lh4jfqPeHy
         aKLg==
X-Forwarded-Encrypted: i=1; AJvYcCVKtOE6nVZBkyeElVo7De4hqNzDP9VvsvTbuBkS8lg7jj+PboD+BasgLwNcT0aqdX51/afEzyQmjsHu@vger.kernel.org
X-Gm-Message-State: AOJu0YwqpQksExS0JEykcKqOR3T04sDFMVtUnBE4WAsXEPty3XUHCgfZ
	eOxFzhS1a/1w+5nQeSH7MLvfVtvmEPlz1KlGFUSoCnWF1hDPresJmIgqJtWoFUyh
X-Gm-Gg: AY/fxX7pYpySVyan1Y8erJNFn/pMgwtvODpxXf7gA4xjO4QCEKMqJD/vNjny6p7Co7v
	+cfJH9zBviGHPU57rxSPPiwDaNyszav2kgwc7U0mpnFcPQAmFaRI8Aw11GRWRK+VcCttD/8iryL
	7LOvOJJqd9Iwwl54UAxOf8XjFOOGAtt9cglATUmgto+8QbsIf/f9LWYIKXsphU7xWycDp+Ts+jE
	8sej+25s8saO3SRyrtPsbKJLwkx7098IqUrOx48FhHRDpOydifA6uQlehVw/+B5V9Ps9iKcrSw1
	97r+GN01A2NjY2upuFQY2s2kZEtO+KCECAp3/VPp1ad9ABN4WOjAOd7AS36DpJifLUE7tQxCJ8z
	OXtStgV/TjwE1c/whdbUtEHO4UYd9qR5+Vn5DHCRRdAJrislGU9m8SRIpa4Zd68nq0izn8bCE/y
	lUvTCTEgb7YkYW2zX67uf5vzc2HaP/5Bx9qGzNXt6Kf+0Qxk5Lm95D
X-Google-Smtp-Source: AGHT+IHEG+is7CalRrtMr+wwduVrI1yeZeFFP3dGRUJIpXOHKJYPANcjDjCaYTGo2NsKJkWwQSxZVw==
X-Received: by 2002:a05:6122:478d:b0:563:6111:218c with SMTP id 71dfb90a1353d-563611124f6mr2604270e0c.17.1768053815852;
        Sat, 10 Jan 2026 06:03:35 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a074d30sm12106628e0c.0.2026.01.10.06.03.35
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:03:35 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-563641b24b9so594111e0c.3
        for <linux-gpio@vger.kernel.org>; Sat, 10 Jan 2026 06:03:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGlGjZh5y3uzt/CHjI35XuJq16QDMgy+FepF49on5lNJndWlFqSCZKoZrDWuEO9ivmonUnRGORZ7Ft@vger.kernel.org
X-Received: by 2002:a05:6122:3c4f:b0:55f:e06c:442e with SMTP id
 71dfb90a1353d-56347fad1f6mr4158743e0c.13.1768053814696; Sat, 10 Jan 2026
 06:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109134409.2153333-1-shorne@gmail.com> <20260109134409.2153333-3-shorne@gmail.com>
In-Reply-To: <20260109134409.2153333-3-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 10 Jan 2026 15:03:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUiFk7bVHh_034jPyBGkgDGnc-dXJDwOEnBD2iZ02uVng@mail.gmail.com>
X-Gm-Features: AZwV_Qj6z-YvX-ELAM615xI6NqQo7zoOHhnr178XasgXuOsQv6rk-nrDVdiPSh4
Message-ID: <CAMuHMdUiFk7bVHh_034jPyBGkgDGnc-dXJDwOEnBD2iZ02uVng@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: gpio-mmio: Add opencores GPIO
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux OpenRISC <linux-openrisc@vger.kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Jan 2026 at 14:48, Stafford Horne <shorne@gmail.com> wrote:
> Add a device tree binding for the opencores GPIO controller.
>
> On FPGA Development boards with GPIOs the OpenRISC architecture uses the
> opencores gpio verilog rtl which is compatible with the MMIO GPIO driver.
>
> Link: https://opencores.org/projects/gpio
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>  - Fixup patch to simply add opencores,gpio and add an example.
> Since v1:
>  - Fix schema to actually match the example.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

