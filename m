Return-Path: <linux-gpio+bounces-6430-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D63AE8C86AC
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 14:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D0AF281439
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2024 12:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA804EB36;
	Fri, 17 May 2024 12:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="bA+wAUc3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B2A53E08
	for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 12:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715950510; cv=none; b=ucimYSx833rcfIltJj0WjYFImgjIKfkTf8cgvq9ctqeR+xcv2B7PqsjGDNyD9fUK+AF3e3pzjkcOkMqfrARrSvY8bHUf+BwpgCTpG1KfBp6ahqwsoURuh1VZJ9OmKWkPmoJZpVFxnUWccCrDnjbg5gXqMsQG5GZisJ7uG9VPriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715950510; c=relaxed/simple;
	bh=XYXVIrGk8WONF2AJBpCrV0JwFIgC5Y4oslQEkZhhPno=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g8wVBW7TzZ9K5J8S9hXKnQiX21mIknPY7eN0s/UxHuyhs6FGMEVPFY+JsjMQeFY7FLcCWPBsD/l8+jzI24N2tZRVXPE0D8CD/MUgeEQZTw6kKgqjLcNEJFeV/a1pow+fBHytc9aF6sgZk4upqTrns5ekAYtSPc0zciJArf5sWRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=bA+wAUc3; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 899A93FA5E
	for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 12:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1715950099;
	bh=zW5wTM7Wxxl+jny7CjNrz3i10lwRcwO9dJoFnZU/wW8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bA+wAUc3PPzoStlPejsbvERe1ZgHqEGl3ls8aiBAnMxHPU0U+QoXnl58eWDDCzHly
	 xS10zCtCQvu4fC81t4Eoo9BznS5DHF0V2NJuWkPC2oD7jLzFms3yKqjwH546PkGGaq
	 DGJnXBmSW95/XSDbfmwKpd/rH0psmsG1RFH6pMevHGj7CqAo9UHTvmeQ+G1zsGTuZe
	 P2ZH3Fl3EBeN7d7US5CWFFi3vXuNCO6aR6gzyUIB8TBnuFzSpainEV6R/POK+5Tbzo
	 cdyuSqSZ90ITJMT+QqjecZ9XQqX5rAVBL0V9Z231QPRwLPMUyc6eqCFY91ogNcwizk
	 0mTE8bmu0EPjQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43d873466b6so102392481cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 17 May 2024 05:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715950098; x=1716554898;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zW5wTM7Wxxl+jny7CjNrz3i10lwRcwO9dJoFnZU/wW8=;
        b=H/RZWUg9xgB+b+WTwdpN0uNMWoF92wdke7qyPuFFRNkfqYpFIaSCRYGt0XVTbnKhul
         IaP1XDGlBqDBWmSE4DlZ+f9r508+zEAwIqviQ3hMzkkwJH0EkGGh6lXf5iUp1OewgL3+
         lkEVLIwRQMflS/lMNIe+nQdoO+0YyngxgIFslVIfQxJ6233S4dm7s4O6WX6lDNVRV9I/
         HgU/4miHOb2D8eKi6LdGbw3F6BSI/ICzOKHfJsgltAuTDta2rFumZiR9gqVjeTcxtA7k
         bGChoXMjc4q3u22zUZuHFcfw8t2aEBucx5D0dPHgxJdVf2kneGDLlNZvG0ej17uSdODZ
         8WdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRka8LYRWZvTzgHntypKGOfUGjKZz8nvW87NwMMLXM2w0oCzajZ7dPwXol2bYX4oTsarl0cgtxQfZ1R/bOs5FkTlluDVX4gQIV9w==
X-Gm-Message-State: AOJu0YzySdrN01hb2ItHAjy3SP23QdA0idW1QVGeWjHiZNDrpXln+QZG
	2lnStpkLzxYCdNpqn99AWm4iRl60wKn+924AyNsUAR7kUwAtMrMxvUuQBu/db8fVbQezxx6ZCLG
	f+9cgqF3dUxJTqj2b89JzWmiOga16BGEJ5ScfNyZAEbO38cX5jK0dBkryA9isKTYdEf/REhMidB
	34ccZQv0OtJ4bN4mZah6caxP64ftqITIjGndbmemtDKIG3c//CNA==
X-Received: by 2002:a05:622a:8b:b0:43a:d430:b678 with SMTP id d75a77b69052e-43dfdb170a3mr219093561cf.32.1715950098578;
        Fri, 17 May 2024 05:48:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtRO5hEORW+Wcqb6zHImpmRtuEa+IJ8HEKNoCDnJQ+6k7eHn4EtAEkRMeLCfvr/vbfy2QNeJB++3V1NE8uVYQ=
X-Received: by 2002:a05:622a:8b:b0:43a:d430:b678 with SMTP id
 d75a77b69052e-43dfdb170a3mr219093261cf.32.1715950098054; Fri, 17 May 2024
 05:48:18 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 May 2024 07:48:17 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240115173657.GA999912-robh@kernel.org>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
 <20240103132852.298964-2-emil.renner.berthing@canonical.com> <20240115173657.GA999912-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 17 May 2024 07:48:17 -0500
Message-ID: <CAJM55Z9xF6_WCcg02xJJfu=UCOj=4m64BXvJTaV4vX09WLhc0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
To: Rob Herring <robh@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Drew Fustini <dfustini@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Rob Herring wrote:
> On Wed, Jan 03, 2024 at 02:28:38PM +0100, Emil Renner Berthing wrote:
> > Add bindings for the pin controllers on the T-Head TH1520 RISC-V SoC.
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > ---
> >  .../pinctrl/thead,th1520-pinctrl.yaml         | 372 ++++++++++++++++++
> >  1 file changed, 372 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..d3ad7a7cfdd1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/thead,th1520-pinctrl.yaml
> > @@ -0,0 +1,372 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/thead,th1520-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: T-Head TH1520 SoC pin controller
> > +
> > +maintainers:
> > +  - Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > +
> > +description: |
> > +  Pinmux and pinconf controller in the T-Head TH1520 RISC-V SoC.
> > +
> > +  The TH1520 has 3 groups of pads each controlled from different memory ranges.
> > +  Confusingly the memory ranges are named
> > +    PADCTRL_AOSYS  -> PAD Group 1
> > +    PADCTRL1_APSYS -> PAD Group 2
> > +    PADCTRL0_APSYS -> PAD Group 3
> > +
> > +  Each pad can be muxed individually to up to 6 different functions. For most
> > +  pads only a few of those 6 configurations are valid though, and a few pads in
> > +  group 1 does not support muxing at all.
> > +
> > +  Pinconf is fairly regular except for a few pads in group 1 that either can't
> > +  be configured or has some special functions. The rest have configurable drive
> > +  strength, input enable, schmitt trigger, slew rate, pull-up and pull-down in
> > +  addition to a special strong pull up.
> > +
> > +  Certain pads in group 1 can be muxed to AUDIO_PA0 - AUDIO_PA30 functions and
> > +  are then meant to be used by the audio co-processor. Each such pad can then
> > +  be further muxed to either audio GPIO or one of 4 functions such as UART, I2C
> > +  and I2S. If the audio pad is muxed to one of the 4 functions then pinconf is
> > +  also configured in different registers. All of this is done from a different
> > +  AUDIO_IOCTRL memory range and is left to the audio co-processor for now.
>
> It is still not clear to me if each instance is a different programming
> model or the same with just different connections. The latter should
> be the same compatible string. That needs to be answered in *this*
> patch, not a reply.

Hi Rob,

Sorry for the late response. I honestly don't know exactly what you mean by
differenty programming models and what the difference is, so I'll need a bit of
help with what you want me to write here.

Any driver for the TH1520 SoC (not just Linux) would need some way to discern
between the 3 pin controllers so they know how many pins to control and what
pinmux settings are valid. Basically they'd need the data in the three
th1520_group{1,2,3}_pins arrays in the driver and a way to know which of them
to use.

https://lore.kernel.org/linux-riscv/20240103132852.298964-3-emil.renner.berthing@canonical.com/

Another solution would be to just have one compatible value, and then let the
driver figure out which of the 3 pin controllers it's probing from the base
physical memory address. That would work fine.

A third solution would be to encode the data in those three arrays into the
device tree, but I thought we didn't want to encode register information in
device trees.

/Emil

