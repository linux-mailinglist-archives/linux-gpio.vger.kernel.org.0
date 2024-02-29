Return-Path: <linux-gpio+bounces-3962-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2449086CA7D
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 14:41:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3931F227A3
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Feb 2024 13:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D5A86277;
	Thu, 29 Feb 2024 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7qqsNkv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17444B5DA
	for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709214077; cv=none; b=rI/GD1V+wl0Gv/2EcHaDmScEm4qeapE3RJS3AjExchsKe1vQ4QswIgmhJDgMede6Vu66MxJSIHugEQNpPNe3tUCNW7602jzCS0tzVMNfVivCotlA6D9MBt49Fr/AaN9TgRG68plg8qzHwWj3Wkb0dqA1H5tX4U0L0iZKNp3Fb2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709214077; c=relaxed/simple;
	bh=jcLKZbs/Zu5zER3Eia5mbXdz3hwiV7UiWd3xeKHKlGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmd2pbrDrWrwt8dVsp+fetc54oP2KMVerZpiXDzW/S4GeDmnRwtTcW+y4zXz+NEI1Kii06rlxLpibzpj2Pq7taQvdrLWb0z16nWx1obevGjQl3IXwjgv8JOAZdNO+Nhcy2RgZ8X9HfnPXA9gatUPeMUTSPJLWiiEIz6IX3tvBOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p7qqsNkv; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dccb1421bdeso1002632276.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Feb 2024 05:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709214075; x=1709818875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcLKZbs/Zu5zER3Eia5mbXdz3hwiV7UiWd3xeKHKlGE=;
        b=p7qqsNkvZHpe0Acca7BW264B+NGM6cSkipEoOcLeCAmKE2wGHAoY2r5QvC2f4P/DeX
         BI7W+TDtCjCvgk3rvB2FCj/AVebWGjpqdvIbY9gozU+Iraq8rXXR0gSiyWGbaerBBhhA
         eUuHp/26xTFB0Gei6JIRcHda+8rla8AIKifk0GSHJXZwt8C22xzgnhHN/ZV6W4qOaPMI
         E9lOpuw4s2oEgeKTcQ+K0iuu1r3ww5k1vgJEbyKgB64zX5BGQgtTGUvfVa71PgrtttDu
         LZ9hMtb5+1r+2fdmfRlloI4VRUJ6gkFOZeYERVHPrv8hWD2YgV2oFIKjuXjBeWLp9/4j
         eEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709214075; x=1709818875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcLKZbs/Zu5zER3Eia5mbXdz3hwiV7UiWd3xeKHKlGE=;
        b=Zfw/asoSgRAJGwm3TbN9DZtc6asmi3mm1yCp048do7rUNuHuwFeaZRwCB+TOSAnLbF
         1AojQvUeQ2PmTzBLe2F7eAlb5+gsDUUZhpc338YozH9H3ffiX0VI2wE6/uo37EH3o/Ba
         ktOa+OzEMw6qFXgUn7gCi7QZvLlO025sphPEt2i0qVPkOBgTo0K7Ay3m6O4MGpGqd1od
         oPwvNHUrgzsLNEyOddheo2wcwP/+pVqERXP6CFA9lS3LmyF+/2A2gFcGiQt3HDLwvLcf
         ZlwnaeIGX2eG1jIqmkLrFrVRJZxfbb8u5igu1wWQUEASO+RFStKB2DeY981PCKWGS6gW
         DzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOCtOihsQtAI9R+mhVVnkxvf7guiQi6RPR4EQ2yQCkiGQrplqtutwoaCBOpzfIjPgiJZpCQYhxYv2owuPfxewh+1zhDZClH0UOHQ==
X-Gm-Message-State: AOJu0Yzatnh3rLlb5VRs2hKQWKukHRFFOSlbGFpcWcedtCMrZjaeFIOJ
	4saRCNbnJeGzeW61lzAsxuCtamqbk5o+GBXx10awWBpdiZykXVG/CXp338hFwKAjFN9UkTTuSxU
	pEdrIwUJYjA+15kNv/IFwjWHWrM8gxchgD1nprw==
X-Google-Smtp-Source: AGHT+IEFluKafOIkQh7uIVwL3dhx6caOcBL2Ibez/sreRcv91OBaMnMo5ESm+hheZpBF3A5q8BHVqdEeRF/mItRX2mQ=
X-Received: by 2002:a25:a348:0:b0:dcd:1b8f:e6d3 with SMTP id
 d66-20020a25a348000000b00dcd1b8fe6d3mr2293406ybi.48.1709214075085; Thu, 29
 Feb 2024 05:41:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223171342.669133-1-varshini.rajendran@microchip.com> <20240223172531.671993-1-varshini.rajendran@microchip.com>
In-Reply-To: <20240223172531.671993-1-varshini.rajendran@microchip.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Feb 2024 14:41:04 +0100
Message-ID: <CACRpkdYcjX1UKwtZorEcw_1W+=0WGpjA=41BLAEN-apvwWqF-w@mail.gmail.com>
Subject: Re: [PATCH v4 09/39] dt-bindings: pinctrl: at91: add sam9x7
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 6:25=E2=80=AFPM Varshini Rajendran
<varshini.rajendran@microchip.com> wrote:

> Add device tree binding for SAM9X7 pin controller.
>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

This one patch applied to the pinctrl tree.

Yours,
Linus Walleij

