Return-Path: <linux-gpio+bounces-5905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE5A8B45A2
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 12:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F3B01F21D26
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Apr 2024 10:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC2B4594A;
	Sat, 27 Apr 2024 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M4KUxJ7U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9046446A9
	for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 10:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714215361; cv=none; b=qnKZI2UuiBm27qddcF0Ui5/dtnYPSOcbIx2SZd6klaxU5YiQeznWzhGbL7+KOu5ma97ZJHAdnjVWt51JL3L3NaDNfk0cJcqjGB/NY+H3eopr7IrxCly/SvB4bSCBVMkAgjIAj/rKUC5TlyWJk1latmblNfhwFXXxu6vPsr3ZzAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714215361; c=relaxed/simple;
	bh=30Y0vDFTIC+GZ4kILAnfrxpQKyxIfE0SN088Unsl+Ao=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP8onsN471ebCR8pdwHLkcqAs7nVGJMrCWkBgA7xfm81uTe57a7ZuVA57OJE7gk8wuX9lx050SXfeV9gA1cXSWq+RCzz0MViCD//X7E94eNOoTxtBY5tBl1fR5HOeePhwrPoMqEiGH3TR+8mvSBxJmlOU2p5BWLwPN0TZmJqQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M4KUxJ7U; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2dd6a7ae2dcso46507151fa.1
        for <linux-gpio@vger.kernel.org>; Sat, 27 Apr 2024 03:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714215357; x=1714820157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AVy+Y3fQ+ZL5eTtoRlGJR4TNBIR1UBCGRhefmZftvMw=;
        b=M4KUxJ7UOZz4VX2NoiS+se6iptl8tDexJH5RdwaGrt9ANLLx+HwZ7ECBLS8UdKGbL3
         mdFVDsXRI6Unub6iyvenM5bt0lnOKrzQCl21RPGMmrUgC7xJeljhZhCYsHkAVntbRkTd
         01o3ncEnSLrlZLxROFkYSpSo8JdCMKBepg3O+Zd3aoFuLrhW2M6MWMROh28/HuSTTj5f
         OlAPQNV4XrzxKM9uhyd4VsmF1ItZHbiH+AyraT9twOAyFa31Xlmm+wdQuP+i65IwAxKz
         CU5AtVkDxBgMVX4DcNlxmNo1EkxBJrwiM4hidscO2IXdeQF6avCBuA1ivjeJlJSEf3Qw
         0X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714215357; x=1714820157;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVy+Y3fQ+ZL5eTtoRlGJR4TNBIR1UBCGRhefmZftvMw=;
        b=mrW8R1kMZkv9/Ge7FaYdDZgtnoNFkVqk2uTPvjKZLTkZqeuyGYSb5Yk/GRXYc3az++
         pK/ErlSFyLScb/tom4z31cT+PwqkRq+5NFHIIcxAqfm4A+3myuLPsPNFWD9gQ+oqPmWc
         U+HtNiMSHiBp+pIgvUQ3hVKc+kZyX98v081Kp5RCiWZ28UDgxlrLMG7TBrI/DvliJWX7
         qlD1RGkD5H9CjXJmBvO72e0q3N7IyRPUyjc+LdN1QsZz8QfnapO3AL+uRH3sa5MjYtLl
         oTPfxbzqsQtVkL3zir8Y23ALt1nWGfMmhO+YctSR9bzAT8sFmK/T2niuH3G2VGpA5fQZ
         grrA==
X-Forwarded-Encrypted: i=1; AJvYcCVZASnNq8V9DYcOEQxCHvFw8+fCvBPfDL1J+2o+5b9I6S0um53GLkCbn1RnLE7ifm18emsd/Zf9fEwW4cGtAieog4yDV3oPkwkpLQ==
X-Gm-Message-State: AOJu0YwFrVk+DOvHCjzuYFIVlttbdyhTu2Acvdu6E8dR4bTNjPnC1cYZ
	MsBKM5KQG8cSIjVCxorlvicyRmy+vesaI/wTc4+09Pjfe0iIO+4u6Auf9h4FN9k=
X-Google-Smtp-Source: AGHT+IFbYDgaYUGXxbXGJ4orAbrnlEp+fN+SYD4kxVugbNaLRY0H7Dzfacf9J7Mf14vZwL/Y6Mmgew==
X-Received: by 2002:a05:6512:329c:b0:51c:778f:b569 with SMTP id p28-20020a056512329c00b0051c778fb569mr4049642lfe.29.1714215356833;
        Sat, 27 Apr 2024 03:55:56 -0700 (PDT)
Received: from localhost (host-87-1-234-99.retail.telecomitalia.it. [87.1.234.99])
        by smtp.gmail.com with ESMTPSA id i13-20020a170906090d00b00a588dab605dsm4285140ejd.88.2024.04.27.03.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 03:55:56 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sat, 27 Apr 2024 12:55:58 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: Add support for BCM2712 pin
 controller
Message-ID: <ZizZvpv3yomm0L3i@apocalypse>
Mail-Followup-To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
References: <cover.1713036964.git.andrea.porta@suse.com>
 <2d1272cad92ad618297a6683e9264e31b8f2df73.1713036964.git.andrea.porta@suse.com>
 <f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com>

On 08:45 Sun 14 Apr     , Florian Fainelli wrote:
> 
> 
> On 4/13/2024 3:14 PM, Andrea della Porta wrote:
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >   .../pinctrl/brcm,bcm2712-pinctrl.yaml         | 99 +++++++++++++++++++
> >   1 file changed, 99 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712-pinctrl.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712-pinctrl.yaml
> > new file mode 100644
> > index 000000000000..2908dfe99f3e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712-pinctrl.yaml
> > @@ -0,0 +1,99 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm2712-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Broadcom BCM2712 pin controller
> 
> This is not strictly speaking BCM2712 specific, the pin controller you
> describe is a Broadcom STB product line pin controller.
> 
> Please describe it as such as and make BCM2712 a specific instance of the
> chip using that pin controller, see more comments on patch #4.

Ack. It turned out that the pin controller is not strictly need for a bare minimum
support of sd card booting, so it will be drop in patchset V2. A future patchset 
will re-introduce it when needed.

Many thanks,
Andrea
 
> -- 
> Florian



