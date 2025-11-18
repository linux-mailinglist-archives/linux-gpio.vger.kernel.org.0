Return-Path: <linux-gpio+bounces-28649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24326C69060
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AD2F04EBA2F
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 11:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C310E34A794;
	Tue, 18 Nov 2025 11:15:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6865426C38C
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 11:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464553; cv=none; b=pqZE6st/++6JfMS/I8hVLJPtz1kKsMsZPpDJgvOQirmz3czFsArU9U1YESzepoq0ytpQ9WCXyvEL+bhom0sXTDXX/BXAEl8cFe6uEcT/4r31JgsolTqw1TWZo8yRuqser4sifestKM1G9vfbZ/nNeg15eQECEXRbQMP3d0Nuxd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464553; c=relaxed/simple;
	bh=B1FsBCLZ1091fdu3CKfazhUK9tOtY4FVr3EaczDF5Oc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8RzhhGHHBt/Z5ElY1LQmhDDOSI8/186xE1sX0KBKWdFnDhJFVDr34OILdYpQ0dqNTzFt1fo8JxAWpSf2MjXN2kekw0HR5wYw0uNqp+3YCnLAWWWYNR6E1sv/aLLv2FYGpp5LfzSEMeMKLVanJFc83wBXvg3eElGvMDO7ui5LqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b09f54e98so1407784e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 03:15:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464550; x=1764069350;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prvcS1Nj5HxJbRS6Jy4uHehWZnJysfpIngTPCq04YCY=;
        b=iCwR8JgfcS6qfE4ihWeHmmxQFTVkFEU68vVa2lIalUTTV5S5Cxog5wFYXcHugYB2Jj
         4koMITJi5m6oVljF6pC50cLLwqOLcnsT8Fgvk929hHG8WL4mr0KiMQxNikiJ88nneBPO
         g9e72iQQm81XZcepJdeM5gnnraVJgakNmpv3FoNWz/ksDaHiKTj9H6O6iov/KRs55Wr+
         J7bUV1Pw4+2yQLuJAZQfgcJTr/tFfjsPSpErNhQKvtMdw/SKINxlqjGKos8vsptzcGGd
         0o9kRTOitJ7uxw8UFKIPxkn7d1xfkf23Hu9wE4S3MGSLjzR9p0/RsyV7pI4NL0ZI7n01
         PViQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuuGXfEFzzgFHetkq/r7drTcdqz/7HtPIb6jyBgadoQ2Vu8t8HrudgtV/obvhrxPXQE9cpdgBEiQDr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4LMidTG+Q7xxM8ixRkNaCce8ZAkU9d40YtQPIQdBtLrk4ioma
	kz6F4jkdlMhMBmW1fAk4BupqSvtcFEmHcxNGFp/gZSpgIxvJ5GMZjC6RZSQ0klXmsdA=
X-Gm-Gg: ASbGncuIiuTdBRJLDzRlE0m3Onfz22jxpD6pUPlbwHxxjddG8hzHnyGszAw8X2PjqKr
	lM8rxwehgwf2xFPxb7nc+dOahTwJ9IFJ+kE2n+avNtFSE7M19mGai+FxsahUaFQGu/YIMePL7jf
	v+IBaD5PrmTh3QF7dsvipKdcHGXPt9LLKlayqdA2AXnP93kcK8pbtlQL29FZR9BFihcLe07N8W2
	CV8jamTgMrJ7kXp+S6g/hINNqN3u6CZluTfg6RBm+AOaoQ+MQLBIQztSrT2o6xm/u2lWh7uetOw
	oCXf9DD+2wzlFo+p5/e8Av8P8s7+MUDJeu+49fqQqAHMPFEiYNgoozni58QESDhHi3XbJRGtBls
	p4GCCwSQusGb6I8tV9zumNGtOEOEx1lePRZOSmA9SY9u2jgI1xifw/kuzpg2OeHNjUNFbxVfCrw
	p+rJaEhEbY9RdYC6GtT6R9lTTOaReHdrh9UXn+y8JLec7r4W9gbvJTY5g14z8=
X-Google-Smtp-Source: AGHT+IFzaHK3b/LnesS0FJVH+AmuxhlwXFAAoAXLXF7ne8uSLoEOKQxFg9UsE5QKr0HHc9u0wcpFGA==
X-Received: by 2002:a05:6122:6991:b0:559:ed61:4693 with SMTP id 71dfb90a1353d-55b1bdda1b5mr5012500e0c.10.1763464549966;
        Tue, 18 Nov 2025 03:15:49 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f49865fsm5219411e0c.22.2025.11.18.03.15.48
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 03:15:48 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5dfa9bfa9c7so3536048137.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 03:15:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7CevgGZigytual/dTGrwMCImNH+7yoSeOg9SpxjIud5DUaEQwamOvFPyM2YsdIBctbDVl68a8PBm5@vger.kernel.org
X-Received: by 2002:a05:6102:4189:b0:5dc:7fe3:1d0 with SMTP id
 ada2fe7eead31-5dfc5586babmr5642681137.19.1763464547898; Tue, 18 Nov 2025
 03:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
In-Reply-To: <20251112-gpio-shared-v4-0-b51f97b1abd8@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 12:15:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnG1e_JZjF_t0LAgzvKf5wM6L4cWt2t2bx5VV8t6YS3prQ_Mx2gaFVEov0
Message-ID: <CAMuHMdVR9Z70+M-SqHYrHiC6H_yw=VRuDOOg=YnXSNKjPnx3WQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] gpio: improve support for shared GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Wed, 12 Nov 2025 at 15:05, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> Bjorn, Konrad: I should have Cc'ed you on v1 but I just went with what
> came out of b4 --auto-to-cc. It only gave me arm-msm. :( Patch 7 from
> this series however impacts Qualcomm platforms. It's a runtime dependency
> of patches 8 and 9. Would you mind Acking it so that I can take it into
> an immutable branch that I'll make available to Mark Brown for him to
> take patches 8-10 through the ASoC and regulator trees for v6.19?
>
> Problem statement: GPIOs are implemented as a strictly exclusive
> resource in the kernel but there are lots of platforms on which single
> pin is shared by multiple devices which don't communicate so need some
> way of properly sharing access to a GPIO. What we have now is the
> GPIOD_FLAGS_BIT_NONEXCLUSIVE flag which was introduced as a hack and
> doesn't do any locking or arbitration of access - it literally just hand
> the same GPIO descriptor to all interested users.
>
> The proposed solution is composed of three major parts: the high-level,
> shared GPIO proxy driver that arbitrates access to the shared pin and
> exposes a regular GPIO chip interface to consumers, a low-level shared
> GPIOLIB module that scans firmware nodes and creates auxiliary devices
> that attach to the proxy driver and finally a set of core GPIOLIB
> changes that plug the former into the GPIO lookup path.
>
> The changes are implemented in a way that allows to seamlessly compile
> out any code related to sharing GPIOs for systems that don't need it.
>
> The practical use-case for this are the powerdown GPIOs shared by
> speakers on Qualcomm db845c platform, however I have also extensively
> tested it using gpio-virtuser on arm64 qemu with various DT
> configurations.

Thanks for your series, part of which is now present linux-next.
IIUIC, this requires the direction of the GPIO to be fixed?

We have a long-standing use-case on various Renesas R-Car Gen3 boards
(e.g. Salvator-X(S) and ULCB[1]), where GPIOs are shared by LEDs and
key switches.  Basically, the GPIO is connected to:
  1. A key switch connecting to GND when closed, with pull-up.
  2. The gate of an N-channel MOSFET, turning on an LED when driven
     high.

Hence:
  - In output mode, the LED can be controlled freely,
  - In input mode, the LED is on, unless the key is pressed,
  - Hence the switch state can only be read when the LED is turned on.
If you have any idea how to handle this, feel free to reply ;-)

Thanks!

[1] https://www.renesas.com/en/document/sch/r-car-starterkit-schematic
    (needs a (free) account) Page 15 aka schematic 12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

