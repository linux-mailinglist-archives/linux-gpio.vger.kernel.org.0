Return-Path: <linux-gpio+bounces-25303-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5193EB3DD95
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 11:07:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01BC27AB7A5
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 09:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82806303CB0;
	Mon,  1 Sep 2025 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZXD93j7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3102FE577
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717635; cv=none; b=oZ7yCzEymzxo9vd1ETJLnkRG6tQX2r2jpDtUeqJ5/hu6xpLaydsR3Mxh/1LyGCwR8CFnBIRu+kDcSRyp92hLgl6TFPIGRmdi+aYtLDZZFSmsgNUtr0abyz21D8Hk9R0VsvuP/nt9gMKsTsBDYzU1WmNTK4pDEndEl+TOfhRvtzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717635; c=relaxed/simple;
	bh=BYbpwRfxkIjb+bHSo1qocRNTJG4SmSgocYaeZ1BFG78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/S35Tyut4kLZ5b/OqLGljKyMY91phWi2V/H1Heu0C+jYAtIAy9GMo36QxZx5vaD0oF+E2ZywFnvONYUVh/vuFlqhXbfYWZ6ZNVE7hdy0Uv0GSwFwjJ/+ApdEyLLKx2/i+dv7/ModGHFKqtyAY62M++AcjYt4237twJFWNKISc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZXD93j7; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2681511f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717632; x=1757322432; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSeDEP12iQOJYJsGLzrMtGuFvDlEKRfF+5OBXQLrxGg=;
        b=yZXD93j7PMqsjfWvfrvGKGB5PQdyKw7mI1CGeYWdTMsBfwxtfNWqgiZIVQfd6DvXLO
         sl+l5YPxkiCsEau1zqNgiujYfXbk2wPyW9K++ERDjYDDzm3eFl+c94kgCsKeGlObFS24
         tQPePT6MZZlaQDpbuHFxmnxXiGusNxdsM08fE8NVWWtiuyKIDCRHrTLqnEi50Zbb8dGa
         hzQ7f3Cxu1pTTfSeU8aJfeRicIuCUICqMi2gr455tV2A1jzaa4Arr1cSfsjWWVEqXd2d
         W9Zeq/Rxry3dGUEZJzSdMJCIEcQ5CdZwBWav/MOX1SucTuL+b5/pzfYe3DlMqsGmKgti
         QJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717632; x=1757322432;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSeDEP12iQOJYJsGLzrMtGuFvDlEKRfF+5OBXQLrxGg=;
        b=DXET3nbnZPEX65pVYCIySFV1LrzZQf8r6JYi/m9/sY0KeIiq4pKmCYObOj46RGHHaP
         ZUbC7nHGBsOnRMf6ivfDK0kBsBBG3eCmnwqQzPTLH6u+OvCTGFyAAzolJhunKoQcKdHN
         xUvg1v13yJicGfFdv4dh08ywwNqLl/om4VYR1/iUe6HFVQMd+XptU0I3CM4Att6CcD+h
         plTsre0JDs4k4GhRrbysydgATBa0uY0C0pBuouyPdJ3iYr6MIWxrB3za+NNR0uMQ3KqB
         W/ZDtPEzNhK/eEE5C7laNbTzPuxmQ7iwcZehrDz1dG5HxXE9VPgG5frkVjaC75C1qALV
         HNBw==
X-Gm-Message-State: AOJu0YzO5r+X8gKkIY3FqhHWyyqfn/bnRLoAGGYUCnrX5U9oWArvqJVz
	PeiVhTo4zrSgBHQlI4ktMVymhUGGcBucQ5GN2UYFdqK38yZHNt0rpxfg7Bn1lUsRNs4=
X-Gm-Gg: ASbGncsxmGNFeQI1tkfhvSjyTHU9Oo3jgU05nrAyYW/i6LEMSuDNTIZc0DgpFlktrhe
	b5Hz4q2r1FpUoDOrCyBVpz1TjFInIU+aL+To2iHEmq9BKxtludT9bjTXMtTdnBsJHBf79y6jyY7
	dyPK0LYskF6JGIW8YCC6KXZMeK9jFHnbhA0JmcS5UzXPVocq0D9hOnJJxoO9gfKoWPlFJSqiQqq
	E15ujJypgyoC0+bckKDc3drKPCNWKftHZCAvLc31zglQVnXI/EcPTVayBQ+nNY34m/Ph/24hKxO
	Okm5vJfphnLIFGONBHVr80lCGert/WOtduXZG+pXumck3hUDn3PZiA4M52x2phkLtQbPX6mquRO
	JZ51KnjFV/5skI40anfuwyTO69WOuXIhD3+B1sg==
X-Google-Smtp-Source: AGHT+IE9K85qMReGDcnsNIjhNVrxNW16G+pDv8YXtvIR7KnJ4FPDVcK8Od6tARcSbGjlSNvbkyLe1Q==
X-Received: by 2002:adf:b188:0:b0:3cd:44a8:ffcf with SMTP id ffacd0b85a97d-3d1dd81e4b7mr3749299f8f.12.1756717631732;
        Mon, 01 Sep 2025 02:07:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e8ab14esm156314555e9.21.2025.09.01.02.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 02:07:11 -0700 (PDT)
Date: Mon, 1 Sep 2025 12:07:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: luyulin@eswincomputing.com
Cc: linux-gpio@vger.kernel.org
Subject: Re: [bug report] pinctrl: eswin: Add EIC7700 pinctrl driver
Message-ID: <aLViO8IwbWqZLK-Z@stanley.mountain>
References: <aKRGiZ-fai0bv0tG@stanley.mountain>
 <2c953e90.a26.1990432fe57.Coremail.luyulin@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c953e90.a26.1990432fe57.Coremail.luyulin@eswincomputing.com>

On Mon, Sep 01, 2025 at 03:34:34PM +0800, luyulin@eswincomputing.com wrote:
> Hi, Dan
> 
> Thank you very much for your findings and suggestions.
> I would also like to confirm my understanding with you.
> 
> > 
> > Hello Yulin Lu,
> > 
> > Commit 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
> > from Jun 12, 2025 (linux-next), leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/pinctrl/pinctrl-eic7700.c:638 eic7700_pinctrl_probe()
> > 	warn: passing zero to 'PTR_ERR'
> > 
> > drivers/pinctrl/pinctrl-eic7700.c
> >     635 
> >     636         regulator = devm_regulator_get(dev, "vrgmii");
> >     637         if (IS_ERR_OR_NULL(regulator)) {
> > --> 638                 return dev_err_probe(dev, PTR_ERR(regulator),
> > 
> > devm_regulator_get() will return NULL if CONFIG_REGULATOR is disabled.
> > PTR_ERR(NULL) is success.
> > 
> >     639                                          "failed to get vrgmii regulator\n");
> >     640         }
> >     641 
> >     642         voltage = regulator_get_voltage(regulator);
> >     643         if (voltage < 0) {
> >     644                 return dev_err_probe(&pdev->dev, voltage,
> >     645                          "Failed to get voltage from regulator\n");
> > 
> > If CONFIG_REGULATOR is disabled then this will return negative.  So this
> > driver can't work without a regulator.  Ideally the KConfig would enforce
> > that so we don't build drivers which can't work.
> 
> Thank you! You are right. IS_ERR_OR_NULL should be changed to IS_ERR.
> Based on your professional advice, should I add "depends on REGULATOR" and
> "depends on REGULATOR_FIXED_VOLTAGE" in the Kconfig to enforce compilation dependencies?
> 

drivers/pinctrl/Kconfig
   209  config PINCTRL_EIC7700
   210          tristate "EIC7700 PINCTRL driver"
   211          depends on ARCH_ESWIN || COMPILE_TEST
                           ^^^^^^^^^^
ARCH_ESWIN doesn't exist so this driver can't actually be enabled.  I'm
not a Kconfig expert but I think that ARCH_ESWIN would normally have the
regulator stuff?

   212          select PINMUX
   213          select GENERIC_PINCONF
   214          help
   215            This driver support for the pin controller in ESWIN's EIC7700 SoC,
   216            which supports pin multiplexing, pin configuration,and rgmii voltage
   217            control.
   218            Say Y here to enable the eic7700 pinctrl driver

But, yes, the Kconfig should ensure that the driver has all the required
bits so we don't compile an unprobe-able (improbe-able?) driver.

regards,
dan carpenter


