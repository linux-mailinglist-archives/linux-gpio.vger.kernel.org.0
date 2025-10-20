Return-Path: <linux-gpio+bounces-27323-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2FFBF3A48
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9978B3B3F32
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2824E2E62DA;
	Mon, 20 Oct 2025 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OLF1VWJf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264402D661D
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 21:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760994369; cv=none; b=j/gurtm/pdI+8b/6eE1sQEBZSG2/Y/lxCcPAKneivYzJT2B3qAzrM/WTAp73galj+5W1bkTHC5jc6Je+3bobVbhheIIxlFBmSqyj+Xux0iwwjnv/hve3GjtoJbyeaZocrzeSVgOahyPPgE+UeNL6B4uRCsYsKs/hMN1U2onAFxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760994369; c=relaxed/simple;
	bh=hJC6wrWvLGEYPpXdlMBPye+uWwg8bwB8IuKv8v2m3Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBHXwiliB08E/vG56kOmYw7HTpGV5CEl3rQuJrNeNcIJfUYLBG8/1dr4gUNwfB4sWb4n6HRiFNYDEPJrlwA5lG9cqtTebZAs3j9ys0HrzTYEXUn76IwAJc/sPoVL86PRANbEjU9wjfEf3sbSRldpRwLUgcL/t3wPeSJ+7NVqdqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OLF1VWJf; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37777912136so46324171fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760994364; x=1761599164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJC6wrWvLGEYPpXdlMBPye+uWwg8bwB8IuKv8v2m3Qk=;
        b=OLF1VWJfDnwC/YPBamHdiFxfR8WzcWlIMRMW1Vl7B/Hj0gXcZl4Tp6fHYG2zHFDiR/
         7LOKyucrMXZtbuWazf4guz9tp7Mi1/+zL1u5JnvghuOZW7KVTE2tkQ2NZ4yTBRbLXr4D
         2ttZBdxHPRD7I6uOuHkX6UmhHL7hM0W54NUYUcSNw81qAI3DZ+wcz0fM4CvrZHbDl9w5
         o4WUZW5CnKitDcrNCnUOTlqrNsinWTBPoDXIZIMYiiBfnDqhfYxNXzXBkgm17wRERepk
         Pah9527G3PSNYEsYt+2XaWeKO5KN0F/i93QU/GzNnRh2uY9bH9iXnDRe6oiux/cuuhuM
         X59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760994364; x=1761599164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJC6wrWvLGEYPpXdlMBPye+uWwg8bwB8IuKv8v2m3Qk=;
        b=snzF/ya0CCKfGY3hHRvdh+mHiDaKyTwHdVRho5lAPG7bme+8+uMVenkZgd87htEQSV
         ugFmoO261rQZvhVyalK8ZZE/HYUtjOaJh0/dsJGycycoPK+dTv1RkSGDdnutRMdRoy4P
         BdX1cXFPIdtU1y1/r8DyvAdX/haReU7PhO67Torau8cn7Km5Aqw7/z9Isrs8AMBIlpMP
         VVILeoUpro4fdhg28XU0wsruC/wHqQTNGkdpKMsLmyeYIvrd6iYdviTRTPlE4O/Mj0bB
         9BMjOSWw3YQRyTobN40awdeutYfdlng6wxV0neEuLYOKye1o+2zM5MxRNGpbyKcrVzIN
         pjfA==
X-Forwarded-Encrypted: i=1; AJvYcCVoxOlEi+oJFaJfS1bfqmqFtiRgULYUjxFMPAcSAFh4iMoS3ux5JPZIInjyX2gOEk8b63mXBxwrBrNX@vger.kernel.org
X-Gm-Message-State: AOJu0YzHc/mVTXJpD/cR/3DaKaiWc+CP43z9W69jONHHHME10e0IjXY6
	TLJbxFn3St7bCQ+GiAyUsnA8Q4Zb9GUpl12ohEgXiB1I3Oe762h4AjK5y2JVnqOP1wdgGicMX3W
	PjgmRvhkD8/PRuCY6NFVgXYpfy3Ak1s5wY6LOc9YHIA==
X-Gm-Gg: ASbGncuqaZ6K4YKcEXWDr8p+xRpETlNvCYveM+I0r9AqlSSYmIDa1/ScKeNCPn5B6Zt
	x+Qy7ADZ99JBxrUvR8AKofHt0iEpRxf3/v0iXhmWaGo50EJ42gkWnQqNCV7Y1XFQ4aPmC8M4+c3
	ONx3e0P5tjkiUXP6dUt1GWyOwX4ZS3a9TrSU21Wa8pDO9gCxhKXF7XG0FpbDM9bgLp45JQwkijN
	rzr3E1/DXUO1cQOAYNNwcnWMlhlibRNBS6YR5w/WFy0FXFPajdiq3w4Rbj2aYgPjhEh/Q8=
X-Google-Smtp-Source: AGHT+IHqI5sn0aHZVxmgNoOeEHqPV/4OMj4aOHzfWKj6c+31WvQm9My5mBGOvht8/Q+3HwJ1qNC0mchFVak7q0/vhTw=
X-Received: by 2002:a2e:bc87:0:b0:372:8e46:3705 with SMTP id
 38308e7fff4ca-37797a8fa2amr46522241fa.44.1760994364136; Mon, 20 Oct 2025
 14:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014-retype-limit-e6cbe901aa07@spud>
In-Reply-To: <20251014-retype-limit-e6cbe901aa07@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:05:53 +0200
X-Gm-Features: AS18NWAM_KkQJcc4_uDxnZUaq6pPWmRrcpznRb0EhOrILJeBdRjz8Rzkex7daQs
Message-ID: <CACRpkdadawJmrED-dPpnm+MKD1ndt4V86GOebkiQzU=d+-vHjA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Microchip mpfs/pic64gx pinctrl
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 4:36=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:

> From: Conor Dooley <conor.dooley@microchip.com>

> Following from my RFC recently [0] I've got a v2 here that's implemented
> the change from using the pinmux property to using functions and groups
> that you asked for Linus.

Overall I'm very happy with what I see, I see there are some comments
and my only comment would be to add

depends on ARCH_MICROCHIP || COMPILE_TEST

on the drivers so they get some proper compile testing, and I expect
we can apply v3.

Yours,
Linus Walleij

