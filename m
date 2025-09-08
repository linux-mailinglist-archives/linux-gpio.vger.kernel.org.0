Return-Path: <linux-gpio+bounces-25755-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B2DB49787
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 19:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB983BE372
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Sep 2025 17:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820D03112C8;
	Mon,  8 Sep 2025 17:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I26kHjAg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B383B235BE8;
	Mon,  8 Sep 2025 17:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757353705; cv=none; b=m+pFHixecV+zjJPo7ECeqR+5T7ooovH7LtzUZGDLOLNI+cA7YPFHXv5AEWe7zw5tf3lzSfJNEb/a/tLgvyw4M+DM8Rgz2O1GpIcQKx3j5t8GFYfi/xLSkCwRLYu8KRxuXBHvtExFBFhd4/PZb8IHV8Yrk7uAq06GWP+nlx2/Dio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757353705; c=relaxed/simple;
	bh=1J95CYJMj61O6AKdqpxemdltuAb3lriEHe9QY0csmrg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvlmNEjrBKzlLRkwF2/upHAyhzz7JlvdWehyAMdWE9fe/0K6flQ1+iIhi/m7NL+CimtBv58GmDSju/LURkBc9rd+C/kWA7cHWkQTiqxmTg0fWrEsxlhHyijDenxHPEfDxpKpVE/OUautBjM2QWLdlKKoZeGTcln3DuGKBUBNyqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I26kHjAg; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3d19699240dso3444955f8f.1;
        Mon, 08 Sep 2025 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757353702; x=1757958502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YcHw8P5EMslNisFsrgaPX3AJmmyXYUwkEC6T9yd5ARw=;
        b=I26kHjAg7MfSLw3ofIUfOBGi0rQ86dfcnufMiEGM7XyvBLgPNL4fwrgM7Ly4HnOfA8
         4QnQPgzwSzP2Rf4BNaMZ2AgGYF3Dl6za3mQuy71KAciLxWFgQ4uBHcbSxApuM+1oI840
         KV0IrTEYpPN9HNXQZXWAop3IIVcZsH/6TxSvibm4P6057fEPaUFpRvEKRBdkKGiFV0lf
         HdaD40NK1mXQ8WqE2rjuyR7m4kwGfo9rZZyrQmLBFBA7j2EwwL0nzdd8eSMLTRCwkXFK
         5tvanFIga5487u6ndQl2IQBtJkH9/DoFVBkIaDuuMZ2ATZThztvcqxa03f4ryN0mh6Ux
         sYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757353702; x=1757958502;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcHw8P5EMslNisFsrgaPX3AJmmyXYUwkEC6T9yd5ARw=;
        b=WY29bpjG7LgyvYinqx/FFp2AxcsKFk1EaRjvK/6bH1aA3LdcUQi2bP2s2pCBUnjTcR
         UED1rCrnD5y5t1v6QOEbn8W9WKtbigqW3ZEbO/Nh4WJ6LYidkv0R2fNlDZsbfusGKrq8
         ZzBJ1ZTMC0d5M4PU1I5yHMXej9ypdnnwm1tdKa09Wfj/ZxvH6ogBexJt2Om1dkMvwjNN
         DwYY4WA+ajI30OsfWzWnfkVHoXCkVfFuvKi6KKRYUQs/PPRl1uNRea4UH/f8CpAqTBik
         bWDJkC0xyB3Qfsy9nvnYlkIwmMmcXv8DY62FOKeCYb0eGp+3hoonio+1xTGmXdtja4bn
         U2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCU6UWETY+2rbBJeCcrfk208iUtV/jP+nZAw5AJkdYmrz1wQdG+J8v/TpCwS6WDZ7D6RPGSiAYmrQtQA@vger.kernel.org, AJvYcCWJl77hxsJUC1lIKIXdmpg5MzDv4CdwWbaE1vRzl1ftRCIVus7HR1MborlTfPge3ouyFENAUjlc/qDXz4Y8@vger.kernel.org, AJvYcCX8esvlbE78w+w+cz4wypRtEc3KgZJaqVzzOPf2gaPfZ+L1JaFyzwgM+RkZ6/SRiR9CN4p3Hk6j@vger.kernel.org
X-Gm-Message-State: AOJu0YwOo3+cQheoRKldNHP9rtmUdvtERt9OfizaY4YEQwsX1lNyzWO/
	emnikQne/szMtsrje1z2JQ7P6APo/eHK2g523NeDAaKNQCClKfmSZdet
X-Gm-Gg: ASbGncvk7oe/8BuJR2rbpAsIFem3ph76ruKX73409SNv6yD7+pKr94V+qYOkz/9lA+q
	tag5jmOAapgyeJ+JfkhsfQGHEEaaSpaqZPwBPmWot37b1ltwgHdrQ0i9n6ZC7ixyKdBoxIhH1Pz
	ast8nIA0F9A6SCwkJmJGU9+V57rXGwDigMB+YnBTZoNQIfi2JO3O6tZrKzi+oASJS8y0h88izFr
	NxWKRYS2/9Awm6YLa4N/fhvaOCl2IsgXi5hzCYH0RXe5VgGbawi6Jg8C50TxlWg27WcnI/5UDqr
	cWs5aBNCz4c6PNF5XXPebH7l3VsXDcPHGAaZDzamqQ/8qm8aeffibIfSU7fat2aV2GgoCIIvdf5
	fnOanyoF3ch/1hitrfwHX947sMyyJoaiPBPxImPVSiNj5YNmf3JPKAmUHZLNOHuZmtNANF3Jwes
	blSWuP
X-Google-Smtp-Source: AGHT+IFq6o1EpTze8lAPdy/p+9IIgpxXlJzHOvrLDm8Mz2ZpQF7/Pb8OvU3JVQI7GB8uGSBt0UZ7Lw==
X-Received: by 2002:a05:6000:2084:b0:3e7:45d1:9d91 with SMTP id ffacd0b85a97d-3e745d1a116mr4929204f8f.28.1757353701694;
        Mon, 08 Sep 2025 10:48:21 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e1a31c69e4sm16547400f8f.44.2025.09.08.10.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 10:48:21 -0700 (PDT)
Message-ID: <68bf16e5.df0a0220.2e182c.b822@mx.google.com>
X-Google-Original-Message-ID: <aL8W4dEEI22W73DF@Ansuel-XPS.>
Date: Mon, 8 Sep 2025 19:48:17 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
 <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>

On Mon, Sep 08, 2025 at 06:54:15PM +0200, Andrew Lunn wrote:
> On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> > With further testing with an attached Aeonsemi it was discovered that
> > the pinctrl MDIO function applied the wrong bitmask. The error was
> > probably caused by the confusing documentation related to these bits.
> > 
> > Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> > is never actually set but instead it's set force enable to the 2 GPIO
> > (gpio 1-2) for MDC and MDIO pin.
> 
> Is the MDIO bus implemented using the GPIO bitbanging driver?
> 

No it does use the MDIO bus integrated in the MT7530 Switch. It's just
that the MDIO pin can be muxed as GPIO usage.

-- 
	Ansuel

