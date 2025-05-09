Return-Path: <linux-gpio+bounces-19886-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D8AB1D71
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 21:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EEB44A2310
	for <lists+linux-gpio@lfdr.de>; Fri,  9 May 2025 19:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D34425E471;
	Fri,  9 May 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le/92JMZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93588242D9B;
	Fri,  9 May 2025 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746820024; cv=none; b=MIAXjFp9vtiXhXzTGWCPKysIeMWdsniCNIFj50LDWCzDBVXG9kRTCAsnGtgFMgJYsOnboZEmicU2AJr2wItFpDAowjnyNh2NDfA30Rzwew/t1c9jcsAroi2vPnBgTKPjKk250VnG5PmyhqYCpNPe/n+/k76LaMzN9gPhxCL8ReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746820024; c=relaxed/simple;
	bh=fP/D3NKMfjnaouJ8yBeXcuhS028Gg6ZJT3Z941DHcwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fw38M2oz8tXeKk7TjZiEbulUFK9P13qaAx9gpPBKGirnvlRR4Yu5aLv7TGtBnma3YXIT96Nb51Wm9FiKBkbzdLa5a7DTeRarkFyB1XFXOaJ6cUAaEZuTMQ4jdxBmzxF92CX3DCNCRKluSTQStDz8ZpudNU9tJAF3i+2b2mItILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le/92JMZ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-326ca53a7f1so7971101fa.2;
        Fri, 09 May 2025 12:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746820020; x=1747424820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/xUGnGwA8/pVkqq+tSbMhlVx899aYUUBq3Fbu6drIs=;
        b=Le/92JMZgLnGh2k+xuDuhrrlj6XmrClL21/IFP/EArgXUWcFM7iPu0ue2Tin8B7r50
         CbmgH4Wbkh2ChnvtpVhMfHhqi2Twrwhc1HWsTyxQJkCJMWDeZd2Ia8TlszOjwKWuP1gp
         CBTNZbB4w+Ub/gzWu6hQnSo4EmRBmFxTSaZUX6rP/UbmAU0cJ01rGiWOWScKfdmi1Ild
         1oK4ptGPAVGdUaU7kONisQonxS85pc2IT0nwEcIkklq2iH9S70sLV7oZ7pZL9NezuVHE
         H85XFqhOmr9/wuLAowPLWUMGk6RsK/9/I6u2GmPALqAncVi6mb8zMPNBxCqxNYxoCG+z
         Qjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746820020; x=1747424820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/xUGnGwA8/pVkqq+tSbMhlVx899aYUUBq3Fbu6drIs=;
        b=vvBUN9Mt/DrOtU+nARHg8jQ5LmTJsV4eMm0TQvTACQUoZfHNFanx/2Q3JJSdgxl2Sr
         vAy3ouCnxIfA0NTkOi20ejTEXE74DP+4n2abU1I6aMRNDoPWfgrIUESOykvsSP2PF6iD
         dOpxkPbTLa+I24rk90HF8G8MTXHLhctBnc7tK9BKV+0n43M0MgxfLgn74rUgrbmCTcoe
         YKzg0eCsKVaMFqQ3ua1DIRoxlTu4X1xJjbFwFUpYZa/Wd30EF14gvE/z6pSZjLOphHYv
         qdfryx8DnAjcMk9cAqGIzKnENOfVyN9fN0z8EJ5Gu1uF8oveTkCzkqwIaGHGJthZThaD
         TYAg==
X-Forwarded-Encrypted: i=1; AJvYcCUHHNTUoqRRoYnQdayB5+30wOFe3Gq3C+3M/+CZxqBtphfpgyzUMbAZz2D0hW4OwgqmOpDtlNeKQZNhU/aQ@vger.kernel.org, AJvYcCUNmwZX4lwGDOiQ+otp3kfLnHWehZ9/6gO3cXE3iMnDwR9b5XsSpsGaLkIYzWRXjkbigI8dzgLjHmOjzA==@vger.kernel.org, AJvYcCVi1Nib9IF74B0ppGS9xJqGoc+A0L2qEyCxWk30muEsK9zQRxFbiOb6rqmymEBt5LktqTLz5Tqw2Ywf9fM=@vger.kernel.org, AJvYcCXlpPYjGN0Ba3Uydq92jGBWMhjfhc48cXyJ+JU7NQNFBps6s6dk6g6A5e3RO3QNb2zm5fsyrQlLIzDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0KfDcqGk/KuYhuCW8RNogZFvwsYpLE2XsrjWvDD852ambW1gL
	9l5uZQEnZj3udwHnwh5S/trztu1CZYT6u7U0TmWEVEToEMlI9N5iTiUeOzsQM/sHOaxVfCbM6di
	GB6b1JwYQgLPI0KDigxw1afsuSa4=
X-Gm-Gg: ASbGnct/STlELz7zZN98d+COHKxXuNA54m+9PCoXKrwO3QGy0Pve+9mY/Gr04VtCt42
	IPmQJb7THZKXeEqtoK1eqtrlsEWH8asqWurDOkOgB4gdPUzsPCdIgJVy9H4W0bc6i+5Tca03KRz
	Q0iX/t480tA51+vv7GKcselFbuD420QGEG9g==
X-Google-Smtp-Source: AGHT+IEwF5CX4C4RdxhPi6Xu7s+TIXT6+QXNdjvugnVzVLMA+AGlqTP4VW4PTIFykfUE0h/zxkgFN9VBUM+j4ASOtRM=
X-Received: by 2002:a05:651c:547:b0:30d:624d:c064 with SMTP id
 38308e7fff4ca-326c45c30e0mr17743361fa.10.1746820020219; Fri, 09 May 2025
 12:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
 <20250429-tegra186-pinctrl-v1-1-722c7c42394e@gmail.com> <20250509192212.GA3945761-robh@kernel.org>
In-Reply-To: <20250509192212.GA3945761-robh@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 9 May 2025 14:46:49 -0500
X-Gm-Features: ATxdqUHyUEXWx7mv3OLhewoq2M571CDIo7TO7VVOkeygGmFKV_ERgj1t8QruMn4
Message-ID: <CALHNRZ-QFhrU+=nfN+BFjCe6gDzpE74sPtdofZjC7B3fmoyXVw@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: Document Tegra186 pin controllers
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:22=E2=80=AFPM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 29, 2025 at 04:33:30PM -0500, Aaron Kling wrote:
> > Tegra186 contains two pin controllers. Document their compatible string=
s
> > and describe the list of pins and functions that they provide.
> >
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  .../bindings/pinctrl/nvidia,tegra186-pinmux.yaml   | 285 +++++++++++++=
++++++++
> >  1 file changed, 285 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-=
pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pin=
mux.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..2fcf42869d7b68671ae3ce7=
8bd33787901ae9203
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra186-pinmux.=
yaml
> > @@ -0,0 +1,285 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/nvidia,tegra186-pinmux.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra186 Pinmux Controller
> > +
> > +maintainers:
> > +  - Thierry Reding <thierry.reding@gmail.com>
> > +  - Jon Hunter <jonathanh@nvidia.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra186-pinmux
> > +      - nvidia,tegra186-pinmux-aon
> > +
> > +  reg:
> > +    items:
> > +      - description: pinmux registers
> > +
> > +patternProperties:
> > +  "^pinmux(-[a-z0-9-_]+)?$":
>
> Is there really a case for having just 'pinmux'? Seems like there would
> always be multiple nodes.

This is copied from the existing tegra194 bindings [0] and every
generation of tegra pinctrl bindings that currently exist supports the
name pinmux without a suffix. My hope was not deviate from the other
tegra archs and if or when updates are needed, they can be applied to
all generations in followup patches.

> Don't use '_' in node names.

Will fix in the next revision. Now that I look, Tegra234 already
restricted this, but I copied from Tegra194.

>
> > +    type: object
> > +
> > +    # pin groups
> > +    additionalProperties:
>
> Define a node name pattern here instead. Allowing any name was for
> existing bindings.

All existing tegra generations allow any name, and I don't see any
pattern that could be defined based on the existing examples and
usages. I'd again like to not deviate from the other archs, for ease
of concurrent upkeep. But if it has to, what should the pattern be?

Sincerely,
Aaron

[0] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/=
bindings/pinctrl/nvidia%2Ctegra194-pinmux.yaml

