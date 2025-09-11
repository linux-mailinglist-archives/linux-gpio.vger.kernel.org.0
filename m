Return-Path: <linux-gpio+bounces-25978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A01B5396C
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 18:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB5C05A365E
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 16:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB81311C2E;
	Thu, 11 Sep 2025 16:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YdlVCj/l"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D580C35A2B9
	for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757608698; cv=none; b=QkXvBDkiq7xklinbciucxiN4/MkIML+kJJ2MuUzCTsttRQIEMOgq02UT+lhhXY5p/x5yCyT2ptcDJxu/BBuzTFLroUtN9ZacS0EwivZ21tqsI+sIU5yI1i5KNYML/3s6Mt1xtVW73WCBBOLZ+lEURqK+D5Rgyfksph8BlsmW5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757608698; c=relaxed/simple;
	bh=bex2+V7d3fY5yk+kOmpGFKebQ4zJwljGd3CvhqQ/V6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gO1FdGG5chFEu+dF1Y/tmmuRFN+M4upPTW3m/Cf1rIl+xbL0Ms6fWb39eqrHE9wbPIbNVSRHpgcOz9zPhlPF/EXwvT1ZarYPNLTlqTkZwAY6p3DsxXBkqhYN+V0fZ8QIsN2X+lhHFJwiHDBnCJWy9czDE3Nq3vburaeP0GRLuIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YdlVCj/l; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336cdca667aso7709531fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Sep 2025 09:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757608692; x=1758213492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bex2+V7d3fY5yk+kOmpGFKebQ4zJwljGd3CvhqQ/V6w=;
        b=YdlVCj/l3L51d6Gpto2HNFtGTHtCN+b83cKNrWnEIT4xQ8Q/3ZYfzejXpo9b/bwRiY
         tAdAEjJzQEj3EzNL+rU/HtyuIlfbwoKlqEWOIwUI33H5W/Kr6iQC2OsvgUZN+1hgDSHZ
         w0iwmytaG4LiPMKeMSZbsdKHUuPabzEUuCHxUa8IlRV6Gu3OUNNwAl57F6JVd/svKXZh
         Ch4PHQcIoBuhUysFNZE2um65xwig/za5KhNhPM5rFarHp6ZhaPz1r28NooWrNbx39gOX
         zI1WXs+drRDTJUVDoun4r/1BwZ4T9acqZo82Qj4Q6Kuv1AFtwKQKAYN2Rf8NH7dvHUBN
         oFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757608692; x=1758213492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bex2+V7d3fY5yk+kOmpGFKebQ4zJwljGd3CvhqQ/V6w=;
        b=tk1xWZ1tTf/M2ar9aaUBiG+V7fJc+j5wvC+8HXEX8ESzgQgjSx0WRMZLEci5MG4r4C
         quV/9OsMsdVIVCCiYW1tBOYzbxJ7QjasiIMmB8way68IcI/HoW8K/D8qqQyVO8XmdCsT
         CVnJTc2OHbE3yAF7NK6XHeZ0yQcDyVb2RUdllPu8jhiBiV37Sc4f/Q1DwhOSXHnAV2/x
         XQgNEHVMthG2WmDJlKesjpOuLhD3aU0ADyUrMaa8BQG3qhb1GguwRb1yVckZuLng56UJ
         pxTAzpbhAm1MqQO03LUR5Hg8eLH+3FYSSrIrC0md1AiNf/ZwisU9Xagrpud1OHfd2sYK
         d9Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV4wrk1v/tCuyfpDZmh6sfmluH+l1PaMRztqRRk4/f6i4eIQfpESSJ+MwSopjFZ9qKqXlD3Zcx7WWpp@vger.kernel.org
X-Gm-Message-State: AOJu0YyUu5mv4LjIy1iB6sM473KgW8bQoXr71vyOpbRVSGz64MGQeGpF
	aqAFXxe8skeIVKz2GRMCbRRirfZiDHLybBP4q4f+cTwdCxQ0VLFH/x9DeMusi2MD8zvTetHaifz
	Wzl8ucSZZku5twbi9o5h/kFWvP0qvzG+mm0mx4Pn1qg==
X-Gm-Gg: ASbGncscLu7Px+bTwRaVwLBUY/r75WkkmXYQGOuvwjekrCapKr6ovnLN1WdbsgGxmVD
	cJ7RNWZKMGQOYdSc8qoNC4NNVQKW52Ngga5l0fJii1DaEGcvyuieNtpPURe/FUi6435OgzhtvPX
	XFJPVg/kgyzl8tnL3bwheXBJ33+/r8uJzzLLfGjHBr4JXRdl6aOd/cbzcrrj9KYEfYcd0ORCUmy
	cq72Io=
X-Google-Smtp-Source: AGHT+IH5GDSID+SNmkZ+hBsqboCV6rCoacLulWcRRWpDCMeGBv1RsbWZSmbv+7M3X/ucDVSiUVTrG/nHZ4e4Zv2VBw4=
X-Received: by 2002:a05:651c:20ce:20b0:336:e1d6:8920 with SMTP id
 38308e7fff4ca-33b537e751dmr53150541fa.31.1757608691862; Thu, 11 Sep 2025
 09:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827024222.588082-1-gary.yang@cixtech.com>
 <20250827024222.588082-3-gary.yang@cixtech.com> <CACRpkdaX2VPAb+vihZ5BEAsGy+jNUdQ8q+3c3Q78uWmqZYeu=g@mail.gmail.com>
 <PUZPR06MB58879640C5849ABA55EF0C34EF0FA@PUZPR06MB5887.apcprd06.prod.outlook.com>
 <CACRpkdZzqRo9LRkF8=BSDANweWd0ccWtu5_nznDUn_FS6Fb0BQ@mail.gmail.com> <PUZPR06MB588739911F77623C32AEACCAEF09A@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB588739911F77623C32AEACCAEF09A@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 Sep 2025 18:37:59 +0200
X-Gm-Features: Ac12FXzHNnPAyVkfAfBXUIgdGtuNy2-qsTIWg_VXZwNkdVHi4GMCBwA0X_hlFmQ
Message-ID: <CACRpkdZwiCjej7yDi7w0OVTFA1jCjzzvRkDN00VU+94JAVL0MA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 3:58=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> Yes, I understand your thinking now. we also find some examples under arc=
h/arm64/boot/dts/*/*.h.
>
> for example: arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h and arch/arm6=
4/boot/dts/mediatek/mt8516-pinfunc.h
>
> We will take them as example, and create arch/arm64/boot/dts/cix/sky1-pin=
func.h. All right?

Yes go ahead with this!

Yours,
Linus Walleij

