Return-Path: <linux-gpio+bounces-28654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C33C694D6
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 13:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2622035B9C3
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 12:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9AB355021;
	Tue, 18 Nov 2025 12:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3WT6lDP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524334C828
	for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 12:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467527; cv=none; b=Bi5TOUdr93YtLU1mrybsQAT9IjIMGCs1urcOnVWT6qBHQTPq6ut1oIs5b5HYQof/iJlNFpSmDC8FKhd1jx79Sbcm9jy/DaTp3P2eTT9NZMnS0Y/y5ZtyzB5QVCvPouomJGrv+TkcuBu/0cMEuJGUGIe3EJVDRgLqp9NTs8sBCgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467527; c=relaxed/simple;
	bh=BnNfxLLOXcPo0BsmxiSHP7zp9xkpd9PdECh/RGHDl1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAkWoN0fipMlebCT32r7bxltQ1yidHNcKx3n7gb4Mwtk3EoMoPNN0ZRASSNy7waGigwwdKjG4nAIswgRfMzmfnZVH+j+ZTVAlDwKavV8TW47Sgow0nq5nVypum8x+pYSWOxJXqVGwsM62fGhoRfjZYgMDHoGYHST285JjuCi/m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3WT6lDP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b728a43e410so875551666b.1
        for <linux-gpio@vger.kernel.org>; Tue, 18 Nov 2025 04:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763467522; x=1764072322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnNfxLLOXcPo0BsmxiSHP7zp9xkpd9PdECh/RGHDl1Q=;
        b=a3WT6lDP59+0U5Bjq9EZaiqokNFbIe4HqLY036CDGKoZfyTTHz6vPIWraKMwgq649q
         V6dle2rBMPnUVwBDtbsMqaSuAWQvH2jMGZUbYhOoZvh1F0aoWBLP9pCP5mGuws5bY5FA
         tywdXedU2QAtyfBmGs1dnJsZ1uPyn91aLg0OZy8xtdpZg9W3FDZfYD5HIQCVhr38DFES
         g+kh61fTL5pCExLy6uBRHn0juhTt4sF0h8zK/tm9ddTHSGFakOuH5TpDovi2Owf6AK6P
         vFOGMEfke9lJxVpqaaD0hP43oJz7dHbrtET90xVMEKtuVTHKbZT1NxfStkg2cTg+L4/+
         CRxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763467522; x=1764072322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnNfxLLOXcPo0BsmxiSHP7zp9xkpd9PdECh/RGHDl1Q=;
        b=lLGhs3sQ3pdcyGdhCXHsNweulo5KJY+cGFMYfLzVS5FNBVB/I1dUXQjKUUio8/MpvM
         zpgjlcH+GXIlMn0joi7M3cDVpUVjc3jtfe/ho42q9kAehx81TPob2HgXZuJg9RKJhwh6
         Zmc64ZVLCiZ3z3+fSGuhgY129ZQj2u6h9oNjKEd3HLK5EE32kPYHW5J+VKTC362bljOT
         p5eSAOhTDz9DXGaQj6M+Z0FMOpcFfxRm3e4ofFh42ZVYlCcfXYWDkWsCapnw0Y88VSXQ
         f+cZlawA5nb27e5ggz4EFJLAGwjn0qLEbY4cDEquBWVAamB2P8nCDSNOmwMzlADxXgTw
         FVtg==
X-Forwarded-Encrypted: i=1; AJvYcCWTA/Vf3nL5wEVMIG+KqLr0vV3WdzsXTHceZkjWMnd5qQxm4XRFlN4gG6AyhDTru2WDwGct7yna12nT@vger.kernel.org
X-Gm-Message-State: AOJu0YxUe0OMCmk+a/B+V6QcMEAqI1MqyQv2KHTRZExkh7N/KaBXtdyQ
	hRezyMWEfx6mcwv84FgsVjTswqCVxGcQhzv6fyHLJ5+1IYEkQpyyq18FqaFSP4HKc4wAbNmX7Co
	8xAoDQAhD31ONJoRJed2AIVqTQsVclcY5G0Ba
X-Gm-Gg: ASbGncvEA3f0r107E2gV/U6JncglSRynbPLuBL5CNH+W+HIG6x5aD1i9rjLyu0YUqRz
	hgw7hHeDCZL6520lfQfOKz8pij0P0C7gLYdMNY9Pvu+F8pJTl+E7KLzS+y5dFOoLgQe4R4+QZ2g
	FTthNy4aDt6wavKBRzEKTvVnoKlzVQT6iGSzAXLczOfJ2HFU1W+6MDk3DofdUGa2rVBb2nKd8fG
	pXDKlCCROPQJjXZ4W9aD1bGsc+PSPVrwEsRDSbZqHr+x69h4C8Hy3DaiDSIopPxPVf9XrV8IYrS
	AVXmb4AD35KOo5KXg5pQDJ4M4tMsTxZJAYACSPxCPfF17o77NIcH6Xz3Xc7bbP70RhlIrPs=
X-Google-Smtp-Source: AGHT+IFOIQA5XCr9wDR0l88zatKwHil1KLB11YbsturieV9B6AwQ53smryvU/9hvT+shL7nvq0UcEusXZF/3NMVJPVw=
X-Received: by 2002:a17:907:3c90:b0:b70:be0b:6ba8 with SMTP id
 a640c23a62f3a-b7367c001d7mr1569770866b.61.1763467521644; Tue, 18 Nov 2025
 04:05:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117075826.3332299-1-andriy.shevchenko@linux.intel.com>
 <20251117075826.3332299-3-andriy.shevchenko@linux.intel.com> <20251118114730.GG2912318@black.igk.intel.com>
In-Reply-To: <20251118114730.GG2912318@black.igk.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 14:04:43 +0200
X-Gm-Features: AWmQ_bm2Y8wdSF-7AloGEQ9vBzXCr-MxKAmVrtc_7Hc-EOtk3pSRopQnQYKYymg
Message-ID: <CAHp75VeuX1BWnx5wH=c9WwuiC10H3SOEPJetYhQ59mJhgBGGqA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] pinctrl: intel: Export intel_gpio_add_pin_ranges()
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 1:47=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Nov 17, 2025 at 08:57:00AM +0100, Andy Shevchenko wrote:
> > Export intel_gpio_add_pin_ranges() for reuse in other drivers.

...

> > -static int intel_gpio_add_pin_ranges(struct gpio_chip *gc)
>
> As this is now exported, can you add kernel-doc too?

OK.

...

> > +int intel_gpio_add_pin_ranges(struct gpio_chip *gc);
>
> Can you move this down a bit, above intel_get_groups_count()?

Sure.

--=20
With Best Regards,
Andy Shevchenko

