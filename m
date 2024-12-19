Return-Path: <linux-gpio+bounces-14015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0469F7B0E
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 13:18:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F3A71699E9
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 12:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0F02248AB;
	Thu, 19 Dec 2024 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="eL9XxyyI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663D022371E
	for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734610719; cv=none; b=bEJLSEEfJRZ6drII24IhoX6OXHnD58j4PvGkAxSa76G/Aa9jrCrgqa7JnexLJW12zbqs91ClSc6afVJ7zizcgtZQbT3RA7xpUX7vTd4vhViev2iycea3f9N+K1Q0Q9i6VhUNrfJxvVQMBY6husLl5m0eh1H4+6WXkYrNZUlc9Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734610719; c=relaxed/simple;
	bh=lwcW9BplthifTyZcaYcUmWZevOpZ9jI7jAxhpB143zs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SpMCV2hz3f//+znmR6bVhf5Og6ycavIl4xBFEvEOz9POR9Dn1XpPsoMedoDvlyQmxF7b70bQTjW/e6H5M9zpichuOzcEO07baXhCjcXqLKn0JpfgGraNRf+7XCRSSDTnBUra0pSIN7/Lfib/PUbwb8VXGmEuPq1sZX+C439yzTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=eL9XxyyI; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6efeb120f4dso5497477b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Dec 2024 04:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734610716; x=1735215516; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKElXei+0mSP3tUshAw0E8nj/P9Wr6r0nFHCMfiQMBM=;
        b=eL9XxyyIYEFu+y7UGNxotMB/Ikx5k54Pe/2AXsOpb9pLuiw2TyRLuAtVf1P+Zro0Yd
         fgBHAmlJgqjxeTV9Q8a0IjCBYE/IN18TdHqzewe+aLaw2mzvY01o0RlFOhWzGtDdznZ0
         JVG4p2YZdSGLpxOz/SjDsL/umDKxinxKNbwWSVFfDY6woDfFYRiPEcHc4RAkfME7pq6f
         dj+4PhaN12I/Y78QVPtvTnLRvMFqCJyfkdc3tUdZjUEtGIW7X6JAt1U39L8mhUKg3N49
         KWW4a+UzpslbF4zjzfsOrSQ/3d7wHMvDJDapLVw2SEN04cqEUUmEtKc43DamdseKVQFd
         13Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734610716; x=1735215516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKElXei+0mSP3tUshAw0E8nj/P9Wr6r0nFHCMfiQMBM=;
        b=S0RXkFDedsoaTr+EF2iCAgk8GOQOBVRmsSNpwlmRlqPUUDGxIP8tk/C3+fPZUq7djM
         O8sPRMJXGHsFXLie/WKUAuwkcDMxxTqfceSRfXaW7/Axs7D/06h0+T8fcxnktr1m4qxl
         Gsxzax52E9brhJvkgH+4uRPsCFnDtK4mI0OXi8c/hFBeYXKW3/H2DzwXKCqJ4qdDXqIf
         OcDca69Mg+Ry8tet4DLGrIXqwZPDHGuaHvvW1qQGOAi0HCpaP/sXHT7pLNQork1Qb+E2
         f7zxkjNrxmU9yVEKrQKIRiZ50hb/0zsXzitP3Kh68Av5wtGI0eZ/iQBqq0YK3+DmpMS6
         uHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYr0XQqxIZhLo5CR9ikEjjxIFVqpr26gsK477U4smekoMfRTKfRggZJmik4gdCqCMAZTyrYNZbn634@vger.kernel.org
X-Gm-Message-State: AOJu0YxGGK7jvcbSHudjQUWigMrHwx7Tu4alCToeDLQAJu3dpMc1X5/8
	aZhz2tkOQ+CaH42xczUmVpZXPqaZdBDlbChK6v12thGWsvi3eAwJt5ADHdABxfMU5oSrIfH82J4
	A6oFjuneceaGjVoy1Nk124JmaZ0EIsPKQZMMCMw==
X-Gm-Gg: ASbGncvz58HZyKSRtW5KeOXAgVNRmCKnnwEZlIk/7/jh6XbbNf8wMmCbIckUKGt+8en
	QZCcRDe/VBdqG/skdfKVPc7hqdonJlKQU+vAqoA==
X-Google-Smtp-Source: AGHT+IHraW7wpbF8fJqXT45CLs6MHm0bG2jAMI06aKTMUcj3YkWcIfGKnVrC7HIFs/1/hf+1Y67F/W4zse9YCT/oErg=
X-Received: by 2002:a05:690c:6107:b0:6ef:e39f:bb1 with SMTP id
 00721157ae682-6f3e1bd4915mr25231957b3.27.1734610716405; Thu, 19 Dec 2024
 04:18:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
 <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
 <CAPY8ntCX8+yg1RFhAXu4ystGF_JivTh43RY=k2P0bUm5JxvzRA@mail.gmail.com> <09bee93e-48bd-4a7c-b975-b10dce945d60@kernel.org>
In-Reply-To: <09bee93e-48bd-4a7c-b975-b10dce945d60@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Dec 2024 12:18:18 +0000
Message-ID: <CAPY8ntDWGaY9__BdR9Sfmom6YsZEhRZZsLghRNR1cvAZMxJyMA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings for BCM2712
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 12:14, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 19/12/2024 12:54, Dave Stevenson wrote:
> > Hi Krzysztof
> >
> > On Thu, 19 Dec 2024 at 08:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> >>> Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> >>> added the compatible string for BCM2712, but missed out that
> >>> the number of interrupts and clocks changed too, and both need to be
> >>> named.
> >>>
> >>> Update to validate clock, interrupts, and their names for the variants.
> >>>
> >>> Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> >>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> >>> ---
> >>>  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
> >>>  1 file changed, 70 insertions(+), 14 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> index f91c9dce2a44..fd25ee5ce301 100644
> >>> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> >>> @@ -20,11 +20,20 @@ properties:
> >>>      maxItems: 1
> >>>
> >>>    interrupts:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>> +
> >>> +  interrupt-names:
> >>> +    minItems: 1
> >>> +    maxItems: 3
> >>>
> >>>    clocks:
> >>> -    maxItems: 1
> >>> -    description: Core Clock
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>> +
> >>> +  clock-names:
> >>> +    minItems: 1
> >>> +    maxItems: 2
> >>>
> >>>  required:
> >>>    - compatible
> >>> @@ -33,17 +42,64 @@ required:
> >>>
> >>>  additionalProperties: false
> >>>
> >>> -if:
> >>> -  properties:
> >>> -    compatible:
> >>> -      contains:
> >>> -        enum:
> >>> -          - brcm,bcm2711-hvs
> >>> -          - brcm,bcm2712-hvs
> >>> -
> >>> -then:
> >>> -  required:
> >>> -    - clocks
> >>> +allOf:
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: brcm,bcm2711-hvs
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          items:
> >>> +            - description: Core Clock
> >>> +        interrupts:
> >>> +          maxItems: 1
> >>
> >>
> >> clock-names and interrupt-names: false, unless driver needs them but all
> >> this should be explained in the commit msg because it would be a change
> >> to the binding.
> >
> > False it is then.
> >
> > Is there actually a full guide to binding requirements?
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html
> > is the closest I've found, but it doesn't obviously cover these types
> > of things.
> >
> >>> +
> >>> +      required:
> >>> +        - clocks
> >>> +
> >>> +  - if:
> >>> +      properties:
> >>> +        compatible:
> >>> +          contains:
> >>> +            const: brcm,bcm2712-hvs
> >>> +
> >>> +    then:
> >>> +      properties:
> >>> +        clocks:
> >>> +          minItems: 2
> >>> +          maxItems: 2
> >>> +        clock-names:
> >>> +          items:
> >>> +            - const: core
> >>> +            - const: disp
> >>> +        interrupts:
> >>> +          items:
> >>> +            - description: Channel 0 End of frame
> >>> +            - description: Channel 1 End of frame
> >>> +            - description: Channel 2 End of frame
> >>> +        interrupt-names:
> >>> +          items:
> >>> +            - const: ch0-eof
> >>> +            - const: ch1-eof
> >>> +            - const: ch2-eof
> >>> +      required:
> >>> +        - clocks
> >>> +        - clock-names
> >>> +        - interrupt-names
> >>
> >> My previous comment still stands. Reply to people's feedback instead of
> >> ignoring it.
> >
> > Your previous comment was
> > "Why requiring last two names? Commit msg does not explain that."
> >
> > I didn't ignore it. The driver needs them, and the commit msg states
>
> Uh, so someone added undocumented ABI. How this passed any checks? Or no
> one cared to run validation?

See the cover letter:
"I missed the DT errors from the recent patchset[1] (DT patches
in linux-next via Florian, DRM bindings patches on dri-misc-next)
as Rob's bot report got spam filtered, so this is a fixup set."

> > " but missed out that the number of interrupts and clocks changed too,
> > and *both need to be
> > named*.
>
> Ah, I really did not get this.
>
> > Update to validate clock, interrupts, and *their names* for the variants."
>
> Please say explicitly that since some commit driver needs this. There
> should be a clear reason in the commit msg why you are adding this ABI.

OK, will do.

  Dave

> Best regards,
> Krzysztof

