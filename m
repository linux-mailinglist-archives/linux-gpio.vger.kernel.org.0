Return-Path: <linux-gpio+bounces-9842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3680396DA25
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 15:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACB5BB214D6
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 13:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0944219D09F;
	Thu,  5 Sep 2024 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMulNgST"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CC01990D8
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 13:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725542584; cv=none; b=qlrOgasZQzngVpoCXOvK7kd/z4bgn3eOkPRDMrvFFZPWA4iIfrVQjWB8gVVefq7t2zZdZPHFvRcDEWBLBZtqWl6l8fvDePu6mqE2yPkB0g7kjcejQ6WF3hzNOYmon2ZE1SnQfRh+e1QEAyvB0PAeOTk26y590lopgt/maW1S/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725542584; c=relaxed/simple;
	bh=kidWxzS9Q95Q5dbm7Dd7JdsGGV+Dkyu2kbgsrCl8iIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cme9TDDzRncVUCVo1tYxryWlM9U57HA/Ed/y/uf2mSpEqkw1Mjg4Ih+5yM09ykN3RwWTmRjOAooe6g1UYGSCB2zq+MEy96URkAR0eyfBROwBbg/iKVB/rb0QSZV2NGJtCctnZioK19/EDi/wG8E9H4iZuP05I/qR9ptSH1aOOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMulNgST; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5356bb5522bso1012237e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725542581; x=1726147381; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vgOzNn37XJnh9r05Bul3VVmu7PlnqW66dmTY+HEc/b0=;
        b=HMulNgSTSPhvxAw82bJ6ERuONzU2gTBC2gV1uuYVoECMLGDtJetnC2SWHiQbxrzKHp
         NmjI0kCvX9YxCwHv/ah+7/BEt0lr3qRQX18IhTAqaOGCyCzd/ESjvAr2zOOL3C2MGv8I
         u/3uOFr+wmasRiW7eybnx9U5rwyDbF0fhxu/rbPHYEqnhobEPC04RwB7huzKFDetCpyL
         wy7TFDXiKKlxs9yck721nXiS58SAM39phSBIpqRhCPsDkqMQKe4wOaO2zB9fmqGtedHb
         f/qpF0EyZSeX5GgR7ZSw2KTEDC1QzBdYBeErTlMDrxz30ztkhs3Z92z38OWrhGpw2HpS
         KWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725542581; x=1726147381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgOzNn37XJnh9r05Bul3VVmu7PlnqW66dmTY+HEc/b0=;
        b=gOBjgGNY4M0yyjd6XE+YE+5Nr6zeIP1arfZasq3n62ws/1DFp+HRsUc4l5PC5Hu8oN
         j4HRK1npi1Ab8u2hW8n2mBW10X8hDPFlDjehL1++NzJNemYgC+O9IrQl7SkjJUEG/Zwv
         qBfB+17myYp6azwrcUwtPltnNuJzNBQIeKaSBupMsuQiIZwOnClv103by0hr9eOb6O8o
         rqhbEqCyJRcxkh0tXRThb8/IBGYxGFuT+Nvj8dT1EcH2BsIxm1lN4hWoRf9ZMEQcec4s
         hwT2iBiJ720MN4FBRZBV5Ixg9I1aYVpNWcHWh60iRUcv3c63NOlRdPPzzcb309XQg+SJ
         pL9g==
X-Forwarded-Encrypted: i=1; AJvYcCU8SqjFEq/CIzP61zF1KonVTHnWuezp6TSVpM8jeBvLqJpp+5oUiwVlMVVDlz0sucp4A2rVarT9XFpK@vger.kernel.org
X-Gm-Message-State: AOJu0Yykr+xYB3KRY8Noo3EFtsuFh0lD8uuj8WJzALQwDjh2P1Kjs+mN
	lHTOhlt8Gvji1CpVGP6KgFNx8daHwSf38Yo3JUpEE0FaMKtA5O8a4aCD3BCACss=
X-Google-Smtp-Source: AGHT+IFQNXuLaQLGzDvCoIvfmxCmDxrL6iOajkCgUhh3bCEud0vFaRWrE+nDSh1i5VB6t3aa0vfOqg==
X-Received: by 2002:a05:6512:2c90:b0:535:698e:6e2e with SMTP id 2adb3069b0e04-535698e718dmr3322918e87.18.1725542579933;
        Thu, 05 Sep 2024 06:22:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535681cfa59sm434490e87.187.2024.09.05.06.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:22:59 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:22:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, herbert@gondor.apana.org.au, 
	davem@davemloft.net, sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de, 
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jassisinghbrar@gmail.com, 
	lee@kernel.org, linus.walleij@linaro.org, amitk@kernel.org, 
	thara.gopinath@gmail.com, broonie@kernel.org, cristian.marussi@arm.com, 
	rui.zhang@intel.com, lukasz.luba@arm.com, wim@linux-watchdog.org, linux@roeck-us.net, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel@quicinc.com, quic_psodagud@quicinc.com, 
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
Message-ID: <vk2jiq2rjgz7fdoq65qdhxdx37lbkoe4uq2c2fmu7aiu3c5pmn@l5skg7xvogun>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-1-quic_nkela@quicinc.com>
 <20240903220240.2594102-17-quic_nkela@quicinc.com>
 <66458a5c-5054-44ac-914f-e66281ee43a9@kernel.org>
 <9394ce8b-9a43-485b-8d7f-33930251ccac@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9394ce8b-9a43-485b-8d7f-33930251ccac@quicinc.com>

On Wed, Sep 04, 2024 at 05:49:40AM GMT, Nikunj Kela wrote:
> 
> On 9/4/2024 12:48 AM, Krzysztof Kozlowski wrote:
> > On 04/09/2024 00:02, Nikunj Kela wrote:
> >> Add compatible representing spi support on SA8255p.
> >>
> >> Clocks and interconnects are being configured in firmware VM
> >> on SA8255p platform, therefore making them optional.
> >>
> >> CC: Praveen Talari <quic_ptalari@quicinc.com>
> >> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Also this is incomplete - adding compatible without driver change is not
> > expected. It cannot even work.
> >
> > Best regards,
> > Krzysztof
> 
> Link for CLO branch is provided in I2C patch series. The driver changes
> will soon follow.

So, what's the point of posting the dt-bindings without corresponding
driver changes?

-- 
With best wishes
Dmitry

