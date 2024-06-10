Return-Path: <linux-gpio+bounces-7330-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D4902875
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 20:13:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97AA6288F57
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2024 18:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73C314EC6D;
	Mon, 10 Jun 2024 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FBXCreDw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7AF1482F6
	for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718043158; cv=none; b=aGGQvHzKCtsL+DqVmUHI0lxdDXU1MnwBS67BpwQryQeKSQCNVnzjclJloz/RaCCV001Vq3SCA3+Gocfn/xRaBZqwsUznoxukLd4l8eO8PWHSWPVjLsgWqErGfCgh8RaxTQfzHpwTc8KJAda2BSZ3o6I4p5oLdGUWG/ATttnu6/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718043158; c=relaxed/simple;
	bh=TmYk8AQTt77I88b8Jz/JLqc7LmxM/K3bVUUXLSf/MFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzAW738MOb9K/yYy3y4u2hhdmNrmjSCV/UOv4CnHAl42PpjOsRUmAchDrTZCaJfGQ+/DwYe/zN5VpjkRaFNDHRO+eRisEFbueoM6cplFqTUVgZrcEj8+rNormfbNi/Mt8e9R3HQVUC3bks1prvkRde1nuVSPD8lVvKevVsmORcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FBXCreDw; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso10487161fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Jun 2024 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718043155; x=1718647955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1eyvHhcPEWgM5aVu/hiZDwHX5cRNXDZircOMLa2sfD8=;
        b=FBXCreDwKRje1BUo9+JZHZ4h2eZdb1N+LWmBD9aJ5BeG+IR11JSevZMHBPx6iCfofz
         EMSXDQtmBr/LI7Q/zYFMJ8XOwBomBMQVvNaf9OkVIUObHD0Mtej95R7ip8HePz5LXFo0
         NgOf8D0ZbWZtjVAOvfLiPaQWE82Q6uxvmYzkKzglZuthY3bDhXZMtL5Mj8igygbQTOeU
         XbLKQh+OuWHqG04eTSwlhjdZPhaNSxCQqQsERxudy74+L0EDgabacbD98GozqR2kCLjX
         teVRCizsbWgxgkHcQCh5pKlBeZC1gGS7dFBOi6vFZPHIifpUFZ/MWWdcaCG4+7hGk2Rc
         t67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043155; x=1718647955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eyvHhcPEWgM5aVu/hiZDwHX5cRNXDZircOMLa2sfD8=;
        b=hy5+guss5wzdUlrcNl3XiP9JCPhM6JJirktgrYAp/GtpBYhidwuiTVd+o3jmXCPjtg
         gTHQds40z/ikbfgV2VNpFOoR3vzpeP0J6MBjlyPx4eDnCVh6fyoASJW7kF4PEvtMyure
         bwTaBabxCWGdeFckGmGGRPnkU4OwFHd7Ka9bsjf/NkNP6ia+9VuyiZRqS10K/w2JLvle
         M5eM/5+mwKC4wduIACGBGLVn3b5D72+7pcQweTR39jC4Qf53z0Yk4eBILaQ5KC9fPayx
         lD8j/E2d/XcMiLSWlQLMICNSRRi42Ru3bXH5dAkvvn8n22egvfx7BKWx2uNo39ugORbF
         z4FA==
X-Forwarded-Encrypted: i=1; AJvYcCXmig4PwAk+J3DiOzzXDHaU+9VldBxydVi9zyhPh/++rZTjhug38caEX/0tShTq8gPieay14EOxIUQh9c+YgoO835lTVE1ROgD26Q==
X-Gm-Message-State: AOJu0Yz0CjvO9UkHW2ucozFnRXjwXRhfxW/yhnBXwMgPEeSOyWDurMWi
	CjALn0XIcaPk5z6Gl30zRBAqN2UPm7JdezdvZKJG3/h9IQrqAqwU+5ZLZbiBjHU=
X-Google-Smtp-Source: AGHT+IHptFF4qjzY9OneEo387ydgbKnCmTpXLrXWpOn78SwqX3YAdGo0qVjscWhklES7rFVJ6YV8jg==
X-Received: by 2002:a2e:9eca:0:b0:2eb:e634:fee6 with SMTP id 38308e7fff4ca-2ebe634ff29mr24562661fa.18.1718043155042;
        Mon, 10 Jun 2024 11:12:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ebdf286a1dsm9815661fa.65.2024.06.10.11.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:12:34 -0700 (PDT)
Date: Mon, 10 Jun 2024 21:12:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Das Srinagesh <quic_gurus@quicinc.com>, Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, 
	Stephen Boyd <swboyd@chromium.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 11/14] dt-bindings: mfd: pm8008: rework binding
Message-ID: <5ecytnzonh2m4p2zpw5ms6ljjvlo3zkasce6tnhmal2twlo4i3@trf3f53bwdxt>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-12-johan+linaro@kernel.org>
 <d5omeycp4l3mrzgswga2jkgxydpiayqfdjavwnfswcojawiqkt@zuol3vvkao5r>
 <ZmR6hPVZsYlyC5o5@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmR6hPVZsYlyC5o5@hovoldconsulting.com>

On Sat, Jun 08, 2024 at 05:36:36PM +0200, Johan Hovold wrote:
> On Wed, Jun 05, 2024 at 11:43:16AM +0300, Dmitry Baryshkov wrote:
> > On Wed, May 29, 2024 at 06:29:55PM +0200, Johan Hovold wrote:
> > > Rework the pm8008 binding by dropping internal details like register
> > > offsets and interrupts and by adding the missing regulator and
> > > temperature alarm properties.
> > > 
> > > Note that child nodes are still used for pinctrl and regulator
> > > configuration.
> > > 
> > > Also note that the pinctrl state definition will be extended later and
> > > could eventually also be shared with other PMICs (e.g. by breaking out
> > > bits of qcom,pmic-gpio.yaml).
> > 
> > Obviously we want to adapt this style of bindings for the other PMICs
> > too. My main concern here are PMICs which have two kinds of controlled
> > pins: GPIOs and MPPs. With the existing bindings style those are
> > declared as two subdevices. What would be your suggested way to support
> > MPPs with the proposed kind of bindings?
> 
> As far as I understand newer PMICs do not have MPP blocks and we do not
> necessarily want to convert the existing bindings.

Well, I definitely want to do so.

> That said, if there is ever a need to describe two separate gpio blocks
> this can, for example, be done using subnodes on those PMICs.

This creates an asymmetry between older and newer PMICs. Wouldn't it be
better to always use gpios subnode for GPIO pins? This way older PMICS
will use the same approach _plus_ mpps {} subnode instead of having
either nothing or two subnodes.

The same approach probably applies to some other subdevices: temp-alarm
vs adc-tm, etc.

-- 
With best wishes
Dmitry

