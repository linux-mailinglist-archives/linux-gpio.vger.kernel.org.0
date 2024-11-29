Return-Path: <linux-gpio+bounces-13365-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD399DEB7D
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 18:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C61C42823CD
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Nov 2024 17:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C3419C569;
	Fri, 29 Nov 2024 17:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bDOwkwrp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44F91553BC
	for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 17:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732900284; cv=none; b=kyxx8dhJraoCDcw+w6m7SefEQrS2n6XT5NHlLH5pQdcvuyaDH8q7/elZNIAJsFJrm8gVFbDl6TA8o6r/YO5r7mnfZcA0a0wF0EG5x7lm3V5+5w5l58c3/zevKA9bM9Q+BGanNskv+rGNMdTyyqCFbyRlGAQJevgIrlkUEXmLY64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732900284; c=relaxed/simple;
	bh=u4VeqDNvTWRAhnRMPvx5ZxHgDaIe1hpfxIJoqfWrVgE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=faIIEEMg8T92sT2m1IlVH2lQudyK+5iwQPKjZCpT+7l7mt7i+ahdVIVwJGtXjEpyIM9ObWEXVH+3uyVB2U6PgqXgGxLO5EXbHEQXX4htQYa76wM9xUmvfoal9We9EyUvratuRWiJCXyGOTDcmvZXCJ7jKrzOLE61m4tBxZp7jQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bDOwkwrp; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df80eeeedso2134692e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2024 09:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732900281; x=1733505081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wKStJ4JMYm6/f7jAdkMonmjOHy/XStYH3AHNh9QPw+k=;
        b=bDOwkwrp57+hdJuQM2yuTXFuR2uJQz4KquU51t8PIHqO8eQiDyD9aQNlzcorNorPaT
         xp7YOLadRHiHqNeLg9IJY6J/ulFR/j/syM1NdPODXmEbzVOl5mUR/WOlAKf2q/W7pRWF
         OVISodhH2VoKdzyWp6LX1fXe+h47Uvf/jzI/K4qJMK0C/xvuS5ytvS7xf5oYa3VTLyd7
         VWtiSLzoTH2KjPpjC534rVGaPgyoky1fRIlQrXwp05orw95J08DpqUP7G6xtWuVpeMBw
         wDC8XOyxR1Qfs1jSuK0KTWCb5rsWjIdgrxuwVXnYBHN2hXoRrC0USPiYqn3iDJLpFYf4
         VHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732900281; x=1733505081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKStJ4JMYm6/f7jAdkMonmjOHy/XStYH3AHNh9QPw+k=;
        b=Gyp/6onozW/BLk51KrdnCsncGkKCU08Fr3xFWt+0Pw5vqq8AIxexYW1IQnfuB520Ub
         2v1qp13PXSL0Hi7rXUQULohaRd0tbiX3lUmfs6RnvVxBi6kudjwgZ7ihN37RzfcpvesS
         837+o98WuKdo59j32CF+8f11NBOdEGe1o/ShzUXZiR6AeCvt37x0h4+DvUHIU3pYjegu
         6s88tgpv2HIsHuPXuHMYiwSnKqtaqxoDYTsjP6MXRjC9KKmiCRcGjXOeVpCwbO9/3OW1
         8ZCFUVts/3yIPEu14HwQb6q+ODQDrt9VIViz3Z77v9rna8IBW8eUi1CwBEGYTdZ7nhDf
         vikw==
X-Forwarded-Encrypted: i=1; AJvYcCWBfYiG5Wrml3AxtNvVn+Bw15i+3pNBvT+d6AXfWdi4QHS8AsD51YrQ2vAbmQBcdQWBexEFI743y6oP@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXPwyVl84EiEG46oQYaAWmB1+bFMGKCJyv7x97JVcqIzIRlsI
	T+k/U4x7kwB8w+hfWavBjU7O9uPkiXGMm9pCX4wEMrRo4UDfhA8+wytV3Nan7Hg=
X-Gm-Gg: ASbGncufhx70q+sLPT6UhNGhTsg4gercjrt51mLKZ37ihqWtrNbWLI68iY2311/+8B0
	+GkBT6b12l1ZaSEJzOcGKgu8d3Pd5LUMTvotEXIqmWk/2mHdjgxRpwP+i6Uk3L/73cT0F4IgdCu
	3TM36fWEHiLmjEf/cqPboNz8+Kp3H+ScRAkln5DaXlb8G+0CXaeCRXaExV9PsuOFrPM1fHDwUhY
	vLamTBS4GZC3uVNOhhjU7xTRZV4+OPDsTxV0b8pd+l8vOCYoZW2ylK8IeejEu4vGwlsBp52HTAo
	7Wkxtmmp5ezj9PmkPz4j
X-Google-Smtp-Source: AGHT+IHZ3oTCh7gVSsmHhrZ3fiOp7cXkhyrNMHuydkCIk2tz2qxDfVIno+QP7oK2bTxacMEqt16MJg==
X-Received: by 2002:a05:6512:39d2:b0:53d:ec9a:138f with SMTP id 2adb3069b0e04-53df0112687mr8431697e87.57.1732900280754;
        Fri, 29 Nov 2024 09:11:20 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e63a2sm192130166b.113.2024.11.29.09.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 09:11:20 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 18:11:53 +0100
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 02/10] dt-bindings: pinctrl: Add RaspberryPi RP1
 gpio/pinctrl/pinmux bindings
Message-ID: <Z0n12a6irbXQomdD@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <9b83c5ee8345e4fe26e942f343305fdddc01c59f.1732444746.git.andrea.porta@suse.com>
 <4ufubysv62v7aq53qfzxmup5agmqypdvemd24vm6eentph46qq@3kveluud3zd3>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ufubysv62v7aq53qfzxmup5agmqypdvemd24vm6eentph46qq@3kveluud3zd3>

Hi Krzysztof,

On 08:55 Wed 27 Nov     , Krzysztof Kozlowski wrote:
> On Sun, Nov 24, 2024 at 11:51:39AM +0100, Andrea della Porta wrote:
> > +  '#interrupt-cells':
> > +    description:
> > +      Specifies the Bank number [0, 1, 2] and Flags as defined in
> > +      include/dt-bindings/interrupt-controller/irq.h.
> > +    const: 2
> > +
> > +  interrupt-controller: true
> > +
> > +patternProperties:
> > +  "-state$":
> > +    oneOf:
> > +      - $ref: "#/$defs/raspberrypi-rp1-state"
> > +      - patternProperties:
> > +          "-pins$":
> > +            $ref: "#/$defs/raspberrypi-rp1-state"
> > +        additionalProperties: false
> > +
> > +$defs:
> > +  raspberrypi-rp1-state:
> > +    allOf:
> > +      - $ref: pincfg-node.yaml#
> > +      - $ref: pinmux-node.yaml#
> > +
> > +    description:
> > +      Pin controller client devices use pin configuration subnodes (children
> > +      and grandchildren) for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this
> > +          subnode.
> > +        items:
> > +          pattern: "^gpio([0-9]|[1-5][0-9])$"
> 
> You have 54 GPIOs, so up to 53.

Ack.

> 
> Use also consistent quotes, either ' or ".

Ack.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 

