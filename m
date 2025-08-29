Return-Path: <linux-gpio+bounces-25213-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14641B3C4E6
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Aug 2025 00:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 363E01C27F00
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 22:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F63F29E0F8;
	Fri, 29 Aug 2025 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mBNs5hfY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4AF2737F3
	for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 22:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756506799; cv=none; b=B5U2HJUNcU4C35UnMSNLk+DfvgIl85KhgP1YtNWqA6NY5Zk1i5CUseVn3f5ZMVHvWXMdx5zr9Py7VjKGFPVS74nwdEzdvJ6nSLI8BUFnd9yX1RenkyOP69iiL4agqI9sw4/bj/hUAbZHpKQh3j3m/tqwyK+SPr2vuN95M17x5VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756506799; c=relaxed/simple;
	bh=0wxY1cewY1ZvhfXpTsBk4/4b0JZP8Tsxj1w3A5Y71M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bhr1TxfrImU1Cqr2Rwpy0TTe62ISGzCX1d1wsQInPgzlhmjTVwoIHWYX5TgF3WsYoONJcOVBqTOM9pYdNIxW5Occ55MPU40If2z5cRnWzoSwTx8i0If+2GwXua5wzZh1salSUsdaXFYuNw2h/lFzk9nKmDJFzhb8UYUj2QFQCj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mBNs5hfY; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55ce508d4d6so2437483e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 Aug 2025 15:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756506795; x=1757111595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wxY1cewY1ZvhfXpTsBk4/4b0JZP8Tsxj1w3A5Y71M4=;
        b=mBNs5hfYK7pq+Kxceuu7QUq19RuooOofxBlQzeNFRYnDSccW5GOSZ0z0F0d0tcrBeD
         cLyaZdnVb3IBWK0dDSpKffWDKvbZ7MDKCllsx+/rRX+n8+qmeV1KW+lJ+9kEzL68UUBR
         BOXL6fqf3q2Pz68tGDvI2fRG0bSO0k/TeBPk2yp7IAo+PJlbeQrv+y0YSNtlWB2U0a8G
         hBKRvY4E2l4b8ruSGNFBogxRZLMpukNp+MR++UBDIOmlCto0Bhvr8M1j9Luy65iaLkOc
         jZstn58d/HaayudmBxnrxzm4vCjV0CnNZTvZ4tV/sa0cHp+pe843Xo0NzhGD7DVMRfp+
         5RJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756506795; x=1757111595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wxY1cewY1ZvhfXpTsBk4/4b0JZP8Tsxj1w3A5Y71M4=;
        b=FrOWTjhseFg22Php96u6Enf33YApk03F7PyO7rkZM98w05dNL1HaI5OaOtZyJwrNht
         2IGiD08WgwSialiQbI6wUM+7hLFkuRQ0iN+XNPwyl4NAQKDw0QqwTHSNSNfGXrrpyCi1
         CokxEkf/fENScrQOaK+CO2KkrT0U7nOa8kqUI1l1J1SwAFNkYCxRPlr2bEUPKZ4U3Pjb
         vu+Y+YfEVtnNNfF6LEtr4wMzuajNkhRIp+OnNKp881Mt+X1zhych7TD7xvk4YyonBFaE
         r363miuCK4r1Nofnz2dSXKbbhqeY7tJQuWDNrYCjGzmEu7wsXwNOqYMIwHwwVPEWzs9m
         qg7w==
X-Forwarded-Encrypted: i=1; AJvYcCXwZNIBMNdtLzJh+59ES2DfpkospPiQt+DW3st5hIPT08R1iPQuEpWHc1DzinEua/8FFmj/gMJYvqjw@vger.kernel.org
X-Gm-Message-State: AOJu0YwCl6ZL1AGO4pCAZSJGDZuVCUikNF+38041fLXPcUtntHbyu8E0
	IrU73Qcv2ivKY7urenS0KvJ6RltcSHEzCHkOBtGcT2bKRzvEqisC1XLEt0g8X5Mx6jyJvWFLIGB
	b5+PPjdq5UiNrUFDNjMRysfJ06snQfCrtlJc+RClvZQ==
X-Gm-Gg: ASbGncsYb5qlxWr8/P8QiWElzSS1vKEkEIfWskOmyI5TIphh/kifg/kZgDT1SJQXUpc
	7GRE+Zio0mNv3kufaysQAEPkkYSPdP+Jd669UJsIzlTDd4QcjiVDGV5zXfY3wON2buRsAlm5nHI
	slEkonuUXhSVcOzxAOV6Jb2Ytx6gl1DnUYV2D6aYrRfBZG99GKem7/mp953CSUy9I+QgIRkcVJ+
	lAT3w+pPNKa7Harbw==
X-Google-Smtp-Source: AGHT+IENJM3W17UfBxfWGD1X5J/SIfSe06hqmxkOMnpEu6fQZ9gf/LIwxzd5H/mcgzry4Ih0SpbYIZZoLdjS+5OjaVc=
X-Received: by 2002:ac2:4e0a:0:b0:55b:8aa7:4c1e with SMTP id
 2adb3069b0e04-55f709889famr48796e87.53.1756506795467; Fri, 29 Aug 2025
 15:33:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812203348.733749-1-robh@kernel.org>
In-Reply-To: <20250812203348.733749-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Aug 2025 00:33:04 +0200
X-Gm-Features: Ac12FXzWrFcRGoOx38Qv15P8o1KozyPxEQDiElCEqh5pWjzn0dOAl2Zk_kHqKx0
Message-ID: <CACRpkdb4TFRReKSNadeJKy29XC1qGGOO=H0G8WLZjB9D9FjTbQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert brcm,iproc-gpio to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 10:33=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Broadcom iProc/Cygnus GPIO/Pinconf binding to DT schema
> format.
>
> The child node structure is based on the example as there's not any
> actual .dts files with child nodes.
>
> The binding wasn't clear that "reg" can be 1 or 2 entries. The number of
> "reg" entries doesn't appear to be based on compatible, so no per
> compatible constraints for it
>
> The "brcm,iproc-stingray-gpio" could possibly be dropped. There are no
> .dts files using it, but the driver uses it.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij

